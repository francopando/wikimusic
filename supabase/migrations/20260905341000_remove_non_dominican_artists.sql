BEGIN;

-- Remove three artists who are not Dominican.
--
-- All three entered through the same door: the 16 May import trusted
-- MusicBrainz's country field, and MusicBrainz had them filed as DO. The
-- country field is precisely what is wrong in each case, so none of them was
-- findable by checking nationality -- what gave them away was the text around
-- them, and then the press.
--
--   Cokco -- a rapper from Click Clack Gang, a collective from Valladolid,
--     Spain. Died March 2015. No connection to Dominican music of any kind.
--
--   Tito Chicoma -- Roberto Enrique Chicoma Bancer, Peruvian, born in Chiclayo
--     on 2 June 1936 and died in Lima on 23 April 2010. Trumpeter, composer and
--     producer of Peruvian salsa; commemorated by APDAYC, the Peruvian authors'
--     society, and his death covered by Agencia Andina, Peru's state news
--     agency. His row read "Santo Domingo" as a birthplace, which is the
--     import's default and no source supports.
--
--   Luis Aquino -- Puerto Rican. His own site opens "Naci en San Juan de Puerto
--     Rico y fui criado en el pueblo de Rio Grande." One of the most recorded
--     trumpeters in Latin America; he has played on Dominican records, which is
--     presumably how he arrived. His published biography did not resolve the
--     ambiguity so much as describe it, telling readers his link to San Juan
--     "may refer to the Dominican municipality or suggest a connection to the
--     Puerto Rican capital".
--
-- WHAT THIS DESTROYS. The delete is wider than it looks: most foreign keys into
-- artists cascade. Tito Chicoma owns eighteen recordings and two releases --
-- his Peruvian albums, "Vol. VII" and "Salsometro vol. 1" -- and those go with
-- him. Each artist also owns one editorial document. Nothing else in the
-- catalogue pointed at any of the three: no biography linked to them, no work
-- credits, no redirects. All three were needs_review, so none was public.
--
-- The rollback restores every deleted row with its original id, so it is a real
-- undo rather than a re-creation.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated; none of the three had a public page to invalidate.

-- release_artists is ON DELETE RESTRICT and would block the delete, so it
-- goes first. Everything else cascades.
DELETE FROM release_artists
 WHERE artist_id IN (SELECT id FROM artists WHERE slug IN ('cokco', 'tito-chicoma', 'luis-aquino'));

DELETE FROM artists WHERE slug IN ('cokco', 'tito-chicoma', 'luis-aquino');

COMMIT;
