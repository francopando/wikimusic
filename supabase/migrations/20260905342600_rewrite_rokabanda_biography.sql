BEGIN;

-- Rewrite the catalogue entry for Rokabanda.
--
-- Rokabanda. Filler in both languages and no founding year, on a group whose
-- founding is one of the better documented events in nineties merengue.
--
-- ADDED: birth_year 1992, the founding year, which is how this catalogue dates
-- a group.
--
-- SOURCES: English Wikipedia's Kinito Mendez article -- he co-founded La
-- Cocoband in 1988 with Alfonzo "Pochy Familia" Vasquez and Bobby Rafael, left
-- in early 1992 with Bobby Rafael to start Rokabanda, which won Orquesta
-- Revelacion del Ano at the Premios Casandra in 1993, and produced El Bacano,
-- El Nonito and Los Hombres Maduros before his solo El Hombre Merengue in 1995.
-- Los Clasicos RD, which adds the manager and the label: the group was formed
-- after the two men left La Cocoband, "con Johnny Montano y Alegro
-- Productions"; Discogs spells the label Allegro Productions CXA on the sleeve
-- of 100% Comercial. Discogs also lists the group's members as Bobby Rafael and
-- Kinito Mendez. MusicBrainz holds three albums -- Elegidos por el pueblo
-- (1993), Reelegidos!!! (1994), 100% comercial (1996) -- and AllMusic and
-- Spotify carry more: Solida (1995), Merengue y Mas (1998) and numbered volumes
-- up to Rokabanda Vol. 8, which is how the group is known to have gone on
-- recording after Mendez left. Titles from 100% Comercial: Corio, El Concon,
-- Dominicano, Y Siempre Seras Tu, La Lenguita, Mami, Las Ninas de 13, Hazlo Tu.
-- SALSARENGUE's transfer of El Concon credits the vocal to Bobby Rafael. Wilson Adames's transfer
-- of La Muchachita from Elegidos por el pueblo, whose on-screen credits give
-- composer and arranger Kinito Mendez and the vocal to Bobby Rafael. DJ
-- Intokable's 1993 transfers of Los Piropos, Tanto Que Tu Dice, Esa Mujer
-- Abraza Mi Vida and El Tamarindo. Los Clasicos RD's footage of the group live
-- at Altos de Chavon in 1993. Kinito Mendez's own Instagram, still announcing
-- nights of Rokabanda material and still addressing the audience as
-- "rokabandero".
--
-- AWARD: added separately, in the migration that follows this one, as a row in
-- artist_awards -- Premios Casandra, Orquesta Revelacion del Ano, 1993. Both
-- the award and the category already existed in the reference tables.
--
-- NOT LINKED: Bobby Rafael and Johnny Montano, who have no entries yet.
--
-- Applied directly over DATABASE_URL as part of an editorial pass. No Vercel
-- function ran and nothing was revalidated; the profile reaches the public site
-- on its own within the seven-day ISR fallback, or sooner if a batch sweep is
-- run at the end of the pass.
--
-- This file reproduces the change from the pre-pass state. Both it and its
-- rollback were generated from state captured live either side of the write,
-- not reconstructed afterwards.

UPDATE artists SET
       name = 'Rokabanda',
       sort_name = 'Rokabanda',
       type = 'group',
       status = 'published',
       gender = 'group',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'merengue-orquesta',
       date_of_birth = NULL,
       birth_year = 1992,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['La Rokabanda']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican merengue orchestra founded in 1992 by Kinito Méndez and Bobby Rafael',
       bio_en = 'Rokabanda was a Dominican merengue orchestra founded in 1992 by Kinito Méndez and Bobby Rafael, the year they walked out of Pochy y su Cocoband. It took the Orquesta Revelación del Año prize at the Premios Casandra in its first full season.

**Leaving the coconut**

Méndez and Bobby Rafael had helped build Cocoband from its first lineup, and Méndez had written and arranged much of what made that band famous. Starting again from nothing, with Johnny Montaño managing and Alegró Productions behind them, was a bet that the songs had been the reason rather than the badge on the bass drum.

The bet paid immediately. The debut album was called Elegidos por el pueblo — elected by the people — and the follow-up was called Reelegidos!!! The two titles are a campaign in miniature, borrowed from Dominican electoral language and aimed at an audience that hears that language every four years.

**The records**

Elegidos por el pueblo carried La Muchachita, Los Piropos, Tanto Que Tú Dice, Esa Mujer Abraza Mi Vida and El Tamarindo. Méndez wrote and arranged; Bobby Rafael sang lead on much of it. Reelegidos!!! followed, and 100% comercial after that.

