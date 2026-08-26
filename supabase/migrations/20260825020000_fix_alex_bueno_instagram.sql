BEGIN;

-- Alex Bueno — corrected Instagram handle.
--
-- The record stored 'alexbueno_rd'. That account is real and genuinely his by
-- name ("Alex Bueno RD", 136K followers), but it holds zero posts, which is
-- why the 2026-08-25 digest could find nothing to report for him.
--
-- His active account is 'alexbuenomundial': "Alex Bueno", 211K followers,
-- 2,656 posts, bio "Siempre en el corazón de todos". Confirmed by the artist's
-- own review of the digest results, and verified by loading both profiles.
--
-- This one differs from the earlier eltorito24 / lainsuperable69 corrections:
-- those pointed at unrelated accounts, whereas this pointed at a dormant
-- account belonging to the same artist. Both produce the same symptom — an
-- artist that appears to have no posts — but only this one was a defensible
-- value when it was first recorded.

UPDATE artists
SET instagram = 'alexbuenomundial',
    updated_at = now()
WHERE slug = 'alex-bueno'
  AND instagram IS DISTINCT FROM 'alexbuenomundial';

COMMIT;
