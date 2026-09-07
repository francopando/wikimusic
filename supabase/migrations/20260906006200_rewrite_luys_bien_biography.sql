BEGIN;

-- Rewrite the catalogue entry for Luys Bien.
--
-- Luys Bien. Filler in English, nothing in Spanish -- on an artist who has an
-- English Wikipedia article, a Wikidata item, an ISNI, and a bachata built on a
-- Taiwanese indigenous song. The row was already unusually complete: the legal
-- name Luis Bienvenido Gómez Luciano, the province Dajabón, the town Loma de
-- Cabrera, the aliases and four of the genres were all correct. What was
-- missing was the entry.
--
-- NOTHING IN THE ROW IS OVERWRITTEN. occupations songwriter and musician stay
-- as stored; producer is added, because Wikipedia's categories file him as a
-- Latin music record producer. The genres bachata, salsa, merengue-pambiche and
-- bolero stay -- and merengue-pambiche was checked against the genres table
-- before being left alone, because it is not used as anybody's primary_genre
-- and looked at first glance like a stray value. It is a real slug in the
-- taxonomy.
--
-- NO DATE OF BIRTH. Nothing found gives one -- not Wikipedia, not Wikidata, not
-- any of the eight Dominican outlets cited there, not his own accounts. The
-- audit will keep flagging the row for it and should.
--
-- SOURCES: English Wikipedia, which is unusually well cited for an artist this
-- size and is the spine here: the December 2020 debut EP Firme Albor with five
-- songs written by the poet Cristino Gómez, the December 2021 merengue Mujer
-- Amiga arranged and produced by Ramón Orlando, the 2021 bachata adaptation of
-- the Taiwanese song Ho Hay Yan by Suming, Aún Te Amo, the pambiche lullaby
-- Déjame Nacer, Nos Queremos Tanto in 2022, Latidos de Tambor with Ramón
-- Orlando the same year, and the singles Regresar Para Qué (2023), Cuando Ya
-- Dolía (2024) and Motivo de Tu Fe (2025). Behind it: Bohío News and Al Paso de
-- los Famosos, December 2021; El Nuevo Diario, December 2021, and El Jaya,
-- January 2022, on Mujer Amiga; Listín Diario, August and October 2022, on Nos
-- Queremos Tanto and on Latidos de Tambor; El Caribe, October 2022; Diario
-- Libre, June 2023, on Regresar Para Qué; En Tacones TV's interview, November
-- 2022. Cristino Gómez's own blog, which gives his birth in Loma de Cabrera in
-- 1987 and lists the songs made from his verse. MusicBrainz for the release
-- dates and for the Chinese-language editions of three of the singles.
--
-- A CORRECTION TO THE FIRST VERSION OF THIS ENTRY. It said Cristino Gómez had
-- no entry in the catalogue and put him on the missing-artists list. He does
-- have one, published, with a real biography: cristino-gomez, the poet from
-- Loma de Cabrera born in 1987, filed as a composer. The claim was made without
-- checking, which is the same failure as the deferred entries earlier today. He
-- is linked here now, in both languages and in both places his name appears.
--
-- NOT LINKED: Suming is Taiwanese.
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
       name = 'Luys Bien',
       sort_name = 'Gómez Luciano, Luis Bienvenido',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Loma de Cabrera',
       province = 'Dajabón',
       first_name = 'Luis',
       middle_name = 'Bienvenido',
       last_name = 'Gómez',
       second_last_name = 'Luciano',
       stage_name = 'Luys Bien',
       aliases = ARRAY['Luis Bienvenido Gómez Luciano', 'Luis Bienvenido Gómez', 'Luis Gómez']::text[],
       occupations = '["songwriter","musician","producer"]'::jsonb,
       instruments = ARRAY['guitar']::text[],
       genres = ARRAY['bachata', 'salsa', 'merengue-pambiche', 'bolero']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@LuysBien',
       facebook = 'LuysBien',
       instagram = 'luysbien',
       disambiguation = 'Singer from Loma de Cabrera who sets Cristino Gómez’s poetry to merengue and bachata',
       bio_en = 'Luys Bien, born Luis Bienvenido Gómez Luciano, is a Dominican singer, songwriter and guitarist from Loma de Cabrera, on the Haitian border in Dajabón. He works across merengue, bachata, bolero and salsa, and almost everything he sings started as a poem by Cristino Gómez.

