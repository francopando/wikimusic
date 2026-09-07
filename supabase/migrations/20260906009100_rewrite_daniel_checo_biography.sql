BEGIN;

-- Rewrite the catalogue entry for Daniel Checo.
--
-- Daniel Checo. Filler in English, nothing in Spanish, no genres, no
-- disambiguation -- and a filler paragraph that contradicted the row it sat on,
-- since it said "Born in 1982" while birth_year read 1995.
--
-- THE BIRTH DATE WAS RIGHT AND IS NOW CONFIRMED THREE WAYS. The row already
-- held 29 May 1995. Apple Music's artist page gives 29 May 1995 and
-- MusicBrainz gives a life-span beginning 1995-05-29. Nothing is overwritten;
-- the 1982 in the discarded filler paragraph was simply wrong.
--
-- PRIMARY_GENRE CHANGED, AND THIS IS THE EDITOR'S CALL TO REVERSE. The row said
-- bachata. Everything found says otherwise:
--
--   - the keyword list he himself put on Angelita & Diablita reads
--     "ozuna, bad bunny, daddy, danil, diablita, diabla, mala, toda"
--   - Hey is a cover of a Dejota2021 record, Colombian urban pop, and its
--     keywords name Legarda and Luisa Fernanda W
--   - his own Spotify biography says he started out producing rap
--   - Apple Music files him under R&B/Soul, not under any tropical genre
--   - no source anywhere calls him a bachatero, and no track title, credit or
--     collaborator points at bachata
--
-- primary_genre goes to urbano and genres gets urban-reggaeton. TO REVERT: line
-- `primary_role: 'singer', primary_genre: 'urbano',` in the row block below,
-- and the `genres:` line under it. Genre is the editor's decision and this one
-- is flagged rather than assumed settled.
--
-- THE FACEBOOK HANDLE THAT LOOKED WRONG IS RIGHT. The row stores facebook
-- "djdaniprod", which does not resemble his name and was worth checking before
-- touching. It is his: the page is titled Daniel Checo, and his own YouTube
-- About panel links twitter.com/DjDani_Prod. His earlier videos give
-- instagram.com/djdani.prod as the follow handle and the later ones give
-- danielchecodr. DjDani Prod is his producer name, and it replaces the alias
-- the row held.
--
-- AN ALIAS REMOVED. aliases held ["Hector Daniel Checo Gomez"], which is the
-- legal name already sitting in first_name / middle_name / last_name /
-- second_last_name with the accents stripped -- a duplicate, not another name.
-- It is replaced by DjDani Prod, which is a name he actually goes by.
--
-- A CONFLICT LEFT ALONE. His Facebook page says "De Cleveland Hill, New York".
-- MusicBrainz gives area and begin-area Dominican Republic, his Spotify
-- biography places his childhood in Santiago, his Instagram bio ends in a
-- Dominican flag and the row says Santiago. A Facebook "from" field is
-- self-entered, frequently a joke and never a birthplace, so province and
-- birth_place are not touched. Recorded here so the next pass does not have to
-- rediscover it.
--
-- birth_place stays "Santiago" rather than becoming "Villa Verde, Santiago".
-- The source places his childhood in that barrio, not his birth, and the two
-- are not the same claim.
--
-- SOURCES: his own YouTube channel -- the About panel for the outbound links,
-- and the description of each of the five videos, which carry the release
-- dates, the ℗ lines, the booking contact and the production credits. His own
-- Instagram, for the bio. His own Facebook page, for the employment line
-- "DCM Studios -- Cantante y productor musical" and the tagline "(De Cero a
-- Millonario)". His artist biography on Spotify, which is the only narrative
-- account of him that exists anywhere and is the source for Villa Verde, for
-- the age of thirteen, for Alexander Céspedes and for the founding of the
-- company and the studio. Apple Music for the birth date and the genre tag.
-- MusicBrainz for the birth date and the 2019 single.
--
-- NOT WRITTEN: no follower counts and no listener counts. His pages on the
-- streaming services show very small numbers and none of that is recorded here.
-- Nothing is said about whether his records are still available on any given
-- platform: the logged-out views are unreliable for that and it was not
-- established.
--
-- NOT LINKED. Nobody in this entry has a catalogue entry, so it carries no
-- references at all. Johanzi is Puerto Rican -- his Instagram bio reads
-- "Bayamon Puerto Rico" -- and Dejota2021, Legarda and Luisa Fernanda W are
-- Colombian, so none of the four belongs on the missing-artists list. Alexander
-- Céspedes (Alex Grey), Enmanuel Paredes and Javivi Productions could not be
-- resolved: no independent source establishes who they are or where they are
-- from, so they are named in the note and not added to a list of Dominicans.
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
       name = 'Daniel Checo',
       sort_name = 'Checo Gómez, Héctor Daniel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = '1995-05-29',
       birth_year = 1995,
       date_of_death = NULL,
       birth_place = 'Santiago',
       province = 'Santiago',
       first_name = 'Héctor',
       middle_name = 'Daniel',
       last_name = 'Checo',
       second_last_name = 'Gómez',
       stage_name = 'Daniel Checo',
       aliases = ARRAY['DjDani Prod']::text[],
       occupations = '["musician","composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-reggaeton']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@DanielChecoOficial',
       facebook = 'djdaniprod',
       instagram = 'danielchecodr',
       disambiguation = 'Singer and producer from Santiago; founder of DCM Studios and De Cero a Millonario',
       bio_en = 'Daniel Checo, born Héctor Daniel Checo Gómez, is a Dominican singer, songwriter and record producer from Santiago. He records under his own name and produces under another one, DjDani Prod, and the second half of that is the larger part of what he does.

