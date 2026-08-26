// Queue and record commands for browser-driven engagement.
//
// These exist because the browser work is done by Claude in your own signed-in
// Chrome, not by a headless script — but the bookkeeping still needs to be
// durable across sessions. The same data/instagram-activity.json is used, so
// the two approaches share one history and neither double-likes a post.
//
//   npm run instagram:next -- --limit 25
//   npm run instagram:record        (reads JSON on stdin)
//
// A profile's newest post is only knowable by opening it, so the queue cannot
// pre-filter on post id. It orders by "least recently looked at" instead:
// never-visited profiles first, then oldest visit. That is what makes each
// session pick up where the last one stopped.

import "dotenv/config";
import path from "node:path";

import {
  loadActivity,
  markProfileSeen,
  recordPost,
  recordProfileAttempt,
  saveActivity,
} from "./activityStore";
import { fetchInstagramProfiles } from "./profileSource";
import { WorkerLogger } from "./workerLogger";
import type { ActivityHistory, InstagramProfile, PostResult } from "./types";

const ACTIVITY_PATH = path.resolve("data", "instagram-activity.json");
const LOG_PATH = path.resolve("logs", "instagram-worker.log");

const TERMINAL: ReadonlySet<PostResult> = new Set<PostResult>(["liked", "already_liked"]);

// --- next ------------------------------------------------------------------

type QueueEntry = {
  username: string;
  artist: string;
  profileUrl: string;
  lastSeenAt: string | null;
  knownPosts: number;
};

/** Never-visited profiles first, then least-recently-visited. */
function orderQueue(profiles: InstagramProfile[], history: ActivityHistory): QueueEntry[] {
  return profiles
    .map((profile) => {
      const entry = history[profile.username];
      return {
        username: profile.username,
        artist: profile.artistName,
        profileUrl: profile.profileUrl,
        lastSeenAt: entry?.last_seen_at ?? null,
        knownPosts: entry ? Object.keys(entry.posts).length : 0,
      } satisfies QueueEntry;
    })
    .sort((a, b) => {
      if (a.lastSeenAt === null && b.lastSeenAt === null) return a.artist.localeCompare(b.artist);
      if (a.lastSeenAt === null) return -1;
      if (b.lastSeenAt === null) return 1;
      return a.lastSeenAt.localeCompare(b.lastSeenAt);
    });
}

async function commandNext(argv: string[]): Promise<void> {
  const limit = readNumberFlag(argv, "--limit") ?? 25;
  const statuses = (readStringFlag(argv, "--status") ?? "published").split(",").map((s) => s.trim());
  const asJson = argv.includes("--json");

  const { history } = await loadActivity(ACTIVITY_PATH);
  const { profiles, rejected, duplicates } = await fetchInstagramProfiles({ statuses });
  const ordered = orderQueue(profiles, history).slice(0, limit);

  if (asJson) {
    console.log(JSON.stringify(ordered, null, 2));
    return;
  }

  const visited = profiles.filter((p) => history[p.username]?.last_seen_at).length;

  console.log(`${profiles.length} profile(s) in scope — ${visited} visited, ${profiles.length - visited} never opened.`);
  if (rejected.length > 0) console.log(`${rejected.length} unreadable handle(s) excluded.`);
  if (duplicates.length > 0) console.log(`${duplicates.length} duplicate handle(s) collapsed.`);
  console.log("");
  console.log(`Next ${ordered.length}:`);
  console.log("");

  for (const [index, entry] of ordered.entries()) {
    const seen = entry.lastSeenAt ? `last seen ${entry.lastSeenAt.slice(0, 10)}` : "never opened";
    console.log(
      `${String(index + 1).padStart(3)}. ${entry.username.padEnd(30)} ${entry.profileUrl}  (${seen}, ${entry.knownPosts} post(s) on record)`,
    );
  }
}

// --- record ----------------------------------------------------------------

type RecordInput = {
  username: string;
  result: PostResult;
  postId?: string;
  postUrl?: string;
  reason?: string;
};

function isRecordInput(value: unknown): value is RecordInput {
  if (typeof value !== "object" || value === null) return false;
  const candidate = value as Record<string, unknown>;
  return typeof candidate.username === "string" && typeof candidate.result === "string";
}

async function readStdin(): Promise<string> {
  const chunks: Buffer[] = [];
  for await (const chunk of process.stdin) chunks.push(Buffer.from(chunk));
  return Buffer.concat(chunks).toString("utf8");
}

