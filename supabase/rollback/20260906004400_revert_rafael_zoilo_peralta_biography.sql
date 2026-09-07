BEGIN;

-- Reverts 20260906004400_rewrite_rafael_zoilo_peralta_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Rafael Zoilo Peralta',
       sort_name = NULL,
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'musician',
       primary_genre = 'merengue-perico-ripiao',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Rafael',
       middle_name = 'Zoilo',
       last_name = 'Peralta',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY['bass']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = NULL,
       bio_en = 'Rafael Zoilo Peralta is a Dominican artist. The artist is connected to Santo Domingo, with work tied to Dominican music culture and its wider audience.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'rafael-zoilo-peralta';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rafael Zoilo Peralta is a Dominican artist. The artist is connected to Santo Domingo, with work tied to Dominican music culture and its wider audience.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
