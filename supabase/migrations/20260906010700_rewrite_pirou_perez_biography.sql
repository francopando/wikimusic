BEGIN;

-- Rewrite the catalogue entry for Pirou Pérez.
--
-- Pirou Pérez. Filler in English and the shortest one in the queue -- three
-- sentences -- with no sort_name, no stage_name, no occupations, no genres, no
-- instruments and no disambiguation. She is one of the very few jazz singers in
-- this catalogue and the only woman among them.
--
-- THE DOMINICAN JAZZ SCENE IS THE LARGEST GAP THIS RUN HAS FOUND, and this is
-- one of the few entries that sits inside it. Jazz en Dominicana, a blog running
-- since 2006 and dedicated to "el jazz del patio", has covered her since 2020
-- and is the source for almost everything below. It is not a press-release
-- aggregator; the pieces are written and signed by Fernando Rodríguez De
-- Mondesert.
--
-- FILLED: stage_name Pirou, which is what her own channel is called and how the
-- records are billed; sort_name, which was null; occupations composer and
-- actress; instruments voice; genres; disambiguation.
--
-- LEFT ALONE AND CONFIRMED: gender female, first_name Katherine, last_name
-- Pérez, province Distrito Nacional and birth_place Santo Domingo -- Jazz en
-- Dominicana opens every piece on her with "Pirou Pérez (Katherine Pérez) es
-- oriunda de Santo Domingo". primary_genre jazz is right and stays.
--
-- date_of_birth 1991-04-13 IS LEFT EXACTLY AS STORED AND IS NOT VERIFIED.
-- Nothing found gives a birth date. It is not touched and it is not treated as
-- confirmed.
--
-- THE TRAINING IS DOCUMENTED, WHICH IS RARE IN THIS RUN. She began in theatre and
-- took classical vocal training with Nadia Nicola; later she studied voice again
-- in a Berklee College of Music summer programme with Darcell Wilson. Most
-- entries in this catalogue have to say "self-taught"; hers does not.
--
-- THE ALBUM PERSONNEL IS A CREDIT LIST, NOT A GUESS. How High The Moon was
-- released on 30 April 2026, International Jazz Day. Five standards: Honeysuckle
-- Rose, I Got Rhythm, The Shadow Of Your Smile, Lullaby Of Birdland and the title
-- track. Pirou on voice, Sebastián Murena on guitar and arrangements, Hidekel
-- Martínez on drums, Marcos Asencio on double bass, Luís Mansilla mixing and
-- mastering, Gonzalo Maspons engineering, with support from Gran Herencia Música.
--
-- SEBASTIÁN MURENA IS ARGENTINE. Jazz en Dominicana says so outright -- "un
-- guitarrista autodidacta de jazz oriundo de Argentina que hoy día reside en
-- nuestro país" -- so he is named in the prose and NOT added to the
-- missing-Dominicans list. Checking that before writing is exactly the point of
-- the nationality rule.
--
-- SOURCES: Jazz en Dominicana, across at least six posts between July 2020 and
-- July 2026 -- the review of How High The Moon with its full personnel, the All
-- That Jazz preview with her biography and a five-question interview, the 2021
-- guest-vocalist announcement, the Navijazz 2025 listing, and the Amargue
-- Sessions coverage. Diario Libre, 6 July 2026, on the album and the Santo
-- Domingo Jazz Festival. Her own YouTube channel, its About text and
-- twenty-one videos. Her own Instagram.
--
-- NOT WRITTEN: no follower counts. Nothing private. She lists herself as a
-- psychologist and that is her profession, so it stays -- it is the same category
-- as Jhonny Evidence's law degree, and both are about how a musician earns a
-- living.
--
-- NOT LINKED: Sebastián Murena is Argentine, and the jazz standards she sings are
-- by American composers. Hidekel Martínez, Marcos Asencio, Nadia Nicola,
-- Cruzmonty, Johanna Almánzar, María del Mar and Benny Hiraldo have no entries
-- and go on the missing list, where they join the jazz block already there.
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
       name = 'Pirou Pérez',
       sort_name = 'Pérez, Pirou',
       type = 'solo_artist',
       status = 'published',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'jazz',
       date_of_birth = '1991-04-13',
       birth_year = 1991,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Katherine',
       middle_name = NULL,
       last_name = 'Pérez',
       second_last_name = NULL,
       stage_name = 'Pirou',
       aliases = ARRAY[]::text[],
       occupations = '["composer","actress"]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY['bolero', 'ballads']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@PirouPerez',
       facebook = 'Pirouperez',
       instagram = 'pirouperez',
       disambiguation = 'Jazz singer from Santo Domingo; How High The Moon',
       bio_en = 'Pirou is the stage name of Katherine Pérez, a Dominican jazz singer and songwriter from Santo Domingo. She describes her own sound as retro soul meeting a Latin heart, and she is one of very few women working the Dominican jazz circuit as a leader rather than a guest.

