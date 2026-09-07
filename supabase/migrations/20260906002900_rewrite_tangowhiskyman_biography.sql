BEGIN;

-- Rewrite the catalogue entry for TANGOWHISKYMAN.
--
-- TANGOWHISKYMAN. Filler in English, nothing in Spanish, and a type that
-- contradicted its own gender: the row said solo_artist while gender already
-- said group.
--
-- CORRECTED: type solo_artist -> group. It is a four-piece.
--
-- ADDED: the band's own site as the website, electronic beside rock in genres,
-- and composer in occupations. The name is written TangoWhiskyMan on the band's
-- own site and Tangowhiskyman in most press; the stored all-caps form is kept
-- as the display name and the two others go in aliases.
--
-- NOT ADDED: a founding year. Nothing states one. The earliest coverage found
-- is from September 2016, so they were working by then, but a birth_year has to
-- be a fact rather than a floor.
--
-- LEFT ALONE, lightly flagged: province "Distrito Nacional" and birth_place
-- "Santo Domingo". No source names a city; the band is only ever described as
-- Dominican.
--
-- SOURCES: the band's own site, tangowhiskyman.com, for the line-up -- Frank
-- Antun, Ariel Ovalles, Ryan Urena and Alberto Bustamante -- and for how they
-- describe the sound: "With influences of German kraut-rock, British and
-- American rock, alternative electro music and trip-hop, the foursome's unique
-- sound explodes with amazing climatic, vibrant melodies and strong enveloping
-- beats." Its press page for the release history: "Tras dos EPs creados a
-- distancia y lanzados en 2020 y 2021 -- Digital Social y Everything Is
-- Awesome, respectivamente -- la banda grabo su ambicioso album The Wait". Apple
-- Music for The Wait (2022) and La Nostalgia de Tango (2025). Colectivo Sonoro,
-- 21 July 2023, and DISCOLAI, 23 August 2023, on Live From Studio A. Indie Hoy,
-- 27 September 2016, "Kraut hecho en Republica Dominicana", which is where the
-- name is explained: Tangowhiskyman is the title of a Can song, and anyone who
-- listens to krautrock will recognise it. Metronomo of Uruguay on the same
-- four-piece, "rock con sabor a Kraut". Their YouTube channel, which lists an
-- earlier line-up including Pedro Cordero, so the band has changed shape.
--
-- NOT LINKED: Frank Antun, Ariel Ovalles, Ryan Urena, Alberto Bustamante and
-- Pedro Cordero have no entries.
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
       name = 'TANGOWHISKYMAN',
       sort_name = 'TangoWhiskyMan',
       type = 'group',
       status = 'published',
       gender = 'group',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'rock',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['TangoWhiskyMan', 'Tangowhiskyman', 'TWM']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['electronic']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://tangowhiskyman.com',
       youtube = '@TANGOWHISKYMANOFFICIAL',
       facebook = 'tangowhiskymanmusic',
       instagram = 'tangowhiskyman',
       disambiguation = 'Dominican psychedelic rock four-piece named after a Can song',
       bio_en = 'TangoWhiskyMan is a Dominican psychedelic rock band: Frank Antun, Ariel Ovalles, Ryan Ureña and Alberto Bustamante. They take their name from a Can song.

**Krautrock in the Caribbean**

That naming is the whole statement of intent. Tango Whiskyman is a track by the German group Can, and anybody who listens to krautrock recognises it on sight — which is exactly the audience the band was addressing, and it is not a large one in Santo Domingo.

What they describe themselves as making is German krautrock crossed with British and American rock, alternative electronic music and trip-hop. In practice that means long forms, repetition used as a structural device rather than as a chorus, and a lot of space.

A Dominican band playing that is choosing a hard road. There is no local circuit for it, no radio for it and no obvious audience, and the reference points are fifty years old and five thousand kilometres away.

**Two records made apart**

Digital Social came in 2020 and Everything Is Awesome in 2021, and both were made at a distance — the band’s own account says so plainly. Recording remotely suits this music better than it would suit most: a form built on loops and layers can be assembled by post in a way a merengue orchestra cannot.

The Wait followed in 2022 and is the ambitious one, the record they made once they could be in a room together again. Live From Studio A came the next year, and La Nostalgia de Tango in 2025.

**Where they get heard**

The coverage they get is largely from outside the country — an Argentine site introducing them as krautrock made in the Dominican Republic, a Uruguayan one describing rock with a kraut flavour. At home, DISCOLAI, which covers the alternative scene, follows them.

That is the standing condition of Dominican alternative music. The record is made in Santo Domingo and the people writing about it are in Buenos Aires.',
       bio_es = 'TangoWhiskyMan es una banda dominicana de rock psicodélico: Frank Antun, Ariel Ovalles, Ryan Ureña y Alberto Bustamante. El nombre lo tomaron de una canción de Can.

**Kraut en el Caribe**

Ese nombre es toda la declaración de intenciones. Tango Whiskyman es un tema del grupo alemán Can, y cualquiera que oiga krautrock lo reconoce de una: que es exactamente el público al que se estaban dirigiendo, y no es un público grande en Santo Domingo.

