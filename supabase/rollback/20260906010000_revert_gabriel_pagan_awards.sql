BEGIN;

-- Reverts 20260906010000_gabriel_pagan_awards.sql.

DELETE FROM artist_awards
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan')
   AND category_id IN (
     '7c19b0ad-4e5f-4a1c-9d2e-6b8f3a5c1d47',
     '2f84c6b1-9d03-4e77-ae51-8c4b2f70a9e6',
     '496a5cfc-9c98-4a61-9a4f-56216e318140'
   );

DELETE FROM award_categories
 WHERE id IN (
   '7c19b0ad-4e5f-4a1c-9d2e-6b8f3a5c1d47',
   '2f84c6b1-9d03-4e77-ae51-8c4b2f70a9e6'
 );

COMMIT;
