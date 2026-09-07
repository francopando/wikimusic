BEGIN;

-- Undo 20260906006000. Both statements are keyed on exact slugs, because the
-- forward migration collapsed three spellings into one and a blanket reverse
-- update could not tell them apart afterwards.

UPDATE artists SET birth_place = 'Los Mina', updated_at = now()
 WHERE slug IN ('david-kada', 'la-ross-maria', 'keren-montero');

UPDATE artists SET birth_place = 'Los Mina, Santo Domingo', updated_at = now()
 WHERE slug IN ('x3mo', 'lapiz-conciente');

UPDATE artists SET province = 'Distrito Nacional', updated_at = now()
 WHERE slug = 'toxic-crow';

COMMIT;
