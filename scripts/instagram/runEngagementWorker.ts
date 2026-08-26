// Instagram engagement worker.
//
//   npm run instagram:worker
//   npm run instagram:worker -- --limit 5
//   npm run instagram:worker -- --dry-run --limit 5
//
// Processes artist Instagram profiles from the existing database one at a
// time, likes the newest post when it has not been handled before, and keeps
// a per-post history in data/instagram-activity.json so repeat runs are safe.

import "dotenv/config";
import path from "node:path";
import { pathToFileURL } from "node:url";

import {
  loadActivity,
  markProfileSeen,
  recordPost,
  recordProfileAttempt,
  saveActivity,
} from "./activityStore";
import { isSignedIn, openBrowserSession, signInInstructions } from "./instagramBrowser";
import { PlaywrightInstagramDriver } from "./instagramPage";
import { processProfile, type ProfileOutcome } from "./processProfile";
import { fetchInstagramProfiles } from "./profileSource";
import { WorkerLogger, console_ } from "./workerLogger";
import type { ActivityHistory, InstagramDriver, InstagramProfile } from "./types";

export const ACTIVITY_PATH = path.resolve("data", "instagram-activity.json");
export const LOG_PATH = path.resolve("logs", "instagram-worker.log");

export type CliOptions = {
  limit: number | null;
  dryRun: boolean;
  statuses: string[];
  startAt?: string;
  /** Pause between profiles, in milliseconds. */
  delayMs: number;
};

export function parseArgs(argv: string[]): CliOptions {
  const options: CliOptions = {
    limit: null,
    dryRun: false,
    statuses: ["published"],
    // Three minutes between profiles. This is plain rate limiting, not an
    // attempt to imitate human timing: one profile per interval, evenly.
    delayMs: 180_000,
  };

  for (let index = 0; index < argv.length; index += 1) {
    const arg = argv[index];
    const valueOf = (): string => {
      const [, inline] = arg.split("=");
      if (inline) return inline;
      index += 1;
      return argv[index] ?? "";
    };

    if (arg === "--dry-run") {
      options.dryRun = true;
    } else if (arg.startsWith("--limit")) {
      const parsed = Number.parseInt(valueOf(), 10);
      if (Number.isNaN(parsed) || parsed <= 0) {
        throw new Error("--limit expects a positive integer.");
      }
      options.limit = parsed;
    } else if (arg.startsWith("--status")) {
      options.statuses = valueOf()
        .split(",")
        .map((status) => status.trim())
        .filter(Boolean);
    } else if (arg.startsWith("--start-at")) {
      options.startAt = valueOf();
    } else if (arg.startsWith("--delay")) {
      const parsed = Number.parseInt(valueOf(), 10);
      if (Number.isNaN(parsed) || parsed < 0) {
        throw new Error("--delay expects a non-negative integer (milliseconds).");
      }
      options.delayMs = parsed;
    } else if (arg === "--help" || arg === "-h") {
      printUsage();
      process.exit(0);
    } else if (arg.startsWith("--")) {
      throw new Error(`Unknown option ${arg}. Run with --help for usage.`);
    }
  }

  return options;
}

function printUsage(): void {
  console.log(
    [
      "Instagram engagement worker",
      "",
      "  --limit <n>        Process at most n profiles",
      "  --dry-run          Report what would happen; never click Like, never record",
      "  --status <list>    Artist statuses to include (default: published)",
      "  --start-at <name>  Resume from a handle or artist name",
      "  --delay <ms>       Pause between profiles (default: 180000, i.e. 3 min)",
      "",
      "Session: set IG_CDP_ENDPOINT to attach to a running Chrome, otherwise a",
      "dedicated Chrome profile is used (sign in to Instagram there once).",
    ].join("\n"),
  );
}

const sleep = (ms: number): Promise<void> =>
  new Promise((resolve) => {
    setTimeout(resolve, ms);
  });

export type Totals = {
  processed: number;
  liked: number;
  alreadyLiked: number;
  skipped: number;
  failed: number;
};

