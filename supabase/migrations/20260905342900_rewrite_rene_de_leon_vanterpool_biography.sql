BEGIN;

-- Rewrite the catalogue entry for René De León Vanterpool.
--
-- Rene De Leon Vanterpool. Filler in English, nothing in Spanish, no gender, no
-- genre, no name parts -- and a province and birth_place that were the import
-- default rather than research.
--
-- HE IS DOMINICAN, and the screening had to be done, because MusicBrainz files
-- him as a member of a band whose country is VG, the British Virgin Islands.
-- The band's own Facebook settles it: 3G's "is a multicultural group from the
-- British Virgin Islands and the Dominican Republic", and the group's post
-- introducing his brother gives "Place of birth: Dominican Republic (Born and
-- raised). Living in the Virgin Islands for 5 years." The Static Dive says the
-- same of both brothers. He is a Dominican working abroad, which is what the
-- diaspora tag is for, and the tag is added here.
--
-- OVERWRITTEN: birth_place "Santo Domingo" -> null, province "Distrito
-- Nacional" -> null. Both were the import default. No source names his town.
--
-- NAME: the stored name gets its Spanish accents -- Rene De Leon Vanterpool ->
-- Rene De Leon Vanterpool with accents. His band calls him Wrisberg Rene De
-- Leon and bills him as Rene, so the name parts and the stage name are filled
-- in from that and the old form is kept as an alias. The slug is untouched.
--
-- GENRE, and this one is the editor's call: primary_genre was null and is set
-- to fusion. The Static Dive calls 3G's "multi-genre" and describes Wrong Lover
-- as R&B and pop over hip-hop grooves with Caribbean flavour and a salsa
-- rhythm in the bridge. pop-latin-pop exists in the taxonomy but is inactive,
-- so fusion is the closest active slug. Change it if fusion is wrong.
--
-- SOURCES: MusicBrainz, which records him as a Dominican vocalist and guitarist
-- and as a member of 3G's on lead vocals and lead electric guitar, alongside
-- Wrinisck De Leon Vanterpool and Kitwan Maduro. The Static Dive, 12 November
-- 2020: the trio is two brothers from the Dominican Republic and their friend
-- from the British Virgin Islands; they formed two years earlier; both brothers
-- began playing and singing in primary school; Wrisberg learned guitar at
-- fifteen while Wrinsck sang in groups at college; Kitwan Djmon Maduro started
-- in the youth choir of the Road Town Methodist Church in Baugher's Bay,
-- Tortola; the international debut single Wrong Lover came out on 30 October
-- 2020. TunedLoud, 23 November 2020, on the same single. The band's Facebook
-- for the later single Rica Nena and its Caribbean tour, and for the members'
-- own introductions.
--
-- NOT LINKED: his brother Wrinisck and Kitwan Maduro, neither of whom has an
-- entry. Wrinisck is Dominican and would qualify; Kitwan is from Tortola and
-- would not.
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
       name = 'René De León Vanterpool',
       sort_name = 'De León Vanterpool, René',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'fusion',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Wrisberg',
       middle_name = 'René',
       last_name = 'De León',
       second_last_name = 'Vanterpool',
       stage_name = 'René',
       aliases = ARRAY['Wrisberg René De León', 'Rene De Leon Vanterpool']::text[],
       occupations = '["guitarist"]'::jsonb,
       instruments = ARRAY['guitar']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'diaspora', 'emerging']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican singer and guitarist; member of the trio 3G’s, based in the British Virgin Islands',
       bio_en = 'René De León Vanterpool is a Dominican singer and guitarist. He sings lead and plays lead guitar in 3G’s, a trio he formed with his brother Wrinisck and their friend Kitwan Maduro after the two brothers left the Dominican Republic for the British Virgin Islands.

**Two brothers and a neighbour**

Both brothers grew up in the Dominican Republic and were playing and singing by primary school. René picked up the guitar at fifteen; his brother sang in groups at college. Kitwan Djmon Maduro came to it from the other side of the Caribbean — the youth choir of the Road Town Methodist Church in Baugher’s Bay, Tortola.

The band describes itself as multicultural, from the British Virgin Islands and the Dominican Republic, which is an accurate description of a group whose members do not share a first language and sing in both.

**Wrong Lover**

Their international debut single arrived on 30 October 2020. It is a three-part vocal record built on R&B and hip-hop production, with the harmonies pitched at the boy-band tradition of the nineties, and a bridge that drops into a salsa rhythm with guitar over it. That bridge is the Dominican half of the group making itself heard inside an arrangement that is otherwise North American.

Rica Nena followed, in Spanish, and the trio took it on a short Caribbean run of dates.

**Working away**

He is one of the Dominican musicians whose work happens outside the country. The trio plays the British Virgin Islands and takes bookings in Florida, and the audience for it is the same scattered Caribbean audience that most Dominican musicians abroad end up playing to.',
       bio_es = 'René De León Vanterpool es un cantante y guitarrista dominicano. Lleva la voz principal y la primera guitarra en 3G’s, un trío que formó con su hermano Wrinisck y con el amigo de ambos, Kitwan Maduro, después de que los dos hermanos salieran de República Dominicana hacia las Islas Vírgenes Británicas.

