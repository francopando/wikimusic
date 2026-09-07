BEGIN;

-- Record Puyalo Pantera's Premio Lo Nuestro nomination.
--
-- "Bing Bong", credited to Yailin La Más Viral & Puyalo Pantera, was nominated
-- for Mejor Canción Dembow at the Premio Lo Nuestro of 2026. Univision,
-- Billboard (13 January 2026) and Us Weekly (19 February 2026) all publish the
-- category with the same five nominees, and Premio Lo Nuestro's own account
-- names them. He did not win: the reporting and the Dominican reaction to it
-- put the award with "Dem Bow" by Natti Natasha, Nando Boom and Dímelo Flow, so
-- the row is stored with won = false.
--
-- The nomination naming the producer alongside the performer is the reason it
-- is worth recording at all. At that level of the industry the producer is
-- normally invisible on the ballot.
--
-- Both reference rows already exist: the award "Premio Lo Nuestro"
-- (f289c627-…, the id the other six Lo Nuestro rows use) and the category
-- "Best Dembow Song" (d7ec9884-…, until now carrying one Premios Juventud row
-- for Natti Natasha).
--
-- NOTE FOR THE EDITOR: `awards` holds two rows both named "Premio Lo Nuestro" --
-- f289c627-bc9e-48c5-8da3-d8fe3e9b0f60 with six artist_awards rows and
-- 80d6c813-821b-4f3c-9f64-3f2de71ed86c with two, both of Wilfrido Vargas's from
-- 1994. That duplication is a data defect and is deliberately not resolved
-- here; merging them means moving rows and deciding which id is canonical.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
SELECT a.id,
       'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid,
       'd7ec9884-2cdc-4b77-b794-1f7e88aa3cf7'::uuid,
       2026,
       'Bing Bong',
       false,
       'Premio Lo Nuestro 2026 nominees (Univision, Billboard, Us Weekly)'
  FROM artists a
 WHERE a.slug = 'puyalo-pantera'
   AND NOT EXISTS (
       SELECT 1 FROM artist_awards x
        WHERE x.artist_id = a.id
          AND x.award_id = 'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid
          AND x.category_id = 'd7ec9884-2cdc-4b77-b794-1f7e88aa3cf7'::uuid
          AND x.year = 2026);

COMMIT;
