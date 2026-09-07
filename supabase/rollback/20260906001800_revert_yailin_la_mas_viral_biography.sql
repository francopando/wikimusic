BEGIN;

-- Reverts 20260906001800_create_yailin_la_mas_viral_biography.sql.
--
-- Yailin La Más Viral did not exist in the catalogue before that migration, so undoing
-- it removes the artist row. The editorial documents and their reference rows
-- go with it through the foreign keys.

DELETE FROM artists WHERE slug = 'yailin-la-mas-viral';

COMMIT;
