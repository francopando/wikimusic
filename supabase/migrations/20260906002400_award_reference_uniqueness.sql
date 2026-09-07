BEGIN;

-- Stop the duplicates coming back.
--
-- The awards tables accumulated four "Premios Soberano" rows, two "Latin
-- Grammy" rows and twenty-one duplicated categories because nothing prevented a
-- second insert of a name that already existed. Every research pass that added
-- an award added it again.
--
-- Two constraints close that:
--
--   awards            unique on (name)
--   award_categories  unique on (award_id, name)
--
-- The second is scoped to the award on purpose. "Album of the Year" exists at
-- the Latin Grammys and at Premio Lo Nuestro and they are different things; only
-- a repeat inside one award is a duplicate.
--
-- Runs after 20260906001900 through 20260906002200, which removed every value
-- that would violate them.
--
-- A consistency check that could not be expressed as a constraint here, and is
-- worth a periodic query instead: every artist_awards row should use a category
-- that belongs to its own award. Enforcing that needs a composite foreign key,
-- which means a unique key on award_categories (id, award_id) and a new column
-- pairing on artist_awards, and that is a schema change beyond this cleanup.
--
--   select count(*) from artist_awards x
--     join award_categories ac on ac.id = x.category_id
--    where ac.award_id <> x.award_id;
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

ALTER TABLE awards
  ADD CONSTRAINT awards_name_key UNIQUE (name);

ALTER TABLE award_categories
  ADD CONSTRAINT award_categories_award_id_name_key UNIQUE (award_id, name);

COMMIT;
