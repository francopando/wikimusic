BEGIN;

-- Publica los 109 documentos de biografía que quedaron en borrador bajo
-- artistas ya publicados.
--
-- POR QUÉ EXISTÍAN. writeBiography insertaba todo documento NUEVO con status
-- 'draft'; las reescrituras conservaban el estado que la fila ya tenía. Así que
-- toda ficha creada desde cero quedaba con su documento en borrador, mientras
-- las reescrituras de fichas viejas quedaban publicadas. Nadie lo notó porque
-- el texto sí sale: la página pública, al no encontrar documento publicado,
-- cae al espejo legado bio_en/bio_es, que dice lo mismo.
--
-- QUÉ SE PIERDE EN ESA CAÍDA. El markdown legado renderiza cada artistReference
-- como su displayText en texto plano. Los enlaces entre artistas desaparecen.
-- Son 385 referencias invisibles en 101 artistas publicados, incluidas las
-- quince por idioma de Radhamés Aracena, que es el nudo de enlaces más denso
-- del catálogo.
--
-- Se detectó levantando el sitio en local antes de desplegar: la ficha de
-- Julito Deschamps enlazaba y la de Aracena no, y la única diferencia era que
-- el documento de Deschamps ya estaba publicado de antes.
--
-- POR QUÉ ES SEGURO PUBLICARLOS. El texto ya es público — se está sirviendo
-- ahora mismo desde el espejo markdown. Esto no expone contenido nuevo: cambia
-- de qué copia se renderiza, de la plana a la estructurada. Y el documento solo
-- se escribe cuando pasa todas las guardas editoriales, así que si existe está
-- tan terminado como su espejo.
--
-- ALCANCE ESTRICTO. Solo documentos en borrador cuyo artista esté publicado y
-- que no tengan ya un documento publicado en ese mismo idioma. Los borradores
-- de artistas sin publicar no se tocan.
--
-- La causa quedó corregida en editorial.cjs: los documentos nuevos se crean
-- publicados.
--
-- PARA REVERTIR: supabase/rollback/20260907011400_restore_draft_biographies.sql
--
-- Aplicado directamente por DATABASE_URL. No corrió ninguna función de Vercel y
-- no se revalidó nada.

UPDATE editorial_documents d
   SET status = 'published', updated_at = now()
  FROM artists a
 WHERE a.id = d.owner_artist_id
   AND d.document_type = 'artist_biography'
   AND d.status = 'draft'
   AND a.status = 'published'
   AND NOT EXISTS (
         SELECT 1
           FROM editorial_documents p
          WHERE p.owner_artist_id = d.owner_artist_id
            AND p.locale = d.locale
            AND p.document_type = 'artist_biography'
            AND p.status = 'published'
       );

COMMIT;
