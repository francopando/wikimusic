BEGIN;

-- Reverts 20260906003900_rewrite_kilvin_pena_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Kilvin Peña',
       sort_name = 'Peña, Kilvin',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'jazz',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Kilvin',
       middle_name = NULL,
       last_name = 'Peña',
       second_last_name = NULL,
       stage_name = 'Kilvin Peña',
       aliases = ARRAY[]::text[],
       occupations = '["musician"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['salsa']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = 'kilvinp',
       instagram = 'kilvinp',
       disambiguation = NULL,
       bio_en = 'Kilvin Peña is a Dominican artist whose work is associated with Merengue, Salsa, and Tropical. The artist is connected to the Dominican Republic, with work tied to Dominican music culture and its wider audience.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'kilvin-pena';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kilvin-pena')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kilvin Peña is a Dominican artist whose work is associated with Merengue, Salsa, and Tropical. The artist is connected to the Dominican Republic, with work tied to Dominican music culture and its wider audience.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'kilvin-pena'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