El Bacano, El Ñoñito and Los Hombres Maduros are the titles that outlived the decade. They are built the way Méndez built everything — a chorus that a crowd can sing back after one hearing, a comic character sketched in two lines, and a horn section that never lets the tempo sag.

**Bobby Rafael keeps it open**

Méndez left to record under his own name, and El Hombre Merengue in 1995 turned him into one of the biggest merengue acts of the decade. The band did not close when he went. Bobby Rafael carried it on as lead voice through Sólida, 100% Comercial — Corio, El Concón, Dominicano, La Lenguita — and Merengue y Más, and the catalogue runs to at least eight numbered volumes.

Méndez still programmes nights of Rokabanda material and still calls the people who come to them rokabanderos, which is the fan name the group left behind.',
       bio_es = 'Rokabanda fue una orquesta de merengue dominicana fundada en 1992 por Kinito Méndez y Bobby Rafael, el año en que los dos se fueron de Pochy y su Cocoband. Se llevó el premio a Orquesta Revelación del Año en los Premios Casandra en su primera temporada completa.

**Salir del coco**

Méndez y Bobby Rafael habían ayudado a levantar la Cocoband desde su primera formación, y Méndez había escrito y arreglado buena parte de lo que hizo famosa a esa banda. Empezar otra vez desde cero, con Johnny Montaño de mánager y Alegró Productions detrás, era apostar a que la razón habían sido las canciones y no el nombre pintado en el bombo.

La apuesta pagó de una vez. El disco de estreno se llamó Elegidos por el pueblo, y el siguiente se llamó Reelegidos!!! Los dos títulos son una campaña en miniatura, tomados del lenguaje electoral dominicano y dirigidos a un público que oye ese lenguaje cada cuatro años.

**Los discos**

Elegidos por el pueblo traía La Muchachita, Los Piropos, Tanto Que Tú Dice, Esa Mujer Abraza Mi Vida y El Tamarindo. Méndez componía y arreglaba; Bobby Rafael llevaba la voz principal en buena parte. Después vino Reelegidos!!!, y detrás 100% comercial.

El Bacano, El Ñoñito y Los Hombres Maduros son los títulos que sobrevivieron a la década. Están armados como Méndez armaba todo: un coro que la gente devuelve cantando después de oírlo una vez, un personaje cómico dibujado en dos líneas, y una sección de metales que no deja caer el tiempo.

**Bobby Rafael la mantiene abierta**

Méndez se fue a grabar con su propio nombre, y El Hombre Merengue, en 1995, lo convirtió en uno de los merengueros más grandes de la década. La banda no cerró cuando él se fue. Bobby Rafael la siguió llevando como voz principal por Sólida, 100% Comercial —Corio, El Concón, Dominicano, La Lenguita— y Merengue y Más, y el catálogo llega por lo menos hasta ocho volúmenes numerados.

