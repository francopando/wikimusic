BEGIN;

-- Rewrite the catalogue entry for José Manuel Calderón.
--
-- Jose Manuel Calderon. The man who recorded the first bachata had a 1,339-
-- character biography with no dates, no song titles, no labels, no places and
-- no people in it -- and no Spanish document at all. It also contradicted his
-- own record on where he was born.
--
-- BIRTHPLACE CORRECTED from El Seibo to Las Charcas, Azua, and the province
-- with it. This one needed untangling, because four different places circulate:
--   - The Ministerio de Cultura settles it: "nacio en Las Charcas, Azua, en
--     1941, pero se crio en San Pedro de Macoris." Spanish Wikipedia's body
--     agrees, as do the French and Colombian mirrors of it.
--   - San Pedro de Macoris is what most sources give, including the Diccionario
--     Cultural Dominicano, iASO Records and his own Facebook page. It is where
--     his mother was from and where he lived until about ten, and it is what he
--     identifies with -- but it is not where he was born.
--   - El Seibo, which the row held, appears only in a Wikipedia category and in
--     one garbled social post that also names Azua in the same sentence.
--   - The old biography in this catalogue said Santo Domingo, which no source
--     supports at all.
-- Both facts are in the prose, so the record no longer contradicts itself.
--
-- SOURCES: iASO Records' artist essay by David Wayne, which is the fullest
-- account in English -- the 30 May 1962 session at Radiotelevision Dominicana,
-- the baritone compared to Pedro Infante, the guira in place of maracas from
-- the first day, "Por Seguirte" with Johnny Ventura's orchestra in 1966, Felipe
-- Rodriguez promoting "Llanto a la Luna", the four classics of the following
-- year, the forty-two singles, Kubaney, the 1967 move to New York with BMC and
-- with his lead guitarist Andres Rodriguez, the Puerto Rican bolero circuit and
-- its theatres, the 1972 return to a marginalised genre played only on Radio
-- Guarachita, the barroom songs of that period, Washington Heights and El
-- Internacional. Spanish Wikipedia's article on the musician for the birth, the
-- parents, the Kubaney producer Mateo San Martin, the sixty-plus productions,
-- the 2009 Casandra al Merito, the 2017 album "Payaso" and the discography with
-- years. The Ministerio de Cultura for the birthplace. Diario Libre, 21 March
-- 2024, for the Bulevar de las Estrellas. El Nuevo Diario, 28 May 2019, for the
-- Chamber of Deputies naming him an ambassador of bachata. Listin Diario, 23
-- August 2019, and Diario Libre, 16 August 2019, for the authorised biography.
-- Gazcue Es Arte's reprint of Diario Libre for Trio Los Juveniles.
--
-- NOT LINKED: Luis Pimentel, who played second guitar on those first records
-- and whose entry was written today. He is still needs_review, and a reference
-- to an unpublished artist renders as dead text. Worth linking both ways once
-- he is published.
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
       name = 'José Manuel Calderón',
       sort_name = 'Calderón, José Manuel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1941-08-09',
       birth_year = 1941,
       date_of_death = NULL,
       birth_place = 'Las Charcas',
       province = 'Azua',
       first_name = 'José',
       middle_name = 'Manuel',
       last_name = 'Calderón',
       second_last_name = NULL,
       stage_name = 'José Manuel Calderón',
       aliases = ARRAY['El Pionero de la Bachata', 'El Primer Bachatero']::text[],
       occupations = '["composer","guitarist","songwriter"]'::jsonb,
       instruments = ARRAY['voice', 'guitar']::text[],
       genres = ARRAY['bolero']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = '@CalderonBachata',
       facebook = '100063809615923',
       instagram = NULL,
       disambiguation = 'Dominican singer born 1941; recorded the first bachata on 30 May 1962',
       bio_en = 'José Manuel Calderón, born on 9 August 1941, is the Dominican singer, guitarist and composer who made the first bachata record. He was born in Las Charcas, in Azua, and raised in San Pedro de Macorís, his mother’s town, which is the place he has always identified with.

