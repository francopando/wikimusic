BEGIN;

-- Reverts 20260906010100_rewrite_haraca_kiko_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Haraca Kiko',
       sort_name = 'Haraca Kiko',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = '1989-07-08',
       birth_year = 1989,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Gary',
       middle_name = 'Alexander',
       last_name = 'Reyes',
       second_last_name = 'Aquino',
       stage_name = 'Haraca Kiko',
       aliases = ARRAY['Dhany Daniel Jorge']::text[],
       occupations = '["actor","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-dembow']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@haracakiko',
       facebook = 'haracakikooficial',
       instagram = 'haracakikoo',
       disambiguation = NULL,
       bio_en = 'Haraca Kiko is a Dominican artist whose work is associated with Dembow and Urban. The artist is connected to Santo Domingo, with work tied to Dominican music culture and its wider audience.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'haraca-kiko';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Haraca Kiko is a Dominican artist whose work is associated with Dembow and Urban. The artist is connected to Santo Domingo, with work tied to Dominican music culture and its wider audience.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'haraca-kiko'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
