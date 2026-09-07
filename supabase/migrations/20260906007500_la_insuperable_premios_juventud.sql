BEGIN;

-- La Insuperable's Premios Juventud nomination.
--
--   la-insuperable  Premios Juventud  2023  Mejor Colaboración Dembow
--                   "Soy Mamá Remix"  nominated, not won
--
-- Same award, year and category as Kiko el Crazy's Pichirry, loaded earlier in
-- 20260906004600. The award and the category both already exist and nothing new
-- is created here.
--
-- The category went to "Delincuente" by Tokischa, Anuel AA and Ñengo Flow. The
-- other nominees were "Le Doy 20 Mil", "Pichirry", "Súbete A Mi Moto" and
-- "Wapae".
--
-- The remix is credited to La Insuperable with Cardi B, Farina and Yailin la
-- Más Viral. Only La Insuperable's row is created: Cardi B and Farina are not
-- Dominican and do not belong in this catalogue, and Yailin's own participation
-- in this specific nomination is not separately verified against a list naming
-- her as a nominee rather than as a credited performer. If the editor wants the
-- nomination recorded against Yailin as well, it is one more row.
--
-- Source: the nominee list in English Wikipedia's 2023 Premios Juventud
-- article, and Univision's own published list of 13 June 2023.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
VALUES
  ((SELECT id FROM artists WHERE slug = 'la-insuperable'),
   '8304c63b-ff51-40ed-80bb-ea7c4079ca6f',
   'ef5e0c39-06ae-4510-8bdb-8eb75cf5e21d', 2023, 'Soy Mamá Remix', false,
   'Lista de nominados de Univision, 13 de junio de 2023');

COMMIT;
