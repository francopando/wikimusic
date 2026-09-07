BEGIN;

-- Rewrite the catalogue entry for Reidy Hernández.
--
-- Reidy Hernandez. Filler in English, nothing in Spanish, no genre, no gender,
-- no real name, and the wrong province.
--
-- BIRTHPLACE CORRECTED from Santo Domingo to Montecristi. MusicBrainz gives
-- Monte Cristi as his begin-area and BuenaMusica gives Montecristi outright;
-- the row's Santo Domingo is the import's default and no source supports it.
--
-- SOURCES: MusicBrainz, which files him as a Dominican bachata artist with
-- Monte Cristi as his begin-area. BuenaMusica for Montecristi, for his father
-- Victor Hernandez being a bassist, for the two Platano Records albums and
-- their tracks, and for the 2007-2008 work with the producer Rafael Leonel
-- Matias. AllMusic for "El Hijo del Cacique", 2000, credited to Reidy "El
-- Torito". The Virgin Music Group distribution credit on "Mi Primer Amor",
-- which carries the phonogram line 1998 Platano Records for "Como Dejar de
-- Amarte". Contemporary Dominican video uploads for the billings and for
-- "Muero por Verla" and "Como Tu Ninguna".
--
-- NO BIRTH DATE WRITTEN. BuenaMusica gives 1998, which is also the year of his
-- first album; the two cannot both be right and the album year is corroborated,
-- so the birth year is treated as a transcription of it and left out.
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
       name = 'Reidy Hernández',
       sort_name = 'Hernández, Reidy',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Montecristi',
       province = 'Monte Cristi',
       first_name = 'Reidy',
       middle_name = NULL,
       last_name = 'Hernández',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['El Torito de la Bachata', 'El Hijo del Cacique']::text[],
       occupations = '["composer","songwriter"]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican bachata singer from Montecristi; “Cómo Dejar de Amarte”, 1998',
       bio_en = 'Reidy Hernández is a Dominican bachata singer and composer from Montecristi. He recorded as El Torito de la Bachata and as El Hijo del Cacique.

**Montecristi**

The north-west corner of the country produced the bachata of the 1990s almost by itself, and Montecristi province is where Raulín Rodríguez comes from. Being billed the son of the cacique places him deliberately in that line — El Cacique is Raulín’s own billing, and Reidy took the title as an inheritance rather than a challenge.

His father, Víctor Hernández, was a bass player, so the trade was in the house before he chose it.

**The two records**

Cómo Dejar de Amarte came out in 1998 on Plátano Records: ten tracks, six bachatas and four merengues, holding Ay Amor, Me Gusta Esa Muchachita, Se Me Fue Mi Mujer, Mi Morenita and Mi Primer Amor.

El Hijo del Cacique followed in 2000 on the same label, with Quiero Besarte, Enamorado de Ti and La Pobre Adela. Quiero Besarte was the one that charted.

Muero por Verla and Como Tú Ninguna kept circulating through the Dominican video shows afterwards, which is where most bachata of that period actually reached its audience.

**Away from bachata**

Around 2007 and 2008 he worked with the producer Rafael Leonel Matías and moved toward vallenato — the Colombian accordion form that shares an ancestor with bachata and almost none of its audience here.

He has recorded little since. Two albums and a voice people in the north still name is what the record holds.',
       bio_es = 'Reidy Hernández es un cantante y compositor de bachata dominicano, de Montecristi. Grabó como El Torito de la Bachata y como El Hijo del Cacique.

**Montecristi**

La esquina noroeste del país produjo casi sola la bachata de los años noventa, y de la provincia de Montecristi es Raulín Rodríguez. Anunciarse como el hijo del cacique lo coloca a propósito en esa línea: El Cacique es el rótulo del propio Raulín, y Reidy tomó el título como herencia y no como reto.

Su padre, Víctor Hernández, era bajista, así que el oficio ya estaba en la casa antes de que él lo escogiera.

**Los dos discos**

Cómo Dejar de Amarte salió en 1998 por Plátano Records: diez temas, seis bachatas y cuatro merengues, con Ay Amor, Me Gusta Esa Muchachita, Se Me Fue Mi Mujer, Mi Morenita y Mi Primer Amor.

El Hijo del Cacique vino en 2000 por el mismo sello, con Quiero Besarte, Enamorado de Ti y La Pobre Adela. Quiero Besarte fue la que entró en listas.

Muero por Verla y Como Tú Ninguna siguieron rodando después por los programas de videos dominicanos, que es donde la bachata de aquel período llegaba de verdad a su público.

**Fuera de la bachata**

Hacia 2007 y 2008 trabajó con el productor Rafael Leonel Matías y se movió hacia el vallenato, la forma acordeonera colombiana que comparte un antepasado con la bachata y casi nada de su público aquí.

