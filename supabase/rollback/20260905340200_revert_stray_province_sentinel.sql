BEGIN;

-- Reverts 20260905340200_normalise_stray_province_sentinel.sql.
--
-- Restores "X - Born Outside" on the one artist that carried it. Keyed by slug
-- rather than by the sentinel value, because by now other artists legitimately
-- hold "Born Abroad" and must not be swept up.

UPDATE artists
   SET province = 'X - Born Outside',
       updated_at = now()
 WHERE slug = 'black-45-king';

COMMIT;
