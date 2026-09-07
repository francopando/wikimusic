BEGIN;

-- Reverts 20260906010200_rewrite_jhoni_the_voice_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Jhoni the Voice',
       sort_name = 'Jhoni the Voice',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1990-10-22',
       birth_year = 1990,
       date_of_death = NULL,
       birth_place = 'Santiago de los Caballeros',
       province = 'Santiago',
       first_name = 'Jonathan',
       middle_name = NULL,
       last_name = 'Ramos',
       second_last_name = NULL,
       stage_name = 'Jhoni the Voice',
       aliases = ARRAY['Jonathan']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY['voice', 'piano', 'guitar']::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@JhoniTheVoice',
       facebook = 'jhonithevoice',
       instagram = 'jhonithevoice',
       disambiguation = NULL,
       bio_en = 'Jhoni the Voice is an artist whose work is associated with Bachata, Urban, and Tropical. The artist is connected to Nueva York, with work tied to Dominican music culture and its wider audience.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'jhoni-the-voice';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Jhoni the Voice is an artist whose work is associated with Bachata, Urban, and Tropical. The artist is connected to Nueva York, with work tied to Dominican music culture and its wider audience.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'jhoni-the-voice'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
