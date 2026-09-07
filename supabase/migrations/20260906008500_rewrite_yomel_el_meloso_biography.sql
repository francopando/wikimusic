BEGIN;

-- Rewrite the catalogue entry for Yomel el Meloso.
--
-- Yomel el Meloso. Filler in English, nothing in Spanish, no gender, no
-- occupations, no genres, no aliases.
--
-- FILLED: gender male; date_of_birth 16 December 1995 (birth_year 1995 already
-- stored and matching, confirmed by two sources); occupations composer; genres;
-- aliases.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo". BuenaMusica gives only the city, no barrio, so the province is
-- consistent with what is known and nothing more specific can be written.
--
-- A CROSS-CONFIRMATION THAT RESOLVES AN OPEN QUESTION IN ANOTHER ENTRY. Ito
-- Ogamy's entry, written earlier today, names a track called El Pichirry billed
-- "Ito Ogamy x Kiko El Crazy x Meloso x Cherry Scom" and says explicitly that
-- "Meloso" was NOT linked because nothing connected that credit to Yomel el
-- Meloso. BuenaMusica's chronology closes it: in 2019 Yomel released "El
-- Pichirri" with Kiko el Crazy and El Cherry Scom. Same title, same two named
-- collaborators, same year. It is the same record and the same person. Ito
-- Ogamy's entry should now be relinked; it is noted here so the connection is
-- not lost.
--
-- SOURCES, more than one for the spine: BuenaMusica for the birth date, the
-- discovery of music at fourteen, the start improvising, the 2017 signing to
-- 0201Music, and the year-by-year singles from Pásate in 2018 through Mari in
-- 2021. His own YouTube channel for everything since: Trucha Trucha with El
-- Sonnii RD, Zepe Alkaeda and Rip Chino, Lamine Yamal, the Malo y Ya remix with
-- Ezzy R and Yenssy No Te Haga, Lo Chico Sample with Leo RD, Ganas de Ti, Por
-- Una Foto with Rochy RD, Pases Bien and its remix, Tu Diligencia with Yaii
-- King, El Motor and Jamaica. Listín Diario, 31 January 2020, for the Premios Q
-- statuette as Revelación del Año. Deezer's artist text. Two long Alofoke Radio
-- Show interviews. And two entries already in this catalogue -- Kiko el Crazy's
-- and Ito Ogamy's -- which independently place him on El Pichirry.
--
-- A CONTRADICTION NOTED. One Instagram summary says he began professionally in
-- early 2022. BuenaMusica says 2018 and Listín Diario was writing about his
-- award in January 2020. The 2022 date is wrong and is not used.
--
-- NOT WRITTEN. BuenaMusica's "Vida Personal" section is a 2021 criminal
-- accusation of physical, verbal and psychological abuse against a former
-- partner. Criminal matters and personal life are both outside what this
-- catalogue records, and neither the accusation nor the relationship appears
-- here. The 2020 song Cuando Tú Me Besas IS named, because it is a record he
-- made; the entry treats it as a credit and nothing else.
--
-- ALSO NOT WRITTEN: a breach-of-contract suit reported against him weeks ago.
-- A credits and royalties dispute would belong in this catalogue, because
-- authorship is what it records -- that is why Puyalo Pantera's is in his entry
-- -- but nothing found says what this suit is about, and a business dispute of
-- unknown subject is not the same thing. Left out until it is known.
--
-- NOT LINKED: Ovi is Panamanian. El Jincho, La Perversa, Ezzy R, El Sonnii RD,
-- Zepe Alkaeda, Rip Chino, Yenssy No Te Haga and Yaii King are Dominican and
-- have no entries.
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
       name = 'Yomel el Meloso',
       sort_name = 'Hernández, Cristofer',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1995-12-16',
       birth_year = 1995,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Cristofer',
       middle_name = NULL,
       last_name = 'Hernández',
       second_last_name = NULL,
       stage_name = 'Yomel el Meloso',
       aliases = ARRAY['Yomel', 'Yomel El Meloso']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop', 'urban-trap', 'urban-reggaeton']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@YOMELELMELOSO',
       facebook = 'yomelelmeloso',
       instagram = 'yomel.parita',
       disambiguation = 'Dembow singer; El Espagueti, El Pichirri, Pases Bien',
       bio_en = 'Yomel el Meloso, born Cristofer Hernández, is a Dominican dembow singer and songwriter. He found the music at fourteen, started by improvising, and was picked up by producers who signed him to a label in 2017.

**The run of singles**

From 2018 the records arrive without pause: Pásate, A Carta Blanca, Los Pomposos, Sexy, Yo Me Curo, and El Espagueti with Químico Ultra Mega. En Ruta, in 2019, was cut with Ceky Viciny.