/** Reports an outcome to the console, the run log and the activity history. */
async function recordOutcome(
  outcome: ProfileOutcome,
  history: ActivityHistory,
  logger: WorkerLogger,
  totals: Totals,
  dryRun: boolean,
): Promise<void> {
  const { profile, post, result, reason } = outcome;
  const now = new Date().toISOString();

  totals.processed += 1;

  if (result === "liked") totals.liked += 1;
  else if (result === "already_liked") totals.alreadyLiked += 1;
  else if (result === "skipped") totals.skipped += 1;
  else totals.failed += 1;

  // Console
  if (outcome.wouldLike && post) {
    console_.wouldLike(profile.username, post.id);
  } else if (result === "liked") {
    console_.liked(profile.username);
  } else if (result === "already_liked") {
    console_.alreadyLiked(profile.username);
  } else if (result === "skipped") {
    console_.skipped(profile.username, reason ?? "no action needed");
  } else {
    console_.failed(profile.username, reason ?? "unknown error");
  }

  // Run log
  await logger.log({
    username: profile.username,
    profileUrl: profile.profileUrl,
    postId: post?.id,
    postUrl: post?.url,
    action: dryRun ? "inspect" : result === "liked" ? "like" : "check",
    result: dryRun ? "dry_run" : result,
    reason,
  });

  // A dry run must not mark anything as processed.
  if (dryRun) return;

  // Stamp the visit regardless of outcome, so the round-robin advances even
  // when a profile fails or has nothing new.
  markProfileSeen(history, profile.username, now);

  if (post && result !== "skipped") {
    recordPost(history, profile.username, post.id, {
      url: post.url,
      result,
      processed_at: now,
      ...(reason ? { reason } : {}),
    });
  } else if (!post) {
    recordProfileAttempt(history, profile.username, {
      result,
      at: now,
      ...(reason ? { reason } : {}),
    });
  }
}

/**
 * Never-visited profiles first, then least-recently-visited. Keeps successive
 * bounded runs moving through the catalogue instead of restarting at "A".
 */
export function orderByLeastRecentlySeen(
  profiles: InstagramProfile[],
  history: ActivityHistory,
): InstagramProfile[] {
  return [...profiles].sort((a, b) => {
    const seenA = history[a.username]?.last_seen_at ?? null;
    const seenB = history[b.username]?.last_seen_at ?? null;

    if (seenA === null && seenB === null) return a.artistName.localeCompare(b.artistName);
    if (seenA === null) return -1;
    if (seenB === null) return 1;
    return seenA.localeCompare(seenB);
  });
}

export type RunWorkerDependencies = {
  /** Supplies the profile queue. Defaults to the database. */
  loadProfiles?: () => Promise<{
    profiles: InstagramProfile[];
    rejected: Array<{ slug: string; rawValue: string; reason: string }>;
    duplicates: string[];
  }>;
  /** Opens the browser surface. Defaults to a real Playwright session. */
  openDriver?: () => Promise<{ driver: InstagramDriver; mode: string; close: () => Promise<void> }>;
  activityPath?: string;
  logPath?: string;
};

/**
 * The whole run: load history, queue profiles, process them one at a time,
 * persist after each. Dependencies are injectable so the loop can be
 * exercised end-to-end without touching Instagram.
 */
