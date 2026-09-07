BEGIN;

-- Undo 20260906004600. No categories were created, so only the four rows go.

DELETE FROM artist_awards
 WHERE artist_id = '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1'
   AND (award_id, category_id, year) IN (
     ('ead83dcf-9e2c-4f69-a557-dad604716a5e', '7e32c2ae-1b52-4624-b03e-0d4934cc6fee', 2011),
     ('8304c63b-ff51-40ed-80bb-ea7c4079ca6f', 'd7ec9884-2cdc-4b77-b794-1f7e88aa3cf7', 2023),
     ('8304c63b-ff51-40ed-80bb-ea7c4079ca6f', 'ef5e0c39-06ae-4510-8bdb-8eb75cf5e21d', 2023),
     ('32d73576-29be-40c4-b529-a7ce943fe2ec', '96cd0802-d976-4d4b-8ff2-cc17bcd6a2ae', 2023)
   );

COMMIT;
