BEGIN;

-- Reverts 20260906002300_fix_puyalo_pantera_award_category.sql, returning the
-- row to the Premios Juventud category it wrongly used and removing the new
-- Lo Nuestro one.

UPDATE artist_awards
   SET category_id = 'd7ec9884-2cdc-4b77-b794-1f7e88aa3cf7'::uuid,
       updated_at = now()
 WHERE category_id = '56e93427-0c55-4eb6-b539-43e981a3f3cf'::uuid;

DELETE FROM award_categories WHERE id = '56e93427-0c55-4eb6-b539-43e981a3f3cf'::uuid;

COMMIT;
