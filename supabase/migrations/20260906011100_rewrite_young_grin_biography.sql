BEGIN;

-- Rewrite the catalogue entry for Young Grin.
--
-- Young Grin. Filler in English -- two sentences -- no sort_name, no
-- stage_name, no aliases, no occupations, no genres, no disambiguation, and the
-- wrong end of the island.
--
-- PROVINCE AND BIRTHPLACE CORRECTED, FROM SANTO DOMINGO TO PUERTO PLATA. The row
-- said Distrito Nacional and Santo Domingo. His own channel biography opens
-- "Young Grin (Idelson Grin), también conocido como El Bolígrafo Letal, es un
-- rapero, compositor y productor dominicano nacido el 27 de julio de 1994 en
-- Puerto Plata", says it again two paragraphs later calling him one of the most
-- prolific artists in Puerto Plata, and again about the stages he has played.
-- Viberate says the same independently. He has a song called Puerto Plata and a
-- video shot there. The date already in the row, 27 July 1994, matches his own
-- text exactly and is not touched.
--
-- THE SECOND SURNAME IS FILLED FROM A CREDIT, NOT A GUESS. Genius files his
-- writing credits under the composer name "Idelson Grin Hiraldo". second_last_name
-- becomes Hiraldo.
--
-- FILLED: sort_name and stage_name, both null. aliases El Bolígrafo Letal, which
-- is his own billing and the title of his album, and Idelson Grin, which is the
-- name on his own Facebook page and his own YouTube playlists. occupations
-- composer and producer -- Audiomack's credit panel for the album lists Young
-- Grin as producer, and several videos are captioned as produced by him. genres.
-- disambiguation.
--
-- THE ALBUM IS DOCUMENTED PROPERLY. El Bolígrafo Letal, released 28 May 2014 on
-- NEW YOUNG MUSIC, his own imprint. Eleven tracks are visible from his channel's
-- numbered uploads: Intro, Eres Dios with Mario Almanzar, To' Se Va A Quedar, I
-- Live To My Way, Puerto Plata, Es Porque Te Amo with Vanessa, Jnt and Juan
-- Carlos MC, Judas Iscariotes, Carta A Mi Familia, La Única En Mi Vida with
-- Mario Almanzar, Sal Del Juego with Feylon Clase and Juan Carlos MC, and Uno Eh
-- Seixy. Apple Music, Amazon Music, Audiomack and Spotify all carry it.
--
-- A CLAIM ATTRIBUTED. His biography says he has produced more than 1,200
-- unreleased songs. Nothing corroborates that and nothing could, so the prose
-- says it is his own count rather than stating it as fact. Same for "políglota y
-- licenciado".
--
-- THE DUO IS REAL AND IS DATED. He began making music at fifteen with his cousin
-- Neikon; the album Sentimiento Urbano is credited to the two of them and the
-- full record is on his channel.
--
-- SOURCES: his own YouTube channel -- the biography in the About panel, thirty
-- video titles including the numbered album uploads and a documentary about
-- himself -- his own Instagram and Facebook. Audiomack, for the release date,
-- the imprint and the production credit. Genius, for the composer name. Apple
-- Music, Amazon Music and Spotify for the album. Viberate.
--
-- NOT WRITTEN: no follower counts. His Instagram has fifty followers and that
-- number does not appear in the entry; it is noted here only because it explains
-- why almost nothing about him is findable.
--
-- NOT LINKED: nobody in this entry has an entry. Neikon, Nata Low Melody,
-- Vanessa, Jnt, Juan Carlos MC, Mario Almanzar, Feylon Clase, El Maldito
-- Despiadado, Nowezzy, Macklao, Atahualpa and Franciel go on the missing list as
-- the Puerto Plata rap block, which nothing in this catalogue currently covers.
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
       name = 'Young Grin',
       sort_name = 'Young Grin',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = '1994-07-27',
       birth_year = 1994,
       date_of_death = NULL,
       birth_place = 'Puerto Plata',
       province = 'Puerto Plata',
       first_name = 'Idelson',
       middle_name = NULL,
       last_name = 'Grin',
       second_last_name = 'Hiraldo',
       stage_name = 'Young Grin',
       aliases = ARRAY['El Bolígrafo Letal', 'Idelson Grin']::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-rap-hip-hop', 'urban-trap']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@YoungGrinOficial',
       facebook = 'IdelsonGrinOficial',
       instagram = 'younggrinoficial',
       disambiguation = 'Rapper and producer from Puerto Plata; El Bolígrafo Letal',
       bio_en = 'Young Grin, born Idelson Grin Hiraldo and billed as El Bolígrafo Letal, is a Dominican rapper, songwriter and producer from Puerto Plata. He has been working the north coast since he was a teenager and has stayed independent throughout.

