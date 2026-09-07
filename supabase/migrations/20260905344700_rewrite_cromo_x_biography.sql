BEGIN;

-- Rewrite the catalogue entry for Cromo X.
--
-- Cromo X. Filler in English, nothing in Spanish, no gender, no real name --
-- and filed as a singer, which is the last thing he is known for. He is one of
-- the most widely credited songwriter-producers the Dominican Republic has
-- produced.
--
-- CORRECTED: primary_role singer -> producer, with composer kept in occupations
-- so the entry still carries a genre. He does perform -- La Para is his own
-- record -- but every profile of him leads with the writing and the production.
--
-- ADDED: real name Martin Rodriguez Vicente, gender male, the alias Cromo La X,
-- and the sub-genres he actually works in.
--
-- OVERWRITTEN: birth_place "Santo Domingo" -> null and province "Distrito
-- Nacional" -> null. Both were the importer's default. Nothing published says
-- where he was born, and his hometown is not stated anywhere found.
--
-- SOURCES: Symphonic Latino's artist spotlight, 16 September 2020: "Martin
-- Rodriguez Vicente, mejor conocido como Cromo La X, es un destacado
-- compositor, productor y artista multiplatino dominicano", with the list of
-- artists he has written and produced for -- Ozuna, Arcangel, Bryant Myers, Jon
-- Z, Anuel AA, Yandel, Enrique Iglesias, Evaluna Montaner, Becky G, La
-- Insuperable, Daddy Yankee, Brytiago, Farruko, Nengo Flow, Gigolo y La Exce,
-- C. Tangana -- the multi-platinum credits Despues Que Te Perdi with Jon Z and
-- Enrique Iglesias, Tanta Falta with Bryant Myers and Diganle with Becky G and
-- Leslie Grace, and his co-founding of the label MVP X Records with Raul Lopez.
-- Warner Music Group, 13 January 2022, announcing his global publishing deal
-- with Warner Chappell Music and naming Ozuna, Enrique Iglesias, Daddy Yankee
-- and Farruko among the artists he has written and produced for. Remezcla, 9
-- November 2020, on La Para as his debut as executive producer, alongside
-- Bryant Myers and La Insuperable. Diario Libre and El Nuevo Diario, 28
-- December 2017: "Cromo X, se destaca dentro de los compositores urbanos mas
-- internacionales de RD". El Nuevo Diario on Capea el Dough, the 2008 posse
-- record built on a Triggah beat that pulled some fifteen artists together with
-- Cromo X, Nipo809 and Alofoke at the head of it. Tapedeck for the credit on
-- Anuel AA's album Emmanuel. Boiler Room's Dominican Republic session with
-- Tokischa, on which he appears. Listin Diario, 31 July 2012, on Jacool's
-- Internacionalismo, with Cromo X, Calapeso and Secreto among the guests.
--
-- NOT WRITTEN: view counts, which is what most of the coverage of La Para leads
-- with, and a birth date, which nobody publishes.
--
-- NOT LINKED: Bryant Myers, Jon Z, Anuel AA, Ozuna, Becky G, C. Tangana,
-- Enrique Iglesias, Daddy Yankee and Farruko are all foreign and should not
-- have entries. Nipo809, Alofoke, Jacool and Triggah are Dominican and have
-- none; Calapeso has one but is still needs_review.
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
       name = 'Cromo X',
       sort_name = 'Cromo X',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'producer',
       primary_genre = 'urbano',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Martín',
       middle_name = NULL,
       last_name = 'Rodríguez',
       second_last_name = 'Vicente',
       stage_name = 'Cromo X',
       aliases = ARRAY['Cromo La X', 'Martín Rodríguez Vicente']::text[],
       occupations = '["composer","rapper"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-reggaeton', 'urban-dembow', 'urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@Laxrecs',
       facebook = 'Cromoex',
       instagram = 'cromoex',
       disambiguation = 'Dominican songwriter and producer, born Martín Rodríguez Vicente; co-founder of MVP X Records',
       bio_en = 'Cromo X is a Dominican songwriter, producer and performer, born Martín Rodríguez Vicente. He has written and produced across the Latin urban field for two decades, and most people who have heard his work do not know his name.

