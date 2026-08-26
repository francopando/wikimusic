BEGIN;

-- Reverts 20260825020000_fix_alex_bueno_instagram.sql.
--
-- Restores 'alexbueno_rd', an account that belongs to the artist but carries
-- no posts. This file exists only so the migration is reversible.

UPDATE artists
SET instagram = 'alexbueno_rd',
    updated_at = now()
WHERE slug = 'alex-bueno'
  AND instagram IS DISTINCT FROM 'alexbueno_rd';

COMMIT;