**The north coast**

Dominican rap is written about as a Santo Domingo story, occasionally as a Santiago one and now and then as a San Pedro one. Puerto Plata does not appear in it. It is a tourist coast with a port and a cable car, and its music is assumed to be whatever the hotels are playing.

He named a song after the city and put it in the middle of his album, which is what a rapper does when the place is the point. He started at fifteen with his cousin Neikon and the two of them worked as a duo before he went out alone.

**El Bolígrafo Letal**

The album came out in 2014 on his own imprint and he produced it himself. Eleven tracks, most with guests from the same coast: Eres Dios, To’ Se Va A Quedar, I Live To My Way, Puerto Plata, Es Porque Te Amo, Judas Iscariotes, Carta A Mi Familia, La Única En Mi Vida, Sal Del Juego, Uno Eh Seixy.

The titles say what kind of rapper he is. Judas Iscariotes and Eres Dios on one record with Carta A Mi Familia, a letter to his family — this is a writer working religion, betrayal and obligation rather than money and cars. The nickname he gave himself, the lethal ballpoint, is about the pen.

He also made a documentary about the album, which is an unusual amount of self-archiving for an artist at his scale. A second album, Sentimiento Urbano, is credited to him and Neikon together.

**Independent, and largely unheard**

He says he has more than a thousand unreleased songs, and describes himself as a graduate and a polyglot. Those are his own claims and there is no way to check either, but the volume is at least consistent with a catalogue full of numbered uploads and freestyles.

He has been interviewed on Dominican urban radio and on local television in Puerto Plata, and beyond that there is almost nothing written about him. That is the ordinary condition of a rapper who never moved to the capital: the work exists, the audience is local, and nobody outside the province has been asked to notice.',
       bio_es = 'Young Grin, de nombre Idelson Grin Hiraldo y anunciado como El Bolígrafo Letal, es rapero, compositor y productor dominicano, de Puerto Plata. Lleva trabajando la costa norte desde adolescente y se ha mantenido independiente todo el tiempo.

**La costa norte**

El rap dominicano se cuenta como una historia de Santo Domingo, a veces de Santiago y de vez en cuando de San Pedro. Puerto Plata no aparece. Es una costa turística con un puerto y un teleférico, y se da por sentado que su música es la que ponen los hoteles.

Él le puso a una canción el nombre de la ciudad y la sentó en el medio de su disco, que es lo que hace un rapero cuando el lugar es el asunto. Empezó a los quince con su primo Neikon y los dos trabajaron como dúo antes de que él saliera solo.

**El Bolígrafo Letal**

El álbum salió en 2014 por su propio sello y lo produjo él. Once temas, casi todos con invitados de la misma costa: Eres Dios, To’ Se Va A Quedar, I Live To My Way, Puerto Plata, Es Porque Te Amo, Judas Iscariotes, Carta A Mi Familia, La Única En Mi Vida, Sal Del Juego, Uno Eh Seixy.

Los títulos dicen qué clase de rapero es. Judas Iscariotes y Eres Dios en un mismo disco con Carta A Mi Familia, una carta a los suyos: este es un autor trabajando religión, traición y deber antes que dinero y carros. El apodo que se puso, el bolígrafo letal, va del lapicero.

También hizo un documental sobre el álbum, que es bastante autoarchivo para un artista de su tamaño. Un segundo disco, Sentimiento Urbano, está acreditado a él y a Neikon juntos.

**Independiente, y casi sin oírse**

Dice tener más de mil canciones sin publicar, y se describe como licenciado y políglota. Son afirmaciones suyas y ninguna se puede comprobar, pero el volumen al menos cuadra con un catálogo lleno de subidas numeradas y freestyles.

