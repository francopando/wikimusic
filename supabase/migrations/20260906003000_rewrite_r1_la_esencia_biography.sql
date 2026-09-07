BEGIN;

-- Rewrite the catalogue entry for R1 la Esencia.
--
-- R1 la Esencia. Filler in English, nothing in Spanish, no occupations -- on a
-- rapper who has been working since before most of the Dominican urban
-- catalogue existed.
--
-- ADDED: composer in occupations and urbano beside the primary genre. Nothing
-- else in the row was wrong.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default, and no date of birth. No source found
-- names a town, a birth date or a legal name, which for an artist of his
-- standing is remarkable and is a gap rather than an absence of career.
--
-- SOURCES: MusicBrainz for El Cuero (mambo remix), 2011, and Mueve El Culo,
-- 2018, and for his own site and SoundCloud. His YouTube channel for the
-- videos: El Cuero with Jowell & Randy, Calma with Lapiz Conciente, 123 with
-- Javish, Yo He Hecho De To, Yo Soy El R, KM, Bendiciones with Trap Narcos, and
-- a mini-documentary posted about fifteen years ago. Deezer for the credits on
-- Mueve El Culo -- Jamby El Favo, Nejo and Ecko alongside him -- and on El
-- Cuero. Bulova's channel for the track that puts R1 with Bulova, Melymel,
-- Quimico Ultra Mega and DJ Scuff, and for Di Lo Que Quieras with Tali Goya and
-- Quimico. Soundcharts, which lists Villaman, X3mos and R1 La Esencia together
-- on a Dany Punto Rojo record. Spanish Wikipedia's article on Kiubbah Malon,
-- which names him. Instagram announcements of the concert at the United Palace
-- in New York on 12 September, billed with Lapiz Conciente, and the Leyendas
-- del rap dominicano pages that group him with Lapiz Conciente and Top Dollar
-- Bibi.
--
-- NOT WRITTEN: follower counts, which is the first thing every page about him
-- gives.
--
-- NOT LINKED: Jowell & Randy, Nejo, Ecko and Jamby El Favo are Puerto Rican and
-- should not have entries here. Javish, Bulova, Trap Narcos, Villaman, X3mos
-- and Top Dollar Bibi are Dominican and have none.
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
       name = 'R1 la Esencia',
       sort_name = 'R1 la Esencia',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'R1 la Esencia',
       aliases = ARRAY['R1', 'El R']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'http://r1laesencia.com',
       youtube = '@R1LaEsencia',
       facebook = 'r.laesencia',
       instagram = 'r1laesencia',
       disambiguation = 'Dominican rapper working since the late two-thousands; El Cuero, Calma, KM',
       bio_en = 'R1 la Esencia is a Dominican rapper. He has been releasing records since the late two-thousands, which puts him among the people who were already working when Dominican urban music was still arguing about whether it existed.

**El Cuero**

The song that travelled is El Cuero, made with the Puerto Ricans Jowell & Randy, and a mambo remix of it followed in 2011. Getting a Puerto Rican duo of that size onto a Dominican rap record at that moment was not a routine booking — the traffic mostly ran the other way.

Yo Soy El R and Yo He Hecho De To are from the same period, and he put out a short documentary about himself around then too, which tells you he was already thinking of the career as something with a shape.

**Who he records with**

The credits run across the whole Dominican field and across two generations of it. Lápiz Conciente is on Calma. Di Lo Que Quieras puts him with Tali Goya and Químico Ultra Mega. Another track sets him beside Bulova, Melymel, Químico and DJ Scuff at once.

Mueve El Culo, in 2018, went outside again — Jamby El Favo, Ñejo and Ecko, all Puerto Rican. KM and Bendiciones are more recent.

**Still on the bill**

He plays the diaspora circuit. A September date at the United Palace in New York had him billed with Lápiz Conciente — two rappers from the same generation filling a theatre in Washington Heights, which is where a Dominican rap career of that vintage ends up if it lasts.

