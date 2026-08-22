import assert from "node:assert/strict";
import { existsSync, readFileSync } from "node:fs";
import test from "node:test";

import {
  PUBLIC_ARTIST_DIRECTORY_REVALIDATE_SECONDS,
  PUBLIC_ARTIST_DIRECTORY_CACHE_TAG,
} from "../../src/lib/publicCatalogCache";

const read = (p: string) => readFileSync(p, "utf8");

/** Source with comments removed, so prose about searchParams cannot pass or fail a check. */
const code = (source: string) =>
  source.replace(/\/\*[\s\S]*?\*\//g, "").replace(/^\s*\/\/.*$/gm, "");

const DIRECTORY_ROUTES = [
  "artists",
  "composers",
  "lyricists",
  "songwriters",
  "musicians",
  "djs",
  "producers",
  "arrangers",
  "musical-directors",
  "christian",
  "instrumental-classical",
  "artists/legends",
  "artists/emerging",
];

const routeSources = new Map(
  DIRECTORY_ROUTES.map((r) => [r, read(`src/app/[locale]/${r}/page.tsx`)]),
);
const shell = read("src/components/artists/ArtistRoleDirectoryPage.tsx");
const directoryData = read("src/lib/artistDirectoryData.ts");
const artistRevalidation = read("src/lib/revalidateArtistProfile.ts");
const artistProfile = read("src/app/[locale]/artists/[slug]/page.tsx");
const mostAwarded = read("src/app/[locale]/artists/most-awarded/page.tsx");
const statusShell = read("src/components/artists/ArtistStatusDirectoryPage.tsx");

test("canonical directories are cacheable and never read searchParams", () => {
  for (const [name, source] of routeSources) {
    assert.doesNotMatch(code(source), /searchParams/, `${name} must not read searchParams`);
    assert.doesNotMatch(code(source), /force-dynamic|no-store|unstable_noStore/, `${name} stays cacheable`);
    assert.match(source, /export const revalidate = 86400/, `${name} declares the fallback TTL`);
  }
  assert.doesNotMatch(code(shell), /searchParams/, "the role shell must not read searchParams");
  assert.doesNotMatch(code(statusShell), /searchParams/, "the status shell must not read searchParams");
});

test("route TTL matches the directory data TTL so it is not silently capped", () => {
  // Next.js resolves a route's revalidate as the minimum across everything it
  // reads; a shorter data TTL would quietly cap these routes (as happened in
  // Phases 2 and 3A).
  assert.equal(PUBLIC_ARTIST_DIRECTORY_REVALIDATE_SECONDS, 86400);
  assert.match(directoryData, /revalidate: PUBLIC_ARTIST_DIRECTORY_REVALIDATE_SECONDS/);
  for (const [, source] of routeSources) {
    const declared = /export const revalidate = (\d+)/.exec(source);
    assert.ok(declared);
    assert.equal(Number(declared[1]), PUBLIC_ARTIST_DIRECTORY_REVALIDATE_SECONDS);
  }
});

test("filter, page and sort state cannot create Full Route Cache entries", () => {
  // The server ignores the query string entirely, so /artists, /artists?page=3
  // and /artists?foo=bar all resolve to one cached entry.
  for (const [name, source] of routeSources) {
    assert.doesNotMatch(code(source), /page=|sort=|province=|occupation=/, `${name} has no server-side filter parsing`);
  }
  // The bounded data cache key no longer receives a raw query string.
  assert.doesNotMatch(code(shell), /searchParams/);
});

test("directory data cache and its invalidation remain intact", () => {
  assert.match(directoryData, /unstable_cache/);
  assert.match(directoryData, /public-artist-directory-initial-data-v1/);
  assert.match(directoryData, /tags: \[PUBLIC_ARTIST_DIRECTORY_CACHE_TAG\]/);
  assert.match(directoryData, /\.eq\("status", "published"\)/, "publication filter preserved");
  // Artist mutations already invalidate the directory; the long TTL depends on it.
  assert.equal(PUBLIC_ARTIST_DIRECTORY_CACHE_TAG, "public-artist-directories");
  assert.match(
    artistRevalidation,
    /revalidateTag\(PUBLIC_ARTIST_DIRECTORY_CACHE_TAG, \{ expire: 0 \}\)/,
  );
});

test("role identity and locale coverage are preserved", () => {
  assert.match(routeSources.get("composers")!, /ARTIST_ROLE_PAGES\.composers/);
  assert.match(routeSources.get("christian")!, /fixedContext="christian"/);
  assert.match(routeSources.get("instrumental-classical")!, /role="instrumentalist"/);
  for (const [name, source] of routeSources) {
    assert.match(source, /generateMetadata|ARTIST_ROLE_PAGES/, `${name} keeps its metadata identity`);
  }
  // Every directory route resolves to a real page on disk (nested ones included).
  for (const r of DIRECTORY_ROUTES) {
    assert.ok(existsSync(`src/app/[locale]/${r}/page.tsx`), `${r} route exists`);
  }
});

test("Phase 1 artist profile architecture is untouched", () => {
  assert.match(artistProfile, /export const revalidate = 86400/);
  assert.match(artistProfile, /export function generateStaticParams\(\) \{\s*return \[\];\s*\}/);
});

test("most-awarded stays dynamic but keeps a bounded cache key", () => {
  // ?award= is validated against a bounded option list and drives server-side
  // rankings, so this page is legitimately dynamic. What it must not do is
  // feed an arbitrary query string into the shared directory cache key.
  assert.match(code(mostAwarded), /searchParams/, "award filter is genuinely server-side");
  assert.match(code(mostAwarded), /awardOptions\.some/, "award value is validated against a bounded list");
  assert.doesNotMatch(
    code(mostAwarded),
    /getArtistDirectoryInitialData\(\{\s*searchParams/,
    "raw query string must not enter the directory cache key",
  );
});
