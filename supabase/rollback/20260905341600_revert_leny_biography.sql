BEGIN;

-- Reverts 20260905341600_rewrite_leny_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Leny',
       sort_name = 'Leny',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = NULL,
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = 'No Province',
       first_name = 'Leny',
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Leny',
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@LenyVEVO',
       facebook = NULL,
       instagram = NULL,
       disambiguation = NULL,
       bio_en = 'Leny is a Dominican artist whose work is associated with Tropical and Pop. The artist is connected to the Dominican Republic, with work tied to Dominican music culture and its wider audience.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'leny';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'leny')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'leny')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Leny is a Dominican artist whose work is associated with Tropical and Pop. The artist is connected to the Dominican Republic, with work tied to Dominican music culture and its wider audience.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'leny'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
