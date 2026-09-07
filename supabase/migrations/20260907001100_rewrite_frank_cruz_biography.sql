BEGIN;

-- Rewrite the catalogue entry for Frank Cruz.
--
-- Frank Cruz. Rewrite -- and the single most serious correction of this run.
--
-- THE CATALOGUE WAS PUBLISHING A LIVING MAN AS DEAD. The row carried death_year
-- 2020, date_of_death 2020-02-18 and ended true. He is alive. He turned
-- ninety-nine this year.
--
-- The evidence is not thin and it is not one source:
--
--   - 7días, 29 September 2023, a signed profile by Andrés Díaz, written in the
--     present tense throughout: "es un artista dominicano de gran trayectoria en
--     el arte popular... A lo largo de su carrera HA RECIBIDO grandes
--     reconocimientos". That is three and a half years after the stored death
--     date.
--   - "Los 98 de Frank Cruz", a music programme published a year ago about his
--     ninety-eighth birthday.
--   - "Frank Cruz a sus 99 años", posted two months ago by a Dominican history
--     page, with a hundred-odd comments including "no sabía que aún vive esa
--     leyenda del bolero".
--   - A blog and its Instagram, July 2026: "¡99 años y aún canta muy bien!"
--   - AND NO OBITUARY. Searching his name against falleció, muere and deceso
--     returns Iván Cruz, Alex Bueno, Anthony Cruz, Frank Suero and Rafael
--     Sánchez Cestero -- other people entirely. A figure of his standing dying
--     in February 2020 would have filled the Dominican press. There is nothing.
--
-- death_year, date_of_death and ended are cleared. Where 18 February 2020 came
-- from is not knowable from here; it is most likely a confusion with another
-- Frank Cruz. The lesson goes in the bitácora next to the Alex Bueno one, which
-- was the same check run the other way round: verify the death, in both
-- directions.
--
-- THE SURNAME IS CORRECTED TOO. The row spells it Osuna. 7días, República
-- Merengue, Son y Salsa con Clase and every page that gives his full name spell
-- it OZUNA. second_last_name changes.
--
-- FILLED: aliases El Señor Bolero and El Calvo de Oro, both of which appear
-- wherever he is named; occupations, genres and instruments; disambiguation.
--
-- LEFT ALONE AND CONFIRMED: date_of_birth 1927-06-28, which 7días gives to the
-- day, and birth_place. birth_place stays "Santo Domingo" rather than becoming
-- "San Antón, Santo Domingo" -- San Antón is the barrio and it is named in the
-- prose, which is how this catalogue has handled barrios since the Los Mina
-- sweep.
--
-- A DATE THE SOURCES SPLIT ON. 7días puts him in Enrique "Riquín" Bustamante's
-- conjunto at the Güibia bathing resort at the START OF THE 1960s. Another
-- widely circulated paragraph says he was playing Güibia FROM 1953. The entry
-- names the engagement and does not date it.
--
-- SOURCES: 7días, 29 September 2023, which is the fullest and the only signed
-- newspaper piece found -- it carries the birth date, the Gilberto Muñoz
-- beginning, the 1955 Agua y Luz contract, the 1963 formation of Los Magos del
-- Ritmo with the name of the announcer who christened them, the thirty-five
-- albums, the song titles and the three honours. República Merengue and Son y
-- Salsa con Clase for the nicknames and the spelling of the surname. Imágenes de
-- Nuestra Historia and El Blog de Shayra, 2026, for the fact that he is alive.
-- El Día, 14 May 2009, on a surgery, which is not used. A YouTube programme on
-- his ninety-eighth birthday.
--
-- NOT WRITTEN: the 2009 surgery report. Health is outside what this record
-- keeps; it is cited above only because it is part of the evidence that the
-- stored death date is wrong.
--
-- NOT LINKED: Antonio Morel, Gilberto Muñoz, Enrique "Riquín" Bustamante, Lucía
-- Félix, Rafael Antonio Peguero "El Negrito Macabí", the announcer Ramón Rivera
-- Batista, the choreographer Josefina Miniño and José Lázaro Sosa have no
-- entries. Antonio Morel is the notable gap and this is the second entry in a
-- row to hit it.
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
       name = 'Frank Cruz',
       sort_name = 'Cruz, Frank',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = '1927-06-28',
       birth_year = 1927,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Francisco',
       middle_name = NULL,
       last_name = 'Cruz',
       second_last_name = 'Ozuna',
       stage_name = 'Frank Cruz',
       aliases = ARRAY['El Señor Bolero', 'El Calvo de Oro']::text[],
       occupations = '["vocalist"]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY['bolero', 'merengue-orquesta']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Lead voice of Félix del Rosario y Los Magos del Ritmo',
       bio_en = 'Frank Cruz, born Francisco Cruz Ozuna in the San Antón barrio of Santo Domingo, is a Dominican singer of merengue and bolero. He is ninety-nine years old and he is still singing.

