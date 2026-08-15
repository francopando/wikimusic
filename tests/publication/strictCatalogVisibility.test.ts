import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { join } from "node:path";
import test from "node:test";

import {
  chunkForPublicVisibility,
  isPublicArtistReference,
  PUBLIC_VISIBILITY_BATCH_SIZE,
} from "../../src/lib/publicRecordingVisibility";

const root = process.cwd();

test("stable artist references preserve null ownership and enforce publication", () => {
  const published = new Set(["published-artist"]);
  assert.equal(isPublicArtistReference(null, published), true);
  assert.equal(isPublicArtistReference("published-artist", published), true);
  assert.equal(isPublicArtistReference("needs-review-artist", published), false);
  assert.equal(isPublicArtistReference("hidden-artist", published), false);
});

test("visibility batching preserves every ID across multiple boundaries", () => {
  const ids = Array.from({ length: PUBLIC_VISIBILITY_BATCH_SIZE * 2 + 5 }, (_, index) => `id-${index}`);
  const batches = chunkForPublicVisibility(ids);
  assert.deepEqual(batches.map((batch) => batch.length), [250, 250, 5]);
  assert.deepEqual(batches.flat(), ids);
});

test("archive RPC aggregates base-table ownership with strict publication semantics", () => {
  const sql = readFileSync(join(root, "supabase/migrations/20260820000000_optimize_archive_year_counts.sql"), "utf8");
  assert.match(sql, /SECURITY INVOKER/);
  assert.match(sql, /release\.release_artist_id IS NULL OR artist\.status = 'published'/);
  assert.doesNotMatch(sql, /recordings_with_release_info/);
});

test("public surfaces use stable recording or release ownership", () => {
  const song = readFileSync(join(root, "src/lib/queries/songs.ts"), "utf8");
  const release = readFileSync(join(root, "src/lib/releaseApi.ts"), "utf8");
  const genre = readFileSync(join(root, "src/lib/getSongsBySubgenre.ts"), "utf8");
  const home = readFileSync(join(root, "src/lib/homeApi.ts"), "utf8");
  const archive = readFileSync(join(root, "src/lib/getSongsByYear.ts"), "utf8");
  assert.match(song, /isPublicRecording\(cleanId\)/);
  assert.match(release, /isPublicReleaseArtist\(releaseRow\.release_artist_id\)/);
  assert.match(genre, /getPublicRecordingIds/);
  assert.match(home, /getPublicRecordingIds/);
  assert.match(archive, /getPublicRecordingIds/);
});