Almost nothing personal about him is on the record. No date of birth, no legal name, no town. He is documented entirely by who he has recorded with.',
       bio_es = 'R1 la Esencia es un rapero dominicano. Publica discos desde finales de los dos mil, lo que lo pone entre la gente que ya estaba trabajando cuando la música urbana dominicana todavía discutía si existía.

**El Cuero**

La canción que viajó es El Cuero, hecha con los puertorriqueños Jowell & Randy, y en 2011 salió un remix de mambo de ella. Meter a un dúo puertorriqueño de ese tamaño en un disco de rap dominicano en aquel momento no era una contratación rutinaria: el tráfico iba sobre todo al revés.

Yo Soy El R y Yo He Hecho De To son del mismo período, y por ahí también sacó un documental corto sobre sí mismo, lo que dice que ya pensaba la carrera como algo con forma.

**Con quién graba**

Los créditos cruzan todo el campo dominicano y dos generaciones de él. Lápiz Conciente está en Calma. Di Lo Que Quieras lo pone con Tali Goya y Químico Ultra Mega. Otro tema lo sienta a la vez al lado de Bulova, Melymel, Químico y DJ Scuff.

Mueve El Culo, en 2018, volvió a salir afuera: Jamby El Favo, Ñejo y Ecko, todos puertorriqueños. KM y Bendiciones son más recientes.

**Todavía en cartel**

Trabaja el circuito de la diáspora. Una fecha de septiembre en el United Palace de Nueva York lo puso en cartel con Lápiz Conciente: dos raperos de la misma generación llenando un teatro en Washington Heights, que es donde termina una carrera de rap dominicano de esa cosecha si dura.

