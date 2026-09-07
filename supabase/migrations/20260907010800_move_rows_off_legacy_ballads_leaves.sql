BEGIN;

-- Saca cuatro filas de las hojas legadas de Ballads y corrige un género que puse
-- mal esta misma tarde.
--
-- LO QUE PREGUNTÓ EL EDITOR, Y TENÍA RAZÓN. Al escribir la ficha de Aníbal de
-- Peña anoté que había "dos géneros activos llamados Bolero" y lo traté como un
-- duplicado sin resolver, así que elegí `ballads` para no tomar partido. Eso
-- estaba mal. No son un duplicado:
--
--   ballads (id 7, nivel 0, destacado en portada) -- "Romantic ballads and soft
--     Latin pop"
--   bolero  (id 58, nivel 0, destacado en portada) -- "Ballads with a dancing
--     rhythm"
--
-- Son dos de los NUEVE géneros de nivel 0 sin legacy_subgenre_id, que es la
-- taxonomía aprobada: merengue, bachata, urbano, salsa, ballads, bolero,
-- instrumental, folklore y fusion. Existen por separado a propósito.
--
-- Lo que sí es un vestigio es `ballads-bolero` (id 51): nivel 1, hija de ballads,
-- con legacy_subgenre_id 38. Es una de las subcategorías legadas pendientes de
-- eliminar. Mientras siga ahí, las filas que la usan se rompen el día que se
-- aplique esa limpieza. Son tres, más la mía.
--
-- LOS CUATRO CAMBIOS:
--
--   anibal-de-pena     primary_genre ballads -> bolero
--     Corrección mía. Las fuentes lo llaman bolerista sin excepción, y la
--     descripción de `bolero` -- balada con ritmo bailable -- es exactamente lo
--     que hacía. Lo había puesto en el padre solo por no decidir.
--
--   julito-deschamps   primary_genre ballads-bolero -> bolero
--                      genres {bolero,ballads} -> {ballads}
--     Su primary_genre era la hoja legada mientras el array llevaba los dos
--     padres. Al subir el primary a `bolero`, el array ya no puede repetirlo:
--     la higiene de campos prohíbe que genres repita primary_genre. Queda
--     `ballads`, que sigue siendo cierto de él.
--
--   nini-caffaro       genres {ballads-bolero} -> {ballads}
--     El primary ya era `bolero` y está bien. Solo sale del vestigio, y al padre,
--     que es donde colgaba.
--
--   omar-franco        primary_genre ballads-romantic -> ballads
--     Misma especie: `ballads-romantic` (id 28) es otra hoja legada, hija de
--     ballads, con legacy_subgenre_id 20. Sube al padre aprobado.
--
-- CORRECCIÓN A ESTE MISMO COMENTARIO. Escribí primero que después de esto no
-- quedaría ninguna fila usando las hojas legadas. Era falso: al comprobarlo solo
-- había mirado `ballads-romantic` como primary_genre y no DENTRO del array
-- genres, donde aparece siete veces más. Después de esta migración,
-- ballads-bolero queda sin usar por completo, pero ballads-romantic sigue en el
-- array de siete filas. Esas van en 20260907010900, que es lo que deja el camino
-- libre para la eliminación pendiente de las subcategorías legadas.
--
-- PARA REVERTIR: supabase/rollback/20260907010800_restore_legacy_ballads_leaves.sql
--
-- Aplicado directamente por DATABASE_URL. No corrió ninguna función de Vercel y
-- no se revalidó nada.

UPDATE artists
   SET primary_genre = 'bolero', updated_at = now()
 WHERE slug = 'anibal-de-pena' AND primary_genre = 'ballads';

UPDATE artists
   SET primary_genre = 'bolero',
       genres        = ARRAY['ballads']::text[],
       updated_at    = now()
 WHERE slug = 'julito-deschamps' AND primary_genre = 'ballads-bolero';

UPDATE artists
   SET genres = ARRAY['ballads']::text[], updated_at = now()
 WHERE slug = 'nini-caffaro' AND genres = ARRAY['ballads-bolero']::text[];

UPDATE artists
   SET primary_genre = 'ballads', updated_at = now()
 WHERE slug = 'omar-franco' AND primary_genre = 'ballads-romantic';

COMMIT;
