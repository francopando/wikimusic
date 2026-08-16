BEGIN;

-- Signed upload tokens are path-bound, while these bucket constraints enforce
-- the same source-image size and MIME contract at the Storage boundary.
UPDATE storage.buckets
SET file_size_limit = 26214400,
    allowed_mime_types = ARRAY['image/jpeg', 'image/png', 'image/webp']::text[]
WHERE id = 'artists-images-original';

COMMIT;
