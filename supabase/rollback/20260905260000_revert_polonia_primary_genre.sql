BEGIN;

-- Reverts 20260905260000_set_polonia_primary_genre_plena.sql.
-- Puts primary_genre back to 'merengue' and returns the plena slug to the
-- genres list, restoring the state left by 20260905240000.

UPDATE artists
SET primary_genre = 'merengue',
    genres = ARRAY['folklore', 'folklore-plena-dominicana']::text[],
    updated_at = now()
WHERE id = '3b6f60a1-2baa-4e2c-acec-452c5b026397';

COMMIT;
