BEGIN;

-- Rewrite the catalogue entry for El Mayor Clásico.
--
-- El Mayor Clasico. Filler in English, nothing in Spanish, no gender, no dates,
-- no real name -- and the genre said merengue, on one of the founding names of
-- Dominican dembow.
--
-- CORRECTED: primary_genre merengue -> urban-dembow. He is a dembow artist and
-- nobody has ever filed him anywhere near merengue.
--
-- CORRECTED: province "Distrito Nacional" -> "Santo Domingo" and birth_place
-- "Santo Domingo" -> "Las Canitas, Santo Domingo Norte". Listin Diario places
-- him precisely: Las Canitas is in Santo Domingo Norte, which is Santo Domingo
-- province, not the Distrito Nacional. The old pair was the importer's default
-- and it was wrong on the province.
--
-- ADDED: real name Emmanuel Reyes, date of birth 9 November 1990, gender male,
-- occupations rapper and composer, and the alias El Mayor.
--
-- SOURCES: BuenaMusica's "Datos de" block and biography: real name Emmanuel
-- Reyes, born Santo Domingo 9 November 1990, singer, rapper and composer,
-- active from 2010, signed to Gran Velero Records, first single Los Gucci,
-- break-out with Clasico; hip hop, reguetón and dembow; a fan of Daddy Yankee
-- and Tego Calderon as a teenager; the collaborations Envidioso (2019, with
-- Secreto El Famoso Biberon, Ceky Viciny and Bulova), Electricidad, No la tiene
-- (2020-21, with Shelow Shaq and El Poeta Callejero), La 23 with the Puerto
-- Rican Farruko, Amanecio (2023, with Elvis Martinez), and the 2024 run --
-- Bailar, Tu no le ha llegao', Los kilos + chiquito, Dime tu, Eso -- followed
-- by Personalidad, Tamo lindo, El hijo de Dios and Bien Happy for Chosen Few;
-- and the anecdote he tells about his first paid show: "Mi primera actuacion
-- fue un viernes y me pagaron 4,000 pesos. El sabado compre 2,000 de cds y un
-- poloche, porque al siguiente domingo tenia otra presentacion y era gratis,
-- pero sabia que estaria alli mucha gente, entonces tenia que invertir en
-- ropa". His own YouTube channel: "Emmanuel Reys aka El Mayor Clasico nacio en
-- Santo Domingo, Republica Dominicana, en 1990... Partidario del estilo
-- Dembow". Listin Diario, 20 April 2017, "El Mayor, de Las Canitas al sueno",
-- and its 11 July 2023 follow-up, both of which put the barrio in Santo Domingo
-- Norte. Dominican pages for the titles Choki Choki, Minor Ratata, El Maiz, Toy
-- Alante, Usted Jevito Soy and Yo Soy Jevito.
--
-- NOT WRITTEN: his parents, his upbringing beyond the barrio and the work, and
-- the court matter involving his partner that Dominican outlets covered in
-- 2017. None of it is musical work.
--
-- NOT LINKED: Bulova and Farruko have no entries; Farruko is Puerto Rican and
-- should not have one.
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
       name = 'El Mayor Clásico',
       sort_name = 'Mayor Clásico, El',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1990-11-09',
       birth_year = 1990,
       date_of_death = NULL,
       birth_place = 'Las Cañitas, Santo Domingo Norte',
       province = 'Santo Domingo',
       first_name = 'Emmanuel',
       middle_name = NULL,
       last_name = 'Reyes',
       second_last_name = NULL,
       stage_name = 'El Mayor Clásico',
       aliases = ARRAY['El Mayor', 'Emmanuel Reyes']::text[],
       occupations = '["rapper","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-reggaeton', 'urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@elmayorclasico',
       facebook = 'ElMayorClasicoDR',
       instagram = 'ELMAYORCLASICO',
       disambiguation = 'Dominican dembow artist, born Emmanuel Reyes in Las Cañitas; one of the genre’s founding names',
       bio_en = 'El Mayor Clásico is a Dominican dembow artist, born Emmanuel Reyes on 9 November 1990. He came out of Las Cañitas, in Santo Domingo Norte, and is one of the names dembow was built on.

**Four thousand pesos**

He tells the story of his first paid show as an accounting problem. He was paid four thousand pesos on the Friday. On the Saturday he spent two thousand of it on CDs and a T-shirt, because Sunday’s show paid nothing but he knew the crowd would be big, and if the crowd was going to be big he had to be dressed for it and have something to sell them.

