BEGIN;

-- Reverts 20260906011200_crispin_fernandez_swap_locales.sql.
-- The migration is its own inverse: swapping twice returns the original state.

CREATE TEMP TABLE crispin_swap_rb ON COMMIT DROP AS
SELECT
  (SELECT id FROM editorial_documents
     WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez')
       AND locale = 'en') AS id_en,
  (SELECT id FROM editorial_documents
     WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez')
       AND locale = 'es') AS id_es;

CREATE TEMP TABLE crispin_docs_rb ON COMMIT DROP AS
SELECT d.id, d.document
  FROM editorial_documents d, crispin_swap_rb s
 WHERE d.id IN (s.id_en, s.id_es);

UPDATE editorial_documents d
   SET document = cd.document, updated_at = now()
  FROM crispin_swap_rb s, crispin_docs_rb cd
 WHERE d.id IN (s.id_en, s.id_es)
   AND cd.id = CASE WHEN d.id = s.id_en THEN s.id_es ELSE s.id_en END;

UPDATE editorial_entity_references er
   SET editorial_document_id = CASE WHEN er.editorial_document_id = s.id_en
                                    THEN s.id_es ELSE s.id_en END,
       updated_at = now()
  FROM crispin_swap_rb s
 WHERE er.editorial_document_id IN (s.id_en, s.id_es);

UPDATE artists
   SET bio_en = bio_es, bio_es = bio_en, updated_at = now()
 WHERE slug = 'crispin-fernandez';

COMMIT;
