BEGIN;

-- Rewrite the catalogue entry for Milka la Más Dura.
--
-- Milka la Más Dura. Filler in English, nothing in Spanish, no occupations, no
-- instagram, no disambiguation, and an alias that was a copy of her own name --
-- on one of the first women to record Dominican urban music.
--
-- THE ROW'S HARD FACTS WERE ALL CORRECT AND ARE CONFIRMED, NOT ASSUMED. Milka
-- Sarahí Cruz Ramírez, born in Santo Domingo on 22 October 1987. BuenaMusica's
-- biography and its Datos block give exactly that, down to the accent on Sarahí.
-- gender female, province, birth_place and primary_genre urban-dembow are all
-- left alone.
--
-- THE ALIAS WAS A DUPLICATE. aliases held ["Milka la Más Dura"], which is the
-- name field verbatim. Emptied. The stage name is explained rather than
-- duplicated: Milka is her first name and "la más dura" is what she was called.
--
-- instagram FILLED. The field was null. Her own YouTube About panel links
-- instagram.com/milkalamasdura, and it is confirmed independently by two fan
-- accounts that name @milkalamasdura as the official one and by Dominican media
-- tagging her at it in November and December 2025.
--
-- THE FACEBOOK VALUE IS A NUMERIC ID AND IT IS CORRECT. facebook
-- "100044141604380" resolves to a page titled Milka La Mas Dura, described as
-- "Fans Page Oficial", filed as Artista, with 34,000 followers. Checked because
-- numeric Facebook ids have already gone stale twice in this run.
--
-- THE legend TAG IS ADDED. MelyMel and La Insuperable both carry it and both are
-- of this cohort; Milka recorded before either of them. Adding it makes the group
-- consistent rather than singling her out.
--
-- A DATE THE SOURCES SPLIT ON. BuenaMusica puts her first single, Dale Ven Ven,
-- in 2008. A history of dembow published in October 2022 names the same record
-- as a landmark of the genre and dates it 2009. Both are cited in the prose as
-- "the end of that decade" rather than picking one.
--
-- ADDED: occupations composer and dancer -- BuenaMusica describes her as
-- "cantante, bailarina y compositora", and singer is already the primary_role.
-- genres urbano, urban-rap-hip-hop and urban-reggaeton: rap is where she started
-- by her own account, reggaetón is what BuenaMusica files her under, and dembow
-- is the primary_genre already stored.
--
-- NOT WRITTEN. BuenaMusica gives a "Vida Personal" section naming a former
-- partner who was also her manager and describing a current relationship; none of
-- it is here. Dominican media covering her 2025 return attribute the pause to
-- motherhood; the return is a career fact and appears, the reason does not.
-- BuenaMusica also says she has stepped back at times from feeling overwhelmed by
-- the demands of the industry -- the pattern of stepping away and returning is
-- written, her state of mind is not.
--
-- NO NUMBERS: BuenaMusica quotes a YouTube figure for "Picante" and it is left
-- out, along with follower counts.
--
-- SOURCES: BuenaMusica's biography and Datos block, which is the only
-- year-by-year chronology of her that exists. Her own YouTube channel -- thirty
-- video titles and the About panel. Her own Facebook page. A survey of the
-- evolution of dembow published in October 2022, which places Dale Ven Ven among
-- the records that mattered. Dominican media coverage of her return to the stage
-- in November and December 2025, including a Telecentro interview.
--
-- NOT LINKED: Rhyno OTT, El Kable, BIGOBLIN, HeoLuih, Swift Bundi, Mr. Manyao,
-- Jay Bruno, Fragan Boy, Heidy Brown, Luchy DR, Jhon Distrito and the trio J.M.T
-- have no entries. Nítido en el Nintendo, who produced for her, has no entry
-- either and is a real gap -- he is one of the most cited producers in Dominican
-- urban music.
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
       name = 'Milka la Más Dura',
       sort_name = 'Milka la Más Dura',
       type = 'solo_artist',
       status = 'published',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1987-10-22',
       birth_year = 1987,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Santo Domingo',
       first_name = 'Milka',
       middle_name = 'Sarahí',
       last_name = 'Cruz',
       second_last_name = 'Ramírez',
       stage_name = 'Milka la Más Dura',
       aliases = ARRAY[]::text[],
       occupations = '["composer","dancer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop', 'urban-reggaeton']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = '@MilkaLaMasDura',
       facebook = '100044141604380',
       instagram = 'milkalamasdura',
       disambiguation = 'One of the first women in Dominican urban music; Dale Ven Ven, Sin Compromiso',
       bio_en = 'Milka la Más Dura, born Milka Sarahí Cruz Ramírez, is a Dominican urban singer, songwriter and dancer from Santo Domingo. She began in rap and was recording before most of the women now credited with opening the genre had started.

