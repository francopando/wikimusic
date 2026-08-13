import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const sql = readFileSync("supabase/migrations/20260812000000_external_contributors_foundation.sql", "utf8");
const workflow = readFileSync("src/app/admin/authoritative-works/page.tsx", "utf8");
const songCredits = readFileSync("src/components/organisms/SongCreditsSection.tsx", "utf8");
const publicQuery = readFileSync("src/lib/queries/songs.ts", "utf8");

test("credits enforce exactly one canonical identity domain", () => {
  assert.match(sql, /work_credits_exactly_one_contributor CHECK\(num_nonnulls\(artist_id,external_contributor_id\)=1\)/);
  assert.match(sql, /recording_credits_exactly_one_contributor CHECK\(num_nonnulls\(artist_id,external_contributor_id\)=1\)/);
});

test("external contributor creation is governed, evidenced, audited, and idempotent", () => {
  for (const token of ["require_editorial_capability", "possible_duplicates", "editorial_assertion_evidence", "editorial_audit_events", "editorial_idempotency_keys"]) assert.match(sql, new RegExp(token));
  assert.match(sql, /external_contributor\.create/);
  assert.match(sql, /external_contributor\.edit/);
});

test("public projection is minimal and the internal table is not public", () => {
  assert.match(sql, /get_public_recording_credits/);
  assert.match(sql, /REVOKE ALL ON public\.external_contributors/);
  assert.doesNotMatch(sql.match(/RETURNS TABLE\(role text,identity_type text,identity_id uuid,display_name text,artist_slug text,country text\)/)?.[0] ?? "", /notes|metadata|source/);
  assert.match(publicQuery, /get_public_recording_credits/);
});

test("authoritative workflow separates identities and supports in-context creation", () => {
  for (const label of ["Mangulina Artists", "External Contributors", "Add External Contributor", "Create and select"]) assert.match(workflow, new RegExp(label));
  assert.match(workflow, /credit\.create\.external/);
});

test("external song credit opens an accessible dialog and never an artist link", () => {
  assert.match(songCredits, /externalContributorId/);
  assert.match(songCredits, /role="dialog"/);
  assert.match(songCredits, /aria-modal="true"/);
  assert.match(songCredits, /event\.key === "Escape"/);
});