export async function runWorker(
  options: CliOptions,
  dependencies: RunWorkerDependencies = {},
): Promise<Totals> {
  const activityPath = dependencies.activityPath ?? ACTIVITY_PATH;
  const logger = new WorkerLogger(dependencies.logPath ?? LOG_PATH);

  const { history, recoveredFrom } = await loadActivity(activityPath);

  if (recoveredFrom) {
    console.warn(
      `[WARN] ${activityPath} was not valid JSON. It was moved to ${recoveredFrom} and a fresh history started.`,
    );
    await logger.note(`activity file quarantined to ${recoveredFrom}`);
  }

  const loadProfiles =
    dependencies.loadProfiles ??
    (() =>
      fetchInstagramProfiles({
        statuses: options.statuses,
        startAt: options.startAt,
      }));

  const { profiles, rejected, duplicates } = await loadProfiles();

  // Round-robin, not alphabetical. A profile's newest post is only knowable by
  // opening it, so the queue cannot pre-filter; ordering by "least recently
  // looked at" is what stops a bounded run from spending its whole batch
  // re-checking the same leading profiles it already finished last time.
  const queue = (options.limit ? orderByLeastRecentlySeen(profiles, history) : profiles).slice(
    0,
    options.limit ?? profiles.length,
  );

  console.log(
    `Instagram engagement worker — ${queue.length} profile(s) queued` +
      `${options.dryRun ? " (dry run: nothing will be liked or recorded)" : ""}`,
  );

  if (rejected.length > 0) {
    console.log(`[NOTE] ${rejected.length} artist(s) have an unreadable Instagram value; skipping.`);
    for (const entry of rejected) {
      await logger.log({
        username: entry.slug,
        profileUrl: "-",
        action: "resolve-handle",
        result: "skipped",
        reason: `${entry.reason}: ${entry.rawValue}`,
      });
    }
  }

  if (duplicates.length > 0) {
    console.log(`[NOTE] ${duplicates.length} duplicate handle(s) collapsed: ${duplicates.join(", ")}`);
  }

  const totals: Totals = { processed: 0, liked: 0, alreadyLiked: 0, skipped: 0, failed: 0 };

  if (queue.length === 0) {
    console.log("Nothing to do.");
    return totals;
  }

  await logger.note(
    `run start mode=${options.dryRun ? "dry-run" : "live"} queued=${queue.length} statuses=${options.statuses.join("|")}`,
  );

  const openDriver =
    dependencies.openDriver ??
    (async () => {
      const session = await openBrowserSession();

      // Check the session once, up front. Without this a signed-out run would
      // fail on all 400-odd profiles in turn and tell you nothing useful.
      if (!(await isSignedIn(session.context))) {
        const guidance = signInInstructions(session.mode, session.origin);
        await session.close();
        throw new Error(`Not signed in to Instagram.\n\n${guidance}`);
      }

      return {
        driver: new PlaywrightInstagramDriver(session.page) as InstagramDriver,
        mode: session.mode,
        close: session.close,
      };
    });

  const session = await openDriver();
  const driver = session.driver;
  console.log(`Browser session: ${session.mode}`);

  let stopped = false;
  const requestStop = (): void => {
    if (!stopped) {
      stopped = true;
      console.log("\n[STOPPING] finishing the current profile, history is already saved.");
    }
  };
  process.on("SIGINT", requestStop);

  try {
    for (const profile of queue) {
      if (stopped) break;

      console_.processing(profile.username);

      const outcome = await processProfile(driver, profile, history, { dryRun: options.dryRun });

      if (outcome.post && !outcome.previouslyProcessed) {
        console_.newPost(profile.username, outcome.post.id);
      }

      await recordOutcome(outcome, history, logger, totals, options.dryRun);

      // Persist after every profile so a crash costs at most one profile.
      if (!options.dryRun) {
        await saveActivity(activityPath, history);
      }

      if (outcome.fatal) {
        console.error(`\n[ABORTED] ${outcome.reason}`);
        await logger.note(`run aborted: ${outcome.reason}`);
        break;
      }

      if (options.delayMs > 0) await sleep(options.delayMs);
    }
  } finally {
    process.off("SIGINT", requestStop);
    await session.close();
  }

  console.log("");
  console.log(`Processed:     ${totals.processed}`);
  console.log(`Liked:         ${totals.liked}`);
  console.log(`Already liked: ${totals.alreadyLiked}`);
  console.log(`Skipped:       ${totals.skipped}`);
  console.log(`Failed:        ${totals.failed}`);

  await logger.note(
    `run end processed=${totals.processed} liked=${totals.liked} already_liked=${totals.alreadyLiked} skipped=${totals.skipped} failed=${totals.failed}`,
  );

  return totals;
}

async function main(): Promise<void> {
  await runWorker(parseArgs(process.argv.slice(2)));
}

// Run only when invoked directly, so tests can import runWorker().
const invokedDirectly =
  process.argv[1] !== undefined &&
  import.meta.url === pathToFileURL(process.argv[1]).href;

if (invokedDirectly) {
  main().catch((error: unknown) => {
    console.error(`[FATAL] ${error instanceof Error ? error.message : String(error)}`);
    process.exitCode = 1;
  });
}
