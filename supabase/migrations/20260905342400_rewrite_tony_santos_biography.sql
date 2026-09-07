BEGIN;

-- Rewrite the catalogue entry for Tony Santos.
--
-- Tony Santos, el Rey del Amargue. Filler in both languages and the import
-- defaults in every geographic field.
--
-- OVERWRITTEN: birth_place "Santo Domingo" -> null and province "Distrito
-- Nacional" -> "San Cristobal". The old pair was the import default, not
-- research. No source states where he was born; every source that places him
-- places him in San Cristobal, so the province stands alone and birth_place
-- stays empty rather than carrying a guess.
--
-- CONFLATION WARNING, and it is the whole reason this entry needed care: he is
-- not Antony Santos, who has his own record in the catalogue. Dominican outlets
-- have made videos about the confusion. This is the older singer, the one
-- signed to Jose Luis Records in the eighties.
--
-- SOURCES: Discogs, release "Tony Santos (2) - Amarilis Echame Agua",
-- Dominican Republic, 1986. Radio Gladys Palmera's disc archive, which holds
-- the LP itself and gives the full title and catalogue number: "El rey del
-- amargue (Amarilis echame agua...)", Jose Luis Records LP-032, Republica
-- Dominicana, 1986. Classicos Pa'Goza, which reproduces the sleeve and the same
-- year and label. His own lyric in Cantando Por No Llorar -- "Pueblo, pueblo de
-- San Cristobal, Tony Santos te quiere" -- and Dominican bachata pages that
-- introduce him as "Tony Santos de San Cristobal". Spotify and MusicBrainz for
-- the releases: Amarilis 15 Exitos, El Chiqui Chiqui (1992, Jose Luis Records),
-- Libertad Para Beber (1997), El Rey del Amargue (2018), Leyenda Soy (2026),
-- plus a Homenaje a Ramon Cordero. OsirisRomeroTV's two-part interview of
-- January 2022, billed as an interview with the Rey del Amargue.
--
-- NOT WRITTEN: a birth date. None is published anywhere.
--
-- NOT USED: the paragraph beginning "Tony Santos es un bachatero de la linea
-- clasica o tradicional" and the one naming "El Original Tony Santos y el
-- legendario Marino Perez". Both appear verbatim under dozens of unrelated
-- Facebook and Instagram posts, including posts about Romeo Santos and about a
-- Panamanian band. They are recycled text, not testimony.
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
       name = 'Tony Santos',
       sort_name = 'Santos, Tony',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = 'San Cristóbal',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['El Rey del Amargue']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican bachata singer from San Cristóbal, known as El Rey del Amargue; not Antony Santos',
       bio_en = 'Tony Santos is a Dominican bachata singer from San Cristóbal, known as el Rey del Amargue. His record Amarilis Échame Agua is one of the songs that fixed what amargue sounded like.

**Amarilis**

The LP came out on José Luis Records, catalogue number LP-032, and its full title is El rey del amargue — the nickname was on the sleeve before it was in anyone’s mouth. Amarilis Échame Agua is the track that carried it, and the record went back to the same well twice: El regreso de Amarilis sits on the same side.

Amargue is bachata with the sweetness taken out. The guitar figures are the same ones Edilio Paredes and his generation were playing, but the singing is closer to complaint than to serenade, and the subject is usually a man who has lost and knows it. Santos sang it without any distance from it, which is the only way it works.

**The company he kept**

He belongs to the guitar-bachata line that runs through Ramón Cordero, Marino Pérez and Eladio Romero Santos — singers who worked the cantinas and the cabarets in the years when radio would not touch the music and the middle class called it something worse than rural. He later cut a Homenaje a Ramón Cordero, which places him squarely in that company by his own choosing.

**A long catalogue**

El Chiqui Chiqui came out on José Luis Records and is the album most people know: Ven Morena, Cepillo y Cepillo, Buscando Mi Mujer, No Hay Más Madera, María. The titles are doble sentido and the audience always understood exactly what they meant.

Libertad Para Beber followed, then compilations, then El Rey del Amargue under the name the LP had given him, and he is still releasing records — Leyenda Soy is recent. Cantando Por No Llorar contains the line he is quoted by at home: pueblo, pueblo de San Cristóbal, Tony Santos te quiere.

**One name, two singers**

He is not Antony Santos. The two are separate artists of different generations, and Dominican outlets have had to say so on camera more than once.',
       bio_es = 'Tony Santos es un cantante de bachata dominicano de San Cristóbal, conocido como el Rey del Amargue. Su disco Amarilis Échame Agua es una de las canciones que fijaron cómo suena el amargue.

**Amarilis**

El LP salió por José Luis Records, con número de catálogo LP-032, y su título completo es El rey del amargue: el apodo estaba en la portada antes de estar en boca de nadie. Amarilis Échame Agua es el tema que lo cargó, y el disco volvió dos veces al mismo pozo, porque El regreso de Amarilis está en el mismo lado.

