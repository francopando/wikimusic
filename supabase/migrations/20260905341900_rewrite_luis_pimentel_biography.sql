BEGIN;

-- Rewrite the catalogue entry for Luís Pimentel.
--
-- Luis Pimentel. Filler in English, nothing in Spanish, no dates -- and the
-- wrong genre. He played second guitar on the first bachata ever recorded.
--
-- GENRE CORRECTED from merengue to bachata.
--
-- SOURCES: MusicBrainz, which files him as a Dominican guitar player and a
-- member of Trio Los Juveniles. Diario Libre's "La bachata cumplio 51 anos",
-- 31 May 2013, reproduced by Gazcue Es Arte, which names the trio precisely:
-- "Con Andres Rodriguez (primera guitarra) y Luis Pimentel (segunda guitarra)
-- conformo el trio Los Juveniles". La Bachata Dominicana and several Dominican
-- pages carrying the same account of Jose Manuel Calderon forming the trio with
-- those two men. Jose Manuel Calderon's own page for the date, 30 May 1962, and
-- for the titles from that session, "Condena" and "Que Sera de Mi", the latter
-- written by Bienvenido Fabian. Instagram and interview listings for his later
-- membership of Trio Ideal. MONARCA MEDIA TV, one month ago, "Luis Pimentel
-- revela como nacio la bachata", which shows he is alive and still telling it.
--
-- NOT WRITTEN: dates of birth or death. Neither is documented anywhere.
--
-- FLAGGED, and it is not about him: Jose Manuel Calderon's own biography in the
-- catalogue says he was born in Santo Domingo, while his artist record says El
-- Seibo. One of the two is wrong, and his entry is generic enough to be worth
-- rewriting anyway -- it carries no dates, no song titles and no mention of the
-- trio that played on the founding records.
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
       name = 'Luís Pimentel',
       sort_name = 'Pimentel, Luís',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Luís',
       middle_name = NULL,
       last_name = 'Pimentel',
       second_last_name = NULL,
       stage_name = 'Luís Pimentel',
       aliases = ARRAY[]::text[],
       occupations = '["guitarist"]'::jsonb,
       instruments = ARRAY['guitar']::text[],
       genres = ARRAY['folklore']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican guitarist; second guitar in Trío Los Juveniles, the trio on the first bachata records',
       bio_en = 'Luís Pimentel is a Dominican guitarist. He played second guitar in Trío Los Juveniles, the group that backed José Manuel Calderón on the first bachata ever recorded.

**Three men and two guitars**

Calderón put the trio together with Andrés Rodríguez on first guitar and Pimentel on second. On 30 May 1962 they recorded the songs that are counted as the beginning of the genre — Condena, and Qué Será de Mí, which Bienvenido Fabián wrote.

Bachata had no name then and no standing. It was played in cantinas and in poor neighbourhoods, dismissed by radio and by the people who decided what Dominican music was allowed to be. What that session did was put it on a record, which is the act that makes a music start existing to everybody who was not in the room.

**The part he played**

Second guitar in a bachata trio is not accompaniment in the ordinary sense. The first guitar carries the melodic line that became the signature of the whole genre; the second holds the harmony and the movement underneath it, and the relationship between the two is the sound.

Whoever was sitting in that chair on 30 May 1962 helped decide what bachata would be, and it was him.

**After the trio**

He went on to Trío Ideal. He is still alive and still telling the story: a Dominican outlet filmed him recently explaining how bachata was born, which makes him one of the last people who can describe that room from the inside.

Almost nothing else about him is recorded — no birth date, no town, no catalogue under his own name. He is known entirely by where he was sitting.',
       bio_es = 'Luís Pimentel es un guitarrista dominicano. Tocó la segunda guitarra en el Trío Los Juveniles, el grupo que acompañó a José Manuel Calderón en la primera bachata que se grabó.

**Tres hombres y dos guitarras**

Calderón armó el trío con Andrés Rodríguez en la primera guitarra y con Pimentel en la segunda. El 30 de mayo de 1962 grabaron los temas que se cuentan como el comienzo del género: Condena, y Qué Será de Mí, que escribió Bienvenido Fabián.

La bachata entonces no tenía nombre ni categoría. Se tocaba en cantinas y en barrios pobres, y la despreciaban la radio y la gente que decidía qué se le permitía ser a la música dominicana. Lo que hizo aquella sesión fue ponerla en un disco, que es el acto con el que una música empieza a existir para todos los que no estaban en el cuarto.

**La parte que le tocó**

La segunda guitarra en un trío de bachata no es acompañamiento en el sentido corriente. La primera lleva la línea melódica que se volvió la firma del género entero; la segunda sostiene la armonía y el movimiento por debajo, y la relación entre las dos es el sonido.

Quien estuviera sentado en esa silla el 30 de mayo de 1962 ayudó a decidir qué iba a ser la bachata, y era él.

**Después del trío**

Pasó al Trío Ideal. Sigue vivo y sigue contándolo: un medio dominicano lo filmó hace poco explicando cómo nació la bachata, lo que lo convierte en una de las últimas personas que pueden describir aquel cuarto desde adentro.

