import assert from "node:assert/strict";
import { existsSync, readFileSync } from "node:fs";
import test from "node:test";

const localeLayout = readFileSync("src/app/[locale]/layout.tsx", "utf8");
const documentShell = readFileSync("src/components/layout/DocumentShell.tsx", "utf8");
const adminLayout = readFileSync("src/app/admin/layout.tsx", "utf8");
const debugLayout = readFileSync("src/app/debug/layout.tsx", "utf8");
const htmlLangSync = readFileSync("src/components/HtmlLangSync.tsx", "utf8");

test("localized public routes own a server-rendered locale-aware root document", () => {
  assert.equal(existsSync("src/app/layout.tsx"), false);
  assert.match(localeLayout, /<DocumentShell lang=\{locale\}>/);
  assert.match(localeLayout, /hasLocale\(routing\.locales, locale\)/);
  assert.match(localeLayout, /setRequestLocale\(locale\)/);
  assert.match(documentShell, /lang: "en" \| "es"/);
  assert.match(documentShell, /<html[\s\S]*?lang=\{lang\}/);
});

test("non-localized document roots remain explicitly English", () => {
  assert.match(adminLayout, /<DocumentShell lang="en">/);
  assert.match(debugLayout, /<DocumentShell lang="en">/);
});

test("client synchronization is retained only for in-app locale navigation", () => {
  assert.match(localeLayout, /<HtmlLangSync locale=\{locale\} \/>/);
  assert.match(htmlLangSync, /document\.documentElement\.lang = locale/);
  assert.doesNotMatch(htmlLangSync, /window\.location|router\.refresh/);
});

test("previously static informational pages bind their locale for prerendering", () => {
  for (const route of [
    "about",
    "contact",
    "contributors",
    "discover",
    "dmca",
    "privacy-policy",
    "releases/essential",
    "terms-of-use",
  ]) {
    const source = readFileSync(`src/app/[locale]/${route}/page.tsx`, "utf8");
    assert.match(source, /setRequestLocale\(locale\)/);
  }
});
