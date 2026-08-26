BEGIN;

-- Reverts 20260825050000_create_lenny_salcedo.sql.

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN ('58338457-e074-4820-a5fc-5d41af48b89f', '3423e294-c367-4c1b-b0e1-6eb242b98753');

DELETE FROM editorial_documents WHERE id IN ('58338457-e074-4820-a5fc-5d41af48b89f', '3423e294-c367-4c1b-b0e1-6eb242b98753');

DELETE FROM artists WHERE id = 'a42ec361-635d-467f-9b7c-f2ccda1cb8e3';

COMMIT;
