BEGIN;

-- Revierte 20260907010900_clear_ballads_romantic_from_genre_arrays.sql.
-- Devuelve las siete filas a sus arrays originales con la hoja legada dentro.

UPDATE artists SET genres = ARRAY['merengue', 'ballads-romantic']::text[], updated_at = now()
 WHERE slug = 'angela-carrasco';

UPDATE artists SET genres = ARRAY['ballads-romantic']::text[], updated_at = now()
 WHERE slug IN ('elvis-cabrera', 'voz-a-voz', 'yanfourd');

UPDATE artists SET genres = ARRAY['urbano', 'ballads-romantic']::text[], updated_at = now()
 WHERE slug IN ('karlos-rose', 'lenny-santana', 'sharlene');

COMMIT;
