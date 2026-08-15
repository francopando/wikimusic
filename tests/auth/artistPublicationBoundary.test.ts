import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const migration = readFileSync(
  "supabase/migrations/20260819000000_enforce_artist_publication_boundary.sql",
  "utf8",
);

test("artist public reads are restricted to published rows for anon and authenticated", () => {
  assert.match(
    migration,
    /CREATE POLICY artists_public_select[\s\S]*?TO anon, authenticated[\s\S]*?USING \(status = 'published'\)/,
  );
  assert.doesNotMatch(
    migration,
    /CREATE POLICY artists_public_select[\s\S]*?USING \(true\)/,
  );
});

test("historical permissive artist policies are removed before the replacement", () => {
  for (const policy of [
    '"Allow public read"',
    '"Allow read artists"',
    '"Public artists are viewable"',
    "artists_public_select",
  ]) {
    assert.match(migration, new RegExp(`DROP POLICY IF EXISTS ${policy}`));
  }

  assert.match(migration, /Unexpected effective artists SELECT policy set/);
});

test("the owner-evaluated recording identity view remains service-role only", () => {
  assert.match(
    migration,
    /REVOKE ALL PRIVILEGES ON TABLE public\.recording_identity_summary[\s\S]*?FROM anon, authenticated/,
  );
  assert.match(
    migration,
    /GRANT SELECT ON TABLE public\.recording_identity_summary TO service_role/,
  );
});
