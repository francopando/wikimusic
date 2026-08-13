import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";
import { createArtistReferenceAttrs, repairDuplicateOccurrenceIds } from "../../src/lib/editorial/tiptap/artistReference.ts";
import { prepareEditorialDocumentForSave } from "../../src/lib/editorial/tiptap/save.ts";
import { createClientUuid } from "../../src/lib/clientUuid.ts";

const artistId = "00000000-0000-4000-8000-000000000001";
const occurrenceId = "10000000-0000-4000-8000-000000000001";
const replacementId = "10000000-0000-4000-8000-000000000002";

test("artist reference attributes use UUID identity and preserve visible wording", () => {
  assert.deepEqual(createArtistReferenceAttrs(artistId, "El Mayimbe", occurrenceId), { occurrenceId, artistId, displayText: "El Mayimbe" });
});

test("client UUID utility uses native randomUUID when available", () => {
  const nativeId = "20000000-0000-4000-8000-000000000001";
  assert.equal(createClientUuid({ randomUUID: () => nativeId }), nativeId);
});

test("client UUID utility uses getRandomValues when randomUUID is unavailable", () => {
  let seed = 0;
  const cryptoWithoutRandomUuid = {
    getRandomValues<T extends ArrayBufferView | null>(array: T) {
      const bytes = array as Uint8Array;
      for (let index = 0; index < bytes.length; index += 1) bytes[index] = seed++;
      return array;
    },
  };
  const first = createClientUuid(cryptoWithoutRandomUuid);
  const second = createClientUuid(cryptoWithoutRandomUuid);
  assert.match(first, /^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/);
  assert.notEqual(first, second);
});

test("admin editorial clients use the browser-compatible UUID utility", () => {
  const files = [
    "src/app/admin/catalog/recordings/page.tsx",
    "src/app/admin/authoritative-works/page.tsx",
    "src/components/admin/RecordingCreditsManager.tsx",
    "src/app/admin/external-contributors/page.tsx",
    "src/app/admin/recording-review/page.tsx",
  ];
  for (const file of files) {
    const source = readFileSync(file, "utf8");
    assert.match(source, /createClientUuid\(\)/, file);
    assert.doesNotMatch(source, /crypto\.randomUUID\(\)/, file);
  }
});

test("independent references to the same artist receive unique occurrence IDs", () => {
  const first = createArtistReferenceAttrs(artistId, "El Mayimbe");
  const second = createArtistReferenceAttrs(artistId, "El Mayimbe");
  assert.equal(first.artistId, artistId);
  assert.equal(first.displayText, "El Mayimbe");
  assert.notEqual(first.occurrenceId, second.occurrenceId);
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
