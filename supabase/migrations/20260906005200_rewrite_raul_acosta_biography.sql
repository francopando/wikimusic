BEGIN;

-- Rewrite the catalogue entry for Raúl Acosta.
--
-- Raúl Acosta. Filler in English, nothing in Spanish, no real name, no
-- occupations, no genres -- on the man who founded Oro Sólido.
--
-- CORRECTED: primary_genre salsa -> merengue. He has never been a salsero; the
-- orchestra he built and led for thirty years is a merengue orchestra and his
-- own nickname is El Presidente del Merengue. This is the clearest wrong genre
-- the audit has produced.
--
-- ADDED: occupations composer, arranger, producer, engineer; stage_name;
-- aliases; genres; disambiguation; the diaspora tag.
--
-- LEFT ALONE: province Puerto Plata and birth_place Guananico were already
-- stored and are more specific than anything found; birth_year 1971 likewise.
-- NOTE A CONFLICT, NOT RESOLVED: MusicBrainz gives his begin-area as Santo
-- Domingo, which contradicts Guananico. The stored value is kept because it is
-- the more specific of the two and because a begin-area on MusicBrainz is
-- routinely the capital by default. Neither is sourced to an interview.
--
-- SOURCES: MusicBrainz, which records the founder relationship to Oro Sólido
-- outright and lists the albums from Party Time 2001 to Festival en la Calle 8.
-- BuenaMusica for the career: the birth in the Dominican Republic and the
-- upbringing in New Jersey, the parents working in show business, the studies
-- at the Kennedy's Music World academy where he also worked as a sound engineer
-- and director of rhythm instruments, the founding of the orchestra in 1994 in
-- New York with Puerto Rican and Dominican musicians, Plátano Records, the
-- album sequence from Ta Caché through Y Sigue el Cache, Oro Sólido
-- Internacional in March 1996 and El Poder de Nueva York in 1997, the singles,
-- the ACE, Estrella, Alpha and Premio Oro awards and the keys to a Honduran
-- city, the five-plus nights at Madison Square Garden, and the current line-up
-- with Ángel Suriña and Raymond Aponte. Zeta FM and La Tuya Radio for the 1994
-- founding and the New Jersey upbringing. The Kako Merenguero Salsero account,
-- which credits Está Cache to him as author and arranger. His own site,
-- orosolidoworld.com, which is billed "Oro Solido by Raul Acosta" and carries
-- the catchphrase. Long interviews with José Peguero, República Merengue,
-- Silvio Mora and Enrique Santos, all on video.
--
-- NOT WRITTEN: listener counts. Nothing about his political aspirations, which
-- two of the interviews are largely about; that is not music.
--
-- AWARDS NOT LOADED. The ACE, Estrella, Alpha and Premio Oro awards were all
-- given to the orchestra, not to him as an individual, and whether an
-- orchestra's award belongs on its founder's row is the same editorial question
-- raised by Henry Jiménez's Grammys. They stay in the prose.
--
-- NOT LINKED: Oro Sólido is in the catalogue but is a draft, so a reference
-- would render as dead text. It is named in the prose throughout and must be
-- linked here once it is published -- this is the entry where that link matters
-- most. Ángel Suriña and Raymond Aponte have no entries.
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
       name = 'Raúl Acosta',
       sort_name = 'Acosta, Raúl',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = '1971-09-08',
       birth_year = 1971,
       date_of_death = NULL,
       birth_place = 'Guananico',
       province = 'Puerto Plata',
       first_name = 'Raúl',
       middle_name = NULL,
       last_name = 'Acosta',
       second_last_name = NULL,
       stage_name = 'Raúl Acosta',
       aliases = ARRAY['El Presidente del Merengue']::text[],
       occupations = '["composer","arranger","producer","engineer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['merengue-orquesta', 'merengue-house']::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = 'https://www.orosolidoworld.com',
       youtube = '@orosolidoraul',
       facebook = 'orosolidofanpage',
       instagram = 'orosolidoofficial',
       disambiguation = 'Founder and leader of Oro Sólido; El Presidente del Merengue',
       bio_en = 'Raúl Acosta is a Dominican singer, composer, arranger and producer. He founded Oro Sólido and has led it ever since, which makes him one of the people who kept merengue on dance floors outside the country when it was losing them inside it.

