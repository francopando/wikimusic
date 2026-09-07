BEGIN;

-- Rewrite the catalogue entry for Epifanio Capellán.
--
-- Epifanio Capellan. Filler in English, nothing in Spanish, the wrong genre and
-- the wrong role. He was filed as a bachata instrumentalist. He is an
-- accordionist and singer of merengue tipico, recorded by Alan Lomax in 1967.
--
-- CORRECTED: primary_genre bachata -> merengue-perico-ripiao. The Discogs
-- credit for his one issued recording is explicit: "Capellan, vocal and
-- accordion, with unidentified guira, tambora, and vocals. Dominican Republic.
-- 1967." Accordion, guira and tambora is a perico ripiao conjunto and nothing
-- else.
--
-- CORRECTED: primary_role instrumentalist -> singer, which is this catalogue's
-- standing rule for tipico and perico ripiao artists: they sing first and the
-- accordion goes in occupations and instruments. Both are filled in here.
-- Dropped "musician" and "composer" from occupations; nothing credits him as
-- the author of anything, and Yo Si La Queria is a traditional piece.
--
-- LEFT ALONE AND FLAGGED: province and birth_place "Santiago". No source found
-- says where he was from; the Lomax archive gives only "Dominican Republic".
-- Santiago and the Cibao are where perico ripiao comes from, so the value is
-- plausible and it is not the importer's usual default, but it is unconfirmed.
--
-- SOURCES: the Lomax Digital Archive of the Association for Cultural Equity,
-- collection "Dominican Republic 1/67", which holds his session: Yo Si La
-- Queria, Juanita Morel, Dolores, Dolores (a cappella), Abreme La Puerta, Mi
-- Pensamiento and Hogar Por Ti Suspiro, together with an interview with
-- Epifanio Capellan about Juanita Morel and interviews with Brigido Mora about
-- Yo Si La Queria, Dolores and Abreme La Puerta. Discogs, for the reissue and
-- for the instrumental credit quoted above: "Root Hog Or Die (100 Songs, 100
-- Years) (An Alan Lomax Centennial Tribute)", the six-LP Mississippi Records
-- box of 2016, on which "Epifanio Capellan and group -- Yo Si La Queria" is one
-- of the hundred tracks. MusicBrainz, which files the same recording against
-- the 2017 issue of that box.
--
-- NOTE: the archive's own pages sit behind a human-verification challenge, so
-- the citations above come from the archive's public listings as indexed and
-- from Discogs, which reproduces the credit in full.
--
-- NOT WRITTEN: birth and death dates, and a town. None is published.
--
-- NOT LINKED: Brigido Mora, who is in the same session and has no entry.
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
       name = 'Epifanio Capellán',
       sort_name = 'Capellán, Epifanio',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue-perico-ripiao',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santiago',
       province = 'Santiago',
       first_name = 'Epifanio',
       middle_name = NULL,
       last_name = 'Capellán',
       second_last_name = NULL,
       stage_name = 'Epifanio Capellán',
       aliases = ARRAY[]::text[],
       occupations = '["accordionist"]'::jsonb,
       instruments = ARRAY['accordion']::text[],
       genres = ARRAY['folklore']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican merengue típico accordionist and singer recorded by Alan Lomax in 1967',
       bio_en = 'Epifanio Capellán is a Dominican merengue típico accordionist and singer. In January 1967 Alan Lomax recorded him and his group in the Dominican countryside, and those tapes are the reason his name survives.

**The session**

The credit on the issued track is precise about who was in the room: Capellán on voice and accordion, with unidentified güira, tambora and voices behind him. Accordion, güira and tambora is the perico ripiao conjunto — three instruments, no bass, no horns, and nowhere to hide.

Lomax took down seven pieces across the session: Yo Sí La Quería, Juanita Morel, Dolores twice over — once a cappella — Ábreme La Puerta, Mi Pensamiento and Hogar Por Ti Suspiro. He also recorded Capellán talking about Juanita Morel, and Brígido Mora talking about three of the others.

