BEGIN;

-- Rewrite the catalogue entry for Poeta Callejero.
--
-- Poeta Callejero. Filler in English, nothing in Spanish, no occupations, no
-- genres, no aliases -- on the artist whose song became, in January 2026, the
-- first AI-assisted track ever to enter a Billboard Latin chart.
--
-- PROVINCE CORRECTED: "Distrito Nacional" -> "San Juan". The row already stored
-- birth_place "San Juan de la Maguana", which is the capital of San Juan
-- province, and the province column said otherwise. Second of the two
-- province/birthplace contradictions found by sweeping for birthplaces that
-- name a province outright; the other was Vakeró.
--
-- FILLED: date_of_birth 8 June 1989, given identically by BuenaMusica,
-- Conéctate, TranKYouTV and IMDb. birth_year 1989 was already stored.
--
-- ADDED: occupations composer; genres; aliases El Poeta Callejero, which is how
-- he is billed almost everywhere including from inside this catalogue;
-- disambiguation.
--
-- A SPELLING CONFLICT, RECORDED. Billboard writes the legal name "Gerardo
-- Gabriel Santana". BuenaMusica, Conéctate, IMDb, TranKYouTV and RCC Noticias
-- all write "Geraldo". The stored "Geraldo" is kept as the majority and better-
-- established form; Billboard is a single outside source and the likeliest
-- explanation is an editor correcting an unfamiliar name into a familiar one.
--
-- SOURCES: TranKYouTV, his own label, for the birth date and for the account
-- that anchors this entry -- that in 1998 the dam at San Juan overflowed during
-- Hurricane Georges and he went from having what he needed to having nothing,
-- and that those events are the subject of his first records, among them 16 de
-- Mayo. Hoy, 13 December 2009, "El Poeta Callejero, de sobreviviente a gran
-- exponente", and its note that he was born in the Mesopotamia neighbourhood of
-- San Juan de la Maguana. Billboard's Chart Beat, 30 January 2026, and De
-- Último Minuto the following day, on the 4AMTapes reworking of Bonita Bonita
-- entering Hot Latin Pop Songs, and for the detail that the original appeared
-- on the 2014 album Hagan Sus Diligencias for Machete Music. RCC Noticias and
-- De Último Minuto on the 2025 single VIH. Otros 500 on the Vulcano Music
-- signing of him and his catalogue. BuenaMusica and IMDb for the legal name.
--
-- NOT WRITTEN: play counts. The 2009 article and several later ones touch on
-- hardship in his household; the flood is in because his label states it is the
-- subject of the songs, and nothing else about his family is.
--
-- NOT LINKED: 4AMTapes is not a Dominican artist but a production project, and
-- is named without a reference. Éxodo Lirical and Diego Alberto have no
-- entries.
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
       name = 'Poeta Callejero',
       sort_name = 'Santana, Geraldo Gabriel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = '1989-06-08',
       birth_year = 1989,
       date_of_death = NULL,
       birth_place = 'San Juan de la Maguana',
       province = 'San Juan',
       first_name = 'Geraldo',
       middle_name = 'Gabriel',
       last_name = 'Santana',
       second_last_name = NULL,
       stage_name = 'El Poeta Callejero',
       aliases = ARRAY['El Poeta Callejero']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-reggaeton']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@ElPoetaCallejero',
       facebook = 'PoetaCalle',
       instagram = 'elpoetacallejero',
       disambiguation = 'Rapper from San Juan de la Maguana; Bonita Bonita, Un Loco Como Yo',
       bio_en = 'Poeta Callejero, born Geraldo Gabriel Santana, is a Dominican rapper and songwriter from San Juan de la Maguana. He is from the Mesopotamia neighbourhood of a town in the deep south-west, which is not where the Dominican urban industry lives.

**The water**

In 1998 Hurricane Georges crossed the island and the dam above San Juan came over. He was nine. His own label puts it plainly: he went from having what he needed to having nothing.

That is where the songs came from. The first records he made — 16 de Mayo among them — take the flood and what followed it as their subject, which is an unusual thing for a teenage rapper to be writing about, and it is why a 2009 newspaper piece introduced him as a survivor before it introduced him as a performer.

**Bonita Bonita**

Hagan Sus Diligencias came out in 2014 on Machete Music and carried Un Loco Como Yo, Historia de Amor, Baby You, Esperando Por Ti, Contigo Aprendí, and Bonita Bonita. The last of those became the song people know him by. 10 Mujeres belongs to the same run.

