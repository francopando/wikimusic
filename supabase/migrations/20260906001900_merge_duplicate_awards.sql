BEGIN;

-- Collapse the duplicate rows in `awards`.
--
-- The table held the same award under several ids, created on different days as
-- separate research passes added rows without checking for an existing one:
--
--   Latin Grammy      1d8267d6-…  2026-05-26  17 categories  36 rows   KEEP
--                     8a6048b0-…  2026-08-02   1 category     1 row    merge
--
--   Premios Soberano  dec5d9e2-…  2026-05-26  14 categories  15 rows   KEEP
--                     4dda4da0-…  2026-08-02   3 categories   3 rows   merge
--                     a25812b4-…  2026-08-05   1 category     1 row    merge
--                     fd9277a2-…  2026-08-06   0 categories   0 rows   delete
--
-- The oldest and most used id wins in each case. This migration only merges
-- awards; the duplicate categories that result are handled by the migration
-- that follows it.
--
-- ORDER MATTERS. `award_categories.award_id` is ON DELETE CASCADE from `awards`
-- while `artist_awards.category_id` is NO ACTION, so deleting an award before
-- moving its categories would take the categories with it and orphan the rows
-- that point at them. Categories move first, then artist_awards, then the award
-- row goes.
--
-- No artist_awards row changes its category here, and none is created or
-- destroyed: only the award_id column changes.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

-- Latin Grammy ---------------------------------------------------------------
UPDATE award_categories SET award_id = '1d8267d6-ad99-4ca6-8425-1315545ad86e'::uuid
 WHERE award_id = '8a6048b0-6324-48fe-9d10-011b9bbb5449'::uuid;
UPDATE artist_awards SET award_id = '1d8267d6-ad99-4ca6-8425-1315545ad86e'::uuid, updated_at = now()
 WHERE award_id = '8a6048b0-6324-48fe-9d10-011b9bbb5449'::uuid;
DELETE FROM awards WHERE id = '8a6048b0-6324-48fe-9d10-011b9bbb5449'::uuid;

-- Premios Soberano -----------------------------------------------------------
UPDATE award_categories SET award_id = 'dec5d9e2-427b-414a-975f-41580488a7fd'::uuid
 WHERE award_id IN ('4dda4da0-c769-499a-b24f-2a8999f5a9f0'::uuid,
                    'a25812b4-ef8b-435f-a745-316bf040932d'::uuid);
UPDATE artist_awards SET award_id = 'dec5d9e2-427b-414a-975f-41580488a7fd'::uuid, updated_at = now()
 WHERE award_id IN ('4dda4da0-c769-499a-b24f-2a8999f5a9f0'::uuid,
                    'a25812b4-ef8b-435f-a745-316bf040932d'::uuid);
DELETE FROM awards WHERE id IN ('4dda4da0-c769-499a-b24f-2a8999f5a9f0'::uuid,
                                'a25812b4-ef8b-435f-a745-316bf040932d'::uuid,
                                'fd9277a2-f23e-4885-950b-db8f16feffdc'::uuid);

COMMIT;