That same year came El Pichirri, made with Kiko el Crazy, El Cherry Scom and Ito Ogamy — which is an unusual room, because Ito Ogamy had been rapping in Santo Domingo since before Yomel was born. Dominican urban music puts three generations on one track more casually than any other genre in the country.

2020 brought Malísimo y Pico, Ruégale, Freaky Party, Cuando Tú Me Besas and Los Quita Novia, the last of those with El Cherry Scom and Leo RD. 2021 brought Atento a la Parita, Fiestatata, Pa Japón, Abatido and Mari.

**Revelación**

He took the Premios Q statuette as revelation of the year, and Listín Diario was writing about it in January 2020 — two years into a career that has not slowed since.

**What he sounds like**

He is filed as a dembow artist and he is one, but rap, trap and reggaetón all turn up inside the records. What he is actually known for among Dominican listeners is delivery: an energy and a phrasing that carry a track built on very little.

Millonario put him with Chimbala, El Cherry Scom and Kiko el Crazy at once. Por Una Foto was made with Rochy RD. Pases Bien and its remix, El Motor, Jamaica, Ganas de Ti, Lo Chico Sample with Leo RD, and a track named after a footballer — Lamine Yamal — are all recent.

Naming a dembow record after a teenage winger is exactly the move the genre keeps making: take whatever the street is talking about this month and put it in a title before anyone else does.',
       bio_es = 'Yomel el Meloso, de nombre Cristofer Hernández, es cantante y compositor de dembow dominicano. Encontró la música a los catorce años, empezó improvisando, y lo levantaron unos productores que lo firmaron con un sello en 2017.

**La seguidilla de sencillos**

Desde 2018 los discos llegan sin pausa: Pásate, A Carta Blanca, Los Pomposos, Sexy, Yo Me Curo, y El Espagueti con Químico Ultra Mega. En Ruta, de 2019, la grabó con Ceky Viciny.

Ese mismo año salió El Pichirri, hecha con Kiko el Crazy, El Cherry Scom e Ito Ogamy: una sala rara, porque Ito Ogamy llevaba rapeando en Santo Domingo desde antes de que Yomel naciera. La música urbana dominicana pone tres generaciones en un mismo tema con más naturalidad que cualquier otro género del país.

2020 trajo Malísimo y Pico, Ruégale, Freaky Party, Cuando Tú Me Besas y Los Quita Novia, esta última con El Cherry Scom y Leo RD. 2021 trajo Atento a la Parita, Fiestatata, Pa Japón, Abatido y Mari.

**Revelación**

Se llevó la estatuilla de los Premios Q como revelación del año, y Listín Diario escribía sobre eso en enero de 2020: dos años dentro de una carrera que desde entonces no ha bajado.

**A qué suena**

Está fichado como dembowsero y lo es, pero dentro de los discos aparecen rap, trap y reguetón. Por lo que de verdad se le conoce entre los oyentes dominicanos es por la entrega: una energía y un fraseo que sostienen un tema armado con muy poco.

Millonario lo puso a la vez con Chimbala, El Cherry Scom y Kiko el Crazy. Por Una Foto la hizo con Rochy RD. Pases Bien y su remix, El Motor, Jamaica, Ganas de Ti, Lo Chico Sample con Leo RD, y un tema con nombre de futbolista —Lamine Yamal— son todos recientes.

