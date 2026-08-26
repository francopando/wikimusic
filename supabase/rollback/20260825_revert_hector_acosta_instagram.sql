BEGIN;

-- Reverts 20260825000000_fix_hector_acosta_instagram.sql.
--
-- Restores the previous value 'eltorito24'. Note that this value is known to
-- be wrong: it points at an unrelated account ('eltoromaldito', 1 follower,
-- 0 posts). This file exists only so the migration is reversible; there is no
-- editorial reason to run it.

UPDATE artists
SET instagram = 'eltorito24',
    updated_at = now()
WHERE slug = 'hector-acosta-el-torito'
  AND instagram IS DISTINCT FROM 'eltorito24';

COMMIT;
