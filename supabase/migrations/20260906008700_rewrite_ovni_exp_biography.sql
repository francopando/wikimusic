BEGIN;

-- Rewrite the catalogue entry for Ovni Exp.
--
-- Ovni Exp. Filler in English, nothing in Spanish, no genres, no aliases -- on
-- a founding figure of Dominican rap who has judged the Red Bull Batalla five
-- years running.
--
-- FILLED: date_of_birth 20 February 1977 (birth_year 1977 already stored and
-- matching); aliases, which Wikidata lists and which turn out to be the map of
-- his career -- OVNI, Ovni LC, Ovni Lo Correcto, Ovni Experiencia, Ovni Exp;
-- genres; the legend tag; disambiguation.
--
-- LEFT ALONE: province Distrito Nacional and birth_place Santo Domingo. No
-- source names a barrio. primary_role singer -> rapper is the one field
-- changed, and primary_genre urban-rap-hip-hop was already right.
--
-- A LINK THAT ALMOST GOT MISSED, AND HOW IT WAS ESTABLISHED. The name "Villaman"
-- appears in accounts of Lo Correcto's rivalry with Charles Family and Complot
-- Records. The catalogue holds a "Beethoven Villaman", and an earlier entry in
-- this run -- R1 la Esencia -- wrongly said Villaman had no entry here. The
-- checker flags the row; what settles the identity is Spanish Wikipedia's Hip
-- hop latino article, which lists Lo Correcto's membership outright: founded by
-- Tony Hasbún and Núcleo Salomón, with Ovni, Básico, SinFin, Faqundo González,
-- Crooklyn and Beethoven Villamán among the members. Same group, same era. The
-- reference is made on that basis and not on the surname.
--
-- SOURCES, several and independent: Spanish Wikipedia's Hip hop latino article
-- for the founding and membership of Lo Correcto. Spotify's and Radiostats'
-- artist text for the legal name and the birth date of 20 February 1977.
-- Wikidata for the aliases. Fenomen Mag, 4 July 2026, on the single Despertar
-- and on five consecutive years judging the Red Bull Batalla. Hoy, 11 August
-- 2026, on World Hip Hop Day, where he is described as a legendary hip hop
-- artist who was part of Lo Correcto and who set out a chronology of the genre's
-- history. Activate con el Negro, 12 May 2022, on the rap lyric-writing workshop
-- he ran with the digital creator Jhonwayne. Instagram interviews with
-- datosmusicard and pirojm, in which he is asked directly whether Lo Correcto
-- felt its position threatened by the arrival of Charles Family and Complot
-- Records between 2003 and 2004, and which describe Lo Correcto as a business
-- cooperative rather than only a crew.
--
-- NOT WRITTEN: nothing about his private life appears in any source found, and
-- none was looked for.
--
-- NOT LINKED: Tony Hasbún, Núcleo Salomón, Básico, SinFin, Faqundo González,
-- Crooklyn, Charles Family and Jhonwayne have no entries. Básico and Núcleo
-- Salomón are notable gaps -- Básico was his partner in the duo Experiencia,
-- which is where one of his aliases comes from.
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
       name = 'Ovni Exp',
       sort_name = 'Martínez Henríquez, Gilberto Miguel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = '1977-02-20',
       birth_year = 1977,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Gilberto',
       middle_name = 'Miguel',
       last_name = 'Martínez',
       second_last_name = 'Henríquez',
       stage_name = 'OVNI',
       aliases = ARRAY['OVNI', 'Ovni LC', 'Ovni Lo Correcto', 'Ovni Experiencia']::text[],
       occupations = '["composer","actor"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = 'https://linktr.ee/OVNIEXP',
       youtube = '@OVNIexp',
       facebook = 'ovniexp',
       instagram = 'ovniexp',
       disambiguation = 'Rapper of Lo Correcto; five-time Red Bull Batalla judge',
       bio_en = 'OVNI, born Gilberto Miguel Martínez Henríquez, is a Dominican rapper and actor. His stage names are a career in a list: Ovni LC, Ovni Lo Correcto, Ovni Experiencia, Ovni Exp. Each one says which room he was in at the time.

