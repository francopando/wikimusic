BEGIN;

-- Rewrite the catalogue entry for Fernando Soriano.
--
-- Fernando Soriano. Filler in English, nothing in Spanish -- and a record that
-- had lost the single most important fact about him: he is Joan Soriano's
-- brother, and one of the fifteen Sorianos.
--
-- CORRECTED: primary_genre ballads -> bachata, and the duplicate bachata
-- removed from genres. Everything he is documented on is bachata. Province and
-- birth_place "Santiago" -> province Monte Plata, birth_place null. Santiago is
-- contradicted by every source: the family is from Monte Plata. No source says
-- where Fernando himself was born, so the province stands alone.
--
-- ADDED: occupations guitarist, instruments guitar. AllMusic's credits for La
-- Familia Soriano list him as Guitar (Rhythm), Vocals.
--
-- SOURCES: MusicBrainz, which records him as a sibling of Joan Soriano and of
-- Griselda Soriano. The Kennedy Center's artist page for Joan: Joan is the
-- seventh of fifteen siblings; their father was Candelario, and the children's
-- band was nicknamed Los Candes after him; Joan later "returned to his roots,
-- re-forming the family band with his brother Fernando and sister Griselda";
-- La Familia Soriano came out in April 2012 and entered the Billboard Tropical
-- album chart at number three; it was recorded live in Santo Domingo and New
-- York by iASO's producer Benjamin de Menil. Amazon's listing for the CD: "the
-- recording debut of Joan's three siblings: his brother Fernando and sisters
-- Nelly and Griselda". AllMusic's credit list. iASO Records' own copy, which
-- places the family in Monte Plata, "where the young Sorianos learned to dance
-- to the rhythm of bachata in their mother's arms". iASO's video of La Familia
-- Soriano performing Bachata Yolanda, whose on-screen credits give the vocal
-- harmonies to Fernando Soriano, Griselda Soriano and Livander Feliz and the
-- requinto to Joan. iASO's video of Fernando singing Por Ti at Yoshi's. English
-- Wikipedia for Joan's legal name and birth, Juan Bienvenido Severino Soriano,
-- Monte Plata, 23 February 1972.
--
-- NOT WRITTEN: a birth date. None is published for him.
--
-- NOT LINKED: Griselda, who has an entry but is still needs_review, and Nelly,
-- who has none. Worth linking Fernando and Griselda both ways once she is
-- published.
--
-- FAMILY ROWS: the sibling relationships are added separately, in the migration
-- that follows the pair of biographies.
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
       name = 'Fernando Soriano',
       sort_name = 'Soriano, Fernando',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = 'Monte Plata',
       first_name = 'Fernando',
       middle_name = NULL,
       last_name = 'Soriano',
       second_last_name = NULL,
       stage_name = 'Fernando Soriano',
       aliases = ARRAY[]::text[],
       occupations = '["guitarist"]'::jsonb,
       instruments = ARRAY['guitar']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican bachata singer and rhythm guitarist; brother of Joan Soriano',
       bio_en = 'Fernando Soriano is a Dominican bachata singer and rhythm guitarist, and a brother of Joan Soriano. He sings and plays on La Familia Soriano, the record that put the family’s voices on tape for the first time.

**Fifteen children and a guitar**

Their father was Candelario, and the children who grew up on his land in Monte Plata made themselves into a band before any of them had an instrument worth the name. The neighbourhood called them Los Candes, after him. Joan is the seventh of fifteen.

That is the ordinary way bachata was learned in the countryside: not in a school and not from a record, but from whichever older sibling already had the chords, on a guitar that in Joan’s case was fishing line strung across a discarded metal box.

**La Familia Soriano**

Joan left for Santo Domingo at thirteen and spent years working for other people’s bachata stars. When he came back to the family band it was to record it. La Familia Soriano came out in April 2012 on iASO Records, cut live in studios in Santo Domingo and New York by Benjamin de Menil, and it entered the Billboard Tropical album chart at number three.

It was the first time Fernando, Griselda and Nelly had been recorded at all. Fernando plays rhythm guitar and sings across it, takes the lead on Cuánto Lloré, and holds one of the three harmony parts on Bachata Yolanda under his brother’s requinto.

**The second guitar**

Rhythm guitar in bachata is a specific job and it is not strumming. It carries the syncopation that the requinto plays against, and if it drifts the whole figure collapses. In a family band that job usually falls to whoever can be trusted not to show off, and in this one it fell to him.

He also works out front on his own. iASO filmed him singing Por Ti at Yoshi’s, a room in Oakland better known for jazz than for a Dominican guitar trio.',
       bio_es = 'Fernando Soriano es un cantante y guitarrista rítmico de bachata dominicano, hermano de Joan Soriano. Canta y toca en La Familia Soriano, el disco que puso por primera vez en cinta las voces de la familia.

**Quince hijos y una guitarra**

El padre se llamaba Candelario, y los muchachos que se criaron en sus tierras de Monte Plata se hicieron banda antes de que ninguno tuviera un instrumento que mereciera el nombre. En el barrio les decían Los Candes, por él. Joan es el séptimo de quince.

Así se aprendía la bachata en el campo: no en una escuela ni de un disco, sino del hermano mayor que ya tuviera los acordes, en una guitarra que en el caso de Joan era hilo de pescar tendido sobre una lata de metal tirada.

**La Familia Soriano**

Joan se fue a Santo Domingo a los trece y pasó años trabajándole a las estrellas de bachata de otros. Cuando volvió a la banda familiar fue para grabarla. La Familia Soriano salió en abril de 2012 por iASO Records, grabado en vivo en estudios de Santo Domingo y de Nueva York por Benjamin de Menil, y entró en el número tres de la lista Tropical de Billboard.

