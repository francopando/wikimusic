BEGIN;

-- Create the catalogue entry for Pedro Samuel Rodríguez.
--
-- Pedro Samuel Rodríguez. Ficha nueva. Salió de la de Joaquín Balaguer y resultó
-- ser bastante más que un intérprete de ese corpus.
--
-- QUÉ ES, Y NO ES LO QUE PARECÍA. Entró en la lista como "el que musicaliza los
-- poemas de Balaguer". Mirando su canal, lo de Balaguer es una parte de un
-- proyecto más ancho y más raro: musicaliza POESÍA, y la escoge de donde sea. En
-- sus subidas hay poemas de Balaguer -- "A un niño inválido", "La belleza de las
-- mujeres feas" --, de Virgilio Díaz Ordóñez, de Elisa Reyes, de Carmen Sánchez,
-- de la poeta austríaca Angélica Becker y un soneto de Shakespeare. Eso es un
-- oficio con forma propia, no un encargo.
--
-- EL CRÉDITO DURO. Apple Music, Shazam y Qobuz coinciden en los compositores de
-- "Romanticismo", en el disco "Soy Un Hombre Feliz" de Fernando Villalona (17 de
-- diciembre de 1996): Joaquin Balaguer y Pedro S. Rodriguez. Es metadato de
-- derechos en tres plataformas, que es la mejor evidencia disponible para esto.
--
-- EL NOMBRE COMPLETO viene de Wikimedia Commons, que tiene un retrato suyo
-- descrito como "Pedro Samuel Rodríguez-Reyes. Author. Essayist. Musician.
-- Composer. Dominican Republic". De ahí salen el segundo apellido y el hecho de
-- que se presenta a la vez como escritor y como músico.
--
-- LA OTRA MITAD DEL OFICIO. Firma ensayo. Le mandó a la Academia Dominicana de la
-- Lengua unos "Apuntes para el estudio de un posible origen portugués de la 'i'
-- cibaeña", y llevó durante años dos bitácoras propias. Va en la ficha porque
-- explica el proyecto musical: quien se pone a rastrear el origen de una vocal
-- del Cibao es el mismo que se pone a musicalizar sonetos.
--
-- CAMPOS QUE QUEDAN VACÍOS A PROPÓSITO. No hay fecha ni año de nacimiento, ni
-- provincia, ni lugar. Nada de lo consultado los da, y la fotografía de Commons
-- lleva fecha de 1989 sin decir su edad. No se inventan. ended queda en false: no
-- hay ninguna señal de muerte, y esta semana quedó claro lo que cuesta suponer en
-- esa dirección.
--
-- NO SE ESCRIBEN CIFRAS de suscriptores ni de reproducciones, aunque el canal las
-- tiene y alguna es grande.
--
-- UNA COINCIDENCIA QUE NO SE AFIRMA COMO RELACIÓN. Aparece como invitado en las
-- tertulias sobre la criolla alrededor de Fernando Casado -- Hoy, enero de 2006, y
-- la tertulia "Jueves de la República". Casado es el número cuatro de la lista de
-- prioridad y todavía no tiene ficha, así que aquí solo se deja dicho el ambiente,
-- sin enlace y sin afirmar trato entre ellos.
--
-- FUENTES: los créditos de Apple Music, Shazam y Qobuz. Wikimedia Commons. Su
-- propio canal de YouTube y los títulos de sus subidas. N Digital, 15 de julio de
-- 2021, para "Melancolía otoñal" y "Alma de mujer" y para los libros de los que
-- salen. Hoy Digital, 17 de enero de 2006. Su bitácora orbe15.
--
-- NOMBRES NUEVOS PARA LA LISTA: Virgilio Díaz Ordóñez, Elisa Reyes y Carmen
-- Sánchez, los tres poetas dominicanos que ha musicalizado y ninguno en la base
-- -- comprobado, y los tres daban falso positivo por apellido. Angélica Becker es
-- austríaca y no entra.
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
       name = 'Pedro Samuel Rodríguez',
       sort_name = 'Rodríguez Reyes, Pedro Samuel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'composer',
       primary_genre = 'ballads',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Pedro',
       middle_name = 'Samuel',
       last_name = 'Rodríguez',
       second_last_name = 'Reyes',
       stage_name = 'Pedro Samuel Rodríguez',
       aliases = ARRAY['Pedro Samuel Rodríguez-Reyes', 'P. S. Rodz']::text[],
       occupations = '["singer","writer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@pedrosamuelrodz6123',
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Composer who sets poems to music; co-credited on Romanticismo',
       bio_en = 'Pedro Samuel Rodríguez, who signs his music P. S. Rodz, is a Dominican composer and singer whose work consists almost entirely of setting poems to music. He is also an essayist, and the two trades turn out to be the same habit applied twice.

