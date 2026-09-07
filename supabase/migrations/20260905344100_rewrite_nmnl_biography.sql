BEGIN;

-- Rewrite the catalogue entry for NMNL.
--
-- NMNL. Filler in English, nothing in Spanish, no gender, no legal name -- and
-- an aliases array whose only entry was the artist's own name.
--
-- ADDED: legal name Enmanuel Cuello Reynoso, gender male, the alias Nominal,
-- and electronic and urban-trap alongside urbano in genres. Removed the alias
-- "NMNL", which only repeated the name field.
--
-- LEFT ALONE AND FLAGGED: province Santiago and birth_place Santiago de los
-- Caballeros. DISCOLAI calls him local without naming a city, and his own
-- Instagram posts geotag Santiago -- suggestive, not proof. The value is not
-- contradicted, and it is not the importer's usual default of Santo Domingo,
-- so it stays. Worth confirming.
--
-- LEFT ALONE, editor's call: primary_genre urban-rap-hip-hop. The music is
-- harder to file than that -- DISCOLAI describes drill and trap over hyperpop
-- and jungle -- and urban-trap or electronic would each be arguable as the
-- primary. Both are added to genres instead.
--
-- SOURCES: DISCOLAI, the Dominican alternative-music site, twice in August
-- 2022, both by Max "Drlacxos" Cueto. The 3 August round-up: "NMNL es el
-- proyecto musical de Enmanuel Cuello Reynoso, otros de los artistas que forma
-- parte del colectivo UNDR... un joven talentoso y prolifico, quien en este ano
-- lleva dos producciones", on the single En que momento empezo a ir todo mal
-- (Que Nos Paso?). The 11 August review of the album System16: "una mezcla de
-- beats electronicos, generos urbanos que van del drill al trap, saturaciones
-- sucias, excesos de filtros, referencias a videojuegos, en momentos pobre
-- ecualizacion, pero todo esto detras de una estetica intencionada, como si
-- estuvieramos al frente de una contracultura, donde toman el hyperpop y el
-- 'jungle' como sus bases referenciales, todo esto envuelto en un sentimiento
-- de tristeza casi depresiva". It is his second album, ten tracks in
-- twenty-four minutes.
--
-- NOTE: the full source list continues in the migration that supersedes this
-- one, 20260905344200. This file's notes were cut short by a stray blank line
-- in the script that generated it; the biography text itself was written and
-- applied complete, and the later migration carries both the whole rationale
-- and an identical body.
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
       name = 'NMNL',
       sort_name = 'NMNL',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santiago de los Caballeros',
       province = 'Santiago',
       first_name = 'Enmanuel',
       middle_name = NULL,
       last_name = 'Cuello',
       second_last_name = 'Reynoso',
       stage_name = 'NMNL',
       aliases = ARRAY['Enmanuel Cuello Reynoso', 'Nominal']::text[],
       occupations = '["producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'electronic', 'urban-trap']::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican hyperpop and trap project of Enmanuel Cuello Reynoso, of the UNDR collective',
       bio_en = 'NMNL is the musical project of Enmanuel Cuello Reynoso, a Dominican producer and rapper working in the space where trap, drill, hyperpop and jungle overlap. He belongs to the UNDR collective, and the name is his own with the vowels taken out.

**System16**

His second album is ten tracks in twenty-four minutes and it sounds broken on purpose. Dirty saturation, too much filtering, equalisation that is wrong where a professional would fix it — all of it deliberate, and all of it in the service of a mood the reviewer at DISCOLAI called an almost depressive sadness.

The reference points are video games. Yuna, Green Hills, Saria’s Song: a Final Fantasy character, a Sonic zone, a Zelda melody used as an interlude. The record closes on Ya No Estás, a rock song that breaks with everything before it.

That is a specific kind of listening biography. This is a generation that learned its melodies from consoles rather than from radio, and hyperpop is what happens when those melodies come back out through a laptop.

**Working fast**

