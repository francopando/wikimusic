import assert from "node:assert/strict";
import test from "node:test";
import { nextArtistComboboxIndex } from "../../src/components/admin/ArtistCombobox.tsx";

test("artist combobox arrow navigation stays within results", () => {
  assert.equal(nextArtistComboboxIndex(0, "ArrowDown", 3), 1);
  assert.equal(nextArtistComboboxIndex(2, "ArrowDown", 3), 2);
  assert.equal(nextArtistComboboxIndex(1, "ArrowUp", 3), 0);
  assert.equal(nextArtistComboboxIndex(0, "ArrowUp", 3), 0);
  assert.equal(nextArtistComboboxIndex(0, "ArrowDown", 0), 0);
});