**Villa Verde**

He grew up in Villa Verde, a barrio of Santiago, and the music arrived early: at thirteen he was making rap tracks, which in a Dominican barrio in the late two-thousands meant a computer, whatever software could be got hold of, and time.

Producing before performing is a common enough route and it leaves a mark on everything that follows. Someone who learns the craft from behind the screen tends to think about a record as a thing to be assembled rather than a thing to be sung, and hears the arrangement before the melody.

**De Cero a Millonario**

What turned it into work was running into a childhood friend, Alexander Céspedes, who records as Alex Grey. The two of them set about equipping a room properly, and out of that came a company called De Cero a Millonario and a studio called DCM Studios.

The name is the whole ambition stated out loud, and it is also the imprint line at the bottom of every one of his releases. He gives his own occupation as singer and music producer at DCM, which is the accurate description: the studio is the business and the singles are one of the things it makes.

That model — a small independent studio in a provincial city, releasing its own artists and taking bookings through a separate agency — is how a very large share of Dominican music now actually gets made, and almost none of it is written down anywhere.

**The singles**

Mi Felicidad came first, with a video shot by Black-Multimedia Films and the musical production credited to his own studio. Especial followed a couple of months later, then Hey, which is his reading of a Dejota2021 song rather than an original, then Hola with the Puerto Rican engineer and singer Johanzi, and then Angelita & Diablita with Enmanuel Paredes.

They are romantic urban records, and the tags he attached to the last of them name Ozuna, Bad Bunny and Daddy Yankee — which says plainly enough what he was aiming at. Five singles is a small body of work, and it is a real one: each has a video, a release, an imprint and a booking line behind it.

**Two names on the same records**

The follow handle on his earliest videos is the producer one and the follow handle on the later ones is the singer one, which is a small thing that tells you where the centre of gravity moved. He is easier to find as DjDani Prod than as Daniel Checo, and the two are the same person doing two halves of one job.',
       bio_es = 'Daniel Checo, de nombre Héctor Daniel Checo Gómez, es cantante, compositor y productor discográfico dominicano, de Santiago. Graba con su nombre y produce con otro, DjDani Prod, y la segunda mitad de eso es la parte más grande de lo que hace.

**Villa Verde**

