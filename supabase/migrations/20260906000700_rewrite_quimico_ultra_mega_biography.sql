BEGIN;

-- Rewrite the catalogue entry for Químico Ultra Mega.
--
-- Quimico Ultra Mega. Filler in English, nothing in Spanish, no dates, no real
-- name -- on one of the most consolidated urban artists the country has.
--
-- ADDED: real name Jesus Jimenez, date of birth 11 January 1993, the barrio he
-- grew up in, and composer and actor in occupations.
--
-- CHANGED, editor's call: primary_genre urban-dembow -> urban-rap-hip-hop, with
-- urban-dembow and urban-reggaeton moved into genres. Every Dominican
-- description of him leads with rap -- "un rapero y cantante dominicano", "su
-- rap es de calle" -- and Lapiz Conciente places him in the rap lineage by
-- name. He records dembow too, so the old value was not wrong, only narrower
-- than the man. Change it back if the catalogue would rather file him by what
-- charts.
--
-- SOURCES: BuenaMusica's biography and "Datos de" block: real name Jesus
-- Jimenez, born 11 January 1993 in Santo Domingo, active from 2014, label Con
-- To'el Flow Records, genres hip hop, rap, dembow and reggaeton; he grew up in
-- the barrio Isabelita; his mentor was Leonardo Michael Flores Ozuna, Monkey
-- Black, who gave him his first opportunity and died in 2014; the albums Tu Ta
-- Frio, El Big Papi, Chillin and Deluxe between 2016 and 2017, Limpio in March
-- 2016 with Celosa, Escapate and Te Busco, and Los Tres Versos, nine tracks
-- including La Pongo Fina, Nunca Pato and Coronamos with El Alfa; the songs Que
-- Sopa, Solamente Tu, Bellaca Putona, 21 Minutos and Diva de Humo; the 2023
-- singles Orale, Si Somos Somos and Que Se Tiren with Tivi Gunz; Vamo' a Da Una
-- Vuelta with Bryant Myers in 2019; the collaborators Toxic Crow, Shelow Shaq,
-- Anuel AA, Tokischa, Jon Z and Ceky Viciny; an appearance at the Premios
-- Soberano of 2015; and the films Pueto pa' Mi and Dos Policias en Apuro.
-- Lapiz Conciente, writing publicly, naming the generation of El Batallon, LR
-- and "Quimico ultra mega y sus congeneres".
--
-- NOT WRITTEN: subscriber and view counts, which BuenaMusica gives for both
-- YouTube and the Bryant Myers video and which this catalogue does not carry.
--
-- NOT LINKED: Anuel AA, Jon Z and Bryant Myers are Puerto Rican and should not
-- have entries here.
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
       name = 'Químico Ultra Mega',
       sort_name = 'Químico Ultra Mega',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = '1993-01-11',
       birth_year = 1993,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Jesús',
       middle_name = NULL,
       last_name = 'Jiménez',
       second_last_name = NULL,
       stage_name = 'Químico Ultra Mega',
       aliases = ARRAY['Químico', 'Jesús Jiménez']::text[],
       occupations = '["composer","actor"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-dembow', 'urban-reggaeton', 'urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@QuimicoUltraMega',
       facebook = 'quimicoultramegaofficial',
       instagram = 'quimicoultramega',
       disambiguation = 'Dominican rapper and singer, born Jesús Jiménez in 1993; of the Isabelita barrio',
       bio_en = 'Químico Ultra Mega is a Dominican rapper, singer and songwriter, born Jesús Jiménez in Santo Domingo on 11 January 1993. He grew up in the Isabelita barrio and has been one of the most consolidated names in Dominican urban music since 2014.

**Monkey Black opened the door**

His mentor was Leonardo Michael Flores Ozuna, Monkey Black. It was Monkey Black who gave him the chance to be heard, and Monkey Black died in 2014 — the same year Químico’s own career is usually dated from.

That is a hard inheritance. He arrived carrying the endorsement of a man who was not there to see what he did with it, and the audience that accepted him accepted him partly on that account.

**Street rap**