**Theatre first**

She started as an actress, and it was in the theatre that she got classical vocal training. That order matters: a singer who learns to project a character before she learns to sell a song tends to sing lyrics as text rather than as melody, and that is audible in everything she does.

She went back to studying later, in a Berklee summer programme. Dominican popular music is overwhelmingly made by people who taught themselves because there was no other option; she trained twice, deliberately, years apart.

She is also a psychologist and a working voiceover artist — one of the voices a Dominican hears from a telecoms company without ever knowing whose it is. Jazz singing does not pay a rent in Santo Domingo and she has never pretended otherwise.

**The original songs**

Her debut single arrived in 2019 and the run since has been steady: Admiración, Nadie Como Tú, Dime Que Sí, Besos y Violetas, Fantasías, Ser Tu Amiga, Pecado, Cerca del Sol, and Mi Cuerpo Arde, which she then cut again as a salsa.

Besito de Algodón was made with Cruzmonty. And she is on Amargue Sessions, the record that put bolero and jazz in the same room, singing a version of Voy A Apagar La Luz with Xiomara Fortuna — which is a considerable room to be invited into.

**How High The Moon**

Her first jazz album came out on International Jazz Day and it is five standards: Honeysuckle Rose, I Got Rhythm, The Shadow Of Your Smile, Lullaby Of Birdland and the title track.

Recording standards is the least fashionable and most exposing thing a singer can do. Every one of those five has been definitively sung by somebody famous, the arrangements are common property, and there is nowhere to hide — no production, no hook, just a voice, a guitar, a bass and a set of brushes.

She made it with a guitar trio led by the Argentine guitarist Sebastián Murena, who lives and works in the Dominican Republic, with Hidekel Martínez on drums and Marcos Asencio on double bass. They took it to the Santo Domingo Jazz Festival as a quartet under the title All That Jazz.

**The circuit**

Dominican jazz runs on a small number of rooms — a theatre house, a cigar club, a Thursday residency, a Christmas festival in Santiago — and on the handful of people who keep booking them. She has played that circuit for years and is now on the bills as the name rather than the guest.

It is a scene the country barely documents. There is one blog that has been writing about it since 2006, and without it most of what is known about a Dominican jazz musician’s career would not be known at all.',
       bio_es = 'Pirou es el nombre artístico de Katherine Pérez, cantante y compositora de jazz dominicana, de Santo Domingo. Ella describe su propio sonido como soul retro con corazón latino, y es de las poquísimas mujeres que trabajan el circuito de jazz dominicano como figura y no como invitada.

**Primero el teatro**

Empezó como actriz, y fue en el teatro donde recibió formación vocal clásica. El orden importa: una cantante que aprende a sostener un personaje antes que a vender una canción tiende a cantar la letra como texto y no como melodía, y eso se oye en todo lo que hace.

Volvió a estudiar después, en un programa de verano de Berklee. La música popular dominicana la hace en su abrumadora mayoría gente que aprendió sola porque no había otra vía; ella se formó dos veces, a propósito, con años de por medio.

Es además psicóloga y locutora comercial en ejercicio: una de esas voces que un dominicano oye de una compañía de telecomunicaciones sin saber nunca de quién es. Cantar jazz no paga un alquiler en Santo Domingo y ella nunca ha fingido lo contrario.

**Las canciones propias**

Su primer sencillo salió en 2019 y desde entonces la seguidilla no ha parado: Admiración, Nadie Como Tú, Dime Que Sí, Besos y Violetas, Fantasías, Ser Tu Amiga, Pecado, Cerca del Sol, y Mi Cuerpo Arde, que después volvió a grabar en salsa.

