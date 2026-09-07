BEGIN;

-- Reverts 20260907010400_create_pedro_samuel_rodriguez_biography.sql.
--
-- Pedro Samuel Rodríguez did not exist in the catalogue before that migration, so undoing
-- it removes the artist row. The editorial documents and their reference rows
-- go with it through the foreign keys.

DELETE FROM artists WHERE slug = 'pedro-samuel-rodriguez';

COMMIT;
