BEGIN;

-- Rewrite the catalogue entry for La Baby.
--
-- La Baby. Filler in English, nothing in Spanish, no date, no place, no real
-- name -- all three of which El Día published in March 2026.
--
-- FILLED: legal name Deyanira Vargas (also on the MusicBrainz record already
-- pointed at by the row, as its disambiguation), date_of_birth 13 November
-- 2001, birth_place Consuelo, province San Pedro de Macorís.
--
-- CORRECTED: primary_genre urbano -> urban-dembow, which was already sitting in
-- genres, and urbano moves there instead. Every record she is on is dembow.
--
-- ADDED: occupations composer -- she is credited as songwriter on her own
-- releases, e.g. Nadie Tiene Que Saber -- aliases, disambiguation, and the
-- emerging tag.
--
-- SOURCES: El Día, 24 March 2026, "La BABY: la voz joven que está conquistando
-- la música urbana", which gives the legal name, the birth date, Consuelo in
-- San Pedro de Macorís, the freestyling from the age of ten, the 2020 track
-- with La Tukiti, La Perversa joining it with a remix, the fact that she
-- writes, and the EP in progress called Niña Traviesa with Angel Dior, Luis
-- Brown and Huan 62. Apple Music, Shazam and Spotify for the credit line on
-- Siente el Ki (Remix), 2 November 2020, which bills La Perversa, La Tukiti and
-- La Baby. Shazam for the songwriting credit on Nadie Tiene Que Saber,
-- November 2025, with Dímelo Tyrone and Mapa Negro. MusicBrainz for the legal
-- name and the country.
--
-- NOT WRITTEN: play counts and follower counts, which is what the article
-- leans on hardest. Nothing about her household beyond the town.
--
-- A NAMING NOTE. On Siente el Ki (Remix) the Apple Music and Shazam credits
-- read "La Baby Number One" rather than "La Baby". Nothing found explains the
-- suffix and it is not treated here as a separate artist or as an alias, since
-- no source connects the two names explicitly. The El Día profile names the
-- same 2020 track with La Tukiti and the same La Perversa remix, which is what
-- ties the record to this row.
--
-- NOT LINKED: La Perversa, La Tukiti, Luis Brown, Huan 62, Dímelo Tyrone and
-- Mapa Negro are Dominican and have no entries.
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
       name = 'La Baby',
       sort_name = 'La Baby',
       type = 'solo_artist',
       status = 'published',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '2001-11-13',
       birth_year = 2001,
       date_of_death = NULL,
       birth_place = 'Consuelo',
       province = 'San Pedro de Macorís',
       first_name = 'Deyanira',
       middle_name = NULL,
       last_name = 'Vargas',
       second_last_name = NULL,
       stage_name = 'La Baby',
       aliases = ARRAY['La BABY']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = NULL,
       youtube = '@lababyoficiall',
       facebook = '100028127663687',
       instagram = 'lababyoficiall',
       disambiguation = 'Dominican dembow singer from Consuelo, San Pedro de Macorís',
       bio_en = 'La Baby, born Deyanira Vargas, is a Dominican dembow singer from Consuelo, a sugar town in San Pedro de Macorís. She sings, raps and writes her own material, which in dembow is three things and not one.

**Freestyle first**

She was freestyling by the age of ten, in a place where that is a street skill before it is a career, and she got good enough at it early that people around her noticed.

Consuelo matters to the sound. It is an eastern batey town, the kind of place the country’s dance music keeps drawing from and rarely credits, and the accent and the phrasing come from there.

**Siente el Ki**

The record that opened the door came in 2020, cut with La Tukiti, and it moved fast enough that La Perversa asked to join it. The remix that resulted put the three of them on one track — three women on a dembow record at a moment when the genre was still being written about as a male thing.

She has kept collaborating since. Nadie Tiene Que Saber, with Dímelo Tyrone and Mapa Negro, carries her name in the writing credits as well as the performance.

**Niña Traviesa**

The EP she is working towards is called Niña Traviesa, with Angel Dior, Luis Brown and Huan 62 among the guests.

What separates her from most of the singers arriving with her is the writing. Dembow is a producer’s genre and the voice on top of it is often interchangeable; somebody who brings her own words to the session is holding a different position in the room.',
       bio_es = 'La Baby, de nombre Deyanira Vargas, es una dembowsera dominicana de Consuelo, un pueblo azucarero de San Pedro de Macorís. Canta, rapea y escribe lo suyo, que en el dembow son tres cosas y no una.

**Primero el freestyle**

A los diez años ya tiraba freestyle, en un sitio donde eso es una destreza de calle antes que una carrera, y lo hizo lo bastante bien y lo bastante temprano como para que la gente a su alrededor se fijara.

Consuelo tiene que ver con el sonido. Es un pueblo de batey del Este, de esos de donde la música bailable del país no para de sacar y a los que casi nunca acredita, y de ahí vienen el acento y el fraseo.

**Siente el Ki**