Besito de Algodón la hizo con Cruzmonty. Y está en Amargue Sessions, el disco que sentó al bolero y al jazz en el mismo cuarto, cantando una versión de Voy A Apagar La Luz con Xiomara Fortuna, que es un cuarto considerable al que la inviten a una.

**How High The Moon**

Su primer disco de jazz salió el Día Internacional del Jazz y son cinco estándares: Honeysuckle Rose, I Got Rhythm, The Shadow Of Your Smile, Lullaby Of Birdland y el tema que le da título.

Grabar estándares es lo menos vistoso y lo más expuesto que puede hacer una cantante. Los cinco los cantó definitivamente alguien famoso, los arreglos son propiedad común, y no hay dónde esconderse: no hay producción, no hay gancho, hay una voz, una guitarra, un contrabajo y unas escobillas.

Lo hizo con un trío de guitarra que encabeza el guitarrista argentino Sebastián Murena, radicado en la República Dominicana, con Hidekel Martínez en batería y Marcos Asencio en contrabajo. Lo llevaron al Santo Domingo Jazz Festival en formato de cuarteto, bajo el título All That Jazz.

**El circuito**

El jazz dominicano se mueve en un puñado de salas —una casa de teatro, un club de tabacos, una residencia de los jueves, un festival navideño en Santiago— y en la media docena de personas que siguen programándolas. Ella lleva años en ese circuito y hoy aparece en los carteles como el nombre y no como la invitada.

