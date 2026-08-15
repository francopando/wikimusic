import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

import { createArtistDirectoryInitialDataKey } from "../../src/lib/artistDirectoryData";
import { PUBLIC_CATALOG_REVALIDATE_SECONDS } from "../../src/lib/publicCatalogCache";

const artistRoute = readFileSync("src/app/[locale]/artists/[slug]/page.tsx", "utf8");
const songRoute = readFileSync("src/app/[locale]/songs/[slug]/page.tsx", "utf8");
const releaseRoute = readFileSync("src/app/[locale]/releases/[slug]/page.tsx", "utf8");
const genreRoute = readFileSync("src/app/[locale]/genres/[slug]/page.tsx", "utf8");
const genreApi = readFileSync("src/lib/genreApi.ts", "utf8");
const directoryApi = readFileSync("src/lib/artistDirectoryData.ts", "utf8");
const searchApi = readFileSync("src/lib/searchApi.ts", "utf8");
const artistRevalidation = readFileSync("src/lib/revalidateArtistProfile.ts", "utf8");

test("entity profiles use ten-minute on-demand ISR without prebuilding the catalog", () => {
  assert.equal(PUBLIC_CATALOG_REVALIDATE_SECONDS, 600);

  for (const source of [artistRoute, songRoute, releaseRoute]) {
    assert.match(source, /export const revalidate = 600/);
    assert.match(source, /export function generateStaticParams\(\) \{\s*return \[\];\s*\}/);
    assert.match(source, /setRequestLocale\(/);
    assert.doesNotMatch(source, /force-dynamic|noStore|unstable_noStore/);
  }
});

test("directory cache keys are stable and isolate filters", () => {
  const first = createArtistDirectoryInitialDataKey({
    searchParams: { page: "2", genre: "merengue", sort: "name" },
    role: "musician",
  });
  const reordered = createArtistDirectoryInitialDataKey({
    searchParams: { sort: "name", genre: "merengue", page: "2" },
    role: "musician",
  });
  const otherRole = createArtistDirectoryInitialDataKey({
    searchParams: { page: "2", genre: "merengue", sort: "name" },
    role: "producer",
  });

  assert.equal(first, reordered);
  assert.notEqual(first, otherRole);
  assert.match(directoryApi, /\.eq\("status", "published"\)/);
  assert.match(directoryApi, /public-artist-directory-initial-data-v1/);
});

test("genre data caches isolate slug, subgenre, options, and media inputs", () => {
  assert.match(genreApi, /public-catalog-genre-v1/);
  assert.match(genreApi, /public-genre-artists-v1/);
  assert.match(genreApi, /public-top-genre-options-v1/);
  assert.match(genreApi, /public-genre-media-v1/);
  assert.doesNotMatch(genreApi, /public-genre-page-data-v1/);
  assert.match(genreRoute, /export const dynamic = "force-dynamic"/);
  assert.match(genreRoute, /requestedSubgenre/);
});

test("artist mutations invalidate profile paths and shared public directories", () => {
  assert.match(artistRevalidation, /revalidatePath\(path, "page"\)/);
  assert.match(artistRevalidation, /revalidateTag\(PUBLIC_ARTIST_DIRECTORY_CACHE_TAG, \{ expire: 0 \}\)/);
});

test("public search retains its separate bounded query cache", () => {
  assert.match(searchApi, /getCachedGlobalSearch = unstable_cache/);
  assert.match(searchApi, /revalidate: 300/);
});
