BEGIN;

-- Rewrite the catalogue entry for Voz a Voz.
--
-- Voz a Voz. Filler in English, nothing in Spanish, and typed as a solo artist
-- when it is a group -- the single biggest field error on the row.
--
-- CORRECTED: type solo_artist -> group; gender male -> group. Every source,
-- including the MusicBrainz record already on the row, calls them a duo, and
-- AllMusic names the three founders. Added birth_year 2005 as the founding
-- year, on the same convention this catalogue uses for orchestras: the debut
-- album En presencia del futuro is dated 2005 and is the first documented
-- activity. Province Distrito Nacional and birth_place Santo Domingo were
-- already stored and are confirmed by MusicBrainz's begin-area and by
-- AllMusic's "formed in Santo Domingo".
--
-- ADDED: aliases, occupations, genres, disambiguation.
--
-- SOURCES: AllMusic, biography by Evan C. Gutierrez, which names the founding
-- trio -- Gilberto César D'Oleo, Ammy Yatniel Acosta and David Leonardo Rosario
-- Pimentel -- the discovery at the Hotel Bávaro, the Urban Box Office signing
-- and the "Rhythm and Bachata" formulation. MusicBrainz for type, begin-area
-- and the release list from 2005 to 2022. Armario de Noticias, 1 April 2014,
-- and El Caribe, 4 April 2014, for the Premios Juventud nomination, the Japan
-- and Hawaii dates, the Destiny release date of 15 April 2014 under Sony Music
-- and Luz Record, the duet partner Lorenzo Méndez of La Original Banda El Limón
-- de Salvador Lizárraga, and the iTunes France placing for I Swear. Primera
-- Hora, 2 September 2014, and Diario Las Américas, 19 July 2014, for the
-- current pair. BuenaMusica for the hotel circuit and the album list.
--
-- NOT WRITTEN: AllMusic opens on the founders' childhood poverty and household
-- composition. That is private life and is left out. Follower counts are left
-- out as always.
--
-- FLAGGED, NOT RESOLVED: nobody documents when or why the trio became the duo
-- of Gio D'Oleo and Ronny Mercedes, or when Ronny Mercedes joined. Searching
-- for it returns nothing. The entry says the lineup changed and does not invent
-- a date.
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
       name = 'Voz a Voz',
       sort_name = 'Voz a Voz',
       type = 'group',
       status = 'published',
       gender = 'group',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = 2005,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['Voz A Voz']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['ballads-romantic']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@VOZAVOZ',
       facebook = 'VozAVozOficial',
       instagram = 'vozavozoficial',
       disambiguation = 'Dominican bachata duo, originally a trio; El mejor perfume, Estuvo aquí',
       bio_en = 'Voz a Voz is a Dominican vocal group that sings bachata with soul harmony underneath it. They started as a trio and have worked as a duo for most of their recording career.

**Hotel work**

The founders were Gilberto César D’Oleo, who performs as Gio, Ammy Yatniel Acosta and David Leonardo Rosario Pimentel. They were singing in hotels around Santo Domingo when a producer from the Urban Box Office label heard them at the Hotel Bávaro and signed them.

En presencia del futuro was the debut, and the pitch behind it was a pun they took seriously: a new R&B, meaning rhythm and bachata. Three-part vocal arrangements are not standard practice in the genre, and that is what the group is actually for.

**The duo**

The line-up narrowed to Gio D’Oleo and Ronny Mercedes, and no account explains when or why. What is documented is the run of records that followed: El mundo gira, then singles across a decade — Un día más, Mil lágrimas, Estuvo aquí, Te necesito, Duele saber, one of them cut with Daniel Santacruz.

The song that moved furthest was El mejor perfume, a duet with Lorenzo Méndez of La Original Banda El Limón de Salvador Lizárraga. Putting a Dominican bachata group next to a Sinaloan banda is not an obvious pairing, and it worked: the record charted in the tropical field and brought the group a Premios Juventud nomination.

**Where the records travel**

