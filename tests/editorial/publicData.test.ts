import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { loadPublishedEditorialDocument, type PublicEditorialDataSource } from "../../src/lib/editorial/publicDataCore";
import type { PublicEditorialDocumentRow } from "../../src/lib/editorial/resolve";

const OWNER = "018f5af2-4d7b-42f8-8f44-c6ef3ecbd0dc";
const TARGET = "13d63640-f73e-46ae-80a3-94e720b7d76b";
const OCCURRENCE = "4df29df6-4b57-45a2-8514-b379c45854e4";

function row(locale = "en", document: unknown = {
  type: "doc",
  content: [{ type: "paragraph", content: [{ type: "artistReference", attrs: {
    occurrenceId: OCCURRENCE, artistId: TARGET, displayText: "Saved wording",
  } }] }],
}): PublicEditorialDocumentRow {
  return { id: "doc-1", document_type: "artist_biography", owner_artist_id: OWNER, locale, schema_version: 1, document, revision: 1 };
}

function source(overrides: Partial<PublicEditorialDataSource> = {}): PublicEditorialDataSource {
  return {
    findPublishedDocument: async () => row(),
    findRelations: async () => [{ occurrence_id: OCCURRENCE, entity_type: "artist", target_artist_id: TARGET }],
    findArtists: async () => [{ id: TARGET, slug: "current-slug", status: "published" }],
    ...overrides,
  };
}

describe("public editorial data loading", () => {
  it("returns null when no published structured document exists, including a draft-only source", async () => {
    assert.equal(await loadPublishedEditorialDocument(source({ findPublishedDocument: async () => null }), {
      documentType: "artist_biography", ownerArtistId: OWNER, locale: "en",
    }), null);
  });

  it("loads a published document for the exact requested locale", async () => {
    let requestedLocale = "";
    const result = await loadPublishedEditorialDocument(source({
      findPublishedDocument: async (input) => { requestedLocale = input.locale; return row(input.locale); },
    }), { documentType: "artist_biography", ownerArtistId: OWNER, locale: "es" });
    assert.equal(requestedLocale, "es");
    assert.equal(result?.ok, true);
    if (result?.ok) assert.equal(result.value.locale, "es");
  });

  it("loads relations and resolves all distinct targets with one batched artist query", async () => {
    let relationCalls = 0;
    let artistCalls = 0;
    let ids: string[] = [];
    const result = await loadPublishedEditorialDocument(source({
      findRelations: async () => { relationCalls += 1; return [
        { occurrence_id: OCCURRENCE, entity_type: "artist", target_artist_id: TARGET },
        { occurrence_id: "7c48b1d8-e21f-4f39-af70-ce730be6d6d8", entity_type: "artist", target_artist_id: TARGET },
      ]; },
      findArtists: async (artistIds) => { artistCalls += 1; ids = artistIds; return [{ id: TARGET, slug: "current-slug", status: "published" }]; },
    }), { documentType: "artist_biography", ownerArtistId: OWNER, locale: "en" });
    assert.equal(result?.ok, true);
    assert.equal(relationCalls, 1);
    assert.equal(artistCalls, 1);
    assert.deepEqual(ids, [TARGET]);
  });

  it("rejects invalid stored JSON safely", async () => {
    const result = await loadPublishedEditorialDocument(source({ findPublishedDocument: async () => row("en", { type: "html" }) }), {
      documentType: "artist_biography", ownerArtistId: OWNER, locale: "en",
    });
    assert.deepEqual(result, { ok: false, issues: [{ code: "invalid_document_schema", severity: "blocking" }] });
  });
});