**An amateur contest**

He got in through the front door of the era: an amateur singing competition on La Voz Dominicana, the broadcaster that decided who got heard in that country for twenty years. He was twenty, and it put him into Gilberto Muñoz’s conjunto.

In 1955 Antonio Morel hired him for the Teatro Agua y Luz, on a bill with Lucía Félix and Francis Santana. He also spent a stretch with Enrique Bustamante, known as Riquín, playing the dances at the Güibia bathing resort — an open-air place on the Santo Domingo seafront that no longer exists and that everybody who was young then remembers.

**Los Magos del Ritmo**

In 1963 Félix del Rosario was commissioned to put a band together for the Hotel y Casino Europa. He picked Frank Cruz as his lead singer, with Rafael Antonio Peguero, El Negrito Macabí, beside him. A radio announcer named Ramón Rivera Batista gave the group its name: Los Magos del Ritmo, the magicians of rhythm.

It became one of the most productive partnerships in Dominican music. Thirty-five long-playing records came out of it. Llévatela, Otro Fin de Semana and Tímido are the boleros; Ya Llegó La Navidad, Mal Pelao, La Bailadora and La Gotera de Juana are the merengues, and the Christmas one is still played every December.

What the pairing did was put a bolero singer in front of a merengue band. He has the diction and the restraint of a crooner and the band behind him is a dance orchestra, and the friction between those two things is the sound. He is called el señor bolero and also el calvo de oro, the golden bald man, and both names have followed him for sixty years.

He also turns up on records with Joseíto Mateo and Francis Santana — the generation that built the Dominican popular songbook, all of them in the same rooms.

**Recognitions**

In 2011 the Banco de Reservas proclaimed him a Reserva Musical. In 2014 the Ministry of Culture recognised him and he was honoured at the merengue festival.

In 2019, for the hundred and sixty-fifth anniversary of the national merengue day, the folklore directorate hung three photographs in the Galería Nacional: the choreographer Josefina Miniño, José Lázaro Sosa, and him. That is the closest thing the country has to putting a musician in a museum while he can still walk in and look at it.

**Still here**

Very few Dominican musicians of the La Voz Dominicana generation are alive. He has outlived the broadcaster, the theatre, the bathing resort, the hotel, the bandleader and most of the audience.

Dominican music pages post about him with a certain surprise, and the comments underneath say the same thing in different words: people did not realise he was still here. He is, and the voice, by the accounts of those who have heard him recently, is still doing what it did.',
       bio_es = 'Frank Cruz, de nombre Francisco Cruz Ozuna, del barrio San Antón de Santo Domingo, es cantante dominicano de merengue y bolero. Tiene noventa y nueve años y sigue cantando.

**Un concurso de aficionados**

Entró por la puerta grande de su época: un concurso de cantantes aficionados en La Voz Dominicana, la emisora que durante veinte años decidió a quién se oía en ese país. Tenía veinte años, y de ahí pasó al conjunto de Gilberto Muñoz.

