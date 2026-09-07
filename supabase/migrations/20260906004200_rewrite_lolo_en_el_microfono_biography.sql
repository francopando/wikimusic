BEGIN;

-- Rewrite the catalogue entry for Lolo en el Micrófono.
--
-- Lolo en el Micrófono. Filler in English, nothing in Spanish, no occupations,
-- no genres -- on a rapper who has been on Dominican records since at least
-- 2012 and whose full legal name was already stored correctly.
--
-- LEFT ALONE: first_name Juan, middle_name José, last_name Mateo,
-- second_last_name Beltré were all already on the row and no source contradicts
-- them.
--
-- CORRECTED: primary_genre urbano -> urban-rap-hip-hop. He is placed in every
-- Dominican list of rappers, works dembow without leaving rap -- one commenter
-- puts it exactly, "le mete al dembow pero nunca ha dejado de hacer rap" -- and
-- the freestyle work is the clearest evidence. urbano and urban-dembow go into
-- genres. primary_role singer -> rapper.
--
-- ADDED: occupations composer, aliases, disambiguation, the diaspora tag.
--
-- LEFT EMPTY AND FLAGGED: province and birth_place stay NULL. Nothing found
-- names a town or a date of birth, and the one aggregator that gives a place
-- (Viberate) says Madrid, Spain, which is where he lives rather than where he
-- is from -- the same site's location field is derived from activity. He is
-- Dominican: the Dominican press covers him as a Dominican urban artist and he
-- spent his whole recording career in Santo Domingo before moving.
--
-- SOURCES: Diario Libre, 20 October 2020, on the single Guaya. Alofoke Sin
-- Censura, two long interviews nine and five years old, for the career and the
-- reappearance. A TikTok video essay of 2026 and the Viberate profile for the
-- move to Spain. Alofoke Music for Millonario Raro, with Kiko el Crazy, Shadow
-- Blow and TYS. DJ Scuff's channel for Freestyle en Casa #010. Two 2012 mp3
-- index blogs for the early singles Te Quiero Pa Mi Nama, produced by Xnike and
-- BassBreaker, Muchos Nos Quieren Llegar with Mr. Franco and Lwis BD, and Sueño
-- Dominicano with Jay D. His own channel for En Mi Lao, Perdido and Música
-- Negra. MusicBrainz confirms only the nationality; the record is otherwise
-- empty.
--
-- NOT WRITTEN: view counts. Nothing about the disputes he gives interviews
-- about, which are about other artists and not about his work.
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
       name = 'Lolo en el Micrófono',
       sort_name = 'Lolo en el Micrófono',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Juan',
       middle_name = 'José',
       last_name = 'Mateo',
       second_last_name = 'Beltré',
       stage_name = 'Lolo en el Micrófono',
       aliases = ARRAY['Lolo El Micrófono', 'Lolo']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-dembow']::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = NULL,
       youtube = '@Loloenelmicrofonotv',
       facebook = 'LoloelMicrofonoOfficialPage',
       instagram = 'loloenelmicrofono',
       disambiguation = 'Dominican rapper; Guaya, Millonario Raro, Música Negra',
       bio_en = 'Lolo en el Micrófono, whose legal name is Juan José Mateo Beltré, is a Dominican rapper. He works dembow when a dembow record is what is wanted, and he has never stopped rapping, which is a distinction the audience makes for him rather than one he has to argue.

**The mixtape years**

He was circulating on the Dominican download blogs by 2012 — Te Quiero Pa Mi Nama, produced by Xnike and BassBreaker; Muchos Nos Quieren Llegar with Mr. Franco and Lwis BD; Sueño Dominicano with Jay D. That is the era when Dominican rap moved as loose mp3s posted on a WordPress site, before streaming gave any of it a catalogue number.

The freestyle is the part of the work that has travelled furthest. His session for DJ Scuff’s Freestyle en Casa is among the most watched entries in a series that has effectively become the audition tape for Dominican rap.

**Guaya**

Guaya, in 2020, was a deliberate reappearance after a quiet stretch, and Diario Libre covered it as exactly that. Millonario Raro put him alongside Kiko el Crazy, Shadow Blow and TYS.

Música Negra, Perdido, En Mi Lao and Pesadilla have followed. The records keep the same address — street rap, unhurried, with the phrasing sitting well behind the beat.

**Working from Spain**

He now lives in Spain and records from there. That is a common enough ending for a Dominican rapper of his generation that it barely reads as emigration: the audience is in Madrid and Barcelona as much as in Santo Domingo, and the records travel either way.

Nothing else about him is on the record. No date of birth, no home town — only the name, and the work.',
       bio_es = 'Lolo en el Micrófono, de nombre legal Juan José Mateo Beltré, es un rapero dominicano. Le mete al dembow cuando lo que se pide es un disco de dembow, y nunca ha dejado de hacer rap, distinción que hace el público por él y que él no tiene que defender.

**Los años de mixtape**

Ya circulaba en los blogs dominicanos de descarga en 2012: Te Quiero Pa Mi Nama, producida por Xnike y BassBreaker; Muchos Nos Quieren Llegar con Mr. Franco y Lwis BD; Sueño Dominicano con Jay D. Esa es la época en que el rap dominicano se movía como mp3 sueltos colgados en un WordPress, antes de que el streaming le pusiera número de catálogo a nada de eso.

El freestyle es la parte del trabajo que más lejos ha llegado. Su sesión para el Freestyle en Casa de DJ Scuff está entre las más vistas de una serie que se ha convertido, de hecho, en la prueba de audición del rap dominicano.

**Guaya**

Guaya, en 2020, fue una reaparición deliberada después de un tramo callado, y Diario Libre la cubrió exactamente así. Millonario Raro lo puso al lado de Kiko el Crazy, Shadow Blow y TYS.

