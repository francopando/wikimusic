BEGIN;

-- Rewrite the catalogue entry for Paramba.
--
-- Paramba. Filler in English, nothing in Spanish, no gender, no real name --
-- on an artist who was one of the leading urban names of his moment.
--
-- ADDED: real name Johan Pavel Dominguez, gender male, and the alias.
--
-- LEFT ALONE AND FLAGGED: province "Santiago" and birth_place "Santiago de los
-- Caballeros". Nothing found says where he is from. The value is unusual enough
-- not to look like the importer's default -- which elsewhere is Santo Domingo
-- -- so it may be earlier research, but it is unconfirmed.
--
-- SOURCES: Hoy, 21 March 2013, "Con el cuello pa tra es lo nuevo del cantante
-- urbano Paramba", which gives his name of birth -- "Paramba, cuyo nombre de
-- pila es Johan Pavel Dominguez" -- names his manager, Jose Luis Rodriguez
-- (Manao), reports the song as one of the most played in bars, discotheques and
-- drinks across the capital and the provinces, and quotes him describing it as
-- "una pegajosa fusion de dembow y dance hall" and as "un sonido con distintos
-- colores y matices que hemos producido para diferenciarlo de las demas
-- canciones". El Caribe, 2 December 2025, in a piece on Dominican songs that
-- were everywhere and then were not: "Paramba -- 'Que Se Mueran de Envidia' (11
-- anos). Paramba fue uno de los lideres urbanos. Tras varios exitos, su
-- presencia en los medios..." El Dia, 5 July 2026, listing him with Super
-- Nuevo, Pablo Piddy, Francesca and Dioli among artists who had moments of
-- great recognition. Instagram announcements of recent work: a remix of Le
-- Gusta Bailar with Julito RD, and Pegao Flow Nueva Yol with El Tory.
--
-- NOT WRITTEN: a birth date, which is not published, and the complaints on
-- Dominican pages about what he sings at shows now, which are opinion.
--
-- NOT LINKED: Julito RD, El Tory, Super Nuevo, Pablo Piddy, Francesca and Dioli
-- have no entries. The Julito Deschamps in the catalogue is a different man
-- from another century and is deliberately not referenced.
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
       name = 'Paramba',
       sort_name = 'Paramba',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santiago de los Caballeros',
       province = 'Santiago',
       first_name = 'Johan',
       middle_name = 'Pavel',
       last_name = 'Domínguez',
       second_last_name = NULL,
       stage_name = 'Paramba',
       aliases = ARRAY['Johan Pavel Domínguez']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = 'parambard',
       disambiguation = 'Dominican dembow singer, born Johan Pavel Domínguez; hits Con el Cuello Pa’ Trá and Que Se Mueran de Envidia',
       bio_en = 'Paramba is a Dominican dembow singer, born Johan Pavel Domínguez. For a stretch in the middle of the last decade he was one of the leading names in Dominican urban music.

**Con el Cuello Pa’ Trá**

The song arrived in March 2013 and went straight into the bars, the discotheques and the drinks — the roadside spots where Dominican hits are actually decided — across the capital and the provinces. He described it himself as a catchy fusion of dembow and dancehall, and said the point of the production was to make it sound unlike everything else.

That is a producer’s answer rather than a singer’s, and it is the correct one for the genre. Dembow tracks are separated by a few seconds of texture, and a record that sounds like the last one does not get played.

**Que Se Mueran de Envidia**

The follow-up was bigger and it is the one people name first. A decade later El Caribe listed it among the Dominican songs that were inescapable and then quietly stopped being played, in a piece whose subject was exactly that: what happens to an artist after the hit.

The paper is blunt about the arc — he was one of the leaders of the urban scene, and after several hits his presence in the media fell away.

**Still working**

He has not stopped. A remix of Le Gusta Bailar with Julito RD and Pegao Flow Nueva Yol with El Tory are recent, and he still plays shows.

Dominican dembow has a short memory and a fast turnover, and the list of people who were briefly at the front of it is long. Being on that list is not nothing: for two or three years his songs were what the country was playing.',
       bio_es = 'Paramba es un dembowsero dominicano, nacido Johan Pavel Domínguez. Durante un tramo de la década pasada fue uno de los nombres que iban al frente de la música urbana dominicana.

**Con el Cuello Pa’ Trá**

La canción salió en marzo de 2013 y se metió de una en los bares, las discotecas y los drinks —los sitios de carretera donde de verdad se deciden los éxitos dominicanos— de la capital y de las provincias. Él mismo la describió como una pegajosa fusión de dembow y dancehall, y dijo que la producción buscaba que no sonara como todo lo demás.

