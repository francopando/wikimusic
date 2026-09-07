BEGIN;

-- Rewrite the catalogue entry for Tivi Gunz.
--
-- Tivi Gunz. Filler in English, nothing in Spanish, no gender, no occupations,
-- no genres, no aliases -- on an artist with three hundred and twenty-three
-- videos on his own channel and the credit for launching Tokischa.
--
-- CORRECTED: birth_place "Santo Domingo" -> "Cristo Rey, Santo Domingo". El
-- Nuevo Diario names the barrio. Cristo Rey is in the Distrito Nacional, so the
-- stored province is right and stays. primary_role singer -> rapper. gender
-- null -> male.
--
-- GENRE CHANGED, AND THE EDITOR SHOULD OVERRULE IF HE DISAGREES: primary_genre
-- urbano -> urban-trap. El Nuevo Diario describes him as moving between trap,
-- rap and hip hop with equal fluency, and the recorded catalogue leans trap and
-- drill. urbano, urban-rap-hip-hop and urban-dembow all go into genres, because
-- he genuinely works in all of them. "Urbano" as a primary genre says almost
-- nothing, which is the reason for the change rather than any confidence that
-- trap is the last word on him.
--
-- ADDED: alias Tinta de Oro, which is both a nickname he was given for the
-- construction of his verses and the title of his first album; occupations
-- composer; disambiguation.
--
-- SOURCES: El Nuevo Diario, 26 December 2023, "Tivi Gunz 2023 un año lleno de
-- logros", which gives the legal name, the birth in Cristo Rey, the debut track
-- I Love U, the origin of the Tinta de Oro name, the collaborators, the 2023
-- singles -- Gass Pure, Zuculento, Kick Con El Bajo, Como Ella Baila Así,
-- Lokisla, Pá La 42, Soga, Que La Gualle -- and the year's tally: the Glamour
-- Music Awards win for urban collaboration of the year with Zuculento,
-- appearances at the Monitor Latino Awards in Santa Marta and at Premios
-- Juventud, first tours of Europe and the United States, and a song released
-- every week of the year. The same paper, 30 July 2023, on his being chosen as
-- the headline act of the thirty-fourth Gran Parada Dominicana del Bronx, and
-- 5 February 2023 on the departure for Europe. Spanish Wikipedia's Tokischa
-- article and several accounts of her career, all of which give Pícala, 2018,
-- with him, as her debut single. His own YouTube channel for the video list and
-- the collaborations. MusicBrainz for the release dates from Pícala, 2018, to
-- Si Te Vas, 2023.
--
-- AWARD NOT LOADED. The Glamour Music Awards do not exist in the awards table
-- and creating an award for a single row, on a single newspaper's year-end
-- list, is not worth the reference clutter. It is in the prose. If more
-- Glamour rows turn up the award should be created properly.
--
-- NOT WRITTEN: view and subscriber counts. Nothing about the public quarrels
-- two of the interviews are built on; they are about other artists.
--
-- NOT LINKED: Ozuna, Casper Mágico, Nio García, Justin Quiles, Tito El Bambino,
-- Slayter and Trappa are not Dominican. Treintisiete, Oldpurp, Onguito Wa, El
-- Crok, La Sádica, La Más Doll, 9UEVE, Goodgasolina, NTG, Donaty and Harryson
-- are Dominican and have no entries; Treintisiete and Onguito Wa are already on
-- the missing-artists list.
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
       name = 'Tivi Gunz',
       sort_name = 'Tivi Gunz',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-trap',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Cristo Rey, Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Stivi',
       middle_name = 'Randy',
       last_name = 'Álvarez',
       second_last_name = NULL,
       stage_name = 'Tivi Gunz',
       aliases = ARRAY['Tinta de Oro']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop', 'urban-dembow']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@TiviGunz',
       facebook = 'TiviGunzOficial',
       instagram = 'tivigunz',
       disambiguation = 'Rapper from Cristo Rey; Pícala, Gass Pure, Lokisla',
       bio_en = 'Tivi Gunz, born Stivi Randy Álvarez in Cristo Rey, is a Dominican rapper and songwriter. He moves between trap, rap and hip hop without settling in any of them, and he has been given a second name — Tinta de Oro — for how his verses are put together rather than for how they are delivered.