**Guananico to New Jersey**

He was born in Guananico, in Puerto Plata, and grew up in New Jersey. His parents worked in show business, so the trade was in the house before he chose it.

He studied at the Kennedy’s Music World academy and stayed on there as a sound engineer and as director of rhythm instruments. That is an unusual apprenticeship for a bandleader: he learned the room and the drums before he learned the stage, and both show in how the orchestra is arranged.

**Oro Sólido**

He put the group together in New York in 1994, with Dominican and Puerto Rican musicians, and it was a New York band from the first bar — the audience was the diaspora, the studio was in the city, and the records were made for a dance floor rather than for the radio in Santo Domingo.

Ta Caché came out on Plátano Records and worked immediately. Y Sigue el Cache followed. Oro Sólido Internacional, in March 1996, is the one that settled the matter, with La Tanga, El Vacilón, Las Mujeres Quieren Machos and El Señorito on it. El Poder de Nueva York, in 1997, carried María Se Fue, La Morena and Abusadora.

He writes and arranges the material himself — Está Cache is credited to him on both counts — which is what separates a bandleader from a frontman.

**El Presidente del Merengue**

The nickname is his and the catchphrase is "hasta las 15", which is not a time of day and is not meant to be explained. Both are part of the same act: a merengue built on repetition and on a crowd that already knows what comes next.

The orchestra has played Madison Square Garden more than five times and toured Honduras, Ecuador, Canada, Italy, Switzerland and Germany. It has collected the ACE awards for revelation orchestra, tropical orchestra and best local orchestra, a Premio Estrella as revelation orchestra of New York, a Premio Alpha, and a Premio Oro in Honduras that came with the keys to the city.

Along the way the group has shared stages with Wilfrido Vargas and Johnny Ventura, with Celia Cruz and Marc Anthony, and once with 50 Cent.

**Still working**

More than twenty records in, the line-up now runs with Ángel Suriña and Raymond Aponte beside him, and the touring has not stopped — Live From NY, Electronic Dance Reggae and Festival en la Calle 8 all arrived within a few years of each other.

Thirty years is a long time to hold a dance orchestra together, and longer still to do it from outside the country whose music you are playing.',
       bio_es = 'Raúl Acosta es cantante, compositor, arreglista y productor dominicano. Fundó Oro Sólido y la dirige desde entonces, lo que lo pone entre la gente que mantuvo el merengue en las pistas de fuera del país cuando las estaba perdiendo adentro.

**De Guananico a Nueva Jersey**

Nació en Guananico, Puerto Plata, y se crió en Nueva Jersey. Sus padres trabajaban en el ambiente del espectáculo, así que el oficio estaba en la casa antes de que él lo escogiera.

Estudió en la academia Kennedy’s Music World y se quedó ahí trabajando como ingeniero de sonido y como director de instrumentos de ritmo. Es un aprendizaje raro para un director de orquesta: aprendió la sala y los tambores antes que la tarima, y las dos cosas se le notan en cómo está armado el grupo.

**Oro Sólido**

Armó la agrupación en Nueva York en 1994, con músicos dominicanos y puertorriqueños, y fue una banda neoyorquina desde el primer compás: el público era la diáspora, el estudio estaba en la ciudad, y los discos se hicieron para una pista de baile y no para la radio de Santo Domingo.

Ta Caché salió por Plátano Records y pegó de una vez. Detrás vino Y Sigue el Cache. Oro Sólido Internacional, en marzo de 1996, es el que zanjó el asunto, con La Tanga, El Vacilón, Las Mujeres Quieren Machos y El Señorito adentro. El Poder de Nueva York, en 1997, traía María Se Fue, La Morena y Abusadora.

Escribe y arregla él mismo el material —Está Cache lleva su nombre en las dos casillas—, que es lo que separa a un director de banda de un cantante al frente.

**El Presidente del Merengue**