Ha grabado poco desde entonces. Dos álbumes y una voz que en el norte todavía nombran es lo que queda registrado.',
       updated_at = now()
 WHERE slug = 'reidy-hernandez';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'reidy-hernandez')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'reidy-hernandez')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Reidy Hernández is a Dominican bachata singer and composer from Montecristi. He recorded as El Torito de la Bachata and as El Hijo del Cacique.","type":"text"}]},{"type":"paragraph","content":[{"text":"Montecristi","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The north-west corner of the country produced the bachata of the 1990s almost by itself, and Montecristi province is where ","type":"text"},{"type":"artistReference","attrs":{"artistId":"96e69c00-dbb0-4cb4-ab48-ea46be9c4591","displayText":"Raulín Rodríguez","occurrenceId":"90101c51-6577-420e-b031-d1f3d8d20bbc"}},{"text":" comes from. Being billed the son of the cacique places him deliberately in that line — El Cacique is Raulín’s own billing, and Reidy took the title as an inheritance rather than a challenge.","type":"text"}]},{"type":"paragraph","content":[{"text":"His father, Víctor Hernández, was a bass player, so the trade was in the house before he chose it.","type":"text"}]},{"type":"paragraph","content":[{"text":"The two records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Cómo Dejar de Amarte came out in 1998 on Plátano Records: ten tracks, six bachatas and four merengues, holding Ay Amor, Me Gusta Esa Muchachita, Se Me Fue Mi Mujer, Mi Morenita and Mi Primer Amor.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Hijo del Cacique followed in 2000 on the same label, with Quiero Besarte, Enamorado de Ti and La Pobre Adela. Quiero Besarte was the one that charted.","type":"text"}]},{"type":"paragraph","content":[{"text":"Muero por Verla and Como Tú Ninguna kept circulating through the Dominican video shows afterwards, which is where most bachata of that period actually reached its audience.","type":"text"}]},{"type":"paragraph","content":[{"text":"Away from bachata","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Around 2007 and 2008 he worked with the producer Rafael Leonel Matías and moved toward vallenato — the Colombian accordion form that shares an ancestor with bachata and almost none of its audience here.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has recorded little since. Two albums and a voice people in the north still name is what the record holds.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'reidy-hernandez'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Reidy Hernández es un cantante y compositor de bachata dominicano, de Montecristi. Grabó como El Torito de la Bachata y como El Hijo del Cacique.","type":"text"}]},{"type":"paragraph","content":[{"text":"Montecristi","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La esquina noroeste del país produjo casi sola la bachata de los años noventa, y de la provincia de Montecristi es ","type":"text"},{"type":"artistReference","attrs":{"artistId":"96e69c00-dbb0-4cb4-ab48-ea46be9c4591","displayText":"Raulín Rodríguez","occurrenceId":"d8919698-3154-486d-a804-80b1ae0d520a"}},{"text":". Anunciarse como el hijo del cacique lo coloca a propósito en esa línea: El Cacique es el rótulo del propio Raulín, y Reidy tomó el título como herencia y no como reto.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su padre, Víctor Hernández, era bajista, así que el oficio ya estaba en la casa antes de que él lo escogiera.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los dos discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Cómo Dejar de Amarte salió en 1998 por Plátano Records: diez temas, seis bachatas y cuatro merengues, con Ay Amor, Me Gusta Esa Muchachita, Se Me Fue Mi Mujer, Mi Morenita y Mi Primer Amor.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Hijo del Cacique vino en 2000 por el mismo sello, con Quiero Besarte, Enamorado de Ti y La Pobre Adela. Quiero Besarte fue la que entró en listas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Muero por Verla y Como Tú Ninguna siguieron rodando después por los programas de videos dominicanos, que es donde la bachata de aquel período llegaba de verdad a su público.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fuera de la bachata","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Hacia 2007 y 2008 trabajó con el productor Rafael Leonel Matías y se movió hacia el vallenato, la forma acordeonera colombiana que comparte un antepasado con la bachata y casi nada de su público aquí.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ha grabado poco desde entonces. Dos álbumes y una voz que en el norte todavía nombran es lo que queda registrado.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'reidy-hernandez'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'reidy-hernandez') AND locale = 'en'), '90101c51-6577-420e-b031-d1f3d8d20bbc', 'artist', '96e69c00-dbb0-4cb4-ab48-ea46be9c4591');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'reidy-hernandez') AND locale = 'es'), 'd8919698-3154-486d-a804-80b1ae0d520a', 'artist', '96e69c00-dbb0-4cb4-ab48-ea46be9c4591');

COMMIT;
