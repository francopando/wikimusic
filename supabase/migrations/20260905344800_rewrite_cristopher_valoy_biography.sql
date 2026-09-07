BEGIN;

-- Rewrite the catalogue entry for Cristopher Valoy.
--
-- Cristopher Valoy. Filler in English, nothing in Spanish -- on the man who
-- sang El Venao, and on a record that said nothing about who he is or what he
-- sang.
--
-- OVERWRITTEN: province "Distrito Nacional" -> "Santo Domingo" and birth_place
-- "Santo Domingo" -> null. The old pair was the importer's default. His father
-- and his brother are both recorded in this catalogue as born in Manoguayabo,
-- Santo Domingo province, so the province is safe; no source says where he
-- himself was born, so the town is left empty rather than inferred.
--
-- ADDED: producer to occupations -- his own Instagram describes him as
-- "productor y cantante merenguero dominicano" -- and the aliases he records
-- under.
--
-- SOURCES: MusicBrainz, which records his father as Cuco Valoy and his sibling
-- as Ramon Orlando. Republica Merengue: "Los Cantantes fue un proyecto de
-- merengue ideado por Ramon Orlando Valoy que tenia como figura principal a su
-- hermano Christopher", and separately "El Venao, compuesto por Ramon Orlando y
-- grabado en voz de Christopher Valoy en la orquesta Los Cantantes, se convirtio
-- en uno de los mayores..." -- text carried by Noticias del Patio and several
-- other Dominican pages. His own Instagram biography, which bills him as the
-- interpreter of "los super exitos El Venao y El Virao". Los Clasicos RD's copy
-- of the official Los Cantantes video for El Virao, dated 1995, credited "Canta:
-- Christopher Valoy", which also names Solo y Sin Na and No Hay Pesos among the
-- group's titles. Spotify, which credits El Virao to Los Cantantes and
-- Christopher Valoy. DJ Intokable's transfer of El Virao. El Caribe, 8 February
-- 2013, "Cristopher Valoy se reinventa con el merengue fusionado", on his return
-- with jocular songs. Isaac Dj Producciones, naming the Los Cantantes line-up
-- as Cristopher Valoy, Miguel Miguel, Feni Ortiz, Ricky Ricon and Alexis
-- Palacios. MusicBrainz for La Fiesta, Las Mil Maneras and New York E' Lindo,
-- and for a bachata, Amor En Pelota, on his own channel.
--
-- DATE LEFT VAGUE ON PURPOSE: sources put El Venao at 1995 and at 1996, and the
-- official El Virao video is dated 1995. The entry says mid-nineties rather than
-- picking one.
--
-- FLAGGED, not used: MusicBrainz also carries an "is person" relation joining
-- him to an artist called Club Latino, whose catalogue is a 1996 El Venao single
-- in several mixes alongside Eurodance covers of Macarena, Lambada and La Bamba.
-- That looks like a licensing name used abroad rather than a project of his, and
-- nothing outside MusicBrainz connects the two, so the entry does not mention it.
--
-- NOT LINKED: Los Cantantes has no entry and plainly should, nor do Miguel
-- Miguel, Feni Ortiz, Ricky Ricon or Alexis Palacios.
--
-- FAMILY ROWS: added separately, in the migration that follows this one.
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
       name = 'Cristopher Valoy',
       sort_name = 'Valoy, Cristopher',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = 'Santo Domingo',
       first_name = 'Cristopher',
       middle_name = NULL,
       last_name = 'Valoy',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['Christopher Valoy', 'Cris Valoy']::text[],
       occupations = '["producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['merengue-orquesta']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@cristophervaloy5684',
       facebook = 'christopher.valoy',
       instagram = 'cristophervaloy',
       disambiguation = 'Dominican merengue singer; the voice of El Venao and El Virao with Los Cantantes',
       bio_en = 'Cristopher Valoy is a Dominican merengue singer and producer, son of Cuco Valoy and brother of Ramón Orlando. He is the voice on El Venao, which is one of the most travelled Dominican records ever made.

**Los Cantantes**

The group was his brother’s idea. Ramón Orlando put Los Cantantes together as a project with Cristopher as its front man, wrote the material and let the singing carry it. Miguel Miguel, Feni Ortiz, Ricky Ricón and Alexis Palacios were in it with him.

El Virao came out with an official video in 1995. El Venao followed in the middle of that decade — sources give both 1995 and 1996 — and it went everywhere. It is one of those merengues that stopped being a record and became a phrase, and it is sung in countries that could not otherwise name a Dominican song.

