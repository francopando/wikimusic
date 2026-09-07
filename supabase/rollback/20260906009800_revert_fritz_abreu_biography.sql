BEGIN;

-- Reverts 20260906009800_rewrite_fritz_abreu_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Fritz Abreu',
       sort_name = 'Abreu, Fritz',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'fusion-tropical',
       date_of_birth = '1982-01-25',
       birth_year = 1982,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Fritz',
       middle_name = NULL,
       last_name = 'Abreu',
       second_last_name = NULL,
       stage_name = 'Fritz Abreu',
       aliases = ARRAY[]::text[],
       occupations = '["musician"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['fusion']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@FritzAbreu',
       facebook = '61557577526118',
       instagram = 'fritzabreumusic',
       disambiguation = NULL,
       bio_en = 'Fritz Abreu is a Dominican artist whose work is associated with Jazz Latino, Fusion, and Tropical. The artist is connected to Santo Domingo, with work tied to Dominican music culture and its wider audience.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'fritz-abreu';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fritz-abreu')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fritz-abreu')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Fritz Abreu is a Dominican artist whose work is associated with Jazz Latino, Fusion, and Tropical. The artist is connected to Santo Domingo, with work tied to Dominican music culture and its wider audience.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'fritz-abreu'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
