BEGIN;

-- Rewrite the catalogue entry for Griselda Soriano.
--
-- Griselda Soriano. Filler in English, nothing in Spanish, the wrong genre and
-- the wrong province -- and, like her brother Fernando, a record that had lost
-- the fact that she is one of the Sorianos.
--
-- CORRECTED: primary_genre merengue -> bachata. Every recording she is on is
-- bachata. Province "Distrito Nacional" and birth_place "Santo Domingo" -> the
-- province Monte Plata with birth_place left null; the old pair was the
-- importer's default and the family is from Monte Plata. No source says where
-- she herself was born.
--
-- SOURCES: MusicBrainz, which records her as a sibling of Joan Soriano, of
-- Fernando Soriano and of Nelly Soriano. The Kennedy Center on Joan: seventh of
-- fifteen children of Candelario, whose children's band was called Los Candes;
-- Joan "returned to his roots, re-forming the family band with his brother
-- Fernando and sister Griselda"; La Familia Soriano appeared in April 2012 and
-- entered the Billboard Tropical album chart at number three; the record was cut
-- live in Santo Domingo and New York by iASO's Benjamin de Menil. Amazon's
-- listing, which calls the album the recording debut of Joan's three siblings.
-- AllMusic's credits, which give Griselda choir/chorus and vocals. Apple Music,
-- Shazam and Amazon for the tracks she is credited on, all released 10 April
-- 2012 on iASO Records: La Trampa, Tu Forma De Ser, Vamos Hablar Ingles and
-- Hazme Tuya, plus Y Voy a Ser Feliz, which runs under her name with Joan
-- featured. iASO's video of Bachata Yolanda, whose credits give the vocal
-- harmonies to Fernando Soriano, Griselda Soriano and Livander Feliz and the
-- requinto to Joan; and the Como Tu Mujer performance billed as Bachata
-- Femenina, Griselda and Joan Soriano. El Diario NY, 12 April 2013, which calls
-- her the youngest of the family. iASO Records, which places the family in Monte
-- Plata.
--
-- NOT WRITTEN: a birth date. None is published.
--
-- NOT LINKED: Fernando, who has an entry but is still needs_review, and Nelly,
-- who has none. Worth linking the two of them both ways once he is published.
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
       name = 'Griselda Soriano',
       sort_name = 'Soriano, Griselda',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = 'Monte Plata',
       first_name = 'Griselda',
       middle_name = NULL,
       last_name = 'Soriano',
       second_last_name = NULL,
       stage_name = 'Griselda Soriano',
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican bachata singer; youngest of the Soriano family and sister of Joan Soriano',
       bio_en = 'Griselda Soriano is a Dominican bachata singer, the youngest of the fifteen Soriano children and a sister of Joan Soriano. Her voice is on La Familia Soriano, the record that took the family band into a studio for the first time.

**Los Candes**

Their father was Candelario, and the neighbours in Monte Plata named the children’s band after him. That band existed years before any of them owned a proper instrument, and it is where she learned to sing bachata — from the inside of a house full of people already singing it.

Joan left at thirteen and made a career of it. When he came back to the family it was with a record label behind him, and the album that resulted, released in April 2012, entered the Billboard Tropical chart at number three.

**What she sings on it**

She is credited on the album as the featured voice on La Trampa, Tu Forma De Ser, Vamos Hablar Inglés and Hazme Tuya, and Y Voy a Ser Feliz runs the other way round — her name first, with her brother featured. She also holds a chorus part across the rest of the record and one of the three harmony voices on Bachata Yolanda.

That is a substantial share of a twenty-two-track album for somebody who had never been recorded before, and it is a fair reading of what the family thought of her singing.

**A woman singing bachata**

She and Joan have performed a duet billed as bachata femenina — Como Tu Mujer — which is a phrase that has to exist because the genre has been so overwhelmingly male-sung. Bachata written from a woman’s side, at the moment when it was becoming an international export, was still rare enough to need a label.

What she brings to the family sound is a lighter grain against the roughness the men work in, which is exactly what a three-part harmony over a requinto needs at the top.',
       bio_es = 'Griselda Soriano es una cantante de bachata dominicana, la menor de los quince hijos Soriano y hermana de Joan Soriano. Su voz está en La Familia Soriano, el disco que metió por primera vez en un estudio a la banda de la familia.

**Los Candes**

El padre se llamaba Candelario, y en Monte Plata los vecinos le pusieron su nombre a la banda de los muchachos. Esa banda existía años antes de que ninguno tuviera un instrumento de verdad, y ahí fue donde ella aprendió a cantar bachata: desde adentro de una casa llena de gente que ya la estaba cantando.

Joan se fue a los trece y de eso hizo una carrera. Cuando volvió a la familia venía con un sello detrás, y el álbum que salió de aquello, en abril de 2012, entró en el número tres de la lista Tropical de Billboard.

**Lo que canta en él**

En el disco aparece acreditada como voz invitada en La Trampa, Tu Forma De Ser, Vamos Hablar Inglés y Hazme Tuya, y Y Voy a Ser Feliz va al revés: su nombre primero, con su hermano de invitado. Además sostiene una voz de coro a lo largo del resto y una de las tres voces de la armonía en Bachata Yolanda.

