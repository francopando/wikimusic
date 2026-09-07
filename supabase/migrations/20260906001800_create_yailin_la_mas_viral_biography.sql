BEGIN;

-- Create the catalogue entry for Yailin La Más Viral.
--
-- Yailin La Mas Viral. NEW ENTRY. Created at the editor's request and left in
-- draft until a photograph exists, which is this catalogue's normal practice.
--
-- She was one of the largest gaps in the catalogue: a Dominican artist signed
-- to Roc Nation, charting in the United States and Spain, and the voice on the
-- biggest dembow record of its year.
--
-- DATE OF BIRTH, and there is a conflict: 4 July 2002. English Wikipedia's
-- opening sentence says 1999, but its own infobox says "4 July 2002 (age 24)"
-- and its own category says "2002 births"; Spanish Wikipedia says 2002 in the
-- infobox, in the lead and in the category. Two of three signals in the English
-- article and all three in the Spanish one give 2002, so 2002 is stored. Worth
-- a second look if a primary source turns up.
--
-- EVERYTHING PERSONAL IS DELIBERATELY ABSENT, and with this artist that is most
-- of what has been published about her. No marriage, no separation, no
-- daughter, no subsequent relationship, no arrests, no accusations. Those are
-- the rules this catalogue works under and they are not suspended for a subject
-- the tabloids like. Records made with Anuel AA and with 6ix9ine are named
-- because the records exist and charted; nothing is said about why the two
-- people were in a room.
--
-- SOURCES: Spanish Wikipedia, which carries the legal name Jorgina Guillermo
-- Diaz, the birth in Santo Domingo Este, the start as a dancer, the signing to
-- Akino Mundial Music in 2019 and to Roc Nation, the genres -- "dembow,
-- regueton, bachata, trap, merengue, mariachi y cumbia" -- and the release
-- history from Quien Me Atraca a Mi (Remix) with Haraca Kiko in August 2020
-- through Resiliencia on 3 April 2024 to the Planeta Alofoke residency of 2026,
-- during which she recorded three songs on the set. English Wikipedia for the
-- label line Iris Live Music / Roc Nation Distribution and for the chart
-- positions: Monitor Latino's Top 20 RD for Nataly (14), Del Kilo (20), Solo Tu
-- y Yo (15), Dale 2 (16) and Bing Bong (8), and Billboard's Hot Latin Songs for
-- Si Tu Me Busca (12), La Maquina (23), Pa Ti (37) and Bing Bong (28), plus
-- Spain's Productores de Musica de Espana for Si Tu Me Busca (97) and La
-- Maquina (79). Shock, 15 April 2021, on how Chivirika became a TikTok hit. El
-- Nuevo Diario and Metro Puerto Rico on the first United States tour. Diario
-- Libre, 31 March 2022, on Si Tu Me Busca, produced by Subelo Neo. Listin
-- Diario, 22 July 2023, on Shaka Laka and the English-language market, and 14
-- May 2026 on the Planeta Alofoke week. The award record: Premios Juventud 2023
-- nomination for Mejor Colaboracion Dembow with Farina and La Insuperable;
-- Premios Soberano 2024 nomination for Mejor Colaboracion del Ano with Shadow
-- Blow; Premios Heat 2025, three nominations and two wins, Urbano Dominicano
-- and Fandom del Ano; Premios Tu Musica Urbano 2025, three nominations and two
-- wins, Artista Dembow and Cancion Dembow for Bing Bong; and the Premio Lo
-- Nuestro 2026 nomination for Bing Bong already recorded against Puyalo
-- Pantera.
--
-- NOT WRITTEN: view counts, which the Spanish article gives for almost every
-- single and which this catalogue does not carry. Chart positions are used
-- instead, because a position is a ranking rather than a tally.
--
-- NOT LINKED: Anuel AA, 6ix9ine, Kodak Black, Lil Tjay, Farina, Jowell & Randy
-- and De La Ghetto are foreign and should not have entries here. El Villano RD,
-- La Perversa, Treintisiete, Jey One, Menor Queen, Kreizy K and La Mas Doll are
-- Dominican and have none; the catalogue's "villanosam" is a different artist
-- and is deliberately not used.
--
-- FOR LATER: Puyalo Pantera's entry names her in prose rather than as a
-- reference, because a reference to a draft artist renders as dead text. Once
-- she is published, the two should be linked both ways.
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
       name = 'Yailin La Más Viral',
       sort_name = 'Yailin La Más Viral',
       type = 'solo_artist',
       status = 'draft',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '2002-07-04',
       birth_year = 2002,
       date_of_death = NULL,
       birth_place = 'Santo Domingo Este',
       province = 'Santo Domingo',
       first_name = 'Jorgina',
       middle_name = NULL,
       last_name = 'Guillermo',
       second_last_name = 'Díaz',
       stage_name = 'Yailin La Más Viral',
       aliases = ARRAY['Yailín la Más Viral', 'Jorgina Guillermo Díaz']::text[],
       occupations = '["rapper","composer","dancer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-reggaeton', 'urban-trap', 'merengue']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://yailinrd.com',
       youtube = NULL,
       facebook = NULL,
       instagram = 'yailinlamasviral',
       disambiguation = 'Dominican dembow artist, born Jorgina Guillermo Díaz in Santo Domingo Este; signed to Roc Nation',
       bio_en = 'Yailin La Más Viral is a Dominican dembow artist, born Jorgina Guillermo Díaz in Santo Domingo Este on 4 July 2002. She began as a dancer, signed her first deal in 2019, and is now on Roc Nation.