async function commandRecord(): Promise<void> {
  const raw = (await readStdin()).trim();

  if (raw === "") {
    throw new Error("No JSON on stdin. Pipe one result object or an array of them.");
  }

  let parsed: unknown;
  try {
    parsed = JSON.parse(raw);
  } catch (error) {
    throw new Error(`stdin was not valid JSON: ${(error as Error).message}`);
  }

  const entries = (Array.isArray(parsed) ? parsed : [parsed]).filter(isRecordInput);

  if (entries.length === 0) {
    throw new Error("No usable entries. Each needs at least { username, result }.");
  }

  const { history } = await loadActivity(ACTIVITY_PATH);
  const logger = new WorkerLogger(LOG_PATH);
  const now = new Date().toISOString();

  for (const entry of entries) {
    const username = entry.username.toLowerCase();
    const profileUrl = `https://www.instagram.com/${username}/`;

    markProfileSeen(history, username, now);

    if (entry.postId) {
      const postUrl = entry.postUrl ?? `https://www.instagram.com/p/${entry.postId}/`;

      recordPost(history, username, entry.postId, {
        url: postUrl,
        result: entry.result,
        processed_at: now,
        ...(entry.reason ? { reason: entry.reason } : {}),
      });
    } else {
      recordProfileAttempt(history, username, {
        result: entry.result,
        at: now,
        ...(entry.reason ? { reason: entry.reason } : {}),
      });
    }

    await logger.log({
      username,
      profileUrl,
      postId: entry.postId,
      postUrl: entry.postUrl,
      action: "browser",
      result: entry.result,
      reason: entry.reason,
    });

    const marker = TERMINAL.has(entry.result) ? "recorded" : "recorded (will retry)";
    console.log(`${marker}: ${username}${entry.postId ? ` -> ${entry.postId}` : ""} = ${entry.result}`);
  }

  await saveActivity(ACTIVITY_PATH, history);
  console.log(`\n${entries.length} entr(ies) saved to ${ACTIVITY_PATH}`);
}

// --- status ----------------------------------------------------------------

async function commandStatus(argv: string[]): Promise<void> {
  const statuses = (readStringFlag(argv, "--status") ?? "published").split(",").map((s) => s.trim());
  const { history } = await loadActivity(ACTIVITY_PATH);
  const { profiles } = await fetchInstagramProfiles({ statuses });

  let visited = 0;
  let liked = 0;
  let alreadyLiked = 0;
  let unresolved = 0;

  for (const profile of profiles) {
    const entry = history[profile.username];
    if (!entry?.last_seen_at) continue;
    visited += 1;

    const results = Object.values(entry.posts).map((post) => post.result);
    if (results.includes("liked")) liked += 1;
    else if (results.includes("already_liked")) alreadyLiked += 1;
    else unresolved += 1;
  }

  console.log(`In scope:        ${profiles.length}`);
  console.log(`Visited:         ${visited}`);
  console.log(`Remaining:       ${profiles.length - visited}`);
  console.log(`Liked:           ${liked}`);
  console.log(`Already liked:   ${alreadyLiked}`);
  console.log(`No terminal post:${unresolved}`);
}

// --- helpers ---------------------------------------------------------------

function readStringFlag(argv: string[], flag: string): string | undefined {
  const index = argv.findIndex((arg) => arg === flag || arg.startsWith(`${flag}=`));
  if (index === -1) return undefined;

  const [, inline] = argv[index].split("=");
  return inline ?? argv[index + 1];
}

function readNumberFlag(argv: string[], flag: string): number | undefined {
  const value = readStringFlag(argv, flag);
  if (value === undefined) return undefined;

  const parsed = Number.parseInt(value, 10);
  if (Number.isNaN(parsed) || parsed <= 0) throw new Error(`${flag} expects a positive integer.`);
  return parsed;
}

async function main(): Promise<void> {
  const [command, ...argv] = process.argv.slice(2);

  if (command === "next") return commandNext(argv);
  if (command === "record") return commandRecord();
  if (command === "status") return commandStatus(argv);

  console.log(
    [
      "Usage:",
      "  npm run instagram:next   -- --limit 25 [--json]   Next profiles to open",
      "  npm run instagram:status                          Progress across the catalogue",
      "  npm run instagram:record                          Record results (JSON on stdin)",
      "",
      "Record input: { username, result, postId?, postUrl?, reason? }",
      "  result: liked | already_liked | skipped | failed",
    ].join("\n"),
  );
}

main().catch((error: unknown) => {
  console.error(`[FATAL] ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
});
