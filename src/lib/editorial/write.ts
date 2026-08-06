import { getSupabaseServiceClient } from "@/lib/adminAccess";
import { collectEditorialReferences } from "@/lib/editorial/references";
import { validateEditorialDocument } from "@/lib/editorial/validate";
import { routing } from "@/i18n/routing";
import type {
  EditorialDocumentRecord,
  EditorialLocale,
  SupportedEditorialDocumentType,
} from "@/types/editorialDocument";

export type UpsertEditorialDocumentInput = {
  documentType: SupportedEditorialDocumentType;
  ownerArtistId: string;
  locale: EditorialLocale;
  schemaVersion: 1;
  status: "draft" | "published";
  document: unknown;
  expectedRevision: number;
};

export async function upsertEditorialDocument(input: UpsertEditorialDocumentInput) {
  if (input.documentType !== "artist_biography") throw new Error("Unsupported editorial document type.");
  if (!routing.locales.some((locale) => locale === input.locale)) throw new Error("Unsupported editorial locale.");
  if (!Number.isInteger(input.expectedRevision) || input.expectedRevision < 0) {
    throw new Error("Expected revision must be zero for create or positive for update.");
  }
  const validation = validateEditorialDocument(input.schemaVersion, input.document);
  if (!validation.ok) {
    throw new Error(validation.issues.map((issue) => `${issue.path}: ${issue.message}`).join("; "));
  }
  const references = collectEditorialReferences(input.schemaVersion, validation.document);

  const supabase = getSupabaseServiceClient();
  if (input.status === "published" && references.length) {
    const targetIds = [...new Set(references.map((reference) => reference.targetArtistId))];
    const { data: targets, error: targetError } = await supabase.from("artists").select("id").in("id", targetIds);
    if (targetError) throw new Error(targetError.message);
    const found = new Set((targets ?? []).map((target) => target.id));
    const missing = targetIds.filter((id) => !found.has(id));
    if (missing.length) throw new Error(`Publication blocked: ${missing.length} artist reference target${missing.length === 1 ? " is" : "s are"} missing.`);
  }
  const { data, error } = await supabase.rpc("upsert_editorial_document", {
    p_document_type: input.documentType,
    p_owner_artist_id: input.ownerArtistId,
    p_locale: input.locale,
    p_schema_version: input.schemaVersion,
    p_status: input.status,
    p_document: validation.document,
    p_expected_revision: input.expectedRevision,
  });
  if (error) {
    if (error.code === "40001") throw new Error("Editorial document revision conflict.");
    throw new Error(error.message);
  }
  const row = Array.isArray(data) ? data[0] : data;
  if (!row) throw new Error("Editorial document write returned no result.");
  return {
    id: row.id,
    documentType: row.document_type,
    ownerArtistId: row.owner_artist_id,
    locale: row.locale,
    schemaVersion: row.schema_version,
    status: row.status,
    revision: row.revision,
    updatedAt: row.updated_at,
  } as Pick<EditorialDocumentRecord, "id" | "documentType" | "ownerArtistId" | "locale" | "schemaVersion" | "status" | "revision" | "updatedAt">;
}
