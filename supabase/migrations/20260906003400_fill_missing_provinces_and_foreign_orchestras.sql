BEGIN;

-- Fill the five origin gaps the normalisation left behind, on the editor's own
-- information.
--
-- Migration 20260906003200 turned "No Province" into NULL wherever it meant
-- "unknown", which was correct but left three Dominican artists with a
-- birthplace and no province, and two New York orchestras with neither. The
-- editor has supplied all five.
--
-- THREE PROVINCES FILLED, from the birthplace already stored:
--
--   kiko-rodriguez      Tamboril        -> Santiago
--   los-ahijados        Santo Domingo   -> Santo Domingo
--   milka-la-mas-dura   Santo Domingo   -> Santo Domingo
--
-- Note that Los Ahijados and Milka take the province Santo Domingo rather than
-- Distrito Nacional. That is the editor's call and it is not interchangeable:
-- the city of Santo Domingo proper is the Distrito Nacional, while Santo
-- Domingo province is the ring around it -- Este, Norte, Oeste.
--
-- TWO ORCHESTRAS, both founded in New York, per the editor:
--
--   oro-solido          formed in New York, United States, in 1994, by the
--                       Dominican musician Raúl Acosta
--   the-new-york-band   formed in the city of New York, United States, in 1986
--
-- Both were carrying NULL province and NULL birthplace, which read as "we do
-- not know" when the truth is "not the Dominican Republic". They now match
-- Proyecto Uno, Urbanda, Altamira Banda Show and La Gran Manzana: the sentinel
-- "Nacido en el Exterior", a birthplace of Nueva York, and the founding year in
-- birth_year, which is how this catalogue has been dating groups.
--
-- The diaspora tag is added to both, on the same reading as the others.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists SET province = 'Santiago', updated_at = now()
 WHERE slug = 'kiko-rodriguez';

UPDATE artists SET province = 'Santo Domingo', updated_at = now()
 WHERE slug IN ('los-ahijados', 'milka-la-mas-dura');

UPDATE artists
   SET province = 'Nacido en el Exterior',
       birth_place = 'Nueva York',
       birth_year = 1994,
       artist_tags = (
         SELECT ARRAY(SELECT DISTINCT unnest(artist_tags || ARRAY['diaspora']))
       ),
       updated_at = now()
 WHERE slug = 'oro-solido';

UPDATE artists
   SET province = 'Nacido en el Exterior',
       birth_place = 'Nueva York',
       birth_year = 1986,
       artist_tags = (
         SELECT ARRAY(SELECT DISTINCT unnest(artist_tags || ARRAY['diaspora']))
       ),
       updated_at = now()
 WHERE slug = 'the-new-york-band';

COMMIT;