Solo y Sin Na and No Hay Pesos are on the same shelf. The formula was a joke told at speed over a merengue that never lets up, which is a much harder thing to write than it sounds.

**A house of musicians**

There is no version of this story that does not start with the family. His father is one of the founding figures of Dominican salsa and merengue both; his uncle Martín Valoy sang beside his father for decades; his brother is a bandleader, an arranger and a Gran Soberano winner. Growing up inside that is an apprenticeship whether or not anyone calls it one.

What is unusual is the division of labour. His brother wrote and arranged; he sang. In a family where nearly everybody does everything, taking one job and doing it properly is its own kind of decision.

**Since then**

He came back in 2013 with fused merengue and the same comic register, and he has kept recording under his own name — La Fiesta, Las Mil Maneras, New York E’ Lindo, and a bachata, Amor En Pelota. He also works as a producer.

He still performs El Virao. Thirty years on, the audience still knows every word, which is what a song of that size does to the rest of a career.',
       bio_es = 'Cristopher Valoy es un cantante y productor de merengue dominicano, hijo de Cuco Valoy y hermano de Ramón Orlando. Es la voz de El Venao, uno de los discos dominicanos que más lejos han llegado.

**Los Cantantes**

El grupo fue idea de su hermano. Ramón Orlando armó Los Cantantes como un proyecto con Cristopher de figura principal, escribió el material y dejó que la voz lo cargara. Con él estaban Miguel Miguel, Feni Ortiz, Ricky Ricón y Alexis Palacios.

El Virao salió con video oficial en 1995. El Venao vino a mediados de esa década —hay fuentes que dicen 1995 y fuentes que dicen 1996— y se fue a todas partes. Es de esos merengues que dejaron de ser un disco para volverse una frase, y se canta en países que no podrían nombrar otra canción dominicana.

Solo y Sin Na y No Hay Pesos están en el mismo estante. La fórmula era un chiste contado a toda velocidad sobre un merengue que no afloja, que es mucho más difícil de escribir de lo que suena.

**Una casa de músicos**

No hay manera de contar esto sin empezar por la familia. Su padre es una de las figuras fundadoras de la salsa y del merengue dominicanos a la vez; su tío Martín Valoy cantó al lado de su padre durante décadas; su hermano es director, arreglista y Gran Soberano. Criarse dentro de eso es un aprendizaje, lo llame así alguien o no.

Lo raro es el reparto del trabajo. Su hermano escribía y arreglaba; él cantaba. En una familia donde casi todos hacen de todo, quedarse con un oficio y hacerlo bien es una decisión en sí misma.

**Desde entonces**

Volvió en 2013 con merengue fusionado y el mismo registro cómico, y ha seguido grabando con su propio nombre: La Fiesta, Las Mil Maneras, New York E’ Lindo y una bachata, Amor En Pelota. También trabaja de productor.

