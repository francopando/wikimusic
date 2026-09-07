BEGIN;

-- Ángel Viloria, El Prodigio and Rafaelito Román: the accordion moves out of
-- occupations and into the instruments column, where instruments belong.
--
-- These three carried both the generic 'musician' and the specific
-- 'accordionist' in occupations. The redundancy is resolved by keeping
-- 'musician' as the professional practice and letting the dedicated
-- instruments array carry the instrument, which is what that column is for and
-- how the catalogue already works: instruments holds nouns such as accordion,
-- guitar, voice, tambora and güira, with 'accordion' the established spelling
-- across eight records.
--
-- Not applied to the other accordionists in the catalogue. Fefita la Grande,
-- Agapito Pascual, El Rubio Acordeón, Fidelina Pascual, Kerubanda, La Fiera
-- Típica and Raquel Arias carry 'accordionist' in occupations WITHOUT
-- 'musician', so there is no redundancy to resolve and the value is doing real
-- work as their only instrumental signal. 'accordionist' remains a listed
-- occupation in ROLE_DICTIONARY.md and is not being deprecated here.
--
-- Ángel Viloria and Rafaelito Román already list accordion among their
-- instruments, so only El Prodigio gains a value; his instruments array was
-- empty.
--
-- Rafaelito Román additionally moves 'teacher' to 'music educator'. 'teacher'
-- is not in ROLE_DICTIONARY.md, which distinguishes 'music educator' for
-- institutional or sustained teaching from 'vocal coach' for voice work. The
-- stored form is two words with a space, matching Lorens Salcedo and Vicente
-- Mercedes, and it renders through the existing music_educator key in both
-- locales. Surviving values keep their original relative order.

UPDATE artists
SET occupations = '["bandleader","composer","musician"]'::jsonb,
    updated_at = now()
WHERE name = 'Ángel Viloria y su Conjunto Típico Cibaeño';

UPDATE artists
SET occupations = '["bandleader","composer","musician"]'::jsonb,
    instruments = ARRAY['accordion']::text[],
    updated_at = now()
WHERE name = 'El Prodigio';

UPDATE artists
SET occupations = '["composer","arranger","bandleader","music educator","musician"]'::jsonb,
    updated_at = now()
WHERE name = 'Rafaelito Román';

COMMIT;
