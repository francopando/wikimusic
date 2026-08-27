import assert from "node:assert/strict";
import test from "node:test";

import { PROVINCE_SENTINELS, formatOrigin } from "../../src/lib/artistDirectoryShared";

test("a Dominican origin keeps both the place and the province", () => {
  assert.equal(formatOrigin("Tamboril", "Santiago"), "Tamboril, Santiago");
});

test("the province sentinels never reach the reader", () => {
  // These produced "New York, Born Abroad" and "Tamboril, No Province" on
  // published profiles, including Prince Royce's.
  assert.equal(formatOrigin("New York", "Born Abroad"), "New York");
  assert.equal(formatOrigin("Tamboril", "No Province"), "Tamboril");
});

test("a sentinel with no place leaves the field empty rather than printing itself", () => {
  for (const sentinel of PROVINCE_SENTINELS) {
    assert.equal(formatOrigin(null, sentinel), null);
  }
});

test("a missing origin stays null so the facts card hides the row", () => {
  assert.equal(formatOrigin(null, null), null);
  assert.equal(formatOrigin(undefined, undefined), null);
});

test("a place with no province recorded shows the place alone", () => {
  assert.equal(formatOrigin("Santo Domingo", null), "Santo Domingo");
});
