BEGIN;

-- Saca `ballads-romantic` del array genres de las siete filas que aún lo llevan.
--
-- Continúa 20260907010800, que se ocupó de las cuatro filas donde la hoja legada
-- estaba en primary_genre. Estas son las que la llevaban DENTRO del array, que es
-- justo lo que se me pasó comprobar la primera vez.
--
-- `ballads-romantic` (id 28) es nivel 1, hija de `ballads`, con
-- legacy_subgenre_id 20: una de las subcategorías legadas pendientes de eliminar.
-- Cada fila sube al padre aprobado, `ballads`, salvo cuando eso repetiría el
-- primary_genre.
--
--   angela-carrasco   {merengue,ballads-romantic} -> {merengue}
--     NO pasa a ballads: su primary_genre YA es ballads, y la higiene de campos
--     prohíbe que genres repita primary_genre. Se queda solo merengue.
--   elvis-cabrera     {ballads-romantic}          -> {ballads}
--   karlos-rose       {urbano,ballads-romantic}   -> {urbano,ballads}
--   lenny-santana     {urbano,ballads-romantic}   -> {urbano,ballads}
--   sharlene          {urbano,ballads-romantic}   -> {urbano,ballads}
--   voz-a-voz         {ballads-romantic}          -> {ballads}
--   yanfourd          {ballads-romantic}          -> {ballads}
--
-- Ninguna cambia de primary_genre: eso ya estaba bien en las siete. Solo se
-- reemplaza la hoja legada por su padre.
--
-- Con esto sí queda comprobado -- esta vez mirando primary_genre Y el array -- que
-- ninguna fila del catálogo usa ya ballads-bolero ni ballads-romantic.
--
-- PARA REVERTIR: supabase/rollback/20260907010900_restore_ballads_romantic_in_arrays.sql
--
-- Aplicado directamente por DATABASE_URL. No corrió ninguna función de Vercel y
-- no se revalidó nada.

UPDATE artists SET genres = ARRAY['merengue']::text[], updated_at = now()
 WHERE slug = 'angela-carrasco' AND 'ballads-romantic' = ANY(genres);

UPDATE artists SET genres = ARRAY['ballads']::text[], updated_at = now()
 WHERE slug IN ('elvis-cabrera', 'voz-a-voz', 'yanfourd')
   AND 'ballads-romantic' = ANY(genres);

UPDATE artists SET genres = ARRAY['urbano', 'ballads']::text[], updated_at = now()
 WHERE slug IN ('karlos-rose', 'lenny-santana', 'sharlene')
   AND 'ballads-romantic' = ANY(genres);

COMMIT;