He has kept it working since — a jazz version of his own, a catalogue deal with Vulcano Music, and in 2025 a single called VIH, which does what the early records did and puts a hard subject in a dance track.

He has also shared bills and arguments with the rest of the field; El Mayor Clásico names him.

**The first AI record on a Billboard Latin chart**

In January 2026 an AI-assisted reworking of Bonita Bonita, credited to the project 4AMTapes, entered Billboard’s Hot Latin Pop Songs. Billboard reported it as the first known AI-assisted song to reach any of its Latin charts.

So the record that crossed that particular line was not a new composition and not a synthetic voice invented for the purpose. It was a twelve-year-old Dominican song, written by a man from San Juan de la Maguana about a place most people outside the country could not find, run through a machine and sent back out.

His own reaction, posted the week it happened, was six words long: a moped last week, Billboard now.',
       bio_es = 'Poeta Callejero, de nombre Geraldo Gabriel Santana, es rapero y compositor dominicano de San Juan de la Maguana. Es del barrio Mesopotamia de un pueblo del suroeste profundo, que no es donde vive la industria urbana dominicana.

**El agua**

En 1998 el huracán Georges cruzó la isla y la presa de San Juan se desbordó. Él tenía nueve años. Su propio sello lo dice sin rodeos: pasó de tener lo necesario a no tener nada.

De ahí salieron las canciones. Los primeros discos que hizo —16 de Mayo entre ellos— toman la inundación y lo que vino después como asunto, que es una cosa rara sobre la que escriba un rapero adolescente, y es por lo que un artículo de periódico de 2009 lo presentó como sobreviviente antes que como intérprete.

**Bonita Bonita**

Hagan Sus Diligencias salió en 2014 por Machete Music y traía Un Loco Como Yo, Historia de Amor, Baby You, Esperando Por Ti, Contigo Aprendí y Bonita Bonita. Esta última se convirtió en la canción por la que la gente lo conoce. 10 Mujeres es de la misma tanda.

Desde entonces la ha mantenido viva: una versión suya en jazz, un acuerdo de catálogo con Vulcano Music, y en 2025 un sencillo llamado VIH, que hace lo que hacían los discos tempranos y mete un asunto duro dentro de un tema bailable.

También ha compartido cartel y discusiones con el resto del campo; El Mayor Clásico lo nombra.

**El primer disco de IA en una lista latina de Billboard**

En enero de 2026 una reelaboración de Bonita Bonita asistida por inteligencia artificial, acreditada al proyecto 4AMTapes, entró al Hot Latin Pop Songs de Billboard. La revista lo reportó como la primera canción conocida hecha con asistencia de IA en llegar a alguna de sus listas latinas.

Así que el disco que cruzó esa raya no fue una composición nueva ni una voz sintética inventada para el caso. Fue una canción dominicana de doce años atrás, escrita por un hombre de San Juan de la Maguana sobre un lugar que casi nadie fuera del país sabría encontrar, pasada por una máquina y devuelta al aire.

