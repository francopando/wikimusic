BEGIN;

-- Put the foreign birthplaces into Spanish and strip the country and state
-- suffixes off them.
--
-- The column was recording the same city four different ways -- "New York",
-- "New York City", "New York City, New York, USA" and "Nueva York" -- and mixed
-- languages besides, with "Haití" and "Puerto Príncipe" sitting next to
-- "Switzerland" and "New Jersey, USA".
--
--   New York                        (4)  -> Nueva York
--   New York City                   (1)  -> Nueva York
--   New York City, New York, USA    (1)  -> Nueva York
--   The Bronx                       (1)  -> El Bronx
--   Long Island, New York           (1)  -> Long Island, Nueva York
--   New Jersey, USA                 (1)  -> Nueva Jersey
--   Switzerland                     (1)  -> Suiza
--   Santo Domingo, Distrito Nacional (1) -> Santo Domingo
--
-- WHAT IS DELIBERATELY NOT TOUCHED. Commas are not the problem and are not
-- removed. Most of them are "barrio, ciudad" pairs -- "Los Mina, Santo
-- Domingo", "Las Cañitas, Santo Domingo Norte", "Canca Arriba, Tamboril",
-- "Villa La Mata, Cotuí" -- and they are the most useful values in the column,
-- because they say exactly where somebody is from. The rule being applied is
-- narrower: drop the country or the state when it is only repeating what the
-- province column already carries, and write the place in Spanish.
--
-- "Santo Domingo, Distrito Nacional" is the one Dominican value that goes,
-- because it is a city followed by its own province rather than a barrio
-- followed by its city, and the province column beside it already says Distrito
-- Nacional.
--
-- El Bronx keeps the borough rather than being flattened to Nueva York. For a
-- Dominican catalogue the borough is the specific fact, not a detail.
--
-- Left alone as already correct: Haití, Puerto Príncipe, Mayagüez, Miami,
-- Nueva York, and the two rows reading "Puerto Rico" where no city is known.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists SET birth_place = 'Nueva York', updated_at = now()
 WHERE birth_place IN ('New York', 'New York City', 'New York City, New York, USA');

UPDATE artists SET birth_place = 'El Bronx', updated_at = now()
 WHERE birth_place = 'The Bronx';

UPDATE artists SET birth_place = 'Long Island, Nueva York', updated_at = now()
 WHERE birth_place = 'Long Island, New York';

UPDATE artists SET birth_place = 'Nueva Jersey', updated_at = now()
 WHERE birth_place = 'New Jersey, USA';

UPDATE artists SET birth_place = 'Suiza', updated_at = now()
 WHERE birth_place = 'Switzerland';

UPDATE artists SET birth_place = 'Santo Domingo', updated_at = now()
 WHERE birth_place = 'Santo Domingo, Distrito Nacional';

COMMIT;
