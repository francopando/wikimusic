BEGIN;

-- Rewrite the catalogue entry for Sohanny Sua.
--
-- Sohanny Sua. Filler in English, nothing in Spanish, no genre, no gender, no
-- real name -- for a singer who spent years inside an Emilio Estefan project
-- before going solo.
--
-- SOURCES: Discogs, whose profile line reads "Dominican singer" and which
-- records "Sua" as a name variation, confirming that the row's "Sohanny Sua"
-- and the "Sohanny" the press writes about are one person. BuenaMusica, whose
-- Nacionalidad field reads Dominicana, for Santo Domingo, the 1993 move to
-- Rhode Island, the singing and acting contest she won in Los Angeles at
-- sixteen, the Miami signing with Emilio Estefan, Tommy Mottola and Sony Music,
-- the MSM years, the 2011 solo album produced by Richy Pena and "No Es Normal"
-- reaching the top five of Mediabase's Tropical Latin chart. People en Espanol,
-- 14 March 2011, independently for the Dominican singer-songwriter behind "No
-- Es Normal" and the album coming that summer. Amazon's listing for the MSM
-- album, which names Sohanny alongside Carla Ramirez under Emilio Estefan Jr.
-- and corroborates the group from outside BuenaMusica.
--
-- GENRE SET to fusion-tropical. Her own description is merengue, cumbia and
-- bachata fused with urban pop, and the chart she reached is Tropical Latin;
-- filing that as any single tropical genre would be wrong.
--
-- NOT WRITTEN: her grandfather's death, which BuenaMusica gives as the turn
-- toward songwriting.
-- FLAGGED: the surname. Discogs records her as Sohanny Sua; the Amazon credit
-- for the MSM album reads Sohanny Gross. Both are the same first name in the
-- same group, and this entry does not decide which surname is the legal one.
-- FLAGGED: status. Left at needs_review; no image on the row.
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
       name = 'Sohanny Sua',
       sort_name = 'Sohanny',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'fusion-tropical',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['Sohanny', 'Sua']::text[],
       occupations = '["composer","songwriter"]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican singer-songwriter; MSM under Emilio Estefan, then “No Es Normal”',
       bio_en = 'Sohanny Sua, who records as Sohanny, is a Dominican singer and songwriter born in Santo Domingo. She sang in MSM under Emilio Estefan before going out on her own.

**Rhode Island**

She grew up in a house where her father told her that dancing has no rules and music is felt from the inside, and where her mother played Ángela Carrasco and Lola Flores. She copied her mother at family gatherings using a wooden spoon for a microphone.

In 1993 the family emigrated to Rhode Island and started over, which is the ordinary Dominican story told from the inside rather than the ordinary Dominican story told about music.

She nearly went to medicine instead. What pulled her back was writing: she found she could put what she felt into a song more plainly than any other way, and she has written her own material since.

**MSM**

At sixteen she went to Los Angeles and won first place in a singing and acting contest. She moved on to Miami and signed with Emilio Estefan, Tommy Mottola and Sony Music, joining MSM — a group assembled under Estefan’s management and given the Miami Sound Machine name.

The group charted internationally and took gold and platinum in Spain, and she shared stages with Celine Dion, Marc Anthony, Paulina Rubio and Julio Iglesias. For a Dominican singer, a seat inside the Estefan operation was the shortest route to that scale that existed.

**No Es Normal**

She never gave up the idea of being a soloist. Her first album arrived in 2011, produced by Richy Peña, and the single No Es Normal reached the top five of Mediabase’s Tropical Latin chart. Fuego appears on it.

Get Loose went onto the Step Up Revolution soundtrack the following year, and Con Mi Gente onto the Caribe 2012 collection.

What she writes she aims at women, and the music underneath it is merengue, cumbia and bachata folded into urban pop — a Dominican making tropical music from inside the American industry rather than from the island.',
       bio_es = 'Sohanny Sua, que graba como Sohanny, es una cantante y compositora dominicana nacida en Santo Domingo. Cantó en MSM bajo Emilio Estefan antes de salir por su cuenta.

**Rhode Island**

Se crió en una casa donde su padre le decía que el bailar no tiene reglas y la música se siente por dentro, y donde su madre ponía a Ángela Carrasco y a Lola Flores. Ella la imitaba en las reuniones familiares usando una cuchara de palo como micrófono.

En 1993 la familia emigró a Rhode Island y empezó de cero, que es la historia dominicana corriente contada desde adentro y no la historia dominicana corriente contada sobre la música.

Estuvo a punto de irse a medicina. Lo que la trajo de vuelta fue escribir: descubrió que podía poner lo que sentía en una canción con más claridad que de cualquier otra manera, y desde entonces escribe lo suyo.

**MSM**

A los dieciséis se fue a Los Ángeles y ganó el primer lugar en un concurso de canto y actuación. De ahí pasó a Miami y firmó con Emilio Estefan, Tommy Mottola y Sony Music, entrando a MSM, un grupo armado bajo la dirección de Estefan y al que le pusieron el nombre de Miami Sound Machine.

El grupo entró en listas internacionales y sacó oro y platino en España, y ella compartió tarima con Celine Dion, Marc Anthony, Paulina Rubio y Julio Iglesias. Para una cantante dominicana, un asiento dentro de la operación de Estefan era la ruta más corta que existía hacia esa escala.

**No Es Normal**

Nunca soltó la idea de ser solista. Su primer álbum llegó en 2011, producido por Richy Peña, y el sencillo No Es Normal alcanzó el top cinco de la lista Tropical Latin de Mediabase. Fuego aparece en él.

Get Loose entró al año siguiente en la banda sonora de Step Up Revolution, y Con Mi Gente en la colección Caribe 2012.

