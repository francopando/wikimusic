BEGIN;

-- Rewrite the catalogue entry for Papaa Tyga.
--
-- Papaa Tyga. Filler in English, nothing in Spanish, no legal name at all, no
-- occupations, no genres -- on a dembowsero with three quarters of a million
-- subscribers who came out of Hondo Valle, in Elías Piña, which is about as far
-- from the Dominican music industry as it is possible to be and still be in the
-- country.
--
-- FILLED: legal name Geuriz Valentín Francisco Montero, date_of_birth 14
-- February 1998. The stored birth_year 1998 already matched. El Nuevo Diario
-- uses the first name Geuriz in its own copy, which corroborates the fuller
-- name from a second source.
--
-- ADDED: occupations composer, genres, aliases, disambiguation, the emerging
-- tag -- though a man with seventy-one released videos is arguably past
-- emerging, the catalogue uses it for artists whose careers began in the last
-- few years.
--
-- LEFT ALONE: province Elías Piña and birth_place Hondo Valle, both already
-- stored and both confirmed.
--
-- SOURCES: El Nuevo Diario, 4 May 2023, by Pedro Hernández, reporting an
-- interview with Manuel Meccariello on Manuel & Magazine: the departure from
-- Hondo Valle for the capital to study music behind the pretext of medicine,
-- the run of collaborations with Bulín 47, Flow 28, Ceky Viciny, Yaisel and Jey
-- One, and the people who closed doors on him early and came back afterwards.
-- The same paper on La Tumba following the success of Vivo por Palomo, where
-- the name Geuriz appears in the body copy. A Proyecto Cubano Entertainment
-- post for the full legal name and the birth date. His own YouTube channel for
-- the released work: Lindo, Ay Mi Gatito with Nfasis, Yo Voy a Mi, No Son al
-- 100, Mujeriego, Trucho Sincero, La Alta, El Sistema de la Calle, Dile, Me
-- Fundiste, La Ley, Nadie Anda Estándar with Mezy Beats and ThChoco, Quiere
-- Calle with Jey One, and Por el Sonido. DJ Scuff's channel for the Vivo por
-- Palomo freestyle. Telemicro's Extremo a Extremo and La Universidad de la
-- Calle for the interviews, the second of which is about how Bulín 47 changed
-- the course of his career.
--
-- A DETAIL HANDLED CAREFULLY. Several video titles say he was shining shoes
-- before the music. That comes from interview thumbnails rather than from any
-- written source, and the one newspaper account describes the poverty in
-- general terms without that specific. The entry says he arrived with nothing
-- and does not put a job in his hands that only a thumbnail claims.
--
-- NOT WRITTEN: subscriber and view counts. Nothing about the disputes with
-- other artists that two of the interviews are built on.
--
-- NOT LINKED: Nfasis, Jey One, Yaisel LM, Leidy Laury, Mezy Beats and ThChoco
-- are Dominican and have no entries.
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
       name = 'Papaa Tyga',
       sort_name = 'Papaa Tyga',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1998-02-14',
       birth_year = 1998,
       date_of_death = NULL,
       birth_place = 'Hondo Valle',
       province = 'Elías Piña',
       first_name = 'Geuriz',
       middle_name = 'Valentín',
       last_name = 'Francisco',
       second_last_name = 'Montero',
       stage_name = 'Papaa Tyga',
       aliases = ARRAY['Papa Tyga']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = NULL,
       youtube = '@PapaaTyga',
       facebook = 'luis.manuel.gil.993922',
       instagram = 'papaatyga',
       disambiguation = 'Dembow singer from Hondo Valle, Elías Piña; Vivo por Palomo',
       bio_en = 'Papaa Tyga, born Geuriz Valentín Francisco Montero, is a Dominican dembow singer from Hondo Valle, in Elías Piña. Almost nobody in Dominican popular music comes from there.

**Hondo Valle**

Elías Piña sits on the Haitian border in the deep south-west and is the poorest province in the country. Hondo Valle is a mountain town inside it. The distance from there to a recording studio in Santo Domingo is not measured in kilometres.

He left for the capital to study music, and told his mother he was going to study medicine. That is the whole shape of the decision in one sentence: the career was not something a family in Hondo Valle could be asked to underwrite.

**Vivo por Palomo**

The record that broke was Vivo por Palomo, and the freestyle version he cut for DJ Scuff carried it further. La Tumba followed on the strength of it.

By then he was recording with the centre of the genre — Bulin 47, Flow 28, Ceky Viciny, Yaisel and Jey One. He has said that Bulin 47 is the one who changed the direction of his career, and in dembow that kind of debt is usually stated plainly rather than implied.

**The catalogue**

Seventy-one released videos sit on his channel: Lindo, Mujeriego, La Alta, El Sistema de la Calle, Dile, Me Fundiste, La Ley, Trucho Sincero, Yo Voy a Mi, No Son al 100. Ay Mi Gatito was made with Nfasis, Quiere Calle with Jey One, Nadie Anda Estándar with Mezy Beats and ThChoco.