Era la primera vez que se grababa a Fernando, a Griselda y a Nelly. Fernando toca la guitarra rítmica y canta a lo largo del disco, lleva la voz principal en Cuánto Lloré y sostiene una de las tres voces de la armonía en Bachata Yolanda, por debajo del requinto de su hermano.

**La segunda guitarra**

La guitarra rítmica en la bachata es un oficio concreto y no es rasguear. Carga la síncopa contra la que toca el requinto, y si se desplaza se cae la figura entera. En una banda de hermanos ese trabajo suele caerle al que sabe no lucirse, y en esta le cayó a él.

También trabaja al frente por su cuenta. iASO lo filmó cantando Por Ti en Yoshi’s, una sala de Oakland más conocida por el jazz que por un trío de guitarras dominicano.',
       updated_at = now()
 WHERE slug = 'fernando-soriano';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-soriano')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-soriano')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Fernando Soriano is a Dominican bachata singer and rhythm guitarist, and a brother of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4d9ac6ac-6802-47f4-8731-5fa567713513","displayText":"Joan Soriano","occurrenceId":"7f87d37e-3de4-4a59-8e0f-fce40626c46f"}},{"text":". He sings and plays on La Familia Soriano, the record that put the family’s voices on tape for the first time.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fifteen children and a guitar","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Their father was Candelario, and the children who grew up on his land in Monte Plata made themselves into a band before any of them had an instrument worth the name. The neighbourhood called them Los Candes, after him. Joan is the seventh of fifteen.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the ordinary way bachata was learned in the countryside: not in a school and not from a record, but from whichever older sibling already had the chords, on a guitar that in Joan’s case was fishing line strung across a discarded metal box.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Familia Soriano","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Joan left for Santo Domingo at thirteen and spent years working for other people’s bachata stars. When he came back to the family band it was to record it. La Familia Soriano came out in April 2012 on iASO Records, cut live in studios in Santo Domingo and New York by Benjamin de Menil, and it entered the Billboard Tropical album chart at number three.","type":"text"}]},{"type":"paragraph","content":[{"text":"It was the first time Fernando, Griselda and Nelly had been recorded at all. Fernando plays rhythm guitar and sings across it, takes the lead on Cuánto Lloré, and holds one of the three harmony parts on Bachata Yolanda under his brother’s requinto.","type":"text"}]},{"type":"paragraph","content":[{"text":"The second guitar","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Rhythm guitar in bachata is a specific job and it is not strumming. It carries the syncopation that the requinto plays against, and if it drifts the whole figure collapses. In a family band that job usually falls to whoever can be trusted not to show off, and in this one it fell to him.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also works out front on his own. iASO filmed him singing Por Ti at Yoshi’s, a room in Oakland better known for jazz than for a Dominican guitar trio.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'fernando-soriano'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Fernando Soriano es un cantante y guitarrista rítmico de bachata dominicano, hermano de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4d9ac6ac-6802-47f4-8731-5fa567713513","displayText":"Joan Soriano","occurrenceId":"4d2d68d5-2df1-4d25-8478-882edffd174a"}},{"text":". Canta y toca en La Familia Soriano, el disco que puso por primera vez en cinta las voces de la familia.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quince hijos y una guitarra","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El padre se llamaba Candelario, y los muchachos que se criaron en sus tierras de Monte Plata se hicieron banda antes de que ninguno tuviera un instrumento que mereciera el nombre. En el barrio les decían Los Candes, por él. Joan es el séptimo de quince.","type":"text"}]},{"type":"paragraph","content":[{"text":"Así se aprendía la bachata en el campo: no en una escuela ni de un disco, sino del hermano mayor que ya tuviera los acordes, en una guitarra que en el caso de Joan era hilo de pescar tendido sobre una lata de metal tirada.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Familia Soriano","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Joan se fue a Santo Domingo a los trece y pasó años trabajándole a las estrellas de bachata de otros. Cuando volvió a la banda familiar fue para grabarla. La Familia Soriano salió en abril de 2012 por iASO Records, grabado en vivo en estudios de Santo Domingo y de Nueva York por Benjamin de Menil, y entró en el número tres de la lista Tropical de Billboard.","type":"text"}]},{"type":"paragraph","content":[{"text":"Era la primera vez que se grababa a Fernando, a Griselda y a Nelly. Fernando toca la guitarra rítmica y canta a lo largo del disco, lleva la voz principal en Cuánto Lloré y sostiene una de las tres voces de la armonía en Bachata Yolanda, por debajo del requinto de su hermano.","type":"text"}]},{"type":"paragraph","content":[{"text":"La segunda guitarra","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La guitarra rítmica en la bachata es un oficio concreto y no es rasguear. Carga la síncopa contra la que toca el requinto, y si se desplaza se cae la figura entera. En una banda de hermanos ese trabajo suele caerle al que sabe no lucirse, y en esta le cayó a él.","type":"text"}]},{"type":"paragraph","content":[{"text":"También trabaja al frente por su cuenta. iASO lo filmó cantando Por Ti en Yoshi’s, una sala de Oakland más conocida por el jazz que por un trío de guitarras dominicano.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'fernando-soriano'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-soriano') AND locale = 'en'), '7f87d37e-3de4-4a59-8e0f-fce40626c46f', 'artist', '4d9ac6ac-6802-47f4-8731-5fa567713513');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-soriano') AND locale = 'es'), '4d2d68d5-2df1-4d25-8478-882edffd174a', 'artist', '4d9ac6ac-6802-47f4-8731-5fa567713513');

COMMIT;
