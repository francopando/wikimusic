BEGIN;

-- Rewrite the catalogue entry for Sharlene.
--
-- Sharlene. Filler in English, nothing in Spanish, no gender, no occupations,
-- no genres, no instruments -- on an artist with a Wikidata item, an IMDb page,
-- two major-label deals and a number one on Billboard's tropical chart.
--
-- FILLED: gender female; instruments voice, guitar, piano and drums;
-- occupations composer, actor, musician and television_host, all four of which
-- Spanish Wikipedia and her own billing support.
--
-- A BIRTH YEAR THAT IS GENUINELY UNSETTLED, AND THE ROW IS LEFT UNTOUCHED. The
-- row already holds date_of_birth 11 May 1989 and birth_year 1989, from an
-- earlier pass, and neither is changed here. Spanish Wikipedia's article body
-- says 11 May 1989, its infobox says "11 de mayo de 1989 o 11 de mayo de 1991",
-- and its own category files her under 1991. MusicBrainz gives 1991-05-11.
-- BuenaMusica, Last.fm and several Dominican outlets give 1989. The day and
-- month are not in dispute anywhere; only the year is. The stored 1989 is the
-- better-supported reading and it stands, but the conflict is real and is
-- recorded rather than papered over. MusicBrainz has now been wrong about a
-- birth year and about a gender in the same day's work -- see Lismar -- and
-- should not be trusted on either field.
--
-- ADDED: genres; aliases; disambiguation.
--
-- DIASPORA TAG NOT ADDED. She was born in Santo Domingo, holds Dominican and
-- American nationality and lives in Los Angeles. That is the shape the tag
-- would be for, but its definition is still an open question in ADR-002 and it
-- is left off rather than guessed at, consistent with Julio Acosta.
--
-- SOURCES: Spanish Wikipedia, which is thoroughly cited and is the spine here:
-- the legal name Sharlene Taulé Ponciano, the birth in Santo Domingo, the music
-- studies with the Spanish singer María Remola and the acting studies at the Lee
-- Strasberg Institute in New York, the four languages, the film and television
-- work from 2005 onward, the Nickelodeon series Grachi and the live tour that
-- came out of it, and the whole music chronology: Mal de Amor with Servando &
-- Florentino in 2014, Aquí Nadie Toca with Mozart la Para and its two Videoclip
-- Awards nominations, Toy Enamorao reaching number one on Billboard's Tropical
-- Songs in 2016, La Fila with Don Omar and Maluma on Luny Tunes' Más Flow 3,
-- the album Sharlene in 2016, the Universal Music signing in February 2017 and
-- Encanto with Don Omar, the singles of 2018 and 2019, the album Viaje in 2020,
-- and the Warner Music México signing in 2021 followed by Todo Pasa and
-- Dopamina. MusicBrainz for the release dates and the official site.
--
-- A JUDGEMENT ABOUT SCOPE. Most of what is written about her is acting: two
-- telenovelas, a German crime series, six musicals, a Fox drama, a Netflix
-- series, and María Teresa Mirabal in Trópico de Sangre. This is a music
-- catalogue, so the acting appears only where it bears on the music -- the
-- Grachi role is what restarted her singing, and the soundtracks are records
-- she made. The filmography is not reproduced.
--
-- NOT WRITTEN: her parents' names, which Wikipedia gives.
--
-- NOT LINKED: Servando & Florentino and Nacho are Venezuelan, Don Omar and Zion
-- y Lennox Puerto Rican, Maluma, Lalo Ebratt and Mike Bahía Colombian,
-- Gemeliers Spanish, Joey Montana Panamanian. Fuego is Dominican-American and
-- has no entry.
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
       name = 'Sharlene',
       sort_name = 'Taulé Ponciano, Sharlene',
       type = 'solo_artist',
       status = 'published',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-reggaeton',
       date_of_birth = '1989-05-11',
       birth_year = 1989,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Sharlene',
       middle_name = NULL,
       last_name = 'Taulé',
       second_last_name = 'Ponciano',
       stage_name = 'Sharlene',
       aliases = ARRAY['Sharlene Taulé', 'Sharlene Taulé Ponciano']::text[],
       occupations = '["composer","actor","musician","television_host"]'::jsonb,
       instruments = ARRAY['voice', 'guitar', 'piano', 'drums']::text[],
       genres = ARRAY['urbano', 'ballads-romantic']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@sharlene2439',
       facebook = 'sharlenetaulep',
       instagram = 'sharlene',
       disambiguation = 'Singer and actress from Santo Domingo; Toy Enamorao, the albums Sharlene and Viaje',
       bio_en = 'Sharlene, born Sharlene Taulé Ponciano in Santo Domingo, is a Dominican singer, songwriter and actress. She trained as a musician before she trained as anything else, and the two careers have been feeding each other for twenty years.