**Firme Albor**

He debuted in December 2020 with an EP of five songs whose lyrics were all written by Cristino Gómez, a poet from the same border town. The record follows one man from solitude and sad verse into the love he had been imagining, which is a bolero plot given to a set of Dominican rhythms.

Songwriting partnerships between a singer and a poet are rare in Dominican popular music. What is rarer is that both of them are from a town of a few thousand people three hours from the capital, and that the work travelled anyway.

**Ramón Orlando arranged it**

In December 2021 he released Mujer Amiga, a merengue arranged and produced by Ramón Orlando. Getting an arrangement from him is a form of endorsement in Dominican music: he is the arranger the rest of the field measures itself against.

The two of them recorded Latidos de Tambor together the following year, this time with Ramón Orlando credited as a performer rather than only behind the board.

**A bachata from Taiwan**

Also in 2021 he adapted Ho Hay Yan, a song by the Taiwanese singer Suming, into bachata, and released it in Spanish and in Chinese. Two other singles of his exist in Taiwanese and Chinese versions as well.

Dominican music has absorbed foreign songs for a century, but almost always from Spanish-language or English-language sources. A bachata built on an indigenous Taiwanese song, sung in two languages, is not something anyone else has done.

**The pambiche and after**

Déjame Nacer is a lullaby set to pambiche — the slow, dragged merengue of the north coast, the rhythm Dominicans claim was invented to accommodate American marines who could not dance the fast one. Using it for a cradle song is a good joke and a good idea at once.

Nos Queremos Tanto came in 2022, Regresar Para Qué in 2023, Cuando Ya Dolía in 2024 and Motivo de Tu Fe in 2025. The releases are unhurried and the catalogue is small, which for a singer building on poetry rather than on a hook is the expected shape.',
       bio_es = 'Luys Bien, de nombre Luis Bienvenido Gómez Luciano, es cantante, compositor y guitarrista dominicano de Loma de Cabrera, en la frontera con Haití, en Dajabón. Trabaja el merengue, la bachata, el bolero y la salsa, y casi todo lo que canta empezó siendo un poema de Cristino Gómez.

**Firme Albor**

Debutó en diciembre de 2020 con un EP de cinco canciones cuyas letras escribió todas Cristino Gómez, poeta del mismo pueblo fronterizo. El disco sigue a un hombre desde la soledad y el verso triste hasta el amor que venía imaginando, que es una trama de bolero puesta sobre un juego de ritmos dominicanos.

Las sociedades de escritura entre un cantante y un poeta son raras en la música popular dominicana. Más raro todavía es que los dos sean de un pueblo de unos pocos miles de habitantes a tres horas de la capital, y que el trabajo haya viajado igual.

**Se lo arregló Ramón Orlando**

En diciembre de 2021 sacó Mujer Amiga, un merengue arreglado y producido por Ramón Orlando. Conseguirle un arreglo a él es una forma de aval en la música dominicana: es el arreglista contra el que se mide el resto del campo.

Al año siguiente grabaron juntos Latidos de Tambor, esta vez con Ramón Orlando acreditado como intérprete y no solo detrás de la consola.

**Una bachata de Taiwán**

También en 2021 adaptó Ho Hay Yan, una canción del cantante taiwanés Suming, a bachata, y la publicó en español y en chino. Otros dos sencillos suyos existen además en versiones en taiwanés y en chino.

