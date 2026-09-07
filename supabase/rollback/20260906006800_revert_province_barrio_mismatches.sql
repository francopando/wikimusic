BEGIN;

-- Undo 20260906006800. Keyed on slugs, restoring each row to the province it
-- carried before the sweep.

UPDATE artists SET province = 'Distrito Nacional', updated_at = now()
 WHERE slug IN ('shadow-blow', 'tokischa', 'wason-brazoban', 'shelow-shaq');

UPDATE artists SET province = 'Santo Domingo', updated_at = now()
 WHERE slug IN ('jose-alberto-el-canario', 'sexappeal');

COMMIT;