Detrás vinieron Música Negra, Perdido, En Mi Lao y Pesadilla. Los discos mantienen la misma dirección: rap de calle, sin apuro, con el fraseo bien detrás del beat.

**Trabajando desde España**

Hoy vive en España y graba desde allá. Es un final tan común para un rapero dominicano de su generación que casi no se lee como emigración: el público está en Madrid y en Barcelona tanto como en Santo Domingo, y los discos viajan en las dos direcciones.

De él no hay nada más anotado. Ni fecha de nacimiento, ni pueblo: solo el nombre y la obra.',
       updated_at = now()
 WHERE slug = 'lolo-en-el-microfono';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Lolo en el Micrófono, whose legal name is Juan José Mateo Beltré, is a Dominican rapper. He works dembow when a dembow record is what is wanted, and he has never stopped rapping, which is a distinction the audience makes for him rather than one he has to argue.","type":"text"}]},{"type":"paragraph","content":[{"text":"The mixtape years","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was circulating on the Dominican download blogs by 2012 — Te Quiero Pa Mi Nama, produced by Xnike and BassBreaker; Muchos Nos Quieren Llegar with Mr. Franco and Lwis BD; Sueño Dominicano with Jay D. That is the era when Dominican rap moved as loose mp3s posted on a WordPress site, before streaming gave any of it a catalogue number.","type":"text"}]},{"type":"paragraph","content":[{"text":"The freestyle is the part of the work that has travelled furthest. His session for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"4cc5ae7f-de34-4b87-a9cc-11c8be66b1b3"}},{"text":"’s Freestyle en Casa is among the most watched entries in a series that has effectively become the audition tape for Dominican rap.","type":"text"}]},{"type":"paragraph","content":[{"text":"Guaya","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Guaya, in 2020, was a deliberate reappearance after a quiet stretch, and Diario Libre covered it as exactly that. Millonario Raro put him alongside ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9be0ed08-6eb6-4ca0-bb68-d5126190aeb1","displayText":"Kiko el Crazy","occurrenceId":"802943a9-1bac-455c-839a-7489856ec90e"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"d035ea3c-79a9-4e8a-b1fa-1fb2981483f5"}},{"text":" and TYS.","type":"text"}]},{"type":"paragraph","content":[{"text":"Música Negra, Perdido, En Mi Lao and Pesadilla have followed. The records keep the same address — street rap, unhurried, with the phrasing sitting well behind the beat.","type":"text"}]},{"type":"paragraph","content":[{"text":"Working from Spain","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He now lives in Spain and records from there. That is a common enough ending for a Dominican rapper of his generation that it barely reads as emigration: the audience is in Madrid and Barcelona as much as in Santo Domingo, and the records travel either way.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing else about him is on the record. No date of birth, no home town — only the name, and the work.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Lolo en el Micrófono, de nombre legal Juan José Mateo Beltré, es un rapero dominicano. Le mete al dembow cuando lo que se pide es un disco de dembow, y nunca ha dejado de hacer rap, distinción que hace el público por él y que él no tiene que defender.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los años de mixtape","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ya circulaba en los blogs dominicanos de descarga en 2012: Te Quiero Pa Mi Nama, producida por Xnike y BassBreaker; Muchos Nos Quieren Llegar con Mr. Franco y Lwis BD; Sueño Dominicano con Jay D. Esa es la época en que el rap dominicano se movía como mp3 sueltos colgados en un WordPress, antes de que el streaming le pusiera número de catálogo a nada de eso.","type":"text"}]},{"type":"paragraph","content":[{"text":"El freestyle es la parte del trabajo que más lejos ha llegado. Su sesión para el Freestyle en Casa de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"5337051f-21df-406f-bb36-e6ad6322b159"}},{"text":" está entre las más vistas de una serie que se ha convertido, de hecho, en la prueba de audición del rap dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Guaya","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Guaya, en 2020, fue una reaparición deliberada después de un tramo callado, y Diario Libre la cubrió exactamente así. Millonario Raro lo puso al lado de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9be0ed08-6eb6-4ca0-bb68-d5126190aeb1","displayText":"Kiko el Crazy","occurrenceId":"3c77066d-9406-4767-aa60-29a8146d9785"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"9ba929a4-39ff-4617-b6f6-44e6a33a4f98"}},{"text":" y TYS.","type":"text"}]},{"type":"paragraph","content":[{"text":"Detrás vinieron Música Negra, Perdido, En Mi Lao y Pesadilla. Los discos mantienen la misma dirección: rap de calle, sin apuro, con el fraseo bien detrás del beat.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabajando desde España","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Hoy vive en España y graba desde allá. Es un final tan común para un rapero dominicano de su generación que casi no se lee como emigración: el público está en Madrid y en Barcelona tanto como en Santo Domingo, y los discos viajan en las dos direcciones.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él no hay nada más anotado. Ni fecha de nacimiento, ni pueblo: solo el nombre y la obra.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono') AND locale = 'en'), '4cc5ae7f-de34-4b87-a9cc-11c8be66b1b3', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono') AND locale = 'en'), '802943a9-1bac-455c-839a-7489856ec90e', 'artist', '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono') AND locale = 'en'), 'd035ea3c-79a9-4e8a-b1fa-1fb2981483f5', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono') AND locale = 'es'), '3c77066d-9406-4767-aa60-29a8146d9785', 'artist', '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono') AND locale = 'es'), '5337051f-21df-406f-bb36-e6ad6322b159', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lolo-en-el-microfono') AND locale = 'es'), '9ba929a4-39ff-4617-b6f6-44e6a33a4f98', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

COMMIT;
