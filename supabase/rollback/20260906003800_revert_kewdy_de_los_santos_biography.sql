BEGIN;

-- Reverts 20260906003800_rewrite_kewdy_de_los_santos_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Kewdy de Los Santos',
       sort_name = 'De Los Santos, Kewdy',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Kewdy',
       middle_name = NULL,
       last_name = 'De Los Santos',
       second_last_name = NULL,
       stage_name = 'Kewdy de Los Santos',
       aliases = ARRAY[]::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@Kewdyelgatomalo',
       facebook = 'kewdyelgatomalo',
       instagram = 'kewdyelgatomalo',
       disambiguation = NULL,
       bio_en = 'Kewdy de Los Santos is a Dominican artist whose work is associated with Merengue and Tropical. The artist is connected to the Dominican Republic, with work tied to Dominican music culture and its wider audience.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'kewdy-de-los-santos';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kewdy de Los Santos is a Dominican artist whose work is associated with Merengue and Tropical. The artist is connected to the Dominican Republic, with work tied to Dominican music culture and its wider audience.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
