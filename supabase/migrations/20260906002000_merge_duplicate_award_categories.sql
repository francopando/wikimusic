BEGIN;

-- Collapse the duplicate rows in `award_categories`.
--
-- Runs after 20260906001900, which merged the duplicate awards. Some of these
-- duplicates only became visible once the awards collapsed into one scope,
-- because a category can only duplicate another within the same award.
--
-- In every pair the row with more artist_awards rows wins, and the loser's rows
-- are repointed before it is deleted. Where both have none, the older id wins.
--
-- EXACT NAME DUPLICATES, mechanical, no judgement involved:
--
--   Latin Grammy
--     Album of the Year             24541d2d (8)  keeps; 280c4dae (0) goes
--     Best Merengue/Bachata Album   9ea19c30 (11) keeps; 961c63fd (0) goes
--     Producer of the Year          f9ee67b2 (2)  keeps; a9c20a37 (0) goes
--     Record of the Year            9318f2b8 (4)  keeps; 75f612e2 (0) goes
--     Song of the Year              8bf40734 (2)  keeps; e4dd5972 (0) goes
--   Premios Soberano
--     El Gran Soberano              26e1ac30 (4)  keeps; 967e64ad (0) and
--                                   f2d99570 (0) go; 7c0225fd (1) is repointed
--                                   and goes
--   Premio Lo Nuestro
--     Artista Tropical del Año      64510423 (2)  keeps; 5f0b2bd3 (0) goes
--
-- ONE ACCENT FIX. Premios Soberano held "Orquesta del Ano" (ce362332, Eddy
-- Herrera 2019) beside "Orquesta del Año" (902e3ebc, Wilfrido Vargas 1985).
-- Same category; the accented spelling is the correct one. The surviving row is
-- renamed and the other folded into it.
--
-- ONE SHORT-AND-FULL-NAME PAIR. Premio Lo Nuestro held "Premio a la Excelencia"
-- (49dd0940) beside "Premio Lo Nuestro a la Excelencia" (800184b3). Same
-- distinction, written short and written out. The full name survives. Note that
-- Juan Luis Guerra holds a 2007 row in each of them, so this merge leaves him
-- with two identical rows; the migration that follows removes the copy.
--
-- LEFT ALONE DELIBERATELY, because each is a naming decision rather than a
-- duplicate:
--
--   * Cross-language pairs. Premio Lo Nuestro carries "Canción Tropical del
--     Año" beside "Tropical Song of the Year", and "Tropical Collaboration of
--     the Year" with no Spanish twin. Premios Soberano carries "Espectáculo del
--     Año" beside "Live Concert of the Year", plus "Contemporary Tropical
--     Album" and "Album Merengue/Bachata" in English. The table has no
--     consistent language: Premios Juventud and Premios Tu Musica Urbano are
--     entirely in English while Premios Soberano is mostly Spanish. Picking one
--     is an editorial choice and is left to the editor.
--   * "Videoclip del Año" and "Video Musical del Año" under Premios Soberano,
--     which may be the same category renamed between eras rather than a
--     duplicate.
--   * "Multiple Category Wins" under Premios Soberano, which is not a category
--     but a summary of several.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artist_awards SET category_id = '26e1ac30-c00d-4cc8-922f-bd7fd58502ce'::uuid, updated_at = now()
 WHERE category_id = '7c0225fd-cbe7-4ef9-a579-f50371f5d269'::uuid;

UPDATE artist_awards SET category_id = 'ce362332-515b-4e47-ac54-864ca8a71541'::uuid, updated_at = now()
 WHERE category_id = '902e3ebc-b04f-448c-bdb2-3972addcc71a'::uuid;

UPDATE artist_awards SET category_id = '800184b3-e5b5-44a7-9563-53c80fb19931'::uuid, updated_at = now()
 WHERE category_id = '49dd0940-051c-496f-8d3d-6cd86f8abffe'::uuid;

UPDATE award_categories SET name = 'Orquesta del Año'
 WHERE id = 'ce362332-515b-4e47-ac54-864ca8a71541'::uuid;

DELETE FROM award_categories WHERE id IN (
  '280c4dae-3759-4924-9224-313346da8bdf'::uuid,
  '961c63fd-4c03-47fc-8dbd-f8ec870543c3'::uuid,
  'a9c20a37-c0f4-4d28-9b17-c884b8403ca1'::uuid,
  '75f612e2-5738-4ec4-8d4f-c99c7403a35f'::uuid,
  'e4dd5972-27e5-4d90-bfb0-a598ac37512e'::uuid,
  '967e64ad-59e4-4a28-bfa7-ef3e310add4a'::uuid,
  'f2d99570-28f2-4447-8603-67c2682d1e6d'::uuid,
  '7c0225fd-cbe7-4ef9-a579-f50371f5d269'::uuid,
  '5f0b2bd3-0a1a-4a8c-8a27-df96ac5cbf80'::uuid,
  '902e3ebc-b04f-448c-bdb2-3972addcc71a'::uuid,
  '49dd0940-051c-496f-8d3d-6cd86f8abffe'::uuid
);

COMMIT;
