BEGIN;

-- Reverts 20260906010400_rewrite_la_mayeya_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'La Mayeya',
       sort_name = 'La Mayeya',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'folklore',
       date_of_birth = '1983-11-30',
       birth_year = 1983,
       date_of_death = NULL,
       birth_place = 'San Francisco de Macorís',
       province = 'Duarte',
       first_name = 'José',
       middle_name = 'María',
       last_name = 'Disla',
       second_last_name = NULL,
       stage_name = 'La Mayeya',
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@lamayeya',
       facebook = 'lamayeya',
       instagram = 'lamayeya',
       disambiguation = NULL,
       bio_en = 'La Mayeya is a Dominican artist whose work is associated with Folclor and Tropical. Born in 1983 in the Dominican Republic, the artist reflects one of the many voices shaping Dominican music culture.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'la-mayeya';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-mayeya')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-mayeya')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"La Mayeya is a Dominican artist whose work is associated with Folclor and Tropical. Born in 1983 in the Dominican Republic, the artist reflects one of the many voices shaping Dominican music culture.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'la-mayeya'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
