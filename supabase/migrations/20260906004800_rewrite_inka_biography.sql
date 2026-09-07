BEGIN;

-- Rewrite the catalogue entry for Inka.
--
-- Inka. Filler in English, nothing in Spanish, no place beyond the importer's
-- default -- on a rapper whose album Rolling Stone put among the fifty best of
-- its year and whose whole project is about the neighbourhood the row was
-- getting wrong.
--
-- CORRECTED: province "Distrito Nacional" -> "Santo Domingo" and birth_place
-- "Santo Domingo" -> "Villa Mella, Santo Domingo Norte". Villa Mella is in
-- Santo Domingo Norte, which is Santo Domingo province, not the Distrito
-- Nacional. Every source names the neighbourhood, and the album is named after
-- it. primary_role singer -> rapper, primary_genre urbano ->
-- urban-rap-hip-hop; urbano moves to genres. gender null -> male.
--
-- ADDED: occupations producer beside composer -- he is billed "rapero y
-- productor" on his own account -- aliases, disambiguation, emerging tag.
--
-- LEFT ALONE: first_name Albreydy, middle_name Alberto, last_name Holguín,
-- second_last_name Roque were already stored and are confirmed by Acento, which
-- writes out the full name, and by Pitchfork, which gives "Albreydy Holguín".
--
-- NO DATE OF BIRTH. Pitchfork called him twenty-two in September 2022, which
-- puts the birth in 1999 or 2000, but an age in a review is not a date and the
-- column is left empty rather than filled with a computed guess.
--
-- SOURCES: Pitchfork's track review of Party de Palo featuring Evaristo Moreno,
-- 6 September 2022. Listín Diario, 16 August 2024, "Inka: desde los barrios de
-- Villa Mella a los 50 mejores de Rolling Stone", and its accompanying
-- interview, for the album Villa Mella, the Rolling Stone placing, and the note
-- that Evaristo Moreno belongs to a family that pioneered priprí. Acento, 23
-- January 2026, "INKA, artista con conciencia social", interview by Cristian
-- Gonzalo Álvarez Concepción, for the full legal name and the alternative-scene
-- context. Beehype's best albums of 2023 list. Isle of Light's own channel for
-- the 2026 festival set. Afrohunting and Evaristo Moreno's own release for the
-- atabales sample library, which is what he is known for. His Instagram, under
-- the handle lomundanoylodivino, for the album announcement of 26 July 2023 and
-- the self-description. MusicBrainz for the single Party de Palo, 2022.
--
-- NOT WRITTEN: play counts. Nothing about his household or his private life.
--
-- NOT LINKED: Los Congos del Espíritu Santo, the Villa Mella cofradía, is in
-- the catalogue but not published -- needs_review -- so a reference would
-- render as dead text. It is named in the prose and should be linked once
-- published. Evaristo Moreno, VITA, Camilomf, Feedback, Lian, Sobremesa, Papi
-- Naranja and Rosee Abreu have no entries.
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
       name = 'Inka',
       sort_name = 'Inka',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Villa Mella, Santo Domingo Norte',
       province = 'Santo Domingo',
       first_name = 'Albreydy',
       middle_name = 'Alberto',
       last_name = 'Holguín',
       second_last_name = 'Roque',
       stage_name = 'Inka',
       aliases = ARRAY['INKA']::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'folklore']::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = NULL,
       youtube = '@lomundanoylodivino',
       facebook = NULL,
       instagram = 'lomundanoylodivino',
       disambiguation = 'Rapper and producer from Villa Mella; the album Villa Mella',
       bio_en = 'Inka, born Albreydy Alberto Holguín Roque, is a rapper and producer from Villa Mella. He works in the Dominican alternative scene rather than in dembow, and the whole of what he does starts from the neighbourhood he comes from.

**Where the drums are**

Villa Mella, in Santo Domingo Norte, is where the Cofradía del Espíritu Santo keeps the congos — the drum tradition UNESCO listed as intangible heritage — and where priprí and the atabales are still played as living music rather than as folklore for visitors.

Party de Palo is what he built out of that. It is a rap record with palos under it, made with Evaristo Moreno, who comes from one of the families that carried priprí, and it opens with a poem for the barrio. The joke in the title is exact: a party of palo, meaning both the drums and the party.

Pitchfork reviewed the track, which for a rap single made in Santo Domingo Norte is not a normal outcome.

**Villa Mella**

The album took the neighbourhood’s name. It came out in 2023 and Rolling Stone put it among the fifty best albums of that year — a Dominican rap record built on ancestral Afro-Dominican rhythm, sitting on an international list beside things made with a hundred times the budget.

He has said he makes music out of a personal and spiritual need to express something, which sounds like the sort of thing artists say until you notice that the record is an argument for a place rather than for himself.

**Onstage**

He played Isle of Light, closing on Gracias and Party de Palo. Live, the rap and the drums are in the same room, which is the point: nothing about the project treats the tradition as a sample to be borrowed.

He is young, and the recorded catalogue is still short. What is already clear is the position — a rapper who went back into his own barrio for the rhythm section instead of importing one.',
       bio_es = 'Inka, de nombre Albreydy Alberto Holguín Roque, es rapero y productor de Villa Mella. Trabaja en la escena alternativa dominicana y no en el dembow, y todo lo que hace parte del barrio de donde viene.

**Donde están los palos**

