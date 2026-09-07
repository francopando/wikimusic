BEGIN;

-- Reverts 20260905343800_soriano_sibling_relationships.sql.
--
-- Removes the six sibling rows joining Joan, Fernando and Griselda Soriano.
-- Nothing else in artist_family_relationships touches these three.

DELETE FROM artist_family_relationships
 WHERE relationship_type = 'sibling'
   AND artist_id IN (SELECT id FROM artists
                      WHERE slug IN ('joan-soriano', 'fernando-soriano', 'griselda-soriano'))
   AND related_artist_id IN (SELECT id FROM artists
                      WHERE slug IN ('joan-soriano', 'fernando-soriano', 'griselda-soriano'));

COMMIT;