**Capea el Dough**

In 2008 he was one of the people at the head of a posse record that gathered some fifteen Dominican rappers over a Triggah beat, alongside Nipo809 and Alofoke. Records like that are how a scene announces that it exists, and Dominican rap was still arguing for its own existence at the time.

By 2017 the Dominican press was describing him as one of the country’s most internationally placed urban songwriters, which is an unglamorous way of saying that his name had started appearing in the credits of records made somewhere else.

**The credits**

The list is long and it crosses every border the genre has: Ozuna, Arcángel, Bryant Myers, Jon Z, Anuel AA, Yandel, Enrique Iglesias, Evaluna Montaner, Becky G, Daddy Yankee, Brytiago, Farruko, Ñengo Flow, Gigolo y La Exce, C. Tangana. Después Que Te Perdí, Tanta Falta and Díganle all went multi-platinum, and he has a credit on Anuel AA’s Emmanuel.

At home he has worked with La Insuperable, El Mayor Clásico, Secreto El Famoso Biberón and Tokischa. The Dominican work and the international work are the same job done in two markets, and the second only happened because the first did.

**Owning the room**

He co-founded the label MVP X Records with Raúl López, a house of producers, writers and artists rather than a stable of singers. That is the significant move: for most of the genre’s history the Dominican contribution has been talent hired by somebody else’s company, and a label of writers keeps the publishing at home.

In January 2022 he signed a global publishing deal with Warner Chappell Music.

**In front of the microphone**

La Para, made with Bryant Myers and La Insuperable in 2020, was his first outing as executive producer of a record with his own name on the front of it. It is a Dominican record built by a man who spends most of his working life making other people’s.',
       bio_es = 'Cromo X es un compositor, productor e intérprete dominicano, nacido Martín Rodríguez Vicente. Lleva dos décadas escribiendo y produciendo por todo el campo urbano latino, y casi nadie de los que han oído su trabajo sabe su nombre.

**Capea el Dough**

En 2008 fue uno de los que encabezaron un disco colectivo que juntó a unos quince raperos dominicanos sobre una pista de Triggah, junto a Nipo809 y a Alofoke. Discos así son la manera en que una escena anuncia que existe, y el rap dominicano todavía estaba discutiendo su propia existencia en aquel momento.

Para 2017 la prensa dominicana lo describía como uno de los compositores urbanos del país con más colocación internacional, que es una manera poco vistosa de decir que su nombre había empezado a aparecer en los créditos de discos hechos en otra parte.

**Los créditos**

La lista es larga y cruza todas las fronteras que tiene el género: Ozuna, Arcángel, Bryant Myers, Jon Z, Anuel AA, Yandel, Enrique Iglesias, Evaluna Montaner, Becky G, Daddy Yankee, Brytiago, Farruko, Ñengo Flow, Gigolo y La Exce, C. Tangana. Después Que Te Perdí, Tanta Falta y Díganle llegaron todas a multiplatino, y tiene crédito en Emmanuel, de Anuel AA.

En casa ha trabajado con La Insuperable, El Mayor Clásico, Secreto El Famoso Biberón y Tokischa. El trabajo dominicano y el internacional son el mismo oficio hecho en dos mercados, y el segundo solo ocurrió porque ocurrió el primero.

**Ser dueño del cuarto**

Cofundó el sello MVP X Records con Raúl López, una casa de productores, compositores y artistas antes que un establo de cantantes. Esa es la jugada importante: durante casi toda la historia del género el aporte dominicano ha sido talento contratado por la empresa de otro, y un sello de compositores mantiene la edición en casa.

