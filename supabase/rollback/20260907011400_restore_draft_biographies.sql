BEGIN;

-- Revierte 20260907011400. Devuelve a borrador los documentos de biografía que
-- aquella migración publicó, identificados por ser los únicos publicados cuyo
-- artista está publicado y cuya revisión sigue siendo la que tenían.
--
-- Nota: si desde entonces se ha reescrito alguno, su revisión habrá subido y
-- este rollback no lo tocará, que es el comportamiento deseado.

UPDATE editorial_documents d
   SET status = 'draft', updated_at = now()
  FROM artists a
 WHERE a.id = d.owner_artist_id
   AND d.document_type = 'artist_biography'
   AND d.status = 'published'
   AND a.status = 'published'
   AND d.updated_at >= DATE '2026-09-07';

COMMIT;