**Two educations**

She studied music with the Spanish singer María Remola and acting at the Lee Strasberg Institute in New York. She plays guitar, piano and drums, sings mezzo-soprano, and speaks four languages.

The acting came first commercially — film from 2005, then television, then six musicals, and the part of María Teresa Mirabal in a film about the sisters. She was also the lead in the video for Bendita Tu Luz, by Maná and Juan Luis Guerra 4.40, which is the first place a Dominican audience saw her face attached to music.

What changed the balance was a children’s series. Playing Katty in Nickelodeon’s Grachi put her in front of an audience across Latin America, Europe and Asia, and the live tour that followed was the thing that let her go back to singing as a career rather than a sideline.

**Toy Enamorao**

She debuted as a solo artist in 2014 with Mal de Amor, a bachata cut with the Venezuelans Servando & Florentino. Aquí Nadie Toca, with Mozart la Para, followed and took two nominations at the Dominican Videoclip Awards.

Then Toy Enamorao — Mozart la Para’s record, with her and Nacho on it — went to number one on Billboard’s Tropical Songs. La Fila, the same year, put her with Don Omar and Maluma on a Luny Tunes album.

The self-titled album came in 2016. Universal Music signed her in February 2017 and Encanto arrived with it.

**Viaje, and after**

The singles kept coming — Me Siento Bien, Yo Pago Lo Mío, El Vecino, Lento, San Pedro, Quién Dijo Miedo, Aerofobia — with collaborators from six countries, which is a fair description of where her career actually sits.

Viaje arrived in 2020. She signed with Warner Music México in 2021 and released Todo Pasa and Dopamina.

She has also made four soundtracks — Grachi, Pasión Prohibida, Strings and Star — and sang Vives en Mí for the second of them. A Dominican singer with a Universal deal, a Warner deal and a Billboard number one is not a common thing, and neither is one who got there by way of a Nickelodeon set.',
       bio_es = 'Sharlene, de nombre Sharlene Taulé Ponciano y nacida en Santo Domingo, es cantante, compositora y actriz dominicana. Se formó como música antes que como cualquier otra cosa, y las dos carreras llevan veinte años alimentándose entre sí.

**Dos formaciones**

Estudió música con la cantante española María Remola y actuación en el Instituto Lee Strasberg de Nueva York. Toca guitarra, piano y batería, canta como mezzosoprano y habla cuatro idiomas.

La actuación llegó primero por lo comercial: cine desde 2005, después televisión, después seis musicales, y el papel de María Teresa Mirabal en una película sobre las hermanas. También fue la protagonista del video de Bendita Tu Luz, de Maná y Juan Luis Guerra 4.40, que es el primer sitio donde un público dominicano le vio la cara pegada a una música.

Lo que cambió la balanza fue una serie infantil. Interpretar a Katty en la Grachi de Nickelodeon la puso delante de un público de toda América Latina, Europa y Asia, y la gira en vivo que salió de ahí fue lo que le permitió volver a cantar como carrera y no como cosa aparte.

**Toy Enamorao**

Debutó como solista en 2014 con Mal de Amor, una bachata grabada con los venezolanos Servando & Florentino. Detrás vino Aquí Nadie Toca, con Mozart la Para, que se llevó dos nominaciones en los Videoclip Awards dominicanos.

