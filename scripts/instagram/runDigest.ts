// Read-only "who posted something new" sweep.
//
//   npm run instagram:digest
//   npm run instagram:digest -- --limit 50
//
// Opens each artist's Instagram profile, reads the newest post from the grid,
// and reports which artists have published since the last digest. It never
// opens a post, never clicks anything, and never likes.
//
// The output is a Markdown report you read yourself, so the engagement stays a
// human action. The sweep also surfaces handles that no longer resolve, which
// is useful data quality signal for the artist records independent of any
// engagement.

import "dotenv/config";
import { mkdir, writeFile } from "node:fs/promises";
import path from "node:path";
import { pathToFileURL } from "node:url";

import {
  clearAcknowledgement,
  loadActivity,
  markProfileSeen,
  recordDigestObservation,
  recordProfileProblem,
  saveActivity,
} from "./activityStore";
import { classifyProfile, renderMarkdown, summarize, type DigestEntry } from "./digestReport";
import { isSignedIn, openBrowserSession, signInInstructions } from "./instagramBrowser";
import { PlaywrightInstagramDriver } from "./instagramPage";
import { fetchInstagramProfiles } from "./profileSource";
import { orderByLeastRecentlySeen } from "./runEngagementWorker";
import { WorkerLogger } from "./workerLogger";
import { InstagramProfileError, type ActivityHistory, type InstagramProfile } from "./types";

const ACTIVITY_PATH = path.resolve("data", "instagram-activity.json");
const LOG_PATH = path.resolve("logs", "instagram-digest.log");
const DIGEST_DIR = path.resolve("data", "digests");

type DigestOptions = {
  limit: number | null;
  statuses: string[];
  /** Pause between profiles. Reads are lighter than writes, so this is shorter. */
  delayMs: number;
  outPath?: string;
};

function parseArgs(argv: string[]): DigestOptions {
  const options: DigestOptions = { limit: null, statuses: ["published"], delayMs: 20_000 };

  for (let index = 0; index < argv.length; index += 1) {
    const arg = argv[index];
    const valueOf = (): string => {
      const [, inline] = arg.split("=");
      if (inline) return inline;
      index += 1;
      return argv[index] ?? "";
    };

    if (arg.startsWith("--limit")) {
      const parsed = Number.parseInt(valueOf(), 10);
      if (Number.isNaN(parsed) || parsed <= 0) throw new Error("--limit expects a positive integer.");
      options.limit = parsed;
    } else if (arg.startsWith("--status")) {
      options.statuses = valueOf()
        .split(",")
        .map((status) => status.trim())
        .filter(Boolean);
    } else if (arg.startsWith("--delay")) {
      const parsed = Number.parseInt(valueOf(), 10);
      if (Number.isNaN(parsed) || parsed < 0) throw new Error("--delay expects milliseconds.");
      options.delayMs = parsed;
    } else if (arg.startsWith("--out")) {
      options.outPath = valueOf();
    } else if (arg === "--help" || arg === "-h") {
      console.log(
        [
          "Instagram digest — read-only sweep, likes nothing",
          "",
          "  --limit <n>      Scan at most n profiles",
          "  --status <list>  Artist statuses to include (default: published)",
          "  --delay <ms>     Pause between profiles (default: 20000)",
          "  --out <path>     Write the report here instead of data/digests/",
        ].join("\n"),
      );
      process.exit(0);
    } else if (arg.startsWith("--")) {
      throw new Error(`Unknown option ${arg}.`);
    }
  }

  return options;
}

const sleep = (ms: number): Promise<void> =>
  new Promise((resolve) => {
    setTimeout(resolve, ms);
  });

export type DigestDependencies = {
  loadProfiles?: () => Promise<{ profiles: InstagramProfile[] }>;
  openDriver?: () => Promise<{
    driver: Pick<PlaywrightInstagramDriver, "openProfile" | "findLatestPost">;
    mode: string;
    close: () => Promise<void>;
  }>;
  activityPath?: string;
  logPath?: string;
};

