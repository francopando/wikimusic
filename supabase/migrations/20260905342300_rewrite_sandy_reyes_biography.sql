BEGIN;

-- Rewrite the catalogue entry for Sandy Reyes.
--
-- Sandy Reyes. Filler in both languages, no dates, no real name, and the wrong
-- province -- the record said Distrito Nacional / Santo Domingo, which is the
-- import default. He is from La Vega and is still there.
--
-- OVERWRITTEN, and the old values were the generic import defaults, not
-- research: province Distrito Nacional -> La Vega, birth_place Santo Domingo ->
-- Concepcion de La Vega.
--
-- SOURCES: Listin Diario, 16 February 2025, "El merenguero Sandy Reyes, una voz
-- de oro del merengue dominicano": "Nacido el 9 de noviembre de 1955 en
-- Concepcion de La Vega". The same date and town in Merengazo FM and in
-- Republica Merengue, and Sergio Vargas's own page gives 9 November for the
-- birthday. SODAIE's notice of the homage of 14 February 2025 at the Casa Club
-- del Colegio de Abogados de La Vega, held by the Oficina Nacional de Derecho
-- de Autor with SGACEDOM, SODAIE and EGECAM, and headed by ONDA's director
-- general Jose Ruben Gonell Cosme, who called it "un acto de justicia con uno
-- de los interpretes mas notables de nuestra musica"; Diario Libre and El Dia
-- covered the same evening, and the La Vega town hall gave him a pergamino.
-- Listin Diario, 21 January 2020, for the beginning: a boy singing in the piano
-- bar of the Hotel El Comodoro in a group directed by Rafelito Cepeda, wanting
-- to be a romantic singer. LA RADIO ESTACION's transfers of the 1981 Wilfrido
-- Vargas y sus Beduinos sides Abusadora and Merecumbe, the first credited on
-- screen to Miguel Figueroa as composer. MusicBrainz for the releases:
-- Abusadora...! (1981), Wilfrido Vargas & Sandy Reyes (1982), Bachata de
-- America (1994). Republica Merengue for the run of titles he is known by --
-- El guardia del arsenal, Solina, Margarita, Pajaro Chowi, Abusadora, Enamorar.
-- Enamorar dated to 1986 with his own orchestra by several Dominican merengue
-- pages. A recorded interview clip naming him singing No me dejes solo with Los
-- Hijos del Rey, and a SoundCloud transfer of Un pie aqui y otro alla credited
-- to Sandy Reyes y Los Hijos del Rey.
--
-- NOT WRITTEN: his health, and the years he spent out of music. Dominican
-- outlets have covered both at length since 2019. Neither is musical work.
--
-- NOT LINKED: Los Hijos del Rey and Rafelito Cepeda, who have no entries yet.
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
       name = 'Sandy Reyes',
       sort_name = 'Reyes, Sandy',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = '1955-11-09',
       birth_year = 1955,
       date_of_death = NULL,
       birth_place = 'Concepción de La Vega',
       province = 'La Vega',
       first_name = 'Salvador',
       middle_name = NULL,
       last_name = 'Reyes',
       second_last_name = 'Pichardo',
       stage_name = 'Sandy Reyes',
       aliases = ARRAY['Salvador Reyes Pichardo']::text[],
       occupations = '["bandleader"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['bachata']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican merengue singer; lead voice of Wilfrido Vargas y sus Beduinos',
       bio_en = 'Sandy Reyes is a Dominican merengue singer, born Salvador Reyes Pichardo in Concepción de La Vega on 9 November 1955. He was the lead voice of Wilfrido Vargas y sus Beduinos in the years when that orchestra was carrying merengue out of the country, and the voice on Abusadora, Merecumbé and El Pájaro Chowi.

**A piano bar and a wrong ambition**

He started in the piano bar of the Hotel El Comodoro, in a group directed by Rafelito Cepeda, and what he wanted then was to be a romantic singer. Merengue was not the plan. He had the instrument for it — a high, clean, unforced tenor that could sit on top of a brass section without shouting — and merengue is where that instrument was needed.

**The Beduinos years**

Wilfrido Vargas recruited him, and the pairing produced the records people still name first: Abusadora, written by Miguel Figueroa; Merecumbé; El Pájaro Chowi; El guardia del arsenal; Solina; Margarita. A 1982 album went out under both their names.

