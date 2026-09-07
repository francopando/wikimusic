BEGIN;

-- Rewrite the catalogue entry for Rico López.
--
-- Rico López. Filler in English, nothing in Spanish, no occupations, no genres,
-- no aliases -- and, the worst of it, NO DEATH YEAR on a singer who died in
-- 1991. The row had him as living.
--
-- DEATH RECORDED: death_year 1991, ended true. Discogs, Ansonia Records and
-- several Dominican pages all give 1939-1991.
--
-- FILLED: date_of_birth 4 April 1939, from three independent Dominican sources
-- that all give the same day. birth_year 1939 was already stored and matches;
-- province Hato Mayor and birth_place Sabana de la Mar were already right.
-- first_name Benigno, middle_name Ricardo, last_name López were already stored
-- correctly and are not touched.
--
-- ADDED: occupations composer; genres salsa; instruments güira and guitar;
-- aliases; disambiguation; the legend tag. primary_genre merengue stays and is
-- right -- he sang both, but the merengue side is the larger body of work and
-- the salsa records are the ones collectors rediscovered later.
--
-- SOURCES: Ansonia Records' own artist page, written by Pablo E. Yglesias from
-- the Ansonia Archives, which is the only full account of the career anywhere
-- and supplies almost all of this: the birth into poverty in Sabana de la Mar,
-- the secondary school in the capital paid for by street work, the pregones,
-- the carpentry scholarship and the guitar he built, the police academy at
-- twenty-five and the National Police Band, the departure in 1966 for Bienvenido
-- Bustamante's Santa Cecilia Orchestra and then Rodolfo Manzano's, the 1968
-- substitution in Johnny Ventura's Combo Show and the hit El Gago, the six-month
-- New York residency at the Havana San Juan Hotel ballroom, the seven years with
-- Rafael Solano's orchestra sharing vocals with Vinicio Franco, the 1977 Ansonia
-- LP Canto de Remos recorded at Estudio Fabiola with Armando Beltré's
-- eleven-piece Conjunto Especial, the merengue album for Ansonia with his own
-- band Los Mensajeros, and the Kubaney deal as Rico López y su Orquesta.
-- Discogs for the dates and the group names. Instagram and Facebook archival
-- accounts for the 4 April birth date and for Espíritu Burlón with Rafael
-- Solano's orchestra, 1976.
--
-- NOT WRITTEN: the cause of death. Ansonia names it; this catalogue does not
-- record causes of death. The age is given because it is what makes the date
-- mean something.
--
-- A JUDGEMENT ABOUT ONE SENTENCE. Ansonia explains that López took over Johnny
-- Ventura's Combo Show in 1968 because Ventura had fallen ill. The illness is
-- somebody else's private life, so it is not named; the fact that Ventura could
-- no longer lead the band is what matters and is what the prose says. Without
-- it the whole episode makes no sense.
--
-- NOT LINKED: Bienvenido Bustamante, Rodolfo Manzano, Armando Beltré, the Santa
-- Cecilia Orchestra and Los Mensajeros are Dominican and have no entries. All
-- five are going on the missing-artists list; Bustamante and Beltré in
-- particular are gaps.
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
       name = 'Rico López',
       sort_name = 'López, Benigno Ricardo',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = '1939-04-04',
       birth_year = 1939,
       date_of_death = '1991-01-05',
       birth_place = 'Sabana de la Mar',
       province = 'Hato Mayor',
       first_name = 'Benigno',
       middle_name = 'Ricardo',
       last_name = 'López',
       second_last_name = NULL,
       stage_name = 'Rico López',
       aliases = ARRAY['Benigno Ricardo López', 'Rico López y su Orquesta']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY['guira', 'guitar']::text[],
       genres = ARRAY['salsa', 'merengue-orquesta']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Merengue and salsa singer from Sabana de la Mar; the Ansonia LP Canto de Remos',
       bio_en = 'Rico López, born Benigno Ricardo López in Sabana de la Mar, was a Dominican singer and composer who worked equally in merengue and in salsa. He is one of the best voices of his generation and one of the least written about.

**Bottles, peanuts, shoes**

He was born poor and went to secondary school in the capital by paying for it himself: buying and selling empty bottles in the morning, selling roasted sweet peanuts in the evening, shining shoes at weekends. He trained his voice in the middle of that, singing the pregones street vendors use to announce what they are carrying.

That is not a colourful detail. The pregón is a real vocal form with its own phrasing and its own reasons for landing on certain syllables, and a singer who learned it on the street arrives at a bandstand already knowing how to carry over noise.

A scholarship trained him as a carpenter and he built his own guitar, which is what he serenaded his classmates with. At twenty-five he enrolled in the police academy — not to become a policeman but to get into the National Police Band, where he learned the güira and sang merengue at large dances.

