BEGIN;

-- Record Rokabanda's Premio Casandra.
--
-- The group took Orquesta Revelación del Año at the Premios Casandra in 1993,
-- its first full season after Kinito Méndez and Bobby Rafael left Pochy y su
-- Cocoband to start it. The award is named in the English Wikipedia article on
-- Kinito Méndez and repeated by Grokipedia and by Dominican music pages; it is
-- the one formal distinction the band is known to have won.
--
-- Both the award (Premios Casandra) and the category (Orquesta Revelacion del
-- Ano) already exist in the reference tables, so nothing new is introduced --
-- this is one row in artist_awards.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
SELECT a.id,
       'ead83dcf-9e2c-4f69-a557-dad604716a5e'::uuid,
       'b3f0d496-d3f4-4e72-af92-5a9e5115c25b'::uuid,
       1993,
       NULL,
       true,
       'Wikipedia (Kinito Méndez), Premios Casandra 1993'
  FROM artists a
 WHERE a.slug = 'rokabanda'
   AND NOT EXISTS (
       SELECT 1 FROM artist_awards x
        WHERE x.artist_id = a.id
          AND x.award_id = 'ead83dcf-9e2c-4f69-a557-dad604716a5e'::uuid
          AND x.category_id = 'b3f0d496-d3f4-4e72-af92-5a9e5115c25b'::uuid
          AND x.year = 1993);

COMMIT;
