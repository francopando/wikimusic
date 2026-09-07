BEGIN;

-- Undo 20260906004000. The artist_awards rows go first: award_categories has
-- ON DELETE CASCADE from awards but artist_awards.category_id is NO ACTION, so
-- a category cannot be removed while a row still points at it.

DELETE FROM artist_awards
 WHERE (artist_id, award_id, year) IN (
   ('500a19b6-489a-42f1-9986-f4aa41e07b32', '8304c63b-ff51-40ed-80bb-ea7c4079ca6f', 2014),
   ('969a3c82-6b31-4ea0-878d-8643001ca839', 'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60', 2015),
   ('9e148524-3310-448e-b1a0-df0093ea2af7', 'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60', 2014),
   ('9e148524-3310-448e-b1a0-df0093ea2af7', '8cda1620-8b37-487d-9491-0c4108e133a4', 2021),
   ('9e148524-3310-448e-b1a0-df0093ea2af7', 'dec5d9e2-427b-414a-975f-41580488a7fd', 2021)
 );

DELETE FROM award_categories
 WHERE id IN ('3a1c4f88-6d21-4b0e-9c7a-5f2e8b41d907',
              '9b7e2d14-8c53-4a6f-b019-27d4ae6c3f85');

COMMIT;
