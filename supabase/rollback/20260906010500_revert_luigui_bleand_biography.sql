BEGIN;

-- Reverts 20260906010500_rewrite_luigui_bleand_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Luigui Bleand',
       sort_name = 'Bleand, Luigui',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = '1991-02-24',
       birth_year = 1991,
       date_of_death = NULL,
       birth_place = 'Monte Cristi',
       province = 'Monte Cristi',
       first_name = 'Luigui',
       middle_name = NULL,
       last_name = 'Bleand',
       second_last_name = NULL,
       stage_name = 'Luigui Bleand',
       aliases = ARRAY[]::text[],
       occupations = '["producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'www.luiguibleand.com/',
       youtube = '@LuiguiBleand',
       facebook = 'luiguibleand',
       instagram = 'luiguibleand',
       disambiguation = NULL,
       bio_en = 'Luigui Bleand is a Dominican artist whose work is associated with Urban, Afrobeat, and Tropical. Born in 1991 in Monte Cristi, the artist reflects one of the many voices shaping Dominican music culture.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'luigui-bleand';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luigui Bleand is a Dominican artist whose work is associated with Urban, Afrobeat, and Tropical. Born in 1991 in Monte Cristi, the artist reflects one of the many voices shaping Dominican music culture.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'luigui-bleand'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
