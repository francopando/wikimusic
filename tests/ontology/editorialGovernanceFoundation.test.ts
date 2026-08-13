import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const migration=readFileSync("supabase/migrations/20260809000000_editorial_governance_foundation.sql","utf8");
test("governance foundation uses typed entity links and private RLS",()=>{
  assert.match(migration,/CREATE TABLE public\.editorial_assertion_recordings/);
  assert.match(migration,/REFERENCES public\.recordings\(id\) ON DELETE RESTRICT/);
  assert.doesNotMatch(migration,/entity_type\s+text[\s\S]*entity_id/);
  assert.match(migration,/REVOKE ALL ON TABLE public\.%I FROM PUBLIC, anon, authenticated/);
});
test("approved assertion and evidence vocabularies are constrained",()=>{
  for(const state of ["unverified","under_review","verified","disputed","rejected","superseded"]) assert.match(migration,new RegExp(`'${state}'`));
  for(const relation of ["supports","disputes","contextualizes"]) assert.match(migration,new RegExp(`'${relation}'`));
});
test("independent approval and redirect cycles are database enforced",()=>{
  assert.match(migration,/approved_by <> requested_by/);
  assert.match(migration,/prevent_identity_redirect_cycle/);
  assert.match(migration,/identity redirect cycle is not allowed/);
});