**The thirtieth of May**

On 30 May 1962, weeks after the fall of Trujillo, he recorded Condena and Borracho de Amor in the studios of Radiotelevisión Dominicana. Those two sides are where bachata begins as something recorded rather than merely played.

He was not alone in the room. He had formed Trío Los Juveniles with Andrés Rodríguez on first guitar and Luís Pimentel on second, and it is their playing on the record. Bienvenido Fabián wrote Qué Será de Mí, which he cut in the same period.

His mother, Hilda Fé Carbuccia, played guitar and sang, and she gave him his first one. His father was Luis María Calderón Peña.

**What it actually sounded like**

The music was closer to bolero than to the two-guitar bachata that came later. He sang in a rich baritone, nearer to Pedro Infante than to the high, breaking tenor most bachateros would use, and his arrangements carried strings, horns and piano.

One thing in it was entirely his own and entirely Dominican: he marked time with the güira rather than the maracas, and he did so from the very first session. That single substitution is one of the things that separates bachata from the Cuban and Mexican bolero it grew out of.

Because it was heard as bolero, it carried none of the shame that would later attach to the genre. The public and his fellow musicians received it as respectable music, which is a position no bachatero after him would occupy for thirty years.

**The years of the classics**

In the twelve months after that first session he released four singles that became permanent: Quema Esas Cartas, Lágrimas de Sangre, Serpiente Humana and Llanto a la Luna. By his own account, forty-two consecutive singles followed and every one of them was a hit.

In 1966 he recorded Por Seguirte backed by Johnny Ventura’s orchestra. The Puerto Rican bolero singer Felipe Rodríguez took up Llanto a la Luna and pushed it, and the two became lifelong friends; their voices were close enough that the association made sense to everybody.

The Cuban producer Mateo San Martín signed him to Kubaney after watching him work in Puerto Rico and at home, and he made five records for the label. Working before bachata was cast out, he had access to international labels that no bachatero of the next generation would get.

**New York, twice**

In 1967 he went to New York to record for BMC and stayed, taking his lead guitarist Andrés Rodríguez with him. For five years he worked a scene built around Puerto Rican boleristas — Felipe Rodríguez, Blanca Iris Villafañe, Tommy Figueroa, Odilio González — playing the Teatro Riopiedras, the Teatro Jefferson and the Teatro Puerto Rico.

He came home in 1972 to a country that had changed its mind about his music. Bachata had been pushed to the margins, tied in the public imagination to poverty and the brothel, and one station in the whole country played it: Radio Guarachita.

He was reclassified along with everybody else, and his songs moved with the genre — La Saqué de la Barra and Bebiendo en la Barra tell the story of the bar and the barrio the way his contemporaries’ did. They sold, but they never became what the early records had been.

So he went back to New York, and watched a Dominican community take shape in Washington Heights and grow a bachata scene of its own. Where he had once played to Puerto Ricans beside Odilio González, he now played El Internacional to Dominicans.

**What the record shows**

More than sixty productions carry his name, and he still records and distributes them himself. Payasó came in 2017. Víctor Víctor and Wilfrido Vargas have both recorded his songs.

The Casandra al Mérito came in 2009. In 2019 the Chamber of Deputies named him an ambassador of bachata, and an authorised biography of him was published the same year. In March 2024 he was set into the Bulevar de las Estrellas alongside Luis Segura and Leonardo Paniagua.

The argument over who fathered bachata will not end, and it should not: Luis Segura shaped how it is sung, Edilio Paredes shaped how it is played, and Cuco Valoy carried it as promoter, broadcaster and artist at once. But the question of who recorded the first one is not an argument. It was him, and the date is 30 May 1962.',
       bio_es = 'José Manuel Calderón, nacido el 9 de agosto de 1941, es el cantante, guitarrista y compositor dominicano que grabó la primera bachata. Nació en Las Charcas, en Azua, y se crió en San Pedro de Macorís, el pueblo de su madre, que es el lugar con el que siempre se ha identificado.

