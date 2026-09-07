BEGIN;

-- Reverts 20260906002000_merge_duplicate_award_categories.sql.
--
-- Recreates the eleven deleted category rows under the awards they belonged to
-- once 20260906001900 had run, restores the unaccented spelling on the Orquesta
-- row, and sends the three repointed artist_awards rows back by their own ids:
--
--   32c682c0-…  Wilfrido Vargas, El Gran Soberano 2002  -> 7c0225fd-…
--   a005e0a6-…  Wilfrido Vargas, Orquesta del Año 1985  -> 902e3ebc-…
--   6d53514d-…  Juan Luis Guerra, Excelencia 2007       -> 49dd0940-…

INSERT INTO award_categories (id, award_id, name) VALUES
  ('280c4dae-3759-4924-9224-313346da8bdf'::uuid, '1d8267d6-ad99-4ca6-8425-1315545ad86e'::uuid, 'Album of the Year'),
  ('961c63fd-4c03-47fc-8dbd-f8ec870543c3'::uuid, '1d8267d6-ad99-4ca6-8425-1315545ad86e'::uuid, 'Best Merengue/Bachata Album'),
  ('a9c20a37-c0f4-4d28-9b17-c884b8403ca1'::uuid, '1d8267d6-ad99-4ca6-8425-1315545ad86e'::uuid, 'Producer of the Year'),
  ('75f612e2-5738-4ec4-8d4f-c99c7403a35f'::uuid, '1d8267d6-ad99-4ca6-8425-1315545ad86e'::uuid, 'Record of the Year'),
  ('e4dd5972-27e5-4d90-bfb0-a598ac37512e'::uuid, '1d8267d6-ad99-4ca6-8425-1315545ad86e'::uuid, 'Song of the Year'),
  ('967e64ad-59e4-4a28-bfa7-ef3e310add4a'::uuid, 'dec5d9e2-427b-414a-975f-41580488a7fd'::uuid, 'El Gran Soberano'),
  ('f2d99570-28f2-4447-8603-67c2682d1e6d'::uuid, 'dec5d9e2-427b-414a-975f-41580488a7fd'::uuid, 'El Gran Soberano'),
  ('7c0225fd-cbe7-4ef9-a579-f50371f5d269'::uuid, 'dec5d9e2-427b-414a-975f-41580488a7fd'::uuid, 'El Gran Soberano'),
  ('5f0b2bd3-0a1a-4a8c-8a27-df96ac5cbf80'::uuid, 'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid, 'Artista Tropical del Año'),
  ('902e3ebc-b04f-448c-bdb2-3972addcc71a'::uuid, 'dec5d9e2-427b-414a-975f-41580488a7fd'::uuid, 'Orquesta del Año'),
  ('49dd0940-051c-496f-8d3d-6cd86f8abffe'::uuid, 'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid, 'Premio a la Excelencia')
ON CONFLICT (id) DO NOTHING;

UPDATE award_categories SET name = 'Orquesta del Ano'
 WHERE id = 'ce362332-515b-4e47-ac54-864ca8a71541'::uuid;

UPDATE artist_awards SET category_id = '7c0225fd-cbe7-4ef9-a579-f50371f5d269'::uuid, updated_at = now()
 WHERE id = '32c682c0-e758-4f94-89c7-c25a0bef9063'::uuid;

UPDATE artist_awards SET category_id = '902e3ebc-b04f-448c-bdb2-3972addcc71a'::uuid, updated_at = now()
 WHERE id = 'a005e0a6-d146-42f0-9f00-46e901c94e47'::uuid;

UPDATE artist_awards SET category_id = '49dd0940-051c-496f-8d3d-6cd86f8abffe'::uuid, updated_at = now()
 WHERE id = '6d53514d-610c-4913-ae6a-8a484bdbebbe'::uuid;

COMMIT;
