import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

import { createPageMetadata } from "../../src/lib/seo";

const en = JSON.parse(readFileSync("messages/en.json", "utf8"));
const es = JSON.parse(readFileSync("messages/es.json", "utf8"));
const helper = readFileSync("src/lib/artist-role-pages.ts", "utf8");

const routes = {
  artists: "/artists",
  composers: "/composers",
  songwriters: "/songwriters",
  lyricists: "/lyricists",
  arrangers: "/arrangers",
  musicalDirectors: "/musical-directors",
  musicians: "/musicians",
  djs: "/djs",
  producers: "/producers",
  christian: "/christian",
  instrumentalClassical: "/instrumental-classical",
} as const;

function metadata(locale: "en" | "es", key: keyof typeof routes) {
  const messages = locale === "es" ? es : en;
  const copy = messages.artistDirectory[key];
  return createPageMetadata({
    title: copy.metadataTitle,
    description: copy.metadataDescription,
    path: routes[key],
    locale,
  });
}

test("every artist role directory has English and Spanish metadata copy", () => {
  for (const key of Object.keys(routes) as Array<keyof typeof routes>) {
    assert.ok(en.artistDirectory[key].metadataTitle);
    assert.ok(en.artistDirectory[key].metadataDescription);
    assert.ok(es.artistDirectory[key].metadataTitle);
    assert.ok(es.artistDirectory[key].metadataDescription);
  }
});

test("composer metadata is English on EN and Spanish on ES across all text surfaces", () => {
  const english = metadata("en", "composers");
  const spanish = metadata("es", "composers");

  assert.equal(english.title, "Dominican Composers and Songwriters");
  assert.equal(spanish.title, "Compositores y Autores Dominicanos");
  assert.match(String(english.description), /Dominican composers/);
  assert.match(String(spanish.description), /compositores/);
  assert.equal(english.openGraph?.title, english.title);
  assert.equal(spanish.openGraph?.title, spanish.title);
  assert.equal(english.twitter?.description, english.description);
  assert.equal(spanish.twitter?.description, spanish.description);
});

test("another shared role page localizes while preserving canonical and hreflang", () => {
  const english = metadata("en", "musicians");
  const spanish = metadata("es", "musicians");

  assert.equal(english.title, "Dominican Musicians");
  assert.equal(spanish.title, "Músicos Dominicanos");
  assert.equal(english.alternates?.canonical, "https://mangulina.do/musicians");
  assert.equal(spanish.alternates?.canonical, "https://mangulina.do/es/musicians");
  assert.deepEqual(english.alternates?.languages, spanish.alternates?.languages);
  assert.equal(english.alternates?.languages?.en, "https://mangulina.do/musicians");
  assert.equal(english.alternates?.languages?.es, "https://mangulina.do/es/musicians");
  assert.equal(english.alternates?.languages?.["x-default"], "https://mangulina.do/musicians");
});

test("the shared role resolver obtains metadata copy from the active locale", () => {
  assert.match(helper, /getTranslations\(\{[\s\S]*?locale,[\s\S]*?namespace: `artistDirectory\.\$\{key\}`/);
  assert.match(helper, /title: t\("metadataTitle"\)/);
  assert.match(helper, /description: t\("metadataDescription"\)/);
});