**Dos hermanos y un vecino**

Los dos hermanos se criaron en República Dominicana y ya tocaban y cantaban desde la escuela primaria. René agarró la guitarra a los quince; su hermano cantó en grupos en la universidad. Kitwan Djmon Maduro llegó por el otro lado del Caribe: el coro juvenil de la iglesia metodista de Road Town, en Baugher’s Bay, Tórtola.

La banda se describe a sí misma como multicultural, de las Islas Vírgenes Británicas y de República Dominicana, que es una descripción exacta de un grupo cuyos integrantes no comparten primera lengua y cantan en las dos.

**Wrong Lover**

El sencillo con que debutaron internacionalmente salió el 30 de octubre de 2020. Es un disco de tres voces montado sobre producción de R&B y hip hop, con las armonías afinadas a la tradición de los grupos vocales de los noventa, y un puente que se cae en un ritmo de salsa con la guitarra encima. Ese puente es la mitad dominicana del grupo haciéndose oír dentro de un arreglo que por lo demás es norteamericano.

Después vino Rica Nena, en español, y el trío se la llevó a una gira corta por el Caribe.

**Trabajar afuera**

Es uno de los músicos dominicanos cuyo trabajo ocurre fuera del país. El trío toca en las Islas Vírgenes Británicas y acepta contratos en Florida, y el público de eso es el mismo público caribeño disperso al que termina tocándole casi todo músico dominicano de afuera.',
       updated_at = now()
 WHERE slug = 'rene-de-leon-vanterpool';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rene-de-leon-vanterpool')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rene-de-leon-vanterpool')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"René De León Vanterpool is a Dominican singer and guitarist. He sings lead and plays lead guitar in 3G’s, a trio he formed with his brother Wrinisck and their friend Kitwan Maduro after the two brothers left the Dominican Republic for the British Virgin Islands.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two brothers and a neighbour","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Both brothers grew up in the Dominican Republic and were playing and singing by primary school. René picked up the guitar at fifteen; his brother sang in groups at college. Kitwan Djmon Maduro came to it from the other side of the Caribbean — the youth choir of the Road Town Methodist Church in Baugher’s Bay, Tortola.","type":"text"}]},{"type":"paragraph","content":[{"text":"The band describes itself as multicultural, from the British Virgin Islands and the Dominican Republic, which is an accurate description of a group whose members do not share a first language and sing in both.","type":"text"}]},{"type":"paragraph","content":[{"text":"Wrong Lover","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Their international debut single arrived on 30 October 2020. It is a three-part vocal record built on R&B and hip-hop production, with the harmonies pitched at the boy-band tradition of the nineties, and a bridge that drops into a salsa rhythm with guitar over it. That bridge is the Dominican half of the group making itself heard inside an arrangement that is otherwise North American.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rica Nena followed, in Spanish, and the trio took it on a short Caribbean run of dates.","type":"text"}]},{"type":"paragraph","content":[{"text":"Working away","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is one of the Dominican musicians whose work happens outside the country. The trio plays the British Virgin Islands and takes bookings in Florida, and the audience for it is the same scattered Caribbean audience that most Dominican musicians abroad end up playing to.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'rene-de-leon-vanterpool'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"René De León Vanterpool es un cantante y guitarrista dominicano. Lleva la voz principal y la primera guitarra en 3G’s, un trío que formó con su hermano Wrinisck y con el amigo de ambos, Kitwan Maduro, después de que los dos hermanos salieran de República Dominicana hacia las Islas Vírgenes Británicas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos hermanos y un vecino","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los dos hermanos se criaron en República Dominicana y ya tocaban y cantaban desde la escuela primaria. René agarró la guitarra a los quince; su hermano cantó en grupos en la universidad. Kitwan Djmon Maduro llegó por el otro lado del Caribe: el coro juvenil de la iglesia metodista de Road Town, en Baugher’s Bay, Tórtola.","type":"text"}]},{"type":"paragraph","content":[{"text":"La banda se describe a sí misma como multicultural, de las Islas Vírgenes Británicas y de República Dominicana, que es una descripción exacta de un grupo cuyos integrantes no comparten primera lengua y cantan en las dos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Wrong Lover","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El sencillo con que debutaron internacionalmente salió el 30 de octubre de 2020. Es un disco de tres voces montado sobre producción de R&B y hip hop, con las armonías afinadas a la tradición de los grupos vocales de los noventa, y un puente que se cae en un ritmo de salsa con la guitarra encima. Ese puente es la mitad dominicana del grupo haciéndose oír dentro de un arreglo que por lo demás es norteamericano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después vino Rica Nena, en español, y el trío se la llevó a una gira corta por el Caribe.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabajar afuera","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Es uno de los músicos dominicanos cuyo trabajo ocurre fuera del país. El trío toca en las Islas Vírgenes Británicas y acepta contratos en Florida, y el público de eso es el mismo público caribeño disperso al que termina tocándole casi todo músico dominicano de afuera.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'rene-de-leon-vanterpool'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
