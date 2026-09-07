BEGIN;

-- Reverts 20260907001300_rewrite_peter_cruz_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Peter Cruz',
       sort_name = 'Cruz, Peter',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue-orquesta',
       date_of_birth = '1960-05-27',
       birth_year = 1960,
       date_of_death = NULL,
       birth_place = 'Yamasá',
       province = 'Monte Plata',
       first_name = 'Pedro',
       middle_name = 'Antonio',
       last_name = 'de la Cruz',
       second_last_name = NULL,
       stage_name = 'Peter Cruz',
       aliases = ARRAY[]::text[],
       occupations = '["vocalist"]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY['merengue']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = 'peter.cruz.71653318',
       instagram = 'petercruzoficial',
       disambiguation = 'Merengue singer; founder member of the Orquesta Internacional, voice of Cometa Blanca',
       bio_en = 'Peter Cruz, born Pedro Antonio de la Cruz in Yamasá, is a Dominican merengue singer. He was inside three of the most important bands of the nineteen-eighties and he is one of the founders of a fourth, and for most of that time his name was the smallest thing on the sleeve.

**Coming up through the bands**

Yamasá is a town in Monte Plata, inland and unglamorous, and he left it for the orchestras. He sang with Cheche Abreu and with Aníbal Bravo before the job that made him, which was with Wilfrido Vargas.

Ron Pa To El Mundo, from 1984, is billed to Peter Cruz with Wilfrido Vargas’s orchestra. Being the voice on a Wilfrido record in that decade meant being heard across the whole Caribbean, and it also meant being interchangeable: the band was the name, the singer was staff.

He has said publicly that Wilfrido Vargas never mentions him in interviews. Whether that is an oversight or something else, the omission is real enough that he has been asked about it on camera, and it is a fair description of what happens to a singer who was hired rather than billed.

**Founding the Internacional**

He tells it that he founded the Orquesta Internacional together with Ramón Orlando and Carlos Herrera. The band went on to be one of the defining merengue orchestras of its era and it carries Ramón Orlando’s name to this day.

He left it at the top, and his account of why is a promise that was not kept. He does not say more than that in public, and the detail stays where he left it.

**Cometa Blanca**

Cometa Blanca is the record he is attached to, and his account of where it came from is the best thing in his story: he found it on a cassette by Chiquetete, a Spanish flamenco and copla singer, and brought it to the band.

A merengue orchestra taking a song off an Andalusian record is not an odd thing in itself — Dominican bands have always eaten whatever was in the room — but it takes somebody actually listening to hear a merengue inside a copla. He also says the mambo, the horn break that lifts the song, was a change he made to the arrangement himself.

That is an arranging credit claimed forty years later by the man who sang it, and it is the sort of claim this record keeps: the singer usually gets the applause and never the credit, and when he asks for the credit it is worth writing down that he asked.

**On his own**

After the Internacional he put out Peter Cruz y su Banda in 1986 and went on working. Fénix Ortiz sang on his records. He has since turned up on a Wilfrido Vargas record alongside Rubby Pérez and Junior Castillo — three voices from three different bands of the same decade, on one track.

He still gives interviews, at length, and the interest in them is not nostalgia. He is one of the few people left who can say what actually happened inside those orchestras, and he is willing to say it.',
       bio_es = 'Peter Cruz, de nombre Pedro Antonio de la Cruz, de Yamasá, es cantante de merengue dominicano. Estuvo dentro de tres de las bandas más importantes de los ochenta y es fundador de una cuarta, y durante casi todo ese tiempo su nombre fue lo más pequeño de la carátula.

**Subir por las orquestas**

Yamasá es un pueblo de Monte Plata, tierra adentro y sin glamour, y él lo dejó por las orquestas. Cantó con Cheche Abreu y con Aníbal Bravo antes del trabajo que le hizo el nombre, que fue con Wilfrido Vargas.

