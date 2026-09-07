BEGIN;

-- Rewrite the catalogue entry for Vakeró.
--
-- Vakeró. Filler in English, nothing in Spanish, no occupations, no genres --
-- on one of the founding figures of Dominican urban music.
--
-- PROVINCE CORRECTED: "Distrito Nacional" -> "San Pedro de Macorís". The row
-- already stored birth_place "San Pedro de Macorís" and the province
-- contradicted it. Spanish Wikipedia, English Wikipedia, BuenaMusica, El
-- Tiempo, his own site vakerospm.com -- the initials are the town -- and one of
-- his own singles, titled SPM, all agree. This is the third province/birthplace
-- mismatch found today after the Santo Domingo Este sweep, and unlike those it
-- is not a barrio question: the birthplace names a province outright and the
-- province column said a different one.
--
-- FILLED: date_of_birth 21 July 1979. birth_year 1979 was already stored.
--
-- CORRECTED: name "Vakero" -> "Vakeró". He accents it and so does every source
-- including his own site; the unaccented form goes into aliases. primary_genre
-- urban-dembow -> urban-rap-hip-hop: he is a rapper first and has been since
-- 1995, and the dembow is one thing he does among several. primary_role singer
-- -> rapper.
--
-- ADDED: occupations composer and producer; genres; disambiguation; the legend
-- tag, which he has earned on any reading -- thirty years, eight albums and a
-- place in every account of how the genre started.
--
-- SOURCES: Spanish Wikipedia, which is heavily cited, for the birth, the tailor
-- father, Héctor Lavoe as a declared influence, the group One Play at sixteen
-- with the rapper Wilking, the move to Perfecto Clan La Banda Sonora, the 2005
-- debut Adelante y Pico and the track Se Partió el Lápiz, the 2007 remix of Me
-- Siento Solo with Arcángel and Néstor Ortega over a Santiago Matías original,
-- the Soberano awards between 2010 and 2014, the appearance of Tu Pai in Pro
-- Evolution Soccer 2013, Tu Cojea in January 2020, and the album list through
-- Mama Ika in 2022. English Wikipedia, which calls him one of the most
-- important acts in Dominican urban music. His own site and BuenaMusica for
-- the birth date. El Tiempo, 3 June 2024, on his origins in San Pedro.
--
-- A LARGE PART OF THE SOURCE IS DELIBERATELY UNUSED. Spanish Wikipedia devotes
-- a long section to marriages, partners, the number of his children, a domestic
-- violence prosecution and conviction, another artist's drug arrest, and what
-- was done to his hair in prison. None of it is in this entry. This catalogue
-- records musical work; personal life and criminal matters are out, and that
-- rule does not bend because the source is detailed. His declared religious
-- affiliation is left out on the same grounds. So is the estimate of his net
-- worth.
--
-- NOT LINKED: Arcángel is Puerto Rican. Santiago Matías, Néstor Ortega, Wilking
-- and the groups One Play and Perfecto Clan have no entries. Santiago Matías is
-- a significant gap -- he wrote the original of Me Siento Solo and is a central
-- figure in the Dominican urban industry.
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
       name = 'Vakeró',
       sort_name = 'Varet Marte, Manuel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = '1979-07-21',
       birth_year = 1979,
       date_of_death = NULL,
       birth_place = 'San Pedro de Macorís',
       province = 'San Pedro de Macorís',
       first_name = 'Manuel',
       middle_name = NULL,
       last_name = 'Varet',
       second_last_name = 'Marte',
       stage_name = 'Vakeró',
       aliases = ARRAY['Vakero', 'El Vakero', 'Manuel Varet Marte']::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-dembow']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = 'VakeroSPM809',
       instagram = 'vakero',
       disambiguation = 'Rapper from San Pedro de Macorís; Adelante y Pico, Tu Pai, Tu Cojea',
       bio_en = 'Vakeró, born Manuel Varet Marte in San Pedro de Macorís, is a Dominican rapper, songwriter and producer. He has been recording for thirty years and is on every account of how Dominican urban music began.

**San Pedro**

He grew up poor, the son of a tailor, and says it was his father who put the music in him. The influence he names is Héctor Lavoe — a Puerto Rican salsa singer, which is not the reference a Dominican rapper is expected to give, and which explains something about how he phrases.

At sixteen he joined a group called One Play, alongside the rapper Wilking, and stayed about two years. Then came Perfecto Clan, La Banda Sonora, which is where the style hardened into something recognisable.

**Se Partió el Lápiz**

Adelante y Pico, in 2005, was the first record under his own name, and the track that carried it was Se Partió el Lápiz — a shot at Lápiz Conciente, by then the biggest rapper in the country.

