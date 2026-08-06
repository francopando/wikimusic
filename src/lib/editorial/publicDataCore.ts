import { resolvePublicEditorialDocument } from "@/lib/editorial/resolve";
import type {
  EditorialLocale,
  PublicEditorialDocumentResult,
  SupportedEditorialDocumentType,
} from "@/types/editorialDocument";
import type {
  PublicEditorialArtistRow,
  PublicEditorialDocumentRow,
  PublicEditorialRelationRow,
} from "@/lib/editorial/resolve";

export type PublicEditorialDataSource = {
  findPublishedDocument(input: {
    documentType: SupportedEditorialDocumentType;
    ownerArtistId: string;
    locale: EditorialLocale;
  }): Promise<PublicEditorialDocumentRow | null>;
  findRelations(documentId: string): Promise<PublicEditorialRelationRow[]>;
  findArtists(artistIds: string[]): Promise<PublicEditorialArtistRow[]>;
};

export async function loadPublishedEditorialDocument(
  source: PublicEditorialDataSource,
  input: {
    documentType: SupportedEditorialDocumentType;
    ownerArtistId: string;
    locale: EditorialLocale;
  },
): Promise<PublicEditorialDocumentResult | null> {
  try {
    const row = await source.findPublishedDocument(input);
    if (!row) return null;
    const relations = await source.findRelations(row.id);
    const targetIds = [...new Set(relations.flatMap((relation) =>
      relation.entity_type === "artist" && relation.target_artist_id ? [relation.target_artist_id] : [],
    ))];
    const artists = targetIds.length ? await source.findArtists(targetIds) : [];
    return resolvePublicEditorialDocument({ row, relations, artists });
  } catch (error) {
    console.error("Public editorial document load failed.", error);
    return { ok: false, issues: [{ code: "data_access_failure", severity: "blocking" }] };
  }
}

