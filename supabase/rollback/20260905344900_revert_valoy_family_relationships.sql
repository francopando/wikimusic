BEGIN;

-- Reverts 20260905344900_valoy_family_relationships.sql.
--
-- Removes only the rows that involve Cristopher Valoy. The rest of the Valoy
-- tree predates that migration and is left alone.

DELETE FROM artist_family_relationships
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy')
    OR related_artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy');

COMMIT;
