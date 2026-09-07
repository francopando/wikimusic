BEGIN;

-- Rewrite the catalogue entry for Gior Chambonea.
--
-- Gior Chambonea. Filler in English, nothing in Spanish, no occupations, no
-- genres, and a province that was the importer's default and wrong.
--
-- THIS ENTRY WAS DEFERRED EARLIER TODAY AND SHOULD NOT HAVE BEEN. The first
-- pass searched the open web, drowned in Ivy Queen's and Omega's "Chambonea",
-- and concluded there was nothing to write. The three account handles were
-- already on the row and were not opened. His YouTube channel holds a hundred
-- and nine videos, his Spotify holds a discography, and his own posts say where
-- he is from. Nothing was missing except the looking.
--
-- CORRECTED: province "Distrito Nacional" -> "Monte Plata", birth_place "Santo
-- Domingo" -> "Sabana Grande de Boyá". The evidence is his own catalogue: Pa la
-- 42 and a live video from la 42; En Mi Bloque, subtitled Pueblo Nuevo; Parada
-- Sabanera Vol. 4; Bolsillos con Papera recorded live at Oro VIP in Sabana
-- Grande de Boyá; "Gior Chambonea rompiendo en Sabana Grande de Boyá"; Expo
-- Monte Plata in 2018 and again in 2019. La 42 and Pueblo Nuevo are both
-- barrios of Sabana Grande de Boyá -- local news reports place them there --
-- so the two songs that read as capital references are not; they are his own
-- town. He also posts in the town's own Facebook group.
--
-- primary_role singer -> rapper and primary_genre urbano -> urban-rap-hip-hop.
-- His channel bills the work as rap, one section of it as Rap Underground, and
-- he posts freestyle battles; Apple Music files Bolsillos con Papera under
-- Hip-Hop/Rap. Dembow and urbano go into genres, and there is one dancehall
-- track.
--
-- ADDED: alias "El Psicópata que Canta", which is how he signs himself on
-- Instagram and in his own Spotify text; occupations composer; genres;
-- disambiguation.
--
-- TAG CHECKED, NOT CHANGED. His YouTube channel description is a religious
-- exhortation and his Instagram reads "PRIMERO DIOS", which raised the question
-- of whether he belongs under the christian tag. He does not: the songs are
-- street rap and their subject matter is not devotional. The tag stays secular.
--
-- SOURCES: his own YouTube channel, for the video list, the release dates and
-- the live footage. Spotify, for the popular tracks -- El Sistema Vieja
-- Escuela, Puta y Pastilla, 10 Mandamientos, Una Shorty en Pinta, Ají Titi --
-- and for the artist text he wrote himself. Apple Music and Amazon for the
-- release dates of Lo Cotomo, 2020, Bolsillos con Papera, March 2021, and
-- Barrio Calentón, 2021. Instagram, for the alias and for the DistroKid
-- distribution. Facebook, for the town. Local Monte Plata news pages, for
-- placing la 42 and Pueblo Nuevo inside Sabana Grande de Boyá.
--
-- TWO THINGS FOR THE EDITOR. There are two Spotify artist profiles under this
-- name -- 3rgDU2YfLkaRajxcTsbHeN, which holds the catalogue, and
-- 3KLaFQacZJiljYR2vecUZC, which holds one track, La Vuelta de Mantequilla 3.14.
-- A split profile is what happens when an independent distributor files a
-- release without the artist id, and only he can ask for it to be merged. He
-- also runs a second Facebook page, "Gior el Chambonea Music Inc", with two
-- thousand followers against eleven thousand on the one stored here; the stored
-- one is the right one to keep.
--
-- NOT WRITTEN: view and follower counts.
--
-- NOT LINKED: Pablo Piddy, La Cima, Mr. Código, Sincero, Los Bacanísimos,
-- Cedeño Brown, Nayla, Evis Jordan, El Manga and the rest of the people he
-- records with have no entries in the catalogue. Pablo Piddy in particular is a
-- gap worth closing.
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
       name = 'Gior Chambonea',
       sort_name = 'Gior Chambonea',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Sabana Grande de Boyá',
       province = 'Monte Plata',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Gior Chambonea',
       aliases = ARRAY['Gior', 'El Chambonea', 'El Psicópata que Canta']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-dembow']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@giorchambonea',
       facebook = 'giorelchambonea',
       instagram = 'Giorchambonea',
       disambiguation = 'Rapper from Sabana Grande de Boyá; Lo Cotomo, Bolsillos con Papera',
       bio_en = 'Gior Chambonea is a Dominican rapper from Sabana Grande de Boyá, in Monte Plata. He signs himself El Psicópata que Canta, releases his own records through an independent distributor, and has built a catalogue of more than a hundred videos without a label, a manager or a single line of press coverage.

