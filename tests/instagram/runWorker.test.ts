// End-to-end exercise of the real run loop (runWorker) against a scripted
// driver and real temp files. This is the test that proves the restartability
// requirement: run, re-run, publish a new post, re-run again.

import assert from "node:assert/strict";
import { mkdtemp, readFile } from "node:fs/promises";
import { existsSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import test from "node:test";

import { loadActivity } from "../../scripts/instagram/activityStore";
import { runWorker, type CliOptions, type Totals } from "../../scripts/instagram/runEngagementWorker";
import type { ActivityHistory, InstagramDriver, InstagramProfile, LatestPost } from "../../scripts/instagram/types";

const PROFILES: InstagramProfile[] = ["profile1", "profile2", "profile3"].map((username, index) => ({
  artistId: `00000000-0000-0000-0000-00000000000${index + 1}`,
  artistName: `Artist ${index + 1}`,
  slug: `artist-${index + 1}`,
  username,
  profileUrl: `https://www.instagram.com/${username}/`,
}));

/**
 * Fake Instagram: a mutable map of username -> newest post id, plus the set of
 * posts that are already liked. Records every like it receives.
 */
class FakeInstagram implements InstagramDriver {
  newest: Map<string, string>;
  liked = new Set<string>();
  likeCalls: string[] = [];
  private current = "";

  constructor(newest: Record<string, string>) {
    this.newest = new Map(Object.entries(newest));
  }

  async openProfile(username: string): Promise<void> {
    this.current = username;
  }

  async findLatestPost(): Promise<LatestPost | null> {
    const id = this.newest.get(this.current);
    return id ? { id, url: `https://www.instagram.com/p/${id}/`, pinned: false } : null;
  }

  async isPostLiked(post: LatestPost): Promise<boolean> {
    return this.liked.has(post.id);
  }

  async likePost(post: LatestPost): Promise<boolean> {
    this.likeCalls.push(post.id);
    this.liked.add(post.id);
    return true;
  }
}

const options = (overrides: Partial<CliOptions> = {}): CliOptions => ({
  limit: null,
  dryRun: false,
  statuses: ["published"],
  delayMs: 0,
  ...overrides,
});

async function scratchPaths(): Promise<{ activityPath: string; logPath: string }> {
  const dir = await mkdtemp(path.join(tmpdir(), "ig-worker-"));
  return {
    activityPath: path.join(dir, "data", "instagram-activity.json"),
    logPath: path.join(dir, "logs", "instagram-worker.log"),
  };
}

function deps(driver: InstagramDriver, paths: { activityPath: string; logPath: string }) {
  return {
    ...paths,
    loadProfiles: async () => ({ profiles: PROFILES, rejected: [], duplicates: [] }),
    openDriver: async () => ({ driver, mode: "fake", close: async () => {} }),
  };
}

test("first run likes every profile's newest post and writes the history file", async () => {
  const paths = await scratchPaths();
  const instagram = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });

  const totals = await runWorker(options(), deps(instagram, paths));

  assert.deepEqual(totals, { processed: 3, liked: 3, alreadyLiked: 0, skipped: 0, failed: 0 });
  assert.deepEqual(instagram.likeCalls, ["ABC", "DEF", "GHI"]);

  assert.ok(existsSync(paths.activityPath), "the activity file should be created automatically");

  const { history } = await loadActivity(paths.activityPath);
  assert.equal(history.profile1.posts.ABC.result, "liked");
  assert.equal(history.profile1.posts.ABC.url, "https://www.instagram.com/p/ABC/");
  assert.match(history.profile1.posts.ABC.processed_at, /^\d{4}-\d{2}-\d{2}T/);
});

test("re-running the same profiles skips the same posts and likes nothing twice", async () => {
  const paths = await scratchPaths();

  const first = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });
  await runWorker(options(), deps(first, paths));

  // Second run, same posts, a fresh driver that has forgotten the liked state.
  const second = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });
  const totals = await runWorker(options(), deps(second, paths));

  assert.deepEqual(totals, { processed: 3, liked: 0, alreadyLiked: 0, skipped: 3, failed: 0 });
  assert.deepEqual(second.likeCalls, [], "no post may be liked a second time");
});

