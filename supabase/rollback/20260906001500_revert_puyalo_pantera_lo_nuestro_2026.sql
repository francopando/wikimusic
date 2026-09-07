BEGIN;

-- Reverts 20260906001500_puyalo_pantera_lo_nuestro_2026.sql.
--
-- Removes the single nomination row. The award and category reference rows
-- predate that migration and are left alone.

DELETE FROM artist_awards
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera')
   AND award_id = 'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid
   AND category_id = 'd7ec9884-2cdc-4b77-b794-1f7e88aa3cf7'::uuid
   AND year = 2026;

COMMIT;
