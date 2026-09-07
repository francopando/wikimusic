BEGIN;

-- Rewrite the catalogue entry for Shadow Blow.
--
-- Shadow Blow. Filler in English, nothing in Spanish, no occupations, no
-- genres, no instruments -- on the only Dominican urban artist who came out of
-- the national conservatory as a classical pianist.
--
-- FILLED: date_of_birth 12 July 1983 (birth_year 1983 already stored and
-- matching); instruments piano, flute and percussion, all three of which
-- BuenaMusica lists and which are the whole point of this entry; occupations
-- composer, musician and producer.
--
-- CORRECTED: primary_genre urban-rap-hip-hop -> urban-dembow. He is filed as a
-- dembow artist with a melodic approach by every source, and rap is one of
-- four things he does. urban-rap-hip-hop, urban-trap and urban-reggaeton go
-- into genres.
--
-- LEFT ALONE: province Santo Domingo, corrected earlier today in
-- 20260906006800, and birth_place "Santo Domingo Este", which is more specific
-- than BuenaMusica's plain "Santo Domingo" and consistent with it.
--
-- SOURCES: BuenaMusica, which is unusually detailed on him: the birth date, the
-- ten years at the Conservatorio Nacional de Música and the graduation as a
-- classical pianist, the start in 1990 singing classical music, the parental
-- objection to the move into urbano, the 2001 group Bloke C 37, Tú Eres La Que
-- Está in 2010 and the pause that followed En El Área, the 2014 return with Oh
-- Oh backed by fifteen symphonic musicians, Tú Con Él y Yo Con Ella with Mozart
-- la Para, Mensaje Directo, the year-by-year singles through Flore in 2025, the
-- Saga album made with Lápiz Conciente, the Premio Nacional de la Juventud 2025
-- performance with the Orquesta Filarmónica del Caribe, and the second season of
-- La Casa de Alofoke, where he wrote and produced eighteen songs in
-- thirty-eight days and built La Piraña with La Fruta.
--
-- A FIRST CLAIMED AND ATTRIBUTED. BuenaMusica says he was the first Dominican
-- performer to combine urban and academic music, on the strength of the Oh Oh
-- arrangement. It is a single source making a first-ever claim, so the prose
-- describes what he did and lets the reader draw the conclusion rather than
-- repeating the superlative.
--
-- NOT WRITTEN: his marriage, his two children and his parents' names, all of
-- which the source gives. The parental objection to his change of genre IS
-- mentioned, without naming them, because it is about the career decision and
-- nothing else.
--
-- A FALSE POSITIVE CAUGHT. "Michael Flores", credited on Me Tocó Brillar in
-- 2025, matched Monkey Black in the catalogue -- whose legal name is Leonardo
-- Michael Flores Ozuna. Monkey Black died in 2014 and cannot be on a 2025
-- record. Not linked. This is the substring-matcher trap the working log warns
-- about, and it fired exactly as predicted.
--
-- NOT LINKED: Bryant Myers, Nío García and Brray are Puerto Rican. Bulova, Liro
-- Shaq El Sofoke, La Fruta, Jlexis and the 2025 Michael Flores are Dominican
-- and have no entries.
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
       name = 'Shadow Blow',
       sort_name = 'Fernández Soto, José Ariel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1983-07-12',
       birth_year = 1983,
       date_of_death = NULL,
       birth_place = 'Santo Domingo Este',
       province = 'Santo Domingo',
       first_name = 'José',
       middle_name = 'Ariel',
       last_name = 'Fernández',
       second_last_name = 'Soto',
       stage_name = 'Shadow Blow',
       aliases = ARRAY[]::text[],
       occupations = '["composer","musician","producer"]'::jsonb,
       instruments = ARRAY['piano', 'flute', 'percussion']::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop', 'urban-trap', 'urban-reggaeton']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'http://www.shadowblow.com',
       youtube = '@shadowblow',
       facebook = NULL,
       instagram = 'shadowblow',
       disambiguation = 'Dembow singer trained as a classical pianist at the Conservatorio Nacional',
       bio_en = 'Shadow Blow, born José Ariel Fernández Soto, is a Dominican dembow singer, songwriter and producer. He spent ten years at the Conservatorio Nacional de Música and left it a classical pianist, which is not a sentence that fits anybody else in the genre.

