import assert from "node:assert/strict";
import { mkdtemp } from "node:fs/promises";
import { tmpdir } from "node:os";
import path from "node:path";
import test from "node:test";

import {
  acknowledgeProfile,
  clearAcknowledgement,
  loadActivity,
  recordProfileProblem,
  saveActivity,
} from "../../scripts/instagram/activityStore";
import { classifyProfile, renderMarkdown, summarize } from "../../scripts/instagram/digestReport";
import { runDigest } from "../../scripts/instagram/runDigest";
import {
  InstagramProfileError,
  type ActivityHistory,
  type InstagramProfile,
  type LatestPost,
} from "../../scripts/instagram/types";

const profile = (username: string): InstagramProfile => ({
  artistId: `id-${username}`,
  artistName: `Artist ${username}`,
  slug: username,
  username,
  profileUrl: `https://www.instagram.com/${username}/`,
});

const post = (id: string): LatestPost => ({
  id,
  url: `https://www.instagram.com/p/${id}/`,
  pinned: false,
});

const NOW = "2026-08-25T10:00:00.000Z";

function withProblem(username: string, kind: string, note?: string): ActivityHistory {
  const history: ActivityHistory = {};
  recordProfileProblem(history, username, { kind, message: `${kind} message`, at: NOW });
  acknowledgeProfile(history, username, note, NOW);
  return history;
}

// --- storage ---------------------------------------------------------------

test("a profile cannot be acknowledged before it has failed", () => {
  const history: ActivityHistory = { a: { posts: {} } };
  assert.equal(acknowledgeProfile(history, "a", "note", NOW), null);
  assert.equal(history.a.acknowledged, undefined);
});

test("acknowledging captures the specific problem kind", () => {
  const history = withProblem("a", "private", "follow request pending");
  assert.equal(history.a.acknowledged?.kind, "private");
  assert.equal(history.a.acknowledged?.note, "follow request pending");
});

test("acknowledgements survive a save/load round trip", async () => {
  const dir = await mkdtemp(path.join(tmpdir(), "ig-ack-"));
  const filePath = path.join(dir, "activity.json");

  await saveActivity(filePath, withProblem("a", "no_posts", "artist posts nothing"));
  const { history } = await loadActivity(filePath);

  assert.equal(history.a.acknowledged?.kind, "no_posts");
  assert.equal(history.a.acknowledged?.note, "artist posts nothing");
  assert.equal(history.a.last_problem?.kind, "no_posts");
});

test("clearing removes the acknowledgement", () => {
  const history = withProblem("a", "private");
  assert.equal(clearAcknowledgement(history, "a"), true);
  assert.equal(history.a.acknowledged, undefined);
  assert.equal(clearAcknowledgement(history, "a"), false, "clearing twice is a no-op");
});

// --- classification --------------------------------------------------------

test("an acknowledged problem is reported as known, not as a problem", () => {
  const history = withProblem("a", "private", "follow request pending");
  const entry = classifyProfile(profile("a"), null, history, {
    kind: "private",
    message: "Profile is private.",
  });

  assert.equal(entry.status, "known");
  assert.equal(entry.acknowledgedNote, "follow request pending");
});

test("a DIFFERENT problem still reports, because the state changed", () => {
  const history = withProblem("a", "private", "follow request pending");
  const entry = classifyProfile(profile("a"), null, history, {
    kind: "unavailable",
    message: "Profile is unavailable or has been deleted.",
  });

  assert.equal(entry.status, "problem", "a deleted account must not be silenced by a private ack");
  assert.equal(entry.problemKind, "unavailable");
});

test("an unacknowledged profile reports as a problem", () => {
  const history: ActivityHistory = {};
  const entry = classifyProfile(profile("a"), null, history, {
    kind: "private",
    message: "Profile is private.",
  });
  assert.equal(entry.status, "problem");
});

test("an acknowledged profile that becomes readable is flagged for clearing", () => {
  const history = withProblem("a", "no_posts", "artist posts nothing");
  const entry = classifyProfile(profile("a"), post("NEW1"), history);

  assert.equal(entry.status, "new_post");
  assert.equal(entry.acknowledgementCleared, true);
});

// --- rendering -------------------------------------------------------------

