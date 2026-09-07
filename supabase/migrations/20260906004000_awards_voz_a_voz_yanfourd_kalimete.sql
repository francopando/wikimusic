BEGIN;

-- Load the awards found while writing the Voz a Voz, Yanfourd and Kalimete
-- entries, and add the two categories they need.
--
-- TWO NEW CATEGORIES:
--
--   Premio Lo Nuestro / "Artista Salsa del Año"   -- the renglón Yanfourd was
--       nominated in for the 2015 ceremony. Reported by Correo Cultural
--       (2 December 2014), El Día (3 December 2014), Martí Noticias
--       (13 January 2015), Helda Hoy (14 January 2015), MocaPresente
--       (21 January 2015), Hoy (23 January 2015) and Costa Verde
--       (26 January 2015). The published nominee lists for that year put Marc
--       Anthony, Víctor Manuelle and Salsa Giants in the same category.
--
--   Premios Heat / "Mejor Artista Tropical"       -- Kalimete's 2021
--       nomination, named in the Sueños Records release of 28 April 2021 and
--       in El Caribe, El Nuevo Diario and Más Vip of 29-30 April 2021.
--
-- FIVE ARTIST_AWARDS ROWS, all nominations, none won:
--
--   voz-a-voz  Premios Juventud   2014  "El Mejor Perfume"
--       Category left NULL on purpose. Every source -- El Caribe and La
--       República (4 April 2014), Armario de Noticias (1 April 2014) -- reports
--       the nomination without naming the renglón, and guessing one would put a
--       fabricated value in a column that is allowed to be empty.
--
--   yanfourd   Premio Lo Nuestro  2015  Artista Salsa del Año
--       A 2025 press release says the 2015 nominations were to Premios Juventud
--       and Premios Soberano. Everything published at the time says Premio Lo
--       Nuestro. The contemporaneous reporting is followed; the other two are
--       not recorded.
--
--   kalimete   Premio Lo Nuestro  2014  Artista Tropical del Año
--   kalimete   Premios Heat       2021  Mejor Artista Tropical
--   kalimete   Premios Soberano   2021  Colaboración del Año, "Ella Ya Me Olvidó"
--       The Soberano row uses the existing "Colaboración del Año", which is the
--       official name of the renglón; the press wrote it as "Mejor
--       Colaboración". Confirmed against the published 2021 nominee list
--       (Listín Diario and Diáspora Dominicana, 27-28 April 2021), where the
--       category reads "COLABORACIÓN DEL AÑO 2020" and lists "Ella ya me
--       olvidó, Omega y Kalimete" beside "El Juidero" and "Dame Luz".
--
-- NOT RECORDED HERE: Kalimete's 2022 Emmy. It was won by a Telemundo 47
-- television campaign built on his song, not by a record, and the awards tables
-- carry music-industry awards given to an artist. It stays in the prose, where
-- what actually happened can be described.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO award_categories (id, award_id, name)
VALUES
  ('3a1c4f88-6d21-4b0e-9c7a-5f2e8b41d907',
   'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60', 'Artista Salsa del Año'),
  ('9b7e2d14-8c53-4a6f-b019-27d4ae6c3f85',
   '8cda1620-8b37-487d-9491-0c4108e133a4', 'Mejor Artista Tropical')
ON CONFLICT (award_id, name) DO NOTHING;

INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
VALUES
  ('500a19b6-489a-42f1-9986-f4aa41e07b32',
   '8304c63b-ff51-40ed-80bb-ea7c4079ca6f',
   NULL, 2014, 'El Mejor Perfume', false,
   'El Caribe y Armario de Noticias, abril de 2014'),
  ('969a3c82-6b31-4ea0-878d-8643001ca839',
   'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60',
   '3a1c4f88-6d21-4b0e-9c7a-5f2e8b41d907', 2015, NULL, false,
   'Correo Cultural, El Día, Martí Noticias y Hoy, diciembre de 2014 a enero de 2015'),
  ('9e148524-3310-448e-b1a0-df0093ea2af7',
   'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60',
   '64510423-2d32-4aad-bbff-77b820c3adea', 2014, NULL, false,
   'Sueños Records / MinayaPR, abril de 2023'),
  ('9e148524-3310-448e-b1a0-df0093ea2af7',
   '8cda1620-8b37-487d-9491-0c4108e133a4',
   '9b7e2d14-8c53-4a6f-b019-27d4ae6c3f85', 2021, NULL, false,
   'Sueños Records, 28 de abril de 2021'),
  ('9e148524-3310-448e-b1a0-df0093ea2af7',
   'dec5d9e2-427b-414a-975f-41580488a7fd',
   'b7661f5a-b7e9-4667-a590-d56284151e93', 2021, 'Ella Ya Me Olvidó', false,
   'Listín Diario y Diáspora Dominicana, abril de 2021');

COMMIT;
