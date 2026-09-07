BEGIN;

-- Rewrite the catalogue entry for Kalimete.
--
-- Kalimete. Filler in English, nothing in Spanish, no province, no birthplace,
-- no real name -- on an artist whose legal name and home town were both sitting
-- in the MusicBrainz record the row already pointed at.
--
-- FILLED FROM THE MBID ON THE ROW: legal name Ramfis Reyes, begin-area Azua.
-- Diario Libre, 30 June 2021, gives the same real name, and Diario La Nación,
-- 5 September 2020, has him growing up in Azua.
--
-- CORRECTED: primary_genre merengue -> merengue-urbano. Diario Libre's own
-- headline calls him "el cantante de merengue urbano"; his releases are
-- merengue de calle and merenbow, and Malacorita exists in a merengue and a
-- merenbow version. Plain merengue moves to genres, where it belongs, since
-- defending merengue as such is the thing he says he is doing.
--
-- ADDED: occupations composer beside the producer already there, first_name and
-- last_name, aliases, artist_tags, disambiguation, website left as stored.
--
-- SOURCES: MusicBrainz for the legal name, the begin-area Azua, and the
-- releases Sin miedo a nada, 2019, and La baby (Zion remix), 2024. Diario
-- Libre, 30 June 2021, on the relaunch of Dominicano de Pura Cepa fifteen years
-- after the original. Color Visión, "Esta Noche Mariasela", 13 October 2022,
-- where he tells the tennis story himself. MinayaPR press material of 13 April
-- 2023, for the Emmy of 2022 for the Telemundo 47 campaign built on Dominicano
-- de Pura Cepa, for the Premios Heat nomination as Mejor Artista Tropical, for
-- the Premios Soberano nomination for Mejor Colaboración with Ella Ya Me
-- Olvidó, for the Premio Lo Nuestro nomination as Artista Tropical del Año in
-- 2014, for Malacorita and its Rochy RD version, for Maldito Flow, and for the
-- merengue version of CNCO's Bailemos. Sueños Records for De Otro Planeta,
-- 2026, and Noticias SIN of 26 May 2026 on the same record.
--
-- NOT WRITTEN: play counts and follower counts, which is most of what the press
-- material is made of.
--
-- DISCARDED AS UNRELIABLE: a widely shared social-media blurb has his career
-- starting in the eighties with Cocoband. His own account and every dated
-- source put the first hit around 2006, and he would have been a child. It
-- reads like automatically generated text and is not used.
--
-- FLAGGED: the tennis career is real and he tells it as the spine of his own
-- story, but no source found says at what level he played or when he stopped.
-- The entry names it without inventing a record.
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
       name = 'Kalimete',
       sort_name = 'Kalimete',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue-urbano',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Azua',
       province = 'Azua',
       first_name = 'Ramfis',
       middle_name = NULL,
       last_name = 'Reyes',
       second_last_name = NULL,
       stage_name = 'Kalimete',
       aliases = ARRAY['Kalimete La Fórmula', 'Ramfis Reyes']::text[],
       occupations = '["producer","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['merengue', 'merengue-calle']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://linktr.ee/kalimete',
       youtube = '@Kalimete',
       facebook = 'Kalimeteoficial',
       instagram = 'kalimeteofficial',
       disambiguation = 'Dominican merengue urbano singer from Azua; Dominicano de Pura Cepa, Maldito Flow',
       bio_en = 'Kalimete, born Ramfis Reyes in Azua, is a Dominican merengue urbano singer, producer and composer. He has been recording for more than twenty years and has spent almost all of that time arguing, in public and in the records themselves, that merengue is not finished.

**Dominicano de Pura Cepa**

The song that made him is a declaration of nationality set to a street merengue, and it did something unusual: it came back. He cut a new version fifteen years after the original, and that version became the centre of a television campaign that Telemundo 47 in New York built around the month of Dominican heritage, with him as its face.

The campaign won an Emmy in 2022. A merengue singer collecting a television award for a song about being Dominican, in a New York studio, for an audience of Dominicans who left, is a fairly exact picture of where the genre lives now.

**The other career**

Before the music there was tennis, which he played seriously and still talks about as the thing that taught him how to work. It is not a common line on a merenguero’s record.

