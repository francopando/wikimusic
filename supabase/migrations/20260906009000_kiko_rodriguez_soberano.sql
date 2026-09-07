BEGIN;

-- Kiko Rodríguez's Soberano.
--
--   kiko-rodriguez  Premios Soberano  2021  Bachata del Año
--                   "El Beso Que No Le Di"  won
--
-- THREE SOURCES DATED THIS THREE DIFFERENT WAYS AND ALL THREE ARE DESCRIBING
-- ONE STATUETTE. Bachata Republic calls it "Premios Soberano 2020". AlDedillo
-- calls it "Premios Soberano 2021". Listín Diario, on 5 July 2021, calls it
-- "el premio Soberano a Mejor Bachata del Año 2019".
--
-- The complete winners' list published by N Digital on 16 June 2021 resolves
-- it. That edition premiered "lo mejor de los años 2019 y 2020" in a single
-- gala held on 15 June 2021, because no ceremony took place in 2020, and its
-- categories are grouped under two headings per renglón. Under RENGLÓN POPULAR
-- 2019:
--
--   BACHATA DEL AÑO -- El beso que no le di -- GANADOR
--   Romeo Santos ft. Kiko Rodríguez -- Comp.: Romeo Santos
--
-- So the renglón is 2019 and the ceremony is 2021. The row is filed under the
-- ceremony year, which is the convention every other Premios Soberano row in
-- this table already follows -- Kalimete's 2021 nomination and Eddy Herrera's
-- 2021 album win were both loaded that way. The renglón is recorded in the
-- source field so the distinction is not lost.
--
-- The award and the category both already exist. Nothing new is created.
--
-- ROMEO SANTOS IS NOT GIVEN A ROW. He is the other half of the credit and the
-- composer of the song, and he has no entry in this catalogue at all, which is
-- a gap on its own. When he is written, this award belongs on his record too.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
VALUES
  ((SELECT id FROM artists WHERE slug = 'kiko-rodriguez'),
   'dec5d9e2-427b-414a-975f-41580488a7fd',
   '3ba3ced3-dcbf-4436-8356-5f9f41f1546e', 2021, 'El Beso Que No Le Di', true,
   'Renglón Popular 2019, gala del 15 de junio de 2021; lista completa de ganadores, N Digital, 16 de junio de 2021');

COMMIT;
