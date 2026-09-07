BEGIN;

-- Reverts 20260907011000_create_rafael_encarnacion_biography.sql.
--
-- Rafael Encarnación did not exist in the catalogue before that migration, so undoing
-- it removes the artist row. The editorial documents and their reference rows
-- go with it through the foreign keys.

DELETE FROM artists WHERE slug = 'rafael-encarnacion';

COMMIT;
