BEGIN;

-- Reverts 20260906009400_rewrite_deyvi_sime_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Deyvi Simé',
       sort_name = 'Simé, Deyvi',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'composer',
       primary_genre = 'bachata',
       date_of_birth = '1986-10-08',
       birth_year = 1986,
       date_of_death = NULL,
       birth_place = 'Santiago',
       province = 'Santiago',
       first_name = 'Deyvi',
       middle_name = NULL,
       last_name = 'Simé',
       second_last_name = NULL,
       stage_name = 'Deyvi Simé',
       aliases = ARRAY[]::text[],
       occupations = '["musician"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['jazz']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@DeyviSiméOficial',
       facebook = 'simeoficial',
       instagram = 'deyvi.sime',
       disambiguation = NULL,
       bio_en = 'Deyvi Simé is a Dominican artist whose work is associated with Merengue Tipico, Jazz Latino, and Tropical. Born in 1988 in Santiago, the artist reflects one of the many voices shaping Dominican music culture.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'deyvi-sime';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Deyvi Simé is a Dominican artist whose work is associated with Merengue Tipico, Jazz Latino, and Tropical. Born in 1988 in Santiago, the artist reflects one of the many voices shaping Dominican music culture.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'deyvi-sime'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
