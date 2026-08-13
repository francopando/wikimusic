import "server-only";
import { createServiceRoleClient } from "@/lib/supabaseService";
import { buildEditorialIntegrityReport } from "@/lib/editorial/integrity";
import { reassignArtistReferences } from "@/lib/editorial/lifecycle";
import { revalidateEditorialDocumentOwner, revalidateEditorialDocumentsReferencingArtist } from "@/lib/editorial/revalidation";
import { upsertEditorialDocument } from "@/lib/editorial/write";
import { validateEditorialDocument } from "@/lib/editorial/validate";
import { allEditorialInlineNodes } from "@/lib/editorial/documentTree";
import type { EditorialDocumentV1 } from "@/types/editorialDocument";

export async function getArtistBiographyReferences(artistId: string) {
  const supabase = createServiceRoleClient();
  const { data, error } = await supabase.from("editorial_entity_references")
    .select("occurrence_id,target_artist_id,editorial_document:editorial_documents!inner(id,owner_artist_id,locale,document,status,revision,schema_version)")
    .eq("target_artist_id", artistId);
  if (error) throw new Error(error.message);
  const rows = data ?? [];
  const ownerIds = [...new Set(rows.flatMap((row) => {
    const document = Array.isArray(row.editorial_document) ? row.editorial_document[0] : row.editorial_document;
    return document?.owner_artist_id ? [document.owner_artist_id] : [];
  }))];
  const { data: owners, error: ownerError } = ownerIds.length ? await supabase.from("artists").select("id,name,slug").in("id", ownerIds) : { data: [], error: null };
  if (ownerError) throw new Error(ownerError.message);
  const ownerById = new Map((owners ?? []).map((owner) => [owner.id, owner]));
  return rows.flatMap((row) => {
    const document = Array.isArray(row.editorial_document) ? row.editorial_document[0] : row.editorial_document;
    if (!document?.owner_artist_id) return [];
    const validation = validateEditorialDocument(document.schema_version, document.document);
    const visible = validation.ok ? allEditorialInlineNodes(validation.document).find((node) => node.type === "artistReference" && node.attrs.occurrenceId === row.occurrence_id) : undefined;
    const owner = ownerById.get(document.owner_artist_id);
    return [{ documentId: document.id, biographyOwnerId: document.owner_artist_id, biographyOwnerName: owner?.name ?? "Unknown artist", ownerSlug: owner?.slug ?? null, locale: document.locale, occurrenceId: row.occurrence_id, visibleWording: visible?.type === "artistReference" ? visible.attrs.displayText : "", status: document.status }];
  });
}

export async function getEditorialIntegrityReport() {
  const supabase = createServiceRoleClient();
  const [documentsResult, relationsResult, artistsResult] = await Promise.all([
    supabase.from("editorial_documents").select("id,document_type,owner_artist_id,locale,schema_version,document,status"),
    supabase.from("editorial_entity_references").select("editorial_document_id,occurrence_id,entity_type,target_artist_id"),
    supabase.from("artists").select("id,name,slug,status,bio_en,bio_es"),
  ]);
  for (const result of [documentsResult, relationsResult, artistsResult]) if (result.error) throw new Error(result.error.message);
  return buildEditorialIntegrityReport({ documents: documentsResult.data ?? [], relations: relationsResult.data ?? [], artists: artistsResult.data ?? [] });
}

export async function mergeArtistBiographyReferences(sourceArtistId: string, targetArtistId: string) {
  if (!sourceArtistId || !targetArtistId || sourceArtistId === targetArtistId) throw new Error("Distinct source and target artist UUIDs are required.");
  const references = await getArtistBiographyReferences(sourceArtistId);
  const documentIds = [...new Set(references.map((reference) => reference.documentId))];
  const supabase = createServiceRoleClient();
  const { data: documents, error } = documentIds.length ? await supabase.from("editorial_documents").select("id,document_type,owner_artist_id,locale,schema_version,document,status,revision").in("id", documentIds) : { data: [], error: null };
  if (error) throw new Error(error.message);
  for (const row of documents ?? []) {
    const validation = validateEditorialDocument(row.schema_version, row.document);
    if (!validation.ok) throw new Error(`Cannot merge references in invalid document ${row.id}.`);
    const updated = reassignArtistReferences(validation.document as EditorialDocumentV1, sourceArtistId, targetArtistId);
    await upsertEditorialDocument({ documentType: "artist_biography", ownerArtistId: row.owner_artist_id, locale: row.locale, schemaVersion: 1, status: row.status, document: updated, expectedRevision: row.revision });
    await revalidateEditorialDocumentOwner(row.owner_artist_id);
  }
  await Promise.all([revalidateEditorialDocumentsReferencingArtist(sourceArtistId), revalidateEditorialDocumentsReferencingArtist(targetArtistId)]);
  return { documentsUpdated: documentIds.length, occurrencesUpdated: references.length };
}
