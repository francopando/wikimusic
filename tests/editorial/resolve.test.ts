import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { resolvePublicEditorialDocument } from "../../src/lib/editorial/resolve";

const OWNER = "018f5af2-4d7b-42f8-8f44-c6ef3ecbd0dc";
const TARGET = "13d63640-f73e-46ae-80a3-94e720b7d76b";
const OCCURRENCE = "4df29df6-4b57-45a2-8514-b379c45854e4";
const document = { type: "doc", content: [{ type: "paragraph", content: [{ type: "artistReference", attrs: { occurrenceId: OCCURRENCE, artistId: TARGET, displayText: "Historical Name" } }] }] };
const row = { id: "doc", document_type: "artist_biography", owner_artist_id: OWNER, locale: "en", schema_version: 1, document, revision: 1 };
const relation = { occurrence_id: OCCURRENCE, entity_type: "artist", target_artist_id: TARGET };

describe("public editorial reference resolution", () => {
  it("links a published current target while preserving saved display text", () => {
    const result = resolvePublicEditorialDocument({ row, relations: [relation], artists: [{ id: TARGET, slug: "new-current-slug", status: "published" }] });
    assert.equal(result.ok, true);
    if (result.ok) assert.deepEqual(result.value.references[OCCURRENCE], {
      occurrenceId: OCCURRENCE, artistId: TARGET, displayText: "Historical Name", slug: "new-current-slug", isPubliclyLinkable: true,
    });
  });

  it("degrades unpublished, missing, and slugless targets to plain text warnings", () => {
    for (const [artists, code] of [
      [[{ id: TARGET, slug: "target", status: "draft" }], "non_public_target"],
      [[], "missing_target"],
      [[{ id: TARGET, slug: null, status: "published" }], "missing_target_slug"],
    ] as const) {
      const result = resolvePublicEditorialDocument({ row, relations: [relation], artists: [...artists] });
      assert.equal(result.ok, true);
      if (result.ok) {
        assert.equal(result.value.references[OCCURRENCE]?.isPubliclyLinkable, false);
        assert.equal(result.value.integrityIssues[0]?.code, code);
      }
    }
  });

  it("detects missing, mismatched, and orphan relations", () => {
    const missing = resolvePublicEditorialDocument({ row, relations: [], artists: [] });
    assert.equal(missing.ok && missing.value.integrityIssues[0]?.code, "missing_relation");
    const mismatch = resolvePublicEditorialDocument({ row, relations: [{ ...relation, target_artist_id: OWNER }], artists: [] });
    assert.equal(mismatch.ok && mismatch.value.integrityIssues[0]?.code, "target_mismatch");
    const orphan = resolvePublicEditorialDocument({ row, relations: [relation, { occurrence_id: "7c48b1d8-e21f-4f39-af70-ce730be6d6d8", entity_type: "artist", target_artist_id: TARGET }], artists: [{ id: TARGET, slug: "target", status: "published" }] });
    assert.equal(orphan.ok && orphan.value.integrityIssues.some((issue) => issue.code === "orphan_relation"), true);
  });
});

