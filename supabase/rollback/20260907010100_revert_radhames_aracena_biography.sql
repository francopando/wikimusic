BEGIN;

-- Reverts 20260907010100_create_radhames_aracena_biography.sql.
--
-- Radhamés Aracena did not exist in the catalogue before that migration, so undoing
-- it removes the artist row. The editorial documents and their reference rows
-- go with it through the foreign keys.

DELETE FROM artists WHERE slug = 'radhames-aracena';

COMMIT;
