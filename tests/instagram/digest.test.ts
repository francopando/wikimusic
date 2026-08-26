import assert from "node:assert/strict";
import { mkdtemp, readFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import path from "node:path";
import test from "node:test";

import { loadActivity, recordPost } from "../../scripts/instagram/activityStore";
import {
  classifyProfile,
  renderMarkdown,
  summarize,
  type DigestEntry,
} from "../../scripts/instagram/digestReport";
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

const post = (id: string, pinned = false): LatestPost => ({
  id,
  url: `https://www.instagram.com/p/${id}/`,
  pinned,
});

// --- classification --------------------------------------------------------

test("a profile never seen by a digest reports its newest post as new", () => {
  const entry = classifyProfile(profile("a"), post("ABC"), {});
  assert.equal(entry.status, "new_post");
  assert.equal(entry.alreadyHandled, false);
});

test("the same post is unchanged on the next digest", () => {
  const history: ActivityHistory = {
    a: { posts: {}, last_digest: { post_id: "ABC", url: "u", at: "t" } },
  };
  assert.equal(classifyProfile(profile("a"), post("ABC"), history).status, "unchanged");
});

test("a newer post makes the profile report again", () => {
  const history: ActivityHistory = {
    a: { posts: {}, last_digest: { post_id: "ABC", url: "u", at: "t" } },
  };
  const entry = classifyProfile(profile("a"), post("XYZ"), history);
  assert.equal(entry.status, "new_post");
  assert.equal(entry.post?.id, "XYZ");
});

test("a post the worker already liked is reported but flagged as handled", () => {
  const history: ActivityHistory = {};
  recordPost(history, "a", "ABC", {
    url: "https://www.instagram.com/p/ABC/",
    result: "liked",
    processed_at: "t",
  });

  const entry = classifyProfile(profile("a"), post("ABC"), history);
  assert.equal(entry.status, "new_post", "first digest to see it should still surface it");
  assert.equal(entry.alreadyHandled, true);
});

test("a profile with no readable post becomes a problem entry", () => {
  const entry = classifyProfile(profile("a"), null, {});
  assert.equal(entry.status, "problem");
  assert.match(entry.problem ?? "", /no usable post/);
});

// --- report rendering ------------------------------------------------------

test("the markdown report lists new posts and problems separately", () => {
  const entries: DigestEntry[] = [
    { ...classifyProfile(profile("zeta"), post("ZZZ"), {}) },
    { ...classifyProfile(profile("alpha"), post("AAA"), {}) },
    { ...classifyProfile(profile("broken"), null, {}) },
  ];

  const markdown = renderMarkdown(summarize(entries, "2026-08-25T10:00:00.000Z"));

  assert.match(markdown, /# Instagram digest — 2026-08-25/);
  assert.match(markdown, /Artists with a new post: \*\*2\*\*/);
  assert.match(markdown, /Profiles needing attention: \*\*1\*\*/);
  assert.match(markdown, /## New posts/);
  assert.match(markdown, /## Profiles needing attention/);
  assert.match(markdown, /nothing was liked/i);

  // Alphabetical within the new-posts table.
  assert.ok(
    markdown.indexOf("Artist alpha") < markdown.indexOf("Artist zeta"),
    "new posts should be sorted by artist name",
  );
});

test("an empty sweep renders a clear nothing-new report", () => {
  const entries: DigestEntry[] = [
    classifyProfile(profile("a"), post("ABC"), {
      a: { posts: {}, last_digest: { post_id: "ABC", url: "u", at: "t" } },
    }),
  ];

  const markdown = renderMarkdown(summarize(entries, "2026-08-25T10:00:00.000Z"));
  assert.match(markdown, /Nothing new since the last digest/);
});

// --- end to end ------------------------------------------------------------

class ReadOnlyFake {
  newest: Map<string, string>;
  opened: string[] = [];
  private current = "";
  failOn: string | null = null;

  constructor(newest: Record<string, string>) {
    this.newest = new Map(Object.entries(newest));
  }

  async openProfile(username: string): Promise<void> {
    this.current = username;
    this.opened.push(username);

    if (this.failOn === username) {
      throw new InstagramProfileError({
        kind: "private",
        message: "Profile is private.",
        fatal: false,
      });
    }
  }

  async findLatestPost(): Promise<LatestPost | null> {
    const id = this.newest.get(this.current);
    return id ? post(id) : null;
  }
}

async function scratch(): Promise<{ activityPath: string; logPath: string }> {
  const dir = await mkdtemp(path.join(tmpdir(), "ig-digest-"));
  return {
    activityPath: path.join(dir, "data", "instagram-activity.json"),
    logPath: path.join(dir, "logs", "digest.log"),
  };
}

const PROFILES = [profile("one"), profile("two"), profile("three")];

function deps(driver: ReadOnlyFake, paths: { activityPath: string; logPath: string }) {
  return {
    ...paths,
    loadProfiles: async () => ({ profiles: PROFILES }),
    openDriver: async () => ({ driver, mode: "fake", close: async () => {} }),
  };
}

const opts = (over: Partial<{ limit: number | null; delayMs: number }> = {}) => ({
  limit: null,
  statuses: ["published"],
  delayMs: 0,
  ...over,
});

test("a first sweep reports every profile as new and never opens a post", async () => {
  const paths = await scratch();
  const fake = new ReadOnlyFake({ one: "P1", two: "P2", three: "P3" });

  const entries = await runDigest(opts(), deps(fake, paths));

  assert.equal(entries.length, 3);
  assert.equal(entries.every((entry) => entry.status === "new_post"), true);
  assert.deepEqual(fake.opened.sort(), ["one", "three", "two"]);
});

test("a second sweep with no new posts reports everything unchanged", async () => {
  const paths = await scratch();

  await runDigest(opts(), deps(new ReadOnlyFake({ one: "P1", two: "P2", three: "P3" }), paths));
  const entries = await runDigest(
    opts(),
    deps(new ReadOnlyFake({ one: "P1", two: "P2", three: "P3" }), paths),
  );

  assert.equal(entries.every((entry) => entry.status === "unchanged"), true);
});

test("only the profile that posted is reported on the next sweep", async () => {
  const paths = await scratch();

  await runDigest(opts(), deps(new ReadOnlyFake({ one: "P1", two: "P2", three: "P3" }), paths));
  const entries = await runDigest(
    opts(),
    deps(new ReadOnlyFake({ one: "P1", two: "NEW2", three: "P3" }), paths),
  );

  const fresh = entries.filter((entry) => entry.status === "new_post");
  assert.equal(fresh.length, 1);
  assert.equal(fresh[0].username, "two");
  assert.equal(fresh[0].post?.id, "NEW2");
});

test("a digest observation never suppresses a later like", async () => {
  const paths = await scratch();
  await runDigest(opts(), deps(new ReadOnlyFake({ one: "P1", two: "P2", three: "P3" }), paths));

  const { history } = await loadActivity(paths.activityPath);

  // The digest recorded what it saw...
  assert.equal(history.one.last_digest?.post_id, "P1");
  // ...but wrote nothing into posts, so the worker is still free to like it.
  assert.deepEqual(history.one.posts, {});
});

test("a failing profile is recorded as a problem and the sweep continues", async () => {
  const paths = await scratch();
  const fake = new ReadOnlyFake({ one: "P1", two: "P2", three: "P3" });
  fake.failOn = "two";

  const entries = await runDigest(opts(), deps(fake, paths));

  assert.equal(entries.length, 3, "the sweep must not stop at the failure");
  const problem = entries.find((entry) => entry.username === "two");
  assert.equal(problem?.status, "problem");
  assert.match(problem?.problem ?? "", /private/);
});

test("the sweep writes a readable report to disk", async () => {
  const paths = await scratch();
  const entries = await runDigest(
    opts(),
    deps(new ReadOnlyFake({ one: "P1", two: "P2", three: "P3" }), paths),
  );

  const outPath = path.join(path.dirname(paths.activityPath), "digest.md");
  const { writeFile, mkdir } = await import("node:fs/promises");
  await mkdir(path.dirname(outPath), { recursive: true });
  await writeFile(outPath, renderMarkdown(summarize(entries, "2026-08-25T10:00:00.000Z")), "utf8");

  const markdown = await readFile(outPath, "utf8");
  assert.match(markdown, /Profiles scanned: \*\*3\*\*/);
});