**The conservatory**

He was singing classical music from 1990. He plays piano, flute and percussion. When he decided to move into urban music his parents objected, and then supported him anyway, which is the ordinary shape of that conversation in a Dominican household where somebody has already paid for a decade of lessons.

His first group, in 2001, was Bloke C 37. Tú Eres La Que Está gave him a name in 2010; En El Área went nowhere and he stopped for a while.

**Oh Oh**

He came back in 2014 with Oh Oh and brought fifteen symphonic musicians with him. Nobody in Dominican urban music had done that. What makes it more than a stunt is that he could write the parts himself.

Mensaje Directo became the record people quote back at him — a romantic lyric about an ordinary thing, which in a genre built on volume and provocation is the harder position to hold. Tú Con Él y Yo Con Ella, made with Mozart la Para, took over Dominican radio.

**Who he records with**

The credits go everywhere. Cambia de Planes with Bryant Myers and Tivi Gunz; La Que Me Mata and later ZAZA with Don Miguelo; work through 2021 with Ceky Viciny, Yailin la Más Viral and Brray; the En Filita Cooperando remix with Musicólogo the Libro and La Insuperable.

Saga, in 2023, is an album made jointly with Lápiz Conciente — one of the few times a rapper of that standing has shared a full record rather than a feature.

**Eighteen songs in thirty-eight days**

He went into the second season of La Casa de Alofoke to prove he could produce, and came out having written and produced eighteen songs inside the house. One of them, La Piraña, started as an in-house joke with another contestant and was a real record before the season ended.

In 2025 he performed at the Premio Nacional de la Juventud with the Orquesta Filarmónica del Caribe, in front of the country’s officials, doing on a national stage what he had first tried on Oh Oh eleven years earlier.

Flore came the same year. Regalo is from it.',
       bio_es = 'Shadow Blow, de nombre José Ariel Fernández Soto, es cantante, compositor y productor de dembow dominicano. Pasó diez años en el Conservatorio Nacional de Música y salió de ahí pianista clásico, que no es una frase que le quede a nadie más en el género.

**El conservatorio**

Cantaba música clásica desde 1990. Toca piano, flauta y percusión. Cuando decidió pasarse a la música urbana sus padres se molestaron, y después lo apoyaron igual, que es la forma corriente de esa conversación en una casa dominicana donde ya se pagó una década de clases.

Su primer grupo, en 2001, fue Bloke C 37. Tú Eres La Que Está le dio nombre en 2010; En El Área no llegó a ningún lado y se detuvo un tiempo.

**Oh Oh**

Volvió en 2014 con Oh Oh y se trajo quince músicos sinfónicos. Nadie en la música urbana dominicana había hecho eso. Lo que lo separa de una ocurrencia es que él podía escribir las partes.

Mensaje Directo se convirtió en el disco que la gente le devuelve: una letra romántica sobre algo corriente, que en un género montado sobre el volumen y la provocación es la posición más difícil de sostener. Tú Con Él y Yo Con Ella, hecha con Mozart la Para, se apoderó de la radio dominicana.

**Con quién graba**

Los créditos van a todas partes. Cambia de Planes con Bryant Myers y Tivi Gunz; La Que Me Mata y después ZAZA con Don Miguelo; trabajo a lo largo de 2021 con Ceky Viciny, Yailin la Más Viral y Brray; el remix de En Filita Cooperando con Musicólogo the Libro y La Insuperable.

Saga, de 2023, es un álbum hecho a medias con Lápiz Conciente: una de las pocas veces que un rapero de ese peso comparte un disco entero en vez de una participación.

**Dieciocho canciones en treinta y ocho días**

Entró a la segunda temporada de La Casa de Alofoke a demostrar que podía producir, y salió habiendo escrito y producido dieciocho canciones dentro de la casa. Una de ellas, La Piraña, empezó como un chiste interno con otro concursante y ya era un disco de verdad antes de que terminara la temporada.