**A town, not a capital**

Almost everything he has made names the place. Pa la 42 and En Mi Bloque, subtitled Pueblo Nuevo, sound like capital records to anyone who does not know the country — la 42 is a famous street in Santo Domingo — but both are barrios of his own town, and that is the one he means. Parada Sabanera is named for the town too.

The live footage is all from the same map: nights at Oro VIP in Sabana Grande de Boyá, the Expo Monte Plata in 2018 and again in 2019, a set from Maquiteria. This is the provincial circuit, which is where most Dominican urban music actually gets played and almost none of it gets written about.

**The records**

Lo Cotomo, with La Cima, came in 2020. Bolsillos con Papera, with La Cima and Los Bacanísimos, followed in 2021, and Barrio Calentón at the end of that year. Soy de RD, made with Sincero, came in 2022. Ají Titi, Código Picante, 420 No Confío, Una Shorty en Pinta and El Sistema Vieja Escuela are on the same shelf.

He works constantly with the same circle — La Cima on record after record, Mr. Código on Desacatate and Aquí Tamo Bien, Cedeño Brown, Nayla, Sin Freno Rap, Los Bacanísimos. Desacatate is dancehall rather than rap, which in a catalogue this size counts as an experiment.

**The mandamientos**

10 Mandamientos was written as an answer to another posse cut, Los 12 Mandamientos, and he cut it with a roomful of other rappers. Pablo Piddy then took it further with a 2.0, and put him on Chuky Trotiao as well.

The answer record is one of the oldest forms in Dominican rap, and it is how a rapper from outside the capital gets heard: not by being signed, but by replying loudly enough to something the capital made.

Nothing about him is otherwise on the record. No legal name, no date of birth, and no article in any newspaper — the whole of what is known comes from his own channels.',
       bio_es = 'Gior Chambonea es un rapero dominicano de Sabana Grande de Boyá, en Monte Plata. Firma como El Psicópata que Canta, publica sus discos por su cuenta a través de un distribuidor independiente, y ha armado un catálogo de más de cien videos sin sello, sin mánager y sin una sola línea de prensa.

**Un pueblo, no la capital**

Casi todo lo que ha hecho nombra el lugar. Pa la 42 y En Mi Bloque, subtitulada Pueblo Nuevo, suenan a discos de la capital para quien no conoce el país —la 42 es una calle famosa de Santo Domingo— pero las dos son barrios de su propio pueblo, y es a ese al que se refiere. Parada Sabanera también lleva el nombre del pueblo.

El material en vivo sale todo del mismo mapa: noches en el Oro VIP de Sabana Grande de Boyá, la Expo Monte Plata en 2018 y otra vez en 2019, una tanda desde Maquiteria. Este es el circuito de provincia, que es donde de verdad se toca casi toda la música urbana dominicana y sobre el que casi nunca se escribe.

**Los discos**

Lo Cotomo, con La Cima, salió en 2020. Bolsillos con Papera, con La Cima y Los Bacanísimos, vino en 2021, y Barrio Calentón a final de ese año. Soy de RD, hecha con Sincero, es de 2022. Ají Titi, Código Picante, 420 No Confío, Una Shorty en Pinta y El Sistema Vieja Escuela están en el mismo estante.

Trabaja sin parar con el mismo círculo: La Cima disco tras disco, Mr. Código en Desacatate y Aquí Tamo Bien, Cedeño Brown, Nayla, Sin Freno Rap, Los Bacanísimos. Desacatate es dancehall y no rap, que en un catálogo de este tamaño cuenta como experimento.

**Los mandamientos**

10 Mandamientos la escribió como respuesta a otro tema colectivo, Los 12 Mandamientos, y la grabó con una sala llena de raperos. Después Pablo Piddy la llevó más lejos con un 2.0, y también lo puso en Chuky Trotiao.

El disco de respuesta es una de las formas más viejas del rap dominicano, y es como se hace oír un rapero de fuera de la capital: no porque lo firmen, sino por contestar lo bastante duro algo que hizo la capital.

