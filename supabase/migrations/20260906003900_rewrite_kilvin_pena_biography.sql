BEGIN;

-- Rewrite the catalogue entry for Kilvin Peña.
--
-- Kilvin Peña. Filler in English, nothing in Spanish, no date, no place, no
-- instruments -- on a bassist for whom a single 2006 article turns out to hold
-- almost the whole beginning of the career.
--
-- FILLED: date_of_birth 1 January 1983 and province Santiago, both from Jazz en
-- Dominicana, 26 December 2006, which profiles him at length and gives "Nace un
-- 1ero de enero del 1983" and "desde la ciudad corazón, Santiago". The date is
-- internally consistent with the same article calling him twenty-three. A first
-- of January is often a placeholder, but here it is written out in prose by
-- someone who had interviewed him, and Jazz en Dominicana repeats the Santiago
-- origin in a 2018 list of Dominican bassists by city.
--
-- ADDED: instruments bass and keyboards; occupations bandleader was NOT added,
-- because everything found has him as a sideman. Genres, aliases and
-- disambiguation added. primary_genre jazz left as stored and is right.
--
-- SOURCES: Jazz en Dominicana, 26 December 2006, for the birth, the city, the
-- start on bass at fifteen playing música típica, the Escuela de Música de
-- Bellas Artes, the turn to jazz, the sub-genres he had already worked in, the
-- early employers -- the Roberto Santana Quartet, the saxophonist Carlos
-- Estrada, the trumpeter José Luis Almengot, the Jonathan Piña Trio, Fellé Vega
-- and Rafelito Mirabal -- and the influences he named, from Fellé Vega and
-- Rafelito Mirabal and Quique del Rosario to Jaco Pastorius, Charlie Haden,
-- Chick Corea, John Patitucci and Gentle Giant. The same site for the later
-- work: the Guy Frómeta Band jam sessions at the Bar es Teatro of the Teatro
-- Nacional, the Festival Arte Vivo tribute to Pengbian Sang in November 2018,
-- the Sistema Temperado bill of April 2022, the December 2018 quartet with
-- Jason Paulino and Denis Belyakov, the International Jazz Day concerts of 2024
-- and 2025, the Centro Español date in Santiago of April 2025 backing Oscar
-- Micheli and Sabrina Estepan, and the Rafelito Mirabal dates of 2024 and 2025
-- where he is billed on acoustic and electric bass. A student's account on the
-- same site, 12 October 2009, for the teaching.
--
-- NOT WRITTEN: nothing about him outside music is published, and none was
-- looked for.
--
-- NOT LINKED: Rafelito Mirabal, Fellé Vega, Guy Frómeta, Pengbian Sang, Carlos
-- Estrada, Cukin Curiel, Sabrina Estepan and Ivanova Casimiro are Dominican and
-- have no entries. They are named in the prose. Adriana Garcell and Denis
-- Belyakov are not Dominican.
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
       name = 'Kilvin Peña',
       sort_name = 'Peña, Kilvin',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'jazz',
       date_of_birth = '1983-01-01',
       birth_year = 1983,
       date_of_death = NULL,
       birth_place = 'Santiago',
       province = 'Santiago',
       first_name = 'Kilvin',
       middle_name = NULL,
       last_name = 'Peña',
       second_last_name = NULL,
       stage_name = 'Kilvin Peña',
       aliases = ARRAY[]::text[],
       occupations = '["musician"]'::jsonb,
       instruments = ARRAY['bass', 'keyboards']::text[],
       genres = ARRAY['salsa', 'merengue-perico-ripiao']::text[],
       artist_tags = ARRAY['secular', 'instrumental']::text[],
       website = NULL,
       youtube = NULL,
       facebook = 'kilvinp',
       instagram = 'kilvinp',
       disambiguation = 'Dominican jazz bassist from Santiago; acoustic and electric bass',
       bio_en = 'Kilvin Peña is a bassist from Santiago. He plays acoustic and electric bass, and some keyboards, and he has spent his working life in the rhythm section of other people’s bands, which is where most of Dominican jazz is actually made.

**Típico first**

He picked up the bass at fifteen and started out playing música típica — the accordion music of the Cibao, where the bass has to hold a pulse that never stops moving. He went from there to the Escuela de Música de Bellas Artes for formal study, took jazz classes, and stayed.

The route matters. A bass player who learns the instrument inside típico arrives at jazz already knowing how to keep time against an accordion, and that is not a skill a conservatory hands out.

**The Monday sessions**

He came up jamming at the Bar es Teatro of the Teatro Nacional, where the Guy Frómeta Band held down Monday nights and young players sat in with older ones. By his early twenties he had worked with the Roberto Santana Quartet, the saxophonist Carlos Estrada, the trumpeter José Luis Almengot, Fellé Vega, Rafelito Mirabal and the trio of Jonatan Piña Duluc.

