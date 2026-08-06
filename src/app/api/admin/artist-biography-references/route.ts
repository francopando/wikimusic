import { NextResponse } from "next/server";
import { requireAdminApiRole } from "@/lib/adminApiAuth";
import { getArtistBiographyReferences } from "@/lib/editorial/serverLifecycle";

export async function GET(request: Request) {
  const auth = await requireAdminApiRole("editor");
  if (auth.response) return auth.response;
  const artistId = new URL(request.url).searchParams.get("artistId") ?? "";
  if (!/^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(artistId)) return NextResponse.json({ ok: false, error: "Valid artist UUID required." }, { status: 400 });
  try { return NextResponse.json({ ok: true, references: await getArtistBiographyReferences(artistId) }); }
  catch (error) { return NextResponse.json({ ok: false, error: error instanceof Error ? error.message : "Reference lookup failed." }, { status: 500 }); }
}
