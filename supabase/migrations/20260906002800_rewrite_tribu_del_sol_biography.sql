BEGIN;

-- Rewrite the catalogue entry for Tribu del Sol.
--
-- Tribu del Sol. Filler in English, nothing in Spanish -- and the record said a
-- solo male artist, on a three-piece band fronted by a woman.
--
-- CORRECTED: type solo_artist -> group and gender male -> group. The band is
-- Laura Rivera on lead vocals, Rafa Payan on guitar and Papolo Pumarol on
-- drums, and Rivera is the voice everybody remembers.
--
-- ADDED: birth_year 1997, the founding year, and composer in occupations.
--
-- LEFT ALONE, lightly flagged: province "Distrito Nacional" and birth_place
-- "Santo Domingo". Nothing found names a city, but every venue, festival and
-- scene they belong to is Santo Domingo's, so the value is consistent.
--
-- SOURCES: Diario Libre, Listin Diario and Las Primeras, 9 and 12 October 2023,
-- on the twenty-fifth anniversary concert at the Teatro La Fiesta of the Hotel
-- Jaragua: the band "se formo en septiembre de 1997, por la iniciativa de un
-- grupo de amigos con una necesidad comun: hacer buena musica", and its first
-- record, Buscando una Razon, went on sale on 8 October under the label Aljibe
-- Records. Sarah Pepen's account of the same anniversary, which dates the
-- professional debut to 1997 and names Buscame, Por Ti and Buscando una Razon
-- among the songs that landed. El Caribe, 6 June 2012, listing the twenty best
-- songs of Dominican rock, on Buscame: one of the great hits of the nineties,
-- which "introdujo al mundo una de las voces mas dulces con la que contamos".
-- Rossy Diaz Ferreras's survey "Rock dominicano en 100 discos esenciales",
-- which gives the line-up -- Laura Rivera on vocals, Rafa Payan on guitar,
-- Papolo Pumarol on drums -- and files the band as pop rock and alternative.
-- AlMomento, 4 July 2017, on the Hard Rock Live bill they shared with Toque
-- Profundo and Aljadaqui, describing "Poplo" as the drummer and Payan on first
-- guitar. Recuerdos Dominicanos, which lists Rivera as lead voice and the
-- band's iconic figure and Payan as guitarist, producer and arranger. Jazz en
-- Dominicana, June 2020, noting that Rivera also acts. Mralbertoon's transfers
-- of Amor Infinito, Quisiera Ser and Te Has Olvidado.
--
-- FLAGGED, and used carefully: Dominican pages report that Billboard's Latin
-- American editor picked Buscando una Razon as a Latin record of 1998. The
-- editor's name is given as "John Larner" in the post that carries it, which is
-- probably a misspelling of John Lannert, Billboard's Latin bureau chief in
-- that period. The entry credits Billboard's Latin editor without naming him,
-- since only the misspelt form could be sourced.
--
-- NOT LINKED: Laura Rivera, Rafa Payan and Papolo Pumarol have no entries.
-- Rivera in particular is a gap -- she is a singer and an actress with a
-- thirty-year career.
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
       name = 'Tribu del Sol',
       sort_name = 'Tribu del Sol',
       type = 'group',
       status = 'published',
       gender = 'group',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'rock',
       date_of_birth = NULL,
       birth_year = 1997,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = 'channel/UCBEr5dttsmJYyUT_pau1T_w',
       facebook = '100039573236006',
       instagram = 'tribudelsol_oficial',
       disambiguation = 'Dominican pop-rock band formed in 1997; Laura Rivera, Rafa Payán and Papolo Pumarol',
       bio_en = 'Tribu del Sol is a Dominican pop-rock band formed in September 1997 by a group of friends with, as they put it, one common need: to make good music. Laura Rivera sings, Rafa Payán plays guitar and produces, Papolo Pumarol plays drums.

**Buscando una Razón**

The first record went on sale on 8 October 1998 on Aljibe Records, and it did something Dominican rock records almost never do: it reached people who were not already in the scene.

Búscame is the song. El Caribe put it among the twenty best in the history of local rock and said what it actually did — it introduced the country to one of the sweetest voices it had. Por Ti and the title track came off the same record.

Billboard’s Latin editor picked the album among his records of 1998, which for a Dominican rock band on a small local label is an unusual place to land.

**A woman at the front**

Rivera is described in every account as the band’s iconic figure, and that is not only about the singing. Dominican rock in the nineties was overwhelmingly male, on stage and in the audience, and a three-piece led by a woman was a rarity that the scene noticed.

