BEGIN;

-- Revierte 20260907010800_move_rows_off_legacy_ballads_leaves.sql.
--
-- Devuelve las cuatro filas exactamente al estado en que estaban: Aníbal de Peña
-- en `ballads`, Julito Deschamps y Omar Franco en sus hojas legadas, y Niní
-- Cáffaro con ballads-bolero en el array.

UPDATE artists
   SET primary_genre = 'ballads', updated_at = now()
 WHERE slug = 'anibal-de-pena';

UPDATE artists
   SET primary_genre = 'ballads-bolero',
       genres        = ARRAY['bolero', 'ballads']::text[],
       updated_at    = now()
 WHERE slug = 'julito-deschamps';

UPDATE artists
   SET genres = ARRAY['ballads-bolero']::text[], updated_at = now()
 WHERE slug = 'nini-caffaro';

UPDATE artists
   SET primary_genre = 'ballads-romantic', updated_at = now()
 WHERE slug = 'omar-franco';

COMMIT;
