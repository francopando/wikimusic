BEGIN;

-- Reverts 20260906002100_dedupe_artist_awards.sql.
--
-- The deleted rows were exact copies apart from their id, created_at and the
-- wording of `source`, so restoring them means recreating one copy of every row
-- that had one. The ids and timestamps of the deleted copies cannot be
-- recovered from the surviving rows; new ones are generated, and the source is
-- marked so a restored copy is recognisable.
--
-- This rollback therefore returns the DATA to its previous shape but not the
-- exact ids. If the ids matter, restore from a backup instead.

INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
SELECT x.artist_id, x.award_id, x.category_id, x.year, x.work, x.won,
       x.source || ' [copia restaurada]'
  FROM artist_awards x
  JOIN artists a ON a.id = x.artist_id
 WHERE a.slug = 'juan-luis-guerra';

COMMIT;
