BEGIN;

-- Rewrite the catalogue entry for DJ Mari D.
--
-- DJ Mari D. Rewrite, and a correction: the row said her career had ENDED.
--
-- ended WAS TRUE AND IS NOW FALSE. She is working now. Dominican Nights, the
-- party series she is most associated with, launched at SOB's in New York in
-- March 2026 and has been running since; she is on the line-up for it and for a
-- takeover at Pianos NYC as recently as July 2026, and her own Instagram carries
-- a live booking address. An internal consistency check across the whole table
-- found only two rows where ended is true with no death data at all -- this was
-- one of them.
--
-- primary_genre WAS NULL AND IS NOW urban-dembow. The party she plays bills
-- itself "100% dembow y música Dominicana all night", which is about as
-- unambiguous as a genre statement gets.
--
-- THREE FIELDS HELD THE WRONG KIND OF VALUE.
--
--   youtube  held "https://youtu.be/9N1-ocnQODE" -- a link to a single VIDEO,
--            not a channel. That is not what the field is for and it is cleared.
--   instagram held a full URL where every other row holds a handle. Normalised
--            to "marid.ny".
--   website  held https://marid.world/, which is live and is hers -- the page
--            opens "WELCOME TO THE WORLD OF MARI D". Kept, with the trailing
--            slash dropped.
--
-- THE ALIASES ARE TRIMMED. The row held five: "DJ Mari", "DJ Mari D", "Mari D",
-- "Mariani Diplan" and "Marid.ny". The second repeats the name field, the fourth
-- repeats the legal name already in first_name and last_name, and the fifth is
-- the Instagram handle, which is stored in its own column. Two survive.
--
-- WHAT THE OLD TEXT DID THAT THIS DOES NOT. It spent three paragraphs asserting
-- how proud she is of her heritage and how she "chooses to show up" for
-- communities -- promotional language, unsourced, and about her character rather
-- than her work. What is verifiable is where she plays and what she plays, and
-- that is what is here.
--
-- NOTHING IS FILLED THAT COULD NOT BE CHECKED: date_of_birth and birth_year stay
-- empty, occupations stays empty because dj is already the primary_role, and
-- birth_place stays "El Bronx" with province "Nacido en el Exterior", which is
-- the convention this catalogue uses for the twenty-two artists born outside the
-- country.
--
-- SOURCES: her own Instagram, her own site at marid.world, SOB's own
-- announcements of the Dominican Nights series from March 2026 onward, a Pianos
-- NYC line-up post from July 2026, and listings for Dominican Day and RD AYITI
-- events. The DJs she rotates with on those bills -- DJ Alaska, DJ Mangú Mami,
-- Geerelis, JFuse, DJ Synchro, DJ Ultraviolet -- are named in the note rather
-- than the prose because nothing establishes which of them are Dominican.
--
-- NOT LINKED: nobody in this entry has an entry.
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
       name = 'DJ Mari D',
       sort_name = 'Mari D, DJ',
       type = 'solo_artist',
       status = 'published',
       gender = 'female',
       ended = FALSE,
       primary_role = 'dj',
       primary_genre = 'urban-dembow',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'El Bronx',
       province = 'Nacido en el Exterior',
       first_name = 'Mariani',
       middle_name = NULL,
       last_name = 'Diplan',
       second_last_name = NULL,
       stage_name = 'DJ Mari D',
       aliases = ARRAY['DJ Mari', 'Mari D']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY['turntables']::text[],
       genres = ARRAY['urban-rap-hip-hop', 'urbano']::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = 'https://marid.world',
       youtube = NULL,
       facebook = NULL,
       instagram = 'marid.ny',
       disambiguation = 'Dominican-American DJ from the Bronx; resident of the Dominican Nights series in New York',
       bio_en = 'DJ Mari D, born Mariani Diplan, is a Dominican-American DJ from the Bronx. She plays dembow and Dominican music in New York, and she is one of the residents of the party series that has made that a category of its own.

**Dominican Nights**

Dominican Nights started at SOB’s in 2026 and bills itself with no hedging at all: a hundred per cent dembow and Dominican music, all night. She is on the rotating line-up, and the series has since spread to other rooms in the city.

That is a more interesting development than it sounds. New York has had Dominican nightlife for fifty years, but it ran on merengue and bachata, in Dominican-owned rooms, for a Dominican crowd. A dembow-only night at a downtown venue with a booking policy is a different proposition: the music is being programmed as a scene rather than served as a community function.

**The Bronx and the island**

She was born and raised in the Bronx, which puts her in the second-generation position that has produced a great deal of Dominican music without producing much Dominican-music writing about it.

A DJ in that position is doing something the recording artists are not. She is deciding, night after night, which Dominican records a New York room hears, which order they come in, and what they get mixed with. That is curation with immediate consequences, and it is why the party series and not a discography is the thing to describe.

