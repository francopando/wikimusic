BEGIN;

-- Set Stella Novella's gender to male, on the editor's own information.
--
-- Migration 20260906001200 emptied this column, because no public source stated
-- it: MusicBrainz leaves gender blank and files the entry as type Character,
-- Spotify's artist text says only "Dominican American drag artist", and the one
-- third-party page that used a pronoun used it for the stage persona rather
-- than for the performer. Emptying it was the right call on the evidence
-- available then.
--
-- The editor holds the artist's photograph and states the artist is a man. That
-- is a better source than anything on the open web, and it settles it.
--
-- The biography is untouched: it was written without pronouns and without any
-- claim about private life, and it still reads correctly.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists
   SET gender = 'male',
       updated_at = now()
 WHERE slug = 'stella-novella';

COMMIT;
