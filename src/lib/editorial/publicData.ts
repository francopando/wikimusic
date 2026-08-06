import "server-only";

import { cache } from "react";
import { getSupabaseServiceClient } from "@/lib/adminAccess";
import { loadPublishedEditorialDocument } from "@/lib/editorial/publicDataCore";
import { editorialDocumentToPlainText } from "@/lib/editorial/plainText";
import type { PublicEditorialDataSource } from "@/lib/editorial/publicDataCore";
import type { EditorialLocale, SupportedEditorialDocumentType } from "@/types/editorialDocument";
import type {
  PublicEditorialArtistRow,
  PublicEditorialDocumentRow,
  PublicEditorialRelationRow,
} from "@/lib/editorial/resolve";

const supabaseSource: PublicEditorialDataSource = {
  async findPublishedDocument(input) {
    const { data, error } = await getSupabaseServiceClient()
      .from("editorial_documents")
      .select("id,document_type,owner_artist_id,locale,schema_version,document,revision")
      .eq("document_type", input.documentType)
      .eq("owner_artist_id", input.ownerArtistId)
      .eq("locale", input.locale)
      .eq("status", "published")
      .maybeSingle();
    if (error) throw new Error(error.message);
    return data as PublicEditorialDocumentRow | null;
  },
  async findRelations(documentId) {
    const { data, error } = await getSupabaseServiceClient()
      .from("editorial_entity_references")
      .select("occurrence_id,entity_type,target_artist_id")
      .eq("editorial_document_id", documentId);
    if (error) throw new Error(error.message);
    return (data ?? []) as PublicEditorialRelationRow[];
  },
  async findArtists(artistIds) {
    const { data, error } = await getSupabaseServiceClient()
      .from("artists")
      .select("id,slug,status")
      .in("id", artistIds);
    if (error) throw new Error(error.message);
    return (data ?? []) as PublicEditorialArtistRow[];
  },
};

export const getPublishedEditorialDocument = cache(
  async (input: {
    documentType: SupportedEditorialDocumentType;
    ownerArtistId: string;
    locale: EditorialLocale;
  }) => loadPublishedEditorialDocument(supabaseSource, input),
);

export const getPublishedEditorialPlainText = cache(async (ownerArtistId: string, locale: EditorialLocale) => {
  const result = await getPublishedEditorialDocument({ documentType: "artist_biography", ownerArtistId, locale });
  return result?.ok ? editorialDocumentToPlainText(result.value.document) : null;
});