**Standing in for Johnny Ventura**

He left the police in 1966 for Bienvenido Bustamante’s Santa Cecilia Orchestra, then Rodolfo Manzano’s. Two years later Johnny Ventura could no longer lead his Combo Show and López took his place at the front of it.

He recorded El Gago there, which was a hit, and went to New York as the band’s lead singer for a six-month residency at the Havana San Juan Hotel ballroom. Coming home he became a regular television face.

**Seven years with Solano**

In 1971 Rafael Solano invited him into his orchestra and he stayed seven years, sharing the vocals with Vinicio Franco and writing several of the hits. What he became known for was the fast material — guaguancó, guaracha, son montuno — which in a Dominican orchestra of that period meant he was the one carrying the Cuban side of the book.

**Canto de Remos**

In 1977 Armando Beltré, one of Solano’s trumpet players, arranged a record for him and backed him with an eleven-piece Conjunto Especial: three trumpets, two saxophones, piano, tres, and percussion enough to match anything being cut in New York that year. They recorded it at Estudio Fabiola in Santo Domingo and Ansonia released it as Canto de Remos.

López wrote half the album. No Te Puedo Olvidar is the piece to hear — a guaguancó with a lovelorn lyric, sung with a melancholy that the tempo does nothing to soften. Vinicio Franco is on the coro.

It is an obscure record and it should not be. The salsa on it is hidden between the merengues, which is probably why collectors have gone past it for fifty years.

**His own orchestra**

An album of merengues followed for Ansonia with his own band, Los Mensajeros, and then a distribution deal as Rico López y su Orquesta with Kubaney, Solano’s label, for three more records, mostly merengue.

He died in 1991, at fifty-one. Two Ansonia albums and a run of Kubaney LPs are what is left, and almost nobody has looked at them since.',
       bio_es = 'Rico López, de nombre Benigno Ricardo López y nacido en Sabana de la Mar, fue un cantante y compositor dominicano que trabajó por igual el merengue y la salsa. Es una de las mejores voces de su generación y una de las menos escritas.

**Botellas, maní, zapatos**

Nació pobre y llegó a la secundaria en la capital pagándosela él mismo: comprando y vendiendo botellas vacías por la mañana, vendiendo maní dulce tostado por la tarde y limpiando zapatos los fines de semana. En medio de eso se entrenó la voz cantando los pregones con los que los vendedores de calle anuncian lo que cargan.

No es un detalle de color. El pregón es una forma vocal de verdad, con su fraseo propio y sus razones para apoyarse en ciertas sílabas, y un cantante que lo aprendió en la calle llega a una tarima sabiendo ya cómo pasar por encima del ruido.

Una beca lo hizo ebanista y se construyó su propia guitarra, que fue con la que serenateaba a sus compañeros de clase. A los veinticinco entró a la academia de policía, no para ser policía sino para meterse en la Banda de la Policía Nacional, donde aprendió güira y cantó merengue en bailes grandes.

**Sustituir a Johnny Ventura**

Dejó la policía en 1966 por la Orquesta Santa Cecilia de Bienvenido Bustamante, y después por la de Rodolfo Manzano. Dos años más tarde Johnny Ventura ya no podía dirigir su Combo Show y López ocupó su lugar al frente.

Ahí grabó El Gago, que pegó, y se fue a Nueva York como voz principal de la banda para una temporada de seis meses en el salón del Havana San Juan Hotel. De vuelta al país se volvió cara fija de la televisión.

**Siete años con Solano**

En 1971 Rafael Solano lo invitó a su orquesta y se quedó siete años, repartiendo las voces con Vinicio Franco y escribiendo varios de los éxitos. Por lo que se hizo conocido fue por el material rápido —guaguancó, guaracha, son montuno—, que en una orquesta dominicana de esa época significaba que era él quien cargaba el lado cubano del repertorio.

**Canto de Remos**

En 1977 Armando Beltré, uno de los trompetistas de Solano, le arregló un disco y lo respaldó con un Conjunto Especial de once músicos: tres trompetas, dos saxofones, piano, tres, y percusión suficiente para medirse con cualquier cosa que se estuviera grabando en Nueva York ese año. Lo grabaron en el Estudio Fabiola de Santo Domingo y Ansonia lo publicó como Canto de Remos.

López escribió la mitad del álbum. No Te Puedo Olvidar es la pieza que hay que oír: un guaguancó con letra de despecho, cantado con una melancolía que el tempo no suaviza en nada. Vinicio Franco está en el coro.

Es un disco oscuro y no debería serlo. La salsa está escondida entre los merengues, que es probablemente por qué los coleccionistas le han pasado por al lado cincuenta años.

