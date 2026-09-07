BEGIN;

-- Reverts 20260906003300_birth_place_to_spanish.sql.
--
-- Restores each original English or suffixed spelling on exactly the rows that
-- carried it. Keyed by slug rather than by value, because several of the old
-- spellings collapsed onto the same new one and cannot be told apart afterwards.

UPDATE artists SET birth_place = 'New York', updated_at = now()
 WHERE slug IN ('altamira-banda-show', 'amarfis-y-la-banda-de-atakke', 'mark-b', 'mike-el-beta', 'prince-royce');

UPDATE artists SET birth_place = 'New York City', updated_at = now()
 WHERE slug IN ('victor-roque-y-la-gran-manzana');

UPDATE artists SET birth_place = 'New York City, New York, USA', updated_at = now()
 WHERE slug IN ('proyecto-uno');

UPDATE artists SET birth_place = 'The Bronx', updated_at = now()
 WHERE slug IN ('dj-mari-d');

UPDATE artists SET birth_place = 'Long Island, New York', updated_at = now()
 WHERE slug IN ('t-y-s');

UPDATE artists SET birth_place = 'New Jersey, USA', updated_at = now()
 WHERE slug IN ('daniel-santacruz');

UPDATE artists SET birth_place = 'Switzerland', updated_at = now()
 WHERE slug IN ('silvio-mora');

UPDATE artists SET birth_place = 'Santo Domingo, Distrito Nacional', updated_at = now()
 WHERE slug IN ('el-cherry-scom');

COMMIT;
