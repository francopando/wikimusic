import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

import { getCatalogProfileRevalidationPaths } from "../../src/lib/revalidateCatalogProfiles";
import { getArtistProfileRevalidationPaths } from "../../src/lib/revalidateArtistProfile";

const read = (path: string) => readFileSync(path, "utf8");

const catalogRevalidation = read("src/lib/revalidateCatalogProfiles.ts");
const recordingsRoute = read("src/app/api/admin/recordings/route.ts");
const releasesRoute = read("src/app/api/admin/releases/route.ts");
const discographyRoute = read("src/app/api/admin/artist-discography/route.ts");
const tracksRoute = read("src/app/api/admin/tracks/route.ts");
const creditsRoute = read("src/app/api/admin/recording-credits/route.ts");
const platformLinksRoute = read("src/app/api/admin/platform-links/route.ts");
const mediaRoute = read("src/app/api/admin/artist-media/route.ts");
const relationshipsRoute = read("src/app/api/admin/artist-relationships/route.ts");
const familyRoute = read("src/app/api/admin/artist-family-relationships/route.ts");
const awardsRoute = read("src/app/api/admin/awards/route.ts");
const creativeWorksRoute = read("src/app/api/admin/creative-works/route.ts");
const workflowsRoute = read("src/app/api/admin/editorial-workflows/route.ts");

test("song and release profile paths cover both public locale variants", () => {
  assert.deepEqual(
    [...getCatalogProfileRevalidationPaths("songs", " la-bilirrubina ")].sort(),
    ["/en/songs/la-bilirrubina", "/es/songs/la-bilirrubina", "/songs/la-bilirrubina"],
  );
  assert.deepEqual(
    [...getCatalogProfileRevalidationPaths("releases", "bachata-rosa")].sort(),
    ["/en/releases/bachata-rosa", "/es/releases/bachata-rosa", "/releases/bachata-rosa"],
  );
  assert.equal(getCatalogProfileRevalidationPaths("songs", "  ").size, 0);
  // Same locale shape as the established Artist pattern.
  assert.equal(
    getArtistProfileRevalidationPaths("juan-luis-guerra").size,
    getCatalogProfileRevalidationPaths("songs", "x").size,
  );
});

test("revalidation helpers stay entity-scoped with no broad fan-out", () => {
  assert.match(catalogRevalidation, /revalidatePath\(path, "page"\)/);
  assert.doesNotMatch(catalogRevalidation, /revalidatePath\("\/"\)/);
  assert.doesNotMatch(catalogRevalidation, /"layout"/);
  assert.doesNotMatch(catalogRevalidation, /revalidateTag/);
});

test("recording mutations revalidate the song profile, old slug, and containing releases", () => {
  assert.match(recordingsRoute, /revalidateSongProfilePaths\(previousSlug\)/);
  assert.match(recordingsRoute, /revalidateSongProfilePaths\(slug\)/);
  assert.match(recordingsRoute, /revalidateReleasesContainingRecording\(finalRecordingId\)/);
  assert.match(recordingsRoute, /deletedRecording\?\.slug/);
});

test("release mutations revalidate the release profile, its songs, and its artist", () => {
  for (const source of [releasesRoute, discographyRoute]) {
    assert.match(source, /revalidateReleaseProfilePaths\(/);
    assert.match(source, /revalidateSongsOnRelease\(/);
    assert.match(source, /revalidateArtistProfilesByArtistIds\(/);
  }
  assert.match(releasesRoute, /previousSlug/);
  assert.match(releasesRoute, /previousArtistId/);
});

test("track, credit, and platform-link mutations revalidate their profile pages", () => {
  assert.match(tracksRoute, /revalidateReleaseProfileByReleaseId\(release\.value\)/);
  assert.match(tracksRoute, /previousReleaseId/);
  assert.match(tracksRoute, /deletedTrack\?\.release_id/);
  assert.equal((creditsRoute.match(/revalidateSongProfileByRecordingId\(recordingId\)/g) ?? []).length, 3);
  assert.match(platformLinksRoute, /revalidateSongProfileByRecordingId\(/);
});

test("artist-profile content mutations revalidate the affected artist pages", () => {
  assert.match(mediaRoute, /revalidateArtistProfilesByArtistIds\(\[payload\.artist_id\]\)/);
  assert.match(mediaRoute, /revalidateArtistProfilesByArtistIds\(\[artistId\]\)/);
  assert.match(relationshipsRoute, /source_artist_id,\s*\n\s*writePayload\.target_artist_id/);
  assert.match(familyRoute, /revalidateArtistProfilesByArtistIds\(\[artistId, relatedArtistId\]\)/);
  assert.match(awardsRoute, /artistAward/);
  assert.match(awardsRoute, /revalidateArtistProfilesByArtistIds/);
  assert.match(creativeWorksRoute, /revalidateArtistProfilesByArtistIds/);
});

test("editorial work mutations revalidate the linked song profiles", () => {
  assert.match(workflowsRoute, /revalidateSongProfileByRecordingId\(recordingId\)/);
  assert.match(workflowsRoute, /revalidateSongsLinkedToWork\(workId\)/);
});