The arrangement behind her is spare — guitar, drums, voice — which leaves the voice exposed. That is a deliberate risk and it is why the record still works.

**Staying together**

They have kept playing. In 2017 they shared a Hard Rock Live bill with Toque Profundo and Aljadaqui, two of the other bands that carried Dominican rock through the same decades.

In October 2023 the three of them gathered their collaborators at the Teatro La Fiesta of the Hotel Jaragua to mark twenty-five years. Amor Infinito, Quisiera Ser and Te Has Olvidado are among the rest of the catalogue.

Rivera also acts. In a country where a rock band is rarely anybody’s only job, that is the normal shape of a long career rather than a sideline.',
       bio_es = 'Tribu del Sol es una banda dominicana de pop rock formada en septiembre de 1997 por un grupo de amigos con, según ellos mismos, una necesidad común: hacer buena música. Laura Rivera canta, Rafa Payán toca la guitarra y produce, Papolo Pumarol toca la batería.

**Buscando una Razón**

El primer disco salió a la venta el 8 de octubre de 1998 por Aljibe Records, e hizo algo que los discos de rock dominicano casi nunca hacen: llegó a gente que no estaba ya metida en la escena.

Búscame es la canción. El Caribe la puso entre las veinte mejores de la historia del rock local y dijo lo que de verdad hizo: le presentó al país una de las voces más dulces que tenía. Por Ti y el tema que da título al disco salieron del mismo álbum.

El editor latino de Billboard escogió el álbum entre sus discos de 1998, que para una banda de rock dominicana en un sello local pequeño es un sitio raro donde aterrizar.

**Una mujer al frente**

En todos los relatos Rivera aparece como la figura icónica de la banda, y eso no va solo por el canto. El rock dominicano de los noventa era abrumadoramente masculino, en el escenario y en el público, y un trío liderado por una mujer era una rareza que la escena notó.

El arreglo detrás de ella es escueto —guitarra, batería, voz—, lo que deja la voz al descubierto. Es un riesgo tomado a propósito y es la razón por la que el disco todavía funciona.

**Seguir juntos**

Han seguido tocando. En 2017 compartieron cartel en Hard Rock Live con Toque Profundo y Aljadaqui, dos de las otras bandas que cargaron el rock dominicano por las mismas décadas.

En octubre de 2023 los tres reunieron a sus cómplices en el Teatro La Fiesta del Hotel Jaragua para celebrar veinticinco años. Amor Infinito, Quisiera Ser y Te Has Olvidado están entre el resto del catálogo.

