BEGIN;

-- Reverts 20260906002500_yailin_awards.sql.
--
-- Removes her eight rows, then the six categories created for them, then the
-- Premios Heat award. Order matters, because artist_awards references both and
-- award_categories references awards.

DELETE FROM artist_awards
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral');

DELETE FROM award_categories WHERE id IN (
  'ef5e0c39-06ae-4510-8bdb-8eb75cf5e21d'::uuid,
  'ea2b8a92-90c7-4a79-a1fa-b8da8fa9d155'::uuid,
  '7b4c5217-4575-41d3-817d-66b37d72f31b'::uuid,
  '8ae40648-288e-4b63-b867-eb246bd83fe9'::uuid,
  '96cd0802-d976-4d4b-8ff2-cc17bcd6a2ae'::uuid,
  'd9382354-9c4b-499d-b6d5-742d121d1ea2'::uuid);

DELETE FROM awards WHERE id = '8cda1620-8b37-487d-9491-0c4108e133a4'::uuid;

COMMIT;