He has said that the people who shut doors on him at the start came back once the numbers arrived, and that he decided to work without resentment. Whether or not that is the whole story, it is the position he has chosen to state in public, and it is unusual in a genre that runs largely on grievance.

**The province in the record**

Dembow is overwhelmingly a music of the capital’s barrios, and its vocabulary, its accent and its references come from there. Somebody arriving from the south-west border has to either take that accent on or keep his own.

He kept enough of his own that the origin is audible, and it is part of why the story travelled: an audience that knows exactly how far Hondo Valle is from anywhere heard one of its own on the radio.',
       bio_es = 'Papaa Tyga, de nombre Geuriz Valentín Francisco Montero, es un dembowsero dominicano de Hondo Valle, en Elías Piña. De allá no sale casi nadie en la música popular dominicana.

**Hondo Valle**

Elías Piña está en la frontera con Haití, en el suroeste profundo, y es la provincia más pobre del país. Hondo Valle es un pueblo de montaña dentro de ella. La distancia de ahí a un estudio de grabación en Santo Domingo no se mide en kilómetros.

Se fue a la capital a estudiar música, y a su madre le dijo que iba a estudiar medicina. Ahí está la forma entera de la decisión en una sola frase: la carrera no era algo que se le pudiera pedir a una familia de Hondo Valle que respaldara.

**Vivo por Palomo**

El disco que rompió fue Vivo por Palomo, y la versión en freestyle que grabó para DJ Scuff lo llevó más lejos. La Tumba salió montada sobre eso.

Para entonces ya grababa con el centro del género: Bulin 47, Flow 28, Ceky Viciny, Yaisel y Jey One. Ha dicho que Bulin 47 fue quien le cambió el rumbo a la carrera, y en el dembow esa clase de deuda se suele decir de frente y no insinuar.

**El catálogo**

En su canal hay setenta y un videos publicados: Lindo, Mujeriego, La Alta, El Sistema de la Calle, Dile, Me Fundiste, La Ley, Trucho Sincero, Yo Voy a Mi, No Son al 100. Ay Mi Gatito la hizo con Nfasis, Quiere Calle con Jey One, Nadie Anda Estándar con Mezy Beats y ThChoco.

Ha dicho que la gente que le cerró las puertas al principio se le acercó cuando llegaron los números, y que decidió trabajar sin rencor. Sea o no la historia completa, es la posición que ha escogido decir en público, y es rara en un género que funciona en buena medida a base de agravio.

**La provincia dentro del disco**

El dembow es abrumadoramente una música de los barrios de la capital, y de ahí vienen su vocabulario, su acento y sus referencias. Quien llega de la frontera suroeste tiene que agarrar ese acento o quedarse con el suyo.