De él no hay nada más anotado. Ni nombre legal, ni fecha de nacimiento, ni un artículo en ningún periódico: todo lo que se sabe sale de sus propios canales.',
       updated_at = now()
 WHERE slug = 'gior-chambonea';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gior-chambonea')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gior-chambonea')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Gior Chambonea is a Dominican rapper from Sabana Grande de Boyá, in Monte Plata. He signs himself El Psicópata que Canta, releases his own records through an independent distributor, and has built a catalogue of more than a hundred videos without a label, a manager or a single line of press coverage.","type":"text"}]},{"type":"paragraph","content":[{"text":"A town, not a capital","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Almost everything he has made names the place. Pa la 42 and En Mi Bloque, subtitled Pueblo Nuevo, sound like capital records to anyone who does not know the country — la 42 is a famous street in Santo Domingo — but both are barrios of his own town, and that is the one he means. Parada Sabanera is named for the town too.","type":"text"}]},{"type":"paragraph","content":[{"text":"The live footage is all from the same map: nights at Oro VIP in Sabana Grande de Boyá, the Expo Monte Plata in 2018 and again in 2019, a set from Maquiteria. This is the provincial circuit, which is where most Dominican urban music actually gets played and almost none of it gets written about.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo Cotomo, with La Cima, came in 2020. Bolsillos con Papera, with La Cima and Los Bacanísimos, followed in 2021, and Barrio Calentón at the end of that year. Soy de RD, made with Sincero, came in 2022. Ají Titi, Código Picante, 420 No Confío, Una Shorty en Pinta and El Sistema Vieja Escuela are on the same shelf.","type":"text"}]},{"type":"paragraph","content":[{"text":"He works constantly with the same circle — La Cima on record after record, Mr. Código on Desacatate and Aquí Tamo Bien, Cedeño Brown, Nayla, Sin Freno Rap, Los Bacanísimos. Desacatate is dancehall rather than rap, which in a catalogue this size counts as an experiment.","type":"text"}]},{"type":"paragraph","content":[{"text":"The mandamientos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"10 Mandamientos was written as an answer to another posse cut, Los 12 Mandamientos, and he cut it with a roomful of other rappers. Pablo Piddy then took it further with a 2.0, and put him on Chuky Trotiao as well.","type":"text"}]},{"type":"paragraph","content":[{"text":"The answer record is one of the oldest forms in Dominican rap, and it is how a rapper from outside the capital gets heard: not by being signed, but by replying loudly enough to something the capital made.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing about him is otherwise on the record. No legal name, no date of birth, and no article in any newspaper — the whole of what is known comes from his own channels.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'gior-chambonea'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Gior Chambonea es un rapero dominicano de Sabana Grande de Boyá, en Monte Plata. Firma como El Psicópata que Canta, publica sus discos por su cuenta a través de un distribuidor independiente, y ha armado un catálogo de más de cien videos sin sello, sin mánager y sin una sola línea de prensa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un pueblo, no la capital","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Casi todo lo que ha hecho nombra el lugar. Pa la 42 y En Mi Bloque, subtitulada Pueblo Nuevo, suenan a discos de la capital para quien no conoce el país —la 42 es una calle famosa de Santo Domingo— pero las dos son barrios de su propio pueblo, y es a ese al que se refiere. Parada Sabanera también lleva el nombre del pueblo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El material en vivo sale todo del mismo mapa: noches en el Oro VIP de Sabana Grande de Boyá, la Expo Monte Plata en 2018 y otra vez en 2019, una tanda desde Maquiteria. Este es el circuito de provincia, que es donde de verdad se toca casi toda la música urbana dominicana y sobre el que casi nunca se escribe.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo Cotomo, con La Cima, salió en 2020. Bolsillos con Papera, con La Cima y Los Bacanísimos, vino en 2021, y Barrio Calentón a final de ese año. Soy de RD, hecha con Sincero, es de 2022. Ají Titi, Código Picante, 420 No Confío, Una Shorty en Pinta y El Sistema Vieja Escuela están en el mismo estante.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabaja sin parar con el mismo círculo: La Cima disco tras disco, Mr. Código en Desacatate y Aquí Tamo Bien, Cedeño Brown, Nayla, Sin Freno Rap, Los Bacanísimos. Desacatate es dancehall y no rap, que en un catálogo de este tamaño cuenta como experimento.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los mandamientos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"10 Mandamientos la escribió como respuesta a otro tema colectivo, Los 12 Mandamientos, y la grabó con una sala llena de raperos. Después Pablo Piddy la llevó más lejos con un 2.0, y también lo puso en Chuky Trotiao.","type":"text"}]},{"type":"paragraph","content":[{"text":"El disco de respuesta es una de las formas más viejas del rap dominicano, y es como se hace oír un rapero de fuera de la capital: no porque lo firmen, sino por contestar lo bastante duro algo que hizo la capital.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él no hay nada más anotado. Ni nombre legal, ni fecha de nacimiento, ni un artículo en ningún periódico: todo lo que se sabe sale de sus propios canales.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'gior-chambonea'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
