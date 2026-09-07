BEGIN;

-- Remove duplicated artist_awards rows.
--
-- Juan Luis Guerra's award history was imported twice, about four minutes
-- apart on 2026-05-26, and the two passes differ only in how they word the
-- source -- "Historial oficial ACROARTE" against "Historial ACROARTE". That
-- left nineteen identical pairs across Premios Soberano, the Latin Grammys, the
-- Grammys, Premio Lo Nuestro and BMI. The migration before this one adds a
-- twentieth, by merging the two Excelencia categories he held a 2007 row in
-- each of.
--
-- The rule is exact: rows are grouped by artist, award, category, year, work
-- and won, and only the oldest row in each group survives. Grouping on `work`
-- is what makes this safe. Natti Natasha has two rows in ASCAP's Winning Songs
-- for 2020 -- "Me Gusta" and "No Lo Trates" -- which are two different songs in
-- one category in one year, and they are correctly left alone.
--
-- Nothing outside Juan Luis Guerra's record is touched.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

DELETE FROM artist_awards x
 USING artist_awards keep
 WHERE x.artist_id   = keep.artist_id
   AND x.award_id    = keep.award_id
   AND x.category_id = keep.category_id
   AND x.year IS NOT DISTINCT FROM keep.year
   AND x.work IS NOT DISTINCT FROM keep.work
   AND x.won  IS NOT DISTINCT FROM keep.won
   AND (x.created_at, x.id) > (keep.created_at, keep.id);

COMMIT;