The influences he lists say what kind of bassist he set out to be: Fellé Vega, Rafelito Mirabal and Quique del Rosario at home, and Jaco Pastorius, Charlie Haden, Chick Corea and John Patitucci abroad. Charlie Haden and Jaco Pastorius are opposite answers to the same question, and choosing both is a working musician’s answer.

**Twenty years in the section**

He has stayed in demand. He played the Festival Arte Vivo tribute to the bassist Pengbian Sang alongside the other players of his instrument; he holds the bass chair in Rafelito Mirabal’s Sistema Temperado, including the night it shared a bill with El Prodigio; and he backs Oscar Micheli when the pianist brings a group to Santiago.

He also teaches. At least one younger Dominican bassist lists lessons with him alongside lessons with Quique del Rosario, which is how a scene this size keeps itself going.',
       bio_es = 'Kilvin Peña es un bajista de Santiago. Toca bajo acústico y eléctrico, y algo de teclados, y ha pasado su vida de trabajo en la sección rítmica de las bandas de otros, que es donde de verdad se hace el jazz dominicano.

**Primero el típico**

Agarró el bajo a los quince años y empezó tocando música típica: la música de acordeón del Cibao, donde el bajo tiene que sostener un pulso que no para de moverse. De ahí pasó a la Escuela de Música de Bellas Artes por el estudio formal, tomó clases de jazz y se quedó.

El recorrido importa. Un bajista que aprende el instrumento dentro del típico llega al jazz sabiendo ya cómo marcar contra un acordeón, y eso no lo regala ningún conservatorio.

**Las noches de los lunes**

Se fogueó jammeando en el Bar es Teatro del Teatro Nacional, donde la Guy Frómeta Band tenía los lunes y los jóvenes se sentaban con los veteranos. Antes de cumplir veinticinco ya había trabajado con el Roberto Santana Quartet, el saxofonista Carlos Estrada, el trompetista José Luis Almengot, Fellé Vega, Rafelito Mirabal y el trío de Jonatan Piña Duluc.

Las influencias que enumera dicen qué clase de bajista quiso ser: Fellé Vega, Rafelito Mirabal y Quique del Rosario aquí, y Jaco Pastorius, Charlie Haden, Chick Corea y John Patitucci afuera. Charlie Haden y Jaco Pastorius son respuestas opuestas a la misma pregunta, y escoger las dos es una respuesta de músico de trabajo.

**Veinte años en la sección**

Ha seguido solicitado. Tocó en el homenaje del Festival Arte Vivo al bajista Pengbian Sang junto a los demás músicos de su instrumento; ocupa la silla de bajo del Sistema Temperado de Rafelito Mirabal, incluida la noche que compartió cartel con El Prodigio; y acompaña a Oscar Micheli cuando el pianista lleva grupo a Santiago.