Rivera además actúa. En un país donde una banda de rock casi nunca es el único trabajo de nadie, esa es la forma normal de una carrera larga y no un pasatiempo.',
       updated_at = now()
 WHERE slug = 'tribu-del-sol';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tribu-del-sol')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tribu-del-sol')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Tribu del Sol is a Dominican pop-rock band formed in September 1997 by a group of friends with, as they put it, one common need: to make good music. Laura Rivera sings, Rafa Payán plays guitar and produces, Papolo Pumarol plays drums.","type":"text"}]},{"type":"paragraph","content":[{"text":"Buscando una Razón","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The first record went on sale on 8 October 1998 on Aljibe Records, and it did something Dominican rock records almost never do: it reached people who were not already in the scene.","type":"text"}]},{"type":"paragraph","content":[{"text":"Búscame is the song. El Caribe put it among the twenty best in the history of local rock and said what it actually did — it introduced the country to one of the sweetest voices it had. Por Ti and the title track came off the same record.","type":"text"}]},{"type":"paragraph","content":[{"text":"Billboard’s Latin editor picked the album among his records of 1998, which for a Dominican rock band on a small local label is an unusual place to land.","type":"text"}]},{"type":"paragraph","content":[{"text":"A woman at the front","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Rivera is described in every account as the band’s iconic figure, and that is not only about the singing. Dominican rock in the nineties was overwhelmingly male, on stage and in the audience, and a three-piece led by a woman was a rarity that the scene noticed.","type":"text"}]},{"type":"paragraph","content":[{"text":"The arrangement behind her is spare — guitar, drums, voice — which leaves the voice exposed. That is a deliberate risk and it is why the record still works.","type":"text"}]},{"type":"paragraph","content":[{"text":"Staying together","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"They have kept playing. In 2017 they shared a Hard Rock Live bill with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0a43fb92-e8f1-4413-b054-2aa46319385b","displayText":"Toque Profundo","occurrenceId":"8a61ed58-9ac7-44c1-9a28-06838c769221"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9656dc3d-a19b-439b-a13c-17624ae1826a","displayText":"Aljadaqui","occurrenceId":"311b411b-b7ca-496a-ae87-bb1a4679d730"}},{"text":", two of the other bands that carried Dominican rock through the same decades.","type":"text"}]},{"type":"paragraph","content":[{"text":"In October 2023 the three of them gathered their collaborators at the Teatro La Fiesta of the Hotel Jaragua to mark twenty-five years. Amor Infinito, Quisiera Ser and Te Has Olvidado are among the rest of the catalogue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rivera also acts. In a country where a rock band is rarely anybody’s only job, that is the normal shape of a long career rather than a sideline.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'tribu-del-sol'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Tribu del Sol es una banda dominicana de pop rock formada en septiembre de 1997 por un grupo de amigos con, según ellos mismos, una necesidad común: hacer buena música. Laura Rivera canta, Rafa Payán toca la guitarra y produce, Papolo Pumarol toca la batería.","type":"text"}]},{"type":"paragraph","content":[{"text":"Buscando una Razón","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El primer disco salió a la venta el 8 de octubre de 1998 por Aljibe Records, e hizo algo que los discos de rock dominicano casi nunca hacen: llegó a gente que no estaba ya metida en la escena.","type":"text"}]},{"type":"paragraph","content":[{"text":"Búscame es la canción. El Caribe la puso entre las veinte mejores de la historia del rock local y dijo lo que de verdad hizo: le presentó al país una de las voces más dulces que tenía. Por Ti y el tema que da título al disco salieron del mismo álbum.","type":"text"}]},{"type":"paragraph","content":[{"text":"El editor latino de Billboard escogió el álbum entre sus discos de 1998, que para una banda de rock dominicana en un sello local pequeño es un sitio raro donde aterrizar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una mujer al frente","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En todos los relatos Rivera aparece como la figura icónica de la banda, y eso no va solo por el canto. El rock dominicano de los noventa era abrumadoramente masculino, en el escenario y en el público, y un trío liderado por una mujer era una rareza que la escena notó.","type":"text"}]},{"type":"paragraph","content":[{"text":"El arreglo detrás de ella es escueto —guitarra, batería, voz—, lo que deja la voz al descubierto. Es un riesgo tomado a propósito y es la razón por la que el disco todavía funciona.","type":"text"}]},{"type":"paragraph","content":[{"text":"Seguir juntos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Han seguido tocando. En 2017 compartieron cartel en Hard Rock Live con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0a43fb92-e8f1-4413-b054-2aa46319385b","displayText":"Toque Profundo","occurrenceId":"a521239b-e6a1-4168-870f-2ef788f6d2b5"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9656dc3d-a19b-439b-a13c-17624ae1826a","displayText":"Aljadaqui","occurrenceId":"6e20a7a9-5b41-419f-9633-b90b61833ffd"}},{"text":", dos de las otras bandas que cargaron el rock dominicano por las mismas décadas.","type":"text"}]},{"type":"paragraph","content":[{"text":"En octubre de 2023 los tres reunieron a sus cómplices en el Teatro La Fiesta del Hotel Jaragua para celebrar veinticinco años. Amor Infinito, Quisiera Ser y Te Has Olvidado están entre el resto del catálogo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rivera además actúa. En un país donde una banda de rock casi nunca es el único trabajo de nadie, esa es la forma normal de una carrera larga y no un pasatiempo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'tribu-del-sol'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tribu-del-sol') AND locale = 'en'), '311b411b-b7ca-496a-ae87-bb1a4679d730', 'artist', '9656dc3d-a19b-439b-a13c-17624ae1826a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tribu-del-sol') AND locale = 'en'), '8a61ed58-9ac7-44c1-9a28-06838c769221', 'artist', '0a43fb92-e8f1-4413-b054-2aa46319385b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tribu-del-sol') AND locale = 'es'), '6e20a7a9-5b41-419f-9633-b90b61833ffd', 'artist', '9656dc3d-a19b-439b-a13c-17624ae1826a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tribu-del-sol') AND locale = 'es'), 'a521239b-e6a1-4168-870f-2ef788f6d2b5', 'artist', '0a43fb92-e8f1-4413-b054-2aa46319385b');

COMMIT;
