BEGIN;

-- Rewrite the catalogue entry for N O R M a L.
--
-- N O R M a L. Filler in English, nothing in Spanish, no genre, no real name --
-- for a producer with more than twenty releases.
--
-- primary_role changed from dj to producer. He makes beats; nothing on record
-- shows him playing out as a DJ.
-- GENRE SET to urban-rap-hip-hop; the row had none.
--
-- SOURCES: MusicBrainz, whose disambiguation reads "lo-fi beatmaker" and which
-- carries the legal-name alias Gabriel Ernesto Lopez Valdez along with the whole
-- set of accounts. His Bandcamp, normalofficial, which places him in Santo
-- Domingo and tags the work hip-hop/rap, instrumental hip-hop and lofi hiphop.
-- The release list from MusicBrainz and Bandcamp: the 2018 album "Forrest",
-- then "iwasafool" in 2020, "Better Life", "Isabella", the EP "daytoday" and
-- "meu amor" in 2021, "WorkinOnIt" and the EP "baia" with "baia da vida",
-- "bossalatino", "coracao da praia", "ela e" and "felicidade" in 2022,
-- "reflections" and "shifting" in 2023, "fragments" and "shine on u" in 2024,
-- and "MiSSEDCALL" in September 2025 with chillontwo and Jordanny Gonzalez. His
-- Facebook as "Gabriel Lopez ~ normal", which calls him a Dominican producer.
-- His YouTube, where the lo-fi live sets sit beside Christian instrumentals.
--
-- FLAGGED: the genre. What he makes is instrumental, so filing it under a rap
-- genre is imperfect; his own tags lead with hip-hop and the taxonomy has no
-- instrumental hip hop.
-- FLAGGED: status. Left at needs_review; no image on the row.
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
       name = 'N O R M a L',
       sort_name = 'López, Gabriel Ernesto',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'producer',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Gabriel',
       middle_name = 'Ernesto',
       last_name = 'López',
       second_last_name = 'Valdez',
       stage_name = 'N O R M a L',
       aliases = ARRAY['N o R M a L', 'Gabriel Ernesto López Valdez']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://normalofficial.bandcamp.com',
       youtube = 'https://www.youtube.com/channel/UCb8ICkBRCEJOxl5jGSStSOQ',
       facebook = 'normalrd',
       instagram = 'normalrd',
       disambiguation = 'Dominican lo-fi beatmaker from Santo Domingo; the 2018 album “Forrest”',
       bio_en = 'N O R M a L — Gabriel Ernesto López Valdez — is a Dominican beatmaker and producer from Santo Domingo. He makes instrumental hip hop, and most of it is lo-fi.

**Music with nobody on it**

Lo-fi is built to be played and not listened to: loops soft enough to work or sleep through, deliberately worn, and with no singer at the front. It is the least Dominican-sounding thing a Dominican producer can make, and it travels further than almost anything else because it needs no language.

His first album, Forrest, came in 2018. Since 2020 he has released steadily — iwasafool, Better Life, Isabella and the EP daytoday, then a run through 2022, and reflections, shifting, fragments and shine on u after that.

**The Portuguese year**

For most of 2022 the titles stopped being English. Meu Amor, Baía, Baía da Vida, Coração da Praia, Ela É, Felicidade and a track called simply Bossalatino name what he was doing: bossa nova pulled into the beat.

Brazil is not an obvious place for a Dominican producer to go. Merengue and bachata are loud, fast musics built for a floor, and bossa is the opposite of all three — quiet, unhurried, sung almost under the breath.

**The other channel**

He performs the material live as Travesía Anormal, and alongside the lo-fi he produces Christian instrumentals — reggaetón and orchestral pieces written for worship rather than for listening.

MiSSEDCALL, made in September 2025 with chillontwo and Jordanny González, is the most recent.',
       bio_es = 'N O R M a L —Gabriel Ernesto López Valdez— es un beatmaker y productor dominicano de Santo Domingo. Hace hip hop instrumental, y casi todo es lo-fi.

**Música sin nadie encima**

El lo-fi está hecho para sonar y no para que lo escuchen: loops lo bastante suaves como para trabajar o dormir con ellos, gastados a propósito, y sin cantante al frente. Es lo menos dominicano que puede sonar un productor dominicano, y viaja más lejos que casi cualquier otra cosa porque no necesita idioma.

Su primer álbum, Forrest, salió en 2018. Desde 2020 publica sin parar: iwasafool, Better Life, Isabella y el EP daytoday, después una tanda entera en 2022, y luego reflections, shifting, fragments y shine on u.

**El año en portugués**