Juanita Morel is one of the oldest merengues anybody can name, the kind of piece that belongs to no one and gets played by everyone from the Cibao. Recording a man explaining it is the part of Lomax’s method that matters: he wanted the account as well as the performance.

**What a field recording is for**

This is not a career. There is no album under his name, no label, no dates, no town on record. What exists is one afternoon in 1967 in which a working accordionist sat down in front of a tape machine because a foreigner asked him to, and played the repertoire he already knew.

That is how most of the típico of that generation reaches us at all. Tatico Henríquez was recorded because he was famous. Capellán was recorded because he was there and he was good.

**Out of the archive**

Half a century later, Yo Sí La Quería was chosen for Root Hog or Die, the six-LP Mississippi Records box that marked the Lomax centenary with a hundred songs from a hundred years. His three minutes sit on it beside recordings from Haiti, the American South and half a dozen other places Lomax carried a machine to.

It is a small immortality and an accidental one, and it is more than almost anyone who played perico ripiao in 1967 got.',
       bio_es = 'Epifanio Capellán es un acordeonista y cantante de merengue típico dominicano. En enero de 1967 Alan Lomax lo grabó a él y a su grupo en el campo dominicano, y esas cintas son la razón por la que su nombre sobrevive.

**La sesión**

El crédito del tema publicado es preciso sobre quién estaba en el cuarto: Capellán en voz y acordeón, con güira, tambora y voces sin identificar detrás. Acordeón, güira y tambora es el conjunto de perico ripiao: tres instrumentos, sin bajo, sin metales y sin dónde esconderse.

Lomax levantó siete piezas en la sesión: Yo Sí La Quería, Juanita Morel, Dolores dos veces —una a capela—, Ábreme La Puerta, Mi Pensamiento y Hogar Por Ti Suspiro. También grabó a Capellán hablando de Juanita Morel, y a Brígido Mora hablando de otras tres.

Juanita Morel es uno de los merengues más viejos que alguien pueda nombrar, de esas piezas que no son de nadie y que toca todo el que sea del Cibao. Grabar a un hombre explicándola es la parte del método de Lomax que importa: quería el relato además de la ejecución.

**Para qué sirve una grabación de campo**

Esto no es una carrera. No hay álbum con su nombre, ni sello, ni fechas, ni pueblo anotado. Lo que hay es una tarde de 1967 en que un acordeonista de oficio se sentó delante de una grabadora porque un extranjero se lo pidió, y tocó el repertorio que ya se sabía.

Así es como nos llega casi todo el típico de aquella generación. A Tatico Henríquez lo grabaron porque era famoso. A Capellán lo grabaron porque estaba ahí y porque era bueno.

**Fuera del archivo**

Medio siglo después, Yo Sí La Quería fue escogida para Root Hog or Die, la caja de seis LP de Mississippi Records que marcó el centenario de Lomax con cien canciones de cien años. Sus tres minutos están ahí al lado de grabaciones de Haití, del sur de Estados Unidos y de media docena de sitios más a donde Lomax cargó una máquina.