The compilation Destiny arrived in April 2014 through Sony Music and Luz Record, carrying El mejor perfume and I Swear, which found an audience in France and placed on the iTunes downloads chart there.

The touring goes further than the diaspora circuit most Dominican acts work. In 2014 they played three dates in Tokyo and returned to Hawaii, where they had been before, with shows in Kona and Honolulu — an audience with no Dominican community behind it, hearing bachata on its own terms.

La eterna maleta followed in 2017 and León éxodo in 2021, and singles have kept coming since.',
       bio_es = 'Voz a Voz es una agrupación vocal dominicana que canta bachata con armonía de soul por debajo. Empezaron como trío y han trabajado como dúo durante casi toda su carrera discográfica.

**El circuito de hoteles**

Los fundadores fueron Gilberto César D’Oleo, que se presenta como Gio, Ammy Yatniel Acosta y David Leonardo Rosario Pimentel. Cantaban en hoteles de Santo Domingo cuando un productor del sello Urban Box Office los oyó en el Hotel Bávaro y los firmó.

En presencia del futuro fue el debut, y detrás venía un juego de palabras que se tomaron en serio: un nuevo R&B, es decir rhythm and bachata. Los arreglos vocales a tres voces no son práctica corriente en el género, y para eso existe el grupo.

**El dúo**

La alineación se redujo a Gio D’Oleo y Ronny Mercedes, y ninguna fuente explica cuándo ni por qué. Lo que sí está documentado es la seguidilla de discos que vino después: El mundo gira, y luego sencillos a lo largo de una década — Un día más, Mil lágrimas, Estuvo aquí, Te necesito, Duele saber, este último grabado con Daniel Santacruz.

La canción que llegó más lejos fue El mejor perfume, a dúo con Lorenzo Méndez, de La Original Banda El Limón de Salvador Lizárraga. Poner un grupo de bachata dominicana al lado de una banda sinaloense no es una combinación obvia, y funcionó: el disco entró en las listas tropicales y le trajo al grupo una nominación a Premios Juventud.

**Hasta dónde llegan los discos**

El compilatorio Destiny salió en abril de 2014 por Sony Music y Luz Record, con El mejor perfume y con I Swear, que encontró público en Francia y se colocó en la lista de descargas de iTunes de ese país.

Las giras van más lejos que el circuito de la diáspora que trabaja la mayoría de los artistas dominicanos. En 2014 hicieron tres presentaciones en Tokio y volvieron a Hawái, donde ya habían estado, con funciones en Kona y Honolulú: un público sin comunidad dominicana detrás, oyendo bachata por lo que es.

