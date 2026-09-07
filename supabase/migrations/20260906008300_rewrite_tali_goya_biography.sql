BEGIN;

-- Rewrite the catalogue entry for Tali Goya.
--
-- Tali Goya. Filler in English, nothing in Spanish, no gender, no occupations,
-- no genres, no aliases -- and, the thing the row got most wrong, filed as a
-- dembow artist from Santo Domingo when he is a trap rapper raised in
-- Washington Heights.
--
-- FILLED: gender male; date_of_birth 28 September 1990 (birth_year 1990 already
-- stored and matching); aliases El A.K.A., the name he used before this one,
-- and El Rey del Norte, the one he uses now; occupations composer; genres.
--
-- GENDER CHECKED AGAINST HIS OWN ACCOUNT, NOT INFERRED. The first version of
-- this entry set gender male from the legal name Juan Miguel Villar and from
-- BuenaMusica's masculine grammar. That is inference, not verification, and the
-- editor asked for the social account on the row to be opened. It was: the
-- Instagram handle stored here, tali_goya, carries the bio "EL REY DEL NORTE"
-- -- rey, not reina -- beside a Statue of Liberty and a Dominican flag, a New
-- York 917 booking number, a highlight reading QUEVIVANLOTIGER for the Tiger
-- Gang label, and a link to Lock In, which is on the YouTube channel this entry
-- already draws on. Same artist, confirmed male, and the account independently
-- corroborates the New York base and the label.
--
-- CORRECTED: primary_genre urban-dembow -> urban-trap. There is no dembow in
-- his catalogue. It is trap and drill, much of it in a mix of English and
-- Spanish, and the tiraera is the form he works in most. primary_role singer ->
-- rapper.
--
-- PLACE LEFT EMPTY, NOT DEFAULTED. province "Distrito Nacional" and birth_place
-- "Santo Domingo" are cleared to NULL. BuenaMusica gives only "República
-- Dominicana" for the birth and says he was raised in Washington Heights and
-- went to Brandeis High School in Manhattan. No source names a Dominican town.
-- Keeping the importer's capital-city default would assert something nobody
-- states, and the audit flagging this row for a missing place is the correct
-- outcome. The diaspora tag is added instead, which is the fact that is
-- actually established.
--
-- SOURCES, and deliberately more than one for the spine: BuenaMusica for the
-- birth date, the upbringing in Washington Heights by his mother, the school,
-- the label Tiger Gang, the start at fourteen in a reggaetón duo with Messiah,
-- the subway performances, the earlier name El A.K.A. and the freestyle
-- competitions, Fua Sako with Lápiz Conciente, the EP Tali y Messiah on La
-- Reina Records, Mi Dimensión with Shown Black and its rotation on Mun2, MTV
-- Tr3s and Music Choice, and the eighty-odd tracks and two mixtapes the duo
-- made without ever getting a studio album out of the label. His own YouTube
-- channel for the solo catalogue: Pum Pum, RPTM, Abaliao, Lock In, Hablando M2,
-- Qué Ta' Pasando, Lonchera, Sistema, La Caleta, Lonely, Trascendido, the After
-- Hour freestyle, Viernes 13 with Laja, 5 Palos with Ezzy R, Voy A Mi with
-- TR3YD2CE, Birthday Sex with Sterlyn and G Money, and Moviendo Lo Kilo with
-- Chucky73. Radial, The Orchard's channel, for the distribution of that last
-- one. Telemundo and Dominican and Puerto Rican urban-press accounts for the
-- exchanges with Anuel AA -- Manuelita and Anuel AAA -- for Kianna, aimed at
-- Lito Kirino, and for Talitron, aimed at six Puerto Rican rappers at once.
-- R1 la Esencia's entry in this catalogue, which already records Di Lo Que
-- Quieras with him and Químico Ultra Mega.
--
-- NOT WRITTEN: the source devotes a paragraph to fights, drugs, weapons and
-- close to two years in prison, and treats it as the pivot of his life. This
-- catalogue does not record criminal matters. The entry goes from the duo to
-- the solo career without a bridge rather than gesturing at a gap it will not
-- explain. Nothing about his mother's circumstances is included either.
--
-- NOT LINKED: Anuel AA, Lito Kirino, Arcángel, Sombra PR, 25Stack, Slayter,
-- Ele D, Black Drippy and YovngChimi are Puerto Rican. Chucky73 and Shown Black
-- are Dominican-American and have no entries; Chucky73 is a real gap.
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
       name = 'Tali Goya',
       sort_name = 'Villar, Juan Miguel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-trap',
       date_of_birth = '1990-09-28',
       birth_year = 1990,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Juan',
       middle_name = 'Miguel',
       last_name = 'Villar',
       second_last_name = NULL,
       stage_name = 'Tali Goya',
       aliases = ARRAY['El A.K.A.', 'El Rey del Norte']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop', 'urban-drill']::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = NULL,
       youtube = '@TaliGoyaTV',
       facebook = 'taligoyafans',
       instagram = 'tali_goya',
       disambiguation = 'Dominican trap rapper raised in Washington Heights, billed El Rey del Norte',
       bio_en = 'Tali Goya, born Juan Miguel Villar, is a Dominican rapper who bills himself El Rey del Norte. He was born in the country and raised in Washington Heights, and he raps in a mixture of English and Spanish that neither audience has to translate.