**Poems with tunes**

The method is straightforward and the results are not. He takes a published poem, writes music for it, sings it, and puts it out. What makes it unusual is the range of what he picks up.

A large part of it is Dominican verse — poems by Joaquín Balaguer, among them A un Niño Inválido and La Belleza de las Mujeres Feas, and work by Virgilio Díaz Ordóñez, Elisa Reyes and Carmen Sánchez. Then it leaves the country entirely: he has set a poem by the Austrian writer Angélica Becker, and a Shakespeare sonnet, which he issued with Spanish subtitles.

Setting verse that was never written to be sung is an old European practice and a nearly extinct Caribbean one. Doing it to a Shakespeare sonnet and to a Cibao poet in the same catalogue is a particular kind of stubbornness.

**Romanticismo**

One of these settings became a hit, and it is the reason his name appears in commercial rights records at all. Fernando Villalona recorded Romanticismo in 1996 for the album Soy Un Hombre Feliz, and the credits list two composers: Joaquín Balaguer for the words and Rodríguez for the music.

He also sang two of the settings himself — Melancolía Otoñal and Alma de Mujer — and those came out of named collections rather than off a lyric sheet, which is the distinction his whole catalogue rests on.

**The other trade**

He writes prose as well, and it is the kind that explains the music. He submitted to the Dominican language academy a study arguing for a possible Portuguese origin of the Cibao i — the vowel that makes northern Dominican speech instantly identifiable — and he kept his own journals online for years, on language, culture and history.

Someone who will spend that long chasing the ancestry of a single vowel is recognisably the same person who will spend an afternoon fitting a melody to a sonnet. His music is a philologist’s hobby carried out at professional standard, and the archive of it is his own channel, where the songs sit beside historical documentaries he assembled himself.

Very little else about him is on the record. There is no published birth date, no province, no label and no press campaign. What exists is the work and the credits, which in his case is a reasonable summary of the man.',
       bio_es = 'Pedro Samuel Rodríguez, que firma su música como P. S. Rodz, es compositor y cantante dominicano y su obra consiste casi entera en ponerle música a poemas. Es además ensayista, y las dos ocupaciones resultan ser la misma manía aplicada dos veces.

**Poemas con música**

El método es simple y los resultados no. Agarra un poema publicado, le escribe música, lo canta y lo saca. Lo raro es la variedad de lo que agarra.

Buena parte es verso dominicano: poemas de Joaquín Balaguer, entre ellos A un Niño Inválido y La Belleza de las Mujeres Feas, y obra de Virgilio Díaz Ordóñez, de Elisa Reyes y de Carmen Sánchez. Después se va del país por completo: ha musicalizado a la poeta austríaca Angélica Becker y un soneto de Shakespeare, que publicó con subtítulos en español.

Musicalizar verso que nunca se escribió para cantarse es una práctica europea vieja y una práctica caribeña casi extinguida. Hacerlo con un soneto de Shakespeare y con un poeta del Cibao dentro del mismo catálogo es una terquedad de una especie concreta.

**Romanticismo**

Una de esas musicalizaciones pegó, y es la razón por la que su nombre aparece en registros comerciales de derechos. Fernando Villalona grabó Romanticismo en 1996 para el disco Soy Un Hombre Feliz, y los créditos traen dos compositores: Joaquín Balaguer por la letra y Rodríguez por la música.

Cantó él mismo otras dos —Melancolía Otoñal y Alma de Mujer—, y esas salieron de libros con título y no de una hoja de letra, que es la distinción sobre la que se sostiene todo su catálogo.

