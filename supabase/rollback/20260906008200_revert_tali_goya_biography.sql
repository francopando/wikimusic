BEGIN;

-- Reverts 20260906008200_rewrite_tali_goya_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Tali Goya',
       sort_name = NULL,
       type = 'solo_artist',
       status = 'published',
       gender = NULL,
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1990-09-28',
       birth_year = 1990,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Juan',
       middle_name = 'Miguel',
       last_name = 'Villar',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@TaliGoyaTV',
       facebook = 'taligoyafans',
       instagram = 'tali_goya',
       disambiguation = NULL,
       bio_en = 'Tali Goya is a Dominican artist. Born in 1990 in Santo Domingo, the artist reflects one of the many voices shaping Dominican music culture.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'tali-goya';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tali-goya')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Tali Goya is a Dominican artist. Born in 1990 in Santo Domingo, the artist reflects one of the many voices shaping Dominican music culture.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'tali-goya'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
