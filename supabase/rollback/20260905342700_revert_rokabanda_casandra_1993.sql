BEGIN;

-- Reverts 20260905342700_rokabanda_casandra_1993.sql.
--
-- Removes the single artist_awards row. The award and category reference rows
-- predate that migration and are left alone.

DELETE FROM artist_awards
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'rokabanda')
   AND award_id = 'ead83dcf-9e2c-4f69-a557-dad604716a5e'::uuid
   AND category_id = 'b3f0d496-d3f4-4e72-af92-5a9e5115c25b'::uuid
   AND year = 1993;

COMMIT;