That is the whole economics of Dominican street music in one weekend: the record is a business card, the clothes are the advertising, and the free show is the investment.

**Getting heard**

The first single, Los Gucci, went nowhere. Clásico is the one that found an audience, and it gave him the name he kept. Labels came and went before Gran Velero Records signed him.

What he grew up on was Puerto Rican — Daddy Yankee, Tego Calderón — and what he made was the Dominican answer to it. Dembow takes the same lineage and strips it down further: faster, cruder, built on one loop, written in the language of the barrio it comes from. Choki Choki, Minor Ratata, El Maíz, Toy Alante, Usted Jevito Soy.

**Everyone at once**

Dembow is a collaborative genre by construction, and his credits read like a map of it. Envidioso put him with Secreto El Famoso Biberón, Ceky Viciny and Bulova; No La Tiene with Shelow Shaq and El Poeta Callejero; and he has worked across the years with Shadow Blow, Rochy RD and Nino Freestyle.

He has also gone outside the genre for it. Amanecío paired him with Elvis Martínez — a bachata voice from an entirely different decade of Dominican music — and La 23 took him onto a record with the Puerto Rican Farruko.

**Still working**

The output has not slowed. Bailar, Tú No Le Ha Llegao’, Los Kilos + Chiquito, Dime Tú and Eso came in a single stretch, and Personalidad, Tamo Lindo, El Hijo de Dios and Bien Happy followed on Chosen Few.

Fifteen years in, he is one of the few from dembow’s first wave still releasing at the pace the genre demands.',
       bio_es = 'El Mayor Clásico es un dembowsero dominicano, nacido Emmanuel Reyes el 9 de noviembre de 1990. Salió de Las Cañitas, en Santo Domingo Norte, y es uno de los nombres sobre los que se levantó el dembow.

**Cuatro mil pesos**

La historia de su primera presentación pagada la cuenta como un problema de contabilidad. Le pagaron cuatro mil pesos el viernes. El sábado gastó dos mil en cedés y un poloché, porque el domingo tocaba gratis pero sabía que iba a haber mucha gente, y si iba a haber mucha gente tenía que estar vestido y tener algo que venderle.

Esa es toda la economía de la música de calle dominicana en un fin de semana: el disco es la tarjeta de presentación, la ropa es la publicidad y el bolo gratis es la inversión.

**Hacerse oír**

El primer sencillo, Los Gucci, no llegó a nada. Clásico es el que encontró público, y le dio el nombre que se quedó. Vinieron y se fueron sellos antes de que lo fichara Gran Velero Records.

Con lo que se crió era puertorriqueño —Daddy Yankee, Tego Calderón— y lo que hizo fue la respuesta dominicana. El dembow toma esa misma línea y la desnuda más: más rápido, más crudo, montado sobre un solo loop, escrito en la lengua del barrio de donde sale. Choki Choki, Minor Ratata, El Maíz, Toy Alante, Usted Jevito Soy.

**Todos a la vez**

El dembow es un género colaborativo por construcción, y sus créditos se leen como un mapa de él. Envidioso lo puso con Secreto El Famoso Biberón, Ceky Viciny y Bulova; No La Tiene con Shelow Shaq y El Poeta Callejero; y a lo largo de los años ha trabajado con Shadow Blow, Rochy RD y Nino Freestyle.

También ha salido del género para eso. Amanecío lo juntó con Elvis Martínez, una voz de bachata de otra década entera de la música dominicana, y La 23 lo metió en un disco con el puertorriqueño Farruko.

**Sigue trabajando**

La producción no ha bajado. Bailar, Tú No Le Ha Llegao’, Los Kilos + Chiquito, Dime Tú y Eso salieron en un mismo tramo, y detrás Personalidad, Tamo Lindo, El Hijo de Dios y Bien Happy, por Chosen Few.