También enseña. Al menos un bajista dominicano más joven cuenta sus clases con él al lado de las que tomó con Quique del Rosario, que es como se sostiene una escena de este tamaño.',
       updated_at = now()
 WHERE slug = 'kilvin-pena';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kilvin Peña is a bassist from Santiago. He plays acoustic and electric bass, and some keyboards, and he has spent his working life in the rhythm section of other people’s bands, which is where most of Dominican jazz is actually made.","type":"text"}]},{"type":"paragraph","content":[{"text":"Típico first","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He picked up the bass at fifteen and started out playing música típica — the accordion music of the Cibao, where the bass has to hold a pulse that never stops moving. He went from there to the Escuela de Música de Bellas Artes for formal study, took jazz classes, and stayed.","type":"text"}]},{"type":"paragraph","content":[{"text":"The route matters. A bass player who learns the instrument inside típico arrives at jazz already knowing how to keep time against an accordion, and that is not a skill a conservatory hands out.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Monday sessions","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He came up jamming at the Bar es Teatro of the Teatro Nacional, where the Guy Frómeta Band held down Monday nights and young players sat in with older ones. By his early twenties he had worked with the Roberto Santana Quartet, the saxophonist Carlos Estrada, the trumpeter José Luis Almengot, Fellé Vega, Rafelito Mirabal and the trio of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"53215c59-9bfa-476f-8889-7b5aaebcac5b","displayText":"Jonatan Piña Duluc","occurrenceId":"c4602fba-f886-4b28-90df-abd82c850041"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"The influences he lists say what kind of bassist he set out to be: Fellé Vega, Rafelito Mirabal and Quique del Rosario at home, and Jaco Pastorius, Charlie Haden, Chick Corea and John Patitucci abroad. Charlie Haden and Jaco Pastorius are opposite answers to the same question, and choosing both is a working musician’s answer.","type":"text"}]},{"type":"paragraph","content":[{"text":"Twenty years in the section","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He has stayed in demand. He played the Festival Arte Vivo tribute to the bassist Pengbian Sang alongside the other players of his instrument; he holds the bass chair in Rafelito Mirabal’s Sistema Temperado, including the night it shared a bill with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f07fcc6b-a888-4e97-ac50-6ce6ea37a714","displayText":"El Prodigio","occurrenceId":"aec5e968-6885-4702-bf6c-75ecf2c5ac9f"}},{"text":"; and he backs ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9c57ee5c-6abd-4191-ac88-959ff86f0f7c","displayText":"Oscar Micheli","occurrenceId":"24d6b844-357d-4dd9-a04a-1456777acb8f"}},{"text":" when the pianist brings a group to Santiago.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also teaches. At least one younger Dominican bassist lists lessons with him alongside lessons with Quique del Rosario, which is how a scene this size keeps itself going.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'kilvin-pena'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kilvin Peña es un bajista de Santiago. Toca bajo acústico y eléctrico, y algo de teclados, y ha pasado su vida de trabajo en la sección rítmica de las bandas de otros, que es donde de verdad se hace el jazz dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primero el típico","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Agarró el bajo a los quince años y empezó tocando música típica: la música de acordeón del Cibao, donde el bajo tiene que sostener un pulso que no para de moverse. De ahí pasó a la Escuela de Música de Bellas Artes por el estudio formal, tomó clases de jazz y se quedó.","type":"text"}]},{"type":"paragraph","content":[{"text":"El recorrido importa. Un bajista que aprende el instrumento dentro del típico llega al jazz sabiendo ya cómo marcar contra un acordeón, y eso no lo regala ningún conservatorio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las noches de los lunes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se fogueó jammeando en el Bar es Teatro del Teatro Nacional, donde la Guy Frómeta Band tenía los lunes y los jóvenes se sentaban con los veteranos. Antes de cumplir veinticinco ya había trabajado con el Roberto Santana Quartet, el saxofonista Carlos Estrada, el trompetista José Luis Almengot, Fellé Vega, Rafelito Mirabal y el trío de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"53215c59-9bfa-476f-8889-7b5aaebcac5b","displayText":"Jonatan Piña Duluc","occurrenceId":"5b1c00cc-e192-4763-8047-8a9f169d181c"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Las influencias que enumera dicen qué clase de bajista quiso ser: Fellé Vega, Rafelito Mirabal y Quique del Rosario aquí, y Jaco Pastorius, Charlie Haden, Chick Corea y John Patitucci afuera. Charlie Haden y Jaco Pastorius son respuestas opuestas a la misma pregunta, y escoger las dos es una respuesta de músico de trabajo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Veinte años en la sección","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ha seguido solicitado. Tocó en el homenaje del Festival Arte Vivo al bajista Pengbian Sang junto a los demás músicos de su instrumento; ocupa la silla de bajo del Sistema Temperado de Rafelito Mirabal, incluida la noche que compartió cartel con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f07fcc6b-a888-4e97-ac50-6ce6ea37a714","displayText":"El Prodigio","occurrenceId":"4173bc28-5f3e-4206-bc15-92ef186a3b92"}},{"text":"; y acompaña a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9c57ee5c-6abd-4191-ac88-959ff86f0f7c","displayText":"Oscar Micheli","occurrenceId":"50353084-7d73-4d08-a9ca-031a79f6e6d1"}},{"text":" cuando el pianista lleva grupo a Santiago.","type":"text"}]},{"type":"paragraph","content":[{"text":"También enseña. Al menos un bajista dominicano más joven cuenta sus clases con él al lado de las que tomó con Quique del Rosario, que es como se sostiene una escena de este tamaño.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'kilvin-pena'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena') AND locale = 'en'), '24d6b844-357d-4dd9-a04a-1456777acb8f', 'artist', '9c57ee5c-6abd-4191-ac88-959ff86f0f7c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena') AND locale = 'en'), 'aec5e968-6885-4702-bf6c-75ecf2c5ac9f', 'artist', 'f07fcc6b-a888-4e97-ac50-6ce6ea37a714');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena') AND locale = 'en'), 'c4602fba-f886-4b28-90df-abd82c850041', 'artist', '53215c59-9bfa-476f-8889-7b5aaebcac5b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena') AND locale = 'es'), '4173bc28-5f3e-4206-bc15-92ef186a3b92', 'artist', 'f07fcc6b-a888-4e97-ac50-6ce6ea37a714');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena') AND locale = 'es'), '50353084-7d73-4d08-a9ca-031a79f6e6d1', 'artist', '9c57ee5c-6abd-4191-ac88-959ff86f0f7c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena') AND locale = 'es'), '5b1c00cc-e192-4763-8047-8a9f169d181c', 'artist', '53215c59-9bfa-476f-8889-7b5aaebcac5b');

COMMIT;