El amargue es bachata con el dulce quitado. Las figuras de guitarra son las mismas que estaban tocando Edilio Paredes y su generación, pero el canto está más cerca de la queja que de la serenata, y el asunto casi siempre es un hombre que perdió y lo sabe. Santos lo cantaba sin ninguna distancia, que es la única manera en que eso funciona.

**La compañía que llevaba**

Pertenece a la línea de bachata de guitarra que pasa por Ramón Cordero, Marino Pérez y Eladio Romero Santos — cantantes que trabajaron las cantinas y los cabarets en los años en que la radio no tocaba esa música y la clase media la llamaba cosas peores que campesina. Más adelante grabó un Homenaje a Ramón Cordero, lo que lo pone en esa compañía por decisión propia.

**Un catálogo largo**

El Chiqui Chiqui salió por José Luis Records y es el álbum que más gente conoce: Ven Morena, Cepillo y Cepillo, Buscando Mi Mujer, No Hay Más Madera, María. Los títulos son de doble sentido y el público siempre entendió perfectamente qué querían decir.

Después vino Libertad Para Beber, luego recopilaciones, luego El Rey del Amargue con el nombre que le había puesto aquel LP, y sigue sacando discos: Leyenda Soy es reciente. En Cantando Por No Llorar está el verso con que lo citan en su tierra: pueblo, pueblo de San Cristóbal, Tony Santos te quiere.

**Un nombre, dos cantantes**

