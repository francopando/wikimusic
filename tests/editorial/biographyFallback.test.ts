import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { getLegacyArtistBiography, selectArtistBiography } from "../../src/lib/editorial/biographyFallback";
import type { ResolvedEditorialDocument } from "../../src/types/editorialDocument";

const structured: ResolvedEditorialDocument = {
  id: "doc", documentType: "artist_biography", ownerArtistId: "018f5af2-4d7b-42f8-8f44-c6ef3ecbd0dc",
  locale: "en", schemaVersion: 1, revision: 1,
  document: { type: "doc", content: [{ type: "paragraph", content: [{ type: "text", text: "Structured" }] }] },
  references: {}, integrityIssues: [],
};

describe("artist biography structured-to-legacy fallback", () => {
  it("prefers a valid structured biography", () => {
    assert.equal(selectArtistBiography({ ok: true, value: structured }, "Legacy").kind, "structured");
  });
  it("uses locale-selected legacy text when structured content is absent", () => {
    assert.deepEqual(selectArtistBiography(null, "Legacy English"), { kind: "legacy", text: "Legacy English" });
    assert.deepEqual(selectArtistBiography(null, "Biografía española"), { kind: "legacy", text: "Biografía española" });
  });
  it("preserves English and Spanish legacy locale fallback exactly", () => {
    assert.equal(getLegacyArtistBiography("en", "English", "Español"), "English");
    assert.equal(getLegacyArtistBiography("es", "English", "Español"), "Español");
    assert.equal(getLegacyArtistBiography("es", "English", "  "), "English");
    assert.equal(getLegacyArtistBiography("en", null, "Español"), null);
  });
  it("falls back safely when structured content has an integrity failure", () => {
    assert.deepEqual(selectArtistBiography({ ok: false, issues: [{ code: "invalid_document_schema", severity: "blocking" }] }, "Legacy"), { kind: "legacy", text: "Legacy" });
  });
  it("returns none when neither source has visible content", () => {
    assert.deepEqual(selectArtistBiography(null, "  "), { kind: "none" });
  });
});
