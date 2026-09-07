BEGIN;

-- Reverts 20260905341200_rewrite_n_o_r_m_a_l_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'N O R M a L',
       sort_name = 'N O R M a L',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'dj',
       primary_genre = NULL,
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = 'No Province',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'N O R M a L',
       aliases = ARRAY['N O R M a L']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = 'https://www.youtube.com/channel/UCb8ICkBRCEJOxl5jGSStSOQ',
       facebook = NULL,
       instagram = 'normalrd',
       disambiguation = NULL,
       bio_en = 'N O R M a L is a Dominican artist. The artist is documented through recordings and credits connected to Dominican music culture.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'n-o-r-m-a-l';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'n-o-r-m-a-l')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'n-o-r-m-a-l')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"N O R M a L is a Dominican artist. The artist is documented through recordings and credits connected to Dominican music culture.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'n-o-r-m-a-l'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
