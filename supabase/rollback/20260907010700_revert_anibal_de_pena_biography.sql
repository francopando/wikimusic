BEGIN;

-- Reverts 20260907010700_create_anibal_de_pena_biography.sql.
--
-- Aníbal de Peña did not exist in the catalogue before that migration, so undoing
-- it removes the artist row. The editorial documents and their reference rows
-- go with it through the foreign keys.

DELETE FROM artists WHERE slug = 'anibal-de-pena';

COMMIT;
