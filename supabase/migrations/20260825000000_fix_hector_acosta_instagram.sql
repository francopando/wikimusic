BEGIN;

-- Héctor Acosta "El Torito" — corrected Instagram handle.
--
-- The record stored 'eltorito24'. That account is not his: it is an unrelated
-- profile named 'eltoromaldito' with 1 follower, 2 following and 0 posts. The
-- error was not harmless — the 2026-08-22 Instagram follow pass recorded a
-- successful follow against it, so the wrong account was followed, and the
-- 2026-08-25 read-only digest then reported the artist as having no posts.
--
-- The correct account is 'eltorito33': verified, 620K followers, 2,056 posts,
-- display name "Héctor Acosta", bio "Dominicano, orgulloso de mi gente, y
-- cantante por un regalo de Dios." It links to youtube.com/@eltoritoficial.
-- Verified by loading the profile directly rather than from search results.
--
-- Nearby handles checked and rejected while confirming this:
--   hectoracosta         — empty account, 25 followers, 0 posts
--   eltoritooficial      — Guillán 'El Torito', a different person
--   hectoracostaeltorito, hectoracostatorito, eltoritohectoracosta,
--   hectoracostaoficial  — do not exist
--
-- The facebook handle on this record ('HectorAcostaTorito') is correct and is
-- deliberately left untouched.

UPDATE artists
SET instagram = 'eltorito33',
    updated_at = now()
WHERE slug = 'hector-acosta-el-torito'
  AND instagram IS DISTINCT FROM 'eltorito33';

COMMIT;
