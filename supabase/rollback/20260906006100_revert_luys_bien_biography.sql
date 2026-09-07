BEGIN;

-- Reverts 20260906006100_rewrite_luys_bien_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Luys Bien',
       sort_name = 'Gómez Luciano, Luis Bienvenido',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Loma de Cabrera',
       province = 'Dajabón',
       first_name = 'Luis',
       middle_name = 'Bienvenido',
       last_name = 'Gómez',
       second_last_name = 'Luciano',
       stage_name = 'Luys Bien',
       aliases = ARRAY['Luis Bienvenido Gómez Luciano', 'Luis Bienvenido Gómez', 'Luis Gómez']::text[],
       occupations = '["songwriter","musician"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['bachata', 'salsa', 'merengue-pambiche', 'bolero']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@LuysBien',
       facebook = 'LuysBien',
       instagram = 'luysbien',
       disambiguation = NULL,
       bio_en = 'Luys Bien is a Dominican artist whose work is associated with Merengue, Bachata, Bolero, and Salsa. The artist is connected to Loma de Cabrera, Dajabón, with work tied to Dominican music culture and its wider audience.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'luys-bien';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luys Bien is a Dominican artist whose work is associated with Merengue, Bachata, Bolero, and Salsa. The artist is connected to Loma de Cabrera, Dajabón, with work tied to Dominican music culture and its wider audience.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'luys-bien'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