Es una escena que el país apenas documenta. Hay un blog que escribe sobre ella desde 2006, y sin él casi nada de lo que se sabe de la carrera de un músico de jazz dominicano se sabría.',
       updated_at = now()
 WHERE slug = 'pirou-perez';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pirou-perez')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pirou-perez')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Pirou is the stage name of Katherine Pérez, a Dominican jazz singer and songwriter from Santo Domingo. She describes her own sound as retro soul meeting a Latin heart, and she is one of very few women working the Dominican jazz circuit as a leader rather than a guest.","type":"text"}]},{"type":"paragraph","content":[{"text":"Theatre first","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She started as an actress, and it was in the theatre that she got classical vocal training. That order matters: a singer who learns to project a character before she learns to sell a song tends to sing lyrics as text rather than as melody, and that is audible in everything she does.","type":"text"}]},{"type":"paragraph","content":[{"text":"She went back to studying later, in a Berklee summer programme. Dominican popular music is overwhelmingly made by people who taught themselves because there was no other option; she trained twice, deliberately, years apart.","type":"text"}]},{"type":"paragraph","content":[{"text":"She is also a psychologist and a working voiceover artist — one of the voices a Dominican hears from a telecoms company without ever knowing whose it is. Jazz singing does not pay a rent in Santo Domingo and she has never pretended otherwise.","type":"text"}]},{"type":"paragraph","content":[{"text":"The original songs","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Her debut single arrived in 2019 and the run since has been steady: Admiración, Nadie Como Tú, Dime Que Sí, Besos y Violetas, Fantasías, Ser Tu Amiga, Pecado, Cerca del Sol, and Mi Cuerpo Arde, which she then cut again as a salsa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Besito de Algodón was made with Cruzmonty. And she is on Amargue Sessions, the record that put bolero and jazz in the same room, singing a version of Voy A Apagar La Luz with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8e29188a-215b-4c6c-b34a-45b381765e46","displayText":"Xiomara Fortuna","occurrenceId":"fcfad9d6-71ad-455f-8d0e-f68544e4dc6c"}},{"text":" — which is a considerable room to be invited into.","type":"text"}]},{"type":"paragraph","content":[{"text":"How High The Moon","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Her first jazz album came out on International Jazz Day and it is five standards: Honeysuckle Rose, I Got Rhythm, The Shadow Of Your Smile, Lullaby Of Birdland and the title track.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recording standards is the least fashionable and most exposing thing a singer can do. Every one of those five has been definitively sung by somebody famous, the arrangements are common property, and there is nowhere to hide — no production, no hook, just a voice, a guitar, a bass and a set of brushes.","type":"text"}]},{"type":"paragraph","content":[{"text":"She made it with a guitar trio led by the Argentine guitarist Sebastián Murena, who lives and works in the Dominican Republic, with Hidekel Martínez on drums and Marcos Asencio on double bass. They took it to the Santo Domingo Jazz Festival as a quartet under the title All That Jazz.","type":"text"}]},{"type":"paragraph","content":[{"text":"The circuit","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dominican jazz runs on a small number of rooms — a theatre house, a cigar club, a Thursday residency, a Christmas festival in Santiago — and on the handful of people who keep booking them. She has played that circuit for years and is now on the bills as the name rather than the guest.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is a scene the country barely documents. There is one blog that has been writing about it since 2006, and without it most of what is known about a Dominican jazz musician’s career would not be known at all.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'pirou-perez'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Pirou es el nombre artístico de Katherine Pérez, cantante y compositora de jazz dominicana, de Santo Domingo. Ella describe su propio sonido como soul retro con corazón latino, y es de las poquísimas mujeres que trabajan el circuito de jazz dominicano como figura y no como invitada.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primero el teatro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó como actriz, y fue en el teatro donde recibió formación vocal clásica. El orden importa: una cantante que aprende a sostener un personaje antes que a vender una canción tiende a cantar la letra como texto y no como melodía, y eso se oye en todo lo que hace.","type":"text"}]},{"type":"paragraph","content":[{"text":"Volvió a estudiar después, en un programa de verano de Berklee. La música popular dominicana la hace en su abrumadora mayoría gente que aprendió sola porque no había otra vía; ella se formó dos veces, a propósito, con años de por medio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es además psicóloga y locutora comercial en ejercicio: una de esas voces que un dominicano oye de una compañía de telecomunicaciones sin saber nunca de quién es. Cantar jazz no paga un alquiler en Santo Domingo y ella nunca ha fingido lo contrario.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las canciones propias","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su primer sencillo salió en 2019 y desde entonces la seguidilla no ha parado: Admiración, Nadie Como Tú, Dime Que Sí, Besos y Violetas, Fantasías, Ser Tu Amiga, Pecado, Cerca del Sol, y Mi Cuerpo Arde, que después volvió a grabar en salsa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Besito de Algodón la hizo con Cruzmonty. Y está en Amargue Sessions, el disco que sentó al bolero y al jazz en el mismo cuarto, cantando una versión de Voy A Apagar La Luz con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8e29188a-215b-4c6c-b34a-45b381765e46","displayText":"Xiomara Fortuna","occurrenceId":"9ebb4ac0-cae6-4440-906a-fbe64e777044"}},{"text":", que es un cuarto considerable al que la inviten a una.","type":"text"}]},{"type":"paragraph","content":[{"text":"How High The Moon","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su primer disco de jazz salió el Día Internacional del Jazz y son cinco estándares: Honeysuckle Rose, I Got Rhythm, The Shadow Of Your Smile, Lullaby Of Birdland y el tema que le da título.","type":"text"}]},{"type":"paragraph","content":[{"text":"Grabar estándares es lo menos vistoso y lo más expuesto que puede hacer una cantante. Los cinco los cantó definitivamente alguien famoso, los arreglos son propiedad común, y no hay dónde esconderse: no hay producción, no hay gancho, hay una voz, una guitarra, un contrabajo y unas escobillas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo hizo con un trío de guitarra que encabeza el guitarrista argentino Sebastián Murena, radicado en la República Dominicana, con Hidekel Martínez en batería y Marcos Asencio en contrabajo. Lo llevaron al Santo Domingo Jazz Festival en formato de cuarteto, bajo el título All That Jazz.","type":"text"}]},{"type":"paragraph","content":[{"text":"El circuito","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El jazz dominicano se mueve en un puñado de salas —una casa de teatro, un club de tabacos, una residencia de los jueves, un festival navideño en Santiago— y en la media docena de personas que siguen programándolas. Ella lleva años en ese circuito y hoy aparece en los carteles como el nombre y no como la invitada.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una escena que el país apenas documenta. Hay un blog que escribe sobre ella desde 2006, y sin él casi nada de lo que se sabe de la carrera de un músico de jazz dominicano se sabría.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'pirou-perez'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pirou-perez') AND locale = 'en'), 'fcfad9d6-71ad-455f-8d0e-f68544e4dc6c', 'artist', '8e29188a-215b-4c6c-b34a-45b381765e46');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pirou-perez') AND locale = 'es'), '9ebb4ac0-cae6-4440-906a-fbe64e777044', 'artist', '8e29188a-215b-4c6c-b34a-45b381765e46');

COMMIT;
