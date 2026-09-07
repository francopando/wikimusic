BEGIN;

-- Rewrite the catalogue entry for Jankobow.
--
-- Jankobow. Filler in English, nothing in Spanish, no dates, no real name -- on
-- an artist whose own channel publishes all three.
--
-- ADDED: real name Jean Carlos Nami Encarnacion, date of birth 8 December 1998,
-- the alias El Criminal, and rapper alongside composer in occupations.
--
-- CORRECTED: primary_genre urbano -> urban-dembow. Every record of his is a
-- dembow and the DJ pools that carry him file him there.
--
-- LEFT ALONE: province "Distrito Nacional" and birth_place "Santo Domingo" --
-- here the default happens to be right. His own channel says he was born in
-- Santo Domingo.
--
-- SOURCES: his own YouTube channel biography: "Jean Carlos Nami Encarnacion
-- (nacido el 08 de Diciembre de 1998 en Santo Domingo, Republica Dominicana),
-- mejor conocido como 'Jankobow' es un artista urbano..." -- and the channel
-- handle itself, @LlegoElCriminal. Cachicha, 13 July 2022, giving the same
-- legal name and saying he made his name with Guin Guin Remix. MusicBrainz for
-- the singles Guin Guin (Remix Oficial), 18 August 2018, and Bam Bam, 8 April
-- 2019. Spotify for the album Llego El Criminal, 2019, seven tracks in under
-- seventeen minutes: Bam Bam, Ella Dice, Sacando La Lengua, Bolita, Tepe. His
-- own videos for Lo Delincuente, produced by La Grena, and Tu Ta Loco, and
-- Gaana for Beautiful Girls with Flako Stik. DJ pool listings from 2019 that
-- carry Bam Bam at 118 bpm.
--
-- NOT WRITTEN, and it is deliberate: the armed incident with Rochy RD that
-- Dominican outlets covered in July 2022. The same decision was taken for
-- Omega's documented arrests -- these are court and police matters, not musical
-- work, and the catalogue does not carry them.
--
-- NOT LINKED: Flako Stik and La Grena have no entries.
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
       name = 'Jankobow',
       sort_name = 'Jankobow',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1998-12-08',
       birth_year = 1998,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Jean',
       middle_name = 'Carlos',
       last_name = 'Nami',
       second_last_name = 'Encarnación',
       stage_name = 'Jankobow',
       aliases = ARRAY['El Criminal', 'Jean Carlos Nami Encarnación']::text[],
       occupations = '["rapper","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@LlegoElCriminal',
       facebook = 'jankobowoficial',
       instagram = 'jankobow',
       disambiguation = 'Dominican dembow artist, born Jean Carlos Nami Encarnación in 1998',
       bio_en = 'Jankobow is a Dominican dembow artist, born Jean Carlos Nami Encarnación in Santo Domingo on 8 December 1998. He also records as El Criminal.

**Guin Guin**

The remix of Guin Guin, in August 2018, is what made his name. Bam Bam followed the next April and became the track the DJ pools picked up — it circulated at a hundred and eighteen beats a minute, which is the tempo the genre settled on and the reason it works in a set beside anything else.

He was nineteen when the first of those came out. Dembow is a young man’s genre in a very literal sense: the equipment is cheap, the platform is free, and a track that catches is heard in a week.

**Llegó El Criminal**

The 2019 album runs seven tracks in under seventeen minutes — Bam Bam, Ella Dice, Sacando La Lengua, Bolita, Tepe. That is not a short album by accident. Dembow songs are built to be two minutes long, and an album is a way of releasing seven singles at once.

Lo Delincuente, produced by La Greña, and Tú Ta Loco came after, and Beautiful Girls put him with Flako Stik.

**The name**

El Criminal is the persona and it is worn openly — the YouTube channel is called Llegó El Criminal. Dembow has always traded in a swaggering outlaw voice, the same way Jamaican dancehall and American gangsta rap did before it, and the pose is part of the product.

The music itself is dance music. Whatever the name promises, what the records deliver is a hook and a tempo.',
       bio_es = 'Jankobow es un dembowsero dominicano, nacido Jean Carlos Nami Encarnación en Santo Domingo el 8 de diciembre de 1998. También graba como El Criminal.

**Guin Guin**

El remix de Guin Guin, en agosto de 2018, es lo que le hizo el nombre. Bam Bam salió en abril siguiente y fue el tema que agarraron las pools de DJ: circuló a ciento dieciocho pulsos por minuto, que es el tempo en que se asentó el género y la razón por la que entra en un set al lado de cualquier cosa.

