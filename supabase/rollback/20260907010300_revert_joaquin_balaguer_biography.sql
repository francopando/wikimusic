BEGIN;

-- Reverts 20260907010300_create_joaquin_balaguer_biography.sql.
--
-- Joaquín Balaguer did not exist in the catalogue before that migration, so undoing
-- it removes the artist row. The editorial documents and their reference rows
-- go with it through the foreign keys.

DELETE FROM artists WHERE slug = 'joaquin-balaguer';

COMMIT;