Se crió en Villa Verde, un barrio de Santiago, y la música le llegó temprano: a los trece años ya hacía temas de rap, que en un barrio dominicano de finales de los dos mil quería decir una computadora, el programa que se pudiera conseguir y tiempo.

Producir antes que cantar es un camino bastante común y le deja marca a todo lo que viene después. El que aprende el oficio detrás de la pantalla suele pensar el disco como algo que se arma y no como algo que se canta, y oye el arreglo antes que la melodía.

**De Cero a Millonario**

Lo que lo volvió trabajo fue reencontrarse con un amigo de la infancia, Alexander Céspedes, que graba como Alex Grey. Entre los dos se pusieron a equipar un cuarto en serio, y de ahí salieron una compañía llamada De Cero a Millonario y un estudio llamado DCM Studios.

El nombre es la ambición entera dicha en voz alta, y es además la línea del sello al pie de cada uno de sus lanzamientos. Él mismo se pone como cantante y productor musical de DCM, que es la descripción exacta: el estudio es el negocio y los sencillos son una de las cosas que fabrica.

Ese modelo —un estudio independiente pequeño en una ciudad del interior, que saca a sus propios artistas y maneja las contrataciones por una agencia aparte— es como se hace hoy buena parte de la música dominicana, y casi nada de eso está escrito en ninguna parte.

**Los sencillos**

Primero salió Mi Felicidad, con video de Black-Multimedia Films y la producción musical acreditada a su propio estudio. Un par de meses después vino Especial, luego Hey, que es su versión de un tema de Dejota2021 y no una canción suya, después Hola con el ingeniero y cantante puertorriqueño Johanzi, y luego Angelita & Diablita con Enmanuel Paredes.

Son discos urbanos románticos, y las etiquetas que él mismo le puso al último nombran a Ozuna, Bad Bunny y Daddy Yankee, con lo cual queda dicho a qué apuntaba. Cinco sencillos es una obra corta y es una obra real: cada uno tiene video, lanzamiento, sello y un teléfono de contrataciones detrás.

**Dos nombres en los mismos discos**

