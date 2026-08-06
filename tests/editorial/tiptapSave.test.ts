import assert from "node:assert/strict";
import test from "node:test";
import { classifyEditorialSaveResponse } from "../../src/lib/editorial/tiptap/save.ts";

test("save response classification preserves stale edits", () => {
  assert.equal(classifyEditorialSaveResponse(409, false), "stale");
});
test("save response classification distinguishes success and validation failure", () => {
  assert.equal(classifyEditorialSaveResponse(200, true), "saved");
  assert.equal(classifyEditorialSaveResponse(400, false), "error");
});
