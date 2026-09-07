BEGIN;

-- Rewrite the catalogue entry for Crispín Fernández.
--
-- Crispín Fernández. Rewrite. The entry that was here was machine-written -- an
-- infobox in prose, with sections called "Instruments" and "Associated acts" and
-- a bulleted list of style attributes -- and it had the English and Spanish
-- documents on the wrong locales, corrected earlier in 20260906011200. This
-- replaces it with an entry built from sources.
--
-- THE MACHINE TEXT WAS NOT JUST BADLY FORMATTED, IT WAS WRONG IN PLACES, and
-- that is the argument for rewriting rather than reformatting:
--
--   - it named his flute teacher in New York as "Henry Stonier, a student of
--     Georges Barrère". Two independent sources -- Juan Colón's essay and Bono
--     Cimarrón -- both say "el profesor ruso Henry Lotzni". Neither name is
--     verifiable beyond those, so the entry says he studied flute in New York
--     without naming the teacher.
--   - it put him in the Orquesta Sinfónica Nacional "in the mid-1980s". Bono
--     Cimarrón's chronology gives 1980-1982.
--   - it had him travelling to New York in 1968 with Johnny Ventura's orchestra
--     and staying from 1969. The chronology that exists gives his New York study
--     years as 1974 to 1978. The entry does not date the move.
--
-- None of those three claims appears here. Where the sources agree they are used;
-- where they do not, the entry says less.
--
-- THE ONE FACT THAT DESERVED TO LEAD AND WAS NOT IN THE OLD TEXT AT ALL: he
-- forced up the price of a recording session. Juan Colón, a saxophonist and the
-- author of the standard method on the merengue jaleo, writes that Crispín was
-- thrown out of studios more than once over it, that they kept calling him back
-- because nobody else could do the work, and that other musicians followed him
-- once he had made the point. A session player who raises the rate for everyone
-- is the kind of thing the credits never record, and this catalogue records
-- authorship and payment disputes on purpose.
--
-- THE THREE METHOD BOOKS ARE NEW HERE TOO. Saxofón Latinoamericano's
-- bibliography lists three by him -- Jaleos de Merengue, Melodías de Merengue
-- and Jaleos Típicos del Merengue Dominicano -- filed beside Paquito D'Rivera's
-- memoir and Juan Colón's technique book. Colón's essay, written in 2010, says
-- two; the third came after. He notated the jaleo, which had been an oral form.
--
-- THE 80 PER CENT FIGURE IS ATTRIBUTED, NOT ASSERTED. Colón writes that Crispín
-- is responsible for eighty per cent of all the merengue recorded between 1981
-- and 2002. A saxophonist commenting on Instagram makes the same estimate for
-- Crispín, Papo Cadena and Luisín between them. It is one expert's estimate and
-- the prose says so.
--
-- FILLED: sort_name and stage_name, both null; the four name fields, all null,
-- from Fernández Minaya; aliases El Rey del Jaleo, which is the heading Colón
-- gives him; occupations bandleader and music educator; genres; instruments
-- flute beside the saxophone already stored; disambiguation.
--
-- LEFT ALONE AND CONFIRMED: date_of_birth 1946-01-20, province Monte Cristi and
-- birth_place Villa Vásquez -- Saxofón Latinoamericano, Bono Cimarrón, Juan
-- Colón's essay and a widely reposted birthday biography all give the same date
-- and town. primary_role musician, primary_genre merengue, and the legend tag
-- all stay.
--
-- NOT WRITTEN: his parents are named in one source and are not repeated here.
-- No numbers beyond the ones that are the point.
--
-- SOURCES: Juan Colón's essay on the Mao en el Corazón blog, 19 August 2010 --
-- a signed piece by a peer who wrote the standard jaleo method, and the single
-- best source on him. Bono Cimarrón, 20 January 2012, for the chronology, the
-- teaching posts and the Licuado track list. Saxofón Latinoamericano's
-- bibliography, for the three method books. Spotify and Apple Music for Licuado
-- Vol. I and Vol. III. A birthday biography circulated by República Merengue in
-- 2026, which confirms he is alive and working. Junior Cabrera's two-hour
-- interview of April 2026. Listings for the Faro Jazz Festival and Noches de
-- Jazz en la Zona.
--
-- NOT LINKED, AND ONE OF THESE IS A SERIOUS GAP. TAVITO VÁSQUEZ HAS NO ENTRY.
-- He was Crispín's mentor in the police band, he is the first name in every list
-- of merengue saxophonists, and Juan Colón published sixty transcriptions of his
-- solos. Checked carefully: the catalogue holds an "Antonio Vásquez", which is
-- Tavito's legal name -- but that row is a bachata SINGER, status needs_review,
-- with no data at all. Different person. Not linked, and Tavito goes to the top
-- of the missing list. Papa Molina and Sócrates de León "Choco" have no entries
-- either. Mario Bauzá, Tito Puente, Machito and Charlie Palmieri are Cuban or
-- Puerto Rican; Javier Valerio and Pablo Sandi are Costa Rican.
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
       name = 'Crispín Fernández',
       sort_name = 'Fernández Minaya, Crispín',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'musician',
       primary_genre = 'merengue',
       date_of_birth = '1946-01-20',
       birth_year = 1946,
       date_of_death = NULL,
       birth_place = 'Villa Vásquez',
       province = 'Monte Cristi',
       first_name = 'Crispín',
       middle_name = NULL,
       last_name = 'Fernández',
       second_last_name = 'Minaya',
       stage_name = 'Crispín Fernández',
       aliases = ARRAY['El Rey del Jaleo']::text[],
       occupations = '["bandleader","music educator"]'::jsonb,
       instruments = ARRAY['saxophone', 'flute']::text[],
       genres = ARRAY['jazz', 'fusion', 'instrumental-classical']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Saxophonist and flautist; the studio saxophone of Dominican merengue',
       bio_en = 'Crispín Fernández, born Crispín Fernández Minaya in Villa Vásquez, is a Dominican saxophonist, flautist, bandleader and teacher. If you have heard a merengue recorded in the two decades either side of 1990, you have almost certainly heard him, and the sleeve almost certainly did not say so.

