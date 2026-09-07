BEGIN;

-- Reverts 20260905342100_publish_luis_pimentel.sql.
--
-- Returns Luís Pimentel to needs_review and his Spanish document to draft,
-- which is the exact state captured before the publish. His English document
-- was already published beforehand and is deliberately left alone.
--
-- Run the companion rollback for the reciprocal link FIRST. Unpublishing him
-- while José Manuel Calderón's biography still carries an artistReference to
-- him would leave that mention rendering as dead plain text on a published
-- page.

UPDATE editorial_documents
   SET status = 'draft',
       updated_at = now()
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-pimentel')
   AND locale = 'es';

UPDATE artists
   SET status = 'needs_review',
       updated_at = now()
 WHERE slug = 'luis-pimentel';

COMMIT;
