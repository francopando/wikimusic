BEGIN;

-- Reverts 20260906006200_rewrite_luys_bien_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

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
       bio_en = 'Luys Bien, born Luis Bienvenido Gómez Luciano, is a Dominican singer, songwriter and guitarist from Loma de Cabrera, on the Haitian border in Dajabón. He works across merengue, bachata, bolero and salsa, and almost everything he sings started as somebody’s poem.

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
       bio_es = 'Luys Bien, de nombre Luis Bienvenido Gómez Luciano, es cantante, compositor y guitarrista dominicano de Loma de Cabrera, en la frontera con Haití, en Dajabón. Trabaja el merengue, la bachata, el bolero y la salsa, y casi todo lo que canta empezó siendo el poema de alguien.

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
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luys Bien, born Luis Bienvenido Gómez Luciano, is a Dominican singer, songwriter and guitarist from Loma de Cabrera, on the Haitian border in Dajabón. He works across merengue, bachata, bolero and salsa, and almost everything he sings started as somebody’s poem.","type":"text"}]},{"type":"paragraph","content":[{"text":"Firme Albor","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He debuted in December 2020 with an EP of five songs whose lyrics were all written by Cristino Gómez, a poet from the same border town. The record follows one man from solitude and sad verse into the love he had been imagining, which is a bolero plot given to a set of Dominican rhythms.","type":"text"}]},{"type":"paragraph","content":[{"text":"Songwriting partnerships between a singer and a poet are rare in Dominican popular music. What is rarer is that both of them are from a town of a few thousand people three hours from the capital, and that the work travelled anyway.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ramón Orlando arranged it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In December 2021 he released Mujer Amiga, a merengue arranged and produced by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"9b9097eb-64ba-4bfe-81fa-45b6420cc89e"}},{"text":". Getting an arrangement from him is a form of endorsement in Dominican music: he is the arranger the rest of the field measures itself against.","type":"text"}]},{"type":"paragraph","content":[{"text":"The two of them recorded Latidos de Tambor together the following year, this time with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"eba4e542-5803-48fc-ad50-ae9ab7b8f7d8"}},{"text":" credited as a performer rather than only behind the board.","type":"text"}]},{"type":"paragraph","content":[{"text":"A bachata from Taiwan","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Also in 2021 he adapted Ho Hay Yan, a song by the Taiwanese singer Suming, into bachata, and released it in Spanish and in Chinese. Two other singles of his exist in Taiwanese and Chinese versions as well.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican music has absorbed foreign songs for a century, but almost always from Spanish-language or English-language sources. A bachata built on an indigenous Taiwanese song, sung in two languages, is not something anyone else has done.","type":"text"}]},{"type":"paragraph","content":[{"text":"The pambiche and after","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Déjame Nacer is a lullaby set to pambiche — the slow, dragged merengue of the north coast, the rhythm Dominicans claim was invented to accommodate American marines who could not dance the fast one. Using it for a cradle song is a good joke and a good idea at once.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nos Queremos Tanto came in 2022, Regresar Para Qué in 2023, Cuando Ya Dolía in 2024 and Motivo de Tu Fe in 2025. The releases are unhurried and the catalogue is small, which for a singer building on poetry rather than on a hook is the expected shape.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'luys-bien'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luys Bien, de nombre Luis Bienvenido Gómez Luciano, es cantante, compositor y guitarrista dominicano de Loma de Cabrera, en la frontera con Haití, en Dajabón. Trabaja el merengue, la bachata, el bolero y la salsa, y casi todo lo que canta empezó siendo el poema de alguien.","type":"text"}]},{"type":"paragraph","content":[{"text":"Firme Albor","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Debutó en diciembre de 2020 con un EP de cinco canciones cuyas letras escribió todas Cristino Gómez, poeta del mismo pueblo fronterizo. El disco sigue a un hombre desde la soledad y el verso triste hasta el amor que venía imaginando, que es una trama de bolero puesta sobre un juego de ritmos dominicanos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las sociedades de escritura entre un cantante y un poeta son raras en la música popular dominicana. Más raro todavía es que los dos sean de un pueblo de unos pocos miles de habitantes a tres horas de la capital, y que el trabajo haya viajado igual.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se lo arregló Ramón Orlando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En diciembre de 2021 sacó Mujer Amiga, un merengue arreglado y producido por ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"7c1dbead-3aef-4a5a-a664-1de8e8faf840"}},{"text":". Conseguirle un arreglo a él es una forma de aval en la música dominicana: es el arreglista contra el que se mide el resto del campo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Al año siguiente grabaron juntos Latidos de Tambor, esta vez con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"c5dbd355-2604-4e2f-abed-e6ee33a616c6"}},{"text":" acreditado como intérprete y no solo detrás de la consola.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una bachata de Taiwán","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"También en 2021 adaptó Ho Hay Yan, una canción del cantante taiwanés Suming, a bachata, y la publicó en español y en chino. Otros dos sencillos suyos existen además en versiones en taiwanés y en chino.","type":"text"}]},{"type":"paragraph","content":[{"text":"La música dominicana lleva un siglo absorbiendo canciones ajenas, pero casi siempre de fuentes en español o en inglés. Una bachata montada sobre una canción indígena taiwanesa, cantada en dos idiomas, no la ha hecho nadie más.","type":"text"}]},{"type":"paragraph","content":[{"text":"El pambiche y lo que sigue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Déjame Nacer es una canción de cuna puesta en pambiche: el merengue lento y arrastrado de la costa norte, el ritmo que los dominicanos cuentan que se inventó para acomodar a unos marines estadounidenses que no podían con el rápido. Usarlo para arrullar es un buen chiste y una buena idea a la vez.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nos Queremos Tanto salió en 2022, Regresar Para Qué en 2023, Cuando Ya Dolía en 2024 y Motivo de Tu Fe en 2025. Los lanzamientos van sin apuro y el catálogo es corto, que para un cantante que construye sobre poesía y no sobre un gancho es la forma esperada.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'luys-bien'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'en'), '9b9097eb-64ba-4bfe-81fa-45b6420cc89e', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'en'), 'eba4e542-5803-48fc-ad50-ae9ab7b8f7d8', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'es'), '7c1dbead-3aef-4a5a-a664-1de8e8faf840', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luys-bien') AND locale = 'es'), 'c5dbd355-2604-4e2f-abed-e6ee33a616c6', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

COMMIT;
