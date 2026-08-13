import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const migration = readFileSync(
  "supabase/migrations/20260807000000_harden_database_authorization.sql",
  "utf8",
);
const uploadRoute = readFileSync("src/app/api/admin/image-upload/route.ts", "utf8");
const artistAdmin = readFileSync("src/app/admin/artists/page.tsx", "utf8");
const contributorAdmin = readFileSync(
  "src/app/admin/contributors/ContributorsAdminClient.tsx",
  "utf8",
);

test("Phase 2 removes confirmed direct authenticated catalog writes", () => {
  assert.match(migration, /DROP POLICY IF EXISTS "Allow authenticated insert artists"/);
  assert.match(migration, /DROP POLICY IF EXISTS "Allow authenticated write featured artist"/);
  assert.match(migration, /DROP POLICY IF EXISTS release_artists_manage_admin/);
  assert.doesNotMatch(migration, /CREATE POLICY release_artists_manage_admin/);
});

test("database staff helpers use active auth.uid membership with hardened definitions", () => {
  assert.match(migration, /CREATE OR REPLACE FUNCTION public\.current_staff_role\(\)/);
  assert.match(migration, /STABLE\s+SECURITY DEFINER\s+SET search_path = ''/);
  assert.match(migration, /member\.user_id = auth\.uid\(\)/);
  assert.match(migration, /member\.status = 'active'/);
  assert.doesNotMatch(migration, /user_metadata/);
});

test("client mutation grants and sensitive table exposure are revoked", () => {
  assert.match(migration, /REVOKE INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER/);
  assert.match(migration, /public\.admin_members,[\s\S]*public\.admin_invites/);
  assert.match(migration, /FROM anon, authenticated/);
});

test("image writes use an authorized decode-and-reencode API only", () => {
  const guardIndex = uploadRoute.indexOf("requireAdminApiRole");
  const serviceIndex = uploadRoute.indexOf("createServiceRoleClient()", guardIndex);
  assert.ok(guardIndex >= 0 && serviceIndex > guardIndex);
  assert.match(uploadRoute, /ALLOWED_INPUT_FORMATS = new Set\(\["jpeg", "png", "webp"\]\)/);
  assert.match(uploadRoute, /\.webp\(\{ quality: 88 \}\)/);
  assert.match(uploadRoute, /MAX_SOURCE_BYTES/);
  assert.match(migration, /allowed_mime_types = ARRAY\['image\/webp'\]/);
  assert.doesNotMatch(artistAdmin, /\.storage\s*\.from\("artists-images"\)/);
  assert.doesNotMatch(contributorAdmin, /\.storage\s*\.from\("contributors-images"\)/);
});
