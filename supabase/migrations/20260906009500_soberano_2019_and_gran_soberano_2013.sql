BEGIN;

-- Premios Soberano 2019, and a Gran Soberano filed against the wrong artist.
--
-- All of this came out of verifying one claim on Deyvi Simé's YouTube channel:
-- "ganador del Premio Soberano Bachata del año 2019".
--
-- =========================================================================
-- 1. THE CORRECTION. antony-santos carries "El Gran Soberano, 2013". He did
--    not win it in 2013; he won it in 2019.
--
--    El Gran Soberano 2013 went to Héctor Acosta "El Torito". Acento (10 April
--    2013), Hoy (9 April 2013), El Diario NY (10 April 2013), Héctor Acosta's
--    own site and the winners table in Spanish Wikipedia's Premios Soberano
--    article all say so, and Wikipedia's table reads Héctor Acosta 2013,
--    Cuquín Victoria 2014, Iván García 2015, Fefita La Grande 2016.
--
--    That Antony Santos won it in 2019 is what the whole framing of that gala
--    rests on. Listín Diario, 20 March 2019: "la bachata tradicional esperaba
--    por su primer Gran Soberano. Y le tocó esta madrugada". Vanguardia del
--    Pueblo the next day: "se une con este galardón a otros grandes del país
--    que lo han recibido como Juan Luis Guerra y Sergio Vargas, el último en
--    obtenerlo". Neither sentence is writable if he already had one from 2013.
--
--    The row is moved rather than deleted: same artist, same category, correct
--    year, and the source field now says where the year comes from.
--
--    The 2013 statuette is added to hector-acosta-el-torito, who had no award
--    rows at all. His award history is far larger than this and is not
--    attempted here; only the one this correction displaces is loaded.
--
-- =========================================================================
-- 2. THE 2019 GALA. Vanguardia del Pueblo published the full winners' list of
--    the thirty-fifth gala on 21 March 2019. From the RENGLÓN POPULAR section:
--
--      BACHATA DEL AÑO      «Mal educado» - Anthony Santos (Deyvi Simé)
--      BACHATERO DEL AÑO    Anthony Santos
--      ORQUESTA DEL AÑO     Héctor Acosta
--
--    A NOTE ON THE SONG TITLE. Listín Diario's report of the ceremony names the
--    winning bachata as "Encadenado", and Vanguardia repeats that sentence in
--    its own prose while its published list says "Mal educado". elCaribe, on 12
--    March 2020, states that "Mal educado" was Deyvi Simé's first composition
--    for Antony Santos and that it won bachata of the year at Soberano 2019.
--    Deyvi Simé's own channel and his own about.me biography both say Mal
--    Educado. "Encadenado" is a wire-copy error that propagated between the two
--    papers, and it is not used here.
--
--    Bachata del Año is loaded against BOTH the performer and the composer,
--    because the published list credits both and authorship is what this
--    catalogue records.
--
--    The category row used for Bachatero del Año is the existing
--    e016ac69 "Bachatero de Año", which is misspelt (missing "del") and is
--    already in use for Antony Santos's 2014 win. It is used as-is for
--    consistency rather than adding a second, near-identical category. The
--    typo is an editor decision to make separately, and fixing it is a single
--    UPDATE on award_categories.name.
--
-- No new awards and no new categories are created.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

-- 1. The misattributed Gran Soberano, moved to the year he actually won it.
UPDATE artist_awards
   SET year = 2019,
       source = 'Premios Soberano 2019, gala 35; Listín Diario y Vanguardia del Pueblo, 20-21 de marzo de 2019. Corrige un 2013 que pertenece a Héctor Acosta.',
       updated_at = now()
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'antony-santos')
   AND category_id = '26e1ac30-c00d-4cc8-922f-bd7fd58502ce'
   AND year = 2013;

-- 2. The Gran Soberano 2013, on the artist it belongs to.
INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
VALUES
  ((SELECT id FROM artists WHERE slug = 'hector-acosta-el-torito'),
   'dec5d9e2-427b-414a-975f-41580488a7fd',
   '26e1ac30-c00d-4cc8-922f-bd7fd58502ce', 2013, NULL, true,
   'Acento, Hoy y El Diario NY, 9-10 de abril de 2013; tabla de ganadores de El Gran Soberano en Wikipedia'),

-- 3. The 2019 gala.
  ((SELECT id FROM artists WHERE slug = 'deyvi-sime'),
   'dec5d9e2-427b-414a-975f-41580488a7fd',
   '3ba3ced3-dcbf-4436-8356-5f9f41f1546e', 2019, 'Mal Educado', true,
   'Como compositor. Lista oficial de ganadores, Vanguardia del Pueblo, 21 de marzo de 2019; confirmado por elCaribe, 12 de marzo de 2020'),

  ((SELECT id FROM artists WHERE slug = 'antony-santos'),
   'dec5d9e2-427b-414a-975f-41580488a7fd',
   '3ba3ced3-dcbf-4436-8356-5f9f41f1546e', 2019, 'Mal Educado', true,
   'Como intérprete. Lista oficial de ganadores, Vanguardia del Pueblo, 21 de marzo de 2019'),

  ((SELECT id FROM artists WHERE slug = 'antony-santos'),
   'dec5d9e2-427b-414a-975f-41580488a7fd',
   'e016ac69-513d-4a40-b636-e148aae081c0', 2019, NULL, true,
   'Lista oficial de ganadores, Vanguardia del Pueblo, 21 de marzo de 2019'),

  ((SELECT id FROM artists WHERE slug = 'hector-acosta-el-torito'),
   'dec5d9e2-427b-414a-975f-41580488a7fd',
   'ce362332-515b-4e47-ac54-864ca8a71541', 2019, NULL, true,
   'Lista oficial de ganadores, Vanguardia del Pueblo, 21 de marzo de 2019');

COMMIT;