De él no se ha registrado casi nada más: ni fecha de nacimiento, ni pueblo, ni catálogo con su propio nombre. Se le conoce enteramente por dónde estaba sentado.',
       updated_at = now()
 WHERE slug = 'luis-pimentel';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-pimentel')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-pimentel')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luís Pimentel is a Dominican guitarist. He played second guitar in Trío Los Juveniles, the group that backed ","type":"text"},{"type":"artistReference","attrs":{"artistId":"27c82e93-8c8f-4466-86ab-e1afba1e5487","displayText":"José Manuel Calderón","occurrenceId":"b78a5884-6e83-4179-b004-f33c903d4eed"}},{"text":" on the first bachata ever recorded.","type":"text"}]},{"type":"paragraph","content":[{"text":"Three men and two guitars","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Calderón put the trio together with Andrés Rodríguez on first guitar and Pimentel on second. On 30 May 1962 they recorded the songs that are counted as the beginning of the genre — Condena, and Qué Será de Mí, which ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4b85d1eb-ebaa-42b5-9901-5e2805af9138","displayText":"Bienvenido Fabián","occurrenceId":"77fb5236-b615-4774-af46-cd701837b8f1"}},{"text":" wrote.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bachata had no name then and no standing. It was played in cantinas and in poor neighbourhoods, dismissed by radio and by the people who decided what Dominican music was allowed to be. What that session did was put it on a record, which is the act that makes a music start existing to everybody who was not in the room.","type":"text"}]},{"type":"paragraph","content":[{"text":"The part he played","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Second guitar in a bachata trio is not accompaniment in the ordinary sense. The first guitar carries the melodic line that became the signature of the whole genre; the second holds the harmony and the movement underneath it, and the relationship between the two is the sound.","type":"text"}]},{"type":"paragraph","content":[{"text":"Whoever was sitting in that chair on 30 May 1962 helped decide what bachata would be, and it was him.","type":"text"}]},{"type":"paragraph","content":[{"text":"After the trio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He went on to Trío Ideal. He is still alive and still telling the story: a Dominican outlet filmed him recently explaining how bachata was born, which makes him one of the last people who can describe that room from the inside.","type":"text"}]},{"type":"paragraph","content":[{"text":"Almost nothing else about him is recorded — no birth date, no town, no catalogue under his own name. He is known entirely by where he was sitting.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'luis-pimentel'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luís Pimentel es un guitarrista dominicano. Tocó la segunda guitarra en el Trío Los Juveniles, el grupo que acompañó a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"27c82e93-8c8f-4466-86ab-e1afba1e5487","displayText":"José Manuel Calderón","occurrenceId":"6edea03d-cacc-45f1-83fc-16744c0849a1"}},{"text":" en la primera bachata que se grabó.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tres hombres y dos guitarras","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Calderón armó el trío con Andrés Rodríguez en la primera guitarra y con Pimentel en la segunda. El 30 de mayo de 1962 grabaron los temas que se cuentan como el comienzo del género: Condena, y Qué Será de Mí, que escribió ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4b85d1eb-ebaa-42b5-9901-5e2805af9138","displayText":"Bienvenido Fabián","occurrenceId":"3e55fa57-99b5-484f-873e-8d53f5aae177"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"La bachata entonces no tenía nombre ni categoría. Se tocaba en cantinas y en barrios pobres, y la despreciaban la radio y la gente que decidía qué se le permitía ser a la música dominicana. Lo que hizo aquella sesión fue ponerla en un disco, que es el acto con el que una música empieza a existir para todos los que no estaban en el cuarto.","type":"text"}]},{"type":"paragraph","content":[{"text":"La parte que le tocó","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La segunda guitarra en un trío de bachata no es acompañamiento en el sentido corriente. La primera lleva la línea melódica que se volvió la firma del género entero; la segunda sostiene la armonía y el movimiento por debajo, y la relación entre las dos es el sonido.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quien estuviera sentado en esa silla el 30 de mayo de 1962 ayudó a decidir qué iba a ser la bachata, y era él.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después del trío","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pasó al Trío Ideal. Sigue vivo y sigue contándolo: un medio dominicano lo filmó hace poco explicando cómo nació la bachata, lo que lo convierte en una de las últimas personas que pueden describir aquel cuarto desde adentro.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él no se ha registrado casi nada más: ni fecha de nacimiento, ni pueblo, ni catálogo con su propio nombre. Se le conoce enteramente por dónde estaba sentado.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'luis-pimentel'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-pimentel') AND locale = 'en'), '77fb5236-b615-4774-af46-cd701837b8f1', 'artist', '4b85d1eb-ebaa-42b5-9901-5e2805af9138');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-pimentel') AND locale = 'en'), 'b78a5884-6e83-4179-b004-f33c903d4eed', 'artist', '27c82e93-8c8f-4466-86ab-e1afba1e5487');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-pimentel') AND locale = 'es'), '3e55fa57-99b5-484f-873e-8d53f5aae177', 'artist', '4b85d1eb-ebaa-42b5-9901-5e2805af9138');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-pimentel') AND locale = 'es'), '6edea03d-cacc-45f1-83fc-16744c0849a1', 'artist', '27c82e93-8c8f-4466-86ab-e1afba1e5487');

COMMIT;
