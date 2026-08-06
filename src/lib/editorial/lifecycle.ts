import type { EditorialDocumentV1 } from "@/types/editorialDocument";
import { mapEditorialInlineNodes } from "@/lib/editorial/documentTree";

export function reassignArtistReferences(document: EditorialDocumentV1, sourceArtistId: string, targetArtistId: string): EditorialDocumentV1 {
  if (sourceArtistId === targetArtistId) return document;
  return mapEditorialInlineNodes(document, (node) => node.type === "artistReference" && node.attrs.artistId === sourceArtistId
    ? { ...node, attrs: { ...node.attrs, artistId: targetArtistId } }
    : node);
}

export function isArtistReferencePubliclyLinkable(status: string | null | undefined, slug: string | null | undefined) {
  return status === "published" && Boolean(slug && /^[a-z0-9]+(?:-[a-z0-9]+)*$/i.test(slug));
}

export type BiographyReferenceSummaryInput = { documentId: string; biographyOwnerId: string; biographyOwnerName: string; ownerSlug: string | null; locale: string };
export function summarizeBiographyReferencesForDelete(references: BiographyReferenceSummaryInput[]) {
  return [...new Map(references.map((reference) => [`${reference.documentId}:${reference.locale}`, {
    ownerArtistId: reference.biographyOwnerId,
    ownerName: reference.biographyOwnerName,
    ownerSlug: reference.ownerSlug,
    locale: reference.locale,
    occurrenceCount: references.filter((item) => item.documentId === reference.documentId).length,
  }])).values()];
}