**El treinta de mayo**

El 30 de mayo de 1962, semanas después de la caída de Trujillo, grabó Condena y Borracho de Amor en los estudios de Radiotelevisión Dominicana. Esas dos caras son donde la bachata empieza a existir como algo grabado y no solamente tocado.

No estaba solo en el cuarto. Había formado el Trío Los Juveniles con Andrés Rodríguez en la primera guitarra y Luís Pimentel en la segunda, y lo que suena en el disco es lo que ellos tocaron. Bienvenido Fabián escribió Qué Será de Mí, que grabó en el mismo período.

Su madre, Hilda Fé Carbuccia, tocaba guitarra y cantaba, y fue quien le dio la primera. Su padre era Luis María Calderón Peña.

**A qué sonaba en realidad**

La música estaba más cerca del bolero que de la bachata de dos guitarras que vino después. Cantaba con un barítono lleno, más cerca de Pedro Infante que del tenor alto y quebrado que usarían casi todos los bachateros, y sus arreglos llevaban cuerdas, metales y piano.

Una cosa dentro de aquello era enteramente suya y enteramente dominicana: marcaba el tiempo con la güira y no con las maracas, y lo hizo desde la primerísima sesión. Esa sola sustitución es una de las cosas que separan a la bachata del bolero cubano y mexicano del que salió.

Como se oía como bolero, no cargó nada de la vergüenza que después se le pegaría al género. El público y sus propios colegas la recibieron como música respetable, que es una posición que ningún bachatero después de él ocuparía durante treinta años.

**Los años de los clásicos**

En los doce meses siguientes a aquella primera sesión sacó cuatro sencillos que se quedaron para siempre: Quema Esas Cartas, Lágrimas de Sangre, Serpiente Humana y Llanto a la Luna. Según él mismo, después vinieron cuarenta y dos sencillos seguidos y todos pegaron.

En 1966 grabó Por Seguirte acompañado por la orquesta de Johnny Ventura. El bolerista puertorriqueño Felipe Rodríguez cogió Llanto a la Luna y la empujó, y los dos se hicieron amigos de por vida; sus voces se parecían lo bastante como para que la asociación le hiciera sentido a todo el mundo.

El productor cubano Mateo San Martín lo firmó para Kubaney tras verlo trabajar en Puerto Rico y aquí, y le hizo cinco discos al sello. Trabajando antes de que a la bachata la echaran afuera, tuvo acceso a sellos internacionales que ningún bachatero de la generación siguiente conseguiría.

**Nueva York, dos veces**

En 1967 se fue a Nueva York a grabar para BMC y se quedó, llevándose a su primera guitarra, Andrés Rodríguez. Durante cinco años trabajó en una escena armada alrededor de boleristas puertorriqueños —Felipe Rodríguez, Blanca Iris Villafañe, Tommy Figueroa, Odilio González— tocando el Teatro Riopiedras, el Teatro Jefferson y el Teatro Puerto Rico.

Volvió en 1972 a un país que había cambiado de opinión sobre su música. A la bachata la habían empujado al margen, atada en la cabeza de la gente a la pobreza y al burdel, y una sola emisora en todo el país la ponía: Radio Guarachita.

A él lo reclasificaron junto con todos los demás, y sus canciones se movieron con el género: La Saqué de la Barra y Bebiendo en la Barra cuentan la historia de la barra y del barrio igual que la contaban las de sus contemporáneos. Vendieron, pero nunca llegaron a ser lo que habían sido los discos primeros.

Así que se volvió a Nueva York, y vio formarse una comunidad dominicana en Washington Heights y crecer allí una escena de bachata propia. Donde antes había tocado para puertorriqueños al lado de Odilio González, ahora tocaba El Internacional para dominicanos.

