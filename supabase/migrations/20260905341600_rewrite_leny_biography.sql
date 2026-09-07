BEGIN;

-- Rewrite the catalogue entry for Leny.
--
-- Leny. Filler in English, nothing in Spanish, no genre, no place -- and no
-- mention of the group he spent years in before going solo.
--
-- GENRE SET to bachata; the row had none.
--
-- SOURCES: the artist biography carried by Apple Music and Spotify, which reads
-- "a bachata-pop vocalist from the Dominican Republic who embarked on a solo
-- career in 2008 after several years of success in the merengue group
-- Ilegales". Amazon's listing for the album "One", dated 1 January 2008, twelve
-- songs over forty-one minutes, opening with "Debil", "Stop" and "Te Sigo
-- Amando". English Wikipedia's article on "Bachata Number 1's, Vol. 2", which
-- records that on "One" he covered "Pobre Corazon", first sung by the Puerto
-- Rican reggaeton singer Divino. Contemporary uploads for "Llegara Ese Dia" and
-- "Recordaras Que Fui Yo".
--
-- NOT WRITTEN: a real name, a birth date or a birthplace. None is documented.
-- FLAGGED: status. Left at needs_review; no image on the row.
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
       name = 'Leny',
       sort_name = 'Leny',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Leny',
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Leny',
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@LenyVEVO',
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican bachata-pop singer; formerly of Ilegales, and the 2008 album “One”',
       bio_en = 'Leny is a Dominican bachata-pop singer. He spent several years in Ilegales before leaving to record on his own in 2008.

**Out of a merengue group**

Ilegales made merengue built for a dance floor, loud and fast and chanted. Bachata-pop is close to the opposite: a guitar music that had spent decades being looked down on, softened in the 2000s into something radio would carry.

Crossing between the two was the movement of that decade. Bachata was winning, merengue was losing the young audience, and a singer who could hold a melody had more to gain on the guitar side.

**One**

His album came out at the start of 2008: twelve songs, among them Débil, Stop, Te Sigo Amando, Llegará Ese Día and Recordarás Que Fui Yo.

It also carries a bachata reading of Pobre Corazón, a song first recorded by the Puerto Rican reggaetón singer Divino. Taking a reggaetón record and playing it on bachata guitars was the standard move of the period, and it is how a good part of the genre’s audience was won.

Nothing since that album is documented, and neither is his name or where he is from.',
       bio_es = 'Leny es un cantante dominicano de bachata-pop. Pasó varios años en Ilegales antes de salirse a grabar por su cuenta en 2008.

**Salido de un grupo de merengue**

Ilegales hacía merengue armado para una pista: fuerte, rápido y coreado. El bachata-pop es casi lo contrario: una música de guitarra que había pasado décadas siendo mirada por encima del hombro, suavizada en los dos mil hasta convertirse en algo que la radio sí pasaba.

Cruzar de una a la otra fue el movimiento de esa década. La bachata iba ganando, el merengue iba perdiendo al público joven, y un cantante capaz de sostener una melodía tenía más que ganar del lado de la guitarra.

**One**

Su disco salió a comienzos de 2008: doce canciones, entre ellas Débil, Stop, Te Sigo Amando, Llegará Ese Día y Recordarás Que Fui Yo.

Lleva además una lectura en bachata de Pobre Corazón, tema que grabó primero el cantante de reggaetón puertorriqueño Divino. Coger un disco de reggaetón y tocarlo con guitarras de bachata era la jugada estándar del período, y así se ganó buena parte del público del género.

De lo que vino después de ese álbum no hay nada documentado, ni tampoco de su nombre ni de dónde es.',
       updated_at = now()
 WHERE slug = 'leny';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'leny')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'leny')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Leny is a Dominican bachata-pop singer. He spent several years in ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales","occurrenceId":"9508d32a-e3dd-4884-aebc-afc58b63594c"}},{"text":" before leaving to record on his own in 2008.","type":"text"}]},{"type":"paragraph","content":[{"text":"Out of a merengue group","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ilegales made merengue built for a dance floor, loud and fast and chanted. Bachata-pop is close to the opposite: a guitar music that had spent decades being looked down on, softened in the 2000s into something radio would carry.","type":"text"}]},{"type":"paragraph","content":[{"text":"Crossing between the two was the movement of that decade. Bachata was winning, merengue was losing the young audience, and a singer who could hold a melody had more to gain on the guitar side.","type":"text"}]},{"type":"paragraph","content":[{"text":"One","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His album came out at the start of 2008: twelve songs, among them Débil, Stop, Te Sigo Amando, Llegará Ese Día and Recordarás Que Fui Yo.","type":"text"}]},{"type":"paragraph","content":[{"text":"It also carries a bachata reading of Pobre Corazón, a song first recorded by the Puerto Rican reggaetón singer Divino. Taking a reggaetón record and playing it on bachata guitars was the standard move of the period, and it is how a good part of the genre’s audience was won.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing since that album is documented, and neither is his name or where he is from.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'leny'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Leny es un cantante dominicano de bachata-pop. Pasó varios años en ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales","occurrenceId":"c890865b-23b1-4054-a8c2-8862fd052982"}},{"text":" antes de salirse a grabar por su cuenta en 2008.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salido de un grupo de merengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ilegales hacía merengue armado para una pista: fuerte, rápido y coreado. El bachata-pop es casi lo contrario: una música de guitarra que había pasado décadas siendo mirada por encima del hombro, suavizada en los dos mil hasta convertirse en algo que la radio sí pasaba.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cruzar de una a la otra fue el movimiento de esa década. La bachata iba ganando, el merengue iba perdiendo al público joven, y un cantante capaz de sostener una melodía tenía más que ganar del lado de la guitarra.","type":"text"}]},{"type":"paragraph","content":[{"text":"One","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su disco salió a comienzos de 2008: doce canciones, entre ellas Débil, Stop, Te Sigo Amando, Llegará Ese Día y Recordarás Que Fui Yo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lleva además una lectura en bachata de Pobre Corazón, tema que grabó primero el cantante de reggaetón puertorriqueño Divino. Coger un disco de reggaetón y tocarlo con guitarras de bachata era la jugada estándar del período, y así se ganó buena parte del público del género.","type":"text"}]},{"type":"paragraph","content":[{"text":"De lo que vino después de ese álbum no hay nada documentado, ni tampoco de su nombre ni de dónde es.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'leny'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'leny') AND locale = 'en'), '9508d32a-e3dd-4884-aebc-afc58b63594c', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'leny') AND locale = 'es'), 'c890865b-23b1-4054-a8c2-8862fd052982', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

COMMIT;
