// Persistent, human-readable activity history for the Instagram worker.
//
// Design notes:
//  * Keyed profile -> post -> outcome, never profile -> date, so a profile
//    becomes eligible again the moment it publishes a new post.
//  * Only terminal outcomes (`liked`, `already_liked`) suppress reprocessing.
//    A `failed` post is retried on the next run, which is the whole point of
//    recording the failure rather than swallowing it.
//  * Writes go through a temp file + rename so an interrupted run cannot
//    truncate the history.
//  * Never holds credentials, cookies or tokens — only public post URLs.

import { randomBytes } from "node:crypto";
import { existsSync } from "node:fs";
import { mkdir, readFile, rename, writeFile } from "node:fs/promises";
import path from "node:path";

import type {
  Acknowledgement,
  ActivityHistory,
  DigestObservation,
  ProfileProblemRecord,
  PostRecord,
  PostResult,
  ProfileAttempt,
} from "./types";

/** Results that mean "this post is done; never touch it again". */
const TERMINAL_RESULTS: ReadonlySet<PostResult> = new Set<PostResult>(["liked", "already_liked"]);

export type LoadResult = {
  history: ActivityHistory;
  /** Set when an unreadable file was quarantined and a fresh history started. */
  recoveredFrom?: string;
};

function isPlainObject(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null && !Array.isArray(value);
}

/**
 * Coerces parsed JSON into a valid history, dropping anything malformed.
 * A single corrupt profile entry must not cost us the other 400.
 */
export function normalizeHistory(raw: unknown): ActivityHistory {
  if (!isPlainObject(raw)) return {};

  const history: ActivityHistory = {};

  for (const [username, profile] of Object.entries(raw)) {
    if (!isPlainObject(profile)) continue;

    const posts: Record<string, PostRecord> = {};
    const rawPosts = profile.posts;

    if (isPlainObject(rawPosts)) {
      for (const [postId, record] of Object.entries(rawPosts)) {
        if (!isPlainObject(record)) continue;
        if (typeof record.url !== "string" || typeof record.result !== "string") continue;

        posts[postId] = {
          url: record.url,
          result: record.result as PostResult,
          processed_at:
            typeof record.processed_at === "string" ? record.processed_at : new Date(0).toISOString(),
          ...(typeof record.reason === "string" ? { reason: record.reason } : {}),
        };
      }
    }

    const entry: ActivityHistory[string] = { posts };

    if (typeof profile.last_seen_at === "string") {
      entry.last_seen_at = profile.last_seen_at;
    }

    const problem = profile.last_problem;

    if (
      isPlainObject(problem) &&
      typeof problem.kind === "string" &&
      typeof problem.message === "string"
    ) {
      entry.last_problem = {
        kind: problem.kind,
        message: problem.message,
        at: typeof problem.at === "string" ? problem.at : new Date(0).toISOString(),
      };
    }

    const ack = profile.acknowledged;

    if (isPlainObject(ack) && typeof ack.kind === "string") {
      entry.acknowledged = {
        kind: ack.kind,
        at: typeof ack.at === "string" ? ack.at : new Date(0).toISOString(),
        ...(typeof ack.note === "string" ? { note: ack.note } : {}),
      };
    }

    const digest = profile.last_digest;

    if (
      isPlainObject(digest) &&
      typeof digest.post_id === "string" &&
      typeof digest.url === "string"
    ) {
      entry.last_digest = {
        post_id: digest.post_id,
        url: digest.url,
        at: typeof digest.at === "string" ? digest.at : new Date(0).toISOString(),
      };
    }

    const attempt = profile.last_attempt;

    if (isPlainObject(attempt) && typeof attempt.result === "string") {
      entry.last_attempt = {
        result: attempt.result as PostResult,
        at: typeof attempt.at === "string" ? attempt.at : new Date(0).toISOString(),
        ...(typeof attempt.reason === "string" ? { reason: attempt.reason } : {}),
      } satisfies ProfileAttempt;
    }

    history[username.toLowerCase()] = entry;
  }

  return history;
}

/**
 * Loads the history file. A missing file yields an empty history; an
 * unreadable one is renamed aside so the run can continue rather than crash.
 */
export async function loadActivity(filePath: string): Promise<LoadResult> {
  if (!existsSync(filePath)) return { history: {} };

  let contents: string;
  try {
    contents = await readFile(filePath, "utf8");
  } catch (error) {
    throw new Error(`Cannot read activity file ${filePath}: ${(error as Error).message}`);
  }

  if (contents.trim() === "") return { history: {} };

  try {
    return { history: normalizeHistory(JSON.parse(contents) as unknown) };
  } catch {
    const quarantine = `${filePath}.corrupt-${new Date().toISOString().replace(/[:.]/g, "-")}`;
    await rename(filePath, quarantine);
    return { history: {}, recoveredFrom: quarantine };
  }
}

