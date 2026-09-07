import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

import {
  MAX_SLUGS_PER_ENTITY,
  parseRevalidationRequest,
} from "../../src/lib/revalidationRequest";

const route = readFileSync("src/app/api/revalidate/route.ts", "utf8");
const artistRevalidation = readFileSync("src/lib/revalidateArtistProfile.ts", "utf8");

test("a revalidation request names what changed", () => {
  const parsed = parseRevalidationRequest({
    songs: ["ojala-que-llueva-cafe", " bachata-rosa "],
    releases: ["bachata-rosa"],
  });

  assert.ok(parsed.ok);
  assert.deepEqual(parsed.request.songs, ["ojala-que-llueva-cafe", "bachata-rosa"]);
  assert.deepEqual(parsed.request.releases, ["bachata-rosa"]);
  assert.deepEqual(parsed.request.artists, []);
  assert.equal(parsed.request.allArtists, false);
});

test("duplicate slugs collapse so a batch cannot revalidate the same path twice", () => {
  const parsed = parseRevalidationRequest({ artists: ["a", "a", "b"] });

  assert.ok(parsed.ok);
  assert.deepEqual(parsed.request.artists, ["a", "b"]);
});

// A silent no-op would let a broken editorial script report success while the
// catalogue kept serving stale pages.
test("an empty request is rejected rather than reported as a no-op success", () => {
  for (const body of [{}, { artists: [] }, { allArtists: false, songs: [] }]) {
    const parsed = parseRevalidationRequest(body);
    assert.equal(parsed.ok, false);
  }

  const allArtists = parseRevalidationRequest({ allArtists: true });
  assert.ok(allArtists.ok, "allArtists alone is a complete request");
  assert.equal(allArtists.request.allArtists, true);
});

test("malformed payloads are refused", () => {
  for (const body of [
    null,
    "artists",
    ["juan-luis-guerra"],
    { artists: "juan-luis-guerra" },
    { songs: [42] },
    { releases: ["  "] },
    { allArtists: "yes" },
  ]) {
    const parsed = parseRevalidationRequest(body);
    assert.equal(parsed.ok, false, `${JSON.stringify(body)} must be refused`);
  }
});

test("oversized batches are refused so the client splits them", () => {
  const slugs = Array.from({ length: MAX_SLUGS_PER_ENTITY + 1 }, (_, i) => `s${i}`);
  const parsed = parseRevalidationRequest({ songs: slugs });

  assert.equal(parsed.ok, false);
  const withinLimit = parseRevalidationRequest({ songs: slugs.slice(0, MAX_SLUGS_PER_ENTITY) });
  assert.ok(withinLimit.ok);
});

// The route is reachable without a Supabase session, so its authentication is
// the only thing standing in front of it.
test("the route is fail-closed and compares the token in constant time", () => {
  assert.match(route, /const expected = process\.env\.REVALIDATION_TOKEN;/);
  assert.match(route, /if \(!expected\) return false;/, "unset token must refuse everything");
  assert.match(route, /timingSafeEqual/);
  assert.match(route, /createHash\("sha256"\)/, "hash first so lengths always match");
  assert.match(route, /status: 401/);
  assert.doesNotMatch(route, /searchParams\.get\(["']token/, "token must not travel in the URL");
  assert.match(route, /export const dynamic = "force-dynamic"/);
});

test("allArtists sweeps the shared tags without inventing a slug", () => {
  assert.match(route, /revalidateAllArtistProfiles\(\)/);
  assert.doesNotMatch(
    route,
    /revalidateArtistProfilePaths\("all"\)/,
    "a sentinel slug would revalidate a path that does not exist",
  );
  assert.match(artistRevalidation, /export function revalidateAllArtistProfiles\(\)/);
});

// This assertion is the reverse of what it used to be, and the reversal is the
// point. It previously required per-slug revalidation to keep sweeping the
// shared tags, on the reasoning that the portfolio cache is read by every
// profile so any change had to clear all of them.
//
// The cost of that was never measured until it was: an ISR write unit is 8 KB
// and a profile rebuild writes ~34 KB, so sweeping rebuilt the whole artist
// catalogue -- ~5,400 write units at 643 artists, ~42,000 at 5,000 -- every
// time one artist was saved. The portfolio now carries a per-artist tag, so
// the sweep is available when it is wanted and is no longer the only option.
test("naming one artist revalidates that artist and not the catalogue", () => {
  const targeted = artistRevalidation.slice(
    artistRevalidation.indexOf("export function revalidateArtistProfile("),
  );
  assert.doesNotMatch(
    targeted,
    /invalidateArtistPortfolioCache\(\)/,
    "targeted revalidation must not drop every artist portfolio",
  );
  assert.match(targeted, /invalidateArtistPortfolio\(artistId\)/);

  // The manual route must resolve slug -> id, or the portfolio cannot be
  // targeted and the entry silently falls back to waiting for the clock.
  assert.match(route, /\.select\("id,slug"\)/);
  assert.match(route, /revalidateArtistProfilePaths\(slug, idBySlug\.get\(slug\) \?\? null\)/);
});
