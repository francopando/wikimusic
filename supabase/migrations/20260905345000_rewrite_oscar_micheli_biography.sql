BEGIN;

-- Rewrite the catalogue entry for Oscar Micheli.
--
-- Oscar Micheli. Filler in English, nothing in Spanish, no dates, no
-- instruments -- on a man whose instrument is the whole point of him.
--
-- ADDED: date of birth 14 December 1972, piano in instruments, and the
-- occupations he actually holds -- pianist, composer, arranger, bandleader and
-- music educator. primary_role musician -> instrumentalist.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo". Every source says he left Santo Domingo in 1995 and none says he
-- was born there. The value is consistent with everything known and is not
-- contradicted, so it stands, but it is not confirmed.
--
-- SOURCES: Jazz en Dominicana, the Dominican jazz site of record, which carries
-- the same standing biography across several posts (May 2022, June 2023):
-- "Micheli comenzo sus estudios a temprana edad; a fines de 1995, partio de
-- Santo Domingo para estudiar en la prestigiosa Berklee College of Music...
-- graduandose en 1999 en Jazz Composition and Arranging"; the list of artists
-- he has worked with -- Patricia Pereyra, Xiomara Fortuna, Guarionex Aquino,
-- Chichi Peralta and Juan Luis Guerra; the festivals -- South Florida Dominican
-- Jazz Fest in Miami, Festival de Jazz Casa de Teatro, Semana Dominicana in
-- Miami, Hudson River Jazz Fest in New York, and the Dominican Republic Jazz
-- Festival alongside Arturo Sandoval, Chucho Valdes, Giovanni Hidalgo, David
-- Sanchez, Steve Khan, Ramon Vasquez, Felle Vega and Nestor Torres; his post as
-- professor at the Escuela Internacional de Musica of the UNPHU and his
-- authorship of Ear Training vols. 1, 2 and 3, used there; the lifetime
-- achievement recognition he received in the Dominican Republic at the
-- International Jazz Day celebrations of 2017; and the two albums, Swimming
-- Notes (2004), "arreglado, producido y parcialmente compuesto" by him and
-- picked up on radio in the United States, Venezuela and parts of Europe, and A
-- New World (2013), ten original compositions of his own. The same site's May
-- 2022 piece on Jazz vs Blues at La Quinta Dominica, in which he describes The
-- New Trio -- ECLECTIC 3 -- with Bryan Paniagua and Luigi Felix, and calls
-- Alfredo Balcacer a former student. Jazz en Dominicana's own filming of the
-- Oscar Micheli Trio for the New Orleans Jazz Museum: "Oscar Micheli on piano,
-- Guy Frometa on drums, and Luis 'Luigi' Feliz on bass". Javier Vargas, in his
-- 2010 interview with the same site, naming Micheli among his teachers of jazz
-- guitar, harmony and improvisation at the Conservatorio Nacional de Musica.
-- Chartmetric, LinkedIn and ReverbNation for the birth date and for the titles
-- Hidden Temple, Forest Voices, Tears in the Sky, Walking Down Mr. Bill, Step
-- To Heaven and Seven Days. Diario Libre, 2 September 2025, naming him among
-- the figures of Dominican jazz. The Indy Jazz Fest's 2018 opening night.
--
-- NOT LINKED: Guarionex Aquino has two entries in this catalogue -- padre and
-- hijo -- and the source does not say which of them he worked with, so neither
-- is referenced. Guy Frometa, Luigi Felix, Bryan Paniagua, Alfredo Balcacer,
-- Patricia Pereyra and Felle Vega have no entries; several plainly should.
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
       name = 'Oscar Micheli',
       sort_name = 'Micheli, Oscar',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'jazz',
       date_of_birth = '1972-12-14',
       birth_year = 1972,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Oscar',
       middle_name = NULL,
       last_name = 'Micheli',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '["pianist","composer","arranger","bandleader","music educator"]'::jsonb,
       instruments = ARRAY['piano']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://linktr.ee/oscarmicheli',
       youtube = '@oscarmicheli',
       facebook = 'oscar.micheli.79',
       instagram = 'oamicheli',
       disambiguation = 'Dominican jazz pianist, composer, arranger and educator; leads the Oscar Micheli Trio',
       bio_en = 'Oscar Micheli is a Dominican jazz pianist, composer, arranger and teacher, born on 14 December 1972. He leads the Oscar Micheli Trio and has spent as much of his working life training other musicians as performing.