**Singing Aventura on the subway**

He was fourteen when he and Messiah put a reggaetón duo together. They started by performing Aventura songs on New York trains, which is the most literal possible description of working for an audience.

He was calling himself El A.K.A. then, on the strength of how he did in street freestyle competitions. The two of them were opposites — he was the hyperactive one, Messiah the sentimental one — and the duo worked because of it. Fua Sako, made with Lápiz Conciente, is from those years.

Tali y Messiah put out an EP on La Reina Records, and Mi Dimensión off it got into rotation on Mun2, MTV Tr3s and Music Choice. Between them they made something like eighty tracks and two mixtapes and never got a studio album out, because the label they were signed to did not have the equipment to make one. That is a specific and unglamorous way for a career to stall, and it is the reason a lot of that generation’s work exists only as loose files.

**The tiradera as a career**

What he does now is trap, and the form he works in most is the battle record. Manuelita and Anuel AAA are both aimed at Anuel AA. Kianna is aimed at Lito Kirino. Talitron takes on six Puerto Rican rappers in a single track.

This is worth taking seriously rather than treating as noise. Puerto Rico has owned Spanish-language trap since it existed, and a Dominican rapper who wants to be heard inside it has two options: be invited, or take it. He has spent years taking it, loudly enough that Anuel AA answers and Arcángel mentions him by name.

**The records**

Pum Pum, RPTM, Abaliao, Lock In, Sistema, La Caleta, Hablando M2, Lonchera, Trascendido. Moviendo Lo Kilo was cut with Chucky73, another Dominican out of New York, and distributed internationally. Di Lo Que Quieras put him with R1 la Esencia and Químico Ultra Mega.

He works through the label Tiger Gang, and the two flags he keeps next to his name — the Statue of Liberty and the Dominican one — are the whole position in two characters. He dresses the part too, in a way that gets written about as much as the music does. Neither the clothes nor the quarrels are the point. The point is that he is one of very few Dominicans holding a position inside a genre that was not built for him.',
       bio_es = 'Tali Goya, de nombre Juan Miguel Villar, es un rapero dominicano que se anuncia como El Rey del Norte. Nació en el país y se crió en Washington Heights, y rapea en una mezcla de inglés y español que ninguno de los dos públicos tiene que traducir.

**Cantar Aventura en el metro**

Tenía catorce años cuando él y Messiah armaron un dúo de reguetón. Empezaron cantando canciones de Aventura en los trenes de Nueva York, que es la descripción más literal posible de trabajar para un público.

Entonces se hacía llamar El A.K.A., por cómo le iba en las competencias callejeras de freestyle. Los dos eran opuestos —él el hiperactivo, Messiah el sentimental— y el dúo funcionaba justamente por eso. Fua Sako, hecha con Lápiz Conciente, es de esos años.

Tali y Messiah sacaron un EP por La Reina Records, y Mi Dimensión entró en rotación en Mun2, MTV Tr3s y Music Choice. Entre los dos hicieron unos ochenta temas y dos mixtapes y nunca lograron sacar un álbum de estudio, porque el sello con el que estaban no tenía el equipo para hacerlo. Esa es una manera concreta y nada épica de que una carrera se atasque, y es la razón por la que buena parte del trabajo de esa generación existe solo como archivos sueltos.

**La tiradera como carrera**

Lo que hace ahora es trap, y la forma que más trabaja es el disco de guerra. Manuelita y Anuel AAA van las dos dirigidas a Anuel AA. Kianna va dirigida a Lito Kirino. Talitron se enfrenta a seis raperos puertorriqueños en un solo tema.