**The name**

Milka is her own first name. La más dura — the hardest — is what people called her, and she kept it. Stage names in Dominican urban music are usually a boast; this one was a description that stuck before it was a claim.

She was in a trio called J.M.T. as a very young woman, for Joel, Milka and Trujillo. Then Dale Ven Ven, at the end of that decade, and a history of dembow written years later still names it among the records that moved the genre forward.

**Before there was a lane**

It is worth being precise about how early that is. Dominican dembow in those years had no women in it to speak of, no label structure, and no route to radio. A woman recording street rap in Santo Domingo then was not entering an industry; she was making a case that one should exist for her.

The women now named as the pioneers of the form — MelyMel in rap, La Materialista and La Insuperable in dembow — belong to the same short list, and Milka was on it first by recording date.

**The run of singles**

Sin Compromiso, in 2013, is the other record she is known by, and the remix put Chimbala on it. What followed was a decade of singles rather than albums: Infiel, Pásalo Pa’ Acá, 2ble Cara, No Me Dé Cotorra, Bésale La Mano A Mamá, En Mi Cama, Coro Moderno, Plato De Segunda Mesa, La Para, Sonidita, No Me Llames.

Then Picante, No Aguanto Más, A Tu Nombre, Aprieta, and in 2019 No Peleo Por Hombre — a title that is a whole position, and one that a woman in this genre in that year was more or less obliged to state out loud.

Un Clavo Saca Otro and a live session followed, then Daikiri, Uh Ah, Prende and Desacato, then Noche De Avería, Pa’ Ma Nadie and Me Emperré. She has also cut a record with Químico Ultra Mega.

**Leaving and coming back**

Her career has gaps in it. She has stepped away more than once and come back each time, most recently returning to the stage after a long absence and immediately releasing again.

That pattern is not a failure of nerve; it is what a career looks like for a woman who has been in Dominican urban music for the better part of twenty years without ever having a label organise it for her. The audience has been there each time she came back.',
       bio_es = 'Milka la Más Dura, de nombre Milka Sarahí Cruz Ramírez, es cantante, compositora y bailarina urbana dominicana, de Santo Domingo. Empezó en el rap y ya estaba grabando antes de que arrancaran casi todas las mujeres a las que hoy se les reconoce haber abierto el género.

**El nombre**

Milka es su propio nombre de pila. La más dura es como le decían, y se lo quedó. En la música urbana dominicana los nombres artísticos suelen ser una bravata; este era una descripción que ya venía pegada antes de ser un reclamo.

De muy joven estuvo en un trío llamado J.M.T., por Joel, Milka y Trujillo. Después Dale Ven Ven, al final de esa década, y una historia del dembow escrita años más tarde todavía lo nombra entre los discos que movieron el género.

**Antes de que hubiera carril**

Conviene ser preciso sobre lo temprano que es eso. El dembow dominicano de esos años no tenía mujeres de las que hablar, ni estructura de sellos, ni manera de llegar a la radio. Una mujer grabando rap de calle en Santo Domingo entonces no estaba entrando a una industria: estaba argumentando que debía existir una para ella.

Las mujeres que hoy se nombran como pioneras del formato —MelyMel en el rap, La Materialista y La Insuperable en el dembow— pertenecen a esa misma lista corta, y Milka estuvo en ella primero por fecha de grabación.

**La seguidilla de sencillos**

Sin Compromiso, de 2013, es el otro disco por el que se le conoce, y el remix le puso a Chimbala encima. Lo que vino después fue una década de sencillos y no de álbumes: Infiel, Pásalo Pa’ Acá, 2ble Cara, No Me Dé Cotorra, Bésale La Mano A Mamá, En Mi Cama, Coro Moderno, Plato De Segunda Mesa, La Para, Sonidita, No Me Llames.

Después Picante, No Aguanto Más, A Tu Nombre, Aprieta, y en 2019 No Peleo Por Hombre: un título que es una posición entera, y una que a una mujer de este género en ese año más o menos le tocaba decir en voz alta.

