BEGIN;

-- Reverts 20260906009200_rewrite_delfin_tu_salsero_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Delfín Tu Salsero',
       sort_name = 'Delfín Tu Salsero',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'salsa',
       date_of_birth = '1981-07-24',
       birth_year = 1981,
       date_of_death = NULL,
       birth_place = 'Cotuí',
       province = 'Distrito Nacional',
       first_name = 'Delfin',
       middle_name = 'Antonio',
       last_name = 'Marte',
       second_last_name = 'Acosta',
       stage_name = 'Delfín Tu Salsero',
       aliases = ARRAY['Delfin Salsa']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@delfintusalserooficial',
       facebook = 'DelfinTuSalsero',
       instagram = 'delfintusalseroreal',
       disambiguation = NULL,
       bio_en = 'Delfín Tu Salsero is a Dominican artist whose work is associated with Salsa and Tropical. Born in 1985 in Santo Domingo, the artist reflects one of the many voices shaping Dominican music culture.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'delfin-tu-salsero';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'delfin-tu-salsero')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'delfin-tu-salsero')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Delfín Tu Salsero is a Dominican artist whose work is associated with Salsa and Tropical. Born in 1985 in Santo Domingo, the artist reflects one of the many voices shaping Dominican music culture.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'delfin-tu-salsero'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
