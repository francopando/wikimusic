BEGIN;

-- Reverts 20260825010000_fix_la_insuperable_instagram.sql.
--
-- Restores the previous value 'lainsuperable69', which is known to be wrong:
-- an account with no display name, 1,743 followers and 0 posts. This file
-- exists only so the migration is reversible.

UPDATE artists
SET instagram = 'lainsuperable69',
    updated_at = now()
WHERE slug = 'la-insuperable'
  AND instagram IS DISTINCT FROM 'lainsuperable69';

COMMIT;