**Dancing first**

The order matters. She came into the music from the floor rather than from a studio, and it shows in what she makes: records built for a body to move to, with the hook placed where a dancer would want it.

Akino Mundial Music signed her in 2019. The first release came in August 2020 — a remix of Quién Me Atraca a Mí with Haraca Kiko — and in December she was on Yo No Me Voy a Acostar with Tokischa and La Perversa. That is the company she started in: the women who had just made Dominican dembow a place where a woman could stand at the front.

Nataly followed, with Ceky Viciny, Melymel, La Perversa and Shadow Blow, and it reached number fourteen in the Dominican Republic.

**Chivirika**

In 2021, Chivirika with El Villano RD went off on TikTok and gave her the name she has carried since. La Más Viral is not modesty; it is an accurate description of the mechanism that made her, and she took it as a title rather than waiting for anyone to grant her one.

Her audience took a name too. They call themselves Team Chivirikas, after that song.

**Out of the country**

By April 2022 she was touring the United States. Si Tú Me Busca, made with the Puerto Rican Anuel AA and produced by Súbelo Neo, reached number twelve on the American Latin chart and ninety-seven in Spain; La Máquina reached twenty-three and seventy-nine; Del Kilo went to twenty at home; Soy Mama came as a remix with La Insuperable and the Colombian Farina.

Solo Tú y Yo with Shadow Blow reached fifteen in the Dominican Republic and took her to a Premio Soberano nomination. Pa Ti and Shaka Laka, both made with the American 6ix9ine, put her on the English-language market, which the Dominican press noted as the point at which a dembowsera stopped being a local proposition.

**Resiliencia**

Her own record arrived on 3 April 2024 on Iris Live Music, after the singles Nota and Me Encantas. DM, 69, Sola, Amigos.

That summer she released Mal de Amor, her first merengue — a Dominican artist of her generation reaching back for the country’s own rhythm rather than outward for somebody else’s, which is a choice more of them are making. Te La Parto Remix with La Más Doll, Ni Un Ki Ki with Jey One, Perdí Mi Tiempo, Step Up with the New York rapper Lil Tjay and Dale 2 with Kreizy K, sixteen at home, came in the same stretch.

**Bing Bong**

The run with Puyalo Pantera is the strongest work of her career. Chapa came first, then Bing Bong, then Silla. Bing Bong reached number eight in the Dominican Republic and twenty-eight on the American Latin chart, and it did what almost no Dominican dembow record manages: it was heard by people who do not otherwise listen to dembow.

It is built on two syllables that mean nothing at all. That is the craft of the genre stated at its plainest — a sound that lodges before the listener has decided anything about it.