export async function runDigest(
  options: DigestOptions,
  dependencies: DigestDependencies = {},
): Promise<DigestEntry[]> {
  const activityPath = dependencies.activityPath ?? ACTIVITY_PATH;
  const logger = new WorkerLogger(dependencies.logPath ?? LOG_PATH);

  const { history, recoveredFrom } = await loadActivity(activityPath);

  if (recoveredFrom) {
    console.warn(`[WARN] activity file was not valid JSON; moved to ${recoveredFrom}.`);
  }

  const loadProfiles =
    dependencies.loadProfiles ?? (() => fetchInstagramProfiles({ statuses: options.statuses }));

  const { profiles } = await loadProfiles();
  const ordered = orderByLeastRecentlySeen(profiles, history);
  const queue = options.limit ? ordered.slice(0, options.limit) : ordered;

  console.log(`Instagram digest — scanning ${queue.length} profile(s). Nothing will be liked.`);

  if (queue.length === 0) return [];

  const openDriver =
    dependencies.openDriver ??
    (async () => {
      const session = await openBrowserSession();

      // Unlike the liking worker, a digest does not require a session: the
      // profile grid is readable signed out, and reads made that way are not
      // attributed to your account at all. Signed-out browsing does get
      // login-walled sooner, which the sweep reports and stops on.
      if (!(await isSignedIn(session.context))) {
        console.warn(
          "[NOTE] Not signed in. The grid is still readable, and these reads are not\n" +
            "       tied to your account — but Instagram login-walls signed-out browsing\n" +
            "       sooner. If the sweep stops early, sign in and re-run:\n\n" +
            `${signInInstructions(session.mode, session.origin)}\n`,
        );
      }

      return {
        driver: new PlaywrightInstagramDriver(session.page),
        mode: session.mode,
        close: session.close,
      };
    });

  const session = await openDriver();
  console.log(`Browser session: ${session.mode}\n`);

  const entries: DigestEntry[] = [];
  let stopped = false;
  const requestStop = (): void => {
    stopped = true;
    console.log("\n[STOPPING] finishing the current profile.");
  };
  process.on("SIGINT", requestStop);

  try {
    for (const profile of queue) {
      if (stopped) break;

      const entry = await scanProfile(session.driver, profile, history);
      entries.push(entry);

      if (entry.status === "new_post") {
        console.log(`[NEW] ${profile.username} -> ${entry.post?.id}${entry.alreadyHandled ? " (already liked)" : ""}`);
      } else if (entry.status === "problem") {
        console.log(`[PROBLEM] ${profile.username} -> ${entry.problem}`);
      } else if (entry.status === "known") {
        console.log(`[KNOWN] ${profile.username} -> ${entry.problemKind}`);
      } else {
        console.log(`[SAME] ${profile.username}`);
      }

      await logger.log({
        username: profile.username,
        profileUrl: profile.profileUrl,
        postId: entry.post?.id,
        postUrl: entry.post?.url,
        action: "digest",
        result: entry.status === "problem" ? "failed" : "skipped",
        reason: entry.problem ?? entry.status,
      });

      // Persist after each profile so a stopped sweep keeps its progress.
      await saveActivity(activityPath, history);

      if (options.delayMs > 0) await sleep(options.delayMs);
    }
  } finally {
    process.off("SIGINT", requestStop);
    await session.close();
  }

  return entries;
}

/** One profile: open it, read the newest post, classify, update history. */
async function scanProfile(
  driver: Pick<PlaywrightInstagramDriver, "openProfile" | "findLatestPost">,
  profile: InstagramProfile,
  history: ActivityHistory,
): Promise<DigestEntry> {
  const now = new Date().toISOString();

  try {
    await driver.openProfile(profile.username);
    const post = await driver.findLatestPost();
    const entry = classifyProfile(profile, post, history);

    markProfileSeen(history, profile.username, now);

    if (post) {
      recordDigestObservation(history, profile.username, {
        post_id: post.id,
        url: post.url,
        at: now,
      });

      // Readable again: the acknowledgement no longer describes reality.
      if (entry.acknowledgementCleared) {
        clearAcknowledgement(history, profile.username);
      }
    } else if (entry.problemKind) {
      recordProfileProblem(history, profile.username, {
        kind: entry.problemKind,
        message: entry.problem ?? "",
        at: now,
      });
    }

    return entry;
  } catch (error) {
    markProfileSeen(history, profile.username, now);

    const kind = error instanceof InstagramProfileError ? error.problem.kind : "unexpected_state";
    const message =
      error instanceof InstagramProfileError
        ? `${error.problem.kind}: ${error.problem.message}`
        : (error as Error).message;

    recordProfileProblem(history, profile.username, { kind, message, at: now });

    // Route through the same classifier so an acknowledgement applies here too.
    return classifyProfile(profile, null, history, { kind, message });
  }
}

async function main(): Promise<void> {
  const options = parseArgs(process.argv.slice(2));
  const entries = await runDigest(options);

  if (entries.length === 0) {
    console.log("Nothing scanned.");
    return;
  }

  const generatedAt = new Date().toISOString();
  const summary = summarize(entries, generatedAt);
  const outPath =
    options.outPath ?? path.join(DIGEST_DIR, `instagram-digest-${generatedAt.slice(0, 10)}.md`);

  await mkdir(path.dirname(outPath), { recursive: true });
  await writeFile(outPath, `${renderMarkdown(summary)}\n`, "utf8");

  console.log("");
  console.log(`Scanned:        ${summary.scanned}`);
  console.log(`New posts:      ${summary.newPosts}`);
  console.log(`Unchanged:      ${summary.unchanged}`);
  console.log(`Need attention: ${summary.problems}`);
  if (summary.known > 0) console.log(`Known (silenced): ${summary.known}`);
  console.log("");
  console.log(`Report: ${outPath}`);
}

const invokedDirectly =
  process.argv[1] !== undefined && import.meta.url === pathToFileURL(process.argv[1]).href;

if (invokedDirectly) {
  main().catch((error: unknown) => {
    console.error(`[FATAL] ${error instanceof Error ? error.message : String(error)}`);
    process.exitCode = 1;
  });
}
