import assert from "node:assert/strict";
import test from "node:test";
import { buildEditorialIntegrityReport } from "../../src/lib/editorial/integrity";
import { isArtistReferencePubliclyLinkable, reassignArtistReferences, summarizeBiographyReferencesForDelete } from "../../src/lib/editorial/lifecycle";
import { getArtistProfileRevalidationPaths } from "../../src/lib/revalidateArtistProfile";
import { artistBiographyFixture, OWNER_ARTIST_ID, TARGET_ARTIST_ID } from "../fixtures/editorialDocument";

const replacementId = "40000000-0000-4000-8000-202608050001";

test("rename and slug lifecycle preserve stored prose identity", () => {
  const serialized = JSON.stringify(artistBiographyFixture);
  assert.equal(isArtistReferencePubliclyLinkable("published", "renamed-artist"), true);
  assert.equal(isArtistReferencePubliclyLinkable("hidden", "renamed-artist"), false);
  assert.equal(isArtistReferencePubliclyLinkable("duplicate", "renamed-artist"), false);
  assert.equal(JSON.stringify(artistBiographyFixture), serialized);
});

test("merge reassignment preserves occurrence UUID and visible wording", () => {
  const updated = reassignArtistReferences(artistBiographyFixture, TARGET_ARTIST_ID, replacementId);
  const before = artistBiographyFixture.content[0].content?.find((node) => node.type === "artistReference");
  const after = updated.content[0].content?.find((node) => node.type === "artistReference");
  assert.equal(after?.type, "artistReference");
  if (before?.type !== "artistReference" || after?.type !== "artistReference") return;
  assert.equal(after.attrs.artistId, replacementId);
  assert.equal(after.attrs.occurrenceId, before.attrs.occurrenceId);
  assert.equal(after.attrs.displayText, before.attrs.displayText);
});

test("profile revalidation is targeted and includes old and new locale paths", () => {
  const paths = getArtistProfileRevalidationPaths("new-slug");
  assert.deepEqual([...paths].sort(), ["/artists/new-slug", "/en/artists/new-slug", "/es/artists/new-slug"].sort());
  assert.equal(paths.has("/"), false);
});

test("integrity report classifies reference, publication, wording, and compatibility findings", () => {
  const report = buildEditorialIntegrityReport({
    documents: [{ id: "doc", document_type: "artist_biography", owner_artist_id: OWNER_ARTIST_ID, locale: "en", schema_version: 1, document: artistBiographyFixture, status: "published" }],
    relations: [{ editorial_document_id: "doc", occurrence_id: "4df29df6-4b57-45a2-8514-b379c45854e4", entity_type: "artist", target_artist_id: TARGET_ARTIST_ID }],
    artists: [
      { id: OWNER_ARTIST_ID, name: "Owner", slug: "owner", status: "published", bio_en: "different compatibility text", bio_es: null },
      { id: TARGET_ARTIST_ID, name: "Canonical Target Name", slug: "target", status: "hidden", bio_en: null, bio_es: null },
    ],
  });
  assert.ok(report.findings.some((finding) => finding.code === "reference_node_without_relation" && finding.severity === "blocking"));
  assert.ok(report.findings.some((finding) => finding.code === "unpublished_target" && finding.severity === "warning"));
  assert.ok(report.findings.some((finding) => finding.code === "display_wording_differs_from_canonical_name" && finding.severity === "informational"));
  assert.ok(report.findings.some((finding) => finding.code === "legacy_compatibility_mismatch"));
});

test("published empty over nonempty compatibility data is blocking", () => {
  const report = buildEditorialIntegrityReport({ documents: [{ id: "empty", document_type: "artist_biography", owner_artist_id: OWNER_ARTIST_ID, locale: "en", schema_version: 1, document: { type: "doc", content: [{ type: "paragraph" }] }, status: "published" }], relations: [], artists: [{ id: OWNER_ARTIST_ID, name: "Owner", slug: "owner", status: "published", bio_en: "legacy", bio_es: null }] });
  assert.ok(report.findings.some((finding) => finding.code === "published_empty_document" && finding.severity === "blocking"));
});

test("delete protection groups reverse occurrences by biography and locale", () => {
  const summaries = summarizeBiographyReferencesForDelete([
    { documentId: "doc", biographyOwnerId: OWNER_ARTIST_ID, biographyOwnerName: "Owner", ownerSlug: "owner", locale: "en" },
    { documentId: "doc", biographyOwnerId: OWNER_ARTIST_ID, biographyOwnerName: "Owner", ownerSlug: "owner", locale: "en" },
  ]);
  assert.deepEqual(summaries, [{ ownerArtistId: OWNER_ARTIST_ID, ownerName: "Owner", ownerSlug: "owner", locale: "en", occurrenceCount: 2 }]);
});