Su propia reacción, publicada la semana en que ocurrió, cabía en una línea: hace una semana en la pasola, ahora en Billboard.',
       updated_at = now()
 WHERE slug = 'poeta-callejero';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'poeta-callejero')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'poeta-callejero')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Poeta Callejero, born Geraldo Gabriel Santana, is a Dominican rapper and songwriter from San Juan de la Maguana. He is from the Mesopotamia neighbourhood of a town in the deep south-west, which is not where the Dominican urban industry lives.","type":"text"}]},{"type":"paragraph","content":[{"text":"The water","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 1998 Hurricane Georges crossed the island and the dam above San Juan came over. He was nine. His own label puts it plainly: he went from having what he needed to having nothing.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is where the songs came from. The first records he made — 16 de Mayo among them — take the flood and what followed it as their subject, which is an unusual thing for a teenage rapper to be writing about, and it is why a 2009 newspaper piece introduced him as a survivor before it introduced him as a performer.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bonita Bonita","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Hagan Sus Diligencias came out in 2014 on Machete Music and carried Un Loco Como Yo, Historia de Amor, Baby You, Esperando Por Ti, Contigo Aprendí, and Bonita Bonita. The last of those became the song people know him by. 10 Mujeres belongs to the same run.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has kept it working since — a jazz version of his own, a catalogue deal with Vulcano Music, and in 2025 a single called VIH, which does what the early records did and puts a hard subject in a dance track.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has also shared bills and arguments with the rest of the field; ","type":"text"},{"type":"artistReference","attrs":{"artistId":"518354a4-7cb9-4c39-a2b8-9fa4d18f50db","displayText":"El Mayor Clásico","occurrenceId":"ff67771a-890b-4d79-ace8-435b2b860a04"}},{"text":" names him.","type":"text"}]},{"type":"paragraph","content":[{"text":"The first AI record on a Billboard Latin chart","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In January 2026 an AI-assisted reworking of Bonita Bonita, credited to the project 4AMTapes, entered Billboard’s Hot Latin Pop Songs. Billboard reported it as the first known AI-assisted song to reach any of its Latin charts.","type":"text"}]},{"type":"paragraph","content":[{"text":"So the record that crossed that particular line was not a new composition and not a synthetic voice invented for the purpose. It was a twelve-year-old Dominican song, written by a man from San Juan de la Maguana about a place most people outside the country could not find, run through a machine and sent back out.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own reaction, posted the week it happened, was six words long: a moped last week, Billboard now.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'poeta-callejero'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Poeta Callejero, de nombre Geraldo Gabriel Santana, es rapero y compositor dominicano de San Juan de la Maguana. Es del barrio Mesopotamia de un pueblo del suroeste profundo, que no es donde vive la industria urbana dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"El agua","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1998 el huracán Georges cruzó la isla y la presa de San Juan se desbordó. Él tenía nueve años. Su propio sello lo dice sin rodeos: pasó de tener lo necesario a no tener nada.","type":"text"}]},{"type":"paragraph","content":[{"text":"De ahí salieron las canciones. Los primeros discos que hizo —16 de Mayo entre ellos— toman la inundación y lo que vino después como asunto, que es una cosa rara sobre la que escriba un rapero adolescente, y es por lo que un artículo de periódico de 2009 lo presentó como sobreviviente antes que como intérprete.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bonita Bonita","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Hagan Sus Diligencias salió en 2014 por Machete Music y traía Un Loco Como Yo, Historia de Amor, Baby You, Esperando Por Ti, Contigo Aprendí y Bonita Bonita. Esta última se convirtió en la canción por la que la gente lo conoce. 10 Mujeres es de la misma tanda.","type":"text"}]},{"type":"paragraph","content":[{"text":"Desde entonces la ha mantenido viva: una versión suya en jazz, un acuerdo de catálogo con Vulcano Music, y en 2025 un sencillo llamado VIH, que hace lo que hacían los discos tempranos y mete un asunto duro dentro de un tema bailable.","type":"text"}]},{"type":"paragraph","content":[{"text":"También ha compartido cartel y discusiones con el resto del campo; ","type":"text"},{"type":"artistReference","attrs":{"artistId":"518354a4-7cb9-4c39-a2b8-9fa4d18f50db","displayText":"El Mayor Clásico","occurrenceId":"5eb6aae8-bb8d-4fb5-9812-2924629d9808"}},{"text":" lo nombra.","type":"text"}]},{"type":"paragraph","content":[{"text":"El primer disco de IA en una lista latina de Billboard","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En enero de 2026 una reelaboración de Bonita Bonita asistida por inteligencia artificial, acreditada al proyecto 4AMTapes, entró al Hot Latin Pop Songs de Billboard. La revista lo reportó como la primera canción conocida hecha con asistencia de IA en llegar a alguna de sus listas latinas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Así que el disco que cruzó esa raya no fue una composición nueva ni una voz sintética inventada para el caso. Fue una canción dominicana de doce años atrás, escrita por un hombre de San Juan de la Maguana sobre un lugar que casi nadie fuera del país sabría encontrar, pasada por una máquina y devuelta al aire.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su propia reacción, publicada la semana en que ocurrió, cabía en una línea: hace una semana en la pasola, ahora en Billboard.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'poeta-callejero'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'poeta-callejero') AND locale = 'en'), 'ff67771a-890b-4d79-ace8-435b2b860a04', 'artist', '518354a4-7cb9-4c39-a2b8-9fa4d18f50db');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'poeta-callejero') AND locale = 'es'), '5eb6aae8-bb8d-4fb5-9812-2924629d9808', 'artist', '518354a4-7cb9-4c39-a2b8-9fa4d18f50db');

COMMIT;