**El otro oficio**

Escribe también prosa, y es de la que explica la música. Le presentó a la academia dominicana de la lengua un estudio que defiende un posible origen portugués de la i cibaeña —la vocal que hace reconocible al instante el habla del norte— y llevó durante años bitácoras propias sobre lengua, cultura e historia.

Quien se pasa tanto tiempo persiguiendo la ascendencia de una sola vocal es reconociblemente el mismo que se pasa una tarde ajustándole una melodía a un soneto. Su música es una afición de filólogo hecha con oficio, y el archivo de esa afición es su propio canal, donde las canciones conviven con documentales históricos que armó él mismo.

De lo demás casi no hay constancia. No hay fecha de nacimiento publicada, ni provincia, ni sello, ni campaña de prensa. Lo que hay es la obra y los créditos, que en su caso son un resumen razonable del hombre.',
       updated_at = now()
 WHERE slug = 'pedro-samuel-rodriguez';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Pedro Samuel Rodríguez, who signs his music P. S. Rodz, is a Dominican composer and singer whose work consists almost entirely of setting poems to music. He is also an essayist, and the two trades turn out to be the same habit applied twice.","type":"text"}]},{"type":"paragraph","content":[{"text":"Poems with tunes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The method is straightforward and the results are not. He takes a published poem, writes music for it, sings it, and puts it out. What makes it unusual is the range of what he picks up.","type":"text"}]},{"type":"paragraph","content":[{"text":"A large part of it is Dominican verse — poems by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f01002fa-68e4-4fa9-a8cc-91ab9004cea9","displayText":"Joaquín Balaguer","occurrenceId":"fde1cdb6-bfc2-47d8-8f38-50a7190403ac"}},{"text":", among them A un Niño Inválido and La Belleza de las Mujeres Feas, and work by Virgilio Díaz Ordóñez, Elisa Reyes and Carmen Sánchez. Then it leaves the country entirely: he has set a poem by the Austrian writer Angélica Becker, and a Shakespeare sonnet, which he issued with Spanish subtitles.","type":"text"}]},{"type":"paragraph","content":[{"text":"Setting verse that was never written to be sung is an old European practice and a nearly extinct Caribbean one. Doing it to a Shakespeare sonnet and to a Cibao poet in the same catalogue is a particular kind of stubbornness.","type":"text"}]},{"type":"paragraph","content":[{"text":"Romanticismo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"One of these settings became a hit, and it is the reason his name appears in commercial rights records at all. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"5d1b7873-44a7-48fb-abf6-cba8e1de2449"}},{"text":" recorded Romanticismo in 1996 for the album Soy Un Hombre Feliz, and the credits list two composers: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f01002fa-68e4-4fa9-a8cc-91ab9004cea9","displayText":"Joaquín Balaguer","occurrenceId":"c93881aa-3b15-4a34-8aca-fe36f4ae4637"}},{"text":" for the words and Rodríguez for the music.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also sang two of the settings himself — Melancolía Otoñal and Alma de Mujer — and those came out of named collections rather than off a lyric sheet, which is the distinction his whole catalogue rests on.","type":"text"}]},{"type":"paragraph","content":[{"text":"The other trade","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He writes prose as well, and it is the kind that explains the music. He submitted to the Dominican language academy a study arguing for a possible Portuguese origin of the Cibao i — the vowel that makes northern Dominican speech instantly identifiable — and he kept his own journals online for years, on language, culture and history.","type":"text"}]},{"type":"paragraph","content":[{"text":"Someone who will spend that long chasing the ancestry of a single vowel is recognisably the same person who will spend an afternoon fitting a melody to a sonnet. His music is a philologist’s hobby carried out at professional standard, and the archive of it is his own channel, where the songs sit beside historical documentaries he assembled himself.","type":"text"}]},{"type":"paragraph","content":[{"text":"Very little else about him is on the record. There is no published birth date, no province, no label and no press campaign. What exists is the work and the credits, which in his case is a reasonable summary of the man.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez'), 1)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Pedro Samuel Rodríguez, que firma su música como P. S. Rodz, es compositor y cantante dominicano y su obra consiste casi entera en ponerle música a poemas. Es además ensayista, y las dos ocupaciones resultan ser la misma manía aplicada dos veces.","type":"text"}]},{"type":"paragraph","content":[{"text":"Poemas con música","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El método es simple y los resultados no. Agarra un poema publicado, le escribe música, lo canta y lo saca. Lo raro es la variedad de lo que agarra.","type":"text"}]},{"type":"paragraph","content":[{"text":"Buena parte es verso dominicano: poemas de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f01002fa-68e4-4fa9-a8cc-91ab9004cea9","displayText":"Joaquín Balaguer","occurrenceId":"b632fd52-fec6-4589-a3c8-da45eda34296"}},{"text":", entre ellos A un Niño Inválido y La Belleza de las Mujeres Feas, y obra de Virgilio Díaz Ordóñez, de Elisa Reyes y de Carmen Sánchez. Después se va del país por completo: ha musicalizado a la poeta austríaca Angélica Becker y un soneto de Shakespeare, que publicó con subtítulos en español.","type":"text"}]},{"type":"paragraph","content":[{"text":"Musicalizar verso que nunca se escribió para cantarse es una práctica europea vieja y una práctica caribeña casi extinguida. Hacerlo con un soneto de Shakespeare y con un poeta del Cibao dentro del mismo catálogo es una terquedad de una especie concreta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Romanticismo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Una de esas musicalizaciones pegó, y es la razón por la que su nombre aparece en registros comerciales de derechos. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"55ed00d7-19d9-49e7-99b3-fb3c21bf168b"}},{"text":" grabó Romanticismo en 1996 para el disco Soy Un Hombre Feliz, y los créditos traen dos compositores: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f01002fa-68e4-4fa9-a8cc-91ab9004cea9","displayText":"Joaquín Balaguer","occurrenceId":"772d9d76-e758-482c-8af1-6b480715ea14"}},{"text":" por la letra y Rodríguez por la música.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cantó él mismo otras dos —Melancolía Otoñal y Alma de Mujer—, y esas salieron de libros con título y no de una hoja de letra, que es la distinción sobre la que se sostiene todo su catálogo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El otro oficio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Escribe también prosa, y es de la que explica la música. Le presentó a la academia dominicana de la lengua un estudio que defiende un posible origen portugués de la i cibaeña —la vocal que hace reconocible al instante el habla del norte— y llevó durante años bitácoras propias sobre lengua, cultura e historia.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quien se pasa tanto tiempo persiguiendo la ascendencia de una sola vocal es reconociblemente el mismo que se pasa una tarde ajustándole una melodía a un soneto. Su música es una afición de filólogo hecha con oficio, y el archivo de esa afición es su propio canal, donde las canciones conviven con documentales históricos que armó él mismo.","type":"text"}]},{"type":"paragraph","content":[{"text":"De lo demás casi no hay constancia. No hay fecha de nacimiento publicada, ni provincia, ni sello, ni campaña de prensa. Lo que hay es la obra y los créditos, que en su caso son un resumen razonable del hombre.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez') AND locale = 'en'), '5d1b7873-44a7-48fb-abf6-cba8e1de2449', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez') AND locale = 'en'), 'c93881aa-3b15-4a34-8aca-fe36f4ae4637', 'artist', 'f01002fa-68e4-4fa9-a8cc-91ab9004cea9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez') AND locale = 'en'), 'fde1cdb6-bfc2-47d8-8f38-50a7190403ac', 'artist', 'f01002fa-68e4-4fa9-a8cc-91ab9004cea9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez') AND locale = 'es'), '55ed00d7-19d9-49e7-99b3-fb3c21bf168b', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez') AND locale = 'es'), '772d9d76-e758-482c-8af1-6b480715ea14', 'artist', 'f01002fa-68e4-4fa9-a8cc-91ab9004cea9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pedro-samuel-rodriguez') AND locale = 'es'), 'b632fd52-fec6-4589-a3c8-da45eda34296', 'artist', 'f01002fa-68e4-4fa9-a8cc-91ab9004cea9');

COMMIT;
