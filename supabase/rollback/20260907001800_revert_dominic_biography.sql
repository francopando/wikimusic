BEGIN;

-- Reverts 20260907001800_rewrite_dominic_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Dominic',
       sort_name = 'Dominic',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'salsa',
       date_of_birth = NULL,
       birth_year = 1975,
       date_of_death = '2020-08-15',
       birth_place = 'Mayagüez',
       province = 'Nacido en el Exterior',
       first_name = 'Domingo',
       middle_name = 'Isaías',
       last_name = 'Díaz',
       second_last_name = NULL,
       stage_name = 'Dominic',
       aliases = ARRAY['La Voz Sublime De La Salsa']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = NULL,
       bio_en = 'Dominic (born Domingo Isaías Díaz) was a prominent tropical and romantic salsa artist whose music deeply resonated with the contemporary mainstream of Caribbean popular music for a younger generation during the late 1990s and early 2000s. While he was born in 1975 in Mayagüez, Puerto Rico, his family relocated to Santo Domingo, Dominican Republic, when he was just three years old.

Raised in the popular neighborhood of Villa Consuelo, Dominic always openly stated in promotional interviews that he felt entirely Dominican at heart, a profound cultural identity that ultimately inspired his artistic name.Growing up in Santo Domingo during a golden era for Dominican musical expression, Dominic developed within an environment rich in local folklore and vibrant international influences. However, instead of pursuing local genres like merengue or bachata, he drew inspiration from those traditions to forge a distinct space within the salsa romántica scene.

After migrating to New York City in the mid-1990s, he successfully blended the raw emotion and romantic intimacy of Caribbean storytelling with high-caliber Latin urban production.

Dominic achieved massive commercial success and critical acclaim with his iconic 1998 studio album Niégalo Todo, released under Sky Records. The title track became a timeless anthem across tropical radio stations, solidifying his reputation as "La Voz Sublime de la Salsa." He followed this triumph with his sophomore album, Mi Gran Sueño, in October 2000. Through these productions, Dominic bridged the gap between traditional tropical arrangements and a broader, modern Latin appeal.

His promising career was cut short when he tragically passed away on August 15, 2020, in New York at the age of 45, yet his musical legacy continues to be celebrated by salsa enthusiasts worldwide.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'dominic';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dominic')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dominic')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dominic (born Domingo Isaías Díaz) was a prominent tropical and romantic salsa artist whose music deeply resonated with the contemporary mainstream of Caribbean popular music for a younger generation during the late 1990s and early 2000s. While he was born in 1975 in Mayagüez, Puerto Rico, his family relocated to Santo Domingo, Dominican Republic, when he was just three years old.","type":"text"}]},{"type":"paragraph","content":[{"text":"Raised in the popular neighborhood of Villa Consuelo, Dominic always openly stated in promotional interviews that he felt entirely Dominican at heart, a profound cultural identity that ultimately inspired his artistic name.Growing up in Santo Domingo during a golden era for Dominican musical expression, Dominic developed within an environment rich in local folklore and vibrant international influences. However, instead of pursuing local genres like merengue or bachata, he drew inspiration from those traditions to forge a distinct space within the salsa romántica scene.","type":"text"}]},{"type":"paragraph","content":[{"text":"After migrating to New York City in the mid-1990s, he successfully blended the raw emotion and romantic intimacy of Caribbean storytelling with high-caliber Latin urban production.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominic achieved massive commercial success and critical acclaim with his iconic 1998 studio album Niégalo Todo, released under Sky Records. The title track became a timeless anthem across tropical radio stations, solidifying his reputation as \"La Voz Sublime de la Salsa.\" He followed this triumph with his sophomore album, Mi Gran Sueño, in October 2000. Through these productions, Dominic bridged the gap between traditional tropical arrangements and a broader, modern Latin appeal.","type":"text"}]},{"type":"paragraph","content":[{"text":"His promising career was cut short when he tragically passed away on August 15, 2020, in New York at the age of 45, yet his musical legacy continues to be celebrated by salsa enthusiasts worldwide.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dominic'), 2)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
