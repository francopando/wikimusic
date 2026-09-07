BEGIN;

-- Rewrite the catalogue entry for JP RMT.
--
-- JP RMT. Filler in English, nothing in Spanish.
--
-- SHORT ON PURPOSE. He is working now and almost nothing about him has been
-- written down by anybody but himself and the accounts around him. The entry
-- says what those show and stops.
--
-- CORRECTED: primary_genre urbano -> urban-rap-hip-hop, with urbano moved into
-- genres. He raps; the coverage that exists is rap coverage.
--
-- ADDED: name Roberto J. S. Pena, taken from the display name on his own
-- Instagram account -- "JP RMT ( Roberto J.S.Pena)" -- which is self-declared
-- and therefore good enough. The alias Jhey Pi.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default. No source names a town.
--
-- SOURCES: his own Instagram and YouTube accounts. The recurring promotional
-- text carried under posts by many other Dominican artists -- "VOY SUBIENDO
-- DISPONIBLE EN YouTube ... JP RMT SUSCRIBETE ... HIGH LEVEL MUSIC" -- and the
-- phrasing "JP RMT PRESENTS", which is what identifies Voy Subiendo as
-- something he fronts rather than a record of his. El Genero's post asking
-- what viewers thought of "la Participacion de JP RMT en Voy subiendo". High
-- Level Music's own account, which also runs freestyle battles, among them El
-- Pupilo and Pendy, and Magnesio L against La Gerencia. Instagram posts naming
-- Muntty Music Beats and Izaguirre en el Beat as producers on his tracks, and a
-- shoot for Mambo Dominicano. Alofoke Music's follow.
--
-- NOT WRITTEN: a birth date, a discography and anything about the showcase's
-- reach. None of it is documented.
--
-- FLAGGED: Voy Subiendo looks like a YouTube showcase for emerging Dominican
-- urban artists rather than a song, and that reading comes from how the phrase
-- is used rather than from anyone saying so. If it is in fact a single of his,
-- this entry has it wrong.
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
       name = 'JP RMT',
       sort_name = 'JP RMT',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Roberto',
       middle_name = NULL,
       last_name = 'Peña',
       second_last_name = NULL,
       stage_name = 'JP RMT',
       aliases = ARRAY['Jhey Pi', 'Roberto J. S. Peña']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = NULL,
       youtube = '@JPRMT05',
       facebook = 'JPRMT05',
       instagram = 'jprmt05',
       disambiguation = 'Dominican rapper; fronts the Voy Subiendo showcase for High Level Music',
       bio_en = 'JP RMT is a Dominican rapper, born Roberto J. S. Peña. He works with High Level Music and fronts Voy Subiendo, the platform the label uses to put emerging Dominican urban artists in front of an audience.

**Voy Subiendo**

The phrase turns up under posts by dozens of other artists, always in the same shape: the title, the instruction to subscribe, his name and the label’s. That is what a showcase looks like from the outside — a piece of promotional text that other people carry because being carried by it is the point.

High Level Music also stages freestyle battles, and the same accounts that push Voy Subiendo push those. In a scene with almost no radio and no venues to speak of, a YouTube channel that will host you and an audience that already follows it is the whole infrastructure.

**His own records**

He records as well as presents. Mambo Dominicano was shot as a video, and producers including Muntty Music Beats and Izaguirre en el Beat have worked on his tracks. Alofoke Music, the largest urban platform in the country, follows him.

Beyond that the record is thin. There is no album, no interview and no date of birth published, and what exists has been published by him and by the people around him rather than by anybody standing outside it.',
       bio_es = 'JP RMT es un rapero dominicano, nacido Roberto J. S. Peña. Trabaja con High Level Music y encabeza Voy Subiendo, la plataforma con la que el sello pone a artistas urbanos dominicanos emergentes delante de un público.

**Voy Subiendo**

La frase aparece debajo de las publicaciones de decenas de otros artistas, siempre con la misma forma: el título, la orden de suscribirse, su nombre y el del sello. Así se ve una vitrina desde afuera: un texto de promoción que otros cargan porque que te carguen es justamente el asunto.

High Level Music también monta batallas de freestyle, y las mismas cuentas que empujan Voy Subiendo empujan aquello. En una escena sin casi radio y sin locales de los que hablar, un canal de YouTube que te reciba y un público que ya lo siga son toda la infraestructura.

**Sus propios discos**

Graba además de presentar. Mambo Dominicano se filmó como video, y productores como Muntty Music Beats e Izaguirre en el Beat han trabajado en sus temas. Alofoke Music, la plataforma urbana más grande del país, lo sigue.

De ahí para allá el registro es escaso. No hay álbum, ni entrevista, ni fecha de nacimiento publicada, y lo que existe lo han publicado él y la gente a su alrededor, no alguien de afuera.',
       updated_at = now()
 WHERE slug = 'jp-rmt';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jp-rmt')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jp-rmt')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"JP RMT is a Dominican rapper, born Roberto J. S. Peña. He works with High Level Music and fronts Voy Subiendo, the platform the label uses to put emerging Dominican urban artists in front of an audience.","type":"text"}]},{"type":"paragraph","content":[{"text":"Voy Subiendo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The phrase turns up under posts by dozens of other artists, always in the same shape: the title, the instruction to subscribe, his name and the label’s. That is what a showcase looks like from the outside — a piece of promotional text that other people carry because being carried by it is the point.","type":"text"}]},{"type":"paragraph","content":[{"text":"High Level Music also stages freestyle battles, and the same accounts that push Voy Subiendo push those. In a scene with almost no radio and no venues to speak of, a YouTube channel that will host you and an audience that already follows it is the whole infrastructure.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He records as well as presents. Mambo Dominicano was shot as a video, and producers including Muntty Music Beats and Izaguirre en el Beat have worked on his tracks. Alofoke Music, the largest urban platform in the country, follows him.","type":"text"}]},{"type":"paragraph","content":[{"text":"Beyond that the record is thin. There is no album, no interview and no date of birth published, and what exists has been published by him and by the people around him rather than by anybody standing outside it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'jp-rmt'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"JP RMT es un rapero dominicano, nacido Roberto J. S. Peña. Trabaja con High Level Music y encabeza Voy Subiendo, la plataforma con la que el sello pone a artistas urbanos dominicanos emergentes delante de un público.","type":"text"}]},{"type":"paragraph","content":[{"text":"Voy Subiendo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La frase aparece debajo de las publicaciones de decenas de otros artistas, siempre con la misma forma: el título, la orden de suscribirse, su nombre y el del sello. Así se ve una vitrina desde afuera: un texto de promoción que otros cargan porque que te carguen es justamente el asunto.","type":"text"}]},{"type":"paragraph","content":[{"text":"High Level Music también monta batallas de freestyle, y las mismas cuentas que empujan Voy Subiendo empujan aquello. En una escena sin casi radio y sin locales de los que hablar, un canal de YouTube que te reciba y un público que ya lo siga son toda la infraestructura.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sus propios discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Graba además de presentar. Mambo Dominicano se filmó como video, y productores como Muntty Music Beats e Izaguirre en el Beat han trabajado en sus temas. Alofoke Music, la plataforma urbana más grande del país, lo sigue.","type":"text"}]},{"type":"paragraph","content":[{"text":"De ahí para allá el registro es escaso. No hay álbum, ni entrevista, ni fecha de nacimiento publicada, y lo que existe lo han publicado él y la gente a su alrededor, no alguien de afuera.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'jp-rmt'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
