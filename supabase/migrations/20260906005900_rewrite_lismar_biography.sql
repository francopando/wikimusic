BEGIN;

-- Rewrite the catalogue entry for Lismar.
--
-- Lismar. Filler in English, nothing in Spanish, no surname, no date -- on a
-- rapper who was invited into a BZRP Music Session at nineteen. That is the
-- single largest platform a Dominican artist of her generation has been given,
-- and the row did not know her family name.
--
-- FILLED: legal name Patricia Lismary Fernández Soto, date_of_birth 31 May
-- 2005. The stage name is her own middle name with a letter taken off.
--
-- CORRECTED: province "Distrito Nacional" -> "Santo Domingo" and birth_place
-- "Santo Domingo" -> "Los Mina, Santo Domingo Este". Los Mina is in Santo
-- Domingo Este, not the Distrito Nacional, and every article about her names
-- the barrio. primary_role singer -> rapper; primary_genre urbano ->
-- urban-rap-hip-hop. She is a rapper in every source, including her own
-- description of what she does.
--
-- MUSICBRAINZ IS WRONG ABOUT HER AND THE ROW WAS RIGHT. The MusicBrainz record
-- gives gender Male. She is a woman -- Listín Diario, Diario Libre, Rolling
-- Stone en Español, LOS40 and Diario AS all write "la rapera dominicana". The
-- stored value female is kept and the MusicBrainz field is not to be trusted
-- here if anyone syncs from it later.
--
-- ADDED: aliases, disambiguation, the emerging tag.
--
-- SOURCES: Diario Libre, 20 and 28 May 2024, on the Bizarrap session and on the
-- route from Los Mina. Diario AS, 24 May 2024, which gives the legal name, the
-- age of nineteen and the origin of the stage name. Tapedeck for the birth date
-- of 31 May 2005 and the barrio. CMTV, 20 May 2024, for the start at sixteen
-- making videos. Rolling Stone en Español, 16 September 2024, "La nueva ola del
-- rap dominicano: Lismar", for the early study of guitar and piano. Listín
-- Diario, 27 November 2024, on the A COLORS SHOW appearance. MusicBrainz for
-- the two releases: the BZRP session, 2024, and Fogo de Chão, 2026.
--
-- NOT WRITTEN: play counts, which is most of what the coverage measures.
-- Nothing about her household.
--
-- NOT LINKED: Bizarrap is Argentine. No Dominican collaborator is named in any
-- of the sources found.
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
       name = 'Lismar',
       sort_name = 'Lismar',
       type = 'solo_artist',
       status = 'published',
       gender = 'female',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = '2005-05-31',
       birth_year = 2005,
       date_of_death = NULL,
       birth_place = 'Los Mina, Santo Domingo Este',
       province = 'Santo Domingo',
       first_name = 'Patricia',
       middle_name = 'Lismary',
       last_name = 'Fernández',
       second_last_name = 'Soto',
       stage_name = 'Lismar',
       aliases = ARRAY['Slow Lismar']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-dembow', 'urban-drill']::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = NULL,
       youtube = '@Slowlismar',
       facebook = NULL,
       instagram = 'slowlismar',
       disambiguation = 'Rapper from Los Mina; BZRP Music Sessions Vol. 60',
       bio_en = 'Lismar, born Patricia Lismary Fernández Soto, is a Dominican rapper from Los Mina. Her stage name is her own middle name with a letter taken off it, which is about as economical as a rap name gets.

**Los Mina**

She studied guitar and piano as a child, which is not the usual grounding for a Dominican rapper and shows in how she places a line. She started putting out videos at sixteen.

Los Mina has produced a large share of the Dominican urban catalogue — Lápiz Conciente came out of the same barrio, and so did much of the generation after him. What it had not produced was a young woman rapping rather than singing.

**Session 60**

In May 2024 the Argentine producer Bizarrap announced her as the guest of BZRP Music Sessions, Vol. 60. The sessions are, in practice, a shortlist of who the Spanish-speaking industry has decided to take seriously, and the guests are usually established stars. She was nineteen and largely unknown outside her own country.

The record put her name into rotation across Latin America and Spain within a week, and the Dominican press covered it as what it was: the barrio to the session, without any of the intermediate steps a career normally requires.

**After the session**

She appeared on A COLORS SHOW in November of the same year, which is the other platform of that kind — a bare stage, one take, no production to hide behind — and she has said plainly that rapping is where she puts what she cannot say otherwise.

Fogo de Chão followed in 2026. The catalogue is still short, and everything about her position depends on what she does with it next.',
       bio_es = 'Lismar, de nombre Patricia Lismary Fernández Soto, es una rapera dominicana de Los Mina. Su nombre artístico es su propio segundo nombre con una letra menos, que es todo lo económico que puede ser un nombre de rap.

**Los Mina**

Estudió guitarra y piano de niña, cosa que no es la formación corriente de un rapero dominicano y se le nota en cómo coloca una línea. Empezó a publicar videos a los dieciséis.