Villa Mella, en Santo Domingo Norte, es donde la Cofradía del Espíritu Santo guarda los congos —la tradición de tambores que la UNESCO declaró patrimonio inmaterial— y donde el priprí y los atabales se siguen tocando como música viva y no como folclore para visitantes.

Party de Palo es lo que armó con eso. Es un disco de rap con palos por debajo, hecho con Evaristo Moreno, que viene de una de las familias que llevaron el priprí, y abre con un poema para el barrio. El chiste del título es exacto: un party de palo, que son los tambores y es la fiesta.

Pitchfork reseñó el tema, cosa que para un sencillo de rap hecho en Santo Domingo Norte no es un desenlace normal.

**Villa Mella**

El álbum se quedó con el nombre del barrio. Salió en 2023 y Rolling Stone lo puso entre los cincuenta mejores discos de ese año: un disco de rap dominicano montado sobre ritmo afrodominicano ancestral, metido en una lista internacional al lado de cosas hechas con cien veces el presupuesto.

Ha dicho que hace música por una necesidad personal y espiritual de expresar algo, que suena a lo que dicen todos los artistas hasta que uno nota que el disco es un alegato por un lugar y no por él.

**En tarima**

Tocó en Isle of Light y cerró con Gracias y Party de Palo. En vivo, el rap y los tambores están en la misma sala, que es de lo que se trata: nada en el proyecto trata la tradición como un sample prestado.

Es joven y el catálogo grabado todavía es corto. Lo que ya está claro es la posición: un rapero que volvió a su propio barrio a buscar la sección rítmica en vez de importarla.',
       updated_at = now()
 WHERE slug = 'inka';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'inka')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'inka')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Inka, born Albreydy Alberto Holguín Roque, is a rapper and producer from Villa Mella. He works in the Dominican alternative scene rather than in dembow, and the whole of what he does starts from the neighbourhood he comes from.","type":"text"}]},{"type":"paragraph","content":[{"text":"Where the drums are","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Villa Mella, in Santo Domingo Norte, is where the Cofradía del Espíritu Santo keeps the congos — the drum tradition UNESCO listed as intangible heritage — and where priprí and the atabales are still played as living music rather than as folklore for visitors.","type":"text"}]},{"type":"paragraph","content":[{"text":"Party de Palo is what he built out of that. It is a rap record with palos under it, made with Evaristo Moreno, who comes from one of the families that carried priprí, and it opens with a poem for the barrio. The joke in the title is exact: a party of palo, meaning both the drums and the party.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pitchfork reviewed the track, which for a rap single made in Santo Domingo Norte is not a normal outcome.","type":"text"}]},{"type":"paragraph","content":[{"text":"Villa Mella","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The album took the neighbourhood’s name. It came out in 2023 and Rolling Stone put it among the fifty best albums of that year — a Dominican rap record built on ancestral Afro-Dominican rhythm, sitting on an international list beside things made with a hundred times the budget.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has said he makes music out of a personal and spiritual need to express something, which sounds like the sort of thing artists say until you notice that the record is an argument for a place rather than for himself.","type":"text"}]},{"type":"paragraph","content":[{"text":"Onstage","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He played Isle of Light, closing on Gracias and Party de Palo. Live, the rap and the drums are in the same room, which is the point: nothing about the project treats the tradition as a sample to be borrowed.","type":"text"}]},{"type":"paragraph","content":[{"text":"He is young, and the recorded catalogue is still short. What is already clear is the position — a rapper who went back into his own barrio for the rhythm section instead of importing one.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'inka'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Inka, de nombre Albreydy Alberto Holguín Roque, es rapero y productor de Villa Mella. Trabaja en la escena alternativa dominicana y no en el dembow, y todo lo que hace parte del barrio de donde viene.","type":"text"}]},{"type":"paragraph","content":[{"text":"Donde están los palos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Villa Mella, en Santo Domingo Norte, es donde la Cofradía del Espíritu Santo guarda los congos —la tradición de tambores que la UNESCO declaró patrimonio inmaterial— y donde el priprí y los atabales se siguen tocando como música viva y no como folclore para visitantes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Party de Palo es lo que armó con eso. Es un disco de rap con palos por debajo, hecho con Evaristo Moreno, que viene de una de las familias que llevaron el priprí, y abre con un poema para el barrio. El chiste del título es exacto: un party de palo, que son los tambores y es la fiesta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pitchfork reseñó el tema, cosa que para un sencillo de rap hecho en Santo Domingo Norte no es un desenlace normal.","type":"text"}]},{"type":"paragraph","content":[{"text":"Villa Mella","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El álbum se quedó con el nombre del barrio. Salió en 2023 y Rolling Stone lo puso entre los cincuenta mejores discos de ese año: un disco de rap dominicano montado sobre ritmo afrodominicano ancestral, metido en una lista internacional al lado de cosas hechas con cien veces el presupuesto.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ha dicho que hace música por una necesidad personal y espiritual de expresar algo, que suena a lo que dicen todos los artistas hasta que uno nota que el disco es un alegato por un lugar y no por él.","type":"text"}]},{"type":"paragraph","content":[{"text":"En tarima","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Tocó en Isle of Light y cerró con Gracias y Party de Palo. En vivo, el rap y los tambores están en la misma sala, que es de lo que se trata: nada en el proyecto trata la tradición como un sample prestado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es joven y el catálogo grabado todavía es corto. Lo que ya está claro es la posición: un rapero que volvió a su propio barrio a buscar la sección rítmica en vez de importarla.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'inka'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