**The jaleo**

A jaleo is the saxophone figure that runs under a merengue — the fast, repeating, interlocking line that makes the rhythm move. It sounds like the easiest thing in the music and it is one of the hardest to record: it has to be clean at speed, exactly in time, and it has to swing, and a fraction out in any of those three and the whole track sags.

He is the man other saxophonists were told to sound like. Producers of that era would turn down a player who could not do it his way. Among Dominican musicians the phrase for him is the king of the jaleo, and it is not a promotional line — it comes from other saxophonists.

The lineage he belongs to is small. Félix del Rosario led a band and Tavito Vásquez was the great soloist; Sócrates de León is the other name always in the list. Crispín is the one who defined how the instrument sounds on a record rather than on a stage.

**Learning it**

He started at eight at the music academy in his own town and moved to the capital at fifteen. He was an attached musician of the National Police band, and it was there that Tavito Vásquez took him on — the mentorship that every account of him begins with.

New York came later, and he treated it as school. He studied flute with a Russian teacher, and harmony and saxophone technique with Mario Rivera, the Dominican who had gone furthest into jazz. He worked around Mario Bauzá and Tito Puente, which is where a Caribbean horn player of that generation learned what a big band actually demands.

Between 1980 and 1982 he played flute and piccolo in the Orquesta Sinfónica Nacional. A merengue session player holding a symphony chair is not a normal career, and it explains the thing musicians always mention first about him, which is the tone.

**The studio years**

When merengue turned romantic and the studios filled up, he became the fastest reliable way to get a horn line on tape. He played on early records by Juan Luis Guerra 4.40, Alex Bueno, Sergio Vargas and Ramón Orlando. He had already worked with Johnny Ventura, with Conjunto Quisqueya and with Primitivo Santos y su Orquesta, and later with Pochy y su Cocoband.

Juan Colón — a saxophonist who wrote the standard method on the jaleo — estimates that Crispín is responsible for eighty per cent of all the merengue recorded between 1981 and 2002. It is one expert’s figure and impossible to audit, and nobody in the business disputes the order of magnitude.

**Raising the rate**

The part of this that belongs in a record of Dominican music has nothing to do with how he plays. He pushed, alone, for what a session was worth. He was thrown out of studios over it more than once, and each time they came back for him, because there was nobody else who could do the work at that standard.