Quince años después, es de los pocos de la primera camada del dembow que sigue publicando al ritmo que el género exige.',
       updated_at = now()
 WHERE slug = 'el-mayor-clasico';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"El Mayor Clásico is a Dominican dembow artist, born Emmanuel Reyes on 9 November 1990. He came out of Las Cañitas, in Santo Domingo Norte, and is one of the names dembow was built on.","type":"text"}]},{"type":"paragraph","content":[{"text":"Four thousand pesos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He tells the story of his first paid show as an accounting problem. He was paid four thousand pesos on the Friday. On the Saturday he spent two thousand of it on CDs and a T-shirt, because Sunday’s show paid nothing but he knew the crowd would be big, and if the crowd was going to be big he had to be dressed for it and have something to sell them.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the whole economics of Dominican street music in one weekend: the record is a business card, the clothes are the advertising, and the free show is the investment.","type":"text"}]},{"type":"paragraph","content":[{"text":"Getting heard","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The first single, Los Gucci, went nowhere. Clásico is the one that found an audience, and it gave him the name he kept. Labels came and went before Gran Velero Records signed him.","type":"text"}]},{"type":"paragraph","content":[{"text":"What he grew up on was Puerto Rican — Daddy Yankee, Tego Calderón — and what he made was the Dominican answer to it. Dembow takes the same lineage and strips it down further: faster, cruder, built on one loop, written in the language of the barrio it comes from. Choki Choki, Minor Ratata, El Maíz, Toy Alante, Usted Jevito Soy.","type":"text"}]},{"type":"paragraph","content":[{"text":"Everyone at once","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dembow is a collaborative genre by construction, and his credits read like a map of it. Envidioso put him with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f57eb2e7-9ca7-463d-baee-8b3ea1800e6b","displayText":"Secreto El Famoso Biberón","occurrenceId":"c7a16d7f-4b43-4d8b-9d7f-6006a0ef0eb9"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"69516395-56d6-4aa9-ba05-7fd6c3673989"}},{"text":" and Bulova; No La Tiene with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"ee85ef36-18e3-4a1b-a121-1dddc525a687"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cea4b00e-cabe-48a8-9e1b-13b72a92d10a","displayText":"El Poeta Callejero","occurrenceId":"7f8d9a7f-7dc9-477c-b285-ac2c93d92255"}},{"text":"; and he has worked across the years with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"f675f4f7-c70d-4046-a48a-c931875cb699"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb","displayText":"Rochy RD","occurrenceId":"32ae9787-a738-487c-9af3-41e09ec63b77"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"270ba4bb-287a-401d-b672-818fbe9477d3","displayText":"Nino Freestyle","occurrenceId":"9ae4144e-f30a-4861-8055-052649acbdd0"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"He has also gone outside the genre for it. Amanecío paired him with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e566c763-02c1-4f96-8a82-edbba9fc0bb2","displayText":"Elvis Martínez","occurrenceId":"a9d314ad-5f24-44b9-ac06-217622c7f11c"}},{"text":" — a bachata voice from an entirely different decade of Dominican music — and La 23 took him onto a record with the Puerto Rican Farruko.","type":"text"}]},{"type":"paragraph","content":[{"text":"Still working","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The output has not slowed. Bailar, Tú No Le Ha Llegao’, Los Kilos + Chiquito, Dime Tú and Eso came in a single stretch, and Personalidad, Tamo Lindo, El Hijo de Dios and Bien Happy followed on Chosen Few.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fifteen years in, he is one of the few from dembow’s first wave still releasing at the pace the genre demands.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'el-mayor-clasico'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"El Mayor Clásico es un dembowsero dominicano, nacido Emmanuel Reyes el 9 de noviembre de 1990. Salió de Las Cañitas, en Santo Domingo Norte, y es uno de los nombres sobre los que se levantó el dembow.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cuatro mil pesos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La historia de su primera presentación pagada la cuenta como un problema de contabilidad. Le pagaron cuatro mil pesos el viernes. El sábado gastó dos mil en cedés y un poloché, porque el domingo tocaba gratis pero sabía que iba a haber mucha gente, y si iba a haber mucha gente tenía que estar vestido y tener algo que venderle.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa es toda la economía de la música de calle dominicana en un fin de semana: el disco es la tarjeta de presentación, la ropa es la publicidad y el bolo gratis es la inversión.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hacerse oír","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El primer sencillo, Los Gucci, no llegó a nada. Clásico es el que encontró público, y le dio el nombre que se quedó. Vinieron y se fueron sellos antes de que lo fichara Gran Velero Records.","type":"text"}]},{"type":"paragraph","content":[{"text":"Con lo que se crió era puertorriqueño —Daddy Yankee, Tego Calderón— y lo que hizo fue la respuesta dominicana. El dembow toma esa misma línea y la desnuda más: más rápido, más crudo, montado sobre un solo loop, escrito en la lengua del barrio de donde sale. Choki Choki, Minor Ratata, El Maíz, Toy Alante, Usted Jevito Soy.","type":"text"}]},{"type":"paragraph","content":[{"text":"Todos a la vez","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El dembow es un género colaborativo por construcción, y sus créditos se leen como un mapa de él. Envidioso lo puso con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f57eb2e7-9ca7-463d-baee-8b3ea1800e6b","displayText":"Secreto El Famoso Biberón","occurrenceId":"caa083dd-74a8-47a5-8a06-3f98880211fa"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"f57afabb-2435-4965-ab7c-210f139f7893"}},{"text":" y Bulova; No La Tiene con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"43f7e3f6-2352-4c08-926e-7e06847fdc9c"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cea4b00e-cabe-48a8-9e1b-13b72a92d10a","displayText":"El Poeta Callejero","occurrenceId":"382fd319-1baa-4093-8c03-c1fdd5dec626"}},{"text":"; y a lo largo de los años ha trabajado con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"5e7688fb-a3d6-44e1-a1d5-12186f99525d"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb","displayText":"Rochy RD","occurrenceId":"8a6dba59-8e6b-40ba-a844-f1042b33f072"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"270ba4bb-287a-401d-b672-818fbe9477d3","displayText":"Nino Freestyle","occurrenceId":"0594c72a-83e0-448a-972d-b1c466362a63"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"También ha salido del género para eso. Amanecío lo juntó con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e566c763-02c1-4f96-8a82-edbba9fc0bb2","displayText":"Elvis Martínez","occurrenceId":"6d61da33-2963-45c7-8723-2ccd68ca61fb"}},{"text":", una voz de bachata de otra década entera de la música dominicana, y La 23 lo metió en un disco con el puertorriqueño Farruko.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sigue trabajando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La producción no ha bajado. Bailar, Tú No Le Ha Llegao’, Los Kilos + Chiquito, Dime Tú y Eso salieron en un mismo tramo, y detrás Personalidad, Tamo Lindo, El Hijo de Dios y Bien Happy, por Chosen Few.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quince años después, es de los pocos de la primera camada del dembow que sigue publicando al ritmo que el género exige.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'el-mayor-clasico'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'en'), '32ae9787-a738-487c-9af3-41e09ec63b77', 'artist', '71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'en'), '69516395-56d6-4aa9-ba05-7fd6c3673989', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'en'), '7f8d9a7f-7dc9-477c-b285-ac2c93d92255', 'artist', 'cea4b00e-cabe-48a8-9e1b-13b72a92d10a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'en'), '9ae4144e-f30a-4861-8055-052649acbdd0', 'artist', '270ba4bb-287a-401d-b672-818fbe9477d3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'en'), 'a9d314ad-5f24-44b9-ac06-217622c7f11c', 'artist', 'e566c763-02c1-4f96-8a82-edbba9fc0bb2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'en'), 'c7a16d7f-4b43-4d8b-9d7f-6006a0ef0eb9', 'artist', 'f57eb2e7-9ca7-463d-baee-8b3ea1800e6b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'en'), 'ee85ef36-18e3-4a1b-a121-1dddc525a687', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'en'), 'f675f4f7-c70d-4046-a48a-c931875cb699', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'es'), '0594c72a-83e0-448a-972d-b1c466362a63', 'artist', '270ba4bb-287a-401d-b672-818fbe9477d3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'es'), '382fd319-1baa-4093-8c03-c1fdd5dec626', 'artist', 'cea4b00e-cabe-48a8-9e1b-13b72a92d10a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'es'), '43f7e3f6-2352-4c08-926e-7e06847fdc9c', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'es'), '5e7688fb-a3d6-44e1-a1d5-12186f99525d', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'es'), '6d61da33-2963-45c7-8723-2ccd68ca61fb', 'artist', 'e566c763-02c1-4f96-8a82-edbba9fc0bb2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'es'), '8a6dba59-8e6b-40ba-a844-f1042b33f072', 'artist', '71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'es'), 'caa083dd-74a8-47a5-8a06-3f98880211fa', 'artist', 'f57eb2e7-9ca7-463d-baee-8b3ea1800e6b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-mayor-clasico') AND locale = 'es'), 'f57afabb-2435-4965-ab7c-210f139f7893', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

COMMIT;