What he brought to that band was placement. Vargas built arrangements around horn lines that move fast and leave very little room, and a singer who fights them loses. Reyes sang over the top of them, in tune and in tempo and without strain, which is why the vocals on those records still sound easy fifty years later while the band underneath is working hard.

**His own orchestra**

He left to front his own group. Enamorar came out of that period and became the song most associated with his name — a merengue slow enough to hear the voice, which was the point of having him sing it.

He also sang with Los Hijos del Rey, and later cut a bachata album, Bachata de América, which put a merengue voice in a genre that in those years was only beginning to be treated as respectable.

**Recognition at home**

On 14 February 2025 the Oficina Nacional de Derecho de Autor, together with SGACEDOM, SODAIE and EGECAM, honoured him at the Casa Club del Colegio de Abogados in La Vega. ONDA’s director general, José Rubén Gonell Cosme, called it an act of justice toward one of the most notable interpreters of Dominican music. The town hall of La Vega gave him a pergamino the same evening.

Dominican musicians argue constantly about who the best merengue voice was. Reyes is one of the two or three names that come up every time the argument is held.',
       bio_es = 'Sandy Reyes es un cantante de merengue dominicano, nacido Salvador Reyes Pichardo en Concepción de La Vega el 9 de noviembre de 1955. Fue la voz principal de Wilfrido Vargas y sus Beduinos en los años en que aquella orquesta sacaba el merengue del país, y es la voz de Abusadora, Merecumbé y El Pájaro Chowi.

**Un piano bar y una ambición equivocada**

Empezó en el piano bar del Hotel El Comodoro, en un grupo que dirigía Rafelito Cepeda, y lo que quería entonces era ser cantante romántico. El merengue no estaba en el plan. Tenía el instrumento para el merengue —un tenor alto, limpio, sin esfuerzo, capaz de sentarse encima de una sección de metales sin gritar— y el merengue es donde hacía falta ese instrumento.

**Los años con los Beduinos**

Wilfrido Vargas lo reclutó, y de esa unión salieron los discos que la gente nombra primero: Abusadora, que escribió Miguel Figueroa; Merecumbé; El Pájaro Chowi; El guardia del arsenal; Solina; Margarita. En 1982 salió un álbum con los dos nombres en la portada.

Lo que le aportó a aquella banda fue colocación. Vargas armaba los arreglos sobre líneas de metal que corren rápido y dejan muy poco espacio, y el cantante que pelea con ellas pierde. Reyes cantaba por encima, afinado y en tiempo y sin forzar, y por eso las voces de aquellos discos todavía suenan fáciles cincuenta años después mientras la banda de abajo está trabajando duro.

**Orquesta propia**

Se fue a montar su propio grupo. De ese período salió Enamorar, la canción que más se asocia con su nombre: un merengue lento como para que se oiga la voz, que era exactamente para lo que uno lo ponía a cantar.

También cantó con Los Hijos del Rey, y más adelante grabó un disco de bachata, Bachata de América, que puso una voz de merengue en un género que apenas empezaba a ser tratado como respetable.

**El reconocimiento en su tierra**

El 14 de febrero de 2025 la Oficina Nacional de Derecho de Autor, junto a SGACEDOM, SODAIE y EGECAM, lo homenajeó en la Casa Club del Colegio de Abogados de La Vega. El director general de la ONDA, José Rubén Gonell Cosme, lo llamó un acto de justicia con uno de los intérpretes más notables de la música dominicana. El ayuntamiento de La Vega le entregó un pergamino esa misma noche.