That is how a Dominican rap career opened in that decade. There was no radio and no label to go through; the way to be heard was to name somebody who was already being heard. It worked, and it took him outside the country.

Years later the two of them cut Llegan Lo’ Que Saben together, which is the other half of the same tradition: the tiraera settles and the record gets made.

**Eight albums**

Pa Ke Te Mate followed in 2007, then Manuel in 2008, Yo in 2013, Mutación in 2018, El Chulo Del 23 in 2019, Casa Nostra in 2020 and Mama Ika in 2022. Along the way: Háblame de Dinero, Qué Mujer Tan Chula, Mariposa, and a single simply called SPM.

Tu Pai went further than any of them, and by an unusual route — it was put into Pro Evolution Soccer 2013, so a Dominican rap record reached millions of people who were playing a football game and had never heard of him. Tu Cojea, in January 2020, did the same thing the old way.

He collected Soberano awards across the first half of the twenty-tens, in the years when the ceremony was still being renamed from Premios Casandra.

**Why he matters**

Dominican urban music now exports more than merengue does, and the people who built the ground it stands on are a short list. He is on it: a rapper from a sugar town who was making records before the genre had an industry, and who is still making them after it acquired one.',
       bio_es = 'Vakeró, de nombre Manuel Varet Marte y nacido en San Pedro de Macorís, es rapero, compositor y productor dominicano. Lleva treinta años grabando y está en todos los relatos de cómo empezó la música urbana dominicana.

**San Pedro**

Se crió pobre, hijo de un sastre, y dice que fue su padre quien le metió la música. La influencia que nombra es Héctor Lavoe —un salsero puertorriqueño, que no es la referencia que se espera de un rapero dominicano— y eso explica algo de cómo frasea.

A los dieciséis entró a un grupo llamado One Play, junto al rapero Wilking, y estuvo como dos años. Después vino Perfecto Clan, La Banda Sonora, que es donde el estilo se le endureció hasta volverse reconocible.

**Se Partió el Lápiz**

Adelante y Pico, de 2005, fue el primer disco con su propio nombre, y el tema que lo cargó fue Se Partió el Lápiz: un tiro a Lápiz Conciente, para entonces el rapero más grande del país.

Así se abría una carrera de rap dominicano en esa década. No había radio ni sello por donde pasar; la manera de hacerse oír era nombrar a alguien a quien ya se oía. Funcionó, y lo sacó del país.

Años después los dos grabaron juntos Llegan Lo’ Que Saben, que es la otra mitad de la misma tradición: la tiraera se salda y el disco se hace.

**Ocho álbumes**

Pa Ke Te Mate salió en 2007, después Manuel en 2008, Yo en 2013, Mutación en 2018, El Chulo Del 23 en 2019, Casa Nostra en 2020 y Mama Ika en 2022. Por el camino: Háblame de Dinero, Qué Mujer Tan Chula, Mariposa, y un sencillo llamado simplemente SPM.

Tu Pai llegó más lejos que todos ellos, y por una vía rara: la metieron en el Pro Evolution Soccer 2013, así que un disco de rap dominicano le llegó a millones de personas que estaban jugando fútbol y nunca habían oído hablar de él. Tu Cojea, en enero de 2020, hizo lo mismo por la vía de siempre.

Recogió premios Soberano a lo largo de la primera mitad de los años diez, en los años en que la ceremonia todavía se estaba cambiando el nombre desde Premios Casandra.

**Por qué importa**

