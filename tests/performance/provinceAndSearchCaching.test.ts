import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

import { createRobotsPolicy } from "../../src/app/robots";

import { MAX_SEARCH_QUERY_LENGTH, MIN_SEARCH_QUERY_LENGTH, searchCacheKey } from "../../src/lib/searchTypes";

const read = (p: string) => readFileSync(p, "utf8");
const code = (s: string) => s.replace(/\/\*[\s\S]*?\*\//g, "").replace(/^\s*\/\/.*$/gm, "");

const province = read("src/app/[locale]/provinces/[slug]/page.tsx");
const searchPage = read("src/app/[locale]/search/page.tsx");
const searchApi = read("src/lib/searchApi.ts");
const suggestions = read("src/app/api/search/suggestions/route.ts");
const sitemapCatalog = read("src/lib/sitemapCatalog.ts");

// ---------------------------------------------------------------- Phase 3C

test("province profiles are cacheable and no longer request-dependent", () => {
  assert.doesNotMatch(code(province), /force-dynamic|no-store|unstable_noStore/);
  assert.doesNotMatch(code(province), /searchParams/, "canonical render must not read searchParams");
  assert.match(province, /export const revalidate = 86400/);
  // The populated generateStaticParams is active again now that the route is not dynamic.
  assert.match(province, /export async function generateStaticParams/);
  assert.match(province, /getPublishedProvinces/);
});

test("province publication and content behaviour is preserved", () => {
  assert.match(province, /getPublishedProvinceBySlug/, "publication boundary preserved");
  assert.match(province, /notFound\(\)/, "unknown provinces still 404");
  assert.match(province, /fixedProvince=\{province\.name\}/, "listing stays scoped to the province");
  assert.match(province, /createPageMetadata/, "metadata preserved");
});

// ---------------------------------------------------------------- Phase 3D

test("search stays dynamic by design rather than becoming ISR", () => {
  // Result pages are user-driven and unbounded; caching them as HTML is the
  // failure mode this phase avoids, not the goal.
  assert.match(code(searchPage), /searchParams/, "search legitimately reads its query");
  assert.doesNotMatch(searchPage, /export const revalidate/, "no ISR on search results");
  assert.doesNotMatch(searchPage, /generateStaticParams/);
});

test("search cache keys are bounded", () => {
  assert.equal(searchCacheKey("  juan  "), "juan");
  assert.equal(searchCacheKey("juan"), searchCacheKey("juan "));
  assert.equal(searchCacheKey("x".repeat(500)).length, MAX_SEARCH_QUERY_LENGTH);
  // Normalisation must not fold case: the global_search RPC's case handling is
  // not defined in this repo, so folding could change results.
  assert.notEqual(searchCacheKey("Juan"), searchCacheKey("juan"));
  assert.match(searchApi, /global-search-v2/, "cache key version bumped with the change");
});

test("both search entry points enforce the same query bounds", () => {
  for (const [label, source] of [["page", searchPage], ["suggestions", suggestions]] as const) {
    assert.match(source, /MIN_SEARCH_QUERY_LENGTH/, `${label} enforces a minimum`);
    assert.match(source, /MAX_SEARCH_QUERY_LENGTH/, `${label} enforces a maximum`);
  }
  assert.equal(MIN_SEARCH_QUERY_LENGTH, 2);
  assert.equal(MAX_SEARCH_QUERY_LENGTH, 80);
  // Repeated identical searches must still hit the cache, not the database.
  assert.match(searchApi, /unstable_cache/);
  assert.match(suggestions, /s-maxage=300/, "suggestion responses stay CDN-cacheable");
});

test("crawlers are kept out of search permutations without touching catalog access", () => {
  const policy = createRobotsPolicy(true);
  const rules = policy.rules as Array<{ userAgent: string; allow?: string; disallow?: string[] }>;
  for (const rule of rules) {
    assert.ok(rule.disallow?.includes("/search"), `${rule.userAgent} is kept out of /search`);
    assert.equal(rule.allow, "/", `${rule.userAgent} retains catalog access`);
    for (const p of ["/admin", "/api/", "/auth/", "/debug"]) {
      assert.ok(rule.disallow?.includes(p), `${rule.userAgent} still excludes ${p}`);
    }
    // Catalog families must never be disallowed.
    for (const p of ["/artists", "/songs", "/releases", "/genres", "/provinces", "/composers"]) {
      assert.ok(!rule.disallow?.includes(p), `${p} stays crawlable`);
    }
  }
  assert.equal(policy.sitemap, "https://mangulina.do/sitemap.xml", "sitemap discovery unchanged");
  // Fail-closed behaviour when indexing is disabled is untouched.
  assert.deepEqual(createRobotsPolicy(false).rules, { userAgent: "*", disallow: "/" });
});

test("no search URLs can enter the sitemap", () => {
  assert.doesNotMatch(sitemapCatalog, /\/search/);
  assert.doesNotMatch(sitemapCatalog, /[?]q=/);
});