Lo han entrevistado en la radio urbana dominicana y en la televisión local de Puerto Plata, y fuera de eso no hay casi nada escrito sobre él. Esa es la condición corriente de un rapero que nunca se mudó a la capital: la obra existe, el público es local, y a nadie fuera de la provincia le han pedido que se entere.',
       updated_at = now()
 WHERE slug = 'young-grin';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'young-grin')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'young-grin')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Young Grin, born Idelson Grin Hiraldo and billed as El Bolígrafo Letal, is a Dominican rapper, songwriter and producer from Puerto Plata. He has been working the north coast since he was a teenager and has stayed independent throughout.","type":"text"}]},{"type":"paragraph","content":[{"text":"The north coast","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dominican rap is written about as a Santo Domingo story, occasionally as a Santiago one and now and then as a San Pedro one. Puerto Plata does not appear in it. It is a tourist coast with a port and a cable car, and its music is assumed to be whatever the hotels are playing.","type":"text"}]},{"type":"paragraph","content":[{"text":"He named a song after the city and put it in the middle of his album, which is what a rapper does when the place is the point. He started at fifteen with his cousin Neikon and the two of them worked as a duo before he went out alone.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Bolígrafo Letal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The album came out in 2014 on his own imprint and he produced it himself. Eleven tracks, most with guests from the same coast: Eres Dios, To’ Se Va A Quedar, I Live To My Way, Puerto Plata, Es Porque Te Amo, Judas Iscariotes, Carta A Mi Familia, La Única En Mi Vida, Sal Del Juego, Uno Eh Seixy.","type":"text"}]},{"type":"paragraph","content":[{"text":"The titles say what kind of rapper he is. Judas Iscariotes and Eres Dios on one record with Carta A Mi Familia, a letter to his family — this is a writer working religion, betrayal and obligation rather than money and cars. The nickname he gave himself, the lethal ballpoint, is about the pen.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also made a documentary about the album, which is an unusual amount of self-archiving for an artist at his scale. A second album, Sentimiento Urbano, is credited to him and Neikon together.","type":"text"}]},{"type":"paragraph","content":[{"text":"Independent, and largely unheard","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He says he has more than a thousand unreleased songs, and describes himself as a graduate and a polyglot. Those are his own claims and there is no way to check either, but the volume is at least consistent with a catalogue full of numbered uploads and freestyles.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has been interviewed on Dominican urban radio and on local television in Puerto Plata, and beyond that there is almost nothing written about him. That is the ordinary condition of a rapper who never moved to the capital: the work exists, the audience is local, and nobody outside the province has been asked to notice.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'young-grin'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Young Grin, de nombre Idelson Grin Hiraldo y anunciado como El Bolígrafo Letal, es rapero, compositor y productor dominicano, de Puerto Plata. Lleva trabajando la costa norte desde adolescente y se ha mantenido independiente todo el tiempo.","type":"text"}]},{"type":"paragraph","content":[{"text":"La costa norte","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El rap dominicano se cuenta como una historia de Santo Domingo, a veces de Santiago y de vez en cuando de San Pedro. Puerto Plata no aparece. Es una costa turística con un puerto y un teleférico, y se da por sentado que su música es la que ponen los hoteles.","type":"text"}]},{"type":"paragraph","content":[{"text":"Él le puso a una canción el nombre de la ciudad y la sentó en el medio de su disco, que es lo que hace un rapero cuando el lugar es el asunto. Empezó a los quince con su primo Neikon y los dos trabajaron como dúo antes de que él saliera solo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Bolígrafo Letal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El álbum salió en 2014 por su propio sello y lo produjo él. Once temas, casi todos con invitados de la misma costa: Eres Dios, To’ Se Va A Quedar, I Live To My Way, Puerto Plata, Es Porque Te Amo, Judas Iscariotes, Carta A Mi Familia, La Única En Mi Vida, Sal Del Juego, Uno Eh Seixy.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los títulos dicen qué clase de rapero es. Judas Iscariotes y Eres Dios en un mismo disco con Carta A Mi Familia, una carta a los suyos: este es un autor trabajando religión, traición y deber antes que dinero y carros. El apodo que se puso, el bolígrafo letal, va del lapicero.","type":"text"}]},{"type":"paragraph","content":[{"text":"También hizo un documental sobre el álbum, que es bastante autoarchivo para un artista de su tamaño. Un segundo disco, Sentimiento Urbano, está acreditado a él y a Neikon juntos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Independiente, y casi sin oírse","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dice tener más de mil canciones sin publicar, y se describe como licenciado y políglota. Son afirmaciones suyas y ninguna se puede comprobar, pero el volumen al menos cuadra con un catálogo lleno de subidas numeradas y freestyles.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo han entrevistado en la radio urbana dominicana y en la televisión local de Puerto Plata, y fuera de eso no hay casi nada escrito sobre él. Esa es la condición corriente de un rapero que nunca se mudó a la capital: la obra existe, el público es local, y a nadie fuera de la provincia le han pedido que se entere.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'young-grin'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