**Leaving and coming back**

He started studying young in Santo Domingo and left at the end of 1995 for Berklee, graduating in 1999 in jazz composition and arranging. That is the standard route out for a Dominican jazz musician of his generation, and the unusual part is the return: he came back and stayed.

He teaches at the Escuela Internacional de Música of the UNPHU and wrote the three volumes of Ear Training the university uses. He also taught harmony and improvisation at the Conservatorio Nacional de Música, and Dominican musicians a generation younger name him among their teachers.

**The trio, and the trios after it**

The best known line-up is piano, Guy Frómeta on drums and Luis “Luigi” Feliz on bass. He has since rebuilt it more than once, calling the newer version The New Trio, and has recorded in solo piano, duo, sextet and big-band formats as well.

The trio has played the South Florida Dominican Jazz Fest, the Casa de Teatro jazz festival, the Hudson River Jazz Fest in New York, the Indy Jazz Fest and the Dominican Republic Jazz Festival, on bills that have included Arturo Sandoval, Chucho Valdés, Giovanni Hidalgo, David Sánchez and Steve Khan.

**Two records**

Swimming Notes came out in 2004, arranged and produced by him and partly written by him, and it got radio play in the United States, Venezuela and parts of Europe — which for a Dominican jazz record is a long reach.

A New World followed in 2013: ten compositions of his own, Caribbean and world-music colour, acoustic playing set against synthesised sound. He describes each track as a musical and spiritual conversation, which is a large claim, and the record is built to carry it.

**The session player’s other life**

Alongside his own name he has worked as producer, arranger and player for Chichi Peralta, Xiomara Fortuna and Juan Luis Guerra, among others. That is the economy of jazz in a small country: the concert is the vocation and the sessions are the trade, and the same hands do both.

In 2017 the Dominican Republic gave him a lifetime achievement recognition at its International Jazz Day celebrations. He belongs to the group of players — with Josean Jacobo and others — who made it possible to say that there are Dominican musicians who play only jazz, which was not true a generation ago.',
       bio_es = 'Oscar Micheli es un pianista, compositor, arreglista y profesor de jazz dominicano, nacido el 14 de diciembre de 1972. Dirige el Oscar Micheli Trío y ha dedicado tanto de su vida laboral a formar músicos como a tocar.

**Irse y volver**

Empezó a estudiar joven en Santo Domingo y se fue a finales de 1995 a Berklee, de donde se graduó en 1999 en composición y arreglos de jazz. Esa es la ruta de salida corriente para un músico de jazz dominicano de su generación, y lo raro es el regreso: volvió y se quedó.

Da clases en la Escuela Internacional de Música de la UNPHU y escribió los tres volúmenes de Ear Training que la universidad usa. También enseñó armonía e improvisación en el Conservatorio Nacional de Música, y músicos dominicanos de una generación más joven lo nombran entre sus maestros.

**El trío, y los tríos que vinieron después**

La formación más conocida es piano, Guy Frómeta en la batería y Luis “Luigi” Feliz en el bajo. Desde entonces la ha vuelto a armar más de una vez, y a la versión nueva la llama The New Trio; también ha grabado en piano solo, en dúo, en sexteto y en big band.

El trío ha tocado en el South Florida Dominican Jazz Fest, en el festival de jazz de Casa de Teatro, en el Hudson River Jazz Fest de Nueva York, en el Indy Jazz Fest y en el Dominican Republic Jazz Festival, en carteles donde han estado Arturo Sandoval, Chucho Valdés, Giovanni Hidalgo, David Sánchez y Steve Khan.

**Dos discos**

Swimming Notes salió en 2004, arreglado y producido por él y compuesto en parte por él, y sonó en radio en Estados Unidos, en Venezuela y en algunos países de Europa, que para un disco de jazz dominicano es llegar bastante lejos.

A New World vino en 2013: diez composiciones suyas, color caribeño y de música del mundo, lo acústico puesto contra el sonido sintetizado. Él describe cada tema como un diálogo musical y espiritual, que es una afirmación grande, y el disco está armado para sostenerla.

**La otra vida del músico de sesión**

Además de lo suyo ha trabajado como productor, arreglista e instrumentista para Chichi Peralta, Xiomara Fortuna y Juan Luis Guerra, entre otros. Esa es la economía del jazz en un país pequeño: el concierto es la vocación y las sesiones son el oficio, y las dos cosas las hacen las mismas manos.

