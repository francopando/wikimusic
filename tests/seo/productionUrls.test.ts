import assert from "node:assert/strict";
import test from "node:test";

import {
  SITE_URL,
  artistSeoTitle,
  buildLocalizedCanonical,
  genreSeoTitle,
  localeAlternates,
  releaseSeoTitle,
  songSeoTitle,
} from "../../src/lib/seo";
import { absoluteUrl, breadcrumbSchema } from "../../src/lib/structuredData";

test("all shared public URL helpers use the production origin", () => {
  assert.equal(SITE_URL, "https://mangulina.do");
  assert.equal(buildLocalizedCanonical("/artists/omar-franco", "en"), "https://mangulina.do/artists/omar-franco");
  assert.equal(buildLocalizedCanonical("/artists/omar-franco", "es"), "https://mangulina.do/es/artists/omar-franco");
  assert.deepEqual(localeAlternates("/artists/omar-franco"), {
    en: "https://mangulina.do/artists/omar-franco",
    es: "https://mangulina.do/es/artists/omar-franco",
    "x-default": "https://mangulina.do/artists/omar-franco",
  });
});

test("dynamic SEO titles are localized without changing English titles", () => {
  const artist = { name: "Omar Franco" };
  assert.equal(artistSeoTitle(artist, "en"), "Omar Franco - Biography, Songs & Discography");
  assert.equal(artistSeoTitle(artist, "es"), "Omar Franco - Biografía, canciones y discografía");
  assert.match(songSeoTitle({ recording_title: "Colegiala" }, "es"), /Información de la canción/);
  assert.equal(
    releaseSeoTitle({ title: "Grandes éxitos", type: "release", artist: { name: "Alex Bueno" } }, "es"),
    "Grandes éxitos - Lanzamiento de Alex Bueno",
  );
  assert.match(genreSeoTitle({ title: "Merengue" }, "es"), /Artistas, canciones y álbumes/);
});

test("localized structured-data URLs follow the page locale", () => {
  assert.equal(absoluteUrl("/artists/omar-franco", "es"), "https://mangulina.do/es/artists/omar-franco");
  const schema = breadcrumbSchema([{ name: "Artists", path: "/artists" }], "es");
  assert.equal(schema.itemListElement[0].item, "https://mangulina.do/es/artists");
});
