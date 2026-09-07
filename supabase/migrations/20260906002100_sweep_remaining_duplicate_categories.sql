BEGIN;

-- Sweep up every remaining exact-duplicate category.
--
-- 20260906002000 handled the duplicates that needed a judgement -- an accent, a
-- short name against a full one -- and the exact duplicates under the awards
-- that had just been merged. This pass finishes the job generically, for every
-- award in the table.
--
-- Seven groups are left, all of them the same category name recorded twice or
-- more under one award:
--
--   BMI Latin              BMI Icon                     x2
--   Grammy                 Best Tropical Latin Album    x2
--   Grammy                 Best Latin Pop Album         x2
--   Billboard Latin Music  Tropical Album of the Year   x4
--   Premios Casandra       Álbum del Año                x2
--   Premios Casandra       El Soberano                  x3
--   Premios Casandra       Merengue del Año             x2
--
-- Rather than name eleven ids, the rule is written out: within each (award,
-- name) group the category carrying the most artist_awards rows survives, ties
-- broken by the oldest id; every other row in the group has its artist_awards
-- repointed onto the survivor and is then deleted. That is the same rule
-- 20260906002000 applied by hand, and writing it as a rule means it cannot miss
-- a group.
--
-- Note that this creates duplicated artist_awards rows -- Juan Luis Guerra holds
-- El Soberano 1991 and 1992 and Merengue del Año 1991 and 2008 under more than
-- one category id. The migration that follows removes those copies.
--
-- Categories with the same name under DIFFERENT awards are untouched, because
-- "Album of the Year" at the Latin Grammys and at Premio Lo Nuestro are two
-- different things.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

CREATE TEMP TABLE cat_merge ON COMMIT DROP AS
WITH ranked AS (
  SELECT ac.id,
         ac.award_id,
         ac.name,
         (SELECT count(*) FROM artist_awards x WHERE x.category_id = ac.id) AS uses,
         row_number() OVER (
           PARTITION BY ac.award_id, ac.name
           ORDER BY (SELECT count(*) FROM artist_awards x WHERE x.category_id = ac.id) DESC,
                    ac.id ASC) AS rn
    FROM award_categories ac
)
SELECT loser.id AS loser_id, winner.id AS winner_id, loser.name, loser.award_id
  FROM ranked loser
  JOIN ranked winner
    ON winner.award_id = loser.award_id
   AND winner.name     = loser.name
   AND winner.rn       = 1
 WHERE loser.rn > 1;

UPDATE artist_awards x
   SET category_id = m.winner_id, updated_at = now()
  FROM cat_merge m
 WHERE x.category_id = m.loser_id;

DELETE FROM award_categories ac
 USING cat_merge m
 WHERE ac.id = m.loser_id;

COMMIT;
