BEGIN;

-- Give Los Mina one spelling and one province.
--
-- Writing Lismar's entry turned up eight artists born in the same barrio and
-- three different ways of writing it, plus one row in the wrong province:
--
--   "Los Mina"                        3 rows   david-kada, la-ross-maria,
--                                              keren-montero
--   "Los Mina, Santo Domingo"         2 rows   x3mo, lapiz-conciente
--   "Los Mina, Santo Domingo Este"    3 rows   kiko-el-crazy, emetede,
--                                              toxic-crow, and now lismar
--
-- WHICH FORM WINS AND WHY. "Los Mina, Santo Domingo Este" is the accurate one.
-- Los Mina is a barrio of the municipality of Santo Domingo Este, which is in
-- Santo Domingo province. "Los Mina, Santo Domingo" names the barrio and then
-- the province rather than the municipality, which is the same error as writing
-- "Santo Domingo, Distrito Nacional" -- already corrected once, in
-- 20260906003300. Bare "Los Mina" is not wrong, only less useful, and the
-- barrio-plus-municipality pair is exactly the shape this column was kept in.
--
-- ONE PROVINCE CORRECTED. toxic-crow carried province "Distrito Nacional"
-- beside a birthplace of "Los Mina, Santo Domingo Este". Los Mina has never
-- been in the Distrito Nacional; the province of Santo Domingo was split off
-- from it in 2001 and Santo Domingo Este went with it. Every other Los Mina
-- artist in the catalogue already reads Santo Domingo.
--
-- This does not touch the prose of any biography. None of the eight entries
-- writes the barrio with a province attached.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists
   SET birth_place = 'Los Mina, Santo Domingo Este',
       updated_at = now()
 WHERE birth_place IN ('Los Mina', 'Los Mina, Santo Domingo');

UPDATE artists
   SET province = 'Santo Domingo',
       updated_at = now()
 WHERE slug = 'toxic-crow'
   AND province = 'Distrito Nacional';

COMMIT;
