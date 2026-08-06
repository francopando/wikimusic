import type { EditorialDocumentRecord, EditorialDocumentV1, EditorialLocale } from "@/types/editorialDocument";

export type AdminEditorialDocumentState = Pick<EditorialDocumentRecord,
  "id" | "documentType" | "ownerArtistId" | "locale" | "schemaVersion" | "document" | "status" | "revision" | "updatedAt"
> & { exists: true };

export type AdminEditorialLoadResult =
  | { ok: true; exists: false }
  | { ok: true; exists: true; document: AdminEditorialDocumentState }
  | { ok: false; error: string; issues?: Array<{ path: string; message: string }> };

export type EditorialSavePayload = {
  documentType: "artist_biography";
  ownerArtistId: string;
  locale: EditorialLocale;
  schemaVersion: 1;
  status: "draft" | "published";
  document: EditorialDocumentV1;
  expectedRevision: number;
};

export async function saveAdminEditorialDocument(payload: EditorialSavePayload) {
  const response = await fetch("/api/admin/editorial-documents", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });
  const result = await response.json();
  return { response, result } as const;
}
