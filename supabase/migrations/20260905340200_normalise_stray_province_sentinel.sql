BEGIN;

-- Normalise the one province value that was neither a province nor a known
-- sentinel.
--
-- Black 45 King's province read "X - Born Outside". The public renderer decided
-- what to print by rejecting the two sentinels it knew about, so this value
-- passed the test and his profile showed "Puerto Príncipe, X - Born Outside" --
-- a bookkeeping token printed to readers as though it were a place.
--
-- The renderer is fixed separately and now recognises real provinces instead of
-- listing fake ones, so a stray value can no longer reach a page. This migration
-- fixes the data behind it: there is no third category here, only a one-off from
-- an import, and "Born Abroad" is the sentinel that already means what it meant.
--
-- The artist's birth_place, Puerto Príncipe, is untouched and still prints. Note
-- for whoever reviews the catalogue's foreign artists: being born in Haiti does
-- not by itself put an artist outside the Dominican catalogue, and this
-- migration takes no position on that question.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists
   SET province = 'Born Abroad',
       updated_at = now()
 WHERE province = 'X - Born Outside';

COMMIT;
