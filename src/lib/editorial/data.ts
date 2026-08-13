import { createServiceRoleClient } from "@/lib/supabaseService";
import { collectEditorialReferences } from "@/lib/editorial/references";
import { validateEditorialDocument } from "@/lib/editorial/validate";
import type { EditorialLocale, SupportedEditorialDocumentType } from "@/types/editorialDocument";

export async function loadEditorialDocument(
  documentType: SupportedEditorialDocumentType,
  ownerArtistId: string,
  locale: EditorialLocale,
) {
  const { data, error } = await createServiceRoleClient()
    .from("editorial_documents")
    .select("id,document_type,owner_artist_id,locale,schema_version,document,status,revision,created_at,updated_at")
    .eq("document_type", documentType)
    .eq("owner_artist_id", ownerArtistId)
    .eq("locale", locale)
    .maybeSingle();
  if (error) throw new Error(error.message);
  if (!data) return null;
  const validation = validateEditorialDocument(data.schema_version, data.document);
  if (!validation.ok) throw new Error(`Stored editorial document failed integrity validation: ${validation.issues.map((issue) => `${issue.path}: ${issue.message}`).join("; ")}`);
  return { ...data, document: validation.document };
}

export async function loadEditorialDocumentReferences(editorialDocumentId: string) {
  const { data, error } = await createServiceRoleClient()
    .from("editorial_entity_references")
    .select("id,editorial_document_id,occurrence_id,entity_type,target_artist_id,created_at,updated_at")
    .eq("editorial_document_id", editorialDocumentId)
    .order("created_at", { ascending: true });
  if (error) throw new Error(error.message);
  return data ?? [];
}

export async function loadReverseArtistReferences(targetArtistId: string) {
  const { data, error } = await createServiceRoleClient()
    .from("editorial_entity_references")
    .select("id,editorial_document_id,occurrence_id,entity_type,target_artist_id,editorial_document:editorial_documents!inner(id,document_type,owner_artist_id,locale,status,revision)")
    .eq("target_artist_id", targetArtistId);
  if (error) throw new Error(error.message);
  return data ?? [];
}

export async function verifyEditorialDocumentIntegrity(editorialDocumentId: string) {
  const supabase = createServiceRoleClient();
  const [{ data: document, error: documentError }, { data: relations, error: relationError }] = await Promise.all([
    supabase.from("editorial_documents").select("id,schema_version,document").eq("id", editorialDocumentId).maybeSingle(),
    supabase.from("editorial_entity_references").select("occurrence_id,entity_type,target_artist_id").eq("editorial_document_id", editorialDocumentId),
  ]);
  if (documentError) throw new Error(documentError.message);
  if (relationError) throw new Error(relationError.message);
  if (!document) return { ok: false as const, reason: "document_not_found" as const };
  const expected = collectEditorialReferences(1, document.document)
    .map((reference) => `${reference.occurrenceId}|${reference.entityType}|${reference.targetArtistId}`)
    .sort();
  const actual = (relations ?? [])
    .map((reference) => `${reference.occurrence_id}|${reference.entity_type}|${reference.target_artist_id}`)
    .sort();
  return { ok: expected.length === actual.length && expected.every((value, index) => value === actual[index]), expected, actual };
}
