BEGIN;

-- Three record corrections following the instruments/occupations split.
--
-- Alfredo Polonia: 'accordionist' comes out of occupations. His instruments
-- column reads 'guitar', and his genre is plena — a pandereta-and-güiro music,
-- not an accordion music. The accordionist value traces to the same unreliable
-- English biography replaced in 20260905240000, the one that also gave his
-- birthplace as Santiago and his age at death as ninety-five. Guitar is the
-- trustworthy field and the editor has confirmed it. 'musician' takes the
-- vacated slot: he demonstrably plays an instrument, and this is the shape
-- 20260905280000 established — generic practice in occupations, the specific
-- instrument in instruments.
--
-- Fefita la Grande: her instruments array was empty, which left the most
-- important accordionist in merengue típico with no instrument recorded
-- anywhere. 'accordion' is the established spelling. Her occupations keep
-- 'accordionist' — she has no 'musician' to be redundant against, and carrying
-- both the occupation and the instrument is exactly what her peers do
-- (Agapito Pascual, El Rubio Acordeón, Fidelina Pascual, Kerubanda, La Fiera
-- Típica, Raquel Arias all list accordionist in occupations and accordion in
-- instruments). Only the instrument is added; 'voice' is left out because the
-- majority of those peers list the accordion alone.
--
-- Magdalena Delgado: 'teacher' moves to 'music educator', the value
-- ROLE_DICTIONARY.md actually defines, matching the change made to Rafaelito
-- Román in 20260905280000. She was the last holder of 'teacher'. Her
-- 'vocalist' entry is untouched and is not a violation — her primary_role is
-- 'musical_director', so nothing repeats.

UPDATE artists
SET occupations = '["composer","musician"]'::jsonb,
    updated_at = now()
WHERE id = '3b6f60a1-2baa-4e2c-acec-452c5b026397';  -- Alfredo Polonia

UPDATE artists
SET instruments = ARRAY['accordion']::text[],
    updated_at = now()
WHERE id = '9333da06-ad03-44eb-9b81-c21d0ccdd0ea';  -- Fefita la Grande

UPDATE artists
SET occupations = '["vocalist","music educator"]'::jsonb,
    updated_at = now()
WHERE name = 'Magdalena Delgado';

COMMIT;