En 1955 Antonio Morel lo contrató para el Teatro Agua y Luz, en cartel con Lucía Félix y Francis Santana. También pasó un tramo con Enrique Bustamante, Riquín, amenizando los bailes del balneario de Güibia: un lugar al aire libre en el malecón de Santo Domingo que ya no existe y que recuerda todo el que fue joven entonces.

**Los Magos del Ritmo**

En 1963 a Félix del Rosario le encargaron armar un grupo para el Hotel y Casino Europa. Escogió a Frank Cruz como cantante principal, con Rafael Antonio Peguero, El Negrito Macabí, al lado. Un locutor llamado Ramón Rivera Batista le puso el nombre al grupo: Los Magos del Ritmo.

Se convirtió en una de las sociedades más productivas de la música dominicana. De ahí salieron treinta y cinco discos de larga duración. Llévatela, Otro Fin de Semana y Tímido son los boleros; Ya Llegó La Navidad, Mal Pelao, La Bailadora y La Gotera de Juana son los merengues, y el de navidad sigue sonando cada diciembre.

Lo que hizo esa dupla fue poner a un bolerista delante de una banda de merengue. Él tiene la dicción y la contención de un crooner y detrás tiene una orquesta de baile, y la fricción entre esas dos cosas es el sonido. Le dicen el señor bolero y también el calvo de oro, y los dos nombres lo acompañan desde hace sesenta años.

También aparece en discos con Joseíto Mateo y Francis Santana: la generación que armó el cancionero popular dominicano, todos en las mismas salas.

**Reconocimientos**

En 2011 el Banco de Reservas lo proclamó Reserva Musical. En 2014 lo reconoció el Ministerio de Cultura y lo homenajearon en el festival del merengue.

En 2019, por el aniversario ciento sesenta y cinco del día nacional del merengue, la dirección de folclore colgó tres fotografías en la Galería Nacional: la coreógrafa Josefina Miniño, José Lázaro Sosa y él. Es lo más cerca que tiene el país de meter a un músico en un museo mientras todavía puede entrar a mirarse.

**Todavía aquí**

Quedan poquísimos músicos dominicanos de la generación de La Voz Dominicana. Él le ha sobrevivido a la emisora, al teatro, al balneario, al hotel, al director de la orquesta y a casi todo el público.