El usuario que pone para que lo sigan en sus primeros videos es el de productor y el de los últimos es el de cantante, que es un detalle chiquito y dice hacia dónde se movió el centro de gravedad. Es más fácil encontrarlo como DjDani Prod que como Daniel Checo, y los dos son la misma persona haciendo dos mitades de un mismo oficio.',
       updated_at = now()
 WHERE slug = 'daniel-checo';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'daniel-checo')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'daniel-checo')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Daniel Checo, born Héctor Daniel Checo Gómez, is a Dominican singer, songwriter and record producer from Santiago. He records under his own name and produces under another one, DjDani Prod, and the second half of that is the larger part of what he does.","type":"text"}]},{"type":"paragraph","content":[{"text":"Villa Verde","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He grew up in Villa Verde, a barrio of Santiago, and the music arrived early: at thirteen he was making rap tracks, which in a Dominican barrio in the late two-thousands meant a computer, whatever software could be got hold of, and time.","type":"text"}]},{"type":"paragraph","content":[{"text":"Producing before performing is a common enough route and it leaves a mark on everything that follows. Someone who learns the craft from behind the screen tends to think about a record as a thing to be assembled rather than a thing to be sung, and hears the arrangement before the melody.","type":"text"}]},{"type":"paragraph","content":[{"text":"De Cero a Millonario","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"What turned it into work was running into a childhood friend, Alexander Céspedes, who records as Alex Grey. The two of them set about equipping a room properly, and out of that came a company called De Cero a Millonario and a studio called DCM Studios.","type":"text"}]},{"type":"paragraph","content":[{"text":"The name is the whole ambition stated out loud, and it is also the imprint line at the bottom of every one of his releases. He gives his own occupation as singer and music producer at DCM, which is the accurate description: the studio is the business and the singles are one of the things it makes.","type":"text"}]},{"type":"paragraph","content":[{"text":"That model — a small independent studio in a provincial city, releasing its own artists and taking bookings through a separate agency — is how a very large share of Dominican music now actually gets made, and almost none of it is written down anywhere.","type":"text"}]},{"type":"paragraph","content":[{"text":"The singles","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Mi Felicidad came first, with a video shot by Black-Multimedia Films and the musical production credited to his own studio. Especial followed a couple of months later, then Hey, which is his reading of a Dejota2021 song rather than an original, then Hola with the Puerto Rican engineer and singer Johanzi, and then Angelita & Diablita with Enmanuel Paredes.","type":"text"}]},{"type":"paragraph","content":[{"text":"They are romantic urban records, and the tags he attached to the last of them name Ozuna, Bad Bunny and Daddy Yankee — which says plainly enough what he was aiming at. Five singles is a small body of work, and it is a real one: each has a video, a release, an imprint and a booking line behind it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two names on the same records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The follow handle on his earliest videos is the producer one and the follow handle on the later ones is the singer one, which is a small thing that tells you where the centre of gravity moved. He is easier to find as DjDani Prod than as Daniel Checo, and the two are the same person doing two halves of one job.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'daniel-checo'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Daniel Checo, de nombre Héctor Daniel Checo Gómez, es cantante, compositor y productor discográfico dominicano, de Santiago. Graba con su nombre y produce con otro, DjDani Prod, y la segunda mitad de eso es la parte más grande de lo que hace.","type":"text"}]},{"type":"paragraph","content":[{"text":"Villa Verde","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se crió en Villa Verde, un barrio de Santiago, y la música le llegó temprano: a los trece años ya hacía temas de rap, que en un barrio dominicano de finales de los dos mil quería decir una computadora, el programa que se pudiera conseguir y tiempo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Producir antes que cantar es un camino bastante común y le deja marca a todo lo que viene después. El que aprende el oficio detrás de la pantalla suele pensar el disco como algo que se arma y no como algo que se canta, y oye el arreglo antes que la melodía.","type":"text"}]},{"type":"paragraph","content":[{"text":"De Cero a Millonario","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo que lo volvió trabajo fue reencontrarse con un amigo de la infancia, Alexander Céspedes, que graba como Alex Grey. Entre los dos se pusieron a equipar un cuarto en serio, y de ahí salieron una compañía llamada De Cero a Millonario y un estudio llamado DCM Studios.","type":"text"}]},{"type":"paragraph","content":[{"text":"El nombre es la ambición entera dicha en voz alta, y es además la línea del sello al pie de cada uno de sus lanzamientos. Él mismo se pone como cantante y productor musical de DCM, que es la descripción exacta: el estudio es el negocio y los sencillos son una de las cosas que fabrica.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese modelo —un estudio independiente pequeño en una ciudad del interior, que saca a sus propios artistas y maneja las contrataciones por una agencia aparte— es como se hace hoy buena parte de la música dominicana, y casi nada de eso está escrito en ninguna parte.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los sencillos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Primero salió Mi Felicidad, con video de Black-Multimedia Films y la producción musical acreditada a su propio estudio. Un par de meses después vino Especial, luego Hey, que es su versión de un tema de Dejota2021 y no una canción suya, después Hola con el ingeniero y cantante puertorriqueño Johanzi, y luego Angelita & Diablita con Enmanuel Paredes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Son discos urbanos románticos, y las etiquetas que él mismo le puso al último nombran a Ozuna, Bad Bunny y Daddy Yankee, con lo cual queda dicho a qué apuntaba. Cinco sencillos es una obra corta y es una obra real: cada uno tiene video, lanzamiento, sello y un teléfono de contrataciones detrás.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos nombres en los mismos discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El usuario que pone para que lo sigan en sus primeros videos es el de productor y el de los últimos es el de cantante, que es un detalle chiquito y dice hacia dónde se movió el centro de gravedad. Es más fácil encontrarlo como DjDani Prod que como Daniel Checo, y los dos son la misma persona haciendo dos mitades de un mismo oficio.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'daniel-checo'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