Lo que escribe se lo dirige a las mujeres, y la música que va debajo es merengue, cumbia y bachata doblados dentro del pop urbano: una dominicana haciendo música tropical desde adentro de la industria estadounidense y no desde la isla.',
       updated_at = now()
 WHERE slug = 'sohanny-sua';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sohanny-sua')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sohanny-sua')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Sohanny Sua, who records as Sohanny, is a Dominican singer and songwriter born in Santo Domingo. She sang in MSM under Emilio Estefan before going out on her own.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rhode Island","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She grew up in a house where her father told her that dancing has no rules and music is felt from the inside, and where her mother played ","type":"text"},{"type":"artistReference","attrs":{"artistId":"876ede84-627b-4f24-ae9a-04ba7e02ff09","displayText":"Ángela Carrasco","occurrenceId":"ffad1f02-da56-4b2c-9b21-66bb6a7f7956"}},{"text":" and Lola Flores. She copied her mother at family gatherings using a wooden spoon for a microphone.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 1993 the family emigrated to Rhode Island and started over, which is the ordinary Dominican story told from the inside rather than the ordinary Dominican story told about music.","type":"text"}]},{"type":"paragraph","content":[{"text":"She nearly went to medicine instead. What pulled her back was writing: she found she could put what she felt into a song more plainly than any other way, and she has written her own material since.","type":"text"}]},{"type":"paragraph","content":[{"text":"MSM","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"At sixteen she went to Los Angeles and won first place in a singing and acting contest. She moved on to Miami and signed with Emilio Estefan, Tommy Mottola and Sony Music, joining MSM — a group assembled under Estefan’s management and given the Miami Sound Machine name.","type":"text"}]},{"type":"paragraph","content":[{"text":"The group charted internationally and took gold and platinum in Spain, and she shared stages with Celine Dion, Marc Anthony, Paulina Rubio and Julio Iglesias. For a Dominican singer, a seat inside the Estefan operation was the shortest route to that scale that existed.","type":"text"}]},{"type":"paragraph","content":[{"text":"No Es Normal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She never gave up the idea of being a soloist. Her first album arrived in 2011, produced by Richy Peña, and the single No Es Normal reached the top five of Mediabase’s Tropical Latin chart. Fuego appears on it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Get Loose went onto the Step Up Revolution soundtrack the following year, and Con Mi Gente onto the Caribe 2012 collection.","type":"text"}]},{"type":"paragraph","content":[{"text":"What she writes she aims at women, and the music underneath it is merengue, cumbia and bachata folded into urban pop — a Dominican making tropical music from inside the American industry rather than from the island.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'sohanny-sua'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Sohanny Sua, que graba como Sohanny, es una cantante y compositora dominicana nacida en Santo Domingo. Cantó en MSM bajo Emilio Estefan antes de salir por su cuenta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rhode Island","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se crió en una casa donde su padre le decía que el bailar no tiene reglas y la música se siente por dentro, y donde su madre ponía a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"876ede84-627b-4f24-ae9a-04ba7e02ff09","displayText":"Ángela Carrasco","occurrenceId":"b93eef04-3ac5-40fa-9b98-ff957e265ec0"}},{"text":" y a Lola Flores. Ella la imitaba en las reuniones familiares usando una cuchara de palo como micrófono.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 1993 la familia emigró a Rhode Island y empezó de cero, que es la historia dominicana corriente contada desde adentro y no la historia dominicana corriente contada sobre la música.","type":"text"}]},{"type":"paragraph","content":[{"text":"Estuvo a punto de irse a medicina. Lo que la trajo de vuelta fue escribir: descubrió que podía poner lo que sentía en una canción con más claridad que de cualquier otra manera, y desde entonces escribe lo suyo.","type":"text"}]},{"type":"paragraph","content":[{"text":"MSM","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A los dieciséis se fue a Los Ángeles y ganó el primer lugar en un concurso de canto y actuación. De ahí pasó a Miami y firmó con Emilio Estefan, Tommy Mottola y Sony Music, entrando a MSM, un grupo armado bajo la dirección de Estefan y al que le pusieron el nombre de Miami Sound Machine.","type":"text"}]},{"type":"paragraph","content":[{"text":"El grupo entró en listas internacionales y sacó oro y platino en España, y ella compartió tarima con Celine Dion, Marc Anthony, Paulina Rubio y Julio Iglesias. Para una cantante dominicana, un asiento dentro de la operación de Estefan era la ruta más corta que existía hacia esa escala.","type":"text"}]},{"type":"paragraph","content":[{"text":"No Es Normal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nunca soltó la idea de ser solista. Su primer álbum llegó en 2011, producido por Richy Peña, y el sencillo No Es Normal alcanzó el top cinco de la lista Tropical Latin de Mediabase. Fuego aparece en él.","type":"text"}]},{"type":"paragraph","content":[{"text":"Get Loose entró al año siguiente en la banda sonora de Step Up Revolution, y Con Mi Gente en la colección Caribe 2012.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que escribe se lo dirige a las mujeres, y la música que va debajo es merengue, cumbia y bachata doblados dentro del pop urbano: una dominicana haciendo música tropical desde adentro de la industria estadounidense y no desde la isla.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'sohanny-sua'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sohanny-sua') AND locale = 'en'), 'ffad1f02-da56-4b2c-9b21-66bb6a7f7956', 'artist', '876ede84-627b-4f24-ae9a-04ba7e02ff09');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sohanny-sua') AND locale = 'es'), 'b93eef04-3ac5-40fa-9b98-ff957e265ec0', 'artist', '876ede84-627b-4f24-ae9a-04ba7e02ff09');

COMMIT;
