BEGIN;

-- Reverts 20260906010300_rewrite_jhonny_evidence_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Jhonny Evidence',
       sort_name = 'Evidence, Jhonny',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1987-01-14',
       birth_year = 1987,
       date_of_death = NULL,
       birth_place = 'Salvaleón de Higüey',
       province = 'La Altagracia',
       first_name = 'Jhonny',
       middle_name = NULL,
       last_name = 'Evidence',
       second_last_name = NULL,
       stage_name = 'Jhonny Evidence',
       aliases = ARRAY[]::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@jhonnyevidence',
       facebook = 'bachata.time.5',
       instagram = 'jhonnyevidenceofficial',
       disambiguation = NULL,
       bio_en = 'Jhonny Evidence is a Dominican artist whose work is associated with Bachata and Tropical. Born in 1987 in Santo Domingo, the artist reflects one of the many voices shaping Dominican music culture.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'jhonny-evidence';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhonny-evidence')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhonny-evidence')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Jhonny Evidence is a Dominican artist whose work is associated with Bachata and Tropical. Born in 1987 in Santo Domingo, the artist reflects one of the many voices shaping Dominican music culture.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'jhonny-evidence'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