He is prolific in the way the format allows: two albums plus a run of singles inside a single year, when DISCOLAI first wrote about him. En Qué Momento Empezó a Ir Todo Mal (Qué Nos Pasó?) came out in that stretch.

The 2024 album ##PaKBaileJerk2K24 ##45*16 carries the punctuation into the track titles themselves — ##ADIOS, ##BIPOLAR, ##CICLOS, ##EMOCIONES, Música Triste. The hashes are not decoration; they are how the music is indexed and found on the platforms it lives on, and putting them in the titles is an accurate description of where this music circulates.

**The collective**

UNDR is the frame around it. The fusions NMNL works in are the ones the collective as a whole is exploring, which is the usual arrangement in a small scene: nobody can support a genre alone, so a handful of people invent one together and take turns being the one written about.

He has also released jointly with the producer 1SANT, and his track Choco Crema has travelled: it turned up as the Dominican entry on an international listening round-up beside artists from Botswana, France, Argentina and Japan.',
       bio_es = 'NMNL es el proyecto musical de Enmanuel Cuello Reynoso, productor y rapero dominicano que trabaja donde se superponen el trap, el drill, el hyperpop y el jungle. Pertenece al colectivo UNDR, y el nombre es el suyo propio sin las vocales.

**System16**

Su segundo álbum son diez temas en veinticuatro minutos y suena roto a propósito. Saturación sucia, filtros de más, ecualización mal puesta justo donde un profesional la arreglaría: todo deliberado, y todo al servicio de un ánimo que el reseñista de DISCOLAI llamó una tristeza casi depresiva.

Los puntos de referencia son videojuegos. Yuna, Green Hills, Saria’s Song: un personaje de Final Fantasy, una zona de Sonic, una melodía de Zelda usada de interludio. El disco cierra con Ya No Estás, una canción de rock que rompe con todo lo anterior.

Esa es una biografía de oyente muy concreta. Es una generación que aprendió sus melodías en consolas y no en la radio, y el hyperpop es lo que pasa cuando esas melodías vuelven a salir por una laptop.

**Trabajar rápido**

Es prolífico como el formato lo permite: dos álbumes más una tanda de sencillos dentro de un mismo año, cuando DISCOLAI escribió de él por primera vez. En Qué Momento Empezó a Ir Todo Mal (Qué Nos Pasó?) salió en ese tramo.

El álbum de 2024, ##PaKBaileJerk2K24 ##45*16, se lleva la puntuación hasta los títulos: ##ADIOS, ##BIPOLAR, ##CICLOS, ##EMOCIONES, Música Triste. Los signos no son adorno; son la manera en que esta música se indexa y se encuentra en las plataformas donde vive, y meterlos en los títulos describe con exactitud por dónde circula.

**El colectivo**

UNDR es el marco de todo esto. Las fusiones en que trabaja NMNL son las que explora el colectivo entero, que es el arreglo de siempre en una escena pequeña: nadie puede sostener un género solo, así que unos cuantos se inventan uno juntos y se turnan para ser el que aparece en la reseña.