Es una porción grande de un álbum de veintidós temas para alguien a quien nunca habían grabado, y dice bastante de lo que la familia pensaba de su manera de cantar.

**Una mujer cantando bachata**

Ella y Joan han hecho un dúo anunciado como bachata femenina —Como Tu Mujer—, que es una frase que tiene que existir porque el género se ha cantado abrumadoramente en voz de hombre. La bachata escrita desde el lado de una mujer, justo cuando el género se volvía producto de exportación, todavía era bastante rara como para necesitar etiqueta.

Lo que ella le aporta al sonido de la familia es un grano más liviano contra la aspereza en que trabajan los hombres, que es exactamente lo que una armonía a tres voces sobre un requinto necesita arriba.',
       updated_at = now()
 WHERE slug = 'griselda-soriano';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'griselda-soriano')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'griselda-soriano')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Griselda Soriano is a Dominican bachata singer, the youngest of the fifteen Soriano children and a sister of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4d9ac6ac-6802-47f4-8731-5fa567713513","displayText":"Joan Soriano","occurrenceId":"97da3b7b-bd20-4a2c-b6e6-9f37826a1fdb"}},{"text":". Her voice is on La Familia Soriano, the record that took the family band into a studio for the first time.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Candes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Their father was Candelario, and the neighbours in Monte Plata named the children’s band after him. That band existed years before any of them owned a proper instrument, and it is where she learned to sing bachata — from the inside of a house full of people already singing it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Joan left at thirteen and made a career of it. When he came back to the family it was with a record label behind him, and the album that resulted, released in April 2012, entered the Billboard Tropical chart at number three.","type":"text"}]},{"type":"paragraph","content":[{"text":"What she sings on it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She is credited on the album as the featured voice on La Trampa, Tu Forma De Ser, Vamos Hablar Inglés and Hazme Tuya, and Y Voy a Ser Feliz runs the other way round — her name first, with her brother featured. She also holds a chorus part across the rest of the record and one of the three harmony voices on Bachata Yolanda.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a substantial share of a twenty-two-track album for somebody who had never been recorded before, and it is a fair reading of what the family thought of her singing.","type":"text"}]},{"type":"paragraph","content":[{"text":"A woman singing bachata","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She and Joan have performed a duet billed as bachata femenina — Como Tu Mujer — which is a phrase that has to exist because the genre has been so overwhelmingly male-sung. Bachata written from a woman’s side, at the moment when it was becoming an international export, was still rare enough to need a label.","type":"text"}]},{"type":"paragraph","content":[{"text":"What she brings to the family sound is a lighter grain against the roughness the men work in, which is exactly what a three-part harmony over a requinto needs at the top.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'griselda-soriano'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Griselda Soriano es una cantante de bachata dominicana, la menor de los quince hijos Soriano y hermana de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4d9ac6ac-6802-47f4-8731-5fa567713513","displayText":"Joan Soriano","occurrenceId":"fdab4e90-7778-43d1-af5d-b598353c6a11"}},{"text":". Su voz está en La Familia Soriano, el disco que metió por primera vez en un estudio a la banda de la familia.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Candes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El padre se llamaba Candelario, y en Monte Plata los vecinos le pusieron su nombre a la banda de los muchachos. Esa banda existía años antes de que ninguno tuviera un instrumento de verdad, y ahí fue donde ella aprendió a cantar bachata: desde adentro de una casa llena de gente que ya la estaba cantando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Joan se fue a los trece y de eso hizo una carrera. Cuando volvió a la familia venía con un sello detrás, y el álbum que salió de aquello, en abril de 2012, entró en el número tres de la lista Tropical de Billboard.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que canta en él","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En el disco aparece acreditada como voz invitada en La Trampa, Tu Forma De Ser, Vamos Hablar Inglés y Hazme Tuya, y Y Voy a Ser Feliz va al revés: su nombre primero, con su hermano de invitado. Además sostiene una voz de coro a lo largo del resto y una de las tres voces de la armonía en Bachata Yolanda.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una porción grande de un álbum de veintidós temas para alguien a quien nunca habían grabado, y dice bastante de lo que la familia pensaba de su manera de cantar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una mujer cantando bachata","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ella y Joan han hecho un dúo anunciado como bachata femenina —Como Tu Mujer—, que es una frase que tiene que existir porque el género se ha cantado abrumadoramente en voz de hombre. La bachata escrita desde el lado de una mujer, justo cuando el género se volvía producto de exportación, todavía era bastante rara como para necesitar etiqueta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que ella le aporta al sonido de la familia es un grano más liviano contra la aspereza en que trabajan los hombres, que es exactamente lo que una armonía a tres voces sobre un requinto necesita arriba.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'griselda-soriano'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'griselda-soriano') AND locale = 'en'), '97da3b7b-bd20-4a2c-b6e6-9f37826a1fdb', 'artist', '4d9ac6ac-6802-47f4-8731-5fa567713513');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'griselda-soriano') AND locale = 'es'), 'fdab4e90-7778-43d1-af5d-b598353c6a11', 'artist', '4d9ac6ac-6802-47f4-8731-5fa567713513');

COMMIT;
