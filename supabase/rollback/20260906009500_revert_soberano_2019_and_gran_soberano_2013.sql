BEGIN;

-- Reverts 20260906009500_soberano_2019_and_gran_soberano_2013.sql.

DELETE FROM artist_awards
 WHERE award_id = 'dec5d9e2-427b-414a-975f-41580488a7fd'
   AND (
     (artist_id = (SELECT id FROM artists WHERE slug = 'hector-acosta-el-torito')
      AND category_id = '26e1ac30-c00d-4cc8-922f-bd7fd58502ce' AND year = 2013)
  OR (artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime')
      AND category_id = '3ba3ced3-dcbf-4436-8356-5f9f41f1546e' AND year = 2019)
  OR (artist_id = (SELECT id FROM artists WHERE slug = 'antony-santos')
      AND category_id = '3ba3ced3-dcbf-4436-8356-5f9f41f1546e' AND year = 2019)
  OR (artist_id = (SELECT id FROM artists WHERE slug = 'antony-santos')
      AND category_id = 'e016ac69-513d-4a40-b636-e148aae081c0' AND year = 2019)
  OR (artist_id = (SELECT id FROM artists WHERE slug = 'hector-acosta-el-torito')
      AND category_id = 'ce362332-515b-4e47-ac54-864ca8a71541' AND year = 2019)
   );

UPDATE artist_awards
   SET year = 2013, source = 'ACROARTE Gala 2013', updated_at = now()
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'antony-santos')
   AND category_id = '26e1ac30-c00d-4cc8-922f-bd7fd58502ce'
   AND year = 2019;

COMMIT;