He got the price up. Other musicians then asked for the same, and got it. A recording session is a wage, the wage was set by whoever would take it, and one player refusing to take it moved the floor for everybody who came after.

**Writing it down**

The jaleo was an oral form: you learned it from records and from the man next to you. He wrote three method books — Jaleos de Merengue, Melodías de Merengue and Jaleos Típicos del Merengue Dominicano — which put it on paper for instruments in different keys, so a student anywhere can work at it without a Dominican in the room.

He has taught at the Conservatorio Nacional de Música and directed its department of folk and popular music, taught in New York and in Santiago, and run instrument workshops around the country.

**Licuado**

His own group is called Licuado — blended — and it does what the name says with merengue, jazz and the classical technique. Three volumes exist, and the third includes a tribute to Antony Santos recorded twice, once as a bachata and once as a son montuno, which is a fairly precise statement of what the group is for.

He is a founding member of the Santo Domingo Jazz Big Band and still plays the festivals. Sixty years in, he is one of the few Dominican musicians whose reputation rests entirely on what other musicians say about him.',
       bio_es = 'Crispín Fernández, de nombre Crispín Fernández Minaya, nacido en Villa Vásquez, es saxofonista, flautista, director y maestro dominicano. Si alguien ha oído un merengue grabado en las dos décadas alrededor de 1990, casi con seguridad lo ha oído a él, y casi con seguridad la carátula no lo decía.

**El jaleo**

El jaleo es la figura de saxofón que corre por debajo de un merengue: la línea rápida, repetida y engranada que hace mover el ritmo. Suena a lo más fácil de la música y es de lo más difícil de grabar: tiene que estar limpia a velocidad, exacta en el tiempo, y tiene que tener swing; falla una fracción en cualquiera de las tres y el tema entero se cae.

Él es el hombre al que a los demás saxofonistas les mandaban a parecerse. Los productores de esa época rechazaban al que no pudiera hacerlo a su manera. Entre los músicos dominicanos se le dice el rey del jaleo, y no es una frase de promoción: viene de otros saxofonistas.

La estirpe a la que pertenece es corta. Félix del Rosario dirigía una banda y Tavito Vásquez era el gran solista; Sócrates de León es el otro nombre que siempre está en la lista. Crispín es el que definió cómo suena el instrumento en un disco y no en una tarima.

**Aprenderlo**

Empezó a los ocho años en la academia de música de su propio pueblo y se fue a la capital a los quince. Fue músico asimilado de la Banda de la Policía Nacional, y fue ahí donde Tavito Vásquez lo tomó bajo su ala: la tutoría con la que empieza todo relato sobre él.

Nueva York vino después, y él la trató como una escuela. Estudió flauta con un profesor ruso, y armonía y técnica del saxofón con Mario Rivera, el dominicano que más lejos había llegado dentro del jazz. Anduvo alrededor de Mario Bauzá y de Tito Puente, que es donde un metal caribeño de esa generación aprendía lo que de verdad exige una big band.

Entre 1980 y 1982 tocó flauta y flautín en la Orquesta Sinfónica Nacional. Un músico de sesión de merengue ocupando una silla de sinfónica no es una carrera normal, y explica lo primero que los músicos mencionan siempre de él, que es el sonido.

**Los años de estudio**

Cuando el merengue se puso romántico y los estudios se llenaron, él se volvió la manera más rápida y segura de dejar una línea de metal grabada. Tocó en discos tempranos de Juan Luis Guerra 4.40, Alex Bueno, Sergio Vargas y Ramón Orlando. Ya había trabajado con Johnny Ventura, con Conjunto Quisqueya y con Primitivo Santos y su Orquesta, y después con Pochy y su Cocoband.

Juan Colón —saxofonista y autor del método de referencia sobre el jaleo— calcula que Crispín es responsable del ochenta por ciento de todo el merengue grabado entre 1981 y 2002. Es la cifra de un experto, imposible de auditar, y en el gremio nadie discute el orden de magnitud.

**Subir la tarifa**

La parte de esto que pertenece al registro de la música dominicana no tiene nada que ver con cómo toca. Él peleó, solo, por lo que valía una sesión. Lo sacaron de estudios por eso más de una vez, y cada vez volvieron a buscarlo, porque no había nadie más capaz de hacer el trabajo a ese nivel.

