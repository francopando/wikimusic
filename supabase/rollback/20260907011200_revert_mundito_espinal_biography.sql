BEGIN;

-- Reverts 20260907011200_create_mundito_espinal_biography.sql.
--
-- Mundito Espinal did not exist in the catalogue before that migration, so undoing
-- it removes the artist row. The editorial documents and their reference rows
-- go with it through the foreign keys.

DELETE FROM artists WHERE slug = 'mundito-espinal';

COMMIT;
