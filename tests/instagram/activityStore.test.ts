import assert from "node:assert/strict";
import { mkdtemp, readFile, writeFile } from "node:fs/promises";
import { existsSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import test from "node:test";

import {
  isPostAlreadyProcessed,
  loadActivity,
  normalizeHistory,
  recordPost,
  recordProfileAttempt,
  saveActivity,
} from "../../scripts/instagram/activityStore";
import {
  extractPostDate,
  extractPostId,
  parsePostCount,
  pickNewest,
  postUrlFor,
} from "../../scripts/instagram/instagramPage";
import { normalizeHandle } from "../../scripts/instagram/profileSource";
import type { ActivityHistory } from "../../scripts/instagram/types";

async function scratchFile(): Promise<string> {
  const dir = await mkdtemp(path.join(tmpdir(), "ig-activity-"));
  return path.join(dir, "instagram-activity.json");
}

test("a missing activity file loads as an empty history", async () => {
  const filePath = await scratchFile();
  const { history } = await loadActivity(filePath);
  assert.deepEqual(history, {});
});

test("saving creates the file and reloads identically", async () => {
  const filePath = await scratchFile();
  const history: ActivityHistory = {};

  recordPost(history, "someprofile", "ABC123", {
    url: "https://www.instagram.com/p/ABC123/",
    result: "liked",
    processed_at: "2026-08-25T04:30:00.000Z",
  });

  await saveActivity(filePath, history);
  assert.ok(existsSync(filePath));

  const reloaded = await loadActivity(filePath);
  assert.deepEqual(reloaded.history, history);

  // Human-readable: indented JSON, not a single line.
  const raw = await readFile(filePath, "utf8");
  assert.match(raw, /\n {2}"someprofile": \{/);
});

test("history is keyed by post, so an older post stays recorded alongside a new one", async () => {
  const filePath = await scratchFile();
  const history: ActivityHistory = {};

  recordPost(history, "profile1", "ABC", {
    url: "https://www.instagram.com/p/ABC/",
    result: "liked",
    processed_at: "2026-08-25T04:30:00.000Z",
  });
  await saveActivity(filePath, history);

  // Three days later the profile has a new post.
  const later = (await loadActivity(filePath)).history;
  assert.equal(isPostAlreadyProcessed(later, "profile1", "ABC"), true);
  assert.equal(isPostAlreadyProcessed(later, "profile1", "XYZ"), false);

  recordPost(later, "profile1", "XYZ", {
    url: "https://www.instagram.com/p/XYZ/",
    result: "liked",
    processed_at: "2026-08-28T04:30:00.000Z",
  });
  await saveActivity(filePath, later);

  const final = (await loadActivity(filePath)).history;
  assert.deepEqual(Object.keys(final.profile1.posts).sort(), ["ABC", "XYZ"]);
});

test("failed posts are retried; terminal outcomes are not", async () => {
  const history: ActivityHistory = {};

  recordPost(history, "p", "FAILED1", {
    url: "https://www.instagram.com/p/FAILED1/",
    result: "failed",
    processed_at: "2026-08-25T04:30:00.000Z",
    reason: "timeout",
  });
  recordPost(history, "p", "LIKED1", {
    url: "https://www.instagram.com/p/LIKED1/",
    result: "liked",
    processed_at: "2026-08-25T04:30:00.000Z",
  });
  recordPost(history, "p", "SEEN1", {
    url: "https://www.instagram.com/p/SEEN1/",
    result: "already_liked",
    processed_at: "2026-08-25T04:30:00.000Z",
  });

  assert.equal(isPostAlreadyProcessed(history, "p", "FAILED1"), false);
  assert.equal(isPostAlreadyProcessed(history, "p", "LIKED1"), true);
  assert.equal(isPostAlreadyProcessed(history, "p", "SEEN1"), true);
});

test("malformed JSON is quarantined instead of crashing the worker", async () => {
  const filePath = await scratchFile();
  await writeFile(filePath, "{ this is not json", "utf8");

  const { history, recoveredFrom } = await loadActivity(filePath);

  assert.deepEqual(history, {});
  assert.ok(recoveredFrom, "expected the corrupt file to be moved aside");
  assert.ok(existsSync(recoveredFrom));
  assert.equal(existsSync(filePath), false);
});

test("an empty file is treated as an empty history", async () => {
  const filePath = await scratchFile();
  await writeFile(filePath, "   \n", "utf8");
  const { history } = await loadActivity(filePath);
  assert.deepEqual(history, {});
});

test("individual malformed entries are dropped without losing valid ones", () => {
  const history = normalizeHistory({
    good: { posts: { ABC: { url: "https://x/p/ABC/", result: "liked", processed_at: "t" } } },
    broken: "not an object",
    partial: { posts: { NOPE: { result: "liked" }, OK: { url: "u", result: "liked" } } },
  });

  assert.deepEqual(Object.keys(history).sort(), ["good", "partial"]);
  assert.deepEqual(Object.keys(history.partial.posts), ["OK"]);
});

test("profile-level outcomes are stored beside the post map", async () => {
  const filePath = await scratchFile();
  const history: ActivityHistory = {};

  recordProfileAttempt(history, "noposts", {
    result: "skipped",
    reason: "no usable post found",
    at: "2026-08-25T04:30:00.000Z",
  });

  await saveActivity(filePath, history);
  const reloaded = (await loadActivity(filePath)).history;

  assert.deepEqual(reloaded.noposts.posts, {});
  assert.equal(reloaded.noposts.last_attempt?.result, "skipped");
});

test("the activity file holds no credentials or session data", async () => {
  const filePath = await scratchFile();
  const history: ActivityHistory = {};

  recordPost(history, "someprofile", "ABC123", {
    url: "https://www.instagram.com/p/ABC123/",
    result: "liked",
    processed_at: "2026-08-25T04:30:00.000Z",
  });

  await saveActivity(filePath, history);
  const raw = (await readFile(filePath, "utf8")).toLowerCase();

  for (const forbidden of ["password", "cookie", "sessionid", "token", "csrf"]) {
    assert.equal(raw.includes(forbidden), false, `activity file leaked "${forbidden}"`);
  }
});

test("handles are normalized from every shape the artists table holds", () => {
  assert.equal(normalizeHandle("alexbueno_rd"), "alexbueno_rd");
  assert.equal(normalizeHandle("  AnthonySantos "), "anthonysantos");
  assert.equal(normalizeHandle("@marid.ny"), "marid.ny");
  assert.equal(normalizeHandle("https://www.instagram.com/djscuff/"), "djscuff");
  assert.equal(normalizeHandle("https://www.instagram.com/nattinatasha"), "nattinatasha");
  assert.equal(normalizeHandle("https://instagram.com/jairopuellooficial"), "jairopuellooficial");
  assert.equal(normalizeHandle("instagram.com/kaki.vargas?igsh=abc123"), "kaki.vargas");
  assert.equal(normalizeHandle(""), null);
  assert.equal(normalizeHandle(null), null);
  assert.equal(normalizeHandle("not a handle!"), null);
});

test("post identifiers come from the shortcode, not the full URL", () => {
  assert.equal(extractPostId("/p/DAbc123_xyZ/"), "DAbc123_xyZ");
  assert.equal(extractPostId("/reel/CXyZ-999/?taken-by=x"), "CXyZ-999");
  assert.equal(extractPostId("/explore/tags/merengue/"), null);

  assert.equal(postUrlFor("/p/DAbc123/"), "https://www.instagram.com/p/DAbc123/");
  assert.equal(postUrlFor("/reel/DAbc123/"), "https://www.instagram.com/reel/DAbc123/");
});

test("post dates are read from signed-out grid alt text", () => {
  assert.equal(
    extractPostDate("Video by Alex Matos on January 10, 2024."),
    Date.parse("January 10, 2024"),
  );
  assert.equal(
    extractPostDate("Photo by X on August 24, 2026. May be an image of text that says 'Fe'."),
    Date.parse("August 24, 2026"),
  );
  // Signed in, the alt is the caption — no date, so this signal is unavailable.
  assert.equal(extractPostDate("🚨 Ya salio! #ElQueSeEnamoraPierde"), null);
  assert.equal(extractPostDate(null), null);
  assert.equal(extractPostDate(""), null);
});

test("the newest post is chosen by date, beating a pinned post that sorts first", () => {
  const pinnedOld = {
    id: "OLD",
    url: "u1",
    pinned: false, // signed out: no badge rendered at all
    takenAt: Date.parse("January 10, 2024"),
  };
  const actualNewest = { id: "NEW", url: "u2", pinned: false, takenAt: Date.parse("August 24, 2026") };

  // Grid order puts the pinned post first; the date must win.
  assert.equal(pickNewest([pinnedOld, actualNewest])?.id, "NEW");
});

test("without dates, pinned tiles are skipped in grid order", () => {
  const pinned = { id: "PIN", url: "u1", pinned: true, takenAt: null };
  const first = { id: "FIRST", url: "u2", pinned: false, takenAt: null };

  assert.equal(pickNewest([pinned, first])?.id, "FIRST");
  assert.equal(pickNewest([pinned])?.id, "PIN", "all-pinned falls back to the first tile");
  assert.equal(pickNewest([]), null);
});

test("a tile with a date outranks undated tiles regardless of position", () => {
  const undatedFirst = { id: "A", url: "u1", pinned: false, takenAt: null };
  const dated = { id: "B", url: "u2", pinned: false, takenAt: Date.parse("August 24, 2026") };

  assert.equal(pickNewest([undatedFirst, dated])?.id, "B");
});

test("post counts are read from Instagram's og:description", () => {
  assert.equal(
    parsePostCount("136K Followers, 969 Following, 0 Posts - See Instagram photos and videos"),
    0,
  );
  assert.equal(parsePostCount("3M Followers, 1,234 Following, 628 Posts - See Instagram"), 628);
  assert.equal(parsePostCount("8M Followers, 387 Following, 7,002 Posts - See Instagram"), 7002);
  assert.equal(parsePostCount("2.1K Followers, 5 Following, 1.2K Posts - x"), 1200);
  assert.equal(parsePostCount("no counts here"), null);
  assert.equal(parsePostCount(null), null);
});
