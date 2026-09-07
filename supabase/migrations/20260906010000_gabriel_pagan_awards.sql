BEGIN;

-- Gabriel Pagán's awards: one Latin Grammy nomination and two Soberanos.
--
-- He had no rows at all. He is a Latin Grammy nominee and a two-time Soberano
-- winner, and the reason the record was empty is that for years he was billed
-- under a single name -- "Gabriel", with no surname. Every winners' list from
-- that period credits him that way, which is also why the aliases {Gabriel,
-- Gabriel Music} sit on his row.
--
-- =========================================================================
-- 1. LATIN GRAMMY 2017 -- MEJOR ÁLBUM DE FUSIÓN TROPICAL -- nominated
--
--    Listín Diario, 27 September 2017, "Once dominicanos son nominados al Latin
--    Grammy": «Gabriel "Contra la corriente" obtuvo una mención como Mejor
--    Álbum de Fusión Tropical, en el que figura junto a "Coletera", Coletro;
--    "Porrock"...». That is the newspaper reporting the nominations on the day
--    they were published, naming the real category.
--
--    HIS OWN CHANNEL AND LATER PRESS GET THE CATEGORY WRONG. Both call it
--    "Álbum Tropical del Año", which is not a Latin Grammy category at all --
--    it belongs to the Billboard Latin Music Awards. The category recorded here
--    is the one the contemporaneous report names.
--
--    The category "Mejor Álbum de Fusión Tropical" does not exist yet and is
--    created under award 1d8267d6 (Latin Grammy), which carries 29 of the
--    catalogue's 31 Latin Grammy rows. The duplicate award row "Premios Latin
--    Grammy" (ef51dad4, 2 rows) is NOT used; the two awards being duplicates of
--    each other is a data-hygiene problem for a separate pass.
--
-- =========================================================================
-- 2. PREMIOS SOBERANO 2018 -- ÁLBUM DEL AÑO -- "Contra la corriente" -- won
--
--    Five outlets published the winners' list of the 2018 gala and all five
--    credit the album to "Gabriel": Listín Diario (21 March 2018, "Álbum del
--    año: 'Contra la corriente' de Gabriel"), CDN, Teleradio América, El
--    Informante and El Sol de Santiago.
--
--    There is no "Álbum del Año" category under Premios Soberano -- the only
--    ones in the table sit under Premios Casandra, which is the award's
--    pre-2011 name and a separate awards row here. In 2018 the award was called
--    Soberano, so the category is created under Premios Soberano.
--
-- =========================================================================
-- 3. PREMIOS SOBERANO 2021 -- ESPECTÁCULO DEL AÑO -- "Morisoñando" -- won
--
--    Renglón Popular 2019, awarded at the gala of 15 June 2021 -- the same
--    double edition that carried Kiko Rodríguez's bachata, loaded in
--    20260906009000. N Digital's complete winners' list: «ESPECTÁCULO DEL AÑO /
--    Morisoñando - GANADOR / Gabriel Pagán / Productor: René Brea». elCaribe
--    published video of him receiving it on 15 June 2021.
--
--    Filed under the ceremony year, 2021, which is the convention every other
--    Premios Soberano row in this table follows. The renglón is in the source
--    field.
--
-- =========================================================================
-- NOT LOADED, DELIBERATELY. His YouTube channel also claims Soberanos for
-- "merengue del Año, Colaboración del Año, Video Del Año" and a Premios Heat
-- for "Mejor artista tropical". No published winners' list found names him in
-- any of those four. Self-declared awards are not recorded without a list.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO award_categories (id, award_id, name)
VALUES
  ('7c19b0ad-4e5f-4a1c-9d2e-6b8f3a5c1d47',
   '1d8267d6-ad99-4ca6-8425-1315545ad86e', 'Mejor Álbum de Fusión Tropical'),
  ('2f84c6b1-9d03-4e77-ae51-8c4b2f70a9e6',
   'dec5d9e2-427b-414a-975f-41580488a7fd', 'Álbum del Año');

INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
VALUES
  ((SELECT id FROM artists WHERE slug = 'gabriel-pagan'),
   '1d8267d6-ad99-4ca6-8425-1315545ad86e',
   '7c19b0ad-4e5f-4a1c-9d2e-6b8f3a5c1d47', 2017, 'Contra la Corriente', false,
   'Acreditado como "Gabriel". Listín Diario, 27 de septiembre de 2017, "Once dominicanos son nominados al Latin Grammy"'),

  ((SELECT id FROM artists WHERE slug = 'gabriel-pagan'),
   'dec5d9e2-427b-414a-975f-41580488a7fd',
   '2f84c6b1-9d03-4e77-ae51-8c4b2f70a9e6', 2018, 'Contra la Corriente', true,
   'Acreditado como "Gabriel". Lista de ganadores, Listín Diario, CDN, Teleradio América, El Informante y El Sol de Santiago, 20-21 de marzo de 2018'),

  ((SELECT id FROM artists WHERE slug = 'gabriel-pagan'),
   'dec5d9e2-427b-414a-975f-41580488a7fd',
   '496a5cfc-9c98-4a61-9a4f-56216e318140', 2021, 'Morisoñando', true,
   'Renglón Popular 2019, gala del 15 de junio de 2021; lista completa de ganadores, N Digital, 16 de junio de 2021; video de elCaribe');

COMMIT;
