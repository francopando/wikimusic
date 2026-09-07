BEGIN;

-- Put the province column entirely into Spanish, and stop one value meaning two
-- different things.
--
-- The thirty-two real provinces were already stored in Spanish and correctly
-- spelled. The two bookkeeping values were not:
--
--   "Born Abroad"   18 rows  -> "Nacido en el Exterior"
--   "No Province"   67 rows  -> NULL   (with two exceptions, below)
--
-- WHY "No Province" GOES AWAY. It meant "no province on record", which is
-- exactly what NULL already means, so the column carried the same fact in two
-- shapes and neither the admin form nor any public route offered it. Worse, in
-- practice it was also being used for artists who are simply not from the
-- Dominican Republic, which is a different fact and the one "Nacido en el
-- Exterior" is for. Collapsing it to NULL leaves NULL meaning one thing --
-- unknown -- and the sentinel meaning the other.
--
-- THE TWO EXCEPTIONS. Two rows carried "No Province" beside a New York
-- birthplace, so the sentinel was wrong rather than merely redundant, and they
-- become "Nacido en el Exterior" instead:
--
--   amarfis-y-la-banda-de-atakke   birth_place "New York"
--   milly-jocelyn-y-los-vecinos    birth_place "Nueva York"
--
-- RENDERING IS SAFE EITHER WAY. formatOrigin prints a province only when it is
-- one of the thirty-two, so a Spanish sentinel is dropped from the page exactly
-- as the English one was. The companion code change adds the new value to
-- PROVINCE_SENTINELS and to the admin dropdown, so an editor can still set it.
--
-- LEFT FOR THE EDITOR, three rows where the province is simply missing and
-- could be filled from the birthplace: kiko-rodriguez (Tamboril, which is in
-- Santiago), los-ahijados and milka-la-mas-dura (both Santo Domingo). They
-- become NULL here because that is what the data says today; filling them in is
-- research, not normalisation.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists
   SET province = 'Nacido en el Exterior',
       updated_at = now()
 WHERE province = 'Born Abroad'
    OR slug IN ('amarfis-y-la-banda-de-atakke', 'milly-jocelyn-y-los-vecinos');

UPDATE artists
   SET province = NULL,
       updated_at = now()
 WHERE province = 'No Province';

COMMIT;
