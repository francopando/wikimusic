BEGIN;

-- Publish Luís Pimentel, and publish his Spanish document with him.
--
-- He played second guitar in Trío Los Juveniles, the trio behind José Manuel
-- Calderón on the first bachata records of 30 May 1962. His entry was written
-- earlier today and left at needs_review by default.
--
-- Publishing him is what makes the reciprocal link possible. Calderón's
-- biography names him in prose but could not carry an artistReference node,
-- because a reference to an unpublished artist is rendered as dead plain text
-- by ArtistReference.tsx rather than as a link. The companion migration adds
-- that reference once this one has run.
--
-- His English document was already published; the Spanish one was still draft,
-- which would have left the Spanish profile falling back to the legacy column.
--
-- NOTE: he has no image. The usual practice in this catalogue is to publish an
-- artist once a photograph exists, and this publish was requested explicitly
-- ahead of that, so the profile will render without one.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists
   SET status = 'published',
       updated_at = now()
 WHERE slug = 'luis-pimentel';

UPDATE editorial_documents
   SET status = 'published',
       updated_at = now()
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-pimentel')
   AND status <> 'published';

COMMIT;