La música dominicana lleva un siglo absorbiendo canciones ajenas, pero casi siempre de fuentes en español o en inglés. Una bachata montada sobre una canción indígena taiwanesa, cantada en dos idiomas, no la ha hecho nadie más.

**El pambiche y lo que sigue**

Déjame Nacer es una canción de cuna puesta en pambiche: el merengue lento y arrastrado de la costa norte, el ritmo que los dominicanos cuentan que se inventó para acomodar a unos marines estadounidenses que no podían con el rápido. Usarlo para arrullar es un buen chiste y una buena idea a la vez.

Nos Queremos Tanto salió en 2022, Regresar Para Qué en 2023, Cuando Ya Dolía en 2024 y Motivo de Tu Fe en 2025. Los lanzamientos van sin apuro y el catálogo es corto, que para un cantante que construye sobre poesía y no sobre un gancho es la forma esperada.',
       updated_at = now()
 WHERE slug = 'luys-bien';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luys Bien, born Luis Bienvenido Gómez Luciano, is a Dominican singer, songwriter and guitarist from Loma de Cabrera, on the Haitian border in Dajabón. He works across merengue, bachata, bolero and salsa, and almost everything he sings started as a poem by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e2ab03da-ab02-4f75-bf88-aeeaf349eb77","displayText":"Cristino Gómez","occurrenceId":"f754e96e-18f2-4459-adfd-032a131c212b"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Firme Albor","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He debuted in December 2020 with an EP of five songs whose lyrics were all written by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e2ab03da-ab02-4f75-bf88-aeeaf349eb77","displayText":"Cristino Gómez","occurrenceId":"72ba94b6-7a26-49a9-9e66-49f26be03260"}},{"text":", a poet from the same border town. The record follows one man from solitude and sad verse into the love he had been imagining, which is a bolero plot given to a set of Dominican rhythms.","type":"text"}]},{"type":"paragraph","content":[{"text":"Songwriting partnerships between a singer and a poet are rare in Dominican popular music. What is rarer is that both of them are from a town of a few thousand people three hours from the capital, and that the work travelled anyway.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ramón Orlando arranged it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In December 2021 he released Mujer Amiga, a merengue arranged and produced by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"26a76938-7cc8-4cab-9a3f-49e353f56408"}},{"text":". Getting an arrangement from him is a form of endorsement in Dominican music: he is the arranger the rest of the field measures itself against.","type":"text"}]},{"type":"paragraph","content":[{"text":"The two of them recorded Latidos de Tambor together the following year, this time with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"1fa99891-f26c-44ed-9e00-b0c8bab7b838"}},{"text":" credited as a performer rather than only behind the board.","type":"text"}]},{"type":"paragraph","content":[{"text":"A bachata from Taiwan","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Also in 2021 he adapted Ho Hay Yan, a song by the Taiwanese singer Suming, into bachata, and released it in Spanish and in Chinese. Two other singles of his exist in Taiwanese and Chinese versions as well.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican music has absorbed foreign songs for a century, but almost always from Spanish-language or English-language sources. A bachata built on an indigenous Taiwanese song, sung in two languages, is not something anyone else has done.","type":"text"}]},{"type":"paragraph","content":[{"text":"The pambiche and after","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Déjame Nacer is a lullaby set to pambiche — the slow, dragged merengue of the north coast, the rhythm Dominicans claim was invented to accommodate American marines who could not dance the fast one. Using it for a cradle song is a good joke and a good idea at once.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nos Queremos Tanto came in 2022, Regresar Para Qué in 2023, Cuando Ya Dolía in 2024 and Motivo de Tu Fe in 2025. The releases are unhurried and the catalogue is small, which for a singer building on poetry rather than on a hook is the expected shape.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'luys-bien'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luys Bien, de nombre Luis Bienvenido Gómez Luciano, es cantante, compositor y guitarrista dominicano de Loma de Cabrera, en la frontera con Haití, en Dajabón. Trabaja el merengue, la bachata, el bolero y la salsa, y casi todo lo que canta empezó siendo un poema de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e2ab03da-ab02-4f75-bf88-aeeaf349eb77","displayText":"Cristino Gómez","occurrenceId":"f0490ff8-7eec-4b2d-a356-e1c6f74ec472"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Firme Albor","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Debutó en diciembre de 2020 con un EP de cinco canciones cuyas letras escribió todas ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e2ab03da-ab02-4f75-bf88-aeeaf349eb77","displayText":"Cristino Gómez","occurrenceId":"5f4b5f9e-6df4-4626-b2fd-0db370f1ec7b"}},{"text":", poeta del mismo pueblo fronterizo. El disco sigue a un hombre desde la soledad y el verso triste hasta el amor que venía imaginando, que es una trama de bolero puesta sobre un juego de ritmos dominicanos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las sociedades de escritura entre un cantante y un poeta son raras en la música popular dominicana. Más raro todavía es que los dos sean de un pueblo de unos pocos miles de habitantes a tres horas de la capital, y que el trabajo haya viajado igual.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se lo arregló Ramón Orlando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En diciembre de 2021 sacó Mujer Amiga, un merengue arreglado y producido por ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"49028c5b-fb9e-4731-87d8-9268e2b83a7d"}},{"text":". Conseguirle un arreglo a él es una forma de aval en la música dominicana: es el arreglista contra el que se mide el resto del campo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Al año siguiente grabaron juntos Latidos de Tambor, esta vez con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"753529f0-4da8-4056-8ea6-ac19ce7f3363"}},{"text":" acreditado como intérprete y no solo detrás de la consola.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una bachata de Taiwán","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"También en 2021 adaptó Ho Hay Yan, una canción del cantante taiwanés Suming, a bachata, y la publicó en español y en chino. Otros dos sencillos suyos existen además en versiones en taiwanés y en chino.","type":"text"}]},{"type":"paragraph","content":[{"text":"La música dominicana lleva un siglo absorbiendo canciones ajenas, pero casi siempre de fuentes en español o en inglés. Una bachata montada sobre una canción indígena taiwanesa, cantada en dos idiomas, no la ha hecho nadie más.","type":"text"}]},{"type":"paragraph","content":[{"text":"El pambiche y lo que sigue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Déjame Nacer es una canción de cuna puesta en pambiche: el merengue lento y arrastrado de la costa norte, el ritmo que los dominicanos cuentan que se inventó para acomodar a unos marines estadounidenses que no podían con el rápido. Usarlo para arrullar es un buen chiste y una buena idea a la vez.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nos Queremos Tanto salió en 2022, Regresar Para Qué en 2023, Cuando Ya Dolía en 2024 y Motivo de Tu Fe en 2025. Los lanzamientos van sin apuro y el catálogo es corto, que para un cantante que construye sobre poesía y no sobre un gancho es la forma esperada.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'luys-bien'), 2)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'en'), '1fa99891-f26c-44ed-9e00-b0c8bab7b838', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'en'), '26a76938-7cc8-4cab-9a3f-49e353f56408', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'en'), '72ba94b6-7a26-49a9-9e66-49f26be03260', 'artist', 'e2ab03da-ab02-4f75-bf88-aeeaf349eb77');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'en'), 'f754e96e-18f2-4459-adfd-032a131c212b', 'artist', 'e2ab03da-ab02-4f75-bf88-aeeaf349eb77');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'es'), '49028c5b-fb9e-4731-87d8-9268e2b83a7d', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'es'), '5f4b5f9e-6df4-4626-b2fd-0db370f1ec7b', 'artist', 'e2ab03da-ab02-4f75-bf88-aeeaf349eb77');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'es'), '753529f0-4da8-4056-8ea6-ac19ce7f3363', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'es'), 'f0490ff8-7eec-4b2d-a356-e1c6f74ec472', 'artist', 'e2ab03da-ab02-4f75-bf88-aeeaf349eb77');

COMMIT;