El disco que le abrió la puerta salió en 2020, hecho con La Tukiti, y se movió lo suficiente como para que La Perversa pidiera meterse. El remix que salió de ahí puso a las tres en un mismo tema: tres mujeres en un disco de dembow en un momento en que del género todavía se escribía como si fuera cosa de hombres.

Desde entonces no ha parado de colaborar. Nadie Tiene Que Saber, con Dímelo Tyrone y Mapa Negro, lleva su nombre en los créditos de autoría además de en los de interpretación.

**Niña Traviesa**

El EP hacia el que trabaja se llama Niña Traviesa, con Angel Dior, Luis Brown y Huan 62 entre los invitados.

Lo que la separa de casi todas las cantantes que llegan con ella es la escritura. El dembow es un género de productor y la voz que va encima suele ser intercambiable; quien llega a la sesión con sus propias palabras ocupa otro lugar en el estudio.',
       updated_at = now()
 WHERE slug = 'la-baby';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-baby')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-baby')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"La Baby, born Deyanira Vargas, is a Dominican dembow singer from Consuelo, a sugar town in San Pedro de Macorís. She sings, raps and writes her own material, which in dembow is three things and not one.","type":"text"}]},{"type":"paragraph","content":[{"text":"Freestyle first","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She was freestyling by the age of ten, in a place where that is a street skill before it is a career, and she got good enough at it early that people around her noticed.","type":"text"}]},{"type":"paragraph","content":[{"text":"Consuelo matters to the sound. It is an eastern batey town, the kind of place the country’s dance music keeps drawing from and rarely credits, and the accent and the phrasing come from there.","type":"text"}]},{"type":"paragraph","content":[{"text":"Siente el Ki","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The record that opened the door came in 2020, cut with La Tukiti, and it moved fast enough that La Perversa asked to join it. The remix that resulted put the three of them on one track — three women on a dembow record at a moment when the genre was still being written about as a male thing.","type":"text"}]},{"type":"paragraph","content":[{"text":"She has kept collaborating since. Nadie Tiene Que Saber, with Dímelo Tyrone and Mapa Negro, carries her name in the writing credits as well as the performance.","type":"text"}]},{"type":"paragraph","content":[{"text":"Niña Traviesa","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The EP she is working towards is called Niña Traviesa, with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b8f26dfb-06b1-43de-8117-ef1c60b2e206","displayText":"Angel Dior","occurrenceId":"e6fc1ccd-0971-4234-b206-49bec60f16ca"}},{"text":", Luis Brown and Huan 62 among the guests.","type":"text"}]},{"type":"paragraph","content":[{"text":"What separates her from most of the singers arriving with her is the writing. Dembow is a producer’s genre and the voice on top of it is often interchangeable; somebody who brings her own words to the session is holding a different position in the room.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'la-baby'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"La Baby, de nombre Deyanira Vargas, es una dembowsera dominicana de Consuelo, un pueblo azucarero de San Pedro de Macorís. Canta, rapea y escribe lo suyo, que en el dembow son tres cosas y no una.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primero el freestyle","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A los diez años ya tiraba freestyle, en un sitio donde eso es una destreza de calle antes que una carrera, y lo hizo lo bastante bien y lo bastante temprano como para que la gente a su alrededor se fijara.","type":"text"}]},{"type":"paragraph","content":[{"text":"Consuelo tiene que ver con el sonido. Es un pueblo de batey del Este, de esos de donde la música bailable del país no para de sacar y a los que casi nunca acredita, y de ahí vienen el acento y el fraseo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Siente el Ki","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El disco que le abrió la puerta salió en 2020, hecho con La Tukiti, y se movió lo suficiente como para que La Perversa pidiera meterse. El remix que salió de ahí puso a las tres en un mismo tema: tres mujeres en un disco de dembow en un momento en que del género todavía se escribía como si fuera cosa de hombres.","type":"text"}]},{"type":"paragraph","content":[{"text":"Desde entonces no ha parado de colaborar. Nadie Tiene Que Saber, con Dímelo Tyrone y Mapa Negro, lleva su nombre en los créditos de autoría además de en los de interpretación.","type":"text"}]},{"type":"paragraph","content":[{"text":"Niña Traviesa","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El EP hacia el que trabaja se llama Niña Traviesa, con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b8f26dfb-06b1-43de-8117-ef1c60b2e206","displayText":"Angel Dior","occurrenceId":"98e1223d-0721-4265-8c0b-b01047194c9f"}},{"text":", Luis Brown y Huan 62 entre los invitados.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que la separa de casi todas las cantantes que llegan con ella es la escritura. El dembow es un género de productor y la voz que va encima suele ser intercambiable; quien llega a la sesión con sus propias palabras ocupa otro lugar en el estudio.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'la-baby'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-baby') AND locale = 'en'), 'e6fc1ccd-0971-4234-b206-49bec60f16ca', 'artist', 'b8f26dfb-06b1-43de-8117-ef1c60b2e206');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-baby') AND locale = 'es'), '98e1223d-0721-4265-8c0b-b01047194c9f', 'artist', 'b8f26dfb-06b1-43de-8117-ef1c60b2e206');

COMMIT;