Los músicos dominicanos discuten sin parar cuál fue la mejor voz del merengue. Reyes es uno de los dos o tres nombres que salen cada vez que se arma la discusión.',
       updated_at = now()
 WHERE slug = 'sandy-reyes';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandy-reyes')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandy-reyes')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Sandy Reyes is a Dominican merengue singer, born Salvador Reyes Pichardo in Concepción de La Vega on 9 November 1955. He was the lead voice of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"12fa9ea4-045f-4f51-8474-08b6bd601730"}},{"text":" y sus Beduinos in the years when that orchestra was carrying merengue out of the country, and the voice on Abusadora, Merecumbé and El Pájaro Chowi.","type":"text"}]},{"type":"paragraph","content":[{"text":"A piano bar and a wrong ambition","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He started in the piano bar of the Hotel El Comodoro, in a group directed by Rafelito Cepeda, and what he wanted then was to be a romantic singer. Merengue was not the plan. He had the instrument for it — a high, clean, unforced tenor that could sit on top of a brass section without shouting — and merengue is where that instrument was needed.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Beduinos years","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Wilfrido Vargas recruited him, and the pairing produced the records people still name first: Abusadora, written by Miguel Figueroa; Merecumbé; El Pájaro Chowi; El guardia del arsenal; Solina; Margarita. A 1982 album went out under both their names.","type":"text"}]},{"type":"paragraph","content":[{"text":"What he brought to that band was placement. Vargas built arrangements around horn lines that move fast and leave very little room, and a singer who fights them loses. Reyes sang over the top of them, in tune and in tempo and without strain, which is why the vocals on those records still sound easy fifty years later while the band underneath is working hard.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own orchestra","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He left to front his own group. Enamorar came out of that period and became the song most associated with his name — a merengue slow enough to hear the voice, which was the point of having him sing it.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also sang with Los Hijos del Rey, and later cut a bachata album, Bachata de América, which put a merengue voice in a genre that in those years was only beginning to be treated as respectable.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recognition at home","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"On 14 February 2025 the Oficina Nacional de Derecho de Autor, together with SGACEDOM, SODAIE and EGECAM, honoured him at the Casa Club del Colegio de Abogados in La Vega. ONDA’s director general, José Rubén Gonell Cosme, called it an act of justice toward one of the most notable interpreters of Dominican music. The town hall of La Vega gave him a pergamino the same evening.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican musicians argue constantly about who the best merengue voice was. Reyes is one of the two or three names that come up every time the argument is held.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'sandy-reyes'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Sandy Reyes es un cantante de merengue dominicano, nacido Salvador Reyes Pichardo en Concepción de La Vega el 9 de noviembre de 1955. Fue la voz principal de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"c971f425-9bb5-4889-ba4a-db46e16f1dbb"}},{"text":" y sus Beduinos en los años en que aquella orquesta sacaba el merengue del país, y es la voz de Abusadora, Merecumbé y El Pájaro Chowi.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un piano bar y una ambición equivocada","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó en el piano bar del Hotel El Comodoro, en un grupo que dirigía Rafelito Cepeda, y lo que quería entonces era ser cantante romántico. El merengue no estaba en el plan. Tenía el instrumento para el merengue —un tenor alto, limpio, sin esfuerzo, capaz de sentarse encima de una sección de metales sin gritar— y el merengue es donde hacía falta ese instrumento.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los años con los Beduinos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Wilfrido Vargas lo reclutó, y de esa unión salieron los discos que la gente nombra primero: Abusadora, que escribió Miguel Figueroa; Merecumbé; El Pájaro Chowi; El guardia del arsenal; Solina; Margarita. En 1982 salió un álbum con los dos nombres en la portada.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que le aportó a aquella banda fue colocación. Vargas armaba los arreglos sobre líneas de metal que corren rápido y dejan muy poco espacio, y el cantante que pelea con ellas pierde. Reyes cantaba por encima, afinado y en tiempo y sin forzar, y por eso las voces de aquellos discos todavía suenan fáciles cincuenta años después mientras la banda de abajo está trabajando duro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Orquesta propia","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se fue a montar su propio grupo. De ese período salió Enamorar, la canción que más se asocia con su nombre: un merengue lento como para que se oiga la voz, que era exactamente para lo que uno lo ponía a cantar.","type":"text"}]},{"type":"paragraph","content":[{"text":"También cantó con Los Hijos del Rey, y más adelante grabó un disco de bachata, Bachata de América, que puso una voz de merengue en un género que apenas empezaba a ser tratado como respetable.","type":"text"}]},{"type":"paragraph","content":[{"text":"El reconocimiento en su tierra","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El 14 de febrero de 2025 la Oficina Nacional de Derecho de Autor, junto a SGACEDOM, SODAIE y EGECAM, lo homenajeó en la Casa Club del Colegio de Abogados de La Vega. El director general de la ONDA, José Rubén Gonell Cosme, lo llamó un acto de justicia con uno de los intérpretes más notables de la música dominicana. El ayuntamiento de La Vega le entregó un pergamino esa misma noche.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los músicos dominicanos discuten sin parar cuál fue la mejor voz del merengue. Reyes es uno de los dos o tres nombres que salen cada vez que se arma la discusión.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'sandy-reyes'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandy-reyes') AND locale = 'en'), '12fa9ea4-045f-4f51-8474-08b6bd601730', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandy-reyes') AND locale = 'es'), 'c971f425-9bb5-4889-ba4a-db46e16f1dbb', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

COMMIT;
