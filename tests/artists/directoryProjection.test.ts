import assert from "node:assert/strict";
import test from "node:test";

import { ARTIST_LIST_SELECT } from "../../src/lib/artistDirectoryShared";

test("public artist directory projection excludes the removed legacy bio column", () => {
  const columns = ARTIST_LIST_SELECT.split(",");

  assert.equal(columns.includes("bio"), false);
  assert.equal(columns.includes("id"), true);
  assert.equal(columns.includes("slug"), true);
  assert.equal(columns.includes("status"), true);
});