**What she has won**

Premios Juventud nominated her in 2023 and Premios Soberano in 2024. In 2025 she took Urbano Dominicano and Fandom del Año at the Premios Heat, and Artista Dembow and Canción Dembow at the Premios Tu Música Urbano, the second of those for Bing Bong. Bing Bong was nominated again at the Premio Lo Nuestro of 2026.

In 2026 she spent a week inside Planeta Alofoke, the Dominican web reality programme, and recorded three songs from the set — which is a fair image of how she works. The camera and the record are the same job.',
       bio_es = 'Yailin La Más Viral es una dembowsera dominicana, nacida Jorgina Guillermo Díaz en Santo Domingo Este el 4 de julio de 2002. Empezó como bailarina, firmó su primer contrato en 2019 y hoy está en Roc Nation.

**Primero bailar**

El orden importa. Llegó a la música desde la pista y no desde un estudio, y eso se nota en lo que hace: discos armados para que un cuerpo se mueva, con el gancho puesto donde una bailadora lo querría.

Akino Mundial Music la firmó en 2019. El primer lanzamiento fue en agosto de 2020 —un remix de Quién Me Atraca a Mí con Haraca Kiko— y en diciembre estaba en Yo No Me Voy a Acostar con Tokischa y La Perversa. Esa es la compañía en la que empezó: las mujeres que acababan de convertir el dembow dominicano en un sitio donde una mujer podía pararse al frente.

Después vino Nataly, con Ceky Viciny, Melymel, La Perversa y Shadow Blow, que llegó al número catorce en República Dominicana.

**Chivirika**

En 2021, Chivirika con El Villano RD explotó en TikTok y le dio el nombre que carga desde entonces. La Más Viral no es modestia; es una descripción exacta del mecanismo que la hizo, y se lo puso ella misma en vez de esperar a que se lo concedieran.

Su público también agarró nombre. Se llaman Team Chivirikas, por esa canción.

**Salir del país**

Para abril de 2022 estaba de gira por Estados Unidos. Si Tú Me Busca, hecha con el puertorriqueño Anuel AA y producida por Súbelo Neo, llegó al número doce de la lista latina estadounidense y al noventa y siete en España; La Máquina llegó a veintitrés y a setenta y nueve; Del Kilo llegó a veinte en casa; Soy Mama salió como remix con La Insuperable y la colombiana Farina.

Solo Tú y Yo con Shadow Blow llegó a quince en República Dominicana y la llevó a una nominación al Soberano. Pa Ti y Shaka Laka, las dos con el estadounidense 6ix9ine, la metieron en el mercado anglosajón, que la prensa dominicana señaló como el punto en que una dembowsera dejaba de ser una propuesta local.

**Resiliencia**

Su propio disco salió el 3 de abril de 2024 por Iris Live Music, después de los sencillos Nota y Me Encantas. DM, 69, Sola, Amigos.

Ese verano sacó Mal de Amor, su primer merengue: una artista dominicana de su generación volviendo a buscar el ritmo del país en vez de salir a buscar el de otro, que es una decisión que están tomando cada vez más de ellos. Te La Parto Remix con La Más Doll, Ni Un Ki Ki con Jey One, Perdí Mi Tiempo, Step Up con el rapero neoyorquino Lil Tjay y Dale 2 con Kreizy K, dieciséis en casa, salieron en el mismo tramo.

**Bing Bong**

La tanda con Puyalo Pantera es lo más fuerte de su carrera. Primero Chapa, después Bing Bong, después Silla. Bing Bong llegó al número ocho en República Dominicana y al veintiocho en la lista latina estadounidense, e hizo lo que casi ningún disco de dembow dominicano consigue: lo oyó gente que por lo demás no oye dembow.

Está montada sobre dos sílabas que no significan absolutamente nada. Ese es el oficio del género dicho de la manera más llana: un sonido que se aloja antes de que el oyente haya decidido nada sobre él.

**Lo que ha ganado**