Durante casi todo 2022 los títulos dejaron de estar en inglés. Meu Amor, Baía, Baía da Vida, Coração da Praia, Ela É, Felicidade y un tema llamado simplemente Bossalatino nombran lo que estaba haciendo: bossa nova metida dentro del beat.

Brasil no es un destino obvio para un productor dominicano. El merengue y la bachata son músicas fuertes y rápidas hechas para una pista, y la bossa es lo contrario de las tres: callada, sin apuro, cantada casi por debajo del aliento.

**El otro canal**

Toca el material en vivo como Travesía Anormal, y al lado del lo-fi produce instrumentales cristianos: reggaetón y piezas orquestales escritas para la adoración y no para escuchar.

MiSSEDCALL, hecha en septiembre de 2025 con chillontwo y Jordanny González, es lo más reciente.',
       updated_at = now()
 WHERE slug = 'n-o-r-m-a-l';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'n-o-r-m-a-l')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'n-o-r-m-a-l')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"N O R M a L — Gabriel Ernesto López Valdez — is a Dominican beatmaker and producer from Santo Domingo. He makes instrumental hip hop, and most of it is lo-fi.","type":"text"}]},{"type":"paragraph","content":[{"text":"Music with nobody on it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo-fi is built to be played and not listened to: loops soft enough to work or sleep through, deliberately worn, and with no singer at the front. It is the least Dominican-sounding thing a Dominican producer can make, and it travels further than almost anything else because it needs no language.","type":"text"}]},{"type":"paragraph","content":[{"text":"His first album, Forrest, came in 2018. Since 2020 he has released steadily — iwasafool, Better Life, Isabella and the EP daytoday, then a run through 2022, and reflections, shifting, fragments and shine on u after that.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Portuguese year","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"For most of 2022 the titles stopped being English. Meu Amor, Baía, Baía da Vida, Coração da Praia, Ela É, Felicidade and a track called simply Bossalatino name what he was doing: bossa nova pulled into the beat.","type":"text"}]},{"type":"paragraph","content":[{"text":"Brazil is not an obvious place for a Dominican producer to go. Merengue and bachata are loud, fast musics built for a floor, and bossa is the opposite of all three — quiet, unhurried, sung almost under the breath.","type":"text"}]},{"type":"paragraph","content":[{"text":"The other channel","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He performs the material live as Travesía Anormal, and alongside the lo-fi he produces Christian instrumentals — reggaetón and orchestral pieces written for worship rather than for listening.","type":"text"}]},{"type":"paragraph","content":[{"text":"MiSSEDCALL, made in September 2025 with chillontwo and Jordanny González, is the most recent.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'n-o-r-m-a-l'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"N O R M a L —Gabriel Ernesto López Valdez— es un beatmaker y productor dominicano de Santo Domingo. Hace hip hop instrumental, y casi todo es lo-fi.","type":"text"}]},{"type":"paragraph","content":[{"text":"Música sin nadie encima","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El lo-fi está hecho para sonar y no para que lo escuchen: loops lo bastante suaves como para trabajar o dormir con ellos, gastados a propósito, y sin cantante al frente. Es lo menos dominicano que puede sonar un productor dominicano, y viaja más lejos que casi cualquier otra cosa porque no necesita idioma.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su primer álbum, Forrest, salió en 2018. Desde 2020 publica sin parar: iwasafool, Better Life, Isabella y el EP daytoday, después una tanda entera en 2022, y luego reflections, shifting, fragments y shine on u.","type":"text"}]},{"type":"paragraph","content":[{"text":"El año en portugués","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Durante casi todo 2022 los títulos dejaron de estar en inglés. Meu Amor, Baía, Baía da Vida, Coração da Praia, Ela É, Felicidade y un tema llamado simplemente Bossalatino nombran lo que estaba haciendo: bossa nova metida dentro del beat.","type":"text"}]},{"type":"paragraph","content":[{"text":"Brasil no es un destino obvio para un productor dominicano. El merengue y la bachata son músicas fuertes y rápidas hechas para una pista, y la bossa es lo contrario de las tres: callada, sin apuro, cantada casi por debajo del aliento.","type":"text"}]},{"type":"paragraph","content":[{"text":"El otro canal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Toca el material en vivo como Travesía Anormal, y al lado del lo-fi produce instrumentales cristianos: reggaetón y piezas orquestales escritas para la adoración y no para escuchar.","type":"text"}]},{"type":"paragraph","content":[{"text":"MiSSEDCALL, hecha en septiembre de 2025 con chillontwo y Jordanny González, es lo más reciente.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'n-o-r-m-a-l'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
