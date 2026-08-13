import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const recording = readFileSync("src/app/admin/catalog/recordings/page.tsx", "utf8");
const work = readFileSync("src/app/admin/authoritative-works/page.tsx", "utf8");

test("unresolved Recording prominently offers all three editorial outcomes", () => {
  assert.match(recording, /Search Existing Work/);
  assert.match(recording, /Create New Work/);
  assert.match(recording, /Leave Unresolved/);
  assert.match(recording, /canonicalWork \?/);
});

test("new Work title begins with the Recording title and remains editable", () => {
  assert.match(recording, /setNewWorkTitle\(recording\.title/);
  assert.match(recording, /value=\{newWorkTitle\}/);
});

test("existing Work linking preserves assertion and selection governance", () => {
  assert.match(recording, /workflowAction\("work\.assert"/);
  assert.match(recording, /workflowAction\("work\.select"/);
});

test("new Work creation preserves both contexts and opens the Work Workspace", () => {
  assert.match(recording, /workId=\$\{encodeURIComponent\(created\.work_id\)\}/);
  assert.match(recording, /recordingId=\$\{encodeURIComponent\(selectedRecordingId\)\}/);
  assert.match(recording, /linkPrompt=1/);
});

test("Work Workspace immediately offers link or unresolved after Recording-driven creation", () => {
  assert.match(work, /Continue from Recording/);
  assert.match(work, /Link this Recording/);
  assert.match(work, /The Recording remains unresolved\. The new Work was preserved/);
});