She keeps her own site and takes her own bookings. There is no label, no manager’s name on the flyers and no press. What there is is a working diary, and it is full.',
       bio_es = 'DJ Mari D, de nombre Mariani Diplan, es DJ dominicano-estadounidense del Bronx. Pone dembow y música dominicana en Nueva York, y es una de las residentes de la serie de fiestas que ha convertido eso en una categoría propia.

**Dominican Nights**

Dominican Nights empezó en SOB’s en 2026 y se anuncia sin matices: cien por ciento dembow y música dominicana, toda la noche. Ella está en la nómina rotativa, y la serie se ha ido extendiendo a otros salones de la ciudad.

Es un desarrollo más interesante de lo que parece. Nueva York lleva cincuenta años teniendo vida nocturna dominicana, pero funcionaba con merengue y bachata, en locales de dominicanos, para público dominicano. Una noche solo de dembow en un local del downtown con política de contratación es otra cosa: la música se está programando como escena y no sirviéndose como función comunitaria.

**El Bronx y la isla**

Nació y se crió en el Bronx, lo que la pone en esa posición de segunda generación que ha producido muchísima música dominicana sin que se haya escrito casi nada al respecto.

Una DJ en esa posición hace algo que los artistas de disco no hacen. Decide, noche tras noche, qué discos dominicanos oye un salón neoyorquino, en qué orden llegan y con qué se mezclan. Eso es curaduría con consecuencias inmediatas, y por eso lo que hay que describir es la serie de fiestas y no una discografía.

Mantiene su propia página y maneja sus propias contrataciones. No hay sello, no hay nombre de mánager en los flyers y no hay prensa. Lo que hay es una agenda de trabajo, y está llena.',
       updated_at = now()
 WHERE slug = 'dj-mari-d';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-mari-d')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-mari-d')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"DJ Mari D, born Mariani Diplan, is a Dominican-American DJ from the Bronx. She plays dembow and Dominican music in New York, and she is one of the residents of the party series that has made that a category of its own.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican Nights","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dominican Nights started at SOB’s in 2026 and bills itself with no hedging at all: a hundred per cent dembow and Dominican music, all night. She is on the rotating line-up, and the series has since spread to other rooms in the city.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a more interesting development than it sounds. New York has had Dominican nightlife for fifty years, but it ran on merengue and bachata, in Dominican-owned rooms, for a Dominican crowd. A dembow-only night at a downtown venue with a booking policy is a different proposition: the music is being programmed as a scene rather than served as a community function.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Bronx and the island","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She was born and raised in the Bronx, which puts her in the second-generation position that has produced a great deal of Dominican music without producing much Dominican-music writing about it.","type":"text"}]},{"type":"paragraph","content":[{"text":"A DJ in that position is doing something the recording artists are not. She is deciding, night after night, which Dominican records a New York room hears, which order they come in, and what they get mixed with. That is curation with immediate consequences, and it is why the party series and not a discography is the thing to describe.","type":"text"}]},{"type":"paragraph","content":[{"text":"She keeps her own site and takes her own bookings. There is no label, no manager’s name on the flyers and no press. What there is is a working diary, and it is full.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dj-mari-d'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"DJ Mari D, de nombre Mariani Diplan, es DJ dominicano-estadounidense del Bronx. Pone dembow y música dominicana en Nueva York, y es una de las residentes de la serie de fiestas que ha convertido eso en una categoría propia.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican Nights","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dominican Nights empezó en SOB’s en 2026 y se anuncia sin matices: cien por ciento dembow y música dominicana, toda la noche. Ella está en la nómina rotativa, y la serie se ha ido extendiendo a otros salones de la ciudad.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es un desarrollo más interesante de lo que parece. Nueva York lleva cincuenta años teniendo vida nocturna dominicana, pero funcionaba con merengue y bachata, en locales de dominicanos, para público dominicano. Una noche solo de dembow en un local del downtown con política de contratación es otra cosa: la música se está programando como escena y no sirviéndose como función comunitaria.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Bronx y la isla","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nació y se crió en el Bronx, lo que la pone en esa posición de segunda generación que ha producido muchísima música dominicana sin que se haya escrito casi nada al respecto.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una DJ en esa posición hace algo que los artistas de disco no hacen. Decide, noche tras noche, qué discos dominicanos oye un salón neoyorquino, en qué orden llegan y con qué se mezclan. Eso es curaduría con consecuencias inmediatas, y por eso lo que hay que describir es la serie de fiestas y no una discografía.","type":"text"}]},{"type":"paragraph","content":[{"text":"Mantiene su propia página y maneja sus propias contrataciones. No hay sello, no hay nombre de mánager en los flyers y no hay prensa. Lo que hay es una agenda de trabajo, y está llena.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'dj-mari-d'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
