BEGIN;

-- Reverts 20260906007000_rewrite_manuel_tejada_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Manuel Tejada',
       sort_name = 'Tejada, Manuel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'producer',
       primary_genre = 'merengue',
       date_of_birth = '1957-11-26',
       birth_year = 1957,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Santo Domingo',
       first_name = 'Manuel',
       middle_name = NULL,
       last_name = 'Tejada',
       second_last_name = NULL,
       stage_name = 'Manuel Tejada',
       aliases = ARRAY['Manuel Tejada']::text[],
       occupations = '["musician","arranger","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = 'https://www.midilabstudios.com',
       youtube = NULL,
       facebook = NULL,
       instagram = 'manueltejadat',
       disambiguation = NULL,
       bio_en = 'Manuel Tejada is a Dominican artist whose work is associated with Merengue and Latin Pop. The artist is documented through recordings and credits connected to Dominican music culture.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'manuel-tejada';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Manuel Tejada is a Dominican artist whose work is associated with Merengue and Latin Pop. The artist is documented through recordings and credits connected to Dominican music culture.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'manuel-tejada'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
