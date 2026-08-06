import { parseEditorialDocument } from "@/lib/editorial/validate";
import { allEditorialInlineNodes } from "@/lib/editorial/documentTree";
import type {
  EditorialDocumentV1,
  EditorialReferenceDescriptor,
  SupportedEditorialSchemaVersion,
} from "@/types/editorialDocument";

export function collectEditorialReferences(
  schemaVersion: SupportedEditorialSchemaVersion,
  value: unknown,
): EditorialReferenceDescriptor[] {
  const document = parseEditorialDocument(schemaVersion, value);
  return allEditorialInlineNodes(document).flatMap((node) =>
      node.type === "artistReference"
        ? [{ occurrenceId: node.attrs.occurrenceId, entityType: "artist" as const, targetArtistId: node.attrs.artistId }]
        : [],
  );
}

export function findDuplicateOccurrenceIds(document: EditorialDocumentV1): string[] {
  const seen = new Set<string>();
  const duplicates = new Set<string>();
  for (const node of allEditorialInlineNodes(document)) {
      if (node.type !== "artistReference") continue;
      if (seen.has(node.attrs.occurrenceId)) duplicates.add(node.attrs.occurrenceId);
      seen.add(node.attrs.occurrenceId);
  }
  return [...duplicates];
}
