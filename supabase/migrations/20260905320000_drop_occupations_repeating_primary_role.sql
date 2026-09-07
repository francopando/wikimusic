BEGIN;

-- Drop occupations that merely restate primary_role.
--
-- EDITORIAL_BIOGRAPHY_FORMAT.md requires that occupations not repeat
-- primary_role, and ROLE_DICTIONARY.md names the singer/vocalist case
-- explicitly: "if primary_role is singer, do not also list singer or vocalist
-- in occupations". Both were violated across the catalogue, not in isolated
-- records — this was the single most common shape in the artists table.
--
-- 234 artists are corrected here. Removals by value:
--   vocalist: 151
--   rapper: 1
--   producer: 10
--   musician: 5
--   composer: 14
--   singer: 43
--   dj: 8
--   instrumentalist: 1
--   arranger: 1
--
-- 66 of them are left with an empty occupations array. No
-- information is lost in those cases: the only values they held were the ones
-- restating primary_role, which still records the same fact. An empty array is
-- an ordinary state here — 185 artists already had one before this ran.
--
-- Written as a single set-based statement rather than 234 explicit
-- updates so it is idempotent: re-running it changes nothing, because rows
-- already cleaned no longer differ from their cleaned form. Array order is
-- preserved through WITH ORDINALITY; surviving values keep their positions.
--
-- Deliberately narrow. Only two things are removed: a value identical to
-- primary_role, and 'vocalist' under a 'singer' primary_role. Near-synonyms
-- that the documents do not name — 'instrumentalist' under 'musician', say —
-- are left alone, because collapsing those is an editorial judgement rather
-- than the mechanical application of a written rule.

UPDATE artists a
SET occupations = COALESCE((
      SELECT jsonb_agg(o ORDER BY ord)
      FROM jsonb_array_elements_text(a.occupations) WITH ORDINALITY AS t(o, ord)
      WHERE o <> a.primary_role
        AND NOT (a.primary_role = 'singer' AND o = 'vocalist')
    ), '[]'::jsonb),
    updated_at = now()
WHERE jsonb_typeof(a.occupations) = 'array'
  AND COALESCE((
      SELECT jsonb_agg(o ORDER BY ord)
      FROM jsonb_array_elements_text(a.occupations) WITH ORDINALITY AS t(o, ord)
      WHERE o <> a.primary_role
        AND NOT (a.primary_role = 'singer' AND o = 'vocalist')
    ), '[]'::jsonb) <> a.occupations;

COMMIT;
