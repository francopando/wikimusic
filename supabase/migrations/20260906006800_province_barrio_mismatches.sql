BEGIN;

-- Make the province agree with the barrio already stored beside it.
--
-- Five entries written today needed the same correction -- Kiko el Crazy, Inka,
-- Lismar, Toxic Crow and El Fecho RD all carried "Distrito Nacional" next to a
-- barrio that is not in the Distrito Nacional -- so the whole table was swept
-- for the pattern instead of fixing it one entry at a time. Six more rows have
-- it, in both directions.
--
-- THE CONVENTION BEING APPLIED. The province column names the province the
-- place is in *today*. The province of Santo Domingo was carved out of the
-- Distrito Nacional in 2001, so a barrio in Santo Domingo Este, Norte or Oeste
-- reads Santo Domingo even for somebody born before the split. This is the same
-- rule already used for Rafael Petitón Guzmán, born in Salcedo in 1894 and
-- filed under Hermanas Mirabal, which is what that province is called now.
--
-- FOUR ROWS MOVE TO SANTO DOMINGO:
--
--   shadow-blow    "Santo Domingo Este"              -- names the municipality
--   tokischa       "Los Frailes, Santo Domingo Este" -- Los Frailes is in SDE
--   wason-brazoban "Villa Mella"                     -- Santo Domingo Norte
--   shelow-shaq    "Herrera"                         -- Santo Domingo Oeste
--
-- TWO ROWS MOVE TO DISTRITO NACIONAL:
--
--   jose-alberto-el-canario  "Villa Consuelo" -- a barrio of the DN. Confirmed
--        against English Wikipedia and several Dominican accounts, all of which
--        give "Villa Consuelo, Santo Domingo, 22 de diciembre de 1958".
--   sexappeal                "Villa Juana"    -- also a barrio of the DN
--
-- ONE ROW DELIBERATELY LEFT ALONE. nico-clinico reads "Ensanche Altagracia,
-- Herrera" with province Santo Domingo, and that is already right: Herrera is
-- in Santo Domingo Oeste. It came up in the sweep only because the search
-- pattern matched the word Ensanche.
--
-- Nothing here touches birth_place, and no biography prose names a province, so
-- no entry needs rewriting.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists SET province = 'Santo Domingo', updated_at = now()
 WHERE slug IN ('shadow-blow', 'tokischa', 'wason-brazoban', 'shelow-shaq')
   AND province = 'Distrito Nacional';

UPDATE artists SET province = 'Distrito Nacional', updated_at = now()
 WHERE slug IN ('jose-alberto-el-canario', 'sexappeal')
   AND province = 'Santo Domingo';

COMMIT;
