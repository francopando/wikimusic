BEGIN;

-- Merengue típico accordionists: primary_role 'musician' -> 'singer'.
--
-- Dominican merengue típico / perico ripiao artists are singers first and
-- accordionists second unless there is an explicit reason to say otherwise:
-- they front the conjunto with their voice and play the accordion while doing
-- it. Six records sat on 'musician' against that convention. Fefita la Grande
-- was a seventh and was corrected in 20260905180000.
--
-- The stored data could not have told us this and should not be used to infer
-- it — before this change the eleven artists carrying 'accordionist' in
-- occupations split six 'musician' to four 'singer'. The convention is
-- editorial. The catalogue at large agrees anyway: 572 of 623 artists are
-- 'singer', and among groups it is 67 of 73, Ángel Viloria y su Conjunto
-- Típico Cibaeño included — which is why Kerubanda, the one group in this set,
-- is treated the same as the five solo artists.
--
-- occupations is corrected in the same pass, because moving primary_role to
-- 'singer' would otherwise create the exact repetition ROLE_DICTIONARY.md
-- forbids by name:
--   * 'singer' and 'vocalist' come out — they now repeat primary_role.
--   * the general 'musician' comes out where 'accordionist' is already
--     present; the dictionary asks for the specific instrument when it is
--     known. Three of these records (Agapito Pascual, Alfredo Polonia,
--     Fidelina Pascual) were additionally repeating 'musician' against a
--     primary_role of 'musician', which was already a violation.
-- Surviving values keep their original relative order.

UPDATE artists SET primary_role = 'singer',
  occupations = '["accordionist","bandleader","composer","songwriter"]'::jsonb,
  updated_at = now()
WHERE name = 'Agapito Pascual';

UPDATE artists SET primary_role = 'singer',
  occupations = '["accordionist","composer"]'::jsonb,
  updated_at = now()
WHERE name = 'Alfredo Polonia';

UPDATE artists SET primary_role = 'singer',
  occupations = '["accordionist","composer","bandleader"]'::jsonb,
  updated_at = now()
WHERE name = 'El Rubio Acordeón';

UPDATE artists SET primary_role = 'singer',
  occupations = '["accordionist","bandleader"]'::jsonb,
  updated_at = now()
WHERE name = 'Fidelina Pascual';

UPDATE artists SET primary_role = 'singer',
  occupations = '["accordionist","bandleader"]'::jsonb,
  updated_at = now()
WHERE name = 'Kerubanda';

UPDATE artists SET primary_role = 'singer',
  occupations = '["accordionist","bandleader"]'::jsonb,
  updated_at = now()
WHERE name = 'La Fiera Típica';

COMMIT;
