import { NextResponse } from "next/server";
import { requireAdminApiRole } from "@/lib/adminApiAuth";
import { createServiceRoleClient } from "@/lib/supabaseService";

const clean = (value: unknown) => typeof value === "string" ? value.trim() : "";
const ids = (value: unknown) => Array.isArray(value) ? value.filter((item): item is string => typeof item === "string" && Boolean(item)) : [];
const integer = (value: unknown) => Number.isInteger(Number(value)) && Number(value) >= 0 ? Number(value) : null;

export async function GET(request: Request) {
  const auth = await requireAdminApiRole(); if (auth.response) return auth.response;
  const recordingId = new URL(request.url).searchParams.get("recordingId") ?? "";
  if (!recordingId) return NextResponse.json({ ok: false, error: "recordingRequired" }, { status: 400 });
  const db = createServiceRoleClient();
  const [creditResult, roleResult, instrumentResult, sourceResult] = await Promise.all([
    db.from("recording_credits").select("id,recording_id,artist_id,external_contributor_id,role,role_id,position,credited_as,display_order,metadata,created_at,artist:artists(id,name,slug,type,primary_role),external_contributor:external_contributors(id,preferred_name,country,country_code,status),role_definition:credit_roles(id,code,display_name_en,role_family,normal_scope),recording_credit_instruments(instrument_id,sequence,instrument:instruments(id,code,display_name_en))").eq("recording_id", recordingId).order("display_order", { ascending: true, nullsFirst: false }).order("created_at", { ascending: true }).order("id", { ascending: true }),
    db.from("credit_roles").select("id,code,display_name_en,display_name_es,role_family,normal_scope,credit_role_scopes!inner(scope)").eq("status", "active").eq("credit_role_scopes.scope", "recording").order("display_order"),
    db.from("instruments").select("id,code,display_name_en,display_name_es").eq("status", "active").order("display_name_en"),
    db.from("editorial_sources").select("id,title,source_type,visibility").order("created_at", { ascending: false }).limit(30),
  ]);
  if (creditResult.error) return NextResponse.json({ ok: false, error: creditResult.error.message }, { status: 500 });
  return NextResponse.json({ ok: true, credits: creditResult.data ?? [], roles: roleResult.data ?? [], instruments: instrumentResult.data ?? [], sources: sourceResult.data ?? [] });
}

export async function POST(request: Request) {
  const auth = await requireAdminApiRole(); if (auth.response || !auth.user) return auth.response ?? NextResponse.json({ ok: false, error: "Unauthorized" }, { status: 401 });
  const body = await request.json(); const recordingId = clean(body.recordingId); const order = integer(body.displayOrder);
  if (!recordingId || !clean(body.roleId) || order == null) return NextResponse.json({ ok: false, error: "invalidCredit" }, { status: 400 });
  const result = await createServiceRoleClient().rpc("save_editorial_recording_credit", {
    actor: auth.user.id, key: clean(body.idempotencyKey) || crypto.randomUUID(), recording_uuid: recordingId,
    credit_uuid: clean(body.creditId) || null, artist_uuid: clean(body.artistId) || null,
    external_uuid: clean(body.externalContributorId) || null, role_uuid: clean(body.roleId),
    credited_as_value: clean(body.creditedAs) || null, detail_value: clean(body.creditDetail) || null,
    display_order_value: order, instrument_ids: ids(body.instrumentIds), source_ids: ids(body.sourceIds),
    internal_notes_value: clean(body.internalNotes) || null,
  });
  if (result.error) return NextResponse.json({ ok: false, error: result.error.message }, { status: result.error.code === "42501" ? 403 : 400 });
  return NextResponse.json({ ok: true, result: result.data, id: result.data?.recording_credit_id });
}

export async function PATCH(request: Request) {
  const auth = await requireAdminApiRole(); if (auth.response) return auth.response;
  const body = await request.json(); const recordingId = clean(body.recordingId); const creditIds = ids(body.creditIds);
  if (!recordingId || !creditIds.length) return NextResponse.json({ ok: false, error: "reorderInvalid" }, { status: 400 });
  const db = createServiceRoleClient(); const { data } = await db.from("recording_credits").select("id").eq("recording_id", recordingId).in("id", creditIds);
  if ((data ?? []).length !== creditIds.length) return NextResponse.json({ ok: false, error: "reorderInvalid" }, { status: 400 });
  for (let index = 0; index < creditIds.length; index += 1) { const { error } = await db.from("recording_credits").update({ display_order: index, position: index }).eq("id", creditIds[index]).eq("recording_id", recordingId); if (error) return NextResponse.json({ ok: false, error: "reorderFailed" }, { status: 500 }); }
  return NextResponse.json({ ok: true });
}

export async function DELETE(request: Request) {
  const auth = await requireAdminApiRole("admin"); if (auth.response) return auth.response;
  const body = await request.json(); const recordingId = clean(body.recordingId); const creditId = clean(body.creditId);
  if (!recordingId || !creditId) return NextResponse.json({ ok: false, error: "creditRequired" }, { status: 400 });
  const { error } = await createServiceRoleClient().from("recording_credits").delete().eq("id", creditId).eq("recording_id", recordingId);
  if (error) return NextResponse.json({ ok: false, error: "removeFailed" }, { status: 500 }); return NextResponse.json({ ok: true });
}
