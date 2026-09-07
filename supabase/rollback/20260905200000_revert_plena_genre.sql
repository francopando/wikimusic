BEGIN;

-- Reverts 20260905200000_add_plena_to_genre_taxonomy.sql.
--
-- Strips the genre from any artist carrying it before removing the row, so no
-- artist is left pointing at a slug the taxonomy no longer defines. Remember to
-- drop the folklore_plena_dominicana key from messages/en.json and
-- messages/es.json as well; SQL cannot do that part.

UPDATE artists
SET genres = array_remove(genres, 'folklore-plena-dominicana'),
    updated_at = now()
WHERE 'folklore-plena-dominicana' = ANY(genres);

UPDATE artists
SET primary_genre = 'merengue', updated_at = now()
WHERE primary_genre = 'folklore-plena-dominicana';

DELETE FROM genres WHERE slug = 'folklore-plena-dominicana';

COMMIT;
