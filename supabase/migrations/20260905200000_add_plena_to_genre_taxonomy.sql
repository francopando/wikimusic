BEGIN;

-- Adds Plena to the genre taxonomy, under Folklore.
--
-- Rule 7 in CLAUDE.md forbids inventing genres, and the taxonomy has been
-- treated as settled since 2026-06-12, so this is a deliberate addition made on
-- editorial instruction rather than an incidental one. It exists because the
-- catalogue has an artist it cannot currently describe: Alfredo Polonia, known
-- as El Padre de la Plena Dominicana, was filed under 'merengue' with a generic
-- 'folklore' secondary, which says nothing about what he actually did.
--
-- Placement under Folklore follows the Son precedent exactly. Son is Cuban in
-- origin, was adapted in the Dominican Republic, and sits at
-- folklore-son-dominicano with the display name "Son" and the English label
-- "Dominican Son". Plena is Puerto Rican in origin — it comes from Ponce, is
-- built on the pandereta, and was historically called the periódico cantado,
-- the sung newspaper, for chronicling working-class life. It was adapted here
-- into plena dominicana. Same shape, same treatment.
--
-- sort_order 6 continues the Folklore run: Carabiné, Palos / Atabales, Raíz,
-- Son, Salve, Plena. legacy_subgenre_id is null, as it is for Salve — there is
-- no pre-taxonomy subgenre this maps back to.
--
-- id is left to the genres_id_seq default rather than hardcoded.
--
-- REQUIRES a matching i18n key or the label falls back to the raw slug, which
-- CLAUDE.md's i18n rule forbids shipping. Added in the same change:
--   messages/en.json  "folklore_plena_dominicana": "Dominican Plena"
--   messages/es.json  "folklore_plena_dominicana": "Plena Dominicana"
-- The key is the slug with hyphens turned to underscores.

INSERT INTO genres (name, slug, description, level, parent_id, sort_order, active, is_home_featured)
VALUES (
  'Plena',
  'folklore-plena-dominicana',
  'Dominican plena, adapted from the Puerto Rican form',
  1,
  11,   -- Folklore
  6,
  true,
  false
)
ON CONFLICT (slug) DO NOTHING;

COMMIT;