Ron Pa To El Mundo, de 1984, va acreditada a Peter Cruz con la orquesta de Wilfrido Vargas. Ser la voz de un disco de Wilfrido en esa década quería decir que te oía el Caribe entero, y quería decir también que eras intercambiable: la banda era el nombre, el cantante era personal contratado.

Él ha dicho en público que Wilfrido Vargas nunca lo menciona en sus entrevistas. Sea descuido o sea otra cosa, la omisión es lo bastante real como para que se lo hayan preguntado frente a una cámara, y describe bien lo que le pasa a un cantante al que se contrata en vez de anunciarlo.

**Fundar la Internacional**

Él cuenta que fundó la Orquesta Internacional junto a Ramón Orlando y Carlos Herrera. La banda terminó siendo una de las orquestas de merengue que definieron su época y hasta hoy lleva el nombre de Ramón Orlando.

Se fue de ella en lo más alto, y su versión de por qué es una promesa que no se cumplió. En público no dice más que eso, y el detalle se queda donde él lo dejó.

**Cometa Blanca**

Cometa Blanca es el disco al que está pegado, y su relato de dónde salió es lo mejor de su historia: la encontró en un casete de Chiquetete, cantante español de flamenco y copla, y se la llevó a la banda.

Que una orquesta de merengue agarre una canción de un disco andaluz no es raro en sí —las bandas dominicanas siempre se han comido lo que hubiera en el cuarto—, pero hace falta alguien oyendo de verdad para oír un merengue dentro de una copla. Dice además que el mambo, el corte de metales que levanta el tema, fue un cambio que él le hizo al arreglo.

Es un crédito de arreglo reclamado cuarenta años después por el que lo cantó, y es la clase de reclamo que este registro conserva: al cantante le suelen dar los aplausos y nunca el crédito, y cuando pide el crédito vale dejar constancia de que lo pidió.

**Por su cuenta**

Después de la Internacional sacó Peter Cruz y su Banda en 1986 y siguió trabajando. Fénix Ortiz cantó en sus discos. Después ha aparecido en un tema de Wilfrido Vargas junto a Rubby Pérez y Junior Castillo: tres voces de tres bandas distintas de la misma década, en un solo corte.

