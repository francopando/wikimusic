import assert from "node:assert/strict";
import test from "node:test";

import {
  DOMINICAN_PROVINCES,
  PROVINCE_SENTINELS,
  formatOrigin,
} from "../../src/lib/artistDirectoryShared";

test("a Dominican origin keeps both the place and the province", () => {
  assert.equal(formatOrigin("Tamboril", "Santiago"), "Tamboril, Santiago");
});

test("the province sentinels never reach the reader", () => {
  // These produced "New York, Born Abroad" and "Tamboril, No Province" on
  // published profiles, including Prince Royce's.
  assert.equal(formatOrigin("Nueva York", "Nacido en el Exterior"), "Nueva York");
  assert.equal(formatOrigin("New York", "Born Abroad"), "New York");
  assert.equal(formatOrigin("Tamboril", "No Province"), "Tamboril");
});

test("the Spanish sentinel is the one the admin form offers", () => {
  // The column was normalised to Spanish, so the value an editor can save has
  // to be the value the renderer suppresses. If these drift apart, every artist
  // born outside the country prints their sentinel on the public page.
  assert.ok(PROVINCE_SENTINELS.has("Nacido en el Exterior"));
  assert.equal(formatOrigin("Miami", "Nacido en el Exterior"), "Miami");
  assert.equal(formatOrigin(null, "Nacido en el Exterior"), null);
});

test("a sentinel with no place leaves the field empty rather than printing itself", () => {
  for (const sentinel of PROVINCE_SENTINELS) {
    assert.equal(formatOrigin(null, sentinel), null);
  }
});

test("a bookkeeping value nobody listed is still kept off the page", () => {
  // "X - Born Outside" was in the province column of a published profile and
  // was not one of the two sentinels the check knew about, so it printed as
  // "Puerto Príncipe, X - Born Outside". Recognising real provinces rather than
  // listing fake ones is what closes that off for values yet to appear.
  assert.equal(formatOrigin("Puerto Príncipe", "X - Born Outside"), "Puerto Príncipe");
  assert.equal(formatOrigin("Santo Domingo", "TBD"), "Santo Domingo");
  assert.equal(formatOrigin(null, "X - Born Outside"), null);
});

test("every province the admin form offers is treated as a real place", () => {
  // The dropdown and the renderer have to agree, or an artist saved through the
  // admin UI loses their province on the public page.
  for (const province of DOMINICAN_PROVINCES) {
    assert.equal(formatOrigin("Tamboril", province), `Tamboril, ${province}`);
  }
});

test("a missing origin stays null so the facts card hides the row", () => {
  assert.equal(formatOrigin(null, null), null);
  assert.equal(formatOrigin(undefined, undefined), null);
});

test("a place with no province recorded shows the place alone", () => {
  assert.equal(formatOrigin("Santo Domingo", null), "Santo Domingo");
});

test("a town that shares its province's name is printed once", () => {
  // 102 published rows carry birth_place equal to province, because several
  // provinces are named after their capital. "Barahona, Barahona" reads as a
  // mistake, so the repetition collapses.
  assert.equal(formatOrigin("Barahona", "Barahona"), "Barahona");
  assert.equal(formatOrigin("Santiago", "Santiago"), "Santiago");
  assert.equal(formatOrigin("San José de Ocoa", "San José de Ocoa"), "San José de Ocoa");

  // A genuine town inside a like-named province still prints both.
  assert.equal(formatOrigin("Navarrete", "Santiago"), "Navarrete, Santiago");
});
