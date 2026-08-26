// Acknowledge a profile's known, expected unreadability.
//
//   npm run instagram:ack -- anderbock --note "follow request pending"
//   npm run instagram:ack -- --list
//   npm run instagram:ack -- anderbock --clear
//
// Some profiles will never be readable and that is fine: a private account
// whose follow request is outstanding, an artist who genuinely has no posts.
// Left alone they reappear in every digest, which buries the handful of
// entries that actually changed.
//
// Acknowledging silences ONE specific problem. If the profile later fails for
// a different reason, or starts returning posts, it surfaces again — this
// quiets steady state, it does not stop watching.

import "dotenv/config";
import path from "node:path";

import {
  acknowledgeProfile,
  clearAcknowledgement,
  loadActivity,
  saveActivity,
} from "./activityStore";
import type { ActivityHistory } from "./types";

const ACTIVITY_PATH = path.resolve("data", "instagram-activity.json");

function readFlag(argv: string[], flag: string): string | undefined {
  const index = argv.findIndex((arg) => arg === flag || arg.startsWith(`${flag}=`));
  if (index === -1) return undefined;

  const [, inline] = argv[index].split("=");
  return inline ?? argv[index + 1];
}

function list(history: ActivityHistory): void {
  const acked = Object.entries(history)
    .filter(([, entry]) => entry.acknowledged)
    .sort(([a], [b]) => a.localeCompare(b));

  if (acked.length === 0) {
    console.log("No acknowledged profiles.");
    return;
  }

  console.log(`${acked.length} acknowledged profile(s):\n`);

  for (const [username, entry] of acked) {
    const ack = entry.acknowledged;
    console.log(
      `  ${username.padEnd(26)} ${(ack?.kind ?? "").padEnd(15)} ` +
        `${ack?.note ?? "—"}  (since ${ack?.at.slice(0, 10)})`,
    );
  }
}

async function main(): Promise<void> {
  const argv = process.argv.slice(2);
  const { history } = await loadActivity(ACTIVITY_PATH);

  if (argv.includes("--list")) {
    list(history);
    return;
  }

  const username = argv.find((arg) => !arg.startsWith("--"))?.toLowerCase();

  if (!username) {
    console.log(
      [
        "Usage:",
        "  npm run instagram:ack -- <handle> [--note \"why\"]   Acknowledge its current problem",
        "  npm run instagram:ack -- <handle> --clear           Report it normally again",
        "  npm run instagram:ack -- --list                     Show acknowledged profiles",
        "",
        "A profile must have failed in a previous digest before it can be",
        "acknowledged — the acknowledgement records which problem it covers.",
      ].join("\n"),
    );
    return;
  }

  if (argv.includes("--clear")) {
    if (clearAcknowledgement(history, username)) {
      await saveActivity(ACTIVITY_PATH, history);
      console.log(`Cleared acknowledgement for ${username}; it will report normally again.`);
    } else {
      console.log(`${username} has no acknowledgement to clear.`);
    }
    return;
  }

  const entry = history[username];

  if (!entry) {
    console.error(`${username} is not in the activity history. Run a digest first.`);
    process.exitCode = 1;
    return;
  }

  const override = readFlag(argv, "--kind");

  if (!entry.last_problem && !override) {
    console.error(
      `${username} has no recorded problem to acknowledge — the last digest read it fine.\n` +
        `If you already know why it is unreadable, state it: --kind <kind> (e.g. private, no_posts).`,
    );
    process.exitCode = 1;
    return;
  }

  // An explicit kind lets a known state be silenced before a sweep has
  // recorded it — useful when the state is known from outside the tool.
  if (override) {
    entry.last_problem = {
      kind: override,
      message: `acknowledged directly as "${override}"`,
      at: new Date().toISOString(),
    };
  }

  const ack = acknowledgeProfile(history, username, readFlag(argv, "--note"), new Date().toISOString());

  if (!ack) {
    console.error(`Could not acknowledge ${username}.`);
    process.exitCode = 1;
    return;
  }

  await saveActivity(ACTIVITY_PATH, history);
  console.log(`Acknowledged ${username}: "${ack.kind}"${ack.note ? ` — ${ack.note}` : ""}`);
  console.log("It will drop to the digest's known-unreadable footer until that changes.");
}

main().catch((error: unknown) => {
  console.error(`[FATAL] ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
});