**Malacorita and after**

Malacorita arrived in 2021 in a straight merengue version and then in a merenbow — merengue crossed with dembow — recorded with Rochy RD. Maldito Flow is the track most people know him by. Suéltala came back as a remix with Fulanito, and Ella Ya Me Olvidó, made with Omega, took him to a Premios Soberano nomination for collaboration.

The nominations run across the industry: Artista Tropical del Año at Premio Lo Nuestro, Mejor Artista Tropical at the Premios Heat, several Billboard placings and a run of number ones at home on Monitor Latino.

He works through Sueños Records, and the jokes keep coming — a merengue version of CNCO’s Bailemos that turns Reggaetón Lento into Merengue Lento, then De Otro Planeta in 2026. The humour is the method, not a break from it: merengue de calle has always carried its argument inside a joke.',
       bio_es = 'Kalimete, de nombre Ramfis Reyes y nacido en Azua, es cantante, productor y compositor de merengue urbano. Lleva más de veinte años grabando y casi todo ese tiempo lo ha pasado sosteniendo, en público y en los discos mismos, que el merengue no se ha acabado.

**Dominicano de Pura Cepa**

La canción que lo hizo es una declaración de nacionalidad montada sobre un merengue de calle, e hizo algo raro: volvió. Grabó una versión nueva quince años después de la original, y esa versión se convirtió en el centro de una campaña de televisión que Telemundo 47 de Nueva York armó alrededor del mes de la dominicanidad, con él como imagen.

La campaña ganó un Emmy en 2022. Un merenguero recogiendo un premio de televisión por una canción sobre ser dominicano, en un estudio de Nueva York, para un público de dominicanos que se fueron, es un retrato bastante exacto de dónde vive hoy el género.

**La otra carrera**

Antes de la música estuvo el tenis, que jugó en serio y del que todavía habla como lo que le enseñó a trabajar. No es un renglón corriente en la hoja de un merenguero.

**Malacorita y lo que vino**

Malacorita salió en 2021 en versión de merengue y después en merenbow — merengue cruzado con dembow — grabada con Rochy RD. Maldito Flow es el tema por el que más gente lo conoce. Suéltala regresó como remix con Fulanito, y Ella Ya Me Olvidó, hecha con Omega, le valió una nominación a Premio Soberano por colaboración.

Las nominaciones cruzan la industria: Artista Tropical del Año en Premio Lo Nuestro, Mejor Artista Tropical en los Premios Heat, varias entradas a listas de Billboard y una seguidilla de números uno en casa en Monitor Latino.