En enero de 2022 firmó un acuerdo global de edición con Warner Chappell Music.

**Delante del micrófono**

La Para, hecha con Bryant Myers y La Insuperable en 2020, fue su primera salida como productor ejecutivo de un disco con su propio nombre en la portada. Es un disco dominicano armado por un hombre que se pasa casi toda su vida laboral armando los de los demás.',
       updated_at = now()
 WHERE slug = 'cromo-x';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Cromo X is a Dominican songwriter, producer and performer, born Martín Rodríguez Vicente. He has written and produced across the Latin urban field for two decades, and most people who have heard his work do not know his name.","type":"text"}]},{"type":"paragraph","content":[{"text":"Capea el Dough","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2008 he was one of the people at the head of a posse record that gathered some fifteen Dominican rappers over a Triggah beat, alongside Nipo809 and Alofoke. Records like that are how a scene announces that it exists, and Dominican rap was still arguing for its own existence at the time.","type":"text"}]},{"type":"paragraph","content":[{"text":"By 2017 the Dominican press was describing him as one of the country’s most internationally placed urban songwriters, which is an unglamorous way of saying that his name had started appearing in the credits of records made somewhere else.","type":"text"}]},{"type":"paragraph","content":[{"text":"The credits","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The list is long and it crosses every border the genre has: Ozuna, Arcángel, Bryant Myers, Jon Z, Anuel AA, Yandel, Enrique Iglesias, Evaluna Montaner, Becky G, Daddy Yankee, Brytiago, Farruko, Ñengo Flow, Gigolo y La Exce, C. Tangana. Después Que Te Perdí, Tanta Falta and Díganle all went multi-platinum, and he has a credit on Anuel AA’s Emmanuel.","type":"text"}]},{"type":"paragraph","content":[{"text":"At home he has worked with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"bcf4e47b-8bd8-452a-92e3-a0d99fac6dd4"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"518354a4-7cb9-4c39-a2b8-9fa4d18f50db","displayText":"El Mayor Clásico","occurrenceId":"5f7b894c-f313-4352-820e-3f1d06e7beec"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f57eb2e7-9ca7-463d-baee-8b3ea1800e6b","displayText":"Secreto El Famoso Biberón","occurrenceId":"5aa958eb-6c34-495d-b2b4-b8fce619f514"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"eb88df53-bdfe-4601-9b2c-3fa9f48c352e"}},{"text":". The Dominican work and the international work are the same job done in two markets, and the second only happened because the first did.","type":"text"}]},{"type":"paragraph","content":[{"text":"Owning the room","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He co-founded the label MVP X Records with Raúl López, a house of producers, writers and artists rather than a stable of singers. That is the significant move: for most of the genre’s history the Dominican contribution has been talent hired by somebody else’s company, and a label of writers keeps the publishing at home.","type":"text"}]},{"type":"paragraph","content":[{"text":"In January 2022 he signed a global publishing deal with Warner Chappell Music.","type":"text"}]},{"type":"paragraph","content":[{"text":"In front of the microphone","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La Para, made with Bryant Myers and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"0fdb75a6-301c-42b4-8a34-c74dac84f836"}},{"text":" in 2020, was his first outing as executive producer of a record with his own name on the front of it. It is a Dominican record built by a man who spends most of his working life making other people’s.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'cromo-x'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Cromo X es un compositor, productor e intérprete dominicano, nacido Martín Rodríguez Vicente. Lleva dos décadas escribiendo y produciendo por todo el campo urbano latino, y casi nadie de los que han oído su trabajo sabe su nombre.","type":"text"}]},{"type":"paragraph","content":[{"text":"Capea el Dough","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2008 fue uno de los que encabezaron un disco colectivo que juntó a unos quince raperos dominicanos sobre una pista de Triggah, junto a Nipo809 y a Alofoke. Discos así son la manera en que una escena anuncia que existe, y el rap dominicano todavía estaba discutiendo su propia existencia en aquel momento.","type":"text"}]},{"type":"paragraph","content":[{"text":"Para 2017 la prensa dominicana lo describía como uno de los compositores urbanos del país con más colocación internacional, que es una manera poco vistosa de decir que su nombre había empezado a aparecer en los créditos de discos hechos en otra parte.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los créditos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La lista es larga y cruza todas las fronteras que tiene el género: Ozuna, Arcángel, Bryant Myers, Jon Z, Anuel AA, Yandel, Enrique Iglesias, Evaluna Montaner, Becky G, Daddy Yankee, Brytiago, Farruko, Ñengo Flow, Gigolo y La Exce, C. Tangana. Después Que Te Perdí, Tanta Falta y Díganle llegaron todas a multiplatino, y tiene crédito en Emmanuel, de Anuel AA.","type":"text"}]},{"type":"paragraph","content":[{"text":"En casa ha trabajado con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"efa5c0d0-8da4-4cd5-8b20-edcd0ba43ac8"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"518354a4-7cb9-4c39-a2b8-9fa4d18f50db","displayText":"El Mayor Clásico","occurrenceId":"6c17c1ba-ed52-4fe3-b308-04d571ae74be"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f57eb2e7-9ca7-463d-baee-8b3ea1800e6b","displayText":"Secreto El Famoso Biberón","occurrenceId":"cadd871c-9c59-4d0a-85ae-e2665b70284a"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"b196d859-b950-4efe-b596-8e6b798556d1"}},{"text":". El trabajo dominicano y el internacional son el mismo oficio hecho en dos mercados, y el segundo solo ocurrió porque ocurrió el primero.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ser dueño del cuarto","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Cofundó el sello MVP X Records con Raúl López, una casa de productores, compositores y artistas antes que un establo de cantantes. Esa es la jugada importante: durante casi toda la historia del género el aporte dominicano ha sido talento contratado por la empresa de otro, y un sello de compositores mantiene la edición en casa.","type":"text"}]},{"type":"paragraph","content":[{"text":"En enero de 2022 firmó un acuerdo global de edición con Warner Chappell Music.","type":"text"}]},{"type":"paragraph","content":[{"text":"Delante del micrófono","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La Para, hecha con Bryant Myers y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"4e7fcf31-1251-4e3b-8e33-4696e4a934e2"}},{"text":" en 2020, fue su primera salida como productor ejecutivo de un disco con su propio nombre en la portada. Es un disco dominicano armado por un hombre que se pasa casi toda su vida laboral armando los de los demás.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'cromo-x'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'en'), '0fdb75a6-301c-42b4-8a34-c74dac84f836', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'en'), '5aa958eb-6c34-495d-b2b4-b8fce619f514', 'artist', 'f57eb2e7-9ca7-463d-baee-8b3ea1800e6b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'en'), '5f7b894c-f313-4352-820e-3f1d06e7beec', 'artist', '518354a4-7cb9-4c39-a2b8-9fa4d18f50db');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'en'), 'bcf4e47b-8bd8-452a-92e3-a0d99fac6dd4', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'en'), 'eb88df53-bdfe-4601-9b2c-3fa9f48c352e', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'es'), '4e7fcf31-1251-4e3b-8e33-4696e4a934e2', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'es'), '6c17c1ba-ed52-4fe3-b308-04d571ae74be', 'artist', '518354a4-7cb9-4c39-a2b8-9fa4d18f50db');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'es'), 'b196d859-b950-4efe-b596-8e6b798556d1', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'es'), 'cadd871c-9c59-4d0a-85ae-e2665b70284a', 'artist', 'f57eb2e7-9ca7-463d-baee-8b3ea1800e6b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cromo-x') AND locale = 'es'), 'efa5c0d0-8da4-4cd5-8b20-edcd0ba43ac8', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

COMMIT;