La música urbana dominicana exporta hoy más que el merengue, y la gente que puso el piso sobre el que se para es una lista corta. Él está en ella: un rapero de un pueblo azucarero que hacía discos antes de que el género tuviera industria, y que los sigue haciendo después de que la consiguiera.',
       updated_at = now()
 WHERE slug = 'vakero';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'vakero')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'vakero')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Vakeró, born Manuel Varet Marte in San Pedro de Macorís, is a Dominican rapper, songwriter and producer. He has been recording for thirty years and is on every account of how Dominican urban music began.","type":"text"}]},{"type":"paragraph","content":[{"text":"San Pedro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He grew up poor, the son of a tailor, and says it was his father who put the music in him. The influence he names is Héctor Lavoe — a Puerto Rican salsa singer, which is not the reference a Dominican rapper is expected to give, and which explains something about how he phrases.","type":"text"}]},{"type":"paragraph","content":[{"text":"At sixteen he joined a group called One Play, alongside the rapper Wilking, and stayed about two years. Then came Perfecto Clan, La Banda Sonora, which is where the style hardened into something recognisable.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se Partió el Lápiz","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Adelante y Pico, in 2005, was the first record under his own name, and the track that carried it was Se Partió el Lápiz — a shot at ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"376887c8-5e65-4d2d-9357-586ef8b6854d"}},{"text":", by then the biggest rapper in the country.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is how a Dominican rap career opened in that decade. There was no radio and no label to go through; the way to be heard was to name somebody who was already being heard. It worked, and it took him outside the country.","type":"text"}]},{"type":"paragraph","content":[{"text":"Years later the two of them cut Llegan Lo’ Que Saben together, which is the other half of the same tradition: the tiraera settles and the record gets made.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eight albums","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pa Ke Te Mate followed in 2007, then Manuel in 2008, Yo in 2013, Mutación in 2018, El Chulo Del 23 in 2019, Casa Nostra in 2020 and Mama Ika in 2022. Along the way: Háblame de Dinero, Qué Mujer Tan Chula, Mariposa, and a single simply called SPM.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tu Pai went further than any of them, and by an unusual route — it was put into Pro Evolution Soccer 2013, so a Dominican rap record reached millions of people who were playing a football game and had never heard of him. Tu Cojea, in January 2020, did the same thing the old way.","type":"text"}]},{"type":"paragraph","content":[{"text":"He collected Soberano awards across the first half of the twenty-tens, in the years when the ceremony was still being renamed from Premios Casandra.","type":"text"}]},{"type":"paragraph","content":[{"text":"Why he matters","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dominican urban music now exports more than merengue does, and the people who built the ground it stands on are a short list. He is on it: a rapper from a sugar town who was making records before the genre had an industry, and who is still making them after it acquired one.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'vakero'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Vakeró, de nombre Manuel Varet Marte y nacido en San Pedro de Macorís, es rapero, compositor y productor dominicano. Lleva treinta años grabando y está en todos los relatos de cómo empezó la música urbana dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"San Pedro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se crió pobre, hijo de un sastre, y dice que fue su padre quien le metió la música. La influencia que nombra es Héctor Lavoe —un salsero puertorriqueño, que no es la referencia que se espera de un rapero dominicano— y eso explica algo de cómo frasea.","type":"text"}]},{"type":"paragraph","content":[{"text":"A los dieciséis entró a un grupo llamado One Play, junto al rapero Wilking, y estuvo como dos años. Después vino Perfecto Clan, La Banda Sonora, que es donde el estilo se le endureció hasta volverse reconocible.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se Partió el Lápiz","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Adelante y Pico, de 2005, fue el primer disco con su propio nombre, y el tema que lo cargó fue Se Partió el Lápiz: un tiro a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"09568407-b860-41fc-b488-51ac3f66f0e5"}},{"text":", para entonces el rapero más grande del país.","type":"text"}]},{"type":"paragraph","content":[{"text":"Así se abría una carrera de rap dominicano en esa década. No había radio ni sello por donde pasar; la manera de hacerse oír era nombrar a alguien a quien ya se oía. Funcionó, y lo sacó del país.","type":"text"}]},{"type":"paragraph","content":[{"text":"Años después los dos grabaron juntos Llegan Lo’ Que Saben, que es la otra mitad de la misma tradición: la tiraera se salda y el disco se hace.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ocho álbumes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pa Ke Te Mate salió en 2007, después Manuel en 2008, Yo en 2013, Mutación en 2018, El Chulo Del 23 en 2019, Casa Nostra en 2020 y Mama Ika en 2022. Por el camino: Háblame de Dinero, Qué Mujer Tan Chula, Mariposa, y un sencillo llamado simplemente SPM.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tu Pai llegó más lejos que todos ellos, y por una vía rara: la metieron en el Pro Evolution Soccer 2013, así que un disco de rap dominicano le llegó a millones de personas que estaban jugando fútbol y nunca habían oído hablar de él. Tu Cojea, en enero de 2020, hizo lo mismo por la vía de siempre.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recogió premios Soberano a lo largo de la primera mitad de los años diez, en los años en que la ceremonia todavía se estaba cambiando el nombre desde Premios Casandra.","type":"text"}]},{"type":"paragraph","content":[{"text":"Por qué importa","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La música urbana dominicana exporta hoy más que el merengue, y la gente que puso el piso sobre el que se para es una lista corta. Él está en ella: un rapero de un pueblo azucarero que hacía discos antes de que el género tuviera industria, y que los sigue haciendo después de que la consiguiera.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'vakero'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'vakero') AND locale = 'en'), '376887c8-5e65-4d2d-9357-586ef8b6854d', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'vakero') AND locale = 'es'), '09568407-b860-41fc-b488-51ac3f66f0e5', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

COMMIT;
