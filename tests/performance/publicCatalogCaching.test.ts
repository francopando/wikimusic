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

test("entity profiles use long fallback ISR with on-demand editorial revalidation", () => {
  assert.equal(PUBLIC_CATALOG_REVALIDATE_SECONDS, 600);

  for (const source of [artistRoute, songRoute, releaseRoute]) {
    // 7d is a fallback safety net only: admin mutation routes revalidate the
    // affected profile paths immediately (see revalidateCatalogProfiles.ts),
    // and /api/revalidate covers work written straight to Postgres.
    //
    // The value is deliberately long. These three routes cover ~41,700
    // cacheable URLs across both locales, so the clock — not editorial
    // activity — sets the ISR write bill: at 24h it projected past 1.2M
    // writes/month, at 7d it is roughly 179K. Freshness must keep coming from
    // those two paths; a week only bounds how long a missed one can persist.
    assert.match(source, /export const revalidate = 604800/);
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
  assert.match(directoryApi, /public-artist-directory-initial-data-v\d+/);
});

test("genre data caches isolate slug, subgenre, options, and media inputs", () => {
  // Version suffixes are cache-busting handles and change by design; assert
  // the cache exists rather than which generation it is on.
  assert.match(genreApi, /public-catalog-genre-v\d+/);
  assert.match(genreApi, /public-genre-artists-v\d+/);
  assert.match(genreApi, /public-top-genre-options-v\d+/);
  assert.match(genreApi, /public-genre-media-v\d+/);
  assert.doesNotMatch(genreApi, /public-genre-page-data-v\d+/);
  // Phase 3A moved genre profiles into the Full Route Cache: the route no
  // longer opts out of caching, and subgenre state moved to the client.
  // Detailed coverage lives in genreProfileCaching.test.ts.
  assert.doesNotMatch(genreRoute, /export const dynamic = "force-dynamic"/);
  assert.match(genreRoute, /export const revalidate = 86400/);
});

test("artist mutations invalidate profile paths and shared public directories", () => {
  assert.match(artistRevalidation, /revalidatePath\(path, "page"\)/);
  assert.match(artistRevalidation, /revalidateTag\(PUBLIC_ARTIST_DIRECTORY_CACHE_TAG, \{ expire: 0 \}\)/);
});

test("public search retains its separate bounded query cache", () => {
  // Phase 3D wrapped the cache so its key is bounded; detailed coverage lives
  // in provinceAndSearchCaching.test.ts.
  assert.match(searchApi, /cachedGlobalSearchByKey = unstable_cache/);
  assert.match(searchApi, /revalidate: 300/);
  assert.match(searchApi, /searchCacheKey\(query\)/);
});
