import { NextResponse } from "next/server";
import { requireAdminApiRole } from "@/lib/adminApiAuth";
import { upsertEditorialDocument } from "@/lib/editorial/write";
import { revalidateEditorialDocumentOwner } from "@/lib/editorial/revalidation";
import { loadEditorialDocument } from "@/lib/editorial/data";
import { validateEditorialDocument } from "@/lib/editorial/validate";
import type { EditorialLocale } from "@/types/editorialDocument";

export async function GET(request: Request) {
  const auth = await requireAdminApiRole("editor");
  if (auth.response) return auth.response;
  const { searchParams } = new URL(request.url);
  const ownerArtistId = searchParams.get("ownerArtistId") ?? "";
  const documentType = searchParams.get("documentType");
  const locale = searchParams.get("locale");
  if (documentType !== "artist_biography" || (locale !== "en" && locale !== "es") || !ownerArtistId) {
    return NextResponse.json({ ok: false, error: "A valid artist, document type, and locale are required." }, { status: 400 });
  }
  try {
    const row = await loadEditorialDocument(documentType, ownerArtistId, locale as EditorialLocale);
    if (!row) return NextResponse.json({ ok: true, exists: false });
    const validation = validateEditorialDocument(row.schema_version, row.document);
    if (!validation.ok) return NextResponse.json({ ok: false, error: "Stored editorial document failed integrity validation.", issues: validation.issues }, { status: 422 });
    return NextResponse.json({ ok: true, exists: true, document: {
      id: row.id, documentType: row.document_type, ownerArtistId: row.owner_artist_id,
      locale: row.locale, schemaVersion: row.schema_version, document: validation.document,
      status: row.status, revision: row.revision, updatedAt: row.updated_at,
    } });
  } catch (error) {
    return NextResponse.json({ ok: false, error: error instanceof Error ? error.message : "Unable to load editorial document." }, { status: 500 });
  }
}

export async function POST(request: Request) {
  const auth = await requireAdminApiRole("editor");
  if (auth.response) return auth.response;
  try {
    const result = await upsertEditorialDocument(await request.json());
    await revalidateEditorialDocumentOwner(result.ownerArtistId);
    return NextResponse.json({ ok: true, document: result });
  } catch (error) {
    const message = error instanceof Error ? error.message : "Editorial document save failed.";
    const status = message.includes("revision conflict") ? 409 : 400;
    return NextResponse.json({ ok: false, error: message }, { status });
  }
}
