BEGIN;

-- Reverts 20260825030000_create_lenny_pimentel.sql.
-- References cascade from the documents in most configurations; they are
-- deleted explicitly so the rollback does not depend on that.

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN ('c486f572-a63f-4157-affe-c28afda33009', '7d349801-eb29-4a5b-96e4-f2d0a5f6730b');

DELETE FROM editorial_documents WHERE id IN ('c486f572-a63f-4157-affe-c28afda33009', '7d349801-eb29-4a5b-96e4-f2d0a5f6730b');

DELETE FROM artists WHERE id = '74a2a301-f4ae-471d-8f8c-3515bb03b428';

COMMIT;
