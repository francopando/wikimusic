BEGIN;

-- Reverts 20260905342000_rewrite_jose_manuel_calderon_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'José Manuel Calderón',
       sort_name = 'Calderón, José Manuel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1941-08-09',
       birth_year = 1941,
       date_of_death = NULL,
       birth_place = 'El Seibo',
       province = 'El Seibo',
       first_name = 'José',
       middle_name = 'Manuel',
       last_name = 'Calderón',
       second_last_name = NULL,
       stage_name = 'José Manuel Calderón',
       aliases = ARRAY['El Pionero de la Bachata']::text[],
       occupations = '["composer","musician"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['bolero']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = '@CalderonBachata',
       facebook = '100063809615923',
       instagram = NULL,
       disambiguation = NULL,
       bio_en = 'José Manuel Calderón holds a place of unique historical importance in Dominican music as one of the very first artists to record bachata. Born in 1941 in Santo Domingo, he was part of the generation that gave shape to what would eventually become one of the most globally beloved music genres to emerge from the Caribbean.

In the late 1950s and 1960s, when bachata was still a nameless, stigmatized music played in the margins of Dominican society — in small cantinas and working-class neighborhoods — Calderón was among those recording its earliest documented examples. His recordings, which drew on bolero and Cuban guitar traditions, helped define the sonic template that later bachata artists would build upon.

The genre he helped pioneer would go on to conquer the world, championed in later decades by artists like Juan Luis Guerra and Romeo Santos, but Calderón''s foundational role is acknowledged by historians and musicians who understand that every great tradition has its unsung originators. He is celebrated today as a patriarch of bachata and a crucial link to the genre''s humble, authentic beginnings.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'jose-manuel-calderon';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"José Manuel Calderón holds a place of unique historical importance in Dominican music as one of the very first artists to record bachata. Born in 1941 in Santo Domingo, he was part of the generation that gave shape to what would eventually become one of the most globally beloved music genres to emerge from the Caribbean.","type":"text"}]},{"type":"paragraph","content":[{"text":"In the late 1950s and 1960s, when bachata was still a nameless, stigmatized music played in the margins of Dominican society — in small cantinas and working-class neighborhoods — Calderón was among those recording its earliest documented examples. His recordings, which drew on bolero and Cuban guitar traditions, helped define the sonic template that later bachata artists would build upon.","type":"text"}]},{"type":"paragraph","content":[{"text":"The genre he helped pioneer would go on to conquer the world, championed in later decades by artists like Juan Luis Guerra and Romeo Santos, but Calderón''s foundational role is acknowledged by historians and musicians who understand that every great tradition has its unsung originators. He is celebrated today as a patriarch of bachata and a crucial link to the genre''s humble, authentic beginnings.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
