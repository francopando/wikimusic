import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { collectEditorialReferences, findDuplicateOccurrenceIds } from "../../src/lib/editorial/references";
import { artistBiographyFixture, TARGET_ARTIST_ID } from "../fixtures/editorialDocument";

describe("editorial reference collection", () => {
  it("returns no references for an empty document", () => {
    assert.deepEqual(collectEditorialReferences(1, { type: "doc", content: [{ type: "paragraph" }] }), []);
  });

  it("collects every occurrence in document order, including repeated targets", () => {
    assert.deepEqual(collectEditorialReferences(1, artistBiographyFixture), [
      { occurrenceId: "4df29df6-4b57-45a2-8514-b379c45854e4", entityType: "artist", targetArtistId: TARGET_ARTIST_ID },
      { occurrenceId: "7c48b1d8-e21f-4f39-af70-ce730be6d6d8", entityType: "artist", targetArtistId: TARGET_ARTIST_ID },
    ]);
  });

  it("detects duplicates and refuses malformed or misplaced references", () => {
    const duplicate = structuredClone(artistBiographyFixture);
    const second = duplicate.content[1]?.content?.[1];
    if (second?.type === "artistReference") second.attrs.occurrenceId = "4df29df6-4b57-45a2-8514-b379c45854e4";
    assert.deepEqual(findDuplicateOccurrenceIds(duplicate), ["4df29df6-4b57-45a2-8514-b379c45854e4"]);
    assert.throws(() => collectEditorialReferences(1, duplicate), /unique/);
    assert.throws(() => collectEditorialReferences(1, { type: "doc", content: [{ type: "artistReference", attrs: {} }] }), /block node/i);
    assert.throws(() => collectEditorialReferences(1, { type: "doc", content: [{ type: "paragraph", content: [{ type: "artistReference", attrs: {} }] }] }), /attrs\./i);
  });
});