Los Mina ha producido buena parte del catálogo urbano dominicano: de ese mismo barrio salió Lápiz Conciente, y también buena parte de la generación que vino detrás. Lo que no había producido era una muchacha rapeando en vez de cantando.

**La sesión 60**

En mayo de 2024 el productor argentino Bizarrap la anunció como invitada de la BZRP Music Sessions, Vol. 60. Las sesiones son, en la práctica, una lista corta de a quién ha decidido tomar en serio la industria en español, y los invitados suelen ser estrellas establecidas. Ella tenía diecinueve años y era prácticamente desconocida fuera de su país.

El disco le puso el nombre en rotación por toda América Latina y España en una semana, y la prensa dominicana lo cubrió por lo que era: del barrio a la sesión, sin ninguno de los pasos intermedios que normalmente exige una carrera.

**Después de la sesión**

En noviembre del mismo año apareció en A COLORS SHOW, que es la otra plataforma de esa clase —tarima pelada, una toma, ninguna producción detrás de la cual esconderse— y ha dicho sin rodeos que el rap es donde pone lo que de otro modo no puede decir.

Fogo de Chão salió en 2026. El catálogo todavía es corto, y todo lo que tiene que ver con su posición depende de lo que haga ahora con ella.',
       updated_at = now()
 WHERE slug = 'lismar';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lismar')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lismar')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Lismar, born Patricia Lismary Fernández Soto, is a Dominican rapper from Los Mina. Her stage name is her own middle name with a letter taken off it, which is about as economical as a rap name gets.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Mina","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She studied guitar and piano as a child, which is not the usual grounding for a Dominican rapper and shows in how she places a line. She started putting out videos at sixteen.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Mina has produced a large share of the Dominican urban catalogue — ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"4138f517-a140-4062-af95-f6b037476b7a"}},{"text":" came out of the same barrio, and so did much of the generation after him. What it had not produced was a young woman rapping rather than singing.","type":"text"}]},{"type":"paragraph","content":[{"text":"Session 60","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In May 2024 the Argentine producer Bizarrap announced her as the guest of BZRP Music Sessions, Vol. 60. The sessions are, in practice, a shortlist of who the Spanish-speaking industry has decided to take seriously, and the guests are usually established stars. She was nineteen and largely unknown outside her own country.","type":"text"}]},{"type":"paragraph","content":[{"text":"The record put her name into rotation across Latin America and Spain within a week, and the Dominican press covered it as what it was: the barrio to the session, without any of the intermediate steps a career normally requires.","type":"text"}]},{"type":"paragraph","content":[{"text":"After the session","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She appeared on A COLORS SHOW in November of the same year, which is the other platform of that kind — a bare stage, one take, no production to hide behind — and she has said plainly that rapping is where she puts what she cannot say otherwise.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fogo de Chão followed in 2026. The catalogue is still short, and everything about her position depends on what she does with it next.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'lismar'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Lismar, de nombre Patricia Lismary Fernández Soto, es una rapera dominicana de Los Mina. Su nombre artístico es su propio segundo nombre con una letra menos, que es todo lo económico que puede ser un nombre de rap.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Mina","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Estudió guitarra y piano de niña, cosa que no es la formación corriente de un rapero dominicano y se le nota en cómo coloca una línea. Empezó a publicar videos a los dieciséis.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Mina ha producido buena parte del catálogo urbano dominicano: de ese mismo barrio salió ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"5cef7b25-fc1c-4fec-987e-1fb0ebb75332"}},{"text":", y también buena parte de la generación que vino detrás. Lo que no había producido era una muchacha rapeando en vez de cantando.","type":"text"}]},{"type":"paragraph","content":[{"text":"La sesión 60","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En mayo de 2024 el productor argentino Bizarrap la anunció como invitada de la BZRP Music Sessions, Vol. 60. Las sesiones son, en la práctica, una lista corta de a quién ha decidido tomar en serio la industria en español, y los invitados suelen ser estrellas establecidas. Ella tenía diecinueve años y era prácticamente desconocida fuera de su país.","type":"text"}]},{"type":"paragraph","content":[{"text":"El disco le puso el nombre en rotación por toda América Latina y España en una semana, y la prensa dominicana lo cubrió por lo que era: del barrio a la sesión, sin ninguno de los pasos intermedios que normalmente exige una carrera.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después de la sesión","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En noviembre del mismo año apareció en A COLORS SHOW, que es la otra plataforma de esa clase —tarima pelada, una toma, ninguna producción detrás de la cual esconderse— y ha dicho sin rodeos que el rap es donde pone lo que de otro modo no puede decir.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fogo de Chão salió en 2026. El catálogo todavía es corto, y todo lo que tiene que ver con su posición depende de lo que haga ahora con ella.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'lismar'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lismar') AND locale = 'en'), '4138f517-a140-4062-af95-f6b037476b7a', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lismar') AND locale = 'es'), '5cef7b25-fc1c-4fec-987e-1fb0ebb75332', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

COMMIT;