Vale tomárselo en serio en vez de leerlo como ruido. Puerto Rico es dueño del trap en español desde que el trap en español existe, y un rapero dominicano que quiera hacerse oír adentro tiene dos opciones: que lo inviten, o tomárselo. Él lleva años tomándoselo, con bastante volumen como para que Anuel AA le conteste y para que Arcángel lo nombre.

**Los discos**

Pum Pum, RPTM, Abaliao, Lock In, Sistema, La Caleta, Hablando M2, Lonchera, Trascendido. Moviendo Lo Kilo la grabó con Chucky73, otro dominicano salido de Nueva York, y salió con distribución internacional. Di Lo Que Quieras lo puso con R1 la Esencia y Químico Ultra Mega.

Trabaja por el sello Tiger Gang, y las dos banderas que mantiene al lado de su nombre —la Estatua de la Libertad y la dominicana— son la posición entera en dos caracteres. También se viste de una manera sobre la que se escribe tanto como sobre la música. Ni la ropa ni los pleitos son el asunto. El asunto es que es uno de los poquísimos dominicanos que sostiene una posición dentro de un género que no se construyó para él.',
       updated_at = now()
 WHERE slug = 'tali-goya';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Tali Goya, born Juan Miguel Villar, is a Dominican rapper who bills himself El Rey del Norte. He was born in the country and raised in Washington Heights, and he raps in a mixture of English and Spanish that neither audience has to translate.","type":"text"}]},{"type":"paragraph","content":[{"text":"Singing Aventura on the subway","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was fourteen when he and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73cac635-71c3-407f-b9f5-02a705d6956b","displayText":"Messiah","occurrenceId":"aad06817-406c-4c2a-8528-0240b11b41e9"}},{"text":" put a reggaetón duo together. They started by performing Aventura songs on New York trains, which is the most literal possible description of working for an audience.","type":"text"}]},{"type":"paragraph","content":[{"text":"He was calling himself El A.K.A. then, on the strength of how he did in street freestyle competitions. The two of them were opposites — he was the hyperactive one, Messiah the sentimental one — and the duo worked because of it. Fua Sako, made with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"a4b5005a-e293-475b-a563-1d89f1d04fa0"}},{"text":", is from those years.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tali y Messiah put out an EP on La Reina Records, and Mi Dimensión off it got into rotation on Mun2, MTV Tr3s and Music Choice. Between them they made something like eighty tracks and two mixtapes and never got a studio album out, because the label they were signed to did not have the equipment to make one. That is a specific and unglamorous way for a career to stall, and it is the reason a lot of that generation’s work exists only as loose files.","type":"text"}]},{"type":"paragraph","content":[{"text":"The tiradera as a career","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"What he does now is trap, and the form he works in most is the battle record. Manuelita and Anuel AAA are both aimed at Anuel AA. Kianna is aimed at Lito Kirino. Talitron takes on six Puerto Rican rappers in a single track.","type":"text"}]},{"type":"paragraph","content":[{"text":"This is worth taking seriously rather than treating as noise. Puerto Rico has owned Spanish-language trap since it existed, and a Dominican rapper who wants to be heard inside it has two options: be invited, or take it. He has spent years taking it, loudly enough that Anuel AA answers and Arcángel mentions him by name.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pum Pum, RPTM, Abaliao, Lock In, Sistema, La Caleta, Hablando M2, Lonchera, Trascendido. Moviendo Lo Kilo was cut with Chucky73, another Dominican out of New York, and distributed internationally. Di Lo Que Quieras put him with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"af23b96d-fe2a-4712-8d6a-972dac1fdb9e","displayText":"R1 la Esencia","occurrenceId":"aa42617c-3d48-44aa-8013-f813d620be66"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"2b76c1e6-f58f-4f61-b7d0-befbe1deb6bb"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"He works through the label Tiger Gang, and the two flags he keeps next to his name — the Statue of Liberty and the Dominican one — are the whole position in two characters. He dresses the part too, in a way that gets written about as much as the music does. Neither the clothes nor the quarrels are the point. The point is that he is one of very few Dominicans holding a position inside a genre that was not built for him.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'tali-goya'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Tali Goya, de nombre Juan Miguel Villar, es un rapero dominicano que se anuncia como El Rey del Norte. Nació en el país y se crió en Washington Heights, y rapea en una mezcla de inglés y español que ninguno de los dos públicos tiene que traducir.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cantar Aventura en el metro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Tenía catorce años cuando él y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73cac635-71c3-407f-b9f5-02a705d6956b","displayText":"Messiah","occurrenceId":"008a31d4-c3d2-47a3-8e9b-a9c61392ed47"}},{"text":" armaron un dúo de reguetón. Empezaron cantando canciones de Aventura en los trenes de Nueva York, que es la descripción más literal posible de trabajar para un público.","type":"text"}]},{"type":"paragraph","content":[{"text":"Entonces se hacía llamar El A.K.A., por cómo le iba en las competencias callejeras de freestyle. Los dos eran opuestos —él el hiperactivo, Messiah el sentimental— y el dúo funcionaba justamente por eso. Fua Sako, hecha con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"d127e576-dae8-4438-90e3-a68877d455c8"}},{"text":", es de esos años.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tali y Messiah sacaron un EP por La Reina Records, y Mi Dimensión entró en rotación en Mun2, MTV Tr3s y Music Choice. Entre los dos hicieron unos ochenta temas y dos mixtapes y nunca lograron sacar un álbum de estudio, porque el sello con el que estaban no tenía el equipo para hacerlo. Esa es una manera concreta y nada épica de que una carrera se atasque, y es la razón por la que buena parte del trabajo de esa generación existe solo como archivos sueltos.","type":"text"}]},{"type":"paragraph","content":[{"text":"La tiradera como carrera","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo que hace ahora es trap, y la forma que más trabaja es el disco de guerra. Manuelita y Anuel AAA van las dos dirigidas a Anuel AA. Kianna va dirigida a Lito Kirino. Talitron se enfrenta a seis raperos puertorriqueños en un solo tema.","type":"text"}]},{"type":"paragraph","content":[{"text":"Vale tomárselo en serio en vez de leerlo como ruido. Puerto Rico es dueño del trap en español desde que el trap en español existe, y un rapero dominicano que quiera hacerse oír adentro tiene dos opciones: que lo inviten, o tomárselo. Él lleva años tomándoselo, con bastante volumen como para que Anuel AA le conteste y para que Arcángel lo nombre.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pum Pum, RPTM, Abaliao, Lock In, Sistema, La Caleta, Hablando M2, Lonchera, Trascendido. Moviendo Lo Kilo la grabó con Chucky73, otro dominicano salido de Nueva York, y salió con distribución internacional. Di Lo Que Quieras lo puso con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"af23b96d-fe2a-4712-8d6a-972dac1fdb9e","displayText":"R1 la Esencia","occurrenceId":"132570d5-1d2d-4385-a319-6c7877a37d61"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"4363b390-0747-4eca-b6c4-376448894d74"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabaja por el sello Tiger Gang, y las dos banderas que mantiene al lado de su nombre —la Estatua de la Libertad y la dominicana— son la posición entera en dos caracteres. También se viste de una manera sobre la que se escribe tanto como sobre la música. Ni la ropa ni los pleitos son el asunto. El asunto es que es uno de los poquísimos dominicanos que sostiene una posición dentro de un género que no se construyó para él.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'tali-goya'), 2)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya') AND locale = 'en'), '2b76c1e6-f58f-4f61-b7d0-befbe1deb6bb', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya') AND locale = 'en'), 'a4b5005a-e293-475b-a563-1d89f1d04fa0', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya') AND locale = 'en'), 'aa42617c-3d48-44aa-8013-f813d620be66', 'artist', 'af23b96d-fe2a-4712-8d6a-972dac1fdb9e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya') AND locale = 'en'), 'aad06817-406c-4c2a-8528-0240b11b41e9', 'artist', '73cac635-71c3-407f-b9f5-02a705d6956b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya') AND locale = 'es'), '008a31d4-c3d2-47a3-8e9b-a9c61392ed47', 'artist', '73cac635-71c3-407f-b9f5-02a705d6956b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya') AND locale = 'es'), '132570d5-1d2d-4385-a319-6c7877a37d61', 'artist', 'af23b96d-fe2a-4712-8d6a-972dac1fdb9e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya') AND locale = 'es'), '4363b390-0747-4eca-b6c4-376448894d74', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya') AND locale = 'es'), 'd127e576-dae8-4438-90e3-a68877d455c8', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

COMMIT;