Premios Juventud la nominó en 2023 y Premios Soberano en 2024. En 2025 se llevó Urbano Dominicano y Fandom del Año en los Premios Heat, y Artista Dembow y Canción Dembow en los Premios Tu Música Urbano, esta última por Bing Bong. Bing Bong volvió a ser nominada en el Premio Lo Nuestro de 2026.

En 2026 pasó una semana dentro de Planeta Alofoke, el programa dominicano de telerrealidad web, y grabó tres temas desde el set, que es una imagen justa de cómo trabaja. La cámara y el disco son el mismo oficio.',
       updated_at = now()
 WHERE slug = 'yailin-la-mas-viral';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Yailin La Más Viral is a Dominican dembow artist, born Jorgina Guillermo Díaz in Santo Domingo Este on 4 July 2002. She began as a dancer, signed her first deal in 2019, and is now on Roc Nation.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dancing first","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The order matters. She came into the music from the floor rather than from a studio, and it shows in what she makes: records built for a body to move to, with the hook placed where a dancer would want it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Akino Mundial Music signed her in 2019. The first release came in August 2020 — a remix of Quién Me Atraca a Mí with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2993cde1-f93d-4cf0-9668-fa1e54b09919","displayText":"Haraca Kiko","occurrenceId":"5f2b8a71-e27e-4fe5-b9bf-4fad61026e26"}},{"text":" — and in December she was on Yo No Me Voy a Acostar with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"30291e82-302c-4e91-bff9-df28e8261f7a"}},{"text":" and La Perversa. That is the company she started in: the women who had just made Dominican dembow a place where a woman could stand at the front.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nataly followed, with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"a99a7bcd-7be0-4041-abc5-4e731278c06b"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"580293c3-1e1e-418f-8555-8082665c22b0","displayText":"Melymel","occurrenceId":"c8b1f716-69a4-496c-8832-0d573e09af37"}},{"text":", La Perversa and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"9ac7feea-33c2-48c0-b314-da107a96e99a"}},{"text":", and it reached number fourteen in the Dominican Republic.","type":"text"}]},{"type":"paragraph","content":[{"text":"Chivirika","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2021, Chivirika with El Villano RD went off on TikTok and gave her the name she has carried since. La Más Viral is not modesty; it is an accurate description of the mechanism that made her, and she took it as a title rather than waiting for anyone to grant her one.","type":"text"}]},{"type":"paragraph","content":[{"text":"Her audience took a name too. They call themselves Team Chivirikas, after that song.","type":"text"}]},{"type":"paragraph","content":[{"text":"Out of the country","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"By April 2022 she was touring the United States. Si Tú Me Busca, made with the Puerto Rican Anuel AA and produced by Súbelo Neo, reached number twelve on the American Latin chart and ninety-seven in Spain; La Máquina reached twenty-three and seventy-nine; Del Kilo went to twenty at home; Soy Mama came as a remix with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"88f7d517-f9bb-4687-9a01-a4c6c418ace7"}},{"text":" and the Colombian Farina.","type":"text"}]},{"type":"paragraph","content":[{"text":"Solo Tú y Yo with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"3caef4bb-2f79-415b-92ba-004012d213fd"}},{"text":" reached fifteen in the Dominican Republic and took her to a Premio Soberano nomination. Pa Ti and Shaka Laka, both made with the American 6ix9ine, put her on the English-language market, which the Dominican press noted as the point at which a dembowsera stopped being a local proposition.","type":"text"}]},{"type":"paragraph","content":[{"text":"Resiliencia","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Her own record arrived on 3 April 2024 on Iris Live Music, after the singles Nota and Me Encantas. DM, 69, Sola, Amigos.","type":"text"}]},{"type":"paragraph","content":[{"text":"That summer she released Mal de Amor, her first merengue — a Dominican artist of her generation reaching back for the country’s own rhythm rather than outward for somebody else’s, which is a choice more of them are making. Te La Parto Remix with La Más Doll, Ni Un Ki Ki with Jey One, Perdí Mi Tiempo, Step Up with the New York rapper Lil Tjay and Dale 2 with Kreizy K, sixteen at home, came in the same stretch.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bing Bong","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The run with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"349e25fa-268a-4036-870f-147e82155f3c","displayText":"Puyalo Pantera","occurrenceId":"79b05a49-cfc7-4d6c-89bb-3acbdc1ed6bf"}},{"text":" is the strongest work of her career. Chapa came first, then Bing Bong, then Silla. Bing Bong reached number eight in the Dominican Republic and twenty-eight on the American Latin chart, and it did what almost no Dominican dembow record manages: it was heard by people who do not otherwise listen to dembow.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is built on two syllables that mean nothing at all. That is the craft of the genre stated at its plainest — a sound that lodges before the listener has decided anything about it.","type":"text"}]},{"type":"paragraph","content":[{"text":"What she has won","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Premios Juventud nominated her in 2023 and Premios Soberano in 2024. In 2025 she took Urbano Dominicano and Fandom del Año at the Premios Heat, and Artista Dembow and Canción Dembow at the Premios Tu Música Urbano, the second of those for Bing Bong. Bing Bong was nominated again at the Premio Lo Nuestro of 2026.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 2026 she spent a week inside Planeta Alofoke, the Dominican web reality programme, and recorded three songs from the set — which is a fair image of how she works. The camera and the record are the same job.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral'), 1)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Yailin La Más Viral es una dembowsera dominicana, nacida Jorgina Guillermo Díaz en Santo Domingo Este el 4 de julio de 2002. Empezó como bailarina, firmó su primer contrato en 2019 y hoy está en Roc Nation.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primero bailar","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El orden importa. Llegó a la música desde la pista y no desde un estudio, y eso se nota en lo que hace: discos armados para que un cuerpo se mueva, con el gancho puesto donde una bailadora lo querría.","type":"text"}]},{"type":"paragraph","content":[{"text":"Akino Mundial Music la firmó en 2019. El primer lanzamiento fue en agosto de 2020 —un remix de Quién Me Atraca a Mí con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2993cde1-f93d-4cf0-9668-fa1e54b09919","displayText":"Haraca Kiko","occurrenceId":"631fe0e5-6f34-4d27-828a-924828c808f1"}},{"text":"— y en diciembre estaba en Yo No Me Voy a Acostar con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"93389ecd-9b1e-48ad-b01d-8c00041a4bff"}},{"text":" y La Perversa. Esa es la compañía en la que empezó: las mujeres que acababan de convertir el dembow dominicano en un sitio donde una mujer podía pararse al frente.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después vino Nataly, con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"ed289c77-2e6d-45d5-9945-c67cbc41e499"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"580293c3-1e1e-418f-8555-8082665c22b0","displayText":"Melymel","occurrenceId":"b3e8837f-c34f-4fce-b066-392385c8ed99"}},{"text":", La Perversa y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"499064e0-dff6-460c-aa69-871f2cfe94e9"}},{"text":", que llegó al número catorce en República Dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Chivirika","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2021, Chivirika con El Villano RD explotó en TikTok y le dio el nombre que carga desde entonces. La Más Viral no es modestia; es una descripción exacta del mecanismo que la hizo, y se lo puso ella misma en vez de esperar a que se lo concedieran.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su público también agarró nombre. Se llaman Team Chivirikas, por esa canción.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salir del país","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Para abril de 2022 estaba de gira por Estados Unidos. Si Tú Me Busca, hecha con el puertorriqueño Anuel AA y producida por Súbelo Neo, llegó al número doce de la lista latina estadounidense y al noventa y siete en España; La Máquina llegó a veintitrés y a setenta y nueve; Del Kilo llegó a veinte en casa; Soy Mama salió como remix con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"3a30e438-9aa9-4133-85a9-1672c4824553"}},{"text":" y la colombiana Farina.","type":"text"}]},{"type":"paragraph","content":[{"text":"Solo Tú y Yo con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"97c7b377-07f8-4749-9f82-57942d7b9547"}},{"text":" llegó a quince en República Dominicana y la llevó a una nominación al Soberano. Pa Ti y Shaka Laka, las dos con el estadounidense 6ix9ine, la metieron en el mercado anglosajón, que la prensa dominicana señaló como el punto en que una dembowsera dejaba de ser una propuesta local.","type":"text"}]},{"type":"paragraph","content":[{"text":"Resiliencia","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su propio disco salió el 3 de abril de 2024 por Iris Live Music, después de los sencillos Nota y Me Encantas. DM, 69, Sola, Amigos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese verano sacó Mal de Amor, su primer merengue: una artista dominicana de su generación volviendo a buscar el ritmo del país en vez de salir a buscar el de otro, que es una decisión que están tomando cada vez más de ellos. Te La Parto Remix con La Más Doll, Ni Un Ki Ki con Jey One, Perdí Mi Tiempo, Step Up con el rapero neoyorquino Lil Tjay y Dale 2 con Kreizy K, dieciséis en casa, salieron en el mismo tramo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bing Bong","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La tanda con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"349e25fa-268a-4036-870f-147e82155f3c","displayText":"Puyalo Pantera","occurrenceId":"c6ff9a23-057c-4be4-9b1e-e0280ed02222"}},{"text":" es lo más fuerte de su carrera. Primero Chapa, después Bing Bong, después Silla. Bing Bong llegó al número ocho en República Dominicana y al veintiocho en la lista latina estadounidense, e hizo lo que casi ningún disco de dembow dominicano consigue: lo oyó gente que por lo demás no oye dembow.","type":"text"}]},{"type":"paragraph","content":[{"text":"Está montada sobre dos sílabas que no significan absolutamente nada. Ese es el oficio del género dicho de la manera más llana: un sonido que se aloja antes de que el oyente haya decidido nada sobre él.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que ha ganado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Premios Juventud la nominó en 2023 y Premios Soberano en 2024. En 2025 se llevó Urbano Dominicano y Fandom del Año en los Premios Heat, y Artista Dembow y Canción Dembow en los Premios Tu Música Urbano, esta última por Bing Bong. Bing Bong volvió a ser nominada en el Premio Lo Nuestro de 2026.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 2026 pasó una semana dentro de Planeta Alofoke, el programa dominicano de telerrealidad web, y grabó tres temas desde el set, que es una imagen justa de cómo trabaja. La cámara y el disco son el mismo oficio.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'en'), '30291e82-302c-4e91-bff9-df28e8261f7a', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'en'), '3caef4bb-2f79-415b-92ba-004012d213fd', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'en'), '5f2b8a71-e27e-4fe5-b9bf-4fad61026e26', 'artist', '2993cde1-f93d-4cf0-9668-fa1e54b09919');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'en'), '79b05a49-cfc7-4d6c-89bb-3acbdc1ed6bf', 'artist', '349e25fa-268a-4036-870f-147e82155f3c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'en'), '88f7d517-f9bb-4687-9a01-a4c6c418ace7', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'en'), '9ac7feea-33c2-48c0-b314-da107a96e99a', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'en'), 'a99a7bcd-7be0-4041-abc5-4e731278c06b', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'en'), 'c8b1f716-69a4-496c-8832-0d573e09af37', 'artist', '580293c3-1e1e-418f-8555-8082665c22b0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'es'), '3a30e438-9aa9-4133-85a9-1672c4824553', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'es'), '499064e0-dff6-460c-aa69-871f2cfe94e9', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'es'), '631fe0e5-6f34-4d27-828a-924828c808f1', 'artist', '2993cde1-f93d-4cf0-9668-fa1e54b09919');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'es'), '93389ecd-9b1e-48ad-b01d-8c00041a4bff', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'es'), '97c7b377-07f8-4749-9f82-57942d7b9547', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'es'), 'b3e8837f-c34f-4fce-b066-392385c8ed99', 'artist', '580293c3-1e1e-418f-8555-8082665c22b0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'es'), 'c6ff9a23-057c-4be4-9b1e-e0280ed02222', 'artist', '349e25fa-268a-4036-870f-147e82155f3c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yailin-la-mas-viral') AND locale = 'es'), 'ed289c77-2e6d-45d5-9945-c67cbc41e499', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

COMMIT;
