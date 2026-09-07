BEGIN;

-- Undo 20260906007500. One row, keyed on the artist, award, category and year.

DELETE FROM artist_awards
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'la-insuperable')
   AND award_id = '8304c63b-ff51-40ed-80bb-ea7c4079ca6f'
   AND category_id = 'ef5e0c39-06ae-4510-8bdb-8eb75cf5e21d'
   AND year = 2023;

COMMIT;