What he makes is described in the Dominican press as rap de calle, and the description is doing work: it distinguishes what he does from the dembow that dominates the charts and from the reggaetón that arrives from Puerto Rico. Lápiz Conciente names his generation directly when he traces the line of Dominican rap.

The catalogue is large. Tu Ta Frío, El Big Papi, Chillin and Deluxe came in a run across 2016 and 2017. Limpio arrived in March 2016 on Con To’ El Flow Records, written as social criticism, and carried Celosa, Escápate and Te Busco. Los Tres Versos is nine tracks and includes La Pongo Fina, Nunca Pato and Coronamos, the last with El Alfa.

Que Sopa, Solamente Tú, Bellaca Putona, 21 Minutos and Diva de Humo are the songs people name. Órale, Si Somos Somos and Que Se Tiren — that one with Tivi Gunz — came in 2023.

**Who he records with**

He has worked across the whole Dominican urban field: Toxic Crow, Shelow Shaq, Tokischa, Ceky Viciny. He has also gone outside it, cutting Vamo’ a Da Una Vuelta with the Puerto Rican Bryant Myers in 2019 and recording with Anuel AA and Jon Z.

He appeared at the Premios Soberano in 2015 and has acted in two Dominican films, Pueto pa’ Mi and Dos Policías en Apuro.

**Staying in it**

Twelve years is a long career in a genre where most people get two or three. He has done it by not being only one thing — the records move between rap, dembow and reggaetón depending on what the song needs — and by keeping the register of the barrio he came from rather than trading it in.',
       bio_es = 'Químico Ultra Mega es un rapero, cantante y compositor dominicano, nacido Jesús Jiménez en Santo Domingo el 11 de enero de 1993. Se crió en el barrio Isabelita y desde 2014 es uno de los nombres más consolidados de la música urbana dominicana.

**Monkey Black le abrió la puerta**

Su mentor fue Leonardo Michael Flores Ozuna, Monkey Black. Fue Monkey Black quien le dio la oportunidad de que lo oyeran, y Monkey Black murió en 2014, el mismo año desde el que suele fecharse la carrera de Químico.

Esa es una herencia difícil. Llegó cargando el respaldo de un hombre que no estuvo para ver qué hacía con él, y el público que lo aceptó lo aceptó en parte por eso.

**Rap de calle**

Lo que hace lo describe la prensa dominicana como rap de calle, y la descripción está trabajando: distingue lo suyo del dembow que domina las listas y del reguetón que llega de Puerto Rico. Lápiz Conciente nombra a su generación directamente cuando traza la línea del rap dominicano.

El catálogo es grande. Tu Ta Frío, El Big Papi, Chillin y Deluxe salieron seguidos entre 2016 y 2017. Limpio salió en marzo de 2016 por Con To’ El Flow Records, escrito como crítica social, y traía Celosa, Escápate y Te Busco. Los Tres Versos son nueve temas e incluye La Pongo Fina, Nunca Pato y Coronamos, esta última con El Alfa.

Que Sopa, Solamente Tú, Bellaca Putona, 21 Minutos y Diva de Humo son las canciones que la gente nombra. Órale, Si Somos Somos y Que Se Tiren —esa con Tivi Gunz— salieron en 2023.

**Con quién graba**

Ha trabajado por todo el campo urbano dominicano: Toxic Crow, Shelow Shaq, Tokischa, Ceky Viciny. También ha salido de él: grabó Vamo’ a Da Una Vuelta con el puertorriqueño Bryant Myers en 2019 y ha grabado con Anuel AA y con Jon Z.

Se presentó en los Premios Soberano de 2015 y ha actuado en dos películas dominicanas, Pueto pa’ Mi y Dos Policías en Apuro.

**Mantenerse**

