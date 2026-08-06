import assert from "node:assert/strict";
import test from "node:test";
import { createArtistReferenceAttrs, repairDuplicateOccurrenceIds } from "../../src/lib/editorial/tiptap/artistReference.ts";
import { prepareEditorialDocumentForSave } from "../../src/lib/editorial/tiptap/save.ts";

const artistId = "00000000-0000-4000-8000-000000000001";
const occurrenceId = "10000000-0000-4000-8000-000000000001";
const replacementId = "10000000-0000-4000-8000-000000000002";

test("artist reference attributes use UUID identity and preserve visible wording", () => {
  assert.deepEqual(createArtistReferenceAttrs(artistId, "El Mayimbe", occurrenceId), { occurrenceId, artistId, displayText: "El Mayimbe" });
});

test("duplicate occurrence IDs are repaired before persistence", () => {
  const result = repairDuplicateOccurrenceIds({ type: "doc", content: [{ type: "paragraph", content: [
    { type: "artistReference", attrs: { occurrenceId, artistId, displayText: "First" } },
    { type: "artistReference", attrs: { occurrenceId, artistId, displayText: "Second" } },
  ] }] }, () => replacementId);
  assert.equal(result.content[0].content?.[0].type === "artistReference" && result.content[0].content[0].attrs.occurrenceId, occurrenceId);
  assert.equal(result.content[0].content?.[1].type === "artistReference" && result.content[0].content[1].attrs.occurrenceId, replacementId);
});

test("prepared Tiptap JSON matches the Phase 1 schema", () => {
  const result = prepareEditorialDocumentForSave({ type: "doc", content: [{ type: "paragraph", content: [
    { type: "text", text: "Bold", marks: [{ type: "bold" }] }, { type: "hardBreak" },
    { type: "artistReference", attrs: { occurrenceId, artistId, displayText: "Artist" } },
  ] }] });
  assert.equal(result.ok, true);
});

test("canonical empty document remains valid editor content", () => {
  assert.equal(prepareEditorialDocumentForSave({ type: "doc", content: [{ type: "paragraph" }] }).ok, true);
});
