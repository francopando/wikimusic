import assert from "node:assert/strict";
import test from "node:test";
import { editorialDocumentToPlainText } from "../../src/lib/editorial/plainText";
import { editorialMigrationSha256, hasForbiddenArtistBiographyFields, normalizeLegacyBiography, prepareLegacyBiographyMigration } from "../../src/lib/editorial/migration";

test("English and Spanish legacy text migrate losslessly without references", () => {
  for (const text of ["English biography", "Biografía de José Núñez — música típica."]) {
    const result = prepareLegacyBiographyMigration(text);
    assert.equal(result.ok, true);
    if (!result.ok || result.result !== "ready") return;
    assert.equal(editorialDocumentToPlainText(result.document), normalizeLegacyBiography(text));
    assert.equal(JSON.stringify(result.document).includes("artistReference"), false);
  }
});

test("empty and whitespace-only sources are skipped and create no published empty document", () => {
  assert.equal(prepareLegacyBiographyMigration(null).result, "skipped_empty");
  assert.equal(prepareLegacyBiographyMigration("").result, "skipped_empty");
  assert.equal(prepareLegacyBiographyMigration("  \n ").result, "skipped_empty");
});

test("CRLF, multiple paragraphs, blank lines, and hard breaks follow the Phase 1 normalization", () => {
  const source = "one\r\ntwo\r\n\r\n\r\nthree";
  const result = prepareLegacyBiographyMigration(source);
  assert.equal(result.ok, true);
  if (!result.ok || result.result !== "ready") return;
  assert.equal(result.derivedHash, editorialMigrationSha256("one\ntwo\n\nthree"));
  assert.equal(result.normalizationChanged, true);
});

test("hashes and migration output are stable for safe reruns", () => {
  const first = prepareLegacyBiographyMigration("Stable biography.");
  const second = prepareLegacyBiographyMigration("Stable biography.");
  assert.deepEqual(first, second);
  assert.equal(editorialMigrationSha256("á"), editorialMigrationSha256("á"));
});

test("legacy biography fields are rejected from general artist updates", () => {
  assert.deepEqual(hasForbiddenArtistBiographyFields({ name: "Artist", province: "Santiago" }), []);
  assert.deepEqual(hasForbiddenArtistBiographyFields({ name: "Artist", bio: "stale", bio_en: null, bio_es: "" }), ["bio", "bio_en", "bio_es"]);
});
