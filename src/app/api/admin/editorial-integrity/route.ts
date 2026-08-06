import { NextResponse } from "next/server";
import { requireAdminApiRole } from "@/lib/adminApiAuth";
import { getEditorialIntegrityReport } from "@/lib/editorial/serverLifecycle";

export async function GET() {
  const auth = await requireAdminApiRole("editor");
  if (auth.response) return auth.response;
  try { return NextResponse.json({ ok: true, report: await getEditorialIntegrityReport() }); }
  catch (error) { return NextResponse.json({ ok: false, error: error instanceof Error ? error.message : "Integrity report failed." }, { status: 500 }); }
}