test("a new post makes one profile eligible again while the others stay skipped", async () => {
  const paths = await scratchPaths();

  const first = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });
  await runWorker(options(), deps(first, paths));

  // Three days later: profile2 published something new.
  const later = new FakeInstagram({ profile1: "ABC", profile2: "XYZ", profile3: "GHI" });
  const totals = await runWorker(options(), deps(later, paths));

  assert.deepEqual(totals, { processed: 3, liked: 1, alreadyLiked: 0, skipped: 2, failed: 0 });
  assert.deepEqual(later.likeCalls, ["XYZ"]);

  const { history } = await loadActivity(paths.activityPath);
  assert.deepEqual(
    Object.keys(history.profile2.posts).sort(),
    ["DEF", "XYZ"],
    "the previous post must remain in the history",
  );
});

test("a dry run reports intentions and writes nothing to the history", async () => {
  const paths = await scratchPaths();
  const instagram = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });

  const totals = await runWorker(options({ dryRun: true }), deps(instagram, paths));

  assert.equal(totals.processed, 3);
  assert.equal(totals.skipped, 3);
  assert.deepEqual(instagram.likeCalls, [], "dry run must not like anything");
  assert.equal(
    existsSync(paths.activityPath),
    false,
    "dry run must not create or modify the activity file",
  );

  // A dry run still logs what it saw.
  const log = await readFile(paths.logPath, "utf8");
  assert.match(log, /result=dry_run/);
});

test("--limit processes only the requested number of profiles", async () => {
  const paths = await scratchPaths();
  const instagram = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });

  const totals = await runWorker(options({ limit: 2 }), deps(instagram, paths));

  assert.equal(totals.processed, 2);
  assert.deepEqual(instagram.likeCalls, ["ABC", "DEF"]);
});

test("history is saved after each profile, so a mid-run crash keeps earlier work", async () => {
  const paths = await scratchPaths();

  const instagram = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });
  const exploding: InstagramDriver = {
    openProfile: (username) => instagram.openProfile(username),
    findLatestPost: () => instagram.findLatestPost(),
    isPostLiked: (post) => instagram.isPostLiked(post),
    likePost: async (post) => {
      if (post.id === "DEF") throw new Error("browser exploded");
      return instagram.likePost(post);
    },
  };

  const totals = await runWorker(options(), deps(exploding, paths));

  // profile2 failed, but the run continued to profile3.
  assert.equal(totals.liked, 2);
  assert.equal(totals.failed, 1);

  const { history } = await loadActivity(paths.activityPath);
  assert.equal(history.profile1.posts.ABC.result, "liked");
  assert.equal(history.profile2.posts.DEF.result, "failed");
  assert.equal(history.profile3.posts.GHI.result, "liked");
});

test("a failed post is retried on the next run", async () => {
  const paths = await scratchPaths();

  const flaky = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });
  const failingOnce: InstagramDriver = {
    openProfile: (username) => flaky.openProfile(username),
    findLatestPost: () => flaky.findLatestPost(),
    isPostLiked: (post) => flaky.isPostLiked(post),
    likePost: async (post) => (post.id === "ABC" ? false : flaky.likePost(post)),
  };

  await runWorker(options(), deps(failingOnce, paths));

  const afterFailure = (await loadActivity(paths.activityPath)).history;
  assert.equal(afterFailure.profile1.posts.ABC.result, "failed");

  // Next run: the same post is attempted again rather than skipped.
  const healthy = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });
  const totals = await runWorker(options(), deps(healthy, paths));

  assert.deepEqual(healthy.likeCalls, ["ABC"]);
  assert.equal(totals.liked, 1);

  const recovered = (await loadActivity(paths.activityPath)).history;
  assert.equal(recovered.profile1.posts.ABC.result, "liked");
});

test("a fatal login wall stops the run instead of marching through every profile", async () => {
  const paths = await scratchPaths();

  const blocked: InstagramDriver = {
    openProfile: async () => {
      const { InstagramProfileError } = await import("../../scripts/instagram/types");
      throw new InstagramProfileError({
        kind: "login_required",
        message: "Instagram is showing a login wall.",
        fatal: true,
      });
    },
    findLatestPost: async () => null,
    isPostLiked: async () => false,
    likePost: async () => false,
  };

  const totals = await runWorker(options(), deps(blocked, paths));

  assert.equal(totals.processed, 1, "the run should abort after the first fatal profile");
  assert.equal(totals.failed, 1);

  const log = await readFile(paths.logPath, "utf8");
  assert.match(log, /run aborted/);
});