En 2017 la República Dominicana le dio un reconocimiento a la trayectoria en sus celebraciones del Día Internacional del Jazz. Pertenece al grupo de instrumentistas —con Josean Jacobo y otros— que hizo posible decir que hay músicos dominicanos que tocan solamente jazz, lo que hace una generación no era cierto.',
       updated_at = now()
 WHERE slug = 'oscar-micheli';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Oscar Micheli is a Dominican jazz pianist, composer, arranger and teacher, born on 14 December 1972. He leads the Oscar Micheli Trio and has spent as much of his working life training other musicians as performing.","type":"text"}]},{"type":"paragraph","content":[{"text":"Leaving and coming back","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He started studying young in Santo Domingo and left at the end of 1995 for Berklee, graduating in 1999 in jazz composition and arranging. That is the standard route out for a Dominican jazz musician of his generation, and the unusual part is the return: he came back and stayed.","type":"text"}]},{"type":"paragraph","content":[{"text":"He teaches at the Escuela Internacional de Música of the UNPHU and wrote the three volumes of Ear Training the university uses. He also taught harmony and improvisation at the Conservatorio Nacional de Música, and Dominican musicians a generation younger name him among their teachers.","type":"text"}]},{"type":"paragraph","content":[{"text":"The trio, and the trios after it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The best known line-up is piano, Guy Frómeta on drums and Luis “Luigi” Feliz on bass. He has since rebuilt it more than once, calling the newer version The New Trio, and has recorded in solo piano, duo, sextet and big-band formats as well.","type":"text"}]},{"type":"paragraph","content":[{"text":"The trio has played the South Florida Dominican Jazz Fest, the Casa de Teatro jazz festival, the Hudson River Jazz Fest in New York, the Indy Jazz Fest and the Dominican Republic Jazz Festival, on bills that have included Arturo Sandoval, Chucho Valdés, Giovanni Hidalgo, David Sánchez and Steve Khan.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Swimming Notes came out in 2004, arranged and produced by him and partly written by him, and it got radio play in the United States, Venezuela and parts of Europe — which for a Dominican jazz record is a long reach.","type":"text"}]},{"type":"paragraph","content":[{"text":"A New World followed in 2013: ten compositions of his own, Caribbean and world-music colour, acoustic playing set against synthesised sound. He describes each track as a musical and spiritual conversation, which is a large claim, and the record is built to carry it.","type":"text"}]},{"type":"paragraph","content":[{"text":"The session player’s other life","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Alongside his own name he has worked as producer, arranger and player for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0337dec9-fe9d-485f-be56-a9120b92fbe8","displayText":"Chichi Peralta","occurrenceId":"8c948611-16c7-4df9-9d0e-7f8e651f1475"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8e29188a-215b-4c6c-b34a-45b381765e46","displayText":"Xiomara Fortuna","occurrenceId":"50cb178a-ee56-4196-9ccf-e03b799bc857"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"f899799e-d273-497d-87e3-d776d3159ad7"}},{"text":", among others. That is the economy of jazz in a small country: the concert is the vocation and the sessions are the trade, and the same hands do both.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 2017 the Dominican Republic gave him a lifetime achievement recognition at its International Jazz Day celebrations. He belongs to the group of players — with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"05bcf026-2c83-4944-bc0e-6e0befaa9d87","displayText":"Josean Jacobo","occurrenceId":"0d3e693b-59dc-4ab5-b1ed-d1175a6e0755"}},{"text":" and others — who made it possible to say that there are Dominican musicians who play only jazz, which was not true a generation ago.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'oscar-micheli'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Oscar Micheli es un pianista, compositor, arreglista y profesor de jazz dominicano, nacido el 14 de diciembre de 1972. Dirige el Oscar Micheli Trío y ha dedicado tanto de su vida laboral a formar músicos como a tocar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Irse y volver","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó a estudiar joven en Santo Domingo y se fue a finales de 1995 a Berklee, de donde se graduó en 1999 en composición y arreglos de jazz. Esa es la ruta de salida corriente para un músico de jazz dominicano de su generación, y lo raro es el regreso: volvió y se quedó.","type":"text"}]},{"type":"paragraph","content":[{"text":"Da clases en la Escuela Internacional de Música de la UNPHU y escribió los tres volúmenes de Ear Training que la universidad usa. También enseñó armonía e improvisación en el Conservatorio Nacional de Música, y músicos dominicanos de una generación más joven lo nombran entre sus maestros.","type":"text"}]},{"type":"paragraph","content":[{"text":"El trío, y los tríos que vinieron después","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La formación más conocida es piano, Guy Frómeta en la batería y Luis “Luigi” Feliz en el bajo. Desde entonces la ha vuelto a armar más de una vez, y a la versión nueva la llama The New Trio; también ha grabado en piano solo, en dúo, en sexteto y en big band.","type":"text"}]},{"type":"paragraph","content":[{"text":"El trío ha tocado en el South Florida Dominican Jazz Fest, en el festival de jazz de Casa de Teatro, en el Hudson River Jazz Fest de Nueva York, en el Indy Jazz Fest y en el Dominican Republic Jazz Festival, en carteles donde han estado Arturo Sandoval, Chucho Valdés, Giovanni Hidalgo, David Sánchez y Steve Khan.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Swimming Notes salió en 2004, arreglado y producido por él y compuesto en parte por él, y sonó en radio en Estados Unidos, en Venezuela y en algunos países de Europa, que para un disco de jazz dominicano es llegar bastante lejos.","type":"text"}]},{"type":"paragraph","content":[{"text":"A New World vino en 2013: diez composiciones suyas, color caribeño y de música del mundo, lo acústico puesto contra el sonido sintetizado. Él describe cada tema como un diálogo musical y espiritual, que es una afirmación grande, y el disco está armado para sostenerla.","type":"text"}]},{"type":"paragraph","content":[{"text":"La otra vida del músico de sesión","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Además de lo suyo ha trabajado como productor, arreglista e instrumentista para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0337dec9-fe9d-485f-be56-a9120b92fbe8","displayText":"Chichi Peralta","occurrenceId":"5646e14a-dc43-4e91-bb6b-8f462c102861"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8e29188a-215b-4c6c-b34a-45b381765e46","displayText":"Xiomara Fortuna","occurrenceId":"da370f1a-dab8-4e28-bbc8-61855e5e9ae3"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"c4c5f308-f3c3-4b54-a0ee-a1fee7e67009"}},{"text":", entre otros. Esa es la economía del jazz en un país pequeño: el concierto es la vocación y las sesiones son el oficio, y las dos cosas las hacen las mismas manos.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 2017 la República Dominicana le dio un reconocimiento a la trayectoria en sus celebraciones del Día Internacional del Jazz. Pertenece al grupo de instrumentistas —con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"05bcf026-2c83-4944-bc0e-6e0befaa9d87","displayText":"Josean Jacobo","occurrenceId":"eb7db79e-30f9-4bcb-b4a8-55a4d7777954"}},{"text":" y otros— que hizo posible decir que hay músicos dominicanos que tocan solamente jazz, lo que hace una generación no era cierto.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'oscar-micheli'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli') AND locale = 'en'), '0d3e693b-59dc-4ab5-b1ed-d1175a6e0755', 'artist', '05bcf026-2c83-4944-bc0e-6e0befaa9d87');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli') AND locale = 'en'), '50cb178a-ee56-4196-9ccf-e03b799bc857', 'artist', '8e29188a-215b-4c6c-b34a-45b381765e46');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli') AND locale = 'en'), '8c948611-16c7-4df9-9d0e-7f8e651f1475', 'artist', '0337dec9-fe9d-485f-be56-a9120b92fbe8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli') AND locale = 'en'), 'f899799e-d273-497d-87e3-d776d3159ad7', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli') AND locale = 'es'), '5646e14a-dc43-4e91-bb6b-8f462c102861', 'artist', '0337dec9-fe9d-485f-be56-a9120b92fbe8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli') AND locale = 'es'), 'c4c5f308-f3c3-4b54-a0ee-a1fee7e67009', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli') AND locale = 'es'), 'da370f1a-dab8-4e28-bbc8-61855e5e9ae3', 'artist', '8e29188a-215b-4c6c-b34a-45b381765e46');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-micheli') AND locale = 'es'), 'eb7db79e-30f9-4bcb-b4a8-55a4d7777954', 'artist', '05bcf026-2c83-4944-bc0e-6e0befaa9d87');

COMMIT;
