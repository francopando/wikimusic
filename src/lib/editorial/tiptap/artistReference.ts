import type { JSONContent } from "@tiptap/core";
import { mapEditorialInlineNodes } from "@/lib/editorial/documentTree";
import type { ArtistReferenceNode, EditorialDocumentV1 } from "@/types/editorialDocument";

export type ArtistReferenceAttrs = ArtistReferenceNode["attrs"];

export function createArtistReferenceAttrs(
  artistId: string,
  displayText: string,
  occurrenceId = crypto.randomUUID(),
): ArtistReferenceAttrs {
  return { occurrenceId, artistId, displayText };
}

export function repairDuplicateOccurrenceIds(
  document: EditorialDocumentV1,
  generateUuid: () => string = () => crypto.randomUUID(),
): EditorialDocumentV1 {
  const seen = new Set<string>();
  return mapEditorialInlineNodes(structuredClone(document), (node) => {
    if (node.type !== "artistReference") return node;
    let occurrenceId = node.attrs.occurrenceId;
    while (seen.has(occurrenceId)) occurrenceId = generateUuid();
    seen.add(occurrenceId);
    return { ...node, attrs: { ...node.attrs, occurrenceId } };
  });
}

export function isArtistReferenceContent(node: JSONContent | null | undefined) {
  return node?.type === "artistReference";
}
