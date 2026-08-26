BEGIN;

-- Reverts 20260825060000_fix_lenny_salcedo_youtube_handle.sql.

UPDATE artists
SET youtube = 'https://www.youtube.com/channel/UCgv3suvKSp-yXLp7mot6gPQ',
    updated_at = now()
WHERE slug = 'lenny-salcedo';

COMMIT;
