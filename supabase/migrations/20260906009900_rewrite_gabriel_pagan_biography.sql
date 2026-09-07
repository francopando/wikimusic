BEGIN;

-- Rewrite the catalogue entry for Gabriel Pagán.
--
-- Gabriel Pagán. Filler in English, nothing in Spanish, no genres, no
-- instruments, no disambiguation -- on a Latin Grammy nominee who has won two
-- Soberanos. This is the largest name left in the filler queue.
--
-- BIRTHPLACE AND BIRTH DATE BOTH CORRECTED. The row said Santo Domingo,
-- Distrito Nacional, 21 February 1990. Three independent sources agree he was
-- born in Saint Louis, Missouri, on 5 January 1990: BuenaMusica's Datos block,
-- CMTV's biography ("nació el 5 de enero de 1990, en Saint Louis, Missouri...
-- hijo de los dominicanos Enrique A. Ramírez y Tammy Pagan; creció en República
-- Dominicana"), and a Promueve RD post giving the same name, date and city. His
-- own Facebook page carries a post dated 5 January, which is what a birthday
-- post looks like.
--
-- province therefore becomes "Nacido en el Exterior" and birth_place becomes
-- "San Luis, Misuri", following the convention the catalogue already uses for
-- the twenty-two artists in that group -- Prince Royce "Nueva York", Daniel
-- Santacruz "Nueva Jersey", Félix Cumbé "Haití", Silvio Mora "Suiza".
--
-- He grew up in the Dominican Republic, his parents are Dominican, and he has
-- spent his career making merengue. Where he was born changes a field; it
-- changes nothing about whether he belongs here.
--
-- THE diaspora TAG IS NOT ADDED. Only seven of the twenty-two "Nacido en el
-- Exterior" artists carry it, its definition is still an open editor decision,
-- and a man raised in Santo Domingo is the least obvious case to settle it on.
--
-- LEGAL NAME COMPLETED. Gabriel Enrique Ramírez Pagán. The row had first_name
-- Gabriel and last_name Pagán with no second surname -- Pagán is the second
-- surname, Ramírez the first, and the stage name uses the second. Same
-- arrangement as Frank Reyes and Kiko Rodríguez. sort_name stays "Pagán,
-- Gabriel".
--
-- THE ALIASES IN THE ROW TURN OUT TO BE THE KEY TO HIS AWARDS. It stored
-- "Gabriel" and "Gabriel Music", which look like noise until you read the 2018
-- Soberano winners' list, where the album of the year is credited to "Gabriel"
-- with no surname at all. He was billed under the single name for years. Both
-- aliases are kept, and they are the reason his awards are findable.
--
-- THREE AWARDS ESTABLISHED, ALL LOADED IN A SEPARATE MIGRATION.
--
--   Latin Grammy 2017, Mejor Álbum de Fusión Tropical, "Contra la corriente",
--   nominated. Listín Diario, 27 September 2017, "Once dominicanos son
--   nominados al Latin Grammy": "Gabriel 'Contra la corriente' obtuvo una
--   mención como Mejor Álbum de Fusión Tropical". Later press, including his own
--   channel, calls this "Álbum Tropical del Año", which is not a Latin Grammy
--   category. The newspaper naming the real one on the day the nominations came
--   out is what is used.
--
--   Premios Soberano 2018, Álbum del Año, "Contra la corriente", won. Five
--   outlets published the winners' list: Listín Diario, CDN, Teleradio América,
--   El Informante and El Sol de Santiago. All five credit it to "Gabriel".
--
--   Premios Soberano 2021, Espectáculo del Año, "Morisoñando", won -- renglón
--   2019, gala of 15 June 2021, the same double edition as Kiko Rodríguez's
--   bachata. N Digital's complete list names the producer as René Brea, and
--   elCaribe published video of him receiving it.
--
-- CLAIMS NOT LOADED. His own channel also claims Soberanos for Merengue del
-- Año, Colaboración del Año and Video del Año, and a Premios Heat for Mejor
-- Artista Tropical. No winners' list found names him in any of them. They are
-- not written into the entry and no rows are created. Self-declared awards get
-- the same treatment here as EverybodyWiki's claim on Esme's behalf did.
--
-- SOURCES: his own YouTube channel -- the About panel and thirty video titles.
-- His own Instagram, for "Artista | Productor | Creador Cultural" and the
-- identity framing. Listín Diario, 27 September 2017 and 21 March 2018.
-- Vanguardia del Pueblo and N Digital for the 2018 and 2021 winners' lists.
-- Diario Libre, 25 June 2018, for the Solo Te Veo remix. elCaribe's video of the
-- 2021 award. BuenaMusica's biography and Datos block. CMTV's biography.
-- N Digital, 25 March 2025, for No Era El Plan.
--
-- A SOURCE ERROR WORTH RECORDING: BuenaMusica calls Lápiz Conciente a
-- "dembowsero". He is a rapper, and the catalogue already has him filed
-- correctly. The rest of BuenaMusica's collaboration list was checked against
-- his own channel before use.
--
-- NOT WRITTEN: his marriage and his child, both of which BuenaMusica gives a
-- section to. Oriana Lucas appears here only as the credited voice on a record,
-- which is what she is in this context. No follower counts, no chart positions.
--
-- NOT LINKED: Olga Tañón and Elvis Crespo are Puerto Rican, Ozuna is Puerto
-- Rican, Marissa Mur is Mexican and Alan Saucedo is Mexican. La Luca, Piwaiti,
-- Sandypapo La Marca, Jayson Guzmán, Oriana Lucas, Pacha Massive and René Brea
-- have no entries; the Dominicans among them go on the missing list.
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
       name = 'Gabriel Pagán',
       sort_name = 'Pagán, Gabriel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = '1990-01-05',
       birth_year = 1990,
       date_of_death = NULL,
       birth_place = 'San Luis, Misuri',
       province = 'Nacido en el Exterior',
       first_name = 'Gabriel',
       middle_name = 'Enrique',
       last_name = 'Ramírez',
       second_last_name = 'Pagán',
       stage_name = 'Gabriel Pagán',
       aliases = ARRAY['Gabriel', 'Gabriel Music']::text[],
       occupations = '["composer","producer","musician"]'::jsonb,
       instruments = ARRAY['guitar', 'piano']::text[],
       genres = ARRAY['fusion-tropical', 'urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://www.soygabrielpagan.com',
       youtube = '@SoyGabrielPagan',
       facebook = 'SoyGabrielPagan',
       instagram = 'gabrielpagan',
       disambiguation = 'Merengue singer-songwriter and producer; Contra la Corriente, Morisoñando',
       bio_en = 'Gabriel Pagán is a Dominican singer, songwriter and record producer. He was born in Saint Louis, Missouri, to Dominican parents and grew up in Santo Domingo, he trained at Berklee, and he has spent his career trying to work out what merengue can be made to do next.

**Billed under one name**

For years he was simply Gabriel. The Soberano winners’ lists print it that way, with no surname, and the aliases follow him around the credits of that period.

The debut, Peripecia, was begun in 2012 and released the year after. Then in 2015 came Como Te Sueño Yo with Ilegales — a record that put a Berklee-trained arranger next to one of the loudest merengue-house groups the country has, which is the collision his whole catalogue is built out of.

**Contra la Corriente**

The second album is the one that changed his standing. It took the Soberano for album of the year, and the Latin Grammy nominated it for best tropical fusion album — a category that exists precisely for records that will not sit still inside a genre.

Solo Te Veo came off it, and the remix with Lápiz Conciente is a merengue with a rapper on it that a national newspaper covered on its own terms. He has done the same trick repeatedly: La Nota with Omega, Another Night with Proyecto Uno, Un Hombre Busca Una Mujer with Jossie Esteban y La Patrulla 15 — three generations of Dominican dance music, one at a time.

Quiéreme exists in three recorded versions — the original, a bachata, and a típico with an accordion player. That is not a promotional gimmick so much as a thesis: the song is separable from the rhythm, and a Dominican song can be carried by any of them.

**Morisoñando**

Morisoñando is a drink — orange juice and evaporated milk, sold on every Dominican corner — and he made it a live show and then a series of albums. The show won the Soberano for production of the year.

Naming a merengue project after a street drink is the same move as Made In RD and ¿Conoces República Dominicana?, two more of his titles. He has been building an argument about national identity out of ordinary domestic things rather than out of flags.

**Afromerengue**

The recent work goes by a name he uses himself: afromerengue, which points at the African rhythmic material underneath a genre usually sold as festive and light. Ella is filed under it outright.

No Era El Plan, his most recent album, is described as contemporary merengue, and the title is characteristic — a producer who trained abroad, came home, and keeps ending up back inside the country’s oldest popular form.

His own summary of what he does is three words: artist, producer, cultural creator. The third one is unusual for a merenguero to claim and he has earned it: the records, the show and the titles are all one argument about who the music belongs to.',
       bio_es = 'Gabriel Pagán es cantante, compositor y productor discográfico dominicano. Nació en Saint Louis, Misuri, de padres dominicanos, se crió en Santo Domingo, se formó en Berklee, y lleva la carrera entera averiguando qué más se le puede hacer al merengue.

**Anunciado con un solo nombre**

Durante años fue simplemente Gabriel. Las listas de ganadores del Soberano lo imprimen así, sin apellido, y los alias lo siguen por los créditos de esa época.

El debut, Peripecia, lo empezó en 2012 y lo sacó al año siguiente. Después, en 2015, llegó Como Te Sueño Yo con Ilegales: un disco que puso a un arreglista formado en Berklee al lado de uno de los grupos de merenhouse más ruidosos que tiene el país, que es exactamente el choque con el que está armado todo su catálogo.

**Contra la Corriente**

El segundo álbum es el que le cambió el lugar. Se llevó el Soberano al álbum del año, y el Latin Grammy lo nominó como mejor álbum de fusión tropical, una categoría que existe justamente para discos que no se quedan quietos dentro de un género.

De ahí salió Solo Te Veo, y el remix con Lápiz Conciente es un merengue con un rapero encima que un periódico nacional cubrió como noticia propia. La jugada la ha repetido: La Nota con Omega, Another Night con Proyecto Uno, Un Hombre Busca Una Mujer con Jossie Esteban y La Patrulla 15; tres generaciones de música bailable dominicana, de una en una.

Quiéreme existe en tres versiones grabadas: la original, una bachata y una típica con acordeón. Más que una maña de promoción es una tesis: la canción se puede separar del ritmo, y a una canción dominicana la puede cargar cualquiera de ellos.

**Morisoñando**

El morisoñando es una bebida —jugo de china con leche evaporada, que se vende en cualquier esquina dominicana— y él la convirtió en un espectáculo en vivo y después en una serie de álbumes. El espectáculo ganó el Soberano a producción del año.

Ponerle a un proyecto de merengue el nombre de una bebida de calle es la misma jugada de Made In RD y de ¿Conoces República Dominicana?, otros dos títulos suyos. Lleva rato construyendo un argumento sobre identidad nacional con cosas domésticas y corrientes, no con banderas.

**Afromerengue**

El trabajo reciente lleva un nombre que usa él mismo: afromerengue, que apunta al material rítmico africano que hay debajo de un género que suele venderse como festivo y liviano. Ella está fichada así de frente.

No Era El Plan, su álbum más reciente, se describe como merengue contemporáneo, y el título es característico: un productor que se formó afuera, volvió, y sigue terminando dentro de la forma popular más vieja del país.

El resumen que él hace de sí mismo son tres palabras: artista, productor, creador cultural. La tercera no es común que la reclame un merenguero y se la ha ganado: los discos, el espectáculo y los títulos son todos un mismo argumento sobre de quién es la música.',
       updated_at = now()
 WHERE slug = 'gabriel-pagan';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Gabriel Pagán is a Dominican singer, songwriter and record producer. He was born in Saint Louis, Missouri, to Dominican parents and grew up in Santo Domingo, he trained at Berklee, and he has spent his career trying to work out what merengue can be made to do next.","type":"text"}]},{"type":"paragraph","content":[{"text":"Billed under one name","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"For years he was simply Gabriel. The Soberano winners’ lists print it that way, with no surname, and the aliases follow him around the credits of that period.","type":"text"}]},{"type":"paragraph","content":[{"text":"The debut, Peripecia, was begun in 2012 and released the year after. Then in 2015 came Como Te Sueño Yo with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales","occurrenceId":"ec184e39-4609-492d-b6b1-e6e60ce2a0eb"}},{"text":" — a record that put a Berklee-trained arranger next to one of the loudest merengue-house groups the country has, which is the collision his whole catalogue is built out of.","type":"text"}]},{"type":"paragraph","content":[{"text":"Contra la Corriente","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The second album is the one that changed his standing. It took the Soberano for album of the year, and the Latin Grammy nominated it for best tropical fusion album — a category that exists precisely for records that will not sit still inside a genre.","type":"text"}]},{"type":"paragraph","content":[{"text":"Solo Te Veo came off it, and the remix with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"000ef7f7-e9af-46cf-ab62-baca95c22d0b"}},{"text":" is a merengue with a rapper on it that a national newspaper covered on its own terms. He has done the same trick repeatedly: La Nota with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6159dc70-bd8f-439d-bf17-5d690262e5cb","displayText":"Omega","occurrenceId":"a7a29a23-d211-4b5b-bfdc-90b94ea23419"}},{"text":", Another Night with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f838ab51-002f-4737-ab38-17f65beec9ab","displayText":"Proyecto Uno","occurrenceId":"daa92932-78a5-4951-af1c-2fa3704f09de"}},{"text":", Un Hombre Busca Una Mujer with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02b306b3-acc0-4800-b314-05683205d1c5","displayText":"Jossie Esteban y La Patrulla 15","occurrenceId":"51243cc3-33f8-4415-b754-9a99d4bfb356"}},{"text":" — three generations of Dominican dance music, one at a time.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quiéreme exists in three recorded versions — the original, a bachata, and a típico with an accordion player. That is not a promotional gimmick so much as a thesis: the song is separable from the rhythm, and a Dominican song can be carried by any of them.","type":"text"}]},{"type":"paragraph","content":[{"text":"Morisoñando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Morisoñando is a drink — orange juice and evaporated milk, sold on every Dominican corner — and he made it a live show and then a series of albums. The show won the Soberano for production of the year.","type":"text"}]},{"type":"paragraph","content":[{"text":"Naming a merengue project after a street drink is the same move as Made In RD and ¿Conoces República Dominicana?, two more of his titles. He has been building an argument about national identity out of ordinary domestic things rather than out of flags.","type":"text"}]},{"type":"paragraph","content":[{"text":"Afromerengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The recent work goes by a name he uses himself: afromerengue, which points at the African rhythmic material underneath a genre usually sold as festive and light. Ella is filed under it outright.","type":"text"}]},{"type":"paragraph","content":[{"text":"No Era El Plan, his most recent album, is described as contemporary merengue, and the title is characteristic — a producer who trained abroad, came home, and keeps ending up back inside the country’s oldest popular form.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own summary of what he does is three words: artist, producer, cultural creator. The third one is unusual for a merenguero to claim and he has earned it: the records, the show and the titles are all one argument about who the music belongs to.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'gabriel-pagan'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Gabriel Pagán es cantante, compositor y productor discográfico dominicano. Nació en Saint Louis, Misuri, de padres dominicanos, se crió en Santo Domingo, se formó en Berklee, y lleva la carrera entera averiguando qué más se le puede hacer al merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Anunciado con un solo nombre","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Durante años fue simplemente Gabriel. Las listas de ganadores del Soberano lo imprimen así, sin apellido, y los alias lo siguen por los créditos de esa época.","type":"text"}]},{"type":"paragraph","content":[{"text":"El debut, Peripecia, lo empezó en 2012 y lo sacó al año siguiente. Después, en 2015, llegó Como Te Sueño Yo con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales","occurrenceId":"d2c2ff56-95cc-4385-8048-c77ba80eb721"}},{"text":": un disco que puso a un arreglista formado en Berklee al lado de uno de los grupos de merenhouse más ruidosos que tiene el país, que es exactamente el choque con el que está armado todo su catálogo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Contra la Corriente","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El segundo álbum es el que le cambió el lugar. Se llevó el Soberano al álbum del año, y el Latin Grammy lo nominó como mejor álbum de fusión tropical, una categoría que existe justamente para discos que no se quedan quietos dentro de un género.","type":"text"}]},{"type":"paragraph","content":[{"text":"De ahí salió Solo Te Veo, y el remix con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"3464d18d-8d98-4952-aed8-d05c063657db"}},{"text":" es un merengue con un rapero encima que un periódico nacional cubrió como noticia propia. La jugada la ha repetido: La Nota con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6159dc70-bd8f-439d-bf17-5d690262e5cb","displayText":"Omega","occurrenceId":"f9679666-a437-48bb-a456-b458a7e09e83"}},{"text":", Another Night con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f838ab51-002f-4737-ab38-17f65beec9ab","displayText":"Proyecto Uno","occurrenceId":"99c46735-b4dc-4e9c-8e92-9c87115c2e4a"}},{"text":", Un Hombre Busca Una Mujer con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02b306b3-acc0-4800-b314-05683205d1c5","displayText":"Jossie Esteban y La Patrulla 15","occurrenceId":"6e410502-f828-41d0-81f5-33da17dbea74"}},{"text":"; tres generaciones de música bailable dominicana, de una en una.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quiéreme existe en tres versiones grabadas: la original, una bachata y una típica con acordeón. Más que una maña de promoción es una tesis: la canción se puede separar del ritmo, y a una canción dominicana la puede cargar cualquiera de ellos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Morisoñando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El morisoñando es una bebida —jugo de china con leche evaporada, que se vende en cualquier esquina dominicana— y él la convirtió en un espectáculo en vivo y después en una serie de álbumes. El espectáculo ganó el Soberano a producción del año.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ponerle a un proyecto de merengue el nombre de una bebida de calle es la misma jugada de Made In RD y de ¿Conoces República Dominicana?, otros dos títulos suyos. Lleva rato construyendo un argumento sobre identidad nacional con cosas domésticas y corrientes, no con banderas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Afromerengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El trabajo reciente lleva un nombre que usa él mismo: afromerengue, que apunta al material rítmico africano que hay debajo de un género que suele venderse como festivo y liviano. Ella está fichada así de frente.","type":"text"}]},{"type":"paragraph","content":[{"text":"No Era El Plan, su álbum más reciente, se describe como merengue contemporáneo, y el título es característico: un productor que se formó afuera, volvió, y sigue terminando dentro de la forma popular más vieja del país.","type":"text"}]},{"type":"paragraph","content":[{"text":"El resumen que él hace de sí mismo son tres palabras: artista, productor, creador cultural. La tercera no es común que la reclame un merenguero y se la ha ganado: los discos, el espectáculo y los títulos son todos un mismo argumento sobre de quién es la música.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'gabriel-pagan'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'en'), '000ef7f7-e9af-46cf-ab62-baca95c22d0b', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'en'), '51243cc3-33f8-4415-b754-9a99d4bfb356', 'artist', '02b306b3-acc0-4800-b314-05683205d1c5');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'en'), 'a7a29a23-d211-4b5b-bfdc-90b94ea23419', 'artist', '6159dc70-bd8f-439d-bf17-5d690262e5cb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'en'), 'daa92932-78a5-4951-af1c-2fa3704f09de', 'artist', 'f838ab51-002f-4737-ab38-17f65beec9ab');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'en'), 'ec184e39-4609-492d-b6b1-e6e60ce2a0eb', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'es'), '3464d18d-8d98-4952-aed8-d05c063657db', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'es'), '6e410502-f828-41d0-81f5-33da17dbea74', 'artist', '02b306b3-acc0-4800-b314-05683205d1c5');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'es'), '99c46735-b4dc-4e9c-8e92-9c87115c2e4a', 'artist', 'f838ab51-002f-4737-ab38-17f65beec9ab');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'es'), 'd2c2ff56-95cc-4385-8048-c77ba80eb721', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'gabriel-pagan') AND locale = 'es'), 'f9679666-a437-48bb-a456-b458a7e09e83', 'artist', '6159dc70-bd8f-439d-bf17-5d690262e5cb');

COMMIT;
