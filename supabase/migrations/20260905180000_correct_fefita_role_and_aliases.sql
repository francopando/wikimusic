BEGIN;

-- Fefita la Grande — occupations and aliases.
--
-- primary_role stays 'singer'. Dominican merengue típico / perico ripiao
-- artists are singers first and accordionists second unless there is an
-- explicit reason to say otherwise: they front the conjunto with their voice
-- and play the accordion while doing it. Fefita is no exception.
--
-- Recording that here because the stored data does not show it cleanly. Of the
-- eleven artists carrying 'accordionist' in occupations, six sit on
-- primary_role 'musician' and four on 'singer', so the column cannot be used
-- to infer the convention — the convention is editorial, and it is 'singer'.
-- The catalogue at large agrees: 572 of 623 artists are 'singer'.
--
-- 'accordionist' is in any case not available as a primary_role. That column
-- runs on a coarser vocabulary — singer, instrumentalist, musician, producer,
-- composer, rapper, dj, arranger, musical_director, lyricist — and
-- 'accordionist' appears eleven times as an occupation and never once as a
-- primary_role. Introducing it would invent a primary_role value, which Rule 6
-- in CLAUDE.md forbids, and would drop her out of any facet reading that
-- column.
--
-- occupations drops 'vocalist', which repeated primary_role 'singer' and is
-- forbidden by name in ROLE_DICTIONARY.md, and drops the general 'musician' in
-- favour of the specific 'accordionist' the dictionary asks for when the
-- instrument is known. It plainly is. This leaves the same shape Raquel Arias
-- and El Prodigio carry.
--
-- aliases carried "Manuela Josefa Cabrera Taveras", surnames reversed against
-- the sort_name and biography set in 20260905160000. She carries the maternal
-- surname first — Taveras from María Ana Taveras, then Cabrera from Eliseo
-- "Seíto" de Jesús Cabrera Fernández — because her father did not recognise
-- her at birth. Sources differ on the order; this aligns the three fields on
-- the one that comes with a documented explanation, rather than leaving the
-- record contradicting its own biography.
--
-- primary_role is written explicitly rather than left alone so this file is
-- self-contained and lands the same way on any starting state.
--
-- Not changed here: primary_genre is 'merengue' while every comparable típico
-- accordionist in the catalogue (Guandulito, El Prodigio, El Rubio Acordeón,
-- Fidelina Pascual, La Fiera Típica, María Díaz, Raquel Arias) sits under
-- 'merengue-perico-ripiao'. That is a real inconsistency, but it moves her
-- genre-page membership and is left for an explicit editorial decision.

UPDATE artists
SET primary_role = 'singer',
    occupations = '["accordionist","bandleader","composer"]'::jsonb,
    aliases = ARRAY['la Mayimba', 'la Vieja Fefa', 'Manuela Josefa Taveras Cabrera']::text[],
    updated_at = now()
WHERE id = '9333da06-ad03-44eb-9b81-c21d0ccdd0ea';

COMMIT;
