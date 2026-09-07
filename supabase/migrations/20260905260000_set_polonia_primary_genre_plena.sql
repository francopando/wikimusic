BEGIN;

-- Alfredo Polonia — primary_genre 'merengue' -> 'folklore-plena-dominicana'.
--
-- Completes 20260905240000, which added the plena slug to his genres list but
-- deliberately left primary_genre alone pending this decision. The record was
-- describing El Padre de la Plena Dominicana as primarily a merengue artist,
-- which his own biography, rewritten in that migration, directly contradicts.
--
-- A level-1 slug is a valid primary_genre and is already common in the
-- catalogue: the perico ripiao accordionists sit on 'merengue-perico-ripiao'.
--
-- genres drops 'folklore-plena-dominicana' in the same statement, because it
-- would now repeat primary_genre and the field-hygiene rule in
-- EDITORIAL_BIOGRAPHY_FORMAT.md forbids that pairing.
--
-- 'merengue' moves down into genres rather than being discarded. It was the
-- stored primary before this pass and therefore encodes an earlier editorial
-- judgement about his accordion work; demoting it keeps that judgement
-- available instead of deleting it on the strength of sources that simply did
-- not discuss it. 'folklore' is left in place as it was before any of today's
-- work.

UPDATE artists
SET primary_genre = 'folklore-plena-dominicana',
    genres = ARRAY['folklore', 'merengue']::text[],
    updated_at = now()
WHERE id = '3b6f60a1-2baa-4e2c-acec-452c5b026397';

COMMIT;
