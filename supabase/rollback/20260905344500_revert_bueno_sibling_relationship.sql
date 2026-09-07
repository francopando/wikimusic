BEGIN;

-- Reverts 20260905344500_bueno_sibling_relationship.sql.
--
-- Removes the single sibling row joining Álex Bueno and Ismael Bueno.

DELETE FROM artist_family_relationships
 WHERE relationship_type = 'sibling'
   AND pair_low  = LEAST(
         (SELECT id FROM artists WHERE slug = 'alex-bueno'),
         (SELECT id FROM artists WHERE slug = 'ismael-bueno'))
   AND pair_high = GREATEST(
         (SELECT id FROM artists WHERE slug = 'alex-bueno'),
         (SELECT id FROM artists WHERE slug = 'ismael-bueno'));

COMMIT;