**Cristo Rey**

I Love U was the first thing he put out. Tinta de Oro was the first album, and the phrase stuck to him afterwards.

He came up through the same capital street circuit that produces most Dominican rap, and he has told the story of establishing himself in la 42, in Capotillo, at length and more than once. That is not a metaphor for a career — in Dominican urban music a street with a scene attached is a market, and taking one is the whole first act.

**Pícala**

In 2018 he cut Pícala with Tokischa. It was her first release, and it went past a million views in its first week. Whatever else he has done, that record is a hinge in Dominican music, and he is on the other side of it.

The credits since run across the field and out of it: Químico Ultra Mega, Don Miguelo, Yailin la Más Viral, Treintisiete and Onguito Wa at home; Ozuna on El Bloke; Casper Mágico and Nio García on the Selena remix; Justin Quiles, Tito El Bambino, Slayter and Trappa elsewhere.

**The year of the weekly single**

In 2023 he released a song every week for the whole year. Gass Pure, Zuculento, Kick Con El Bajo, Como Ella Baila Así, Lokisla, Pá La 42, Soga and Que La Gualle are the ones that stuck.

Zuculento took urban collaboration of the year at the Glamour Music Awards. He performed at the Monitor Latino Awards in Santa Marta and at Premios Juventud, made his first tours of Europe and the United States, and headlined the thirty-fourth Gran Parada Dominicana del Bronx on the Grand Concourse.

A weekly release schedule is a strategy, not a flourish: it treats the catalogue as something to be fed rather than curated, which is how a rapper stays on a platform’s algorithm without a label paying for him. That he could sustain it for fifty-two weeks says something about the writing.

**Selena and after**

Selena, Chuky 2, Coronao, Therian, Rubberz, Mentiras and Culpable are more recent. The freestyles keep coming too, which is where the Tinta de Oro name was earned in the first place.',
       bio_es = 'Tivi Gunz, de nombre Stivi Randy Álvarez y nacido en Cristo Rey, es rapero y compositor dominicano. Se mueve entre el trap, el rap y el hip hop sin quedarse en ninguno, y le pusieron un segundo nombre —Tinta de Oro— por cómo arma los versos y no por cómo los dice.

**Cristo Rey**

I Love U fue lo primero que sacó. Tinta de Oro fue el primer álbum, y de ahí en adelante la frase se le quedó pegada.

Se formó en el mismo circuito de calle de la capital que produce casi todo el rap dominicano, y ha contado largo y más de una vez cómo se estableció en la 42, en Capotillo. Eso no es una metáfora de carrera: en la música urbana dominicana una calle con escena encima es un mercado, y tomarse una es el primer acto completo.

**Pícala**

En 2018 grabó Pícala con Tokischa. Era el primer lanzamiento de ella, y pasó el millón de vistas en la primera semana. Haya hecho lo que haya hecho después, ese disco es una bisagra de la música dominicana, y él está del otro lado.

Los créditos desde entonces cruzan todo el campo y se salen de él: Químico Ultra Mega, Don Miguelo, Yailin la Más Viral, Treintisiete y Onguito Wa aquí; Ozuna en El Bloke; Casper Mágico y Nio García en el remix de Selena; Justin Quiles, Tito El Bambino, Slayter y Trappa por fuera.

**El año del sencillo semanal**

En 2023 sacó una canción por semana durante todo el año. Gass Pure, Zuculento, Kick Con El Bajo, Como Ella Baila Así, Lokisla, Pá La 42, Soga y Que La Gualle son las que quedaron.

