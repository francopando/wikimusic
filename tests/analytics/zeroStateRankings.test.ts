import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const homeApi = readFileSync("src/lib/homeApi.ts", "utf8");
const releaseApi = readFileSync("src/lib/releaseApi.ts", "utf8");
const homePage = readFileSync("src/app/[locale]/page.tsx", "utf8");
const releasePage = readFileSync("src/app/[locale]/releases/page.tsx", "utf8");

const popularityComponents = [
  "TopArtistsSection.tsx",
  "MostSearchedSongs.tsx",
  "TopChristianArtistsSection.tsx",
  "ClassicalArtistsSection.tsx",
  "ProminentComposersSection.tsx",
  "TopDjsSection.tsx",
  "TopRisingStarsSection.tsx",
  "TopLegendsArtistsSection.tsx",
];

test("homepage popularity queries require positive analytics", () => {
  assert.ok((homeApi.match(/\.gt\("views", 0\)/g) ?? []).length >= 8);
  assert.match(homeApi, /hasPositiveRecentOrAllTimeViews\(\s*recordingViews7d\.get/);
  assert.match(homeApi, /filter\(\(\{ a, v7 \}\) => hasPositiveRecentOrAllTimeViews\(v7, a\.views\)\)/);
});

test("popularity components safely disappear when their result is empty", () => {
  for (const filename of popularityComponents) {
    const source = readFileSync(`src/components/organisms/${filename}`, "utf8");
    assert.match(source, /if \(![^\n]+\.length\) return null;/, filename);
  }
});

test("most-viewed release surfaces require positive release views", () => {
  assert.match(releaseApi, /options\.requirePositiveViews/);
  assert.match(releaseApi, /query = query\.gt\("views", 0\)/);
  assert.match(releaseApi, /sort: "views", requirePositiveViews: true/);
  assert.match(releasePage, /data\.mostViewed\.length > 0/);
});

test("zero-state homepage keeps non-analytics discovery and editorial sections", () => {
  for (const section of [
    "FeaturedArtistSection",
    "DecadeTimelineCarousel",
    "BrowseByGenreSection",
    "MostAwardedArtistsSection",
    "BrowseByRegionSection",
    "BirthdaySection",
  ]) {
    assert.match(homePage, new RegExp(`<${section}\\b`), section);
  }
});