test("known profiles collapse into a footer, out of the attention table", () => {
  const history = withProblem("quiet", "private", "follow request pending");
  const entries = [
    classifyProfile(profile("quiet"), null, history, { kind: "private", message: "Private." }),
    classifyProfile(profile("loud"), null, {}, { kind: "unavailable", message: "Gone." }),
  ];

  const markdown = renderMarkdown(summarize(entries, NOW));

  assert.match(markdown, /Known unreadable \(acknowledged\): 1/);
  assert.match(markdown, /<details>/);
  assert.match(markdown, /Known unreadable — 1 acknowledged/);
  assert.match(markdown, /follow request pending/);

  // The acknowledged one must not be in the attention table. Bound the slice
  // at the known-unreadable footer, which legitimately does mention it.
  const start = markdown.indexOf("## Profiles needing attention");
  const attention = markdown.slice(start, markdown.indexOf("<details>", start));

  assert.ok(attention.length > 0, "expected an attention section before the footer");
  assert.match(attention, /Artist loud/);
  assert.equal(
    attention.includes("Artist quiet"),
    false,
    "an acknowledged profile must not appear in the attention table",
  );
});

test("a recovered profile is called out prominently", () => {
  const history = withProblem("back", "no_posts");
  const entries = [classifyProfile(profile("back"), post("P1"), history)];

  const markdown = renderMarkdown(summarize(entries, NOW));
  assert.match(markdown, /## Readable again/);
  assert.match(markdown, /Artist back/);
});

// --- end to end ------------------------------------------------------------

class Fake {
  constructor(
    private readonly newest: Record<string, string | null>,
    private readonly fails: Record<string, string> = {},
  ) {}
  private current = "";

  async openProfile(username: string): Promise<void> {
    this.current = username;
    const kind = this.fails[username];
    if (kind) {
      throw new InstagramProfileError({ kind: kind as never, message: `${kind} here`, fatal: false });
    }
  }

  async findLatestPost(): Promise<LatestPost | null> {
    const id = this.newest[this.current];
    return id ? post(id) : null;
  }
}

async function scratch(): Promise<{ activityPath: string; logPath: string }> {
  const dir = await mkdtemp(path.join(tmpdir(), "ig-ackrun-"));
  return {
    activityPath: path.join(dir, "activity.json"),
    logPath: path.join(dir, "digest.log"),
  };
}

const PROFILES = [profile("alpha"), profile("beta")];
const opts = { limit: null, statuses: ["published"], delayMs: 0 };

function deps(driver: Fake, paths: { activityPath: string; logPath: string }) {
  return {
    ...paths,
    loadProfiles: async () => ({ profiles: PROFILES }),
    openDriver: async () => ({ driver, mode: "fake", close: async () => {} }),
  };
}

test("acknowledging silences a profile across real digest runs", async () => {
  const paths = await scratch();

  // First sweep: beta is private and reported as a problem.
  const first = await runDigest(opts, deps(new Fake({ alpha: "A1" }, { beta: "private" }), paths));
  assert.equal(first.find((e) => e.username === "beta")?.status, "problem");

  // Acknowledge it.
  const { history } = await loadActivity(paths.activityPath);
  assert.equal(history.beta.last_problem?.kind, "private", "the problem must be recorded");
  acknowledgeProfile(history, "beta", "follow request pending", NOW);
  await saveActivity(paths.activityPath, history);

  // Second sweep: same problem, now silenced.
  const second = await runDigest(opts, deps(new Fake({ alpha: "A1" }, { beta: "private" }), paths));
  assert.equal(second.find((e) => e.username === "beta")?.status, "known");
});

test("an acknowledged profile that starts posting resurfaces and is un-acknowledged", async () => {
  const paths = await scratch();

  await runDigest(opts, deps(new Fake({ alpha: "A1" }, { beta: "no_posts" }), paths));
  const { history } = await loadActivity(paths.activityPath);
  acknowledgeProfile(history, "beta", "no posts", NOW);
  await saveActivity(paths.activityPath, history);

  // beta finally posts something.
  const entries = await runDigest(opts, deps(new Fake({ alpha: "A1", beta: "B1" }), paths));
  const beta = entries.find((e) => e.username === "beta");

  assert.equal(beta?.status, "new_post");
  assert.equal(beta?.acknowledgementCleared, true);

  const after = (await loadActivity(paths.activityPath)).history;
  assert.equal(after.beta.acknowledged, undefined, "the stale acknowledgement must be removed");
});

test("an acknowledged profile failing a NEW way resurfaces as a problem", async () => {
  const paths = await scratch();

  await runDigest(opts, deps(new Fake({ alpha: "A1" }, { beta: "private" }), paths));
  const { history } = await loadActivity(paths.activityPath);
  acknowledgeProfile(history, "beta", "follow request pending", NOW);
  await saveActivity(paths.activityPath, history);

  // The account is now deleted — a different problem entirely.
  const entries = await runDigest(opts, deps(new Fake({ alpha: "A1" }, { beta: "unavailable" }), paths));
  const beta = entries.find((e) => e.username === "beta");

  assert.equal(beta?.status, "problem", "a deleted account must not stay silenced");
  assert.equal(beta?.problemKind, "unavailable");
});
