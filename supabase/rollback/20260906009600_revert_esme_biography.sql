BEGIN;

-- Reverts 20260906009600_rewrite_esme_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Esme',
       sort_name = 'Esme',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1994-06-24',
       birth_year = 1994,
       date_of_death = NULL,
       birth_place = 'Constanza',
       province = 'La Vega',
       first_name = 'Elmer',
       middle_name = NULL,
       last_name = 'Abreu',
       second_last_name = 'Suriel',
       stage_name = 'Esme',
       aliases = ARRAY['Elmer Abreu Suriel']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@EstyleKiDo',
       facebook = 'esmemusica',
       instagram = 'esmeoficial',
       disambiguation = NULL,
       bio_en = 'Esme is an artist whose work is associated with Bachata, Tropical, and Pop Latino. Born in 1993 in Constanza, the artist reflects one of the many voices shaping Dominican music culture.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'esme';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'esme')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'esme')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Esme is an artist whose work is associated with Bachata, Tropical, and Pop Latino. Born in 1993 in Constanza, the artist reflects one of the many voices shaping Dominican music culture.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'esme'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