Lo que ellos mismos dicen que hacen es krautrock alemán cruzado con rock británico y estadounidense, electrónica alternativa y trip hop. En la práctica eso significa formas largas, la repetición usada como recurso estructural y no como estribillo, y mucho espacio.

Una banda dominicana que toque eso está escogiendo un camino difícil. No hay circuito local para eso, ni radio, ni público evidente, y las referencias tienen cincuenta años y están a cinco mil kilómetros.

**Dos discos hechos separados**

Digital Social salió en 2020 y Everything Is Awesome en 2021, y los dos se hicieron a distancia; la propia banda lo dice sin rodeos. Grabar en remoto le sienta a esta música mejor que a casi cualquier otra: una forma armada con bucles y capas se puede montar por correo de una manera que una orquesta de merengue no.

The Wait vino en 2022 y es el ambicioso, el disco que hicieron cuando pudieron volver a estar en un mismo cuarto. Live From Studio A salió al año siguiente, y La Nostalgia de Tango en 2025.

**Dónde los oyen**

La cobertura que reciben viene en buena medida de fuera del país: un sitio argentino que los presenta como kraut hecho en República Dominicana, uno uruguayo que habla de rock con sabor a kraut. En casa los sigue DISCOLAI, que cubre la escena alternativa.

Esa es la condición permanente de la música alternativa dominicana. El disco se hace en Santo Domingo y quienes escriben sobre él están en Buenos Aires.',
       updated_at = now()
 WHERE slug = 'tangowhiskyman';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tangowhiskyman')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tangowhiskyman')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"TangoWhiskyMan is a Dominican psychedelic rock band: Frank Antun, Ariel Ovalles, Ryan Ureña and Alberto Bustamante. They take their name from a Can song.","type":"text"}]},{"type":"paragraph","content":[{"text":"Krautrock in the Caribbean","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"That naming is the whole statement of intent. Tango Whiskyman is a track by the German group Can, and anybody who listens to krautrock recognises it on sight — which is exactly the audience the band was addressing, and it is not a large one in Santo Domingo.","type":"text"}]},{"type":"paragraph","content":[{"text":"What they describe themselves as making is German krautrock crossed with British and American rock, alternative electronic music and trip-hop. In practice that means long forms, repetition used as a structural device rather than as a chorus, and a lot of space.","type":"text"}]},{"type":"paragraph","content":[{"text":"A Dominican band playing that is choosing a hard road. There is no local circuit for it, no radio for it and no obvious audience, and the reference points are fifty years old and five thousand kilometres away.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two records made apart","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Digital Social came in 2020 and Everything Is Awesome in 2021, and both were made at a distance — the band’s own account says so plainly. Recording remotely suits this music better than it would suit most: a form built on loops and layers can be assembled by post in a way a merengue orchestra cannot.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Wait followed in 2022 and is the ambitious one, the record they made once they could be in a room together again. Live From Studio A came the next year, and La Nostalgia de Tango in 2025.","type":"text"}]},{"type":"paragraph","content":[{"text":"Where they get heard","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The coverage they get is largely from outside the country — an Argentine site introducing them as krautrock made in the Dominican Republic, a Uruguayan one describing rock with a kraut flavour. At home, DISCOLAI, which covers the alternative scene, follows them.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the standing condition of Dominican alternative music. The record is made in Santo Domingo and the people writing about it are in Buenos Aires.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'tangowhiskyman'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"TangoWhiskyMan es una banda dominicana de rock psicodélico: Frank Antun, Ariel Ovalles, Ryan Ureña y Alberto Bustamante. El nombre lo tomaron de una canción de Can.","type":"text"}]},{"type":"paragraph","content":[{"text":"Kraut en el Caribe","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ese nombre es toda la declaración de intenciones. Tango Whiskyman es un tema del grupo alemán Can, y cualquiera que oiga krautrock lo reconoce de una: que es exactamente el público al que se estaban dirigiendo, y no es un público grande en Santo Domingo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que ellos mismos dicen que hacen es krautrock alemán cruzado con rock británico y estadounidense, electrónica alternativa y trip hop. En la práctica eso significa formas largas, la repetición usada como recurso estructural y no como estribillo, y mucho espacio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una banda dominicana que toque eso está escogiendo un camino difícil. No hay circuito local para eso, ni radio, ni público evidente, y las referencias tienen cincuenta años y están a cinco mil kilómetros.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos discos hechos separados","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Digital Social salió en 2020 y Everything Is Awesome en 2021, y los dos se hicieron a distancia; la propia banda lo dice sin rodeos. Grabar en remoto le sienta a esta música mejor que a casi cualquier otra: una forma armada con bucles y capas se puede montar por correo de una manera que una orquesta de merengue no.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Wait vino en 2022 y es el ambicioso, el disco que hicieron cuando pudieron volver a estar en un mismo cuarto. Live From Studio A salió al año siguiente, y La Nostalgia de Tango en 2025.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dónde los oyen","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La cobertura que reciben viene en buena medida de fuera del país: un sitio argentino que los presenta como kraut hecho en República Dominicana, uno uruguayo que habla de rock con sabor a kraut. En casa los sigue DISCOLAI, que cubre la escena alternativa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa es la condición permanente de la música alternativa dominicana. El disco se hace en Santo Domingo y quienes escriben sobre él están en Buenos Aires.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'tangowhiskyman'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