De lo personal casi no hay nada anotado. Ni fecha de nacimiento, ni nombre legal, ni pueblo. Está documentado enteramente por con quién ha grabado.',
       updated_at = now()
 WHERE slug = 'r1-la-esencia';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"R1 la Esencia is a Dominican rapper. He has been releasing records since the late two-thousands, which puts him among the people who were already working when Dominican urban music was still arguing about whether it existed.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Cuero","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The song that travelled is El Cuero, made with the Puerto Ricans Jowell & Randy, and a mambo remix of it followed in 2011. Getting a Puerto Rican duo of that size onto a Dominican rap record at that moment was not a routine booking — the traffic mostly ran the other way.","type":"text"}]},{"type":"paragraph","content":[{"text":"Yo Soy El R and Yo He Hecho De To are from the same period, and he put out a short documentary about himself around then too, which tells you he was already thinking of the career as something with a shape.","type":"text"}]},{"type":"paragraph","content":[{"text":"Who he records with","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The credits run across the whole Dominican field and across two generations of it. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"dcbf56e4-8f64-4eec-942c-0232e4d94dc0"}},{"text":" is on Calma. Di Lo Que Quieras puts him with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"47d07f5d-de56-4ad2-abc3-3e33221805dd","displayText":"Tali Goya","occurrenceId":"5d5f4063-75e8-4ae9-b667-82cdbf7d714b"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"df931072-6ccb-4cf9-8019-ae1b5fe9e8c1"}},{"text":". Another track sets him beside Bulova, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"580293c3-1e1e-418f-8555-8082665c22b0","displayText":"Melymel","occurrenceId":"e8d1857d-5004-4216-b21c-9dc2cbe1133c"}},{"text":", Químico and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"f00050cd-a9e4-4b17-a2f0-33781c927ae0"}},{"text":" at once.","type":"text"}]},{"type":"paragraph","content":[{"text":"Mueve El Culo, in 2018, went outside again — Jamby El Favo, Ñejo and Ecko, all Puerto Rican. KM and Bendiciones are more recent.","type":"text"}]},{"type":"paragraph","content":[{"text":"Still on the bill","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He plays the diaspora circuit. A September date at the United Palace in New York had him billed with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"7f2b6c7f-2f08-45c4-94b3-04c531c04968"}},{"text":" — two rappers from the same generation filling a theatre in Washington Heights, which is where a Dominican rap career of that vintage ends up if it lasts.","type":"text"}]},{"type":"paragraph","content":[{"text":"Almost nothing personal about him is on the record. No date of birth, no legal name, no town. He is documented entirely by who he has recorded with.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'r1-la-esencia'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"R1 la Esencia es un rapero dominicano. Publica discos desde finales de los dos mil, lo que lo pone entre la gente que ya estaba trabajando cuando la música urbana dominicana todavía discutía si existía.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Cuero","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La canción que viajó es El Cuero, hecha con los puertorriqueños Jowell & Randy, y en 2011 salió un remix de mambo de ella. Meter a un dúo puertorriqueño de ese tamaño en un disco de rap dominicano en aquel momento no era una contratación rutinaria: el tráfico iba sobre todo al revés.","type":"text"}]},{"type":"paragraph","content":[{"text":"Yo Soy El R y Yo He Hecho De To son del mismo período, y por ahí también sacó un documental corto sobre sí mismo, lo que dice que ya pensaba la carrera como algo con forma.","type":"text"}]},{"type":"paragraph","content":[{"text":"Con quién graba","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los créditos cruzan todo el campo dominicano y dos generaciones de él. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"480fe81f-b8f3-4072-8210-24b8891c7354"}},{"text":" está en Calma. Di Lo Que Quieras lo pone con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"47d07f5d-de56-4ad2-abc3-3e33221805dd","displayText":"Tali Goya","occurrenceId":"d7924585-431c-47bd-b1c3-8ad5655cf297"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"ffe597c9-1cbe-4b12-84eb-ba04067b12c1"}},{"text":". Otro tema lo sienta a la vez al lado de Bulova, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"580293c3-1e1e-418f-8555-8082665c22b0","displayText":"Melymel","occurrenceId":"8a97dd4f-eb87-48d0-8c37-5f74c53bb922"}},{"text":", Químico y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"23db1f65-f537-472e-b768-eb734b26b6fd"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Mueve El Culo, en 2018, volvió a salir afuera: Jamby El Favo, Ñejo y Ecko, todos puertorriqueños. KM y Bendiciones son más recientes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Todavía en cartel","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Trabaja el circuito de la diáspora. Una fecha de septiembre en el United Palace de Nueva York lo puso en cartel con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"3bed9db4-dbfd-4322-be7e-c1bc1d7c5530"}},{"text":": dos raperos de la misma generación llenando un teatro en Washington Heights, que es donde termina una carrera de rap dominicano de esa cosecha si dura.","type":"text"}]},{"type":"paragraph","content":[{"text":"De lo personal casi no hay nada anotado. Ni fecha de nacimiento, ni nombre legal, ni pueblo. Está documentado enteramente por con quién ha grabado.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'r1-la-esencia'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'en'), '5d5f4063-75e8-4ae9-b667-82cdbf7d714b', 'artist', '47d07f5d-de56-4ad2-abc3-3e33221805dd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'en'), '7f2b6c7f-2f08-45c4-94b3-04c531c04968', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'en'), 'dcbf56e4-8f64-4eec-942c-0232e4d94dc0', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'en'), 'df931072-6ccb-4cf9-8019-ae1b5fe9e8c1', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'en'), 'e8d1857d-5004-4216-b21c-9dc2cbe1133c', 'artist', '580293c3-1e1e-418f-8555-8082665c22b0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'en'), 'f00050cd-a9e4-4b17-a2f0-33781c927ae0', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'es'), '23db1f65-f537-472e-b768-eb734b26b6fd', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'es'), '3bed9db4-dbfd-4322-be7e-c1bc1d7c5530', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'es'), '480fe81f-b8f3-4072-8210-24b8891c7354', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'es'), '8a97dd4f-eb87-48d0-8c37-5f74c53bb922', 'artist', '580293c3-1e1e-418f-8555-8082665c22b0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'es'), 'd7924585-431c-47bd-b1c3-8ad5655cf297', 'artist', '47d07f5d-de56-4ad2-abc3-3e33221805dd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'r1-la-esencia') AND locale = 'es'), 'ffe597c9-1cbe-4b12-84eb-ba04067b12c1', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

COMMIT;
