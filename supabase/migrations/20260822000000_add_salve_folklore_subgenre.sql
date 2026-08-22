BEGIN;

-- Salve is a distinct Dominican sung religious folk form and had no slot in the
-- genre taxonomy, so artists carrying it — Enerolisa Núñez, the form's foremost
-- interpreter, among them — could only be filed under the generic `folklore`
-- parent. It sits alongside palos/atabales and raíz rather than inside them.
--
-- parent_id is resolved by slug rather than hardcoded, and sort_order follows
-- the existing folklore children (carabiné 1, palos 2, raíz 3, son 4).
INSERT INTO genres (name, slug, description, parent_id, level, sort_order, active)
SELECT
  'Salve',
  'folklore-salve',
  'Dominican sung religious folk form',
  parent.id,
  1,
  5,
  true
FROM genres AS parent
WHERE parent.slug = 'folklore'
  AND NOT EXISTS (SELECT 1 FROM genres WHERE slug = 'folklore-salve');

-- Re-tag the artists whose `salve` style value was dropped when non-taxonomy
-- values were cleared, now that the term has a canonical slug. Luis Kalaff is a
-- merengue composer with salve in his repertoire, so it stays a secondary style.
UPDATE artists
SET genres = array_append(genres, 'folklore-salve'),
    updated_at = now()
WHERE slug = 'luis-kalaff'
  AND NOT ('folklore-salve' = ANY(genres));

-- Enerolisa Núñez is the form's foremost interpreter, so salve is her primary
-- classification rather than a secondary style. The generic `folklore` parent
-- understated her; the subgenre rollup on the genre page means she still
-- surfaces under Folklore as well as under Salve. Removing the value from
-- genres[] keeps the rule that a style must not restate primary_genre.
UPDATE artists
SET primary_genre = 'folklore-salve',
    genres = array_remove(genres, 'folklore-salve'),
    updated_at = now()
WHERE slug = 'enerolisa-nunez';

COMMIT;