Las páginas de música dominicana publican sobre él con cierta sorpresa, y los comentarios de abajo dicen lo mismo con distintas palabras: la gente no sabía que seguía aquí. Sigue, y la voz, según cuentan los que lo han oído hace poco, sigue haciendo lo que hacía.',
       updated_at = now()
 WHERE slug = 'frank-cruz';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Frank Cruz, born Francisco Cruz Ozuna in the San Antón barrio of Santo Domingo, is a Dominican singer of merengue and bolero. He is ninety-nine years old and he is still singing.","type":"text"}]},{"type":"paragraph","content":[{"text":"An amateur contest","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He got in through the front door of the era: an amateur singing competition on La Voz Dominicana, the broadcaster that decided who got heard in that country for twenty years. He was twenty, and it put him into Gilberto Muñoz’s conjunto.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 1955 Antonio Morel hired him for the Teatro Agua y Luz, on a bill with Lucía Félix and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3a69af3c-1b9a-402b-8a3f-66e51dacdffe","displayText":"Francis Santana","occurrenceId":"5611c154-6227-481a-bafb-5fdb7165b207"}},{"text":". He also spent a stretch with Enrique Bustamante, known as Riquín, playing the dances at the Güibia bathing resort — an open-air place on the Santo Domingo seafront that no longer exists and that everybody who was young then remembers.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Magos del Ritmo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 1963 ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8fc78100-e51e-48a8-91e9-3007f4c67ec0","displayText":"Félix del Rosario","occurrenceId":"2c394668-40e7-48e0-813d-953e43b70259"}},{"text":" was commissioned to put a band together for the Hotel y Casino Europa. He picked Frank Cruz as his lead singer, with Rafael Antonio Peguero, El Negrito Macabí, beside him. A radio announcer named Ramón Rivera Batista gave the group its name: Los Magos del Ritmo, the magicians of rhythm.","type":"text"}]},{"type":"paragraph","content":[{"text":"It became one of the most productive partnerships in Dominican music. Thirty-five long-playing records came out of it. Llévatela, Otro Fin de Semana and Tímido are the boleros; Ya Llegó La Navidad, Mal Pelao, La Bailadora and La Gotera de Juana are the merengues, and the Christmas one is still played every December.","type":"text"}]},{"type":"paragraph","content":[{"text":"What the pairing did was put a bolero singer in front of a merengue band. He has the diction and the restraint of a crooner and the band behind him is a dance orchestra, and the friction between those two things is the sound. He is called el señor bolero and also el calvo de oro, the golden bald man, and both names have followed him for sixty years.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also turns up on records with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8c784f57-4ee4-41b5-b140-c45d0da1c5f6","displayText":"Joseíto Mateo","occurrenceId":"84a7ea1c-0a01-4ae3-bd8e-85766905a655"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3a69af3c-1b9a-402b-8a3f-66e51dacdffe","displayText":"Francis Santana","occurrenceId":"bfddbcfb-67f9-485a-8fec-303f5a6b9263"}},{"text":" — the generation that built the Dominican popular songbook, all of them in the same rooms.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recognitions","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2011 the Banco de Reservas proclaimed him a Reserva Musical. In 2014 the Ministry of Culture recognised him and he was honoured at the merengue festival.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 2019, for the hundred and sixty-fifth anniversary of the national merengue day, the folklore directorate hung three photographs in the Galería Nacional: the choreographer Josefina Miniño, José Lázaro Sosa, and him. That is the closest thing the country has to putting a musician in a museum while he can still walk in and look at it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Still here","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Very few Dominican musicians of the La Voz Dominicana generation are alive. He has outlived the broadcaster, the theatre, the bathing resort, the hotel, the bandleader and most of the audience.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican music pages post about him with a certain surprise, and the comments underneath say the same thing in different words: people did not realise he was still here. He is, and the voice, by the accounts of those who have heard him recently, is still doing what it did.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'frank-cruz'), 4)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Frank Cruz, de nombre Francisco Cruz Ozuna, del barrio San Antón de Santo Domingo, es cantante dominicano de merengue y bolero. Tiene noventa y nueve años y sigue cantando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un concurso de aficionados","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Entró por la puerta grande de su época: un concurso de cantantes aficionados en La Voz Dominicana, la emisora que durante veinte años decidió a quién se oía en ese país. Tenía veinte años, y de ahí pasó al conjunto de Gilberto Muñoz.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 1955 Antonio Morel lo contrató para el Teatro Agua y Luz, en cartel con Lucía Félix y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3a69af3c-1b9a-402b-8a3f-66e51dacdffe","displayText":"Francis Santana","occurrenceId":"8870ccda-0439-4614-85f5-cd06bdbe6333"}},{"text":". También pasó un tramo con Enrique Bustamante, Riquín, amenizando los bailes del balneario de Güibia: un lugar al aire libre en el malecón de Santo Domingo que ya no existe y que recuerda todo el que fue joven entonces.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Magos del Ritmo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1963 a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8fc78100-e51e-48a8-91e9-3007f4c67ec0","displayText":"Félix del Rosario","occurrenceId":"40c65082-1c3e-42b3-b5cc-3f4d1d1828fe"}},{"text":" le encargaron armar un grupo para el Hotel y Casino Europa. Escogió a Frank Cruz como cantante principal, con Rafael Antonio Peguero, El Negrito Macabí, al lado. Un locutor llamado Ramón Rivera Batista le puso el nombre al grupo: Los Magos del Ritmo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se convirtió en una de las sociedades más productivas de la música dominicana. De ahí salieron treinta y cinco discos de larga duración. Llévatela, Otro Fin de Semana y Tímido son los boleros; Ya Llegó La Navidad, Mal Pelao, La Bailadora y La Gotera de Juana son los merengues, y el de navidad sigue sonando cada diciembre.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que hizo esa dupla fue poner a un bolerista delante de una banda de merengue. Él tiene la dicción y la contención de un crooner y detrás tiene una orquesta de baile, y la fricción entre esas dos cosas es el sonido. Le dicen el señor bolero y también el calvo de oro, y los dos nombres lo acompañan desde hace sesenta años.","type":"text"}]},{"type":"paragraph","content":[{"text":"También aparece en discos con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8c784f57-4ee4-41b5-b140-c45d0da1c5f6","displayText":"Joseíto Mateo","occurrenceId":"50097eb1-0de5-4eaf-95ac-773ef765d89f"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3a69af3c-1b9a-402b-8a3f-66e51dacdffe","displayText":"Francis Santana","occurrenceId":"afc8edd0-b628-4c16-ae2e-935515d58e39"}},{"text":": la generación que armó el cancionero popular dominicano, todos en las mismas salas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Reconocimientos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2011 el Banco de Reservas lo proclamó Reserva Musical. En 2014 lo reconoció el Ministerio de Cultura y lo homenajearon en el festival del merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 2019, por el aniversario ciento sesenta y cinco del día nacional del merengue, la dirección de folclore colgó tres fotografías en la Galería Nacional: la coreógrafa Josefina Miniño, José Lázaro Sosa y él. Es lo más cerca que tiene el país de meter a un músico en un museo mientras todavía puede entrar a mirarse.","type":"text"}]},{"type":"paragraph","content":[{"text":"Todavía aquí","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Quedan poquísimos músicos dominicanos de la generación de La Voz Dominicana. Él le ha sobrevivido a la emisora, al teatro, al balneario, al hotel, al director de la orquesta y a casi todo el público.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las páginas de música dominicana publican sobre él con cierta sorpresa, y los comentarios de abajo dicen lo mismo con distintas palabras: la gente no sabía que seguía aquí. Sigue, y la voz, según cuentan los que lo han oído hace poco, sigue haciendo lo que hacía.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'frank-cruz'), 3)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz') AND locale = 'en'), '2c394668-40e7-48e0-813d-953e43b70259', 'artist', '8fc78100-e51e-48a8-91e9-3007f4c67ec0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz') AND locale = 'en'), '5611c154-6227-481a-bafb-5fdb7165b207', 'artist', '3a69af3c-1b9a-402b-8a3f-66e51dacdffe');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz') AND locale = 'en'), '84a7ea1c-0a01-4ae3-bd8e-85766905a655', 'artist', '8c784f57-4ee4-41b5-b140-c45d0da1c5f6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz') AND locale = 'en'), 'bfddbcfb-67f9-485a-8fec-303f5a6b9263', 'artist', '3a69af3c-1b9a-402b-8a3f-66e51dacdffe');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz') AND locale = 'es'), '40c65082-1c3e-42b3-b5cc-3f4d1d1828fe', 'artist', '8fc78100-e51e-48a8-91e9-3007f4c67ec0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz') AND locale = 'es'), '50097eb1-0de5-4eaf-95ac-773ef765d89f', 'artist', '8c784f57-4ee4-41b5-b140-c45d0da1c5f6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz') AND locale = 'es'), '8870ccda-0439-4614-85f5-cd06bdbe6333', 'artist', '3a69af3c-1b9a-402b-8a3f-66e51dacdffe');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz') AND locale = 'es'), 'afc8edd0-b628-4c16-ae2e-935515d58e39', 'artist', '3a69af3c-1b9a-402b-8a3f-66e51dacdffe');

COMMIT;