No es Antony Santos. Son artistas distintos de generaciones distintas, y en República Dominicana han tenido que aclararlo en cámara más de una vez.',
       updated_at = now()
 WHERE slug = 'tony-santos';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Tony Santos is a Dominican bachata singer from San Cristóbal, known as el Rey del Amargue. His record Amarilis Échame Agua is one of the songs that fixed what amargue sounded like.","type":"text"}]},{"type":"paragraph","content":[{"text":"Amarilis","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The LP came out on José Luis Records, catalogue number LP-032, and its full title is El rey del amargue — the nickname was on the sleeve before it was in anyone’s mouth. Amarilis Échame Agua is the track that carried it, and the record went back to the same well twice: El regreso de Amarilis sits on the same side.","type":"text"}]},{"type":"paragraph","content":[{"text":"Amargue is bachata with the sweetness taken out. The guitar figures are the same ones ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cbda65a4-c7da-4762-8cf8-f29b942d2ac3","displayText":"Edilio Paredes","occurrenceId":"30fa5a00-786f-4e58-92fb-aa686e424785"}},{"text":" and his generation were playing, but the singing is closer to complaint than to serenade, and the subject is usually a man who has lost and knows it. Santos sang it without any distance from it, which is the only way it works.","type":"text"}]},{"type":"paragraph","content":[{"text":"The company he kept","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He belongs to the guitar-bachata line that runs through ","type":"text"},{"type":"artistReference","attrs":{"artistId":"449f86a9-d10e-4fff-976f-9581fb3d03a1","displayText":"Ramón Cordero","occurrenceId":"764c6eb2-45df-4100-a957-893c846d0e9f"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8faf8748-31f9-4dbc-bfe1-d5b7fd70244e","displayText":"Marino Pérez","occurrenceId":"6e062790-ccc2-48d1-81c7-0564ba380929"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"634a12eb-24c4-4053-835b-806986a8a735","displayText":"Eladio Romero Santos","occurrenceId":"986ba9b8-231e-4f42-8518-72a650e201e3"}},{"text":" — singers who worked the cantinas and the cabarets in the years when radio would not touch the music and the middle class called it something worse than rural. He later cut a Homenaje a Ramón Cordero, which places him squarely in that company by his own choosing.","type":"text"}]},{"type":"paragraph","content":[{"text":"A long catalogue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Chiqui Chiqui came out on José Luis Records and is the album most people know: Ven Morena, Cepillo y Cepillo, Buscando Mi Mujer, No Hay Más Madera, María. The titles are doble sentido and the audience always understood exactly what they meant.","type":"text"}]},{"type":"paragraph","content":[{"text":"Libertad Para Beber followed, then compilations, then El Rey del Amargue under the name the LP had given him, and he is still releasing records — Leyenda Soy is recent. Cantando Por No Llorar contains the line he is quoted by at home: pueblo, pueblo de San Cristóbal, Tony Santos te quiere.","type":"text"}]},{"type":"paragraph","content":[{"text":"One name, two singers","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is not ","type":"text"},{"type":"artistReference","attrs":{"artistId":"28a3745e-90d6-45cd-b8bd-798028f8deb8","displayText":"Antony Santos","occurrenceId":"286bb98a-a95a-44cc-a871-d42be9d01461"}},{"text":". The two are separate artists of different generations, and Dominican outlets have had to say so on camera more than once.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'tony-santos'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Tony Santos es un cantante de bachata dominicano de San Cristóbal, conocido como el Rey del Amargue. Su disco Amarilis Échame Agua es una de las canciones que fijaron cómo suena el amargue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Amarilis","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El LP salió por José Luis Records, con número de catálogo LP-032, y su título completo es El rey del amargue: el apodo estaba en la portada antes de estar en boca de nadie. Amarilis Échame Agua es el tema que lo cargó, y el disco volvió dos veces al mismo pozo, porque El regreso de Amarilis está en el mismo lado.","type":"text"}]},{"type":"paragraph","content":[{"text":"El amargue es bachata con el dulce quitado. Las figuras de guitarra son las mismas que estaban tocando ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cbda65a4-c7da-4762-8cf8-f29b942d2ac3","displayText":"Edilio Paredes","occurrenceId":"65c2e00b-1971-4997-8a62-eb43be1c5282"}},{"text":" y su generación, pero el canto está más cerca de la queja que de la serenata, y el asunto casi siempre es un hombre que perdió y lo sabe. Santos lo cantaba sin ninguna distancia, que es la única manera en que eso funciona.","type":"text"}]},{"type":"paragraph","content":[{"text":"La compañía que llevaba","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pertenece a la línea de bachata de guitarra que pasa por ","type":"text"},{"type":"artistReference","attrs":{"artistId":"449f86a9-d10e-4fff-976f-9581fb3d03a1","displayText":"Ramón Cordero","occurrenceId":"dae379c8-dd6b-4da9-a934-1e7463af4c49"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8faf8748-31f9-4dbc-bfe1-d5b7fd70244e","displayText":"Marino Pérez","occurrenceId":"8383dfc9-8f61-4271-a4d2-13440cde4b57"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"634a12eb-24c4-4053-835b-806986a8a735","displayText":"Eladio Romero Santos","occurrenceId":"ba5f4b09-dab3-4aa4-bdba-d1062d45f160"}},{"text":" — cantantes que trabajaron las cantinas y los cabarets en los años en que la radio no tocaba esa música y la clase media la llamaba cosas peores que campesina. Más adelante grabó un Homenaje a Ramón Cordero, lo que lo pone en esa compañía por decisión propia.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un catálogo largo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Chiqui Chiqui salió por José Luis Records y es el álbum que más gente conoce: Ven Morena, Cepillo y Cepillo, Buscando Mi Mujer, No Hay Más Madera, María. Los títulos son de doble sentido y el público siempre entendió perfectamente qué querían decir.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después vino Libertad Para Beber, luego recopilaciones, luego El Rey del Amargue con el nombre que le había puesto aquel LP, y sigue sacando discos: Leyenda Soy es reciente. En Cantando Por No Llorar está el verso con que lo citan en su tierra: pueblo, pueblo de San Cristóbal, Tony Santos te quiere.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un nombre, dos cantantes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"No es ","type":"text"},{"type":"artistReference","attrs":{"artistId":"28a3745e-90d6-45cd-b8bd-798028f8deb8","displayText":"Antony Santos","occurrenceId":"c3d39a66-bebb-4d1f-9c90-d805f83ca716"}},{"text":". Son artistas distintos de generaciones distintas, y en República Dominicana han tenido que aclararlo en cámara más de una vez.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'tony-santos'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'en'), '286bb98a-a95a-44cc-a871-d42be9d01461', 'artist', '28a3745e-90d6-45cd-b8bd-798028f8deb8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'en'), '30fa5a00-786f-4e58-92fb-aa686e424785', 'artist', 'cbda65a4-c7da-4762-8cf8-f29b942d2ac3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'en'), '6e062790-ccc2-48d1-81c7-0564ba380929', 'artist', '8faf8748-31f9-4dbc-bfe1-d5b7fd70244e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'en'), '764c6eb2-45df-4100-a957-893c846d0e9f', 'artist', '449f86a9-d10e-4fff-976f-9581fb3d03a1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'en'), '986ba9b8-231e-4f42-8518-72a650e201e3', 'artist', '634a12eb-24c4-4053-835b-806986a8a735');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'es'), '65c2e00b-1971-4997-8a62-eb43be1c5282', 'artist', 'cbda65a4-c7da-4762-8cf8-f29b942d2ac3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'es'), '8383dfc9-8f61-4271-a4d2-13440cde4b57', 'artist', '8faf8748-31f9-4dbc-bfe1-d5b7fd70244e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'es'), 'ba5f4b09-dab3-4aa4-bdba-d1062d45f160', 'artist', '634a12eb-24c4-4053-835b-806986a8a735');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'es'), 'c3d39a66-bebb-4d1f-9c90-d805f83ca716', 'artist', '28a3745e-90d6-45cd-b8bd-798028f8deb8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tony-santos') AND locale = 'es'), 'dae379c8-dd6b-4da9-a934-1e7463af4c49', 'artist', '449f86a9-d10e-4fff-976f-9581fb3d03a1');

COMMIT;