Sigue cantando El Virao. Treinta años después el público todavía se sabe la letra entera, que es lo que una canción de ese tamaño le hace al resto de una carrera.',
       updated_at = now()
 WHERE slug = 'cristopher-valoy';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Cristopher Valoy is a Dominican merengue singer and producer, son of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c11c2dda-ffa1-4f09-9d24-00dc4473bc8d","displayText":"Cuco Valoy","occurrenceId":"c7aac3ff-962b-4f07-8ffd-cdd5c9efc8d0"}},{"text":" and brother of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"2c7dd41a-548f-44e7-8ed1-da7617047fbd"}},{"text":". He is the voice on El Venao, which is one of the most travelled Dominican records ever made.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Cantantes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The group was his brother’s idea. Ramón Orlando put Los Cantantes together as a project with Cristopher as its front man, wrote the material and let the singing carry it. Miguel Miguel, Feni Ortiz, Ricky Ricón and Alexis Palacios were in it with him.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Virao came out with an official video in 1995. El Venao followed in the middle of that decade — sources give both 1995 and 1996 — and it went everywhere. It is one of those merengues that stopped being a record and became a phrase, and it is sung in countries that could not otherwise name a Dominican song.","type":"text"}]},{"type":"paragraph","content":[{"text":"Solo y Sin Na and No Hay Pesos are on the same shelf. The formula was a joke told at speed over a merengue that never lets up, which is a much harder thing to write than it sounds.","type":"text"}]},{"type":"paragraph","content":[{"text":"A house of musicians","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"There is no version of this story that does not start with the family. His father is one of the founding figures of Dominican salsa and merengue both; his uncle ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6eccc3e7-82bf-435f-8ae1-ea7e8a721560","displayText":"Martín Valoy","occurrenceId":"4b01228a-627b-45b6-a533-0b0f9a7050a9"}},{"text":" sang beside his father for decades; his brother is a bandleader, an arranger and a Gran Soberano winner. Growing up inside that is an apprenticeship whether or not anyone calls it one.","type":"text"}]},{"type":"paragraph","content":[{"text":"What is unusual is the division of labour. His brother wrote and arranged; he sang. In a family where nearly everybody does everything, taking one job and doing it properly is its own kind of decision.","type":"text"}]},{"type":"paragraph","content":[{"text":"Since then","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He came back in 2013 with fused merengue and the same comic register, and he has kept recording under his own name — La Fiesta, Las Mil Maneras, New York E’ Lindo, and a bachata, Amor En Pelota. He also works as a producer.","type":"text"}]},{"type":"paragraph","content":[{"text":"He still performs El Virao. Thirty years on, the audience still knows every word, which is what a song of that size does to the rest of a career.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'cristopher-valoy'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Cristopher Valoy es un cantante y productor de merengue dominicano, hijo de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c11c2dda-ffa1-4f09-9d24-00dc4473bc8d","displayText":"Cuco Valoy","occurrenceId":"a40c282b-07b0-49e3-98d1-815d2b5372ed"}},{"text":" y hermano de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"7ed10134-4907-46ec-a769-866eb19bd31b"}},{"text":". Es la voz de El Venao, uno de los discos dominicanos que más lejos han llegado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Cantantes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El grupo fue idea de su hermano. Ramón Orlando armó Los Cantantes como un proyecto con Cristopher de figura principal, escribió el material y dejó que la voz lo cargara. Con él estaban Miguel Miguel, Feni Ortiz, Ricky Ricón y Alexis Palacios.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Virao salió con video oficial en 1995. El Venao vino a mediados de esa década —hay fuentes que dicen 1995 y fuentes que dicen 1996— y se fue a todas partes. Es de esos merengues que dejaron de ser un disco para volverse una frase, y se canta en países que no podrían nombrar otra canción dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Solo y Sin Na y No Hay Pesos están en el mismo estante. La fórmula era un chiste contado a toda velocidad sobre un merengue que no afloja, que es mucho más difícil de escribir de lo que suena.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una casa de músicos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"No hay manera de contar esto sin empezar por la familia. Su padre es una de las figuras fundadoras de la salsa y del merengue dominicanos a la vez; su tío ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6eccc3e7-82bf-435f-8ae1-ea7e8a721560","displayText":"Martín Valoy","occurrenceId":"e13672c7-3164-4c96-b870-8ef9164ca1b1"}},{"text":" cantó al lado de su padre durante décadas; su hermano es director, arreglista y Gran Soberano. Criarse dentro de eso es un aprendizaje, lo llame así alguien o no.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo raro es el reparto del trabajo. Su hermano escribía y arreglaba; él cantaba. En una familia donde casi todos hacen de todo, quedarse con un oficio y hacerlo bien es una decisión en sí misma.","type":"text"}]},{"type":"paragraph","content":[{"text":"Desde entonces","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Volvió en 2013 con merengue fusionado y el mismo registro cómico, y ha seguido grabando con su propio nombre: La Fiesta, Las Mil Maneras, New York E’ Lindo y una bachata, Amor En Pelota. También trabaja de productor.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sigue cantando El Virao. Treinta años después el público todavía se sabe la letra entera, que es lo que una canción de ese tamaño le hace al resto de una carrera.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'cristopher-valoy'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy') AND locale = 'en'), '2c7dd41a-548f-44e7-8ed1-da7617047fbd', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy') AND locale = 'en'), '4b01228a-627b-45b6-a533-0b0f9a7050a9', 'artist', '6eccc3e7-82bf-435f-8ae1-ea7e8a721560');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy') AND locale = 'en'), 'c7aac3ff-962b-4f07-8ffd-cdd5c9efc8d0', 'artist', 'c11c2dda-ffa1-4f09-9d24-00dc4473bc8d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy') AND locale = 'es'), '7ed10134-4907-46ec-a769-866eb19bd31b', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy') AND locale = 'es'), 'a40c282b-07b0-49e3-98d1-815d2b5372ed', 'artist', 'c11c2dda-ffa1-4f09-9d24-00dc4473bc8d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'cristopher-valoy') AND locale = 'es'), 'e13672c7-3164-4c96-b870-8ef9164ca1b1', 'artist', '6eccc3e7-82bf-435f-8ae1-ea7e8a721560');

COMMIT;