Doce años son una carrera larga en un género donde a casi todo el mundo le tocan dos o tres. Lo ha conseguido no siendo una sola cosa —los discos se mueven entre rap, dembow y reguetón según lo que pida la canción— y quedándose con el registro del barrio de donde salió en vez de cambiarlo.',
       updated_at = now()
 WHERE slug = 'quimico-ultra-mega';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Químico Ultra Mega is a Dominican rapper, singer and songwriter, born Jesús Jiménez in Santo Domingo on 11 January 1993. He grew up in the Isabelita barrio and has been one of the most consolidated names in Dominican urban music since 2014.","type":"text"}]},{"type":"paragraph","content":[{"text":"Monkey Black opened the door","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His mentor was Leonardo Michael Flores Ozuna, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8af29e3a-6ae7-4a2d-9389-8ec927790901","displayText":"Monkey Black","occurrenceId":"b856d16e-cc8a-4410-aaad-c2be1dc7c092"}},{"text":". It was Monkey Black who gave him the chance to be heard, and Monkey Black died in 2014 — the same year Químico’s own career is usually dated from.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a hard inheritance. He arrived carrying the endorsement of a man who was not there to see what he did with it, and the audience that accepted him accepted him partly on that account.","type":"text"}]},{"type":"paragraph","content":[{"text":"Street rap","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"What he makes is described in the Dominican press as rap de calle, and the description is doing work: it distinguishes what he does from the dembow that dominates the charts and from the reggaetón that arrives from Puerto Rico. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"e4cfc82c-654b-4c4e-a424-08b0dd25e434"}},{"text":" names his generation directly when he traces the line of Dominican rap.","type":"text"}]},{"type":"paragraph","content":[{"text":"The catalogue is large. Tu Ta Frío, El Big Papi, Chillin and Deluxe came in a run across 2016 and 2017. Limpio arrived in March 2016 on Con To’ El Flow Records, written as social criticism, and carried Celosa, Escápate and Te Busco. Los Tres Versos is nine tracks and includes La Pongo Fina, Nunca Pato and Coronamos, the last with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"84f30165-17b9-4974-b40c-a1cf450fd831"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Que Sopa, Solamente Tú, Bellaca Putona, 21 Minutos and Diva de Humo are the songs people name. Órale, Si Somos Somos and Que Se Tiren — that one with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"8a6aca8c-047d-468c-96a2-a414ea2dd4e2"}},{"text":" — came in 2023.","type":"text"}]},{"type":"paragraph","content":[{"text":"Who he records with","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He has worked across the whole Dominican urban field: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d25ea8c2-1e9f-4f77-832a-48886d50c47b","displayText":"Toxic Crow","occurrenceId":"2a886a0b-4f1b-422e-b4dd-cd803e5c1322"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"0cc9e5cb-42e9-4870-848d-4ff80bc62177"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"7a2b92df-76be-4cb5-a45a-d9808065e43a"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"007ca5dc-e709-49b8-859c-c290b9ac73f8"}},{"text":". He has also gone outside it, cutting Vamo’ a Da Una Vuelta with the Puerto Rican Bryant Myers in 2019 and recording with Anuel AA and Jon Z.","type":"text"}]},{"type":"paragraph","content":[{"text":"He appeared at the Premios Soberano in 2015 and has acted in two Dominican films, Pueto pa’ Mi and Dos Policías en Apuro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Staying in it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Twelve years is a long career in a genre where most people get two or three. He has done it by not being only one thing — the records move between rap, dembow and reggaetón depending on what the song needs — and by keeping the register of the barrio he came from rather than trading it in.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Químico Ultra Mega es un rapero, cantante y compositor dominicano, nacido Jesús Jiménez en Santo Domingo el 11 de enero de 1993. Se crió en el barrio Isabelita y desde 2014 es uno de los nombres más consolidados de la música urbana dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Monkey Black le abrió la puerta","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su mentor fue Leonardo Michael Flores Ozuna, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8af29e3a-6ae7-4a2d-9389-8ec927790901","displayText":"Monkey Black","occurrenceId":"1f820c52-0e17-4c91-96fe-2f325b47fd27"}},{"text":". Fue Monkey Black quien le dio la oportunidad de que lo oyeran, y Monkey Black murió en 2014, el mismo año desde el que suele fecharse la carrera de Químico.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa es una herencia difícil. Llegó cargando el respaldo de un hombre que no estuvo para ver qué hacía con él, y el público que lo aceptó lo aceptó en parte por eso.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rap de calle","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo que hace lo describe la prensa dominicana como rap de calle, y la descripción está trabajando: distingue lo suyo del dembow que domina las listas y del reguetón que llega de Puerto Rico. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"2a636bfa-fe4f-4dad-9f4d-2d04e5e31213"}},{"text":" nombra a su generación directamente cuando traza la línea del rap dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"El catálogo es grande. Tu Ta Frío, El Big Papi, Chillin y Deluxe salieron seguidos entre 2016 y 2017. Limpio salió en marzo de 2016 por Con To’ El Flow Records, escrito como crítica social, y traía Celosa, Escápate y Te Busco. Los Tres Versos son nueve temas e incluye La Pongo Fina, Nunca Pato y Coronamos, esta última con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"423631e4-30fb-45f3-b2a1-2d62b8aebbd5"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Que Sopa, Solamente Tú, Bellaca Putona, 21 Minutos y Diva de Humo son las canciones que la gente nombra. Órale, Si Somos Somos y Que Se Tiren —esa con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"73756414-5fd2-4e66-af26-33aca6c95dc4"}},{"text":"— salieron en 2023.","type":"text"}]},{"type":"paragraph","content":[{"text":"Con quién graba","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ha trabajado por todo el campo urbano dominicano: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d25ea8c2-1e9f-4f77-832a-48886d50c47b","displayText":"Toxic Crow","occurrenceId":"2cfed606-942a-4709-a5f9-8d4d68e26d16"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"40202e3c-2b30-463d-8f68-e6fbc7a1e339"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"6f7c5cf0-50e1-4ceb-a622-9cf7c10edb01"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"834cc16a-b3a1-44e5-b857-090ca8784984"}},{"text":". También ha salido de él: grabó Vamo’ a Da Una Vuelta con el puertorriqueño Bryant Myers en 2019 y ha grabado con Anuel AA y con Jon Z.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se presentó en los Premios Soberano de 2015 y ha actuado en dos películas dominicanas, Pueto pa’ Mi y Dos Policías en Apuro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Mantenerse","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Doce años son una carrera larga en un género donde a casi todo el mundo le tocan dos o tres. Lo ha conseguido no siendo una sola cosa —los discos se mueven entre rap, dembow y reguetón según lo que pida la canción— y quedándose con el registro del barrio de donde salió en vez de cambiarlo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'en'), '007ca5dc-e709-49b8-859c-c290b9ac73f8', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'en'), '0cc9e5cb-42e9-4870-848d-4ff80bc62177', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'en'), '2a886a0b-4f1b-422e-b4dd-cd803e5c1322', 'artist', 'd25ea8c2-1e9f-4f77-832a-48886d50c47b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'en'), '7a2b92df-76be-4cb5-a45a-d9808065e43a', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'en'), '84f30165-17b9-4974-b40c-a1cf450fd831', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'en'), '8a6aca8c-047d-468c-96a2-a414ea2dd4e2', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'en'), 'b856d16e-cc8a-4410-aaad-c2be1dc7c092', 'artist', '8af29e3a-6ae7-4a2d-9389-8ec927790901');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'en'), 'e4cfc82c-654b-4c4e-a424-08b0dd25e434', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'es'), '1f820c52-0e17-4c91-96fe-2f325b47fd27', 'artist', '8af29e3a-6ae7-4a2d-9389-8ec927790901');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'es'), '2a636bfa-fe4f-4dad-9f4d-2d04e5e31213', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'es'), '2cfed606-942a-4709-a5f9-8d4d68e26d16', 'artist', 'd25ea8c2-1e9f-4f77-832a-48886d50c47b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'es'), '40202e3c-2b30-463d-8f68-e6fbc7a1e339', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'es'), '423631e4-30fb-45f3-b2a1-2d62b8aebbd5', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'es'), '6f7c5cf0-50e1-4ceb-a622-9cf7c10edb01', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'es'), '73756414-5fd2-4e66-af26-33aca6c95dc4', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'quimico-ultra-mega') AND locale = 'es'), '834cc16a-b3a1-44e5-b857-090ca8784984', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

COMMIT;
