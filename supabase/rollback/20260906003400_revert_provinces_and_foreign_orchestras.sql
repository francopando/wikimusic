BEGIN;

-- Reverts 20260906003400_fill_missing_provinces_and_foreign_orchestras.sql.
--
-- Returns all five rows to the state 20260906003200 left them in: NULL province
-- throughout, no birthplace on the two orchestras, and The New York Band with
-- no year. Oro Sólido keeps birth_year 1994, which it already carried before
-- the forward migration and which that migration only rewrote to the same
-- value. The diaspora tag is removed from both orchestras.

UPDATE artists SET province = NULL, updated_at = now()
 WHERE slug IN ('kiko-rodriguez', 'los-ahijados', 'milka-la-mas-dura');

UPDATE artists
   SET province = NULL,
       birth_place = NULL,
       artist_tags = array_remove(artist_tags, 'diaspora'),
       updated_at = now()
 WHERE slug = 'oro-solido';

UPDATE artists
   SET province = NULL,
       birth_place = NULL,
       birth_year = NULL,
       artist_tags = array_remove(artist_tags, 'diaspora'),
       updated_at = now()
 WHERE slug = 'the-new-york-band';

COMMIT;