Trabaja por Sueños Records, y los chistes siguen: una versión en merengue del Bailemos de CNCO que convierte el Reggaetón Lento en Merengue Lento, y después De Otro Planeta en 2026. El humor es el método y no una pausa del método: el merengue de calle siempre ha llevado su argumento dentro de un chiste.',
       updated_at = now()
 WHERE slug = 'kalimete';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kalimete')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kalimete')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kalimete, born Ramfis Reyes in Azua, is a Dominican merengue urbano singer, producer and composer. He has been recording for more than twenty years and has spent almost all of that time arguing, in public and in the records themselves, that merengue is not finished.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominicano de Pura Cepa","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The song that made him is a declaration of nationality set to a street merengue, and it did something unusual: it came back. He cut a new version fifteen years after the original, and that version became the centre of a television campaign that Telemundo 47 in New York built around the month of Dominican heritage, with him as its face.","type":"text"}]},{"type":"paragraph","content":[{"text":"The campaign won an Emmy in 2022. A merengue singer collecting a television award for a song about being Dominican, in a New York studio, for an audience of Dominicans who left, is a fairly exact picture of where the genre lives now.","type":"text"}]},{"type":"paragraph","content":[{"text":"The other career","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Before the music there was tennis, which he played seriously and still talks about as the thing that taught him how to work. It is not a common line on a merenguero’s record.","type":"text"}]},{"type":"paragraph","content":[{"text":"Malacorita and after","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Malacorita arrived in 2021 in a straight merengue version and then in a merenbow — merengue crossed with dembow — recorded with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb","displayText":"Rochy RD","occurrenceId":"6921d846-93aa-4ca5-9deb-2ad29e264612"}},{"text":". Maldito Flow is the track most people know him by. Suéltala came back as a remix with Fulanito, and Ella Ya Me Olvidó, made with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6159dc70-bd8f-439d-bf17-5d690262e5cb","displayText":"Omega","occurrenceId":"0313a3df-2e84-42e1-9f10-211ff5d5fc80"}},{"text":", took him to a Premios Soberano nomination for collaboration.","type":"text"}]},{"type":"paragraph","content":[{"text":"The nominations run across the industry: Artista Tropical del Año at Premio Lo Nuestro, Mejor Artista Tropical at the Premios Heat, several Billboard placings and a run of number ones at home on Monitor Latino.","type":"text"}]},{"type":"paragraph","content":[{"text":"He works through Sueños Records, and the jokes keep coming — a merengue version of CNCO’s Bailemos that turns Reggaetón Lento into Merengue Lento, then De Otro Planeta in 2026. The humour is the method, not a break from it: merengue de calle has always carried its argument inside a joke.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'kalimete'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kalimete, de nombre Ramfis Reyes y nacido en Azua, es cantante, productor y compositor de merengue urbano. Lleva más de veinte años grabando y casi todo ese tiempo lo ha pasado sosteniendo, en público y en los discos mismos, que el merengue no se ha acabado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominicano de Pura Cepa","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La canción que lo hizo es una declaración de nacionalidad montada sobre un merengue de calle, e hizo algo raro: volvió. Grabó una versión nueva quince años después de la original, y esa versión se convirtió en el centro de una campaña de televisión que Telemundo 47 de Nueva York armó alrededor del mes de la dominicanidad, con él como imagen.","type":"text"}]},{"type":"paragraph","content":[{"text":"La campaña ganó un Emmy en 2022. Un merenguero recogiendo un premio de televisión por una canción sobre ser dominicano, en un estudio de Nueva York, para un público de dominicanos que se fueron, es un retrato bastante exacto de dónde vive hoy el género.","type":"text"}]},{"type":"paragraph","content":[{"text":"La otra carrera","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Antes de la música estuvo el tenis, que jugó en serio y del que todavía habla como lo que le enseñó a trabajar. No es un renglón corriente en la hoja de un merenguero.","type":"text"}]},{"type":"paragraph","content":[{"text":"Malacorita y lo que vino","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Malacorita salió en 2021 en versión de merengue y después en merenbow — merengue cruzado con dembow — grabada con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb","displayText":"Rochy RD","occurrenceId":"049fb48a-517c-46da-8b0d-f0546762ebf3"}},{"text":". Maldito Flow es el tema por el que más gente lo conoce. Suéltala regresó como remix con Fulanito, y Ella Ya Me Olvidó, hecha con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6159dc70-bd8f-439d-bf17-5d690262e5cb","displayText":"Omega","occurrenceId":"ac22d840-b51b-48ec-b944-49d02828f4d4"}},{"text":", le valió una nominación a Premio Soberano por colaboración.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las nominaciones cruzan la industria: Artista Tropical del Año en Premio Lo Nuestro, Mejor Artista Tropical en los Premios Heat, varias entradas a listas de Billboard y una seguidilla de números uno en casa en Monitor Latino.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabaja por Sueños Records, y los chistes siguen: una versión en merengue del Bailemos de CNCO que convierte el Reggaetón Lento en Merengue Lento, y después De Otro Planeta en 2026. El humor es el método y no una pausa del método: el merengue de calle siempre ha llevado su argumento dentro de un chiste.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'kalimete'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kalimete') AND locale = 'en'), '0313a3df-2e84-42e1-9f10-211ff5d5fc80', 'artist', '6159dc70-bd8f-439d-bf17-5d690262e5cb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kalimete') AND locale = 'en'), '6921d846-93aa-4ca5-9deb-2ad29e264612', 'artist', '71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kalimete') AND locale = 'es'), '049fb48a-517c-46da-8b0d-f0546762ebf3', 'artist', '71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kalimete') AND locale = 'es'), 'ac22d840-b51b-48ec-b944-49d02828f4d4', 'artist', '6159dc70-bd8f-439d-bf17-5d690262e5cb');

COMMIT;