Sigue dando entrevistas, largas, y el interés que tienen no es la nostalgia. Es de las pocas personas que quedan capaces de contar lo que de verdad pasaba dentro de aquellas orquestas, y está dispuesto a contarlo.',
       updated_at = now()
 WHERE slug = 'peter-cruz';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Peter Cruz, born Pedro Antonio de la Cruz in Yamasá, is a Dominican merengue singer. He was inside three of the most important bands of the nineteen-eighties and he is one of the founders of a fourth, and for most of that time his name was the smallest thing on the sleeve.","type":"text"}]},{"type":"paragraph","content":[{"text":"Coming up through the bands","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Yamasá is a town in Monte Plata, inland and unglamorous, and he left it for the orchestras. He sang with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73691e65-206a-4c71-9b5f-8689f15b2584","displayText":"Cheche Abreu","occurrenceId":"fb1b1f94-8292-4b01-8803-90aef9697e50"}},{"text":" and with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f050869b-f4c0-4281-b883-bce0120ad9b2","displayText":"Aníbal Bravo","occurrenceId":"0b7dfb87-4afc-4c97-a54c-fcfac1e68286"}},{"text":" before the job that made him, which was with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"24c9aa6f-4e3c-4a06-98f3-3338d6ef949e"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Ron Pa To El Mundo, from 1984, is billed to Peter Cruz with Wilfrido Vargas’s orchestra. Being the voice on a Wilfrido record in that decade meant being heard across the whole Caribbean, and it also meant being interchangeable: the band was the name, the singer was staff.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has said publicly that Wilfrido Vargas never mentions him in interviews. Whether that is an oversight or something else, the omission is real enough that he has been asked about it on camera, and it is a fair description of what happens to a singer who was hired rather than billed.","type":"text"}]},{"type":"paragraph","content":[{"text":"Founding the Internacional","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He tells it that he founded the Orquesta Internacional together with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"bf808e88-3600-49b0-8811-c4388209e110"}},{"text":" and Carlos Herrera. The band went on to be one of the defining merengue orchestras of its era and it carries Ramón Orlando’s name to this day.","type":"text"}]},{"type":"paragraph","content":[{"text":"He left it at the top, and his account of why is a promise that was not kept. He does not say more than that in public, and the detail stays where he left it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cometa Blanca","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Cometa Blanca is the record he is attached to, and his account of where it came from is the best thing in his story: he found it on a cassette by Chiquetete, a Spanish flamenco and copla singer, and brought it to the band.","type":"text"}]},{"type":"paragraph","content":[{"text":"A merengue orchestra taking a song off an Andalusian record is not an odd thing in itself — Dominican bands have always eaten whatever was in the room — but it takes somebody actually listening to hear a merengue inside a copla. He also says the mambo, the horn break that lifts the song, was a change he made to the arrangement himself.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is an arranging credit claimed forty years later by the man who sang it, and it is the sort of claim this record keeps: the singer usually gets the applause and never the credit, and when he asks for the credit it is worth writing down that he asked.","type":"text"}]},{"type":"paragraph","content":[{"text":"On his own","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"After the Internacional he put out Peter Cruz y su Banda in 1986 and went on working. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"04fde466-8488-43b4-ab52-e07d12791141","displayText":"Fénix Ortiz","occurrenceId":"ea254e9c-e146-4624-98d6-9a822ef724a3"}},{"text":" sang on his records. He has since turned up on a Wilfrido Vargas record alongside ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cff70c92-8632-4c66-b5a0-81622c8128b0","displayText":"Rubby Pérez","occurrenceId":"1131a135-aff4-464a-a1d1-638416f6bbe6"}},{"text":" and Junior Castillo — three voices from three different bands of the same decade, on one track.","type":"text"}]},{"type":"paragraph","content":[{"text":"He still gives interviews, at length, and the interest in them is not nostalgia. He is one of the few people left who can say what actually happened inside those orchestras, and he is willing to say it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'peter-cruz'), 4)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Peter Cruz, de nombre Pedro Antonio de la Cruz, de Yamasá, es cantante de merengue dominicano. Estuvo dentro de tres de las bandas más importantes de los ochenta y es fundador de una cuarta, y durante casi todo ese tiempo su nombre fue lo más pequeño de la carátula.","type":"text"}]},{"type":"paragraph","content":[{"text":"Subir por las orquestas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Yamasá es un pueblo de Monte Plata, tierra adentro y sin glamour, y él lo dejó por las orquestas. Cantó con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73691e65-206a-4c71-9b5f-8689f15b2584","displayText":"Cheche Abreu","occurrenceId":"94dfd0f4-5d7b-4b1d-997b-837c629ac256"}},{"text":" y con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f050869b-f4c0-4281-b883-bce0120ad9b2","displayText":"Aníbal Bravo","occurrenceId":"7d3ce9cb-0686-437f-9b11-1c9e7776c55d"}},{"text":" antes del trabajo que le hizo el nombre, que fue con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"f3b5c46d-c274-4ce6-85cb-a09e2f373c03"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Ron Pa To El Mundo, de 1984, va acreditada a Peter Cruz con la orquesta de Wilfrido Vargas. Ser la voz de un disco de Wilfrido en esa década quería decir que te oía el Caribe entero, y quería decir también que eras intercambiable: la banda era el nombre, el cantante era personal contratado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Él ha dicho en público que Wilfrido Vargas nunca lo menciona en sus entrevistas. Sea descuido o sea otra cosa, la omisión es lo bastante real como para que se lo hayan preguntado frente a una cámara, y describe bien lo que le pasa a un cantante al que se contrata en vez de anunciarlo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fundar la Internacional","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Él cuenta que fundó la Orquesta Internacional junto a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"d5e5c8fd-7fc9-47b6-8d40-25810b6644f9"}},{"text":" y Carlos Herrera. La banda terminó siendo una de las orquestas de merengue que definieron su época y hasta hoy lleva el nombre de Ramón Orlando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se fue de ella en lo más alto, y su versión de por qué es una promesa que no se cumplió. En público no dice más que eso, y el detalle se queda donde él lo dejó.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cometa Blanca","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Cometa Blanca es el disco al que está pegado, y su relato de dónde salió es lo mejor de su historia: la encontró en un casete de Chiquetete, cantante español de flamenco y copla, y se la llevó a la banda.","type":"text"}]},{"type":"paragraph","content":[{"text":"Que una orquesta de merengue agarre una canción de un disco andaluz no es raro en sí —las bandas dominicanas siempre se han comido lo que hubiera en el cuarto—, pero hace falta alguien oyendo de verdad para oír un merengue dentro de una copla. Dice además que el mambo, el corte de metales que levanta el tema, fue un cambio que él le hizo al arreglo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es un crédito de arreglo reclamado cuarenta años después por el que lo cantó, y es la clase de reclamo que este registro conserva: al cantante le suelen dar los aplausos y nunca el crédito, y cuando pide el crédito vale dejar constancia de que lo pidió.","type":"text"}]},{"type":"paragraph","content":[{"text":"Por su cuenta","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Después de la Internacional sacó Peter Cruz y su Banda en 1986 y siguió trabajando. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"04fde466-8488-43b4-ab52-e07d12791141","displayText":"Fénix Ortiz","occurrenceId":"cd46fad7-ae0f-4889-8453-d1f3f9d7583a"}},{"text":" cantó en sus discos. Después ha aparecido en un tema de Wilfrido Vargas junto a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cff70c92-8632-4c66-b5a0-81622c8128b0","displayText":"Rubby Pérez","occurrenceId":"de73480a-069a-46dd-b28f-d1d1c2a7eac6"}},{"text":" y Junior Castillo: tres voces de tres bandas distintas de la misma década, en un solo corte.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sigue dando entrevistas, largas, y el interés que tienen no es la nostalgia. Es de las pocas personas que quedan capaces de contar lo que de verdad pasaba dentro de aquellas orquestas, y está dispuesto a contarlo.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'peter-cruz'), 4)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), '0b7dfb87-4afc-4c97-a54c-fcfac1e68286', 'artist', 'f050869b-f4c0-4281-b883-bce0120ad9b2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), '1131a135-aff4-464a-a1d1-638416f6bbe6', 'artist', 'cff70c92-8632-4c66-b5a0-81622c8128b0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), '24c9aa6f-4e3c-4a06-98f3-3338d6ef949e', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), 'bf808e88-3600-49b0-8811-c4388209e110', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), 'ea254e9c-e146-4624-98d6-9a822ef724a3', 'artist', '04fde466-8488-43b4-ab52-e07d12791141');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), 'fb1b1f94-8292-4b01-8803-90aef9697e50', 'artist', '73691e65-206a-4c71-9b5f-8689f15b2584');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), '7d3ce9cb-0686-437f-9b11-1c9e7776c55d', 'artist', 'f050869b-f4c0-4281-b883-bce0120ad9b2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), '94dfd0f4-5d7b-4b1d-997b-837c629ac256', 'artist', '73691e65-206a-4c71-9b5f-8689f15b2584');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), 'cd46fad7-ae0f-4889-8453-d1f3f9d7583a', 'artist', '04fde466-8488-43b4-ab52-e07d12791141');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), 'd5e5c8fd-7fc9-47b6-8d40-25810b6644f9', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), 'de73480a-069a-46dd-b28f-d1d1c2a7eac6', 'artist', 'cff70c92-8632-4c66-b5a0-81622c8128b0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), 'f3b5c46d-c274-4ce6-85cb-a09e2f373c03', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

COMMIT;