Logró subir el precio. Después otros músicos pidieron lo mismo y lo consiguieron. Una sesión de grabación es un salario, ese salario lo fijaba quien estuviera dispuesto a aceptarlo, y un solo músico negándose a aceptarlo movió el piso para todos los que vinieron detrás.

**Ponerlo en papel**

El jaleo era una forma oral: se aprendía de los discos y del que estaba al lado. Él escribió tres métodos —Jaleos de Merengue, Melodías de Merengue y Jaleos Típicos del Merengue Dominicano— que lo ponen sobre el papel para instrumentos en distintas claves, de modo que un estudiante en cualquier parte pueda trabajarlo sin un dominicano en el cuarto.

Ha dado clases en el Conservatorio Nacional de Música y dirigido su departamento de música folclórica y popular, ha enseñado en Nueva York y en Santiago, y ha dado talleres de instrumento por todo el país.

**Licuado**

Su propio grupo se llama Licuado, y hace lo que dice el nombre con el merengue, el jazz y la técnica clásica. Existen tres volúmenes, y el tercero incluye un tributo a Antony Santos grabado dos veces, una en bachata y otra en son montuno, que es una declaración bastante precisa de para qué existe el grupo.

Es miembro fundador de la Santo Domingo Jazz Big Band y sigue tocando los festivales. A los sesenta años de carrera, es de los pocos músicos dominicanos cuya reputación descansa por completo en lo que dicen de él otros músicos.',
       updated_at = now()
 WHERE slug = 'crispin-fernandez';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Crispín Fernández, born Crispín Fernández Minaya in Villa Vásquez, is a Dominican saxophonist, flautist, bandleader and teacher. If you have heard a merengue recorded in the two decades either side of 1990, you have almost certainly heard him, and the sleeve almost certainly did not say so.","type":"text"}]},{"type":"paragraph","content":[{"text":"The jaleo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A jaleo is the saxophone figure that runs under a merengue — the fast, repeating, interlocking line that makes the rhythm move. It sounds like the easiest thing in the music and it is one of the hardest to record: it has to be clean at speed, exactly in time, and it has to swing, and a fraction out in any of those three and the whole track sags.","type":"text"}]},{"type":"paragraph","content":[{"text":"He is the man other saxophonists were told to sound like. Producers of that era would turn down a player who could not do it his way. Among Dominican musicians the phrase for him is the king of the jaleo, and it is not a promotional line — it comes from other saxophonists.","type":"text"}]},{"type":"paragraph","content":[{"text":"The lineage he belongs to is small. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8fc78100-e51e-48a8-91e9-3007f4c67ec0","displayText":"Félix del Rosario","occurrenceId":"33594836-0207-4d51-b2ec-56e559e470c6"}},{"text":" led a band and Tavito Vásquez was the great soloist; Sócrates de León is the other name always in the list. Crispín is the one who defined how the instrument sounds on a record rather than on a stage.","type":"text"}]},{"type":"paragraph","content":[{"text":"Learning it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He started at eight at the music academy in his own town and moved to the capital at fifteen. He was an attached musician of the National Police band, and it was there that Tavito Vásquez took him on — the mentorship that every account of him begins with.","type":"text"}]},{"type":"paragraph","content":[{"text":"New York came later, and he treated it as school. He studied flute with a Russian teacher, and harmony and saxophone technique with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f0a5c773-b904-4feb-bf20-9d938bead0b1","displayText":"Mario Rivera","occurrenceId":"543e9a65-96dd-426f-b2ad-e0060c1aaa0e"}},{"text":", the Dominican who had gone furthest into jazz. He worked around Mario Bauzá and Tito Puente, which is where a Caribbean horn player of that generation learned what a big band actually demands.","type":"text"}]},{"type":"paragraph","content":[{"text":"Between 1980 and 1982 he played flute and piccolo in the Orquesta Sinfónica Nacional. A merengue session player holding a symphony chair is not a normal career, and it explains the thing musicians always mention first about him, which is the tone.","type":"text"}]},{"type":"paragraph","content":[{"text":"The studio years","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"When merengue turned romantic and the studios filled up, he became the fastest reliable way to get a horn line on tape. He played on early records by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"c6fa952c-5255-4d3e-910e-710c57e3e568"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6c3e0d74-23b7-4d80-969f-9d5319ee5127","displayText":"Alex Bueno","occurrenceId":"a7f37268-bffa-4602-8188-f60c1cba0392"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"6b9a8c87-01c6-4955-8c92-737219ce1995"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"f774678c-8581-467f-b8ed-d22b03e64013"}},{"text":". He had already worked with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"6ea88cc7-2d3f-4654-8fac-e3f3c70c1f59"}},{"text":", with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f8c6f3e7-ef42-428b-a610-31948f846600","displayText":"Conjunto Quisqueya","occurrenceId":"42690450-3566-4c12-8b71-952046498dc2"}},{"text":" and with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"dd7240e6-3c43-4e1b-b429-f08a58a1f271","displayText":"Primitivo Santos y su Orquesta","occurrenceId":"3c5193b5-590c-418a-ab84-c9b6f7c3e3dc"}},{"text":", and later with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"001831dd-3baa-4512-88f5-f420ec7c2619","displayText":"Pochy y su Cocoband","occurrenceId":"26ca8d09-1ba1-4085-9e7e-3d063d5ff9f6"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Juan Colón — a saxophonist who wrote the standard method on the jaleo — estimates that Crispín is responsible for eighty per cent of all the merengue recorded between 1981 and 2002. It is one expert’s figure and impossible to audit, and nobody in the business disputes the order of magnitude.","type":"text"}]},{"type":"paragraph","content":[{"text":"Raising the rate","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The part of this that belongs in a record of Dominican music has nothing to do with how he plays. He pushed, alone, for what a session was worth. He was thrown out of studios over it more than once, and each time they came back for him, because there was nobody else who could do the work at that standard.","type":"text"}]},{"type":"paragraph","content":[{"text":"He got the price up. Other musicians then asked for the same, and got it. A recording session is a wage, the wage was set by whoever would take it, and one player refusing to take it moved the floor for everybody who came after.","type":"text"}]},{"type":"paragraph","content":[{"text":"Writing it down","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The jaleo was an oral form: you learned it from records and from the man next to you. He wrote three method books — Jaleos de Merengue, Melodías de Merengue and Jaleos Típicos del Merengue Dominicano — which put it on paper for instruments in different keys, so a student anywhere can work at it without a Dominican in the room.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has taught at the Conservatorio Nacional de Música and directed its department of folk and popular music, taught in New York and in Santiago, and run instrument workshops around the country.","type":"text"}]},{"type":"paragraph","content":[{"text":"Licuado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His own group is called Licuado — blended — and it does what the name says with merengue, jazz and the classical technique. Three volumes exist, and the third includes a tribute to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"28a3745e-90d6-45cd-b8bd-798028f8deb8","displayText":"Antony Santos","occurrenceId":"abf462a2-1439-4596-9fe6-d69572957a88"}},{"text":" recorded twice, once as a bachata and once as a son montuno, which is a fairly precise statement of what the group is for.","type":"text"}]},{"type":"paragraph","content":[{"text":"He is a founding member of the Santo Domingo Jazz Big Band and still plays the festivals. Sixty years in, he is one of the few Dominican musicians whose reputation rests entirely on what other musicians say about him.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'crispin-fernandez'), 4)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Crispín Fernández, de nombre Crispín Fernández Minaya, nacido en Villa Vásquez, es saxofonista, flautista, director y maestro dominicano. Si alguien ha oído un merengue grabado en las dos décadas alrededor de 1990, casi con seguridad lo ha oído a él, y casi con seguridad la carátula no lo decía.","type":"text"}]},{"type":"paragraph","content":[{"text":"El jaleo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El jaleo es la figura de saxofón que corre por debajo de un merengue: la línea rápida, repetida y engranada que hace mover el ritmo. Suena a lo más fácil de la música y es de lo más difícil de grabar: tiene que estar limpia a velocidad, exacta en el tiempo, y tiene que tener swing; falla una fracción en cualquiera de las tres y el tema entero se cae.","type":"text"}]},{"type":"paragraph","content":[{"text":"Él es el hombre al que a los demás saxofonistas les mandaban a parecerse. Los productores de esa época rechazaban al que no pudiera hacerlo a su manera. Entre los músicos dominicanos se le dice el rey del jaleo, y no es una frase de promoción: viene de otros saxofonistas.","type":"text"}]},{"type":"paragraph","content":[{"text":"La estirpe a la que pertenece es corta. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8fc78100-e51e-48a8-91e9-3007f4c67ec0","displayText":"Félix del Rosario","occurrenceId":"90f5fc62-0310-4e54-8bcd-58fad5e9e3aa"}},{"text":" dirigía una banda y Tavito Vásquez era el gran solista; Sócrates de León es el otro nombre que siempre está en la lista. Crispín es el que definió cómo suena el instrumento en un disco y no en una tarima.","type":"text"}]},{"type":"paragraph","content":[{"text":"Aprenderlo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó a los ocho años en la academia de música de su propio pueblo y se fue a la capital a los quince. Fue músico asimilado de la Banda de la Policía Nacional, y fue ahí donde Tavito Vásquez lo tomó bajo su ala: la tutoría con la que empieza todo relato sobre él.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nueva York vino después, y él la trató como una escuela. Estudió flauta con un profesor ruso, y armonía y técnica del saxofón con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f0a5c773-b904-4feb-bf20-9d938bead0b1","displayText":"Mario Rivera","occurrenceId":"7510b05a-ddd3-4aa6-8f58-11e735fa10a0"}},{"text":", el dominicano que más lejos había llegado dentro del jazz. Anduvo alrededor de Mario Bauzá y de Tito Puente, que es donde un metal caribeño de esa generación aprendía lo que de verdad exige una big band.","type":"text"}]},{"type":"paragraph","content":[{"text":"Entre 1980 y 1982 tocó flauta y flautín en la Orquesta Sinfónica Nacional. Un músico de sesión de merengue ocupando una silla de sinfónica no es una carrera normal, y explica lo primero que los músicos mencionan siempre de él, que es el sonido.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los años de estudio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Cuando el merengue se puso romántico y los estudios se llenaron, él se volvió la manera más rápida y segura de dejar una línea de metal grabada. Tocó en discos tempranos de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"1d81953a-8f78-4f99-97d8-70504cdae39d"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6c3e0d74-23b7-4d80-969f-9d5319ee5127","displayText":"Alex Bueno","occurrenceId":"5e17ef0a-8768-413e-9e71-c8f10b229413"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"97e920d1-afc6-44d3-a042-1cf826b8c219"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"daea5883-2860-49eb-9cfa-1169361f171a"}},{"text":". Ya había trabajado con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"2531aef6-d2ed-4d80-9138-53469d643359"}},{"text":", con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f8c6f3e7-ef42-428b-a610-31948f846600","displayText":"Conjunto Quisqueya","occurrenceId":"c44572b8-fb67-413d-abfe-22f23f8cdc36"}},{"text":" y con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"dd7240e6-3c43-4e1b-b429-f08a58a1f271","displayText":"Primitivo Santos y su Orquesta","occurrenceId":"3d3dab8c-6c79-4595-8a6e-d6a22fd5666b"}},{"text":", y después con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"001831dd-3baa-4512-88f5-f420ec7c2619","displayText":"Pochy y su Cocoband","occurrenceId":"0ae4a1d1-b969-46f4-a5d1-39a26d5873fc"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Juan Colón —saxofonista y autor del método de referencia sobre el jaleo— calcula que Crispín es responsable del ochenta por ciento de todo el merengue grabado entre 1981 y 2002. Es la cifra de un experto, imposible de auditar, y en el gremio nadie discute el orden de magnitud.","type":"text"}]},{"type":"paragraph","content":[{"text":"Subir la tarifa","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La parte de esto que pertenece al registro de la música dominicana no tiene nada que ver con cómo toca. Él peleó, solo, por lo que valía una sesión. Lo sacaron de estudios por eso más de una vez, y cada vez volvieron a buscarlo, porque no había nadie más capaz de hacer el trabajo a ese nivel.","type":"text"}]},{"type":"paragraph","content":[{"text":"Logró subir el precio. Después otros músicos pidieron lo mismo y lo consiguieron. Una sesión de grabación es un salario, ese salario lo fijaba quien estuviera dispuesto a aceptarlo, y un solo músico negándose a aceptarlo movió el piso para todos los que vinieron detrás.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ponerlo en papel","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El jaleo era una forma oral: se aprendía de los discos y del que estaba al lado. Él escribió tres métodos —Jaleos de Merengue, Melodías de Merengue y Jaleos Típicos del Merengue Dominicano— que lo ponen sobre el papel para instrumentos en distintas claves, de modo que un estudiante en cualquier parte pueda trabajarlo sin un dominicano en el cuarto.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ha dado clases en el Conservatorio Nacional de Música y dirigido su departamento de música folclórica y popular, ha enseñado en Nueva York y en Santiago, y ha dado talleres de instrumento por todo el país.","type":"text"}]},{"type":"paragraph","content":[{"text":"Licuado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su propio grupo se llama Licuado, y hace lo que dice el nombre con el merengue, el jazz y la técnica clásica. Existen tres volúmenes, y el tercero incluye un tributo a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"28a3745e-90d6-45cd-b8bd-798028f8deb8","displayText":"Antony Santos","occurrenceId":"6808ac79-dd05-41a6-bf18-d756e9da8439"}},{"text":" grabado dos veces, una en bachata y otra en son montuno, que es una declaración bastante precisa de para qué existe el grupo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es miembro fundador de la Santo Domingo Jazz Big Band y sigue tocando los festivales. A los sesenta años de carrera, es de los pocos músicos dominicanos cuya reputación descansa por completo en lo que dicen de él otros músicos.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'crispin-fernandez'), 4)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '26ca8d09-1ba1-4085-9e7e-3d063d5ff9f6', 'artist', '001831dd-3baa-4512-88f5-f420ec7c2619');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '33594836-0207-4d51-b2ec-56e559e470c6', 'artist', '8fc78100-e51e-48a8-91e9-3007f4c67ec0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '3c5193b5-590c-418a-ab84-c9b6f7c3e3dc', 'artist', 'dd7240e6-3c43-4e1b-b429-f08a58a1f271');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '42690450-3566-4c12-8b71-952046498dc2', 'artist', 'f8c6f3e7-ef42-428b-a610-31948f846600');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '543e9a65-96dd-426f-b2ad-e0060c1aaa0e', 'artist', 'f0a5c773-b904-4feb-bf20-9d938bead0b1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '6b9a8c87-01c6-4955-8c92-737219ce1995', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '6ea88cc7-2d3f-4654-8fac-e3f3c70c1f59', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'a7f37268-bffa-4602-8188-f60c1cba0392', 'artist', '6c3e0d74-23b7-4d80-969f-9d5319ee5127');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'abf462a2-1439-4596-9fe6-d69572957a88', 'artist', '28a3745e-90d6-45cd-b8bd-798028f8deb8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'c6fa952c-5255-4d3e-910e-710c57e3e568', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'f774678c-8581-467f-b8ed-d22b03e64013', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '0ae4a1d1-b969-46f4-a5d1-39a26d5873fc', 'artist', '001831dd-3baa-4512-88f5-f420ec7c2619');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '1d81953a-8f78-4f99-97d8-70504cdae39d', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '2531aef6-d2ed-4d80-9138-53469d643359', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '3d3dab8c-6c79-4595-8a6e-d6a22fd5666b', 'artist', 'dd7240e6-3c43-4e1b-b429-f08a58a1f271');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '5e17ef0a-8768-413e-9e71-c8f10b229413', 'artist', '6c3e0d74-23b7-4d80-969f-9d5319ee5127');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '6808ac79-dd05-41a6-bf18-d756e9da8439', 'artist', '28a3745e-90d6-45cd-b8bd-798028f8deb8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '7510b05a-ddd3-4aa6-8f58-11e735fa10a0', 'artist', 'f0a5c773-b904-4feb-bf20-9d938bead0b1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '90f5fc62-0310-4e54-8bcd-58fad5e9e3aa', 'artist', '8fc78100-e51e-48a8-91e9-3007f4c67ec0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '97e920d1-afc6-44d3-a042-1cf826b8c219', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'c44572b8-fb67-413d-abfe-22f23f8cdc36', 'artist', 'f8c6f3e7-ef42-428b-a610-31948f846600');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'daea5883-2860-49eb-9cfa-1169361f171a', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

COMMIT;