**Su propia orquesta**

Detrás vino un álbum de merengues para Ansonia con su propia banda, Los Mensajeros, y después un acuerdo de distribución como Rico López y su Orquesta con Kubaney, el sello de Solano, para tres discos más, casi todos de merengue.

Murió en 1991, a los cincuenta y uno. Dos álbumes de Ansonia y una tanda de elepés de Kubaney es lo que queda, y casi nadie los ha mirado desde entonces.',
       updated_at = now()
 WHERE slug = 'rico-lopez';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rico López, born Benigno Ricardo López in Sabana de la Mar, was a Dominican singer and composer who worked equally in merengue and in salsa. He is one of the best voices of his generation and one of the least written about.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bottles, peanuts, shoes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was born poor and went to secondary school in the capital by paying for it himself: buying and selling empty bottles in the morning, selling roasted sweet peanuts in the evening, shining shoes at weekends. He trained his voice in the middle of that, singing the pregones street vendors use to announce what they are carrying.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is not a colourful detail. The pregón is a real vocal form with its own phrasing and its own reasons for landing on certain syllables, and a singer who learned it on the street arrives at a bandstand already knowing how to carry over noise.","type":"text"}]},{"type":"paragraph","content":[{"text":"A scholarship trained him as a carpenter and he built his own guitar, which is what he serenaded his classmates with. At twenty-five he enrolled in the police academy — not to become a policeman but to get into the National Police Band, where he learned the güira and sang merengue at large dances.","type":"text"}]},{"type":"paragraph","content":[{"text":"Standing in for Johnny Ventura","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He left the police in 1966 for Bienvenido Bustamante’s Santa Cecilia Orchestra, then Rodolfo Manzano’s. Two years later ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"f08ab00d-958a-462b-8a89-d105adb42951"}},{"text":" could no longer lead his Combo Show and López took his place at the front of it.","type":"text"}]},{"type":"paragraph","content":[{"text":"He recorded El Gago there, which was a hit, and went to New York as the band’s lead singer for a six-month residency at the Havana San Juan Hotel ballroom. Coming home he became a regular television face.","type":"text"}]},{"type":"paragraph","content":[{"text":"Seven years with Solano","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 1971 ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"a2ab53cf-119a-432d-9f13-dafd8f5d4abe"}},{"text":" invited him into his orchestra and he stayed seven years, sharing the vocals with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f625be23-cfa4-43fe-8bb5-0879b2fa492f","displayText":"Vinicio Franco","occurrenceId":"9511f830-eb06-4496-826e-23a77b10640a"}},{"text":" and writing several of the hits. What he became known for was the fast material — guaguancó, guaracha, son montuno — which in a Dominican orchestra of that period meant he was the one carrying the Cuban side of the book.","type":"text"}]},{"type":"paragraph","content":[{"text":"Canto de Remos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 1977 Armando Beltré, one of Solano’s trumpet players, arranged a record for him and backed him with an eleven-piece Conjunto Especial: three trumpets, two saxophones, piano, tres, and percussion enough to match anything being cut in New York that year. They recorded it at Estudio Fabiola in Santo Domingo and Ansonia released it as Canto de Remos.","type":"text"}]},{"type":"paragraph","content":[{"text":"López wrote half the album. No Te Puedo Olvidar is the piece to hear — a guaguancó with a lovelorn lyric, sung with a melancholy that the tempo does nothing to soften. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f625be23-cfa4-43fe-8bb5-0879b2fa492f","displayText":"Vinicio Franco","occurrenceId":"8ef92bee-d118-470b-9747-3bb450d01a8d"}},{"text":" is on the coro.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is an obscure record and it should not be. The salsa on it is hidden between the merengues, which is probably why collectors have gone past it for fifty years.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own orchestra","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"An album of merengues followed for Ansonia with his own band, Los Mensajeros, and then a distribution deal as Rico López y su Orquesta with Kubaney, Solano’s label, for three more records, mostly merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"He died in 1991, at fifty-one. Two Ansonia albums and a run of Kubaney LPs are what is left, and almost nobody has looked at them since.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'rico-lopez'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rico López, de nombre Benigno Ricardo López y nacido en Sabana de la Mar, fue un cantante y compositor dominicano que trabajó por igual el merengue y la salsa. Es una de las mejores voces de su generación y una de las menos escritas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Botellas, maní, zapatos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nació pobre y llegó a la secundaria en la capital pagándosela él mismo: comprando y vendiendo botellas vacías por la mañana, vendiendo maní dulce tostado por la tarde y limpiando zapatos los fines de semana. En medio de eso se entrenó la voz cantando los pregones con los que los vendedores de calle anuncian lo que cargan.","type":"text"}]},{"type":"paragraph","content":[{"text":"No es un detalle de color. El pregón es una forma vocal de verdad, con su fraseo propio y sus razones para apoyarse en ciertas sílabas, y un cantante que lo aprendió en la calle llega a una tarima sabiendo ya cómo pasar por encima del ruido.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una beca lo hizo ebanista y se construyó su propia guitarra, que fue con la que serenateaba a sus compañeros de clase. A los veinticinco entró a la academia de policía, no para ser policía sino para meterse en la Banda de la Policía Nacional, donde aprendió güira y cantó merengue en bailes grandes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sustituir a Johnny Ventura","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dejó la policía en 1966 por la Orquesta Santa Cecilia de Bienvenido Bustamante, y después por la de Rodolfo Manzano. Dos años más tarde ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"95c82790-3c19-49ce-8a48-ceb69429c3dc"}},{"text":" ya no podía dirigir su Combo Show y López ocupó su lugar al frente.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ahí grabó El Gago, que pegó, y se fue a Nueva York como voz principal de la banda para una temporada de seis meses en el salón del Havana San Juan Hotel. De vuelta al país se volvió cara fija de la televisión.","type":"text"}]},{"type":"paragraph","content":[{"text":"Siete años con Solano","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1971 ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"c3362ab2-1c13-4d93-9cb5-04142ee23ff7"}},{"text":" lo invitó a su orquesta y se quedó siete años, repartiendo las voces con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f625be23-cfa4-43fe-8bb5-0879b2fa492f","displayText":"Vinicio Franco","occurrenceId":"cebb9204-9715-4657-9988-824952cad4f9"}},{"text":" y escribiendo varios de los éxitos. Por lo que se hizo conocido fue por el material rápido —guaguancó, guaracha, son montuno—, que en una orquesta dominicana de esa época significaba que era él quien cargaba el lado cubano del repertorio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Canto de Remos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1977 Armando Beltré, uno de los trompetistas de Solano, le arregló un disco y lo respaldó con un Conjunto Especial de once músicos: tres trompetas, dos saxofones, piano, tres, y percusión suficiente para medirse con cualquier cosa que se estuviera grabando en Nueva York ese año. Lo grabaron en el Estudio Fabiola de Santo Domingo y Ansonia lo publicó como Canto de Remos.","type":"text"}]},{"type":"paragraph","content":[{"text":"López escribió la mitad del álbum. No Te Puedo Olvidar es la pieza que hay que oír: un guaguancó con letra de despecho, cantado con una melancolía que el tempo no suaviza en nada. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f625be23-cfa4-43fe-8bb5-0879b2fa492f","displayText":"Vinicio Franco","occurrenceId":"0db9b1d6-5803-4173-b07f-aa05df4d4e27"}},{"text":" está en el coro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es un disco oscuro y no debería serlo. La salsa está escondida entre los merengues, que es probablemente por qué los coleccionistas le han pasado por al lado cincuenta años.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su propia orquesta","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Detrás vino un álbum de merengues para Ansonia con su propia banda, Los Mensajeros, y después un acuerdo de distribución como Rico López y su Orquesta con Kubaney, el sello de Solano, para tres discos más, casi todos de merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Murió en 1991, a los cincuenta y uno. Dos álbumes de Ansonia y una tanda de elepés de Kubaney es lo que queda, y casi nadie los ha mirado desde entonces.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'rico-lopez'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez') AND locale = 'en'), '8ef92bee-d118-470b-9747-3bb450d01a8d', 'artist', 'f625be23-cfa4-43fe-8bb5-0879b2fa492f');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez') AND locale = 'en'), '9511f830-eb06-4496-826e-23a77b10640a', 'artist', 'f625be23-cfa4-43fe-8bb5-0879b2fa492f');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez') AND locale = 'en'), 'a2ab53cf-119a-432d-9f13-dafd8f5d4abe', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez') AND locale = 'en'), 'f08ab00d-958a-462b-8a89-d105adb42951', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez') AND locale = 'es'), '0db9b1d6-5803-4173-b07f-aa05df4d4e27', 'artist', 'f625be23-cfa4-43fe-8bb5-0879b2fa492f');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez') AND locale = 'es'), '95c82790-3c19-49ce-8a48-ceb69429c3dc', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez') AND locale = 'es'), 'c3362ab2-1c13-4d93-9cb5-04142ee23ff7', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rico-lopez') AND locale = 'es'), 'cebb9204-9715-4657-9988-824952cad4f9', 'artist', 'f625be23-cfa4-43fe-8bb5-0879b2fa492f');

COMMIT;