/** Writes the history atomically: temp file in the same directory, then rename. */
export async function saveActivity(filePath: string, history: ActivityHistory): Promise<void> {
  await mkdir(path.dirname(filePath), { recursive: true });

  const tempPath = `${filePath}.${randomBytes(6).toString("hex")}.tmp`;
  const serialized = `${JSON.stringify(sortHistory(history), null, 2)}\n`;

  await writeFile(tempPath, serialized, "utf8");
  await rename(tempPath, filePath);
}

/** Stable key order keeps diffs of the history file readable. */
function sortHistory(history: ActivityHistory): ActivityHistory {
  const sorted: ActivityHistory = {};

  for (const username of Object.keys(history).sort()) {
    const entry = history[username];
    const posts: Record<string, PostRecord> = {};

    for (const postId of Object.keys(entry.posts).sort()) {
      posts[postId] = entry.posts[postId];
    }

    sorted[username] = {
      posts,
      ...(entry.last_attempt ? { last_attempt: entry.last_attempt } : {}),
      ...(entry.last_seen_at ? { last_seen_at: entry.last_seen_at } : {}),
      ...(entry.last_digest ? { last_digest: entry.last_digest } : {}),
      ...(entry.last_problem ? { last_problem: entry.last_problem } : {}),
      ...(entry.acknowledged ? { acknowledged: entry.acknowledged } : {}),
    };
  }

  return sorted;
}

/**
 * True when this exact post already reached a terminal outcome. Failures and
 * profile-level skips deliberately return false so they are retried.
 */
export function isPostAlreadyProcessed(
  history: ActivityHistory,
  username: string,
  postId: string,
): boolean {
  const record = history[username.toLowerCase()]?.posts[postId];
  return record !== undefined && TERMINAL_RESULTS.has(record.result);
}

export function getPostRecord(
  history: ActivityHistory,
  username: string,
  postId: string,
): PostRecord | undefined {
  return history[username.toLowerCase()]?.posts[postId];
}

/** Records (or updates) one post's outcome. Mutates and returns `history`. */
export function recordPost(
  history: ActivityHistory,
  username: string,
  postId: string,
  record: PostRecord,
): ActivityHistory {
  const key = username.toLowerCase();
  const entry = (history[key] ??= { posts: {} });
  entry.posts[postId] = record;
  return history;
}

/** Records an outcome for a profile that never produced a usable post. */
export function recordProfileAttempt(
  history: ActivityHistory,
  username: string,
  attempt: ProfileAttempt,
): ActivityHistory {
  const key = username.toLowerCase();
  const entry = (history[key] ??= { posts: {} });
  entry.last_attempt = attempt;
  return history;
}

/** Stamps the profile as looked at, whatever the outcome of the visit. */
export function markProfileSeen(
  history: ActivityHistory,
  username: string,
  at: string,
): ActivityHistory {
  const key = username.toLowerCase();
  const entry = (history[key] ??= { posts: {} });
  entry.last_seen_at = at;
  return history;
}

/** Records the newest post a digest sweep observed for a profile. */
export function recordDigestObservation(
  history: ActivityHistory,
  username: string,
  observation: DigestObservation,
): ActivityHistory {
  const key = username.toLowerCase();
  const entry = (history[key] ??= { posts: {} });
  entry.last_digest = observation;
  return history;
}

/** Records why a sweep could not read a profile. */
export function recordProfileProblem(
  history: ActivityHistory,
  username: string,
  problem: ProfileProblemRecord,
): ActivityHistory {
  const key = username.toLowerCase();
  const entry = (history[key] ??= { posts: {} });
  entry.last_problem = problem;
  return history;
}

/**
 * Marks a profile's current problem as known and expected.
 * Returns the acknowledgement, or null when there is nothing to acknowledge.
 */
export function acknowledgeProfile(
  history: ActivityHistory,
  username: string,
  note: string | undefined,
  at: string,
): Acknowledgement | null {
  const key = username.toLowerCase();
  const entry = history[key];

  if (!entry?.last_problem) return null;

  const ack: Acknowledgement = {
    kind: entry.last_problem.kind,
    at,
    ...(note ? { note } : {}),
  };

  entry.acknowledged = ack;
  return ack;
}

/** Removes an acknowledgement so the profile reports normally again. */
export function clearAcknowledgement(history: ActivityHistory, username: string): boolean {
  const entry = history[username.toLowerCase()];
  if (!entry?.acknowledged) return false;

  delete entry.acknowledged;
  return true;
}