También ha sacado material en conjunto con el productor 1SANT, y su tema Choco Crema ha viajado: apareció como la entrada dominicana en una recopilación internacional de escucha, junto a artistas de Botsuana, Francia, Argentina y Japón.',
       updated_at = now()
 WHERE slug = 'nmnl';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'nmnl')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'nmnl')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"NMNL is the musical project of Enmanuel Cuello Reynoso, a Dominican producer and rapper working in the space where trap, drill, hyperpop and jungle overlap. He belongs to the UNDR collective, and the name is his own with the vowels taken out.","type":"text"}]},{"type":"paragraph","content":[{"text":"System16","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His second album is ten tracks in twenty-four minutes and it sounds broken on purpose. Dirty saturation, too much filtering, equalisation that is wrong where a professional would fix it — all of it deliberate, and all of it in the service of a mood the reviewer at DISCOLAI called an almost depressive sadness.","type":"text"}]},{"type":"paragraph","content":[{"text":"The reference points are video games. Yuna, Green Hills, Saria’s Song: a Final Fantasy character, a Sonic zone, a Zelda melody used as an interlude. The record closes on Ya No Estás, a rock song that breaks with everything before it.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a specific kind of listening biography. This is a generation that learned its melodies from consoles rather than from radio, and hyperpop is what happens when those melodies come back out through a laptop.","type":"text"}]},{"type":"paragraph","content":[{"text":"Working fast","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is prolific in the way the format allows: two albums plus a run of singles inside a single year, when DISCOLAI first wrote about him. En Qué Momento Empezó a Ir Todo Mal (Qué Nos Pasó?) came out in that stretch.","type":"text"}]},{"type":"paragraph","content":[{"text":"The 2024 album ##PaKBaileJerk2K24 ##45*16 carries the punctuation into the track titles themselves — ##ADIOS, ##BIPOLAR, ##CICLOS, ##EMOCIONES, Música Triste. The hashes are not decoration; they are how the music is indexed and found on the platforms it lives on, and putting them in the titles is an accurate description of where this music circulates.","type":"text"}]},{"type":"paragraph","content":[{"text":"The collective","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"UNDR is the frame around it. The fusions NMNL works in are the ones the collective as a whole is exploring, which is the usual arrangement in a small scene: nobody can support a genre alone, so a handful of people invent one together and take turns being the one written about.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has also released jointly with the producer 1SANT, and his track Choco Crema has travelled: it turned up as the Dominican entry on an international listening round-up beside artists from Botswana, France, Argentina and Japan.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'nmnl'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"NMNL es el proyecto musical de Enmanuel Cuello Reynoso, productor y rapero dominicano que trabaja donde se superponen el trap, el drill, el hyperpop y el jungle. Pertenece al colectivo UNDR, y el nombre es el suyo propio sin las vocales.","type":"text"}]},{"type":"paragraph","content":[{"text":"System16","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su segundo álbum son diez temas en veinticuatro minutos y suena roto a propósito. Saturación sucia, filtros de más, ecualización mal puesta justo donde un profesional la arreglaría: todo deliberado, y todo al servicio de un ánimo que el reseñista de DISCOLAI llamó una tristeza casi depresiva.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los puntos de referencia son videojuegos. Yuna, Green Hills, Saria’s Song: un personaje de Final Fantasy, una zona de Sonic, una melodía de Zelda usada de interludio. El disco cierra con Ya No Estás, una canción de rock que rompe con todo lo anterior.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa es una biografía de oyente muy concreta. Es una generación que aprendió sus melodías en consolas y no en la radio, y el hyperpop es lo que pasa cuando esas melodías vuelven a salir por una laptop.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabajar rápido","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Es prolífico como el formato lo permite: dos álbumes más una tanda de sencillos dentro de un mismo año, cuando DISCOLAI escribió de él por primera vez. En Qué Momento Empezó a Ir Todo Mal (Qué Nos Pasó?) salió en ese tramo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El álbum de 2024, ##PaKBaileJerk2K24 ##45*16, se lleva la puntuación hasta los títulos: ##ADIOS, ##BIPOLAR, ##CICLOS, ##EMOCIONES, Música Triste. Los signos no son adorno; son la manera en que esta música se indexa y se encuentra en las plataformas donde vive, y meterlos en los títulos describe con exactitud por dónde circula.","type":"text"}]},{"type":"paragraph","content":[{"text":"El colectivo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"UNDR es el marco de todo esto. Las fusiones en que trabaja NMNL son las que explora el colectivo entero, que es el arreglo de siempre en una escena pequeña: nadie puede sostener un género solo, así que unos cuantos se inventan uno juntos y se turnan para ser el que aparece en la reseña.","type":"text"}]},{"type":"paragraph","content":[{"text":"También ha sacado material en conjunto con el productor 1SANT, y su tema Choco Crema ha viajado: apareció como la entrada dominicana en una recopilación internacional de escucha, junto a artistas de Botsuana, Francia, Argentina y Japón.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'nmnl'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