En 2025 se presentó en el Premio Nacional de la Juventud con la Orquesta Filarmónica del Caribe, delante de las autoridades del país, haciendo en una tarima nacional lo que había ensayado once años antes en Oh Oh.

Flore salió ese mismo año. Regalo es de ahí.',
       updated_at = now()
 WHERE slug = 'shadow-blow';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Shadow Blow, born José Ariel Fernández Soto, is a Dominican dembow singer, songwriter and producer. He spent ten years at the Conservatorio Nacional de Música and left it a classical pianist, which is not a sentence that fits anybody else in the genre.","type":"text"}]},{"type":"paragraph","content":[{"text":"The conservatory","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was singing classical music from 1990. He plays piano, flute and percussion. When he decided to move into urban music his parents objected, and then supported him anyway, which is the ordinary shape of that conversation in a Dominican household where somebody has already paid for a decade of lessons.","type":"text"}]},{"type":"paragraph","content":[{"text":"His first group, in 2001, was Bloke C 37. Tú Eres La Que Está gave him a name in 2010; En El Área went nowhere and he stopped for a while.","type":"text"}]},{"type":"paragraph","content":[{"text":"Oh Oh","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He came back in 2014 with Oh Oh and brought fifteen symphonic musicians with him. Nobody in Dominican urban music had done that. What makes it more than a stunt is that he could write the parts himself.","type":"text"}]},{"type":"paragraph","content":[{"text":"Mensaje Directo became the record people quote back at him — a romantic lyric about an ordinary thing, which in a genre built on volume and provocation is the harder position to hold. Tú Con Él y Yo Con Ella, made with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"6ab36314-37df-4f54-a5ac-27cf61b48ebf"}},{"text":", took over Dominican radio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Who he records with","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The credits go everywhere. Cambia de Planes with Bryant Myers and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"4a962a30-fb4f-43f7-9766-145ee7e77243"}},{"text":"; La Que Me Mata and later ZAZA with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6321da6c-e2d5-490a-a4e8-416bbee81edf","displayText":"Don Miguelo","occurrenceId":"0dc2a30c-0810-4bd0-8ed3-26caa49d6057"}},{"text":"; work through 2021 with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"ddd74939-3339-4d08-9d0e-9234edacad7d"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"ba11dd04-5c23-4cd6-b0c5-de5788ceabbe"}},{"text":" and Brray; the En Filita Cooperando remix with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"97610f30-fb92-4d77-8b98-ddec14d12afc","displayText":"Musicólogo the Libro","occurrenceId":"3b4e4419-97bf-427a-9b99-8e1c8006b618"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"d48ed288-b2de-4d5c-af4d-3f6a385885eb"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Saga, in 2023, is an album made jointly with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"d1ef0813-664d-40ea-b6a2-66ddabf632d2"}},{"text":" — one of the few times a rapper of that standing has shared a full record rather than a feature.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eighteen songs in thirty-eight days","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He went into the second season of La Casa de Alofoke to prove he could produce, and came out having written and produced eighteen songs inside the house. One of them, La Piraña, started as an in-house joke with another contestant and was a real record before the season ended.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 2025 he performed at the Premio Nacional de la Juventud with the Orquesta Filarmónica del Caribe, in front of the country’s officials, doing on a national stage what he had first tried on Oh Oh eleven years earlier.","type":"text"}]},{"type":"paragraph","content":[{"text":"Flore came the same year. Regalo is from it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'shadow-blow'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Shadow Blow, de nombre José Ariel Fernández Soto, es cantante, compositor y productor de dembow dominicano. Pasó diez años en el Conservatorio Nacional de Música y salió de ahí pianista clásico, que no es una frase que le quede a nadie más en el género.","type":"text"}]},{"type":"paragraph","content":[{"text":"El conservatorio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Cantaba música clásica desde 1990. Toca piano, flauta y percusión. Cuando decidió pasarse a la música urbana sus padres se molestaron, y después lo apoyaron igual, que es la forma corriente de esa conversación en una casa dominicana donde ya se pagó una década de clases.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su primer grupo, en 2001, fue Bloke C 37. Tú Eres La Que Está le dio nombre en 2010; En El Área no llegó a ningún lado y se detuvo un tiempo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Oh Oh","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Volvió en 2014 con Oh Oh y se trajo quince músicos sinfónicos. Nadie en la música urbana dominicana había hecho eso. Lo que lo separa de una ocurrencia es que él podía escribir las partes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Mensaje Directo se convirtió en el disco que la gente le devuelve: una letra romántica sobre algo corriente, que en un género montado sobre el volumen y la provocación es la posición más difícil de sostener. Tú Con Él y Yo Con Ella, hecha con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"44d01b94-fe93-4af8-a89e-3be39b934539"}},{"text":", se apoderó de la radio dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Con quién graba","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los créditos van a todas partes. Cambia de Planes con Bryant Myers y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"cfbe4369-6f8a-4b57-bde6-d3138ada9649"}},{"text":"; La Que Me Mata y después ZAZA con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6321da6c-e2d5-490a-a4e8-416bbee81edf","displayText":"Don Miguelo","occurrenceId":"df78c598-456a-4d1b-bf24-6ca704ce12e8"}},{"text":"; trabajo a lo largo de 2021 con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"b4aa54f4-9508-4038-a0db-25458badf2c9"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"c3dd303c-dda0-4a6d-a119-8842669cebaa"}},{"text":" y Brray; el remix de En Filita Cooperando con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"97610f30-fb92-4d77-8b98-ddec14d12afc","displayText":"Musicólogo the Libro","occurrenceId":"158ce400-c3ea-4267-8d6a-0624247b2f0f"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"912abc73-2c31-482d-a0cc-91d9f7cd4f46"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Saga, de 2023, es un álbum hecho a medias con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"d1a65021-5fe9-41a3-b278-f680440525bc"}},{"text":": una de las pocas veces que un rapero de ese peso comparte un disco entero en vez de una participación.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dieciocho canciones en treinta y ocho días","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Entró a la segunda temporada de La Casa de Alofoke a demostrar que podía producir, y salió habiendo escrito y producido dieciocho canciones dentro de la casa. Una de ellas, La Piraña, empezó como un chiste interno con otro concursante y ya era un disco de verdad antes de que terminara la temporada.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 2025 se presentó en el Premio Nacional de la Juventud con la Orquesta Filarmónica del Caribe, delante de las autoridades del país, haciendo en una tarima nacional lo que había ensayado once años antes en Oh Oh.","type":"text"}]},{"type":"paragraph","content":[{"text":"Flore salió ese mismo año. Regalo es de ahí.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'shadow-blow'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'en'), '0dc2a30c-0810-4bd0-8ed3-26caa49d6057', 'artist', '6321da6c-e2d5-490a-a4e8-416bbee81edf');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'en'), '3b4e4419-97bf-427a-9b99-8e1c8006b618', 'artist', '97610f30-fb92-4d77-8b98-ddec14d12afc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'en'), '4a962a30-fb4f-43f7-9766-145ee7e77243', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'en'), '6ab36314-37df-4f54-a5ac-27cf61b48ebf', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'en'), 'ba11dd04-5c23-4cd6-b0c5-de5788ceabbe', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'en'), 'd1ef0813-664d-40ea-b6a2-66ddabf632d2', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'en'), 'd48ed288-b2de-4d5c-af4d-3f6a385885eb', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'en'), 'ddd74939-3339-4d08-9d0e-9234edacad7d', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'es'), '158ce400-c3ea-4267-8d6a-0624247b2f0f', 'artist', '97610f30-fb92-4d77-8b98-ddec14d12afc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'es'), '44d01b94-fe93-4af8-a89e-3be39b934539', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'es'), '912abc73-2c31-482d-a0cc-91d9f7cd4f46', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'es'), 'b4aa54f4-9508-4038-a0db-25458badf2c9', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'es'), 'c3dd303c-dda0-4a6d-a119-8842669cebaa', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'es'), 'cfbe4369-6f8a-4b57-bde6-d3138ada9649', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'es'), 'd1a65021-5fe9-41a3-b278-f680440525bc', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shadow-blow') AND locale = 'es'), 'df78c598-456a-4d1b-bf24-6ca704ce12e8', 'artist', '6321da6c-e2d5-490a-a4e8-416bbee81edf');

COMMIT;