La eterna maleta llegó en 2017 y León éxodo en 2021, y desde entonces han seguido saliendo sencillos.',
       updated_at = now()
 WHERE slug = 'voz-a-voz';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'voz-a-voz')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'voz-a-voz')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Voz a Voz is a Dominican vocal group that sings bachata with soul harmony underneath it. They started as a trio and have worked as a duo for most of their recording career.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hotel work","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The founders were Gilberto César D’Oleo, who performs as Gio, Ammy Yatniel Acosta and David Leonardo Rosario Pimentel. They were singing in hotels around Santo Domingo when a producer from the Urban Box Office label heard them at the Hotel Bávaro and signed them.","type":"text"}]},{"type":"paragraph","content":[{"text":"En presencia del futuro was the debut, and the pitch behind it was a pun they took seriously: a new R&B, meaning rhythm and bachata. Three-part vocal arrangements are not standard practice in the genre, and that is what the group is actually for.","type":"text"}]},{"type":"paragraph","content":[{"text":"The duo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The line-up narrowed to Gio D’Oleo and Ronny Mercedes, and no account explains when or why. What is documented is the run of records that followed: El mundo gira, then singles across a decade — Un día más, Mil lágrimas, Estuvo aquí, Te necesito, Duele saber, one of them cut with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"84aba9ce-ba69-4caa-b71b-2bedb2f848fc","displayText":"Daniel Santacruz","occurrenceId":"801163cb-677a-4824-91b3-05de1cf9c001"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"The song that moved furthest was El mejor perfume, a duet with Lorenzo Méndez of La Original Banda El Limón de Salvador Lizárraga. Putting a Dominican bachata group next to a Sinaloan banda is not an obvious pairing, and it worked: the record charted in the tropical field and brought the group a Premios Juventud nomination.","type":"text"}]},{"type":"paragraph","content":[{"text":"Where the records travel","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The compilation Destiny arrived in April 2014 through Sony Music and Luz Record, carrying El mejor perfume and I Swear, which found an audience in France and placed on the iTunes downloads chart there.","type":"text"}]},{"type":"paragraph","content":[{"text":"The touring goes further than the diaspora circuit most Dominican acts work. In 2014 they played three dates in Tokyo and returned to Hawaii, where they had been before, with shows in Kona and Honolulu — an audience with no Dominican community behind it, hearing bachata on its own terms.","type":"text"}]},{"type":"paragraph","content":[{"text":"La eterna maleta followed in 2017 and León éxodo in 2021, and singles have kept coming since.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'voz-a-voz'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Voz a Voz es una agrupación vocal dominicana que canta bachata con armonía de soul por debajo. Empezaron como trío y han trabajado como dúo durante casi toda su carrera discográfica.","type":"text"}]},{"type":"paragraph","content":[{"text":"El circuito de hoteles","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los fundadores fueron Gilberto César D’Oleo, que se presenta como Gio, Ammy Yatniel Acosta y David Leonardo Rosario Pimentel. Cantaban en hoteles de Santo Domingo cuando un productor del sello Urban Box Office los oyó en el Hotel Bávaro y los firmó.","type":"text"}]},{"type":"paragraph","content":[{"text":"En presencia del futuro fue el debut, y detrás venía un juego de palabras que se tomaron en serio: un nuevo R&B, es decir rhythm and bachata. Los arreglos vocales a tres voces no son práctica corriente en el género, y para eso existe el grupo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El dúo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La alineación se redujo a Gio D’Oleo y Ronny Mercedes, y ninguna fuente explica cuándo ni por qué. Lo que sí está documentado es la seguidilla de discos que vino después: El mundo gira, y luego sencillos a lo largo de una década — Un día más, Mil lágrimas, Estuvo aquí, Te necesito, Duele saber, este último grabado con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"84aba9ce-ba69-4caa-b71b-2bedb2f848fc","displayText":"Daniel Santacruz","occurrenceId":"3ce8c998-2815-4207-b88c-ae2cc2158ca9"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"La canción que llegó más lejos fue El mejor perfume, a dúo con Lorenzo Méndez, de La Original Banda El Limón de Salvador Lizárraga. Poner un grupo de bachata dominicana al lado de una banda sinaloense no es una combinación obvia, y funcionó: el disco entró en las listas tropicales y le trajo al grupo una nominación a Premios Juventud.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hasta dónde llegan los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El compilatorio Destiny salió en abril de 2014 por Sony Music y Luz Record, con El mejor perfume y con I Swear, que encontró público en Francia y se colocó en la lista de descargas de iTunes de ese país.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las giras van más lejos que el circuito de la diáspora que trabaja la mayoría de los artistas dominicanos. En 2014 hicieron tres presentaciones en Tokio y volvieron a Hawái, donde ya habían estado, con funciones en Kona y Honolulú: un público sin comunidad dominicana detrás, oyendo bachata por lo que es.","type":"text"}]},{"type":"paragraph","content":[{"text":"La eterna maleta llegó en 2017 y León éxodo en 2021, y desde entonces han seguido saliendo sencillos.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'voz-a-voz'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'voz-a-voz') AND locale = 'en'), '801163cb-677a-4824-91b3-05de1cf9c001', 'artist', '84aba9ce-ba69-4caa-b71b-2bedb2f848fc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'voz-a-voz') AND locale = 'es'), '3ce8c998-2815-4207-b88c-ae2cc2158ca9', 'artist', '84aba9ce-ba69-4caa-b71b-2bedb2f848fc');

COMMIT;
