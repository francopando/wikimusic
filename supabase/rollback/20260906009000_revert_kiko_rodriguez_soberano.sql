BEGIN;

-- Reverts 20260906009000_kiko_rodriguez_soberano.sql.

DELETE FROM artist_awards
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez')
   AND award_id = 'dec5d9e2-427b-414a-975f-41580488a7fd'
   AND category_id = '3ba3ced3-dcbf-4436-8356-5f9f41f1546e'
   AND year = 2021
   AND work = 'El Beso Que No Le Di';

COMMIT;
