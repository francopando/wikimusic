BEGIN;

-- Rewrite the catalogue entry for Ray Perdomo.
--
-- Ray Perdomo. Filler in English, nothing in Spanish, no legal name, no
-- occupations, no genres -- and a genre that the artist's own channel
-- contradicts in its first sentence.
--
-- SHORT ON PURPOSE. There is not one article, interview or profile about him
-- anywhere. What exists is a discography spanning twenty-six years and a
-- channel description he wrote himself. The entry uses those and stops.
--
-- GENRE CHANGED, AND THE EDITOR SHOULD CHECK IT: primary_genre
-- merengue-perico-ripiao -> merengue. His own channel opens by calling the work
-- "merengue renovado, con elementos de la época, un merengue pensado para este
-- tiempo", and names his arranger as Guillermo Parra, who works with urban
-- artists. Nothing in the catalogue is accordion-and-güira típico, and the one
-- album title that survives from 2000 -- Qué Chulería, with a mambo remix on it
-- -- points at merengue de mambo, which goes into genres. There is no source
-- anywhere for perico ripiao, and it looks like an import-time guess. If the
-- editor knows he came up in típico, this is the line to change back.
--
-- ADDED: occupations composer; genres; disambiguation. LEFT ALONE AND FLAGGED:
-- province "Distrito Nacional" and birth_place "Santo Domingo", the importer's
-- default, and no date of birth or legal name. Nothing found gives any of the
-- three. The alias El Sweetie was already stored and is confirmed by his own
-- channel.
--
-- SOURCES: his own YouTube channel, for the self-description, the arranger
-- credit and the fourteen released videos -- Mejor Que a Ti Me Va, CasaNova, Si
-- Usted Supiera, Costumbres, Estrella Perdida, La Sexy, Caliente, A Ella Le
-- Pica, Me Dejo Llorando, A Las Mujeres Les Gusta, Yo Soy Aquel, Me Tiene Loco,
-- Celoso, Los Bonitos. Apple Music and Spotify for the release dates: the album
-- Qué Chulería in 2000, Si Usted Supiera in 2022, CasaNova from the album
-- Repartiendo in December 2025, and Mejor Que a Ti Me Va in April 2026. A
-- second YouTube upload names an album called 15 Éxitos de Ray Perdomo, 100%
-- Merengue.
--
-- NOT WRITTEN: view counts.
--
-- A CONNECTION WORTH NOTING RATHER THAN ASSERTING. Guillermo "Polo" Parra is
-- almost certainly the same Polo Parra whose studio recorded Yanfourd's La
-- Traición -- see w137. Nothing found states it outright, so the two entries
-- name him without claiming they are the same person. He has no entry and is
-- going on the missing-artists list, where the question can be settled.
--
-- NOT LINKED: Becky G and Natti Natasha are named on his channel as clients of
-- his arranger, not as his collaborators, and neither is referenced.
--
-- Applied directly over DATABASE_URL as part of an editorial pass. No Vercel
-- function ran and nothing was revalidated; the profile reaches the public site
-- on its own within the seven-day ISR fallback, or sooner if a batch sweep is
-- run at the end of the pass.
--
-- This file reproduces the change from the pre-pass state. Both it and its
-- rollback were generated from state captured live either side of the write,
-- not reconstructed afterwards.

UPDATE artists SET
       name = 'Ray Perdomo',
       sort_name = 'Perdomo, Ray',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Ray Perdomo',
       aliases = ARRAY['El Sweetie']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['merengue-mambo']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://linktr.ee/rayperdomo',
       youtube = '@RayPerdomo',
       facebook = 'ray.perdomo.9',
       instagram = 'rayperdomo_',
       disambiguation = 'Merengue singer billed as El Sweetie; Si Usted Supiera, CasaNova',
       bio_en = 'Ray Perdomo, who bills himself El Sweetie, is a Dominican merengue singer. He has been releasing records since 2000 and is having the largest stretch of his career now, twenty-five years in.

**Qué Chulería**

The album from 2000 is the earliest thing that survives, and it carried a mambo remix, which places him in the middle of what merengue was doing at that moment — orchestral arrangements being pulled apart and reassembled around a faster, harder rhythm section.

A compilation called 15 Éxitos de Ray Perdomo, 100% Merengue came later, and the run of songs on it — Costumbres, Estrella Perdida, Me Tiene Loco, Celoso, Los Bonitos, Yo Soy Aquel — is a working merenguero’s repertoire rather than a hit-chasing one.

**Merengue renovado**

What he is doing now he calls merengue renovado: merengue with the elements of the present in it, made for this moment rather than for nostalgia. The arrangements are by Guillermo Parra, an engineer and producer whose other clients are urban artists, and that shows in the production more than in the rhythm.

It is a real position and not just a slogan. Merengue has spent two decades either being preserved as heritage or being absorbed into dembow, and there is very little being made that is simply merengue brought forward.

**Si Usted Supiera and CasaNova**

Si Usted Supiera arrived in 2022 and found an audience. CasaNova, from the album Repartiendo, came at the end of 2025 and found a much larger one — it is by a wide margin the biggest thing he has released.

Mejor Que a Ti Me Va followed in April 2026.

Nothing else about him is documented. No legal name, no date of birth, no town, and not a single article in any outlet — an artist whose whole public record is his own catalogue.',
       bio_es = 'Ray Perdomo, que se anuncia como El Sweetie, es un merenguero dominicano. Publica discos desde el año 2000 y está viviendo el mejor tramo de su carrera ahora, veinticinco años después.

**Qué Chulería**

