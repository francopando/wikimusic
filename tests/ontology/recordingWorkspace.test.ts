import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const migration = readFileSync("supabase/migrations/20260813000000_recording_workspace.sql", "utf8");
const api = readFileSync("src/app/api/admin/recordings/route.ts", "utf8");
const creditApi = readFileSync("src/app/api/admin/recording-credits/route.ts", "utf8");
const page = readFileSync("src/app/admin/(protected)/catalog/recordings/page.tsx", "utf8");
const credits = readFileSync("src/components/admin/RecordingCreditsManager.tsx", "utf8");

test("Recording search is canonical-row based and workspace search is catalog-wide", () => {
  assert.match(api, /from\("recordings"\)\.select\(RECORDING_FIELDS\)/);
  assert.match(api, /new Map\(rows\.map\(\(row\) => \[row\.id, row\]\)\)/);
  assert.match(page, /Always searches the complete Recording catalog/);
  assert.doesNotMatch(page, /extraParams=\{scopedRecordingParams\}/);
});

test("workspace separates Recording year from track-derived Release appearances", () => {
  assert.match(page, /Never inferred from a Release year/);
  assert.match(page, /Derived exclusively from Tracks/);
  assert.match(api, /from\("tracks"\)/);
  assert.match(page, /\/admin\/catalog\/releases\?releaseId=/);
});

test("Work is displayed and changed only through the governed Work workflow", () => {
  assert.match(page, /canonicalWork \?/);
  assert.match(page, /No Work linked/);
  assert.match(page, /\/admin\/authoritative-works\?workId=/);
  assert.match(page, /recordingId=\$\{encodeURIComponent/);
  assert.doesNotMatch(api, /work_id:\s*work\.value/);
});

test("Recording Credit save requires controlled Recording scope and exclusive identity", () => {
  assert.match(migration, /credit_role_scopes s ON s\.role_id=r\.id AND s\.scope='recording'/);
  assert.match(migration, /num_nonnulls\(artist_uuid,external_uuid\)<>1/);
  assert.match(creditApi, /save_editorial_recording_credit/);
  assert.doesNotMatch(creditApi, /const ROLES = new Set/);
});

test("Work-only composition roles are excluded and legacy rows are flagged", () => {
  assert.match(credits, /Composer, songwriter, and lyricist are managed by the Composition/);
  assert.match(credits, /legacy Work-scope role/);
  assert.match(migration, /role is not allowed at Recording scope/);
});

test("instrument model is controlled, relational, and supports multiple instruments", () => {
  assert.match(migration, /CREATE TABLE public\.instruments/);
  assert.match(migration, /PRIMARY KEY\(recording_credit_id,instrument_id\)/);
  assert.match(migration, /FOREACH instrument_uuid IN ARRAY/);
  assert.match(migration, /new pianist credits use instrumentalist plus the piano instrument/);
});

test("governed credits integrate evidence, decisions, audit, and idempotency", () => {
  for (const token of ["editorial_assertion_recording_credits", "editorial_assertion_evidence", "editorial_decisions", "editorial_audit_events", "editorial_idempotency_keys"]) assert.match(migration, new RegExp(token));
});

test("workspace displays normalized ISRCs and never resolves conflicts", () => {
  assert.match(api, /recording_isrcs/);
  assert.match(api, /recording_isrc_conflicts/);
  assert.match(page, /Known unresolved conflict/);
  assert.doesNotMatch(page, /resolveConflict|conflict\.resolve/);
});

test("credit editor supports Artist and External Contributor navigation and creation", () => {
  assert.match(credits, /Mangulina Artists/); assert.match(credits, /External Contributors/); assert.match(credits, /Add External Contributor/);
  assert.match(credits, /\/admin\/artists\?artistId=/); assert.match(credits, /\/admin\/external-contributors\?id=/);
});

test("workspace presents the editorial recording workflow without moving semantic ownership", () => {
  for (const label of ["Selected Recording", "Link / Create Work", "Add Recording Credit", "Review Recording Identity", "Composition", "Composition Credits", "Managed by the Work", "Known ISRC Assignments", "Technical Information", "Advanced Editorial Tools"]) assert.match(page, new RegExp(label));
  assert.match(page, /work\.unlink/);
  assert.match(page, /Release Group/);
  assert.match(page, /countryLabel/);
  assert.match(api, /composition_credits/);
  assert.match(api, /country,packaging/);
});

test("Recording Credit guidance distinguishes Work roles and multi-scope arrangement", () => {
  assert.match(credits, /Composition authorship belongs to the Work/);
  assert.match(credits, /Open Work Credits/);
  assert.match(credits, /Arranger can describe the composition or this specific recorded version/);
  assert.match(credits, /recording_credit_instruments/);
});