Después Toy Enamorao —el disco de Mozart la Para, con ella y Nacho adentro— llegó al número uno de la lista Tropical Songs de Billboard. La Fila, el mismo año, la puso con Don Omar y Maluma en un álbum de Luny Tunes.

El álbum homónimo salió en 2016. Universal Music la firmó en febrero de 2017 y con eso llegó Encanto.

**Viaje, y después**

Los sencillos no pararon —Me Siento Bien, Yo Pago Lo Mío, El Vecino, Lento, San Pedro, Quién Dijo Miedo, Aerofobia— con colaboradores de seis países, que es una descripción justa de dónde está de verdad su carrera.

Viaje llegó en 2020. Firmó con Warner Music México en 2021 y publicó Todo Pasa y Dopamina.

También ha hecho cuatro bandas sonoras —Grachi, Pasión Prohibida, Strings y Star— y cantó Vives en Mí para la segunda. Una cantante dominicana con un contrato de Universal, otro de Warner y un número uno de Billboard no es cosa corriente, y menos una que llegó ahí pasando por un set de Nickelodeon.',
       updated_at = now()
 WHERE slug = 'sharlene';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Sharlene, born Sharlene Taulé Ponciano in Santo Domingo, is a Dominican singer, songwriter and actress. She trained as a musician before she trained as anything else, and the two careers have been feeding each other for twenty years.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two educations","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She studied music with the Spanish singer María Remola and acting at the Lee Strasberg Institute in New York. She plays guitar, piano and drums, sings mezzo-soprano, and speaks four languages.","type":"text"}]},{"type":"paragraph","content":[{"text":"The acting came first commercially — film from 2005, then television, then six musicals, and the part of María Teresa Mirabal in a film about the sisters. She was also the lead in the video for Bendita Tu Luz, by Maná and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"a76b2504-8d60-47e3-9f8c-c572b5c4c5be"}},{"text":", which is the first place a Dominican audience saw her face attached to music.","type":"text"}]},{"type":"paragraph","content":[{"text":"What changed the balance was a children’s series. Playing Katty in Nickelodeon’s Grachi put her in front of an audience across Latin America, Europe and Asia, and the live tour that followed was the thing that let her go back to singing as a career rather than a sideline.","type":"text"}]},{"type":"paragraph","content":[{"text":"Toy Enamorao","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She debuted as a solo artist in 2014 with Mal de Amor, a bachata cut with the Venezuelans Servando & Florentino. Aquí Nadie Toca, with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"d5d91121-2c8f-4e21-aac5-993d7181b288"}},{"text":", followed and took two nominations at the Dominican Videoclip Awards.","type":"text"}]},{"type":"paragraph","content":[{"text":"Then Toy Enamorao — ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"5087b042-f78b-4d31-b8ca-386f0e0036f3"}},{"text":"’s record, with her and Nacho on it — went to number one on Billboard’s Tropical Songs. La Fila, the same year, put her with Don Omar and Maluma on a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ef56311a-ac4b-451e-a7a7-97e5f240cd47","displayText":"Luny Tunes","occurrenceId":"ca8cfca4-5a4e-4f4e-8360-a787279259f6"}},{"text":" album.","type":"text"}]},{"type":"paragraph","content":[{"text":"The self-titled album came in 2016. Universal Music signed her in February 2017 and Encanto arrived with it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Viaje, and after","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The singles kept coming — Me Siento Bien, Yo Pago Lo Mío, El Vecino, Lento, San Pedro, Quién Dijo Miedo, Aerofobia — with collaborators from six countries, which is a fair description of where her career actually sits.","type":"text"}]},{"type":"paragraph","content":[{"text":"Viaje arrived in 2020. She signed with Warner Music México in 2021 and released Todo Pasa and Dopamina.","type":"text"}]},{"type":"paragraph","content":[{"text":"She has also made four soundtracks — Grachi, Pasión Prohibida, Strings and Star — and sang Vives en Mí for the second of them. A Dominican singer with a Universal deal, a Warner deal and a Billboard number one is not a common thing, and neither is one who got there by way of a Nickelodeon set.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'sharlene'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Sharlene, de nombre Sharlene Taulé Ponciano y nacida en Santo Domingo, es cantante, compositora y actriz dominicana. Se formó como música antes que como cualquier otra cosa, y las dos carreras llevan veinte años alimentándose entre sí.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos formaciones","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Estudió música con la cantante española María Remola y actuación en el Instituto Lee Strasberg de Nueva York. Toca guitarra, piano y batería, canta como mezzosoprano y habla cuatro idiomas.","type":"text"}]},{"type":"paragraph","content":[{"text":"La actuación llegó primero por lo comercial: cine desde 2005, después televisión, después seis musicales, y el papel de María Teresa Mirabal en una película sobre las hermanas. También fue la protagonista del video de Bendita Tu Luz, de Maná y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"59c0f147-440c-4ac8-a31e-3f14cd5da6ad"}},{"text":", que es el primer sitio donde un público dominicano le vio la cara pegada a una música.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que cambió la balanza fue una serie infantil. Interpretar a Katty en la Grachi de Nickelodeon la puso delante de un público de toda América Latina, Europa y Asia, y la gira en vivo que salió de ahí fue lo que le permitió volver a cantar como carrera y no como cosa aparte.","type":"text"}]},{"type":"paragraph","content":[{"text":"Toy Enamorao","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Debutó como solista en 2014 con Mal de Amor, una bachata grabada con los venezolanos Servando & Florentino. Detrás vino Aquí Nadie Toca, con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"26b734b0-1d45-4c9b-be04-ffbf36e78c9b"}},{"text":", que se llevó dos nominaciones en los Videoclip Awards dominicanos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después Toy Enamorao —el disco de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"d76dfa9c-e0de-4b17-a7c3-f14259b6ebab"}},{"text":", con ella y Nacho adentro— llegó al número uno de la lista Tropical Songs de Billboard. La Fila, el mismo año, la puso con Don Omar y Maluma en un álbum de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ef56311a-ac4b-451e-a7a7-97e5f240cd47","displayText":"Luny Tunes","occurrenceId":"57c38c13-3f5e-4393-9445-7178d0a78e5e"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"El álbum homónimo salió en 2016. Universal Music la firmó en febrero de 2017 y con eso llegó Encanto.","type":"text"}]},{"type":"paragraph","content":[{"text":"Viaje, y después","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los sencillos no pararon —Me Siento Bien, Yo Pago Lo Mío, El Vecino, Lento, San Pedro, Quién Dijo Miedo, Aerofobia— con colaboradores de seis países, que es una descripción justa de dónde está de verdad su carrera.","type":"text"}]},{"type":"paragraph","content":[{"text":"Viaje llegó en 2020. Firmó con Warner Music México en 2021 y publicó Todo Pasa y Dopamina.","type":"text"}]},{"type":"paragraph","content":[{"text":"También ha hecho cuatro bandas sonoras —Grachi, Pasión Prohibida, Strings y Star— y cantó Vives en Mí para la segunda. Una cantante dominicana con un contrato de Universal, otro de Warner y un número uno de Billboard no es cosa corriente, y menos una que llegó ahí pasando por un set de Nickelodeon.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'sharlene'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene') AND locale = 'en'), '5087b042-f78b-4d31-b8ca-386f0e0036f3', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene') AND locale = 'en'), 'a76b2504-8d60-47e3-9f8c-c572b5c4c5be', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene') AND locale = 'en'), 'ca8cfca4-5a4e-4f4e-8360-a787279259f6', 'artist', 'ef56311a-ac4b-451e-a7a7-97e5f240cd47');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene') AND locale = 'en'), 'd5d91121-2c8f-4e21-aac5-993d7181b288', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene') AND locale = 'es'), '26b734b0-1d45-4c9b-be04-ffbf36e78c9b', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene') AND locale = 'es'), '57c38c13-3f5e-4393-9445-7178d0a78e5e', 'artist', 'ef56311a-ac4b-451e-a7a7-97e5f240cd47');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene') AND locale = 'es'), '59c0f147-440c-4ac8-a31e-3f14cd5da6ad', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sharlene') AND locale = 'es'), 'd76dfa9c-e0de-4b17-a7c3-f14259b6ebab', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

COMMIT;