Tenía diecinueve años cuando salió el primero. El dembow es un género de gente joven en un sentido muy literal: el equipo es barato, la plataforma es gratis, y un tema que pega se oye en una semana.

**Llegó El Criminal**

El álbum de 2019 son siete temas en menos de diecisiete minutos: Bam Bam, Ella Dice, Sacando La Lengua, Bolita, Tepe. No es un disco corto por casualidad. Las canciones de dembow están hechas para durar dos minutos, y un álbum es una manera de sacar siete sencillos de una vez.

Después vinieron Lo Delincuente, producida por La Greña, y Tú Ta Loco, y Beautiful Girls lo juntó con Flako Stik.

**El nombre**

El Criminal es el personaje y lo lleva puesto sin disimulo: el canal de YouTube se llama Llegó El Criminal. El dembow siempre ha comerciado con una voz de forajido fanfarrón, igual que el dancehall jamaicano y el gangsta rap estadounidense antes que él, y la pose es parte del producto.

La música en sí es música de baile. Prometa lo que prometa el nombre, lo que entregan los discos es un gancho y un tempo.',
       updated_at = now()
 WHERE slug = 'jankobow';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jankobow')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jankobow')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Jankobow is a Dominican dembow artist, born Jean Carlos Nami Encarnación in Santo Domingo on 8 December 1998. He also records as El Criminal.","type":"text"}]},{"type":"paragraph","content":[{"text":"Guin Guin","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The remix of Guin Guin, in August 2018, is what made his name. Bam Bam followed the next April and became the track the DJ pools picked up — it circulated at a hundred and eighteen beats a minute, which is the tempo the genre settled on and the reason it works in a set beside anything else.","type":"text"}]},{"type":"paragraph","content":[{"text":"He was nineteen when the first of those came out. Dembow is a young man’s genre in a very literal sense: the equipment is cheap, the platform is free, and a track that catches is heard in a week.","type":"text"}]},{"type":"paragraph","content":[{"text":"Llegó El Criminal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The 2019 album runs seven tracks in under seventeen minutes — Bam Bam, Ella Dice, Sacando La Lengua, Bolita, Tepe. That is not a short album by accident. Dembow songs are built to be two minutes long, and an album is a way of releasing seven singles at once.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo Delincuente, produced by La Greña, and Tú Ta Loco came after, and Beautiful Girls put him with Flako Stik.","type":"text"}]},{"type":"paragraph","content":[{"text":"The name","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Criminal is the persona and it is worn openly — the YouTube channel is called Llegó El Criminal. Dembow has always traded in a swaggering outlaw voice, the same way Jamaican dancehall and American gangsta rap did before it, and the pose is part of the product.","type":"text"}]},{"type":"paragraph","content":[{"text":"The music itself is dance music. Whatever the name promises, what the records deliver is a hook and a tempo.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'jankobow'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Jankobow es un dembowsero dominicano, nacido Jean Carlos Nami Encarnación en Santo Domingo el 8 de diciembre de 1998. También graba como El Criminal.","type":"text"}]},{"type":"paragraph","content":[{"text":"Guin Guin","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El remix de Guin Guin, en agosto de 2018, es lo que le hizo el nombre. Bam Bam salió en abril siguiente y fue el tema que agarraron las pools de DJ: circuló a ciento dieciocho pulsos por minuto, que es el tempo en que se asentó el género y la razón por la que entra en un set al lado de cualquier cosa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tenía diecinueve años cuando salió el primero. El dembow es un género de gente joven en un sentido muy literal: el equipo es barato, la plataforma es gratis, y un tema que pega se oye en una semana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Llegó El Criminal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El álbum de 2019 son siete temas en menos de diecisiete minutos: Bam Bam, Ella Dice, Sacando La Lengua, Bolita, Tepe. No es un disco corto por casualidad. Las canciones de dembow están hechas para durar dos minutos, y un álbum es una manera de sacar siete sencillos de una vez.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después vinieron Lo Delincuente, producida por La Greña, y Tú Ta Loco, y Beautiful Girls lo juntó con Flako Stik.","type":"text"}]},{"type":"paragraph","content":[{"text":"El nombre","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Criminal es el personaje y lo lleva puesto sin disimulo: el canal de YouTube se llama Llegó El Criminal. El dembow siempre ha comerciado con una voz de forajido fanfarrón, igual que el dancehall jamaicano y el gangsta rap estadounidense antes que él, y la pose es parte del producto.","type":"text"}]},{"type":"paragraph","content":[{"text":"La música en sí es música de baile. Prometa lo que prometa el nombre, lo que entregan los discos es un gancho y un tempo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'jankobow'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
