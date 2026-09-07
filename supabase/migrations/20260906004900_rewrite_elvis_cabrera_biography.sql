BEGIN;

-- Rewrite the catalogue entry for Elvis Cabrera.
--
-- Elvis Cabrera. Filler in English, nothing in Spanish, no genres.
--
-- SHORT ON PURPOSE, AND WITH A WARNING ATTACHED. He is an independent salsa
-- singer with a handful of singles and no press coverage at all. What there is
-- gets written; nothing is padded.
--
-- AN IDENTITY HAZARD, RECORDED SO IT IS NOT WALKED INTO LATER. The name Elvis
-- Cabrera belongs to at least three musicians who turn up in Dominican and
-- Puerto Rican salsa records:
--
--   1. This one -- the singer behind @elviscabreraoficial, active now, whose
--      singles are Señora (2023), Un Canto Para Mi Hijo, Mesita de Noche (2025)
--      and Perdóname (2026), and who appears in Dominican salsa-romántica
--      streams and events.
--   2. A pianist, one of the sons of the bolerista Francisco N. Cabrera
--      "Cabrerita", who also worked with Luis "Perico" Ortiz and appears with
--      his brothers Franklin on congas and Quilvo on bongó.
--   3. An "Elvis Cabrera, músico" credited on Juan Luis Guerra 4.40 sessions.
--
-- Nothing found establishes that any two of those are the same person, and this
-- entry does not say they are. The row keeps the singer, whose accounts are the
-- ones stored on it. If the editor knows otherwise, the merge is his to make.
--
-- The stored occupations already read musician and arranger; both are left,
-- because they came from an earlier pass and nothing contradicts them, but
-- neither is sourced here and the prose does not assert either.
--
-- ADDED: genres, aliases, disambiguation. LEFT ALONE AND FLAGGED: province
-- "Distrito Nacional" and birth_place "Santo Domingo", the importer's default,
-- and no date of birth. No source names a town, a date or a legal name.
--
-- SOURCES: Spotify and Apple Music for the release dates. His Instagram and
-- YouTube, both stored on the row, for the live work and the collaborators he
-- appears beside -- Frederyck El Coco, the salsa-romántica DJ circuit, a
-- streaming session with La Radio Veguera, an appearance with the Puerto Rican
-- Willie González. Instagram again for the duet with Vitiyo of El Dúo del
-- Merengue Bomba.
--
-- NOT WRITTEN: anything that would require guessing which Elvis Cabrera a
-- credit refers to.
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
       name = 'Elvis Cabrera',
       sort_name = 'Cabrera, Elvis',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'salsa',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Elvis',
       middle_name = NULL,
       last_name = 'Cabrera',
       second_last_name = NULL,
       stage_name = 'Elvis Cabrera',
       aliases = ARRAY[]::text[],
       occupations = '["musician","arranger"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['ballads-romantic']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@ElvisCabreraOficial',
       facebook = NULL,
       instagram = 'elviscabreraoficial',
       disambiguation = 'Dominican salsa singer; Señora, Mesita de Noche, Perdóname',
       bio_en = 'Elvis Cabrera is a Dominican salsa singer. He records romantic salsa and releases it a single at a time, without a label behind him.

**The singles**

Señora came in 2023, then Un Canto Para Mi Hijo, then Mesita de Noche and Perdóname. Four songs over four years is the rhythm of somebody paying for his own sessions.

He is part of the Dominican salsa romántica circuit — the network of radio programmes, streaming shows and DJs that keeps the genre alive on the island without any of the industry apparatus that merengue and dembow have. He has shared bills with the Puerto Rican Willie González and turned up on a merengue session with Vitiyo, of El Dúo del Merengue Bomba.

**Salsa in a merengue country**

Dominican salsa has always been a minority pursuit at home. The country invented merengue and then bachata, and it exports both; salsa arrived from Cuba by way of New York and Puerto Rico and has been played here by people who chose it rather than inherited it.

That choice is what a career like this consists of. There is no support structure for it, and the singers who do it keep doing it anyway.

