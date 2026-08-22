import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

import { createRobotsPolicy } from "../../src/app/robots";

const read = (path: string) => readFileSync(new URL(path, import.meta.url), "utf8");
const homepage = read("../../src/app/[locale]/page.tsx");
const featuredArtist = read("../../src/components/molecules/FeaturedArtistInfo.tsx");
const homeApi = read("../../src/lib/homeApi.ts");
const en = JSON.parse(read("../../messages/en.json"));
const es = JSON.parse(read("../../messages/es.json"));

test("homepage renders one localized site H1 before a subordinate Featured Artist H2", () => {
  assert.equal((homepage.match(/<h1\b/g) ?? []).length, 1);
  assert.equal((featuredArtist.match(/<h1\b/g) ?? []).length, 0);
  assert.equal((featuredArtist.match(/<h2\b/g) ?? []).length, 1);
  assert.ok(homepage.indexOf("<h1") < homepage.indexOf("<FeaturedArtistSection"));
});

test("homepage identity copy is localized and emitted by the server page", () => {
  assert.equal(en.homepageIdentity.title, "Mangulina — The Dominican Music Database");
  assert.equal(en.homepageIdentity.introduction, "Explore Dominican music through its artists, songs, recordings, releases, genres, composers, musicians, producers, and musical history.");
  assert.equal(es.homepageIdentity.title, "Mangulina — La Base de Datos de la Música Dominicana");
  assert.equal(es.homepageIdentity.introduction, "Explora la música dominicana a través de sus artistas, canciones, grabaciones, lanzamientos, géneros, compositores, músicos, productores e historia musical.");
  assert.match(homepage, /getTranslations\(\{ locale, namespace: "homepageIdentity" \}\)/);
  assert.match(homepage, /\{t\("introduction"\)\}/);
  assert.doesNotMatch(homepage, /"use client"/);
});

test("homepage schema has localized WebPage identity and no SearchAction", () => {
  assert.match(homepage, /"@type": "WebPage"/);
  assert.match(homepage, /url: canonicalUrl/);
  assert.match(homepage, /inLanguage: locale/);
  assert.match(homepage, /isPartOf: \{ "@id": `\$\{SITE_URL\}\/\#website` \}/);
  assert.doesNotMatch(homepage, /SearchAction|search_term_string/);
});

test("homepage biography and cache identity are bounded by locale", () => {
  assert.match(homeApi, /loadHomeData\(locale: EditorialLocale\)/);
  assert.match(homeApi, /getPublishedEditorialPlainText\(featuredArtistBase\.id, locale\)/);
  assert.match(homeApi, /locale === "es"[\s\S]*getPublishedEditorialPlainText\(featuredArtistBase\.id, "en"\)/);
  assert.match(homeApi, /getCachedHomeData\(locale === "es" \? "es" : "en"\)/);
  assert.match(homeApi, /\["homepage-data-v2"\]/);
});

test("search remains crawler-blocked while SearchAction is absent", () => {
  const policy = createRobotsPolicy(true);
  assert.ok(Array.isArray(policy.rules));
  for (const rule of policy.rules) {
    assert.ok(Array.isArray(rule.disallow));
    assert.ok(rule.disallow.includes("/search"));
  }
  assert.doesNotMatch(homepage, /SearchAction/);
});