**Lo Correcto**

Lo Correcto is a name a Dominican rap history cannot skip. It was founded by Tony Hasbún and Núcleo Salomón and it held OVNI, Básico, SinFin, Faqundo González, Crooklyn and Beethoven Villaman among others.

What made it different from a crew is that it was organised as a business cooperative. In a country where rappers of that era had no label, no radio and no contracts, a group of them pooling the work into a shared structure was not a stylistic choice; it was the only way the records got made and paid for. Ito Ogamy had been doing something adjacent a decade earlier with Alcapón Rap.

Experiencia, the duo he made with Básico, gave him another of his names.

**When the next thing arrived**

Charles Family and Complot Records came up around 2003 and 2004 and changed who the audience was listening to. Lo Correcto ignored them for years, and interviewers still ask OVNI whether the group felt its position slipping. By several accounts it was DJ Scuff who finally pushed Beethoven Villaman into answering.

That is a small story and a useful one. Dominican rap has no institutions, so its history is transmitted as argument — who ignored whom, who answered, who was first — and the people who were there are the only archive.

**The judge’s chair**

He has sat five consecutive years as a judge of the Red Bull Batalla, the largest Spanish-language freestyle competition there is. Judging it means being trusted by rappers across two continents to say who won, which is a different authority from having hits.

He also teaches. In 2022 he ran a rap lyric-writing workshop with the digital creator Jhonwayne, and on World Hip Hop Day a national newspaper asked him, rather than a younger artist, to lay out the chronology of the genre in the country.

Despertar, in July 2026, is his most recent single, and it goes where his generation tends to go: a message rather than a hook. Lápiz Conciente and the rappers who came after him are the ones with the numbers, but OVNI is on the short list of people they all have to acknowledge.',
       bio_es = 'OVNI, de nombre Gilberto Miguel Martínez Henríquez, es rapero y actor dominicano. Sus nombres artísticos son una carrera puesta en lista: Ovni LC, Ovni Lo Correcto, Ovni Experiencia, Ovni Exp. Cada uno dice en qué sala estaba en ese momento.

**Lo Correcto**

Lo Correcto es un nombre que ninguna historia del rap dominicano puede saltarse. Lo fundaron Tony Hasbún y Núcleo Salomón, y por ahí pasaron OVNI, Básico, SinFin, Faqundo González, Crooklyn y Beethoven Villaman, entre otros.

Lo que lo separaba de una banda es que estaba montado como cooperativa empresarial. En un país donde los raperos de esa época no tenían sello, ni radio, ni contratos, que un grupo de ellos juntara el trabajo en una estructura común no era una decisión de estilo: era la única manera de que los discos se hicieran y se pagaran. Ito Ogamy había hecho algo parecido una década antes con Alcapón Rap.

Experiencia, el dúo que armó con Básico, le dio otro de sus nombres.

**Cuando llegó lo que venía después**

Charles Family y Complot Records aparecieron alrededor de 2003 y 2004 y cambiaron a quién oía el público. Lo Correcto los ignoró durante años, y todavía hoy los entrevistadores le preguntan a OVNI si el grupo sintió que se le iba el terreno. Por varios relatos fue DJ Scuff quien finalmente empujó a Beethoven Villaman a contestar.

Es una historia pequeña y útil. El rap dominicano no tiene instituciones, así que su historia se transmite como discusión —quién ignoró a quién, quién contestó, quién fue primero— y la gente que estuvo ahí es el único archivo.

**La silla del jurado**

Lleva cinco años consecutivos como jurado de la Red Bull Batalla, la competencia de freestyle en español más grande que existe. Ser jurado ahí significa que raperos de dos continentes confían en que uno diga quién ganó, que es otra autoridad distinta de tener éxitos.

También enseña. En 2022 dio un taller de composición de letras de rap con el creador digital Jhonwayne, y el Día Mundial del Hip Hop un periódico nacional le pidió a él, y no a un artista más joven, que trazara la cronología del género en el país.