test("the run log records timestamp, username, profile, post and result", async () => {
  const paths = await scratchPaths();
  const instagram = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });

  await runWorker(options({ limit: 1 }), deps(instagram, paths));

  const log = await readFile(paths.logPath, "utf8");
  const line = log.split("\n").find((entry) => entry.includes("username=profile1"));

  assert.ok(line, "expected a log line for profile1");
  assert.match(line, /^\d{4}-\d{2}-\d{2}T[\d:.]+Z /);
  assert.match(line, /profile=https:\/\/www\.instagram\.com\/profile1\//);
  assert.match(line, /post=ABC/);
  assert.match(line, /post_url=https:\/\/www\.instagram\.com\/p\/ABC\//);
  assert.match(line, /action=like/);
  assert.match(line, /result=liked/);
});

test("a corrupt history file is quarantined and the run still completes", async () => {
  const paths = await scratchPaths();
  const { mkdir, writeFile } = await import("node:fs/promises");

  await mkdir(path.dirname(paths.activityPath), { recursive: true });
  await writeFile(paths.activityPath, "{ not json at all", "utf8");

  const instagram = new FakeInstagram({ profile1: "ABC", profile2: "DEF", profile3: "GHI" });
  const totals = await runWorker(options({ limit: 1 }), deps(instagram, paths));

  assert.equal(totals.liked, 1);

  const { history } = await loadActivity(paths.activityPath);
  assert.equal((history as ActivityHistory).profile1.posts.ABC.result, "liked");
});

test("consecutive bounded runs advance through the catalogue instead of restarting", async () => {
  const paths = await scratchPaths();

  // Six profiles, two per run.
  const many: InstagramProfile[] = ["a1", "b2", "c3", "d4", "e5", "f6"].map((username, index) => ({
    artistId: `id-${index}`,
    artistName: `Artist ${username}`,
    slug: username,
    username,
    profileUrl: `https://www.instagram.com/${username}/`,
  }));

  const newest = Object.fromEntries(many.map((p) => [p.username, p.username.toUpperCase()]));

  const runBatch = async (): Promise<string[]> => {
    const instagram = new FakeInstagram(newest);
    await runWorker(options({ limit: 2 }), {
      ...paths,
      loadProfiles: async () => ({ profiles: many, rejected: [], duplicates: [] }),
      openDriver: async () => ({ driver: instagram, mode: "fake", close: async () => {} }),
    });
    return instagram.likeCalls;
  };

  const first = await runBatch();
  const second = await runBatch();
  const third = await runBatch();

  assert.deepEqual(first, ["A1", "B2"]);
  assert.deepEqual(second, ["C3", "D4"], "second run must move on, not re-check a1/b2");
  assert.deepEqual(third, ["E5", "F6"], "third run must reach the tail of the catalogue");

  // Three bounded runs covered all six profiles exactly once.
  const { history } = await loadActivity(paths.activityPath);
  assert.deepEqual(Object.keys(history).sort(), ["a1", "b2", "c3", "d4", "e5", "f6"]);
  for (const profile of many) {
    assert.ok(history[profile.username].last_seen_at, `${profile.username} should be stamped`);
  }
});

test("a fourth run wraps around and re-checks the oldest, liking nothing new", async () => {
  const paths = await scratchPaths();
  const two: InstagramProfile[] = ["x1", "y2"].map((username, index) => ({
    artistId: `id-${index}`,
    artistName: `Artist ${username}`,
    slug: username,
    username,
    profileUrl: `https://www.instagram.com/${username}/`,
  }));
  const newest = { x1: "X1POST", y2: "Y2POST" };

  const runBatch = async (): Promise<Totals> => {
    const instagram = new FakeInstagram(newest);
    return runWorker(options({ limit: 1 }), {
      ...paths,
      loadProfiles: async () => ({ profiles: two, rejected: [], duplicates: [] }),
      openDriver: async () => ({ driver: instagram, mode: "fake", close: async () => {} }),
    });
  };

  assert.equal((await runBatch()).liked, 1);
  assert.equal((await runBatch()).liked, 1);
  // Both are now done; the next run wraps to the oldest and finds nothing new.
  assert.equal((await runBatch()).skipped, 1);
});
