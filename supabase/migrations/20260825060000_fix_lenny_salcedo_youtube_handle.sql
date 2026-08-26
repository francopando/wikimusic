BEGIN;

-- Lenny Salcedo — store the YouTube handle rather than the channel URL.
--
-- 20260825050000 stored 'https://www.youtube.com/channel/UCgv3suvKSp-yXLp7mot6gPQ'
-- because the handle could not be confirmed to resolve to that channel. The
-- artist's owner has since confirmed the handle is @lennysalcedo, so the value
-- now matches the convention used by every other record in the catalogue.

UPDATE artists
SET youtube = '@lennysalcedo',
    updated_at = now()
WHERE slug = 'lenny-salcedo'
  AND youtube IS DISTINCT FROM '@lennysalcedo';

COMMIT;
