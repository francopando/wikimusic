BEGIN;

-- La Insuperable — corrected Instagram handle.
--
-- The record stored 'lainsuperable69'. That account has no display name, 1,743
-- followers, 5 following and 0 posts; it is not the artist. As with Héctor
-- Acosta, the 2026-08-22 follow pass recorded a successful follow against it,
-- and the 2026-08-25 digest then reported the artist as having no posts.
--
-- The correct account is 'lainsuperable': display name "La Insuperable", 8.1M
-- followers, 7,002 posts, with Dominican and US booking numbers in the bio.
-- Verified by loading both profiles directly and comparing.
--
-- Note for future checks: Instagram's page HTML contains the word "Verified"
-- regardless of the account's actual status, so presence of that string is not
-- evidence. Follower count, display name and post count are the usable signals
-- when reading a profile signed out.
--
-- The facebook handle on this record ('LaInsuperableHD') is left untouched; it
-- has not been checked as part of this correction.

UPDATE artists
SET instagram = 'lainsuperable',
    updated_at = now()
WHERE slug = 'la-insuperable'
  AND instagram IS DISTINCT FROM 'lainsuperable';

COMMIT;