Es una inmortalidad pequeña y accidental, y es más de lo que le tocó a casi nadie que tocara perico ripiao en 1967.',
       updated_at = now()
 WHERE slug = 'epifanio-capellan';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'epifanio-capellan')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'epifanio-capellan')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Epifanio Capellán is a Dominican merengue típico accordionist and singer. In January 1967 Alan Lomax recorded him and his group in the Dominican countryside, and those tapes are the reason his name survives.","type":"text"}]},{"type":"paragraph","content":[{"text":"The session","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The credit on the issued track is precise about who was in the room: Capellán on voice and accordion, with unidentified güira, tambora and voices behind him. Accordion, güira and tambora is the perico ripiao conjunto — three instruments, no bass, no horns, and nowhere to hide.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lomax took down seven pieces across the session: Yo Sí La Quería, Juanita Morel, Dolores twice over — once a cappella — Ábreme La Puerta, Mi Pensamiento and Hogar Por Ti Suspiro. He also recorded Capellán talking about Juanita Morel, and Brígido Mora talking about three of the others.","type":"text"}]},{"type":"paragraph","content":[{"text":"Juanita Morel is one of the oldest merengues anybody can name, the kind of piece that belongs to no one and gets played by everyone from the Cibao. Recording a man explaining it is the part of Lomax’s method that matters: he wanted the account as well as the performance.","type":"text"}]},{"type":"paragraph","content":[{"text":"What a field recording is for","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"This is not a career. There is no album under his name, no label, no dates, no town on record. What exists is one afternoon in 1967 in which a working accordionist sat down in front of a tape machine because a foreigner asked him to, and played the repertoire he already knew.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is how most of the típico of that generation reaches us at all. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"f191b84a-7e30-4c17-a448-997d69a97ff1"}},{"text":" was recorded because he was famous. Capellán was recorded because he was there and he was good.","type":"text"}]},{"type":"paragraph","content":[{"text":"Out of the archive","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Half a century later, Yo Sí La Quería was chosen for Root Hog or Die, the six-LP Mississippi Records box that marked the Lomax centenary with a hundred songs from a hundred years. His three minutes sit on it beside recordings from Haiti, the American South and half a dozen other places Lomax carried a machine to.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is a small immortality and an accidental one, and it is more than almost anyone who played perico ripiao in 1967 got.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'epifanio-capellan'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Epifanio Capellán es un acordeonista y cantante de merengue típico dominicano. En enero de 1967 Alan Lomax lo grabó a él y a su grupo en el campo dominicano, y esas cintas son la razón por la que su nombre sobrevive.","type":"text"}]},{"type":"paragraph","content":[{"text":"La sesión","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El crédito del tema publicado es preciso sobre quién estaba en el cuarto: Capellán en voz y acordeón, con güira, tambora y voces sin identificar detrás. Acordeón, güira y tambora es el conjunto de perico ripiao: tres instrumentos, sin bajo, sin metales y sin dónde esconderse.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lomax levantó siete piezas en la sesión: Yo Sí La Quería, Juanita Morel, Dolores dos veces —una a capela—, Ábreme La Puerta, Mi Pensamiento y Hogar Por Ti Suspiro. También grabó a Capellán hablando de Juanita Morel, y a Brígido Mora hablando de otras tres.","type":"text"}]},{"type":"paragraph","content":[{"text":"Juanita Morel es uno de los merengues más viejos que alguien pueda nombrar, de esas piezas que no son de nadie y que toca todo el que sea del Cibao. Grabar a un hombre explicándola es la parte del método de Lomax que importa: quería el relato además de la ejecución.","type":"text"}]},{"type":"paragraph","content":[{"text":"Para qué sirve una grabación de campo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Esto no es una carrera. No hay álbum con su nombre, ni sello, ni fechas, ni pueblo anotado. Lo que hay es una tarde de 1967 en que un acordeonista de oficio se sentó delante de una grabadora porque un extranjero se lo pidió, y tocó el repertorio que ya se sabía.","type":"text"}]},{"type":"paragraph","content":[{"text":"Así es como nos llega casi todo el típico de aquella generación. A ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"83178a0f-30c8-4383-8cf7-70afc08fd60c"}},{"text":" lo grabaron porque era famoso. A Capellán lo grabaron porque estaba ahí y porque era bueno.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fuera del archivo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Medio siglo después, Yo Sí La Quería fue escogida para Root Hog or Die, la caja de seis LP de Mississippi Records que marcó el centenario de Lomax con cien canciones de cien años. Sus tres minutos están ahí al lado de grabaciones de Haití, del sur de Estados Unidos y de media docena de sitios más a donde Lomax cargó una máquina.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una inmortalidad pequeña y accidental, y es más de lo que le tocó a casi nadie que tocara perico ripiao en 1967.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'epifanio-capellan'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'epifanio-capellan') AND locale = 'en'), 'f191b84a-7e30-4c17-a448-997d69a97ff1', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'epifanio-capellan') AND locale = 'es'), '83178a0f-30c8-4383-8cf7-70afc08fd60c', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');

COMMIT;