El apodo es suyo y la muletilla es "hasta las 15", que no es una hora del día y no está hecha para explicarse. Las dos cosas son parte del mismo acto: un merengue montado sobre la repetición y sobre un público que ya sabe lo que viene.

La orquesta ha tocado más de cinco veces en el Madison Square Garden y ha girado por Honduras, Ecuador, Canadá, Italia, Suiza y Alemania. Ha recogido los premios ACE de orquesta revelación, orquesta tropical y mejor orquesta local, un Premio Estrella como orquesta revelación de Nueva York, un Premio Alpha, y un Premio Oro en Honduras que vino con las llaves de la ciudad.

En el camino el grupo ha compartido tarima con Wilfrido Vargas y Johnny Ventura, con Celia Cruz y Marc Anthony, y una vez con 50 Cent.

**Todavía trabajando**

Con más de veinte discos encima, la alineación corre ahora con Ángel Suriña y Raymond Aponte a su lado, y la gira no ha parado: Live From NY, Electronic Dance Reggae y Festival en la Calle 8 salieron con pocos años entre uno y otro.

Treinta años es mucho tiempo para sostener una orquesta de baile, y más todavía para hacerlo desde fuera del país cuya música se toca.',
       updated_at = now()
 WHERE slug = 'raul-acosta';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'raul-acosta')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'raul-acosta')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Raúl Acosta is a Dominican singer, composer, arranger and producer. He founded Oro Sólido and has led it ever since, which makes him one of the people who kept merengue on dance floors outside the country when it was losing them inside it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Guananico to New Jersey","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was born in Guananico, in Puerto Plata, and grew up in New Jersey. His parents worked in show business, so the trade was in the house before he chose it.","type":"text"}]},{"type":"paragraph","content":[{"text":"He studied at the Kennedy’s Music World academy and stayed on there as a sound engineer and as director of rhythm instruments. That is an unusual apprenticeship for a bandleader: he learned the room and the drums before he learned the stage, and both show in how the orchestra is arranged.","type":"text"}]},{"type":"paragraph","content":[{"text":"Oro Sólido","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He put the group together in New York in 1994, with Dominican and Puerto Rican musicians, and it was a New York band from the first bar — the audience was the diaspora, the studio was in the city, and the records were made for a dance floor rather than for the radio in Santo Domingo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ta Caché came out on Plátano Records and worked immediately. Y Sigue el Cache followed. Oro Sólido Internacional, in March 1996, is the one that settled the matter, with La Tanga, El Vacilón, Las Mujeres Quieren Machos and El Señorito on it. El Poder de Nueva York, in 1997, carried María Se Fue, La Morena and Abusadora.","type":"text"}]},{"type":"paragraph","content":[{"text":"He writes and arranges the material himself — Está Cache is credited to him on both counts — which is what separates a bandleader from a frontman.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Presidente del Merengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The nickname is his and the catchphrase is \"hasta las 15\", which is not a time of day and is not meant to be explained. Both are part of the same act: a merengue built on repetition and on a crowd that already knows what comes next.","type":"text"}]},{"type":"paragraph","content":[{"text":"The orchestra has played Madison Square Garden more than five times and toured Honduras, Ecuador, Canada, Italy, Switzerland and Germany. It has collected the ACE awards for revelation orchestra, tropical orchestra and best local orchestra, a Premio Estrella as revelation orchestra of New York, a Premio Alpha, and a Premio Oro in Honduras that came with the keys to the city.","type":"text"}]},{"type":"paragraph","content":[{"text":"Along the way the group has shared stages with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"4ee96194-117e-41ff-b8cc-c1129224ce30"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"cc0de8df-930f-428e-8e44-afa0dfc2521e"}},{"text":", with Celia Cruz and Marc Anthony, and once with 50 Cent.","type":"text"}]},{"type":"paragraph","content":[{"text":"Still working","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"More than twenty records in, the line-up now runs with Ángel Suriña and Raymond Aponte beside him, and the touring has not stopped — Live From NY, Electronic Dance Reggae and Festival en la Calle 8 all arrived within a few years of each other.","type":"text"}]},{"type":"paragraph","content":[{"text":"Thirty years is a long time to hold a dance orchestra together, and longer still to do it from outside the country whose music you are playing.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'raul-acosta'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Raúl Acosta es cantante, compositor, arreglista y productor dominicano. Fundó Oro Sólido y la dirige desde entonces, lo que lo pone entre la gente que mantuvo el merengue en las pistas de fuera del país cuando las estaba perdiendo adentro.","type":"text"}]},{"type":"paragraph","content":[{"text":"De Guananico a Nueva Jersey","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nació en Guananico, Puerto Plata, y se crió en Nueva Jersey. Sus padres trabajaban en el ambiente del espectáculo, así que el oficio estaba en la casa antes de que él lo escogiera.","type":"text"}]},{"type":"paragraph","content":[{"text":"Estudió en la academia Kennedy’s Music World y se quedó ahí trabajando como ingeniero de sonido y como director de instrumentos de ritmo. Es un aprendizaje raro para un director de orquesta: aprendió la sala y los tambores antes que la tarima, y las dos cosas se le notan en cómo está armado el grupo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Oro Sólido","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Armó la agrupación en Nueva York en 1994, con músicos dominicanos y puertorriqueños, y fue una banda neoyorquina desde el primer compás: el público era la diáspora, el estudio estaba en la ciudad, y los discos se hicieron para una pista de baile y no para la radio de Santo Domingo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ta Caché salió por Plátano Records y pegó de una vez. Detrás vino Y Sigue el Cache. Oro Sólido Internacional, en marzo de 1996, es el que zanjó el asunto, con La Tanga, El Vacilón, Las Mujeres Quieren Machos y El Señorito adentro. El Poder de Nueva York, en 1997, traía María Se Fue, La Morena y Abusadora.","type":"text"}]},{"type":"paragraph","content":[{"text":"Escribe y arregla él mismo el material —Está Cache lleva su nombre en las dos casillas—, que es lo que separa a un director de banda de un cantante al frente.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Presidente del Merengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El apodo es suyo y la muletilla es \"hasta las 15\", que no es una hora del día y no está hecha para explicarse. Las dos cosas son parte del mismo acto: un merengue montado sobre la repetición y sobre un público que ya sabe lo que viene.","type":"text"}]},{"type":"paragraph","content":[{"text":"La orquesta ha tocado más de cinco veces en el Madison Square Garden y ha girado por Honduras, Ecuador, Canadá, Italia, Suiza y Alemania. Ha recogido los premios ACE de orquesta revelación, orquesta tropical y mejor orquesta local, un Premio Estrella como orquesta revelación de Nueva York, un Premio Alpha, y un Premio Oro en Honduras que vino con las llaves de la ciudad.","type":"text"}]},{"type":"paragraph","content":[{"text":"En el camino el grupo ha compartido tarima con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"ef26cdc8-d4b7-476f-bbdc-bf7cca70d6d7"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"90c277bc-b088-442c-9fc4-3a5dd6208b9d"}},{"text":", con Celia Cruz y Marc Anthony, y una vez con 50 Cent.","type":"text"}]},{"type":"paragraph","content":[{"text":"Todavía trabajando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Con más de veinte discos encima, la alineación corre ahora con Ángel Suriña y Raymond Aponte a su lado, y la gira no ha parado: Live From NY, Electronic Dance Reggae y Festival en la Calle 8 salieron con pocos años entre uno y otro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Treinta años es mucho tiempo para sostener una orquesta de baile, y más todavía para hacerlo desde fuera del país cuya música se toca.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'raul-acosta'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'raul-acosta') AND locale = 'en'), '4ee96194-117e-41ff-b8cc-c1129224ce30', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'raul-acosta') AND locale = 'en'), 'cc0de8df-930f-428e-8e44-afa0dfc2521e', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'raul-acosta') AND locale = 'es'), '90c277bc-b088-442c-9fc4-3a5dd6208b9d', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'raul-acosta') AND locale = 'es'), 'ef26cdc8-d4b7-476f-bbdc-bf7cca70d6d7', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

COMMIT;