Se quedó con bastante del suyo como para que el origen se oiga, y esa es parte de la razón por la que la historia viajó: un público que sabe exactamente lo lejos que está Hondo Valle de cualquier parte oyó a uno de los suyos en la radio.',
       updated_at = now()
 WHERE slug = 'papaa-tyga';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Papaa Tyga, born Geuriz Valentín Francisco Montero, is a Dominican dembow singer from Hondo Valle, in Elías Piña. Almost nobody in Dominican popular music comes from there.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hondo Valle","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Elías Piña sits on the Haitian border in the deep south-west and is the poorest province in the country. Hondo Valle is a mountain town inside it. The distance from there to a recording studio in Santo Domingo is not measured in kilometres.","type":"text"}]},{"type":"paragraph","content":[{"text":"He left for the capital to study music, and told his mother he was going to study medicine. That is the whole shape of the decision in one sentence: the career was not something a family in Hondo Valle could be asked to underwrite.","type":"text"}]},{"type":"paragraph","content":[{"text":"Vivo por Palomo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The record that broke was Vivo por Palomo, and the freestyle version he cut for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"10af186d-eb86-4174-9b98-5f5b52765be2"}},{"text":" carried it further. La Tumba followed on the strength of it.","type":"text"}]},{"type":"paragraph","content":[{"text":"By then he was recording with the centre of the genre — ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"0ba5d106-55ad-4c2a-b5b3-1375447ea5e5"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"725f7cd5-de62-4e76-b382-0d55c160d51f","displayText":"Flow 28","occurrenceId":"f9a53921-4dc1-44f4-a0b9-cdb1a7616af6"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"266d031e-b168-45d0-a18b-a2d7f32ab83f"}},{"text":", Yaisel and Jey One. He has said that ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"6fec567b-4046-4be0-b278-745b02580bd9"}},{"text":" is the one who changed the direction of his career, and in dembow that kind of debt is usually stated plainly rather than implied.","type":"text"}]},{"type":"paragraph","content":[{"text":"The catalogue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Seventy-one released videos sit on his channel: Lindo, Mujeriego, La Alta, El Sistema de la Calle, Dile, Me Fundiste, La Ley, Trucho Sincero, Yo Voy a Mi, No Son al 100. Ay Mi Gatito was made with Nfasis, Quiere Calle with Jey One, Nadie Anda Estándar with Mezy Beats and ThChoco.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has said that the people who shut doors on him at the start came back once the numbers arrived, and that he decided to work without resentment. Whether or not that is the whole story, it is the position he has chosen to state in public, and it is unusual in a genre that runs largely on grievance.","type":"text"}]},{"type":"paragraph","content":[{"text":"The province in the record","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dembow is overwhelmingly a music of the capital’s barrios, and its vocabulary, its accent and its references come from there. Somebody arriving from the south-west border has to either take that accent on or keep his own.","type":"text"}]},{"type":"paragraph","content":[{"text":"He kept enough of his own that the origin is audible, and it is part of why the story travelled: an audience that knows exactly how far Hondo Valle is from anywhere heard one of its own on the radio.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'papaa-tyga'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Papaa Tyga, de nombre Geuriz Valentín Francisco Montero, es un dembowsero dominicano de Hondo Valle, en Elías Piña. De allá no sale casi nadie en la música popular dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hondo Valle","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Elías Piña está en la frontera con Haití, en el suroeste profundo, y es la provincia más pobre del país. Hondo Valle es un pueblo de montaña dentro de ella. La distancia de ahí a un estudio de grabación en Santo Domingo no se mide en kilómetros.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se fue a la capital a estudiar música, y a su madre le dijo que iba a estudiar medicina. Ahí está la forma entera de la decisión en una sola frase: la carrera no era algo que se le pudiera pedir a una familia de Hondo Valle que respaldara.","type":"text"}]},{"type":"paragraph","content":[{"text":"Vivo por Palomo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El disco que rompió fue Vivo por Palomo, y la versión en freestyle que grabó para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"8e86195a-e09f-4636-9be6-b23346ff9192"}},{"text":" lo llevó más lejos. La Tumba salió montada sobre eso.","type":"text"}]},{"type":"paragraph","content":[{"text":"Para entonces ya grababa con el centro del género: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"2dde2017-02cf-41f8-a9bb-7cad5b5557bd"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"725f7cd5-de62-4e76-b382-0d55c160d51f","displayText":"Flow 28","occurrenceId":"fe6d3d1a-ba6b-4529-9853-38cfe9730f37"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"761674cc-c420-4d8d-b163-d6c1760e74ed"}},{"text":", Yaisel y Jey One. Ha dicho que ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"6c428b67-ff5a-4ff1-88f5-21826c91e5ea"}},{"text":" fue quien le cambió el rumbo a la carrera, y en el dembow esa clase de deuda se suele decir de frente y no insinuar.","type":"text"}]},{"type":"paragraph","content":[{"text":"El catálogo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En su canal hay setenta y un videos publicados: Lindo, Mujeriego, La Alta, El Sistema de la Calle, Dile, Me Fundiste, La Ley, Trucho Sincero, Yo Voy a Mi, No Son al 100. Ay Mi Gatito la hizo con Nfasis, Quiere Calle con Jey One, Nadie Anda Estándar con Mezy Beats y ThChoco.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ha dicho que la gente que le cerró las puertas al principio se le acercó cuando llegaron los números, y que decidió trabajar sin rencor. Sea o no la historia completa, es la posición que ha escogido decir en público, y es rara en un género que funciona en buena medida a base de agravio.","type":"text"}]},{"type":"paragraph","content":[{"text":"La provincia dentro del disco","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El dembow es abrumadoramente una música de los barrios de la capital, y de ahí vienen su vocabulario, su acento y sus referencias. Quien llega de la frontera suroeste tiene que agarrar ese acento o quedarse con el suyo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se quedó con bastante del suyo como para que el origen se oiga, y esa es parte de la razón por la que la historia viajó: un público que sabe exactamente lo lejos que está Hondo Valle de cualquier parte oyó a uno de los suyos en la radio.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'papaa-tyga'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'en'), '0ba5d106-55ad-4c2a-b5b3-1375447ea5e5', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'en'), '10af186d-eb86-4174-9b98-5f5b52765be2', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'en'), '266d031e-b168-45d0-a18b-a2d7f32ab83f', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'en'), '6fec567b-4046-4be0-b278-745b02580bd9', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'en'), 'f9a53921-4dc1-44f4-a0b9-cdb1a7616af6', 'artist', '725f7cd5-de62-4e76-b382-0d55c160d51f');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'es'), '2dde2017-02cf-41f8-a9bb-7cad5b5557bd', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'es'), '6c428b67-ff5a-4ff1-88f5-21826c91e5ea', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'es'), '761674cc-c420-4d8d-b163-d6c1760e74ed', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'es'), '8e86195a-e09f-4636-9be6-b23346ff9192', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'papaa-tyga') AND locale = 'es'), 'fe6d3d1a-ba6b-4529-9853-38cfe9730f37', 'artist', '725f7cd5-de62-4e76-b382-0d55c160d51f');

COMMIT;