El álbum del año 2000 es lo más viejo que sobrevive, y llevaba un remix de mambo, lo que lo ubica en medio de lo que estaba haciendo el merengue en ese momento: arreglos de orquesta desarmados y vueltos a armar alrededor de una sección rítmica más rápida y más dura.

Después vino una recopilación llamada 15 Éxitos de Ray Perdomo, 100% Merengue, y la tanda de canciones que trae —Costumbres, Estrella Perdida, Me Tiene Loco, Celoso, Los Bonitos, Yo Soy Aquel— es el repertorio de un merenguero de oficio y no el de alguien persiguiendo un éxito.

**Merengue renovado**

A lo que hace ahora le dice merengue renovado: merengue con los elementos de la época adentro, pensado para este tiempo y no para la nostalgia. Los arreglos son de Guillermo Parra, ingeniero y productor cuyos otros clientes son artistas urbanos, y eso se nota más en la producción que en el ritmo.

Es una posición de verdad y no solo una consigna. El merengue lleva dos décadas o conservándose como patrimonio o absorbiéndose dentro del dembow, y se hace muy poco que sea simplemente merengue traído hacia adelante.

**Si Usted Supiera y CasaNova**

Si Usted Supiera salió en 2022 y encontró público. CasaNova, del álbum Repartiendo, llegó a finales de 2025 y encontró mucho más: es con diferencia lo más grande que ha publicado.

Mejor Que a Ti Me Va vino en abril de 2026.

De él no hay nada más documentado. Ni nombre legal, ni fecha de nacimiento, ni pueblo, ni un solo artículo en ningún medio: un artista cuyo registro público entero es su propio catálogo.',
       updated_at = now()
 WHERE slug = 'ray-perdomo';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ray-perdomo')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ray-perdomo')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ray Perdomo, who bills himself El Sweetie, is a Dominican merengue singer. He has been releasing records since 2000 and is having the largest stretch of his career now, twenty-five years in.","type":"text"}]},{"type":"paragraph","content":[{"text":"Qué Chulería","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The album from 2000 is the earliest thing that survives, and it carried a mambo remix, which places him in the middle of what merengue was doing at that moment — orchestral arrangements being pulled apart and reassembled around a faster, harder rhythm section.","type":"text"}]},{"type":"paragraph","content":[{"text":"A compilation called 15 Éxitos de Ray Perdomo, 100% Merengue came later, and the run of songs on it — Costumbres, Estrella Perdida, Me Tiene Loco, Celoso, Los Bonitos, Yo Soy Aquel — is a working merenguero’s repertoire rather than a hit-chasing one.","type":"text"}]},{"type":"paragraph","content":[{"text":"Merengue renovado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"What he is doing now he calls merengue renovado: merengue with the elements of the present in it, made for this moment rather than for nostalgia. The arrangements are by Guillermo Parra, an engineer and producer whose other clients are urban artists, and that shows in the production more than in the rhythm.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is a real position and not just a slogan. Merengue has spent two decades either being preserved as heritage or being absorbed into dembow, and there is very little being made that is simply merengue brought forward.","type":"text"}]},{"type":"paragraph","content":[{"text":"Si Usted Supiera and CasaNova","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Si Usted Supiera arrived in 2022 and found an audience. CasaNova, from the album Repartiendo, came at the end of 2025 and found a much larger one — it is by a wide margin the biggest thing he has released.","type":"text"}]},{"type":"paragraph","content":[{"text":"Mejor Que a Ti Me Va followed in April 2026.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing else about him is documented. No legal name, no date of birth, no town, and not a single article in any outlet — an artist whose whole public record is his own catalogue.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'ray-perdomo'), 2)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ray Perdomo, que se anuncia como El Sweetie, es un merenguero dominicano. Publica discos desde el año 2000 y está viviendo el mejor tramo de su carrera ahora, veinticinco años después.","type":"text"}]},{"type":"paragraph","content":[{"text":"Qué Chulería","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El álbum del año 2000 es lo más viejo que sobrevive, y llevaba un remix de mambo, lo que lo ubica en medio de lo que estaba haciendo el merengue en ese momento: arreglos de orquesta desarmados y vueltos a armar alrededor de una sección rítmica más rápida y más dura.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después vino una recopilación llamada 15 Éxitos de Ray Perdomo, 100% Merengue, y la tanda de canciones que trae —Costumbres, Estrella Perdida, Me Tiene Loco, Celoso, Los Bonitos, Yo Soy Aquel— es el repertorio de un merenguero de oficio y no el de alguien persiguiendo un éxito.","type":"text"}]},{"type":"paragraph","content":[{"text":"Merengue renovado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A lo que hace ahora le dice merengue renovado: merengue con los elementos de la época adentro, pensado para este tiempo y no para la nostalgia. Los arreglos son de Guillermo Parra, ingeniero y productor cuyos otros clientes son artistas urbanos, y eso se nota más en la producción que en el ritmo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una posición de verdad y no solo una consigna. El merengue lleva dos décadas o conservándose como patrimonio o absorbiéndose dentro del dembow, y se hace muy poco que sea simplemente merengue traído hacia adelante.","type":"text"}]},{"type":"paragraph","content":[{"text":"Si Usted Supiera y CasaNova","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Si Usted Supiera salió en 2022 y encontró público. CasaNova, del álbum Repartiendo, llegó a finales de 2025 y encontró mucho más: es con diferencia lo más grande que ha publicado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Mejor Que a Ti Me Va vino en abril de 2026.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él no hay nada más documentado. Ni nombre legal, ni fecha de nacimiento, ni pueblo, ni un solo artículo en ningún medio: un artista cuyo registro público entero es su propio catálogo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'ray-perdomo'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
