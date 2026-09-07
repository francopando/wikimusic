BEGIN;

-- Record that Ismael Bueno is Álex Bueno's brother.
--
-- Ismael Bueno's catalogue record carried nothing that connected him to the
-- singer he is a brother of, which is the fact that identifies him. Dominican
-- musicians said it publicly and repeatedly after Álex Bueno's death in June
-- 2026: Pavel Núñez and Richard Francisco both posted the same home video of
-- the two men singing together in the house, captioned "Alex Bueno disfrutaba
-- mucho de cantar, ahí lo vemos con su hermano Ismael Bueno que es tremendo
-- cantante", and Salserísimo Perú and República Merengue carried the same clip.
-- Coverage of the official tribute ceremony names the speakers as the Minister
-- of Culture Roberto Ángel Salcedo, Fátima Guzmán, and "Ismael Bueno, hermano
-- del artista". The two also recorded the duet Eso Eres Tú together.
--
-- One row. artist_family_relationships stores each relationship once: pair_low
-- and pair_high are generated from the two ids and a unique constraint on that
-- ordered pair rejects the mirror row.
--
-- A third brother, Felipe Bueno, is named by Dominican pages and has no entry
-- in the catalogue yet.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO artist_family_relationships (artist_id, related_artist_id, relationship_type)
SELECT a.id, i.id, 'sibling'
  FROM artists a, artists i
 WHERE a.slug = 'alex-bueno'
   AND i.slug = 'ismael-bueno'
   AND NOT EXISTS (
       SELECT 1 FROM artist_family_relationships x
        WHERE x.pair_low = LEAST(a.id, i.id)
          AND x.pair_high = GREATEST(a.id, i.id));

COMMIT;
