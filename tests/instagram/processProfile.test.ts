import assert from "node:assert/strict";
import test from "node:test";

import { isPostAlreadyProcessed, recordPost } from "../../scripts/instagram/activityStore";
import { processProfile } from "../../scripts/instagram/processProfile";
import {
  InstagramProfileError,
  type ActivityHistory,
  type InstagramDriver,
  type InstagramProfile,
  type LatestPost,
  type ProfileProblem,
} from "../../scripts/instagram/types";

const profile: InstagramProfile = {
  artistId: "00000000-0000-0000-0000-000000000001",
  artistName: "Alex Bueno",
  slug: "alex-bueno",
  username: "alexbueno_rd",
  profileUrl: "https://www.instagram.com/alexbueno_rd/",
};

const post = (id: string, pinned = false): LatestPost => ({
  id,
  url: `https://www.instagram.com/p/${id}/`,
  pinned,
});

/** Scriptable stand-in for the Playwright driver. */
class FakeDriver implements InstagramDriver {
  latest: LatestPost | null;
  liked: Set<string>;
  likeSucceeds = true;
  failOn: { step: "open" | "latest" | "liked" | "like"; problem: ProfileProblem } | null = null;
  likeCalls: string[] = [];

  constructor(latest: LatestPost | null, liked: string[] = []) {
    this.latest = latest;
    this.liked = new Set(liked);
  }

  private maybeFail(step: "open" | "latest" | "liked" | "like"): void {
    if (this.failOn?.step === step) throw new InstagramProfileError(this.failOn.problem);
  }

  async openProfile(): Promise<void> {
    this.maybeFail("open");
  }

  async findLatestPost(): Promise<LatestPost | null> {
    this.maybeFail("latest");
    return this.latest;
  }

  async isPostLiked(target: LatestPost): Promise<boolean> {
    this.maybeFail("liked");
    return this.liked.has(target.id);
  }

  async likePost(target: LatestPost): Promise<boolean> {
    this.maybeFail("like");
    this.likeCalls.push(target.id);
    if (this.likeSucceeds) this.liked.add(target.id);
    return this.likeSucceeds;
  }
}

const live = { dryRun: false };
const dry = { dryRun: true };

test("a new, unliked post is liked", async () => {
  const driver = new FakeDriver(post("ABC"));
  const outcome = await processProfile(driver, profile, {}, live);

  assert.equal(outcome.result, "liked");
  assert.equal(outcome.post?.id, "ABC");
  assert.deepEqual(driver.likeCalls, ["ABC"]);
});

test("a post that is already liked is recorded as already_liked and never clicked", async () => {
  const driver = new FakeDriver(post("ABC"), ["ABC"]);
  const outcome = await processProfile(driver, profile, {}, live);

  assert.equal(outcome.result, "already_liked");
  assert.deepEqual(driver.likeCalls, []);
});

test("a post already in the history is skipped without touching Instagram", async () => {
  const history: ActivityHistory = {};
  recordPost(history, profile.username, "ABC", {
    url: "https://www.instagram.com/p/ABC/",
    result: "liked",
    processed_at: "2026-08-25T04:30:00.000Z",
  });

  const driver = new FakeDriver(post("ABC"));
  const outcome = await processProfile(driver, profile, history, live);

  assert.equal(outcome.result, "skipped");
  assert.equal(outcome.previouslyProcessed, true);
  assert.deepEqual(driver.likeCalls, [], "an already-processed post must never be liked twice");
});

test("a profile becomes eligible again once it publishes a new post", async () => {
  const history: ActivityHistory = {};
  recordPost(history, profile.username, "ABC", {
    url: "https://www.instagram.com/p/ABC/",
    result: "liked",
    processed_at: "2026-08-25T04:30:00.000Z",
  });

  const driver = new FakeDriver(post("XYZ"));
  const outcome = await processProfile(driver, profile, history, live);

  assert.equal(outcome.result, "liked");
  assert.equal(outcome.post?.id, "XYZ");

  // The earlier post must survive in the history.
  recordPost(history, profile.username, "XYZ", {
    url: "https://www.instagram.com/p/XYZ/",
    result: "liked",
    processed_at: "2026-08-28T04:30:00.000Z",
  });
  assert.equal(isPostAlreadyProcessed(history, profile.username, "ABC"), true);
  assert.equal(isPostAlreadyProcessed(history, profile.username, "XYZ"), true);
});

test("dry run reports the intended like but never clicks", async () => {
  const driver = new FakeDriver(post("ABC"));
  const outcome = await processProfile(driver, profile, {}, dry);

  assert.equal(outcome.result, "skipped");
  assert.equal(outcome.wouldLike, true);
  assert.equal(outcome.post?.id, "ABC");
  assert.deepEqual(driver.likeCalls, [], "dry run must not like anything");
});

test("a profile with no posts is skipped", async () => {
  const driver = new FakeDriver(null);
  const outcome = await processProfile(driver, profile, {}, live);

  assert.equal(outcome.result, "skipped");
  assert.equal(outcome.post, undefined);
  assert.match(outcome.reason ?? "", /no usable post/);
});

test("an unconfirmed like is recorded as failed, never as liked", async () => {
  const driver = new FakeDriver(post("ABC"));
  driver.likeSucceeds = false;

  const outcome = await processProfile(driver, profile, {}, live);

  assert.equal(outcome.result, "failed");
  assert.match(outcome.reason ?? "", /confirmed liked state/);
});

test("a private profile fails gracefully and does not stop the run", async () => {
  const driver = new FakeDriver(null);
  driver.failOn = {
    step: "open",
    problem: { kind: "private", message: "Profile is private.", fatal: false },
  };

  const outcome = await processProfile(driver, profile, {}, live);

  assert.equal(outcome.result, "failed");
  assert.equal(outcome.fatal, false);
  assert.match(outcome.reason ?? "", /private/);
});

test("a login wall is fatal so the run stops instead of hammering Instagram", async () => {
  const driver = new FakeDriver(null);
  driver.failOn = {
    step: "open",
    problem: { kind: "login_required", message: "Login wall.", fatal: true },
  };

  const outcome = await processProfile(driver, profile, {}, live);

  assert.equal(outcome.result, "failed");
  assert.equal(outcome.fatal, true);
});

test("an unexpected thrown error is contained as a failed outcome", async () => {
  const driver: InstagramDriver = {
    openProfile: async () => {
      throw new Error("Timeout 20000ms exceeded");
    },
    findLatestPost: async () => null,
    isPostLiked: async () => false,
    likePost: async () => false,
  };

  const outcome = await processProfile(driver, profile, {}, live);

  assert.equal(outcome.result, "failed");
  assert.equal(outcome.fatal, false);
  assert.match(outcome.reason ?? "", /timeout/i);
});