Méndez todavía anuncia noches de material de Rokabanda y todavía le dice rokabanderos a la gente que va, que es el nombre de público que dejó el grupo.',
       updated_at = now()
 WHERE slug = 'rokabanda';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rokabanda')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rokabanda')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rokabanda was a Dominican merengue orchestra founded in 1992 by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c73737c2-0106-4a87-8dbe-5f1650d34342","displayText":"Kinito Méndez","occurrenceId":"84e9318c-f229-42a2-8ab0-1e4976e7dac6"}},{"text":" and Bobby Rafael, the year they walked out of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"001831dd-3baa-4512-88f5-f420ec7c2619","displayText":"Pochy y su Cocoband","occurrenceId":"64b84306-56b9-4535-b8f3-4aac8b56328d"}},{"text":". It took the Orquesta Revelación del Año prize at the Premios Casandra in its first full season.","type":"text"}]},{"type":"paragraph","content":[{"text":"Leaving the coconut","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Méndez and Bobby Rafael had helped build Cocoband from its first lineup, and Méndez had written and arranged much of what made that band famous. Starting again from nothing, with Johnny Montaño managing and Alegró Productions behind them, was a bet that the songs had been the reason rather than the badge on the bass drum.","type":"text"}]},{"type":"paragraph","content":[{"text":"The bet paid immediately. The debut album was called Elegidos por el pueblo — elected by the people — and the follow-up was called Reelegidos!!! The two titles are a campaign in miniature, borrowed from Dominican electoral language and aimed at an audience that hears that language every four years.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Elegidos por el pueblo carried La Muchachita, Los Piropos, Tanto Que Tú Dice, Esa Mujer Abraza Mi Vida and El Tamarindo. Méndez wrote and arranged; Bobby Rafael sang lead on much of it. Reelegidos!!! followed, and 100% comercial after that.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Bacano, El Ñoñito and Los Hombres Maduros are the titles that outlived the decade. They are built the way Méndez built everything — a chorus that a crowd can sing back after one hearing, a comic character sketched in two lines, and a horn section that never lets the tempo sag.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bobby Rafael keeps it open","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Méndez left to record under his own name, and El Hombre Merengue in 1995 turned him into one of the biggest merengue acts of the decade. The band did not close when he went. Bobby Rafael carried it on as lead voice through Sólida, 100% Comercial — Corio, El Concón, Dominicano, La Lenguita — and Merengue y Más, and the catalogue runs to at least eight numbered volumes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Méndez still programmes nights of Rokabanda material and still calls the people who come to them rokabanderos, which is the fan name the group left behind.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'rokabanda'), 3)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rokabanda fue una orquesta de merengue dominicana fundada en 1992 por ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c73737c2-0106-4a87-8dbe-5f1650d34342","displayText":"Kinito Méndez","occurrenceId":"fe35b0a7-c6c7-4d7e-986e-dd684d835147"}},{"text":" y Bobby Rafael, el año en que los dos se fueron de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"001831dd-3baa-4512-88f5-f420ec7c2619","displayText":"Pochy y su Cocoband","occurrenceId":"8cc2905e-93a1-451e-9a6a-1ec6d910bfda"}},{"text":". Se llevó el premio a Orquesta Revelación del Año en los Premios Casandra en su primera temporada completa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salir del coco","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Méndez y Bobby Rafael habían ayudado a levantar la Cocoband desde su primera formación, y Méndez había escrito y arreglado buena parte de lo que hizo famosa a esa banda. Empezar otra vez desde cero, con Johnny Montaño de mánager y Alegró Productions detrás, era apostar a que la razón habían sido las canciones y no el nombre pintado en el bombo.","type":"text"}]},{"type":"paragraph","content":[{"text":"La apuesta pagó de una vez. El disco de estreno se llamó Elegidos por el pueblo, y el siguiente se llamó Reelegidos!!! Los dos títulos son una campaña en miniatura, tomados del lenguaje electoral dominicano y dirigidos a un público que oye ese lenguaje cada cuatro años.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Elegidos por el pueblo traía La Muchachita, Los Piropos, Tanto Que Tú Dice, Esa Mujer Abraza Mi Vida y El Tamarindo. Méndez componía y arreglaba; Bobby Rafael llevaba la voz principal en buena parte. Después vino Reelegidos!!!, y detrás 100% comercial.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Bacano, El Ñoñito y Los Hombres Maduros son los títulos que sobrevivieron a la década. Están armados como Méndez armaba todo: un coro que la gente devuelve cantando después de oírlo una vez, un personaje cómico dibujado en dos líneas, y una sección de metales que no deja caer el tiempo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bobby Rafael la mantiene abierta","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Méndez se fue a grabar con su propio nombre, y El Hombre Merengue, en 1995, lo convirtió en uno de los merengueros más grandes de la década. La banda no cerró cuando él se fue. Bobby Rafael la siguió llevando como voz principal por Sólida, 100% Comercial —Corio, El Concón, Dominicano, La Lenguita— y Merengue y Más, y el catálogo llega por lo menos hasta ocho volúmenes numerados.","type":"text"}]},{"type":"paragraph","content":[{"text":"Méndez todavía anuncia noches de material de Rokabanda y todavía le dice rokabanderos a la gente que va, que es el nombre de público que dejó el grupo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'rokabanda'), 2)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rokabanda') AND locale = 'en'), '64b84306-56b9-4535-b8f3-4aac8b56328d', 'artist', '001831dd-3baa-4512-88f5-f420ec7c2619');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rokabanda') AND locale = 'en'), '84e9318c-f229-42a2-8ab0-1e4976e7dac6', 'artist', 'c73737c2-0106-4a87-8dbe-5f1650d34342');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rokabanda') AND locale = 'es'), '8cc2905e-93a1-451e-9a6a-1ec6d910bfda', 'artist', '001831dd-3baa-4512-88f5-f420ec7c2619');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rokabanda') AND locale = 'es'), 'fe35b0a7-c6c7-4d7e-986e-dd684d835147', 'artist', 'c73737c2-0106-4a87-8dbe-5f1650d34342');

COMMIT;
