BEGIN;

-- Reverts 20260906000800_drop_junk_artist_tags.sql.
--
-- Puts the three stray values back on the two rows that carried them, in the
-- order they were stored: El Cherry Scom had ["secular","dembow","urban"] and
-- DJ Plano had ["secular","needs_review"].

UPDATE artists
   SET artist_tags = ARRAY['secular', 'dembow', 'urban'],
       updated_at = now()
 WHERE slug = 'el-cherry-scom';

UPDATE artists
   SET artist_tags = ARRAY['secular', 'needs_review'],
       updated_at = now()
 WHERE slug = 'dj-plano';

COMMIT;
