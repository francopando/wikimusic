BEGIN;

-- Corrects a defect introduced by 20260906008800 earlier today.
--
-- That migration set kiko-rodriguez.genres to
-- {bachata-romantica,bachata-moderna}. Both slugs exist in the genres table
-- and BOTH ARE INACTIVE, so neither renders and neither is a valid facet. The
-- slugs were taken from a query that listed the bachata genres without reading
-- the `active` column.
--
-- There is no active bachata subgenre to put in their place: bachata-tradicional
-- is inactive as well, and the array must not repeat primary_genre, which is
-- already `bachata`. So the array goes back to empty -- which is also what every
-- other bachatero of his cohort carries: zacarias-ferreira, frank-reyes,
-- raulin-rodriguez, joe-veras and el-chaval-de-la-bachata all have an empty
-- genres array for exactly this reason.
--
-- Swept the whole table at the same time: no other artist carries an inactive
-- genre slug, no artist carries a genre slug missing from the genres table, and
-- no artist has an inactive primary_genre. This row was the only one.
--
-- Nothing else about the entry changes. The biography, the awards row and every
-- other field written today stand.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists
   SET genres = '{}'::text[], updated_at = now()
 WHERE slug = 'kiko-rodriguez';

COMMIT;