Despertar, de julio de 2026, es su sencillo más reciente, y va a donde suele ir su generación: un mensaje antes que un gancho. Lápiz Conciente y los raperos que vinieron después son los que tienen los números, pero OVNI está en la lista corta de gente a la que todos tienen que reconocer.',
       updated_at = now()
 WHERE slug = 'ovni-exp';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"OVNI, born Gilberto Miguel Martínez Henríquez, is a Dominican rapper and actor. His stage names are a career in a list: Ovni LC, Ovni Lo Correcto, Ovni Experiencia, Ovni Exp. Each one says which room he was in at the time.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo Correcto","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo Correcto is a name a Dominican rap history cannot skip. It was founded by Tony Hasbún and Núcleo Salomón and it held OVNI, Básico, SinFin, Faqundo González, Crooklyn and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8f152297-560f-4ebb-9e93-7b46e5b86aac","displayText":"Beethoven Villaman","occurrenceId":"3e2a2711-34f6-4aef-9c32-41ccf035f67d"}},{"text":" among others.","type":"text"}]},{"type":"paragraph","content":[{"text":"What made it different from a crew is that it was organised as a business cooperative. In a country where rappers of that era had no label, no radio and no contracts, a group of them pooling the work into a shared structure was not a stylistic choice; it was the only way the records got made and paid for. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"86fdf7d2-f8c3-457f-a318-20bb7b5a207e","displayText":"Ito Ogamy","occurrenceId":"b8b636d3-2924-49c0-9870-d7e43961018e"}},{"text":" had been doing something adjacent a decade earlier with Alcapón Rap.","type":"text"}]},{"type":"paragraph","content":[{"text":"Experiencia, the duo he made with Básico, gave him another of his names.","type":"text"}]},{"type":"paragraph","content":[{"text":"When the next thing arrived","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Charles Family and Complot Records came up around 2003 and 2004 and changed who the audience was listening to. Lo Correcto ignored them for years, and interviewers still ask OVNI whether the group felt its position slipping. By several accounts it was ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"6e716bd7-e3b8-4710-a089-3b4a313d1b4f"}},{"text":" who finally pushed ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8f152297-560f-4ebb-9e93-7b46e5b86aac","displayText":"Beethoven Villaman","occurrenceId":"68330f3e-77ce-44f4-bee0-bbad76c4f6b2"}},{"text":" into answering.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a small story and a useful one. Dominican rap has no institutions, so its history is transmitted as argument — who ignored whom, who answered, who was first — and the people who were there are the only archive.","type":"text"}]},{"type":"paragraph","content":[{"text":"The judge’s chair","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He has sat five consecutive years as a judge of the Red Bull Batalla, the largest Spanish-language freestyle competition there is. Judging it means being trusted by rappers across two continents to say who won, which is a different authority from having hits.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also teaches. In 2022 he ran a rap lyric-writing workshop with the digital creator Jhonwayne, and on World Hip Hop Day a national newspaper asked him, rather than a younger artist, to lay out the chronology of the genre in the country.","type":"text"}]},{"type":"paragraph","content":[{"text":"Despertar, in July 2026, is his most recent single, and it goes where his generation tends to go: a message rather than a hook. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"b65f1d25-390a-4646-ae74-4c9c32a6d96d"}},{"text":" and the rappers who came after him are the ones with the numbers, but OVNI is on the short list of people they all have to acknowledge.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'ovni-exp'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"OVNI, de nombre Gilberto Miguel Martínez Henríquez, es rapero y actor dominicano. Sus nombres artísticos son una carrera puesta en lista: Ovni LC, Ovni Lo Correcto, Ovni Experiencia, Ovni Exp. Cada uno dice en qué sala estaba en ese momento.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo Correcto","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo Correcto es un nombre que ninguna historia del rap dominicano puede saltarse. Lo fundaron Tony Hasbún y Núcleo Salomón, y por ahí pasaron OVNI, Básico, SinFin, Faqundo González, Crooklyn y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8f152297-560f-4ebb-9e93-7b46e5b86aac","displayText":"Beethoven Villaman","occurrenceId":"41fbf87d-3baf-412d-8aa3-3172f19d6efc"}},{"text":", entre otros.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que lo separaba de una banda es que estaba montado como cooperativa empresarial. En un país donde los raperos de esa época no tenían sello, ni radio, ni contratos, que un grupo de ellos juntara el trabajo en una estructura común no era una decisión de estilo: era la única manera de que los discos se hicieran y se pagaran. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"86fdf7d2-f8c3-457f-a318-20bb7b5a207e","displayText":"Ito Ogamy","occurrenceId":"db6a3c66-fef0-4daa-9505-3cf0fef74c96"}},{"text":" había hecho algo parecido una década antes con Alcapón Rap.","type":"text"}]},{"type":"paragraph","content":[{"text":"Experiencia, el dúo que armó con Básico, le dio otro de sus nombres.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cuando llegó lo que venía después","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Charles Family y Complot Records aparecieron alrededor de 2003 y 2004 y cambiaron a quién oía el público. Lo Correcto los ignoró durante años, y todavía hoy los entrevistadores le preguntan a OVNI si el grupo sintió que se le iba el terreno. Por varios relatos fue ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"d8405cf3-5994-4492-9d76-debffe7336d1"}},{"text":" quien finalmente empujó a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8f152297-560f-4ebb-9e93-7b46e5b86aac","displayText":"Beethoven Villaman","occurrenceId":"56951c38-8314-48a9-9101-fa6dc1f69034"}},{"text":" a contestar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una historia pequeña y útil. El rap dominicano no tiene instituciones, así que su historia se transmite como discusión —quién ignoró a quién, quién contestó, quién fue primero— y la gente que estuvo ahí es el único archivo.","type":"text"}]},{"type":"paragraph","content":[{"text":"La silla del jurado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lleva cinco años consecutivos como jurado de la Red Bull Batalla, la competencia de freestyle en español más grande que existe. Ser jurado ahí significa que raperos de dos continentes confían en que uno diga quién ganó, que es otra autoridad distinta de tener éxitos.","type":"text"}]},{"type":"paragraph","content":[{"text":"También enseña. En 2022 dio un taller de composición de letras de rap con el creador digital Jhonwayne, y el Día Mundial del Hip Hop un periódico nacional le pidió a él, y no a un artista más joven, que trazara la cronología del género en el país.","type":"text"}]},{"type":"paragraph","content":[{"text":"Despertar, de julio de 2026, es su sencillo más reciente, y va a donde suele ir su generación: un mensaje antes que un gancho. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"94c985a1-a957-4d56-b6b8-9c2c47e01240"}},{"text":" y los raperos que vinieron después son los que tienen los números, pero OVNI está en la lista corta de gente a la que todos tienen que reconocer.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'ovni-exp'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'en'), '3e2a2711-34f6-4aef-9c32-41ccf035f67d', 'artist', '8f152297-560f-4ebb-9e93-7b46e5b86aac');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'en'), '68330f3e-77ce-44f4-bee0-bbad76c4f6b2', 'artist', '8f152297-560f-4ebb-9e93-7b46e5b86aac');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'en'), '6e716bd7-e3b8-4710-a089-3b4a313d1b4f', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'en'), 'b65f1d25-390a-4646-ae74-4c9c32a6d96d', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'en'), 'b8b636d3-2924-49c0-9870-d7e43961018e', 'artist', '86fdf7d2-f8c3-457f-a318-20bb7b5a207e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'es'), '41fbf87d-3baf-412d-8aa3-3172f19d6efc', 'artist', '8f152297-560f-4ebb-9e93-7b46e5b86aac');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'es'), '56951c38-8314-48a9-9101-fa6dc1f69034', 'artist', '8f152297-560f-4ebb-9e93-7b46e5b86aac');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'es'), '94c985a1-a957-4d56-b6b8-9c2c47e01240', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'es'), 'd8405cf3-5994-4492-9d76-debffe7336d1', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ovni-exp') AND locale = 'es'), 'db6a3c66-fef0-4daa-9505-3cf0fef74c96', 'artist', '86fdf7d2-f8c3-457f-a318-20bb7b5a207e');

COMMIT;