Zuculento se llevó la colaboración urbana del año en los Glamour Music Awards. Se presentó en los Monitor Latino Awards de Santa Marta y en Premios Juventud, hizo sus primeras giras por Europa y Estados Unidos, y encabezó la trigésimo cuarta Gran Parada Dominicana del Bronx en el Grand Concourse.

Publicar semanalmente es una estrategia y no un adorno: trata el catálogo como algo que hay que alimentar y no que curar, que es como un rapero se mantiene en el algoritmo de una plataforma sin un sello pagándole. Que lo haya sostenido cincuenta y dos semanas dice algo sobre la escritura.

**Selena y después**

Selena, Chuky 2, Coronao, Therian, Rubberz, Mentiras y Culpable son más recientes. Los freestyles también siguen saliendo, que es donde se ganó el nombre de Tinta de Oro en primer lugar.',
       updated_at = now()
 WHERE slug = 'tivi-gunz';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Tivi Gunz, born Stivi Randy Álvarez in Cristo Rey, is a Dominican rapper and songwriter. He moves between trap, rap and hip hop without settling in any of them, and he has been given a second name — Tinta de Oro — for how his verses are put together rather than for how they are delivered.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cristo Rey","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"I Love U was the first thing he put out. Tinta de Oro was the first album, and the phrase stuck to him afterwards.","type":"text"}]},{"type":"paragraph","content":[{"text":"He came up through the same capital street circuit that produces most Dominican rap, and he has told the story of establishing himself in la 42, in Capotillo, at length and more than once. That is not a metaphor for a career — in Dominican urban music a street with a scene attached is a market, and taking one is the whole first act.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pícala","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2018 he cut Pícala with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"a5bb894e-23b5-4509-8ba4-ef6193a46b48"}},{"text":". It was her first release, and it went past a million views in its first week. Whatever else he has done, that record is a hinge in Dominican music, and he is on the other side of it.","type":"text"}]},{"type":"paragraph","content":[{"text":"The credits since run across the field and out of it: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"0ac82b75-2568-4822-8a16-421b59182d2c"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6321da6c-e2d5-490a-a4e8-416bbee81edf","displayText":"Don Miguelo","occurrenceId":"0421f1ed-749c-41ec-951b-594f60938ae7"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"6132e955-a14c-4061-8eb8-2dc8b73b1349"}},{"text":", Treintisiete and Onguito Wa at home; Ozuna on El Bloke; Casper Mágico and Nio García on the Selena remix; Justin Quiles, Tito El Bambino, Slayter and Trappa elsewhere.","type":"text"}]},{"type":"paragraph","content":[{"text":"The year of the weekly single","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2023 he released a song every week for the whole year. Gass Pure, Zuculento, Kick Con El Bajo, Como Ella Baila Así, Lokisla, Pá La 42, Soga and Que La Gualle are the ones that stuck.","type":"text"}]},{"type":"paragraph","content":[{"text":"Zuculento took urban collaboration of the year at the Glamour Music Awards. He performed at the Monitor Latino Awards in Santa Marta and at Premios Juventud, made his first tours of Europe and the United States, and headlined the thirty-fourth Gran Parada Dominicana del Bronx on the Grand Concourse.","type":"text"}]},{"type":"paragraph","content":[{"text":"A weekly release schedule is a strategy, not a flourish: it treats the catalogue as something to be fed rather than curated, which is how a rapper stays on a platform’s algorithm without a label paying for him. That he could sustain it for fifty-two weeks says something about the writing.","type":"text"}]},{"type":"paragraph","content":[{"text":"Selena and after","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Selena, Chuky 2, Coronao, Therian, Rubberz, Mentiras and Culpable are more recent. The freestyles keep coming too, which is where the Tinta de Oro name was earned in the first place.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'tivi-gunz'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Tivi Gunz, de nombre Stivi Randy Álvarez y nacido en Cristo Rey, es rapero y compositor dominicano. Se mueve entre el trap, el rap y el hip hop sin quedarse en ninguno, y le pusieron un segundo nombre —Tinta de Oro— por cómo arma los versos y no por cómo los dice.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cristo Rey","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"I Love U fue lo primero que sacó. Tinta de Oro fue el primer álbum, y de ahí en adelante la frase se le quedó pegada.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se formó en el mismo circuito de calle de la capital que produce casi todo el rap dominicano, y ha contado largo y más de una vez cómo se estableció en la 42, en Capotillo. Eso no es una metáfora de carrera: en la música urbana dominicana una calle con escena encima es un mercado, y tomarse una es el primer acto completo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pícala","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2018 grabó Pícala con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"30f65467-0148-4fd3-bc8f-e80f0788cd36"}},{"text":". Era el primer lanzamiento de ella, y pasó el millón de vistas en la primera semana. Haya hecho lo que haya hecho después, ese disco es una bisagra de la música dominicana, y él está del otro lado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los créditos desde entonces cruzan todo el campo y se salen de él: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"9e5db94b-2c7b-4d8f-9bb7-d74763841f4d"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6321da6c-e2d5-490a-a4e8-416bbee81edf","displayText":"Don Miguelo","occurrenceId":"60a62104-8814-4bfb-8bed-639b9a02bdc1"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"26f6dca8-544b-4f14-b1f6-7217a10d003d"}},{"text":", Treintisiete y Onguito Wa aquí; Ozuna en El Bloke; Casper Mágico y Nio García en el remix de Selena; Justin Quiles, Tito El Bambino, Slayter y Trappa por fuera.","type":"text"}]},{"type":"paragraph","content":[{"text":"El año del sencillo semanal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2023 sacó una canción por semana durante todo el año. Gass Pure, Zuculento, Kick Con El Bajo, Como Ella Baila Así, Lokisla, Pá La 42, Soga y Que La Gualle son las que quedaron.","type":"text"}]},{"type":"paragraph","content":[{"text":"Zuculento se llevó la colaboración urbana del año en los Glamour Music Awards. Se presentó en los Monitor Latino Awards de Santa Marta y en Premios Juventud, hizo sus primeras giras por Europa y Estados Unidos, y encabezó la trigésimo cuarta Gran Parada Dominicana del Bronx en el Grand Concourse.","type":"text"}]},{"type":"paragraph","content":[{"text":"Publicar semanalmente es una estrategia y no un adorno: trata el catálogo como algo que hay que alimentar y no que curar, que es como un rapero se mantiene en el algoritmo de una plataforma sin un sello pagándole. Que lo haya sostenido cincuenta y dos semanas dice algo sobre la escritura.","type":"text"}]},{"type":"paragraph","content":[{"text":"Selena y después","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Selena, Chuky 2, Coronao, Therian, Rubberz, Mentiras y Culpable son más recientes. Los freestyles también siguen saliendo, que es donde se ganó el nombre de Tinta de Oro en primer lugar.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'tivi-gunz'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz') AND locale = 'en'), '0421f1ed-749c-41ec-951b-594f60938ae7', 'artist', '6321da6c-e2d5-490a-a4e8-416bbee81edf');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz') AND locale = 'en'), '0ac82b75-2568-4822-8a16-421b59182d2c', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz') AND locale = 'en'), '6132e955-a14c-4061-8eb8-2dc8b73b1349', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz') AND locale = 'en'), 'a5bb894e-23b5-4509-8ba4-ef6193a46b48', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz') AND locale = 'es'), '26f6dca8-544b-4f14-b1f6-7217a10d003d', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz') AND locale = 'es'), '30f65467-0148-4fd3-bc8f-e80f0788cd36', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz') AND locale = 'es'), '60a62104-8814-4bfb-8bed-639b9a02bdc1', 'artist', '6321da6c-e2d5-490a-a4e8-416bbee81edf');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'tivi-gunz') AND locale = 'es'), '9e5db94b-2c7b-4d8f-9bb7-d74763841f4d', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

COMMIT;
