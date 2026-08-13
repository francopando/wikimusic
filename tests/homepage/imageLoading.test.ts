import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

test("only intentional above-the-fold artist and header images are eager", () => {
  const topBanner = readFileSync(
    new URL("../../src/components/organisms/TopBanner.tsx", import.meta.url),
    "utf8",
  );
  const featuredArtistImage = readFileSync(
    new URL("../../src/components/molecules/FeaturedArtistImage.tsx", import.meta.url),
    "utf8",
  );
  const artistCard = readFileSync(
    new URL("../../src/components/molecules/ArtistCard.tsx", import.meta.url),
    "utf8",
  );

  assert.match(topBanner, /loading="eager"/);
  assert.match(topBanner, /fetchPriority="high"/);
  assert.match(featuredArtistImage, /<ArtistImage[\s\S]*?\bpriority\b/);
  assert.match(artistCard, /priorityImage = false/);
});