Ponerle a un disco de dembow el nombre de un extremo adolescente es exactamente la jugada que el género repite: agarrar de lo que habla la calle este mes y meterlo en un título antes que nadie.',
       updated_at = now()
 WHERE slug = 'yomel-el-meloso';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Yomel el Meloso, born Cristofer Hernández, is a Dominican dembow singer and songwriter. He found the music at fourteen, started by improvising, and was picked up by producers who signed him to a label in 2017.","type":"text"}]},{"type":"paragraph","content":[{"text":"The run of singles","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"From 2018 the records arrive without pause: Pásate, A Carta Blanca, Los Pomposos, Sexy, Yo Me Curo, and El Espagueti with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"1f8b3dfd-02d3-40bd-94f5-7231b95ac86b"}},{"text":". En Ruta, in 2019, was cut with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"203a61a7-501c-4761-a0be-9193645dfd39"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"That same year came El Pichirri, made with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9be0ed08-6eb6-4ca0-bb68-d5126190aeb1","displayText":"Kiko el Crazy","occurrenceId":"46417a22-7589-4ee6-9d89-51d7bba56170"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"7742895c-d631-459d-9bc5-b48bd0022b90"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"86fdf7d2-f8c3-457f-a318-20bb7b5a207e","displayText":"Ito Ogamy","occurrenceId":"40fb1934-ffc9-4131-a5bc-c9ee51567e30"}},{"text":" — which is an unusual room, because Ito Ogamy had been rapping in Santo Domingo since before Yomel was born. Dominican urban music puts three generations on one track more casually than any other genre in the country.","type":"text"}]},{"type":"paragraph","content":[{"text":"2020 brought Malísimo y Pico, Ruégale, Freaky Party, Cuando Tú Me Besas and Los Quita Novia, the last of those with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"95213a8d-a569-4846-916f-a837d316595c"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5cbc8f2b-cb68-4ebd-8006-6837be54bbe4","displayText":"Leo RD","occurrenceId":"68d2d243-0e30-4212-b509-3e9329922dc4"}},{"text":". 2021 brought Atento a la Parita, Fiestatata, Pa Japón, Abatido and Mari.","type":"text"}]},{"type":"paragraph","content":[{"text":"Revelación","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He took the Premios Q statuette as revelation of the year, and Listín Diario was writing about it in January 2020 — two years into a career that has not slowed since.","type":"text"}]},{"type":"paragraph","content":[{"text":"What he sounds like","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is filed as a dembow artist and he is one, but rap, trap and reggaetón all turn up inside the records. What he is actually known for among Dominican listeners is delivery: an energy and a phrasing that carry a track built on very little.","type":"text"}]},{"type":"paragraph","content":[{"text":"Millonario put him with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b","displayText":"Chimbala","occurrenceId":"74cd5825-dad5-4e0c-9d54-9be351903391"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"7d3ee36a-b8ab-4439-a5d0-a8d917e6600f"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9be0ed08-6eb6-4ca0-bb68-d5126190aeb1","displayText":"Kiko el Crazy","occurrenceId":"ead12a5d-f242-4d3b-bcee-48fe412d1930"}},{"text":" at once. Por Una Foto was made with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb","displayText":"Rochy RD","occurrenceId":"0c88f6f1-208e-4db7-b48c-811f3bf29d80"}},{"text":". Pases Bien and its remix, El Motor, Jamaica, Ganas de Ti, Lo Chico Sample with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5cbc8f2b-cb68-4ebd-8006-6837be54bbe4","displayText":"Leo RD","occurrenceId":"7253a700-5c00-434a-a2de-e8d7153c565f"}},{"text":", and a track named after a footballer — Lamine Yamal — are all recent.","type":"text"}]},{"type":"paragraph","content":[{"text":"Naming a dembow record after a teenage winger is exactly the move the genre keeps making: take whatever the street is talking about this month and put it in a title before anyone else does.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'yomel-el-meloso'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Yomel el Meloso, de nombre Cristofer Hernández, es cantante y compositor de dembow dominicano. Encontró la música a los catorce años, empezó improvisando, y lo levantaron unos productores que lo firmaron con un sello en 2017.","type":"text"}]},{"type":"paragraph","content":[{"text":"La seguidilla de sencillos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Desde 2018 los discos llegan sin pausa: Pásate, A Carta Blanca, Los Pomposos, Sexy, Yo Me Curo, y El Espagueti con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"ca4ad673-1f59-48d5-ac6f-c416f2fbf8b9"}},{"text":". En Ruta, de 2019, la grabó con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"34eab910-d28d-4ed0-a3ca-8486af682cc9"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese mismo año salió El Pichirri, hecha con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9be0ed08-6eb6-4ca0-bb68-d5126190aeb1","displayText":"Kiko el Crazy","occurrenceId":"efb99c58-92a0-45ae-bc53-3bb49c588905"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"95add919-e492-43e6-9e46-ba5fc0792ec4"}},{"text":" e ","type":"text"},{"type":"artistReference","attrs":{"artistId":"86fdf7d2-f8c3-457f-a318-20bb7b5a207e","displayText":"Ito Ogamy","occurrenceId":"e8d5b2b1-c8fa-4d75-8d7c-14681de41768"}},{"text":": una sala rara, porque Ito Ogamy llevaba rapeando en Santo Domingo desde antes de que Yomel naciera. La música urbana dominicana pone tres generaciones en un mismo tema con más naturalidad que cualquier otro género del país.","type":"text"}]},{"type":"paragraph","content":[{"text":"2020 trajo Malísimo y Pico, Ruégale, Freaky Party, Cuando Tú Me Besas y Los Quita Novia, esta última con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"d14e26c7-dfc8-4b52-af95-c467f24d8297"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5cbc8f2b-cb68-4ebd-8006-6837be54bbe4","displayText":"Leo RD","occurrenceId":"438b6706-2675-41d2-8c8b-a8649504fe5c"}},{"text":". 2021 trajo Atento a la Parita, Fiestatata, Pa Japón, Abatido y Mari.","type":"text"}]},{"type":"paragraph","content":[{"text":"Revelación","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se llevó la estatuilla de los Premios Q como revelación del año, y Listín Diario escribía sobre eso en enero de 2020: dos años dentro de una carrera que desde entonces no ha bajado.","type":"text"}]},{"type":"paragraph","content":[{"text":"A qué suena","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Está fichado como dembowsero y lo es, pero dentro de los discos aparecen rap, trap y reguetón. Por lo que de verdad se le conoce entre los oyentes dominicanos es por la entrega: una energía y un fraseo que sostienen un tema armado con muy poco.","type":"text"}]},{"type":"paragraph","content":[{"text":"Millonario lo puso a la vez con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b","displayText":"Chimbala","occurrenceId":"308f65bd-25df-4cce-94a5-6d6dcd50980d"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"cca3851c-3548-40ff-a829-a13a48ad52a4"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9be0ed08-6eb6-4ca0-bb68-d5126190aeb1","displayText":"Kiko el Crazy","occurrenceId":"4934fb73-786f-4a8a-997a-fcc28464f638"}},{"text":". Por Una Foto la hizo con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb","displayText":"Rochy RD","occurrenceId":"2708c8c6-da71-4e0e-bfed-64b71a449e02"}},{"text":". Pases Bien y su remix, El Motor, Jamaica, Ganas de Ti, Lo Chico Sample con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5cbc8f2b-cb68-4ebd-8006-6837be54bbe4","displayText":"Leo RD","occurrenceId":"1baf55a0-f4ea-4389-9556-2c9330ebd692"}},{"text":", y un tema con nombre de futbolista —Lamine Yamal— son todos recientes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ponerle a un disco de dembow el nombre de un extremo adolescente es exactamente la jugada que el género repite: agarrar de lo que habla la calle este mes y meterlo en un título antes que nadie.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'yomel-el-meloso'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '0c88f6f1-208e-4db7-b48c-811f3bf29d80', 'artist', '71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '1f8b3dfd-02d3-40bd-94f5-7231b95ac86b', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '203a61a7-501c-4761-a0be-9193645dfd39', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '40fb1934-ffc9-4131-a5bc-c9ee51567e30', 'artist', '86fdf7d2-f8c3-457f-a318-20bb7b5a207e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '46417a22-7589-4ee6-9d89-51d7bba56170', 'artist', '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '68d2d243-0e30-4212-b509-3e9329922dc4', 'artist', '5cbc8f2b-cb68-4ebd-8006-6837be54bbe4');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '7253a700-5c00-434a-a2de-e8d7153c565f', 'artist', '5cbc8f2b-cb68-4ebd-8006-6837be54bbe4');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '74cd5825-dad5-4e0c-9d54-9be351903391', 'artist', 'cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '7742895c-d631-459d-9bc5-b48bd0022b90', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '7d3ee36a-b8ab-4439-a5d0-a8d917e6600f', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), '95213a8d-a569-4846-916f-a837d316595c', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'en'), 'ead12a5d-f242-4d3b-bcee-48fe412d1930', 'artist', '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), '1baf55a0-f4ea-4389-9556-2c9330ebd692', 'artist', '5cbc8f2b-cb68-4ebd-8006-6837be54bbe4');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), '2708c8c6-da71-4e0e-bfed-64b71a449e02', 'artist', '71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), '308f65bd-25df-4cce-94a5-6d6dcd50980d', 'artist', 'cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), '34eab910-d28d-4ed0-a3ca-8486af682cc9', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), '438b6706-2675-41d2-8c8b-a8649504fe5c', 'artist', '5cbc8f2b-cb68-4ebd-8006-6837be54bbe4');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), '4934fb73-786f-4a8a-997a-fcc28464f638', 'artist', '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), '95add919-e492-43e6-9e46-ba5fc0792ec4', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), 'ca4ad673-1f59-48d5-ac6f-c416f2fbf8b9', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), 'cca3851c-3548-40ff-a829-a13a48ad52a4', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), 'd14e26c7-dfc8-4b52-af95-c467f24d8297', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), 'e8d5b2b1-c8fa-4d75-8d7c-14681de41768', 'artist', '86fdf7d2-f8c3-457f-a318-20bb7b5a207e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yomel-el-meloso') AND locale = 'es'), 'efb99c58-92a0-45ae-bc53-3bb49c588905', 'artist', '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1');

COMMIT;