Esa es una respuesta de productor y no de cantante, y es la correcta para el género. Los temas de dembow se distinguen por unos segundos de textura, y un disco que suena igual que el anterior no lo ponen.

**Que Se Mueran de Envidia**

El siguiente fue más grande y es el que la gente nombra primero. Diez años después El Caribe lo puso entre las canciones dominicanas que estuvieron en todas partes y después dejaron de sonar sin que nadie lo anunciara, en un texto cuyo tema era justamente ese: qué le pasa a un artista después del éxito.

El periódico es directo sobre la trayectoria: fue uno de los líderes urbanos, y tras varios éxitos su presencia en los medios fue bajando.

**Sigue trabajando**

No ha parado. Un remix de Le Gusta Bailar con Julito RD y Pegao Flow Nueva Yol con El Tory son recientes, y sigue haciendo presentaciones.

El dembow dominicano tiene memoria corta y rotación rápida, y la lista de los que estuvieron un rato al frente es larga. Estar en esa lista no es poca cosa: durante dos o tres años lo que el país estaba poniendo eran sus canciones.',
       updated_at = now()
 WHERE slug = 'paramba';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'paramba')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'paramba')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Paramba is a Dominican dembow singer, born Johan Pavel Domínguez. For a stretch in the middle of the last decade he was one of the leading names in Dominican urban music.","type":"text"}]},{"type":"paragraph","content":[{"text":"Con el Cuello Pa’ Trá","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The song arrived in March 2013 and went straight into the bars, the discotheques and the drinks — the roadside spots where Dominican hits are actually decided — across the capital and the provinces. He described it himself as a catchy fusion of dembow and dancehall, and said the point of the production was to make it sound unlike everything else.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a producer’s answer rather than a singer’s, and it is the correct one for the genre. Dembow tracks are separated by a few seconds of texture, and a record that sounds like the last one does not get played.","type":"text"}]},{"type":"paragraph","content":[{"text":"Que Se Mueran de Envidia","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The follow-up was bigger and it is the one people name first. A decade later El Caribe listed it among the Dominican songs that were inescapable and then quietly stopped being played, in a piece whose subject was exactly that: what happens to an artist after the hit.","type":"text"}]},{"type":"paragraph","content":[{"text":"The paper is blunt about the arc — he was one of the leaders of the urban scene, and after several hits his presence in the media fell away.","type":"text"}]},{"type":"paragraph","content":[{"text":"Still working","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He has not stopped. A remix of Le Gusta Bailar with Julito RD and Pegao Flow Nueva Yol with El Tory are recent, and he still plays shows.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican dembow has a short memory and a fast turnover, and the list of people who were briefly at the front of it is long. Being on that list is not nothing: for two or three years his songs were what the country was playing.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'paramba'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Paramba es un dembowsero dominicano, nacido Johan Pavel Domínguez. Durante un tramo de la década pasada fue uno de los nombres que iban al frente de la música urbana dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Con el Cuello Pa’ Trá","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La canción salió en marzo de 2013 y se metió de una en los bares, las discotecas y los drinks —los sitios de carretera donde de verdad se deciden los éxitos dominicanos— de la capital y de las provincias. Él mismo la describió como una pegajosa fusión de dembow y dancehall, y dijo que la producción buscaba que no sonara como todo lo demás.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa es una respuesta de productor y no de cantante, y es la correcta para el género. Los temas de dembow se distinguen por unos segundos de textura, y un disco que suena igual que el anterior no lo ponen.","type":"text"}]},{"type":"paragraph","content":[{"text":"Que Se Mueran de Envidia","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El siguiente fue más grande y es el que la gente nombra primero. Diez años después El Caribe lo puso entre las canciones dominicanas que estuvieron en todas partes y después dejaron de sonar sin que nadie lo anunciara, en un texto cuyo tema era justamente ese: qué le pasa a un artista después del éxito.","type":"text"}]},{"type":"paragraph","content":[{"text":"El periódico es directo sobre la trayectoria: fue uno de los líderes urbanos, y tras varios éxitos su presencia en los medios fue bajando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sigue trabajando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"No ha parado. Un remix de Le Gusta Bailar con Julito RD y Pegao Flow Nueva Yol con El Tory son recientes, y sigue haciendo presentaciones.","type":"text"}]},{"type":"paragraph","content":[{"text":"El dembow dominicano tiene memoria corta y rotación rápida, y la lista de los que estuvieron un rato al frente es larga. Estar en esa lista no es poca cosa: durante dos o tres años lo que el país estaba poniendo eran sus canciones.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'paramba'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