**Lo que queda registrado**

Más de sesenta producciones llevan su nombre, y todavía las graba y las distribuye él mismo. Payasó salió en 2017. Víctor Víctor y Wilfrido Vargas han grabado canciones suyas.

El Casandra al Mérito le llegó en 2009. En 2019 la Cámara de Diputados lo declaró embajador de la bachata, y ese mismo año se publicó una biografía autorizada suya. En marzo de 2024 lo pusieron en el Bulevar de las Estrellas junto a Luis Segura y a Leonardo Paniagua.

La discusión sobre quién es el padre de la bachata no se va a acabar, y está bien que no: Luis Segura definió cómo se canta, Edilio Paredes definió cómo se toca, y Cuco Valoy la cargó como promotor, locutor y artista al mismo tiempo. Pero la pregunta de quién grabó la primera no es una discusión. Fue él, y la fecha es el 30 de mayo de 1962.',
       updated_at = now()
 WHERE slug = 'jose-manuel-calderon';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"José Manuel Calderón, born on 9 August 1941, is the Dominican singer, guitarist and composer who made the first bachata record. He was born in Las Charcas, in Azua, and raised in San Pedro de Macorís, his mother’s town, which is the place he has always identified with.","type":"text"}]},{"type":"paragraph","content":[{"text":"The thirtieth of May","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"On 30 May 1962, weeks after the fall of Trujillo, he recorded Condena and Borracho de Amor in the studios of Radiotelevisión Dominicana. Those two sides are where bachata begins as something recorded rather than merely played.","type":"text"}]},{"type":"paragraph","content":[{"text":"He was not alone in the room. He had formed Trío Los Juveniles with Andrés Rodríguez on first guitar and Luís Pimentel on second, and it is their playing on the record. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4b85d1eb-ebaa-42b5-9901-5e2805af9138","displayText":"Bienvenido Fabián","occurrenceId":"9b9a28a1-2684-4eb6-b88a-6cbfa66b3e1a"}},{"text":" wrote Qué Será de Mí, which he cut in the same period.","type":"text"}]},{"type":"paragraph","content":[{"text":"His mother, Hilda Fé Carbuccia, played guitar and sang, and she gave him his first one. His father was Luis María Calderón Peña.","type":"text"}]},{"type":"paragraph","content":[{"text":"What it actually sounded like","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The music was closer to bolero than to the two-guitar bachata that came later. He sang in a rich baritone, nearer to Pedro Infante than to the high, breaking tenor most bachateros would use, and his arrangements carried strings, horns and piano.","type":"text"}]},{"type":"paragraph","content":[{"text":"One thing in it was entirely his own and entirely Dominican: he marked time with the güira rather than the maracas, and he did so from the very first session. That single substitution is one of the things that separates bachata from the Cuban and Mexican bolero it grew out of.","type":"text"}]},{"type":"paragraph","content":[{"text":"Because it was heard as bolero, it carried none of the shame that would later attach to the genre. The public and his fellow musicians received it as respectable music, which is a position no bachatero after him would occupy for thirty years.","type":"text"}]},{"type":"paragraph","content":[{"text":"The years of the classics","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In the twelve months after that first session he released four singles that became permanent: Quema Esas Cartas, Lágrimas de Sangre, Serpiente Humana and Llanto a la Luna. By his own account, forty-two consecutive singles followed and every one of them was a hit.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 1966 he recorded Por Seguirte backed by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"5021a761-71a5-4a75-b39f-639e6d7aa305"}},{"text":"’s orchestra. The Puerto Rican bolero singer Felipe Rodríguez took up Llanto a la Luna and pushed it, and the two became lifelong friends; their voices were close enough that the association made sense to everybody.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Cuban producer Mateo San Martín signed him to Kubaney after watching him work in Puerto Rico and at home, and he made five records for the label. Working before bachata was cast out, he had access to international labels that no bachatero of the next generation would get.","type":"text"}]},{"type":"paragraph","content":[{"text":"New York, twice","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 1967 he went to New York to record for BMC and stayed, taking his lead guitarist Andrés Rodríguez with him. For five years he worked a scene built around Puerto Rican boleristas — Felipe Rodríguez, Blanca Iris Villafañe, Tommy Figueroa, Odilio González — playing the Teatro Riopiedras, the Teatro Jefferson and the Teatro Puerto Rico.","type":"text"}]},{"type":"paragraph","content":[{"text":"He came home in 1972 to a country that had changed its mind about his music. Bachata had been pushed to the margins, tied in the public imagination to poverty and the brothel, and one station in the whole country played it: Radio Guarachita.","type":"text"}]},{"type":"paragraph","content":[{"text":"He was reclassified along with everybody else, and his songs moved with the genre — La Saqué de la Barra and Bebiendo en la Barra tell the story of the bar and the barrio the way his contemporaries’ did. They sold, but they never became what the early records had been.","type":"text"}]},{"type":"paragraph","content":[{"text":"So he went back to New York, and watched a Dominican community take shape in Washington Heights and grow a bachata scene of its own. Where he had once played to Puerto Ricans beside Odilio González, he now played El Internacional to Dominicans.","type":"text"}]},{"type":"paragraph","content":[{"text":"What the record shows","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"More than sixty productions carry his name, and he still records and distributes them himself. Payasó came in 2017. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3","displayText":"Víctor Víctor","occurrenceId":"952c13b4-3837-4785-ae90-7122377e6e72"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"6856a07a-95bb-490d-8432-1699dcebc8e9"}},{"text":" have both recorded his songs.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Casandra al Mérito came in 2009. In 2019 the Chamber of Deputies named him an ambassador of bachata, and an authorised biography of him was published the same year. In March 2024 he was set into the Bulevar de las Estrellas alongside ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"e6e13ee4-55cf-4f27-b9bb-c0bdfc278bcd"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"31915623-3206-4052-b13a-2170226671b9","displayText":"Leonardo Paniagua","occurrenceId":"33ea07cc-511c-4c1f-8a9e-485c98564658"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"The argument over who fathered bachata will not end, and it should not: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"d0cfd9a4-758c-48a8-aca9-b0912a4317bb"}},{"text":" shaped how it is sung, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cbda65a4-c7da-4762-8cf8-f29b942d2ac3","displayText":"Edilio Paredes","occurrenceId":"2d71f88b-ee32-4a34-ab30-6d31d8de09e8"}},{"text":" shaped how it is played, and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c11c2dda-ffa1-4f09-9d24-00dc4473bc8d","displayText":"Cuco Valoy","occurrenceId":"fcca01cb-a998-4995-82a3-7041de770d98"}},{"text":" carried it as promoter, broadcaster and artist at once. But the question of who recorded the first one is not an argument. It was him, and the date is 30 May 1962.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"José Manuel Calderón, nacido el 9 de agosto de 1941, es el cantante, guitarrista y compositor dominicano que grabó la primera bachata. Nació en Las Charcas, en Azua, y se crió en San Pedro de Macorís, el pueblo de su madre, que es el lugar con el que siempre se ha identificado.","type":"text"}]},{"type":"paragraph","content":[{"text":"El treinta de mayo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El 30 de mayo de 1962, semanas después de la caída de Trujillo, grabó Condena y Borracho de Amor en los estudios de Radiotelevisión Dominicana. Esas dos caras son donde la bachata empieza a existir como algo grabado y no solamente tocado.","type":"text"}]},{"type":"paragraph","content":[{"text":"No estaba solo en el cuarto. Había formado el Trío Los Juveniles con Andrés Rodríguez en la primera guitarra y Luís Pimentel en la segunda, y lo que suena en el disco es lo que ellos tocaron. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4b85d1eb-ebaa-42b5-9901-5e2805af9138","displayText":"Bienvenido Fabián","occurrenceId":"d26de251-83f8-4a0c-8eb9-213354271d3e"}},{"text":" escribió Qué Será de Mí, que grabó en el mismo período.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su madre, Hilda Fé Carbuccia, tocaba guitarra y cantaba, y fue quien le dio la primera. Su padre era Luis María Calderón Peña.","type":"text"}]},{"type":"paragraph","content":[{"text":"A qué sonaba en realidad","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La música estaba más cerca del bolero que de la bachata de dos guitarras que vino después. Cantaba con un barítono lleno, más cerca de Pedro Infante que del tenor alto y quebrado que usarían casi todos los bachateros, y sus arreglos llevaban cuerdas, metales y piano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una cosa dentro de aquello era enteramente suya y enteramente dominicana: marcaba el tiempo con la güira y no con las maracas, y lo hizo desde la primerísima sesión. Esa sola sustitución es una de las cosas que separan a la bachata del bolero cubano y mexicano del que salió.","type":"text"}]},{"type":"paragraph","content":[{"text":"Como se oía como bolero, no cargó nada de la vergüenza que después se le pegaría al género. El público y sus propios colegas la recibieron como música respetable, que es una posición que ningún bachatero después de él ocuparía durante treinta años.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los años de los clásicos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En los doce meses siguientes a aquella primera sesión sacó cuatro sencillos que se quedaron para siempre: Quema Esas Cartas, Lágrimas de Sangre, Serpiente Humana y Llanto a la Luna. Según él mismo, después vinieron cuarenta y dos sencillos seguidos y todos pegaron.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 1966 grabó Por Seguirte acompañado por la orquesta de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"73ecb1ae-282b-4543-b647-2fbd1d45c132"}},{"text":". El bolerista puertorriqueño Felipe Rodríguez cogió Llanto a la Luna y la empujó, y los dos se hicieron amigos de por vida; sus voces se parecían lo bastante como para que la asociación le hiciera sentido a todo el mundo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El productor cubano Mateo San Martín lo firmó para Kubaney tras verlo trabajar en Puerto Rico y aquí, y le hizo cinco discos al sello. Trabajando antes de que a la bachata la echaran afuera, tuvo acceso a sellos internacionales que ningún bachatero de la generación siguiente conseguiría.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nueva York, dos veces","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1967 se fue a Nueva York a grabar para BMC y se quedó, llevándose a su primera guitarra, Andrés Rodríguez. Durante cinco años trabajó en una escena armada alrededor de boleristas puertorriqueños —Felipe Rodríguez, Blanca Iris Villafañe, Tommy Figueroa, Odilio González— tocando el Teatro Riopiedras, el Teatro Jefferson y el Teatro Puerto Rico.","type":"text"}]},{"type":"paragraph","content":[{"text":"Volvió en 1972 a un país que había cambiado de opinión sobre su música. A la bachata la habían empujado al margen, atada en la cabeza de la gente a la pobreza y al burdel, y una sola emisora en todo el país la ponía: Radio Guarachita.","type":"text"}]},{"type":"paragraph","content":[{"text":"A él lo reclasificaron junto con todos los demás, y sus canciones se movieron con el género: La Saqué de la Barra y Bebiendo en la Barra cuentan la historia de la barra y del barrio igual que la contaban las de sus contemporáneos. Vendieron, pero nunca llegaron a ser lo que habían sido los discos primeros.","type":"text"}]},{"type":"paragraph","content":[{"text":"Así que se volvió a Nueva York, y vio formarse una comunidad dominicana en Washington Heights y crecer allí una escena de bachata propia. Donde antes había tocado para puertorriqueños al lado de Odilio González, ahora tocaba El Internacional para dominicanos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que queda registrado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Más de sesenta producciones llevan su nombre, y todavía las graba y las distribuye él mismo. Payasó salió en 2017. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3","displayText":"Víctor Víctor","occurrenceId":"9e10ab4c-6870-40d1-8f13-43d51e5a50c6"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"f8874c02-fa39-4e4c-97a2-a196b9a743da"}},{"text":" han grabado canciones suyas.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Casandra al Mérito le llegó en 2009. En 2019 la Cámara de Diputados lo declaró embajador de la bachata, y ese mismo año se publicó una biografía autorizada suya. En marzo de 2024 lo pusieron en el Bulevar de las Estrellas junto a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"1232a320-4834-4e11-a445-7c669943ae11"}},{"text":" y a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"31915623-3206-4052-b13a-2170226671b9","displayText":"Leonardo Paniagua","occurrenceId":"ec4f9f9a-7218-4468-a8c0-174168cda7e7"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"La discusión sobre quién es el padre de la bachata no se va a acabar, y está bien que no: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"6d31f0ab-d3f7-45cf-8601-d52dca8e1a1d"}},{"text":" definió cómo se canta, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cbda65a4-c7da-4762-8cf8-f29b942d2ac3","displayText":"Edilio Paredes","occurrenceId":"baf85ccd-afd2-4c0a-b2da-7b8d288093d3"}},{"text":" definió cómo se toca, y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c11c2dda-ffa1-4f09-9d24-00dc4473bc8d","displayText":"Cuco Valoy","occurrenceId":"87599b6b-1745-4403-a512-f4dce4762f82"}},{"text":" la cargó como promotor, locutor y artista al mismo tiempo. Pero la pregunta de quién grabó la primera no es una discusión. Fue él, y la fecha es el 30 de mayo de 1962.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'en'), '2d71f88b-ee32-4a34-ab30-6d31d8de09e8', 'artist', 'cbda65a4-c7da-4762-8cf8-f29b942d2ac3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'en'), '33ea07cc-511c-4c1f-8a9e-485c98564658', 'artist', '31915623-3206-4052-b13a-2170226671b9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'en'), '5021a761-71a5-4a75-b39f-639e6d7aa305', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'en'), '6856a07a-95bb-490d-8432-1699dcebc8e9', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'en'), '952c13b4-3837-4785-ae90-7122377e6e72', 'artist', '4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'en'), '9b9a28a1-2684-4eb6-b88a-6cbfa66b3e1a', 'artist', '4b85d1eb-ebaa-42b5-9901-5e2805af9138');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'en'), 'd0cfd9a4-758c-48a8-aca9-b0912a4317bb', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'en'), 'e6e13ee4-55cf-4f27-b9bb-c0bdfc278bcd', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'en'), 'fcca01cb-a998-4995-82a3-7041de770d98', 'artist', 'c11c2dda-ffa1-4f09-9d24-00dc4473bc8d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'es'), '1232a320-4834-4e11-a445-7c669943ae11', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'es'), '6d31f0ab-d3f7-45cf-8601-d52dca8e1a1d', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'es'), '73ecb1ae-282b-4543-b647-2fbd1d45c132', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'es'), '87599b6b-1745-4403-a512-f4dce4762f82', 'artist', 'c11c2dda-ffa1-4f09-9d24-00dc4473bc8d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'es'), '9e10ab4c-6870-40d1-8f13-43d51e5a50c6', 'artist', '4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'es'), 'baf85ccd-afd2-4c0a-b2da-7b8d288093d3', 'artist', 'cbda65a4-c7da-4762-8cf8-f29b942d2ac3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'es'), 'd26de251-83f8-4a0c-8eb9-213354271d3e', 'artist', '4b85d1eb-ebaa-42b5-9901-5e2805af9138');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'es'), 'ec4f9f9a-7218-4468-a8c0-174168cda7e7', 'artist', '31915623-3206-4052-b13a-2170226671b9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jose-manuel-calderon') AND locale = 'es'), 'f8874c02-fa39-4e4c-97a2-a196b9a743da', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

COMMIT;
