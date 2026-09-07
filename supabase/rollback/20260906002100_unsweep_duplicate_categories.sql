BEGIN;

-- Reverts 20260906002100_sweep_remaining_duplicate_categories.sql.
--
-- The deleted categories were exact duplicates by name within their award, so
-- what is restored is one duplicate row per surviving category that had one.
-- Their original ids cannot be recovered from the surviving rows and new ones
-- are generated, and the artist_awards rows are NOT redistributed across the
-- restored copies, because which row belonged to which duplicate is exactly the
-- information the merge discarded.
--
-- This rollback therefore restores the SHAPE of the table, not the previous
-- assignment. If the assignment matters, restore from a backup instead.

INSERT INTO award_categories (award_id, name)
SELECT ac.award_id, ac.name
  FROM award_categories ac
  JOIN awards aw ON aw.id = ac.award_id
 WHERE (aw.name, ac.name) IN (
        ('BMI Latin',             'BMI Icon'),
        ('Grammy',                'Best Tropical Latin Album'),
        ('Grammy',                'Best Latin Pop Album'),
        ('Premios Casandra',      'Álbum del Año'),
        ('Premios Casandra',      'Merengue del Año'));

INSERT INTO award_categories (award_id, name)
SELECT ac.award_id, ac.name
  FROM award_categories ac
  JOIN awards aw ON aw.id = ac.award_id
 WHERE (aw.name, ac.name) = ('Premios Casandra', 'El Soberano');

INSERT INTO award_categories (award_id, name)
SELECT ac.award_id, ac.name
  FROM award_categories ac
  JOIN awards aw ON aw.id = ac.award_id
 WHERE (aw.name, ac.name) = ('Billboard Latin Music', 'Tropical Album of the Year');

COMMIT;
