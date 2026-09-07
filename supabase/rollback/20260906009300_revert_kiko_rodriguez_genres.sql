BEGIN;

-- Reverts 20260906009300_kiko_rodriguez_clear_inactive_genres.sql.

UPDATE artists
   SET genres = ARRAY['bachata-romantica','bachata-moderna']::text[], updated_at = now()
 WHERE slug = 'kiko-rodriguez';

COMMIT;
