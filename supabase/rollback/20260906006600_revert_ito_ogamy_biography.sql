BEGIN;

-- Reverts 20260906006600_rewrite_ito_ogamy_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Ito Ogamy',
       sort_name = 'Ogamy, Ito',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Francisco',
       middle_name = 'Antonio',
       last_name = 'Perez',
       second_last_name = NULL,
       stage_name = 'Ito Ogamy',
       aliases = ARRAY[]::text[],
       occupations = '["musician"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@ItoOgamySDC',
       facebook = 'ito.ogamy',
       instagram = 'ito_ogamy_809',
       disambiguation = NULL,
       bio_en = 'Ito Gamy is a Dominican artist whose work is associated with Bachata and Tropical. The artist is connected to Santo Domingo, with work tied to Dominican music culture and its wider audience.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'ito-ogamy';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ito Gamy is a Dominican artist whose work is associated with Bachata and Tropical. The artist is connected to Santo Domingo, with work tied to Dominican music culture and its wider audience.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'ito-ogamy'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