Siguieron Un Clavo Saca Otro y una sesión en vivo, luego Daikiri, Uh Ah, Prende y Desacato, y después Noche De Avería, Pa’ Ma Nadie y Me Emperré. También ha grabado con Químico Ultra Mega.

**Irse y volver**

Su carrera tiene huecos. Se ha apartado más de una vez y ha vuelto todas, la última tras una ausencia larga, y volviendo a publicar de inmediato.

Ese patrón no es falta de carácter: es como se ve una carrera de una mujer que lleva casi veinte años en la música urbana dominicana sin que ningún sello se la haya organizado nunca. El público ha estado ahí cada vez que ha vuelto.',
       updated_at = now()
 WHERE slug = 'milka-la-mas-dura';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Milka la Más Dura, born Milka Sarahí Cruz Ramírez, is a Dominican urban singer, songwriter and dancer from Santo Domingo. She began in rap and was recording before most of the women now credited with opening the genre had started.","type":"text"}]},{"type":"paragraph","content":[{"text":"The name","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Milka is her own first name. La más dura — the hardest — is what people called her, and she kept it. Stage names in Dominican urban music are usually a boast; this one was a description that stuck before it was a claim.","type":"text"}]},{"type":"paragraph","content":[{"text":"She was in a trio called J.M.T. as a very young woman, for Joel, Milka and Trujillo. Then Dale Ven Ven, at the end of that decade, and a history of dembow written years later still names it among the records that moved the genre forward.","type":"text"}]},{"type":"paragraph","content":[{"text":"Before there was a lane","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"It is worth being precise about how early that is. Dominican dembow in those years had no women in it to speak of, no label structure, and no route to radio. A woman recording street rap in Santo Domingo then was not entering an industry; she was making a case that one should exist for her.","type":"text"}]},{"type":"paragraph","content":[{"text":"The women now named as the pioneers of the form — ","type":"text"},{"type":"artistReference","attrs":{"artistId":"580293c3-1e1e-418f-8555-8082665c22b0","displayText":"MelyMel","occurrenceId":"7ae58ba8-f0ae-49b6-ad25-3356ac26cb46"}},{"text":" in rap, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"639de91e-2507-491c-a58a-ce4e77af065d","displayText":"La Materialista","occurrenceId":"786a2859-e960-4ccf-a6d4-d284d7710206"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"9ad799da-b83b-4f7d-bc43-1dcacd5dbb9a"}},{"text":" in dembow — belong to the same short list, and Milka was on it first by recording date.","type":"text"}]},{"type":"paragraph","content":[{"text":"The run of singles","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Sin Compromiso, in 2013, is the other record she is known by, and the remix put ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b","displayText":"Chimbala","occurrenceId":"79233593-281f-49b5-b08b-a8ffda0faf3f"}},{"text":" on it. What followed was a decade of singles rather than albums: Infiel, Pásalo Pa’ Acá, 2ble Cara, No Me Dé Cotorra, Bésale La Mano A Mamá, En Mi Cama, Coro Moderno, Plato De Segunda Mesa, La Para, Sonidita, No Me Llames.","type":"text"}]},{"type":"paragraph","content":[{"text":"Then Picante, No Aguanto Más, A Tu Nombre, Aprieta, and in 2019 No Peleo Por Hombre — a title that is a whole position, and one that a woman in this genre in that year was more or less obliged to state out loud.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un Clavo Saca Otro and a live session followed, then Daikiri, Uh Ah, Prende and Desacato, then Noche De Avería, Pa’ Ma Nadie and Me Emperré. She has also cut a record with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"6f0f98bd-7a9a-4d63-a1a4-88ec33415eaa"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Leaving and coming back","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Her career has gaps in it. She has stepped away more than once and come back each time, most recently returning to the stage after a long absence and immediately releasing again.","type":"text"}]},{"type":"paragraph","content":[{"text":"That pattern is not a failure of nerve; it is what a career looks like for a woman who has been in Dominican urban music for the better part of twenty years without ever having a label organise it for her. The audience has been there each time she came back.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Milka la Más Dura, de nombre Milka Sarahí Cruz Ramírez, es cantante, compositora y bailarina urbana dominicana, de Santo Domingo. Empezó en el rap y ya estaba grabando antes de que arrancaran casi todas las mujeres a las que hoy se les reconoce haber abierto el género.","type":"text"}]},{"type":"paragraph","content":[{"text":"El nombre","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Milka es su propio nombre de pila. La más dura es como le decían, y se lo quedó. En la música urbana dominicana los nombres artísticos suelen ser una bravata; este era una descripción que ya venía pegada antes de ser un reclamo.","type":"text"}]},{"type":"paragraph","content":[{"text":"De muy joven estuvo en un trío llamado J.M.T., por Joel, Milka y Trujillo. Después Dale Ven Ven, al final de esa década, y una historia del dembow escrita años más tarde todavía lo nombra entre los discos que movieron el género.","type":"text"}]},{"type":"paragraph","content":[{"text":"Antes de que hubiera carril","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Conviene ser preciso sobre lo temprano que es eso. El dembow dominicano de esos años no tenía mujeres de las que hablar, ni estructura de sellos, ni manera de llegar a la radio. Una mujer grabando rap de calle en Santo Domingo entonces no estaba entrando a una industria: estaba argumentando que debía existir una para ella.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las mujeres que hoy se nombran como pioneras del formato —","type":"text"},{"type":"artistReference","attrs":{"artistId":"580293c3-1e1e-418f-8555-8082665c22b0","displayText":"MelyMel","occurrenceId":"f2e9a7fb-a9e9-4189-b875-bc230adef8af"}},{"text":" en el rap, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"639de91e-2507-491c-a58a-ce4e77af065d","displayText":"La Materialista","occurrenceId":"bcf26456-ed20-448b-9c39-5f458df0bc8e"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"02120de0-6cd9-4955-b4f7-859a3a401a65"}},{"text":" en el dembow— pertenecen a esa misma lista corta, y Milka estuvo en ella primero por fecha de grabación.","type":"text"}]},{"type":"paragraph","content":[{"text":"La seguidilla de sencillos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Sin Compromiso, de 2013, es el otro disco por el que se le conoce, y el remix le puso a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b","displayText":"Chimbala","occurrenceId":"777507b0-bae0-4969-a394-9b01a73bf7a1"}},{"text":" encima. Lo que vino después fue una década de sencillos y no de álbumes: Infiel, Pásalo Pa’ Acá, 2ble Cara, No Me Dé Cotorra, Bésale La Mano A Mamá, En Mi Cama, Coro Moderno, Plato De Segunda Mesa, La Para, Sonidita, No Me Llames.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después Picante, No Aguanto Más, A Tu Nombre, Aprieta, y en 2019 No Peleo Por Hombre: un título que es una posición entera, y una que a una mujer de este género en ese año más o menos le tocaba decir en voz alta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Siguieron Un Clavo Saca Otro y una sesión en vivo, luego Daikiri, Uh Ah, Prende y Desacato, y después Noche De Avería, Pa’ Ma Nadie y Me Emperré. También ha grabado con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"90f0f77f-b649-432d-a240-d1eba31caaa9"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Irse y volver","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su carrera tiene huecos. Se ha apartado más de una vez y ha vuelto todas, la última tras una ausencia larga, y volviendo a publicar de inmediato.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese patrón no es falta de carácter: es como se ve una carrera de una mujer que lleva casi veinte años en la música urbana dominicana sin que ningún sello se la haya organizado nunca. El público ha estado ahí cada vez que ha vuelto.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'en'), '6f0f98bd-7a9a-4d63-a1a4-88ec33415eaa', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'en'), '786a2859-e960-4ccf-a6d4-d284d7710206', 'artist', '639de91e-2507-491c-a58a-ce4e77af065d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'en'), '79233593-281f-49b5-b08b-a8ffda0faf3f', 'artist', 'cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'en'), '7ae58ba8-f0ae-49b6-ad25-3356ac26cb46', 'artist', '580293c3-1e1e-418f-8555-8082665c22b0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'en'), '9ad799da-b83b-4f7d-bc43-1dcacd5dbb9a', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'es'), '02120de0-6cd9-4955-b4f7-859a3a401a65', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'es'), '777507b0-bae0-4969-a394-9b01a73bf7a1', 'artist', 'cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'es'), '90f0f77f-b649-432d-a240-d1eba31caaa9', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'es'), 'bcf26456-ed20-448b-9c39-5f458df0bc8e', 'artist', '639de91e-2507-491c-a58a-ce4e77af065d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'milka-la-mas-dura') AND locale = 'es'), 'f2e9a7fb-a9e9-4189-b875-bc230adef8af', 'artist', '580293c3-1e1e-418f-8555-8082665c22b0');

COMMIT;