Nothing about him is otherwise documented — no legal name, no date of birth, no town, and no press coverage in any outlet.',
       bio_es = 'Elvis Cabrera es un salsero dominicano. Graba salsa romántica y la publica de sencillo en sencillo, sin sello detrás.

**Los sencillos**

Señora salió en 2023, después Un Canto Para Mi Hijo, después Mesita de Noche y Perdóname. Cuatro canciones en cuatro años es el ritmo de alguien que se paga sus propias sesiones.

Forma parte del circuito dominicano de la salsa romántica: la red de programas de radio, transmisiones y disc jockeys que mantiene viva la salsa en la isla sin nada del aparato industrial que tienen el merengue y el dembow. Ha compartido cartel con el puertorriqueño Willie González y ha aparecido en una sesión de merengue con Vitiyo, de El Dúo del Merengue Bomba.

**Salsa en un país de merengue**

La salsa dominicana siempre ha sido asunto de minorías en casa. El país inventó el merengue y después la bachata, y exporta los dos; la salsa llegó de Cuba por vía de Nueva York y Puerto Rico y aquí la ha tocado gente que la escogió en vez de heredarla.

Esa elección es de lo que consiste una carrera así. No hay estructura que la sostenga, y los cantantes que la hacen la siguen haciendo igual.

De él no hay nada más documentado: ni nombre legal, ni fecha de nacimiento, ni pueblo, ni una nota de prensa en ningún medio.',
       updated_at = now()
 WHERE slug = 'elvis-cabrera';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'elvis-cabrera')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'elvis-cabrera')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Elvis Cabrera is a Dominican salsa singer. He records romantic salsa and releases it a single at a time, without a label behind him.","type":"text"}]},{"type":"paragraph","content":[{"text":"The singles","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Señora came in 2023, then Un Canto Para Mi Hijo, then Mesita de Noche and Perdóname. Four songs over four years is the rhythm of somebody paying for his own sessions.","type":"text"}]},{"type":"paragraph","content":[{"text":"He is part of the Dominican salsa romántica circuit — the network of radio programmes, streaming shows and DJs that keeps the genre alive on the island without any of the industry apparatus that merengue and dembow have. He has shared bills with the Puerto Rican Willie González and turned up on a merengue session with Vitiyo, of El Dúo del Merengue Bomba.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salsa in a merengue country","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dominican salsa has always been a minority pursuit at home. The country invented merengue and then bachata, and it exports both; salsa arrived from Cuba by way of New York and Puerto Rico and has been played here by people who chose it rather than inherited it.","type":"text"}]},{"type":"paragraph","content":[{"text":"That choice is what a career like this consists of. There is no support structure for it, and the singers who do it keep doing it anyway.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing about him is otherwise documented — no legal name, no date of birth, no town, and no press coverage in any outlet.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'elvis-cabrera'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Elvis Cabrera es un salsero dominicano. Graba salsa romántica y la publica de sencillo en sencillo, sin sello detrás.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los sencillos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Señora salió en 2023, después Un Canto Para Mi Hijo, después Mesita de Noche y Perdóname. Cuatro canciones en cuatro años es el ritmo de alguien que se paga sus propias sesiones.","type":"text"}]},{"type":"paragraph","content":[{"text":"Forma parte del circuito dominicano de la salsa romántica: la red de programas de radio, transmisiones y disc jockeys que mantiene viva la salsa en la isla sin nada del aparato industrial que tienen el merengue y el dembow. Ha compartido cartel con el puertorriqueño Willie González y ha aparecido en una sesión de merengue con Vitiyo, de El Dúo del Merengue Bomba.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salsa en un país de merengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La salsa dominicana siempre ha sido asunto de minorías en casa. El país inventó el merengue y después la bachata, y exporta los dos; la salsa llegó de Cuba por vía de Nueva York y Puerto Rico y aquí la ha tocado gente que la escogió en vez de heredarla.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa elección es de lo que consiste una carrera así. No hay estructura que la sostenga, y los cantantes que la hacen la siguen haciendo igual.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él no hay nada más documentado: ni nombre legal, ni fecha de nacimiento, ni pueblo, ni una nota de prensa en ningún medio.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'elvis-cabrera'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
