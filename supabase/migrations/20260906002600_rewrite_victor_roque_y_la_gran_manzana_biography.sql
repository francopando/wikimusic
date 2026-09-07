BEGIN;

-- Rewrite the catalogue entry for Víctor Roque y La Gran Manzana.
--
-- Victor Roque y La Gran Manzana. Filler in English, nothing in Spanish, no
-- founding year -- on the orchestra usually called the most influential merengue
-- band New York ever had.
--
-- CORRECTED: type solo_artist -> group. The row said solo_artist while gender
-- already said group, which is a contradiction; the entity is named for a
-- bandleader and his orchestra and the orchestra is the subject.
--
-- OVERWRITTEN, and it is worth saying out loud: province "Santiago" and
-- birth_place "Santiago de los Caballeros" -> province "Born Abroad" and
-- birth_place "New York City". Every source founds the band in New York in
-- 1982. The old value may have been a note about where Victor Roque himself is
-- from -- nothing found says where that is -- but it was recorded as the
-- orchestra's origin, and as that it was wrong. Added birth_year 1982 and the
-- diaspora tag.
--
-- INCONSISTENCY FLAGGED, not resolved: this catalogue does not treat the New
-- York merengue bands the same way. The New York Band and Oro Solido carry NULL
-- province and NULL birth_place; Proyecto Uno carries "Born Abroad" with a New
-- York birth_place. This entry follows Proyecto Uno because it says more, but
-- the four should agree.
--
-- SOURCES: Diario Libre, 18 August 2022, "La Gran Manzana: 40 anos de historia
-- en el merengue", which dates the founding to 1982 and reports that most of
-- the members were working in a bodega, and its follow-up of 28 November 2022
-- on the anniversary tour, which opened in New York and ran to Puerto Rico and
-- the Dominican Republic. Deezer's artist text: "una orquesta fundada por
-- Victor Roque y Henry Hierro en el ano 1982 y es considerada la orquesta de
-- merengue mas influyente de la ciudad", with more than forty hits. Primera
-- Hora and El Vocero de Puerto Rico, 17 and 20 August 2022, on the tribute
-- Herencia Hispana paid the two of them. Facebook's Victor Roque y La Gran
-- Manzana page, which describes Henry Hierro as pianist, composer and arranger
-- and a co-founder. Minuto Cero and N Digital, May 2023, on Roque's beginnings
-- -- he scavenged food to survive as a teenager in New York. Merengazo FM for
-- the albums Recuerdos (1990) and Image of the 90's (1991), DJ El Nino for
-- Manzana Mix (1993), and DJ Intokable for Bad Bad Bad (1986) and Where Are
-- You, My Love. Spotify and Deezer for the titles: Tus Besos, Cuando Llegara,
-- Mentirosa, Rosa Blanca, Se Muere, Rodolfo, Ven Junto a Mi, Si Besas Mi Boca
-- la Besas Otra Vez, Tiene Su Truco, Los Hombres, No Juegue Con Lo Mio,
-- Abrazame. Listin Diario, 8 December 2023, on Vamo' Amanecer with Fernando
-- Villalona. Silvio Mora's interview with Roque, 23 August 2022.
--
-- NOT WRITTEN: the separation of Roque and Hierro, which Dominican pages
-- describe as having caused a stir. What is documented is that it happened and
-- that people minded; the reasons are not, and the catalogue does not carry
-- quarrels it cannot source.
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
       name = 'Víctor Roque y La Gran Manzana',
       sort_name = 'Víctor Roque y La Gran Manzana',
       type = 'group',
       status = 'published',
       gender = 'group',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = NULL,
       birth_year = 1982,
       date_of_death = NULL,
       birth_place = 'New York City',
       province = 'Born Abroad',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['La Gran Manzana']::text[],
       occupations = '["bandleader"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['merengue-orquesta']::text[],
       artist_tags = ARRAY['secular', 'diaspora', 'legend']::text[],
       website = NULL,
       youtube = '@LAGRANMANZANANYC',
       facebook = 'granmanzananyc',
       instagram = 'lagranmanzananyc',
       disambiguation = 'Merengue orchestra founded in New York in 1982 by Víctor Roque and Henry Hierro',
       bio_en = 'Víctor Roque y La Gran Manzana is a merengue orchestra founded in New York in 1982 by Víctor Roque and Henry Hierro. It is usually described as the most influential merengue band the city produced.

**Most of them worked in a bodega**

That is the detail the Dominican press kept returning to at the fortieth anniversary, and it is the whole story of the band in one line. They were immigrants with day jobs. The orchestra was built in whatever hours were left over.

Roque’s own beginning was harder than that. He arrived as a teenager and, by his own account, went through a period of taking food out of bins to stay alive. Nothing about the records suggests any of it — they are relentlessly cheerful — which is usually how it works.

**The New York merengue**

What the city did to the music was speed it up and tighten it. A New York merengue orchestra played to a room where nobody had come to sit down, and the arrangements answered that: shorter, harder, with the horns punched rather than sustained.

Hierro was the musician of the pair — pianist, composer, arranger — and Roque the voice and the organiser. Over forty hits came out of that arrangement. Tus Besos, Cuándo Llegará, Mentirosa, Rosa Blanca, Se Muere, Rodolfo, Ven Junto a Mí, Los Hombres, No Juegue Con Lo Mío.

Bad Bad Bad and Where Are You, My Love have English titles, which is not a bid for the American market so much as an accurate description of who was in the room. The audience was bilingual and the band did not pretend otherwise.

**The records**

Recuerdos came in 1990 and Image of the 90’s in 1991, and Manzana Mix followed in 1993 — a long medley, which was the format that decade demanded of a dance orchestra.

The two founders eventually went their separate ways, and Dominican audiences minded a great deal.

**Forty years**

In 2022 the orchestra marked its fortieth anniversary with a tour that opened in New York and went on to Puerto Rico and the Dominican Republic, and Roque and Hierro were honoured together in San Juan.

Roque has kept working. In December 2023 he recorded Vamo’ Amanecer with Fernando Villalona — a New York bandleader and a singer from the island, forty years after the two scenes were supposed to be separate things.',
       bio_es = 'Víctor Roque y La Gran Manzana es una orquesta de merengue fundada en Nueva York en 1982 por Víctor Roque y Henry Hierro. Se la suele describir como la orquesta de merengue más influyente que dio la ciudad.

**Casi todos trabajaban en una bodega**

Es el dato al que la prensa dominicana volvió una y otra vez en el cuarenta aniversario, y es toda la historia de la banda en una línea. Eran inmigrantes con trabajo de día. La orquesta se armó en las horas que sobraban.

El comienzo de Roque fue más duro todavía. Llegó siendo adolescente y, según él mismo cuenta, pasó un tiempo zafaconeando comida para poder sobrevivir. Nada en los discos lo sugiere —son incansablemente alegres—, que es como suele ocurrir.

**El merengue de Nueva York**

Lo que la ciudad le hizo a la música fue acelerarla y apretarla. Una orquesta de merengue neoyorquina tocaba para un salón donde nadie había ido a sentarse, y los arreglos respondían a eso: más cortos, más duros, con los metales golpeados en vez de sostenidos.

Hierro era el músico de los dos —pianista, compositor, arreglista— y Roque la voz y el organizador. De ese reparto salieron más de cuarenta éxitos. Tus Besos, Cuándo Llegará, Mentirosa, Rosa Blanca, Se Muere, Rodolfo, Ven Junto a Mí, Los Hombres, No Juegue Con Lo Mío.

Bad Bad Bad y Where Are You, My Love llevan título en inglés, y no es tanto una apuesta por el mercado estadounidense como una descripción exacta de quién estaba en el salón. El público era bilingüe y la banda no fingió lo contrario.

**Los discos**

Recuerdos salió en 1990 e Image of the 90’s en 1991, y detrás vino Manzana Mix en 1993: un popurrí largo, que era el formato que aquella década le exigía a una orquesta de baile.

Los dos fundadores acabaron separándose, y al público dominicano le dolió bastante.

**Cuarenta años**

En 2022 la orquesta celebró sus cuarenta años con una gira que abrió en Nueva York y siguió por Puerto Rico y República Dominicana, y a Roque y a Hierro los homenajearon juntos en San Juan.

Roque ha seguido trabajando. En diciembre de 2023 grabó Vamo’ Amanecer con Fernando Villalona: un director de orquesta de Nueva York y un cantante de la isla, cuarenta años después de que aquellas dos escenas debieran ser cosas separadas.',
       updated_at = now()
 WHERE slug = 'victor-roque-y-la-gran-manzana';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'victor-roque-y-la-gran-manzana')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'victor-roque-y-la-gran-manzana')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Víctor Roque y La Gran Manzana is a merengue orchestra founded in New York in 1982 by Víctor Roque and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"db00c1d0-00ce-4bde-9e7e-f5f6a3bd9250","displayText":"Henry Hierro","occurrenceId":"90f2476b-2714-42a3-81f1-e7cd90c1b250"}},{"text":". It is usually described as the most influential merengue band the city produced.","type":"text"}]},{"type":"paragraph","content":[{"text":"Most of them worked in a bodega","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"That is the detail the Dominican press kept returning to at the fortieth anniversary, and it is the whole story of the band in one line. They were immigrants with day jobs. The orchestra was built in whatever hours were left over.","type":"text"}]},{"type":"paragraph","content":[{"text":"Roque’s own beginning was harder than that. He arrived as a teenager and, by his own account, went through a period of taking food out of bins to stay alive. Nothing about the records suggests any of it — they are relentlessly cheerful — which is usually how it works.","type":"text"}]},{"type":"paragraph","content":[{"text":"The New York merengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"What the city did to the music was speed it up and tighten it. A New York merengue orchestra played to a room where nobody had come to sit down, and the arrangements answered that: shorter, harder, with the horns punched rather than sustained.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hierro was the musician of the pair — pianist, composer, arranger — and Roque the voice and the organiser. Over forty hits came out of that arrangement. Tus Besos, Cuándo Llegará, Mentirosa, Rosa Blanca, Se Muere, Rodolfo, Ven Junto a Mí, Los Hombres, No Juegue Con Lo Mío.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bad Bad Bad and Where Are You, My Love have English titles, which is not a bid for the American market so much as an accurate description of who was in the room. The audience was bilingual and the band did not pretend otherwise.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Recuerdos came in 1990 and Image of the 90’s in 1991, and Manzana Mix followed in 1993 — a long medley, which was the format that decade demanded of a dance orchestra.","type":"text"}]},{"type":"paragraph","content":[{"text":"The two founders eventually went their separate ways, and Dominican audiences minded a great deal.","type":"text"}]},{"type":"paragraph","content":[{"text":"Forty years","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2022 the orchestra marked its fortieth anniversary with a tour that opened in New York and went on to Puerto Rico and the Dominican Republic, and Roque and Hierro were honoured together in San Juan.","type":"text"}]},{"type":"paragraph","content":[{"text":"Roque has kept working. In December 2023 he recorded Vamo’ Amanecer with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"4ff2f7e4-b578-4afe-9dc7-ad0ece52bead"}},{"text":" — a New York bandleader and a singer from the island, forty years after the two scenes were supposed to be separate things.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'victor-roque-y-la-gran-manzana'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Víctor Roque y La Gran Manzana es una orquesta de merengue fundada en Nueva York en 1982 por Víctor Roque y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"db00c1d0-00ce-4bde-9e7e-f5f6a3bd9250","displayText":"Henry Hierro","occurrenceId":"b18b1b45-c5ae-41f0-846a-a12b2f57a773"}},{"text":". Se la suele describir como la orquesta de merengue más influyente que dio la ciudad.","type":"text"}]},{"type":"paragraph","content":[{"text":"Casi todos trabajaban en una bodega","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Es el dato al que la prensa dominicana volvió una y otra vez en el cuarenta aniversario, y es toda la historia de la banda en una línea. Eran inmigrantes con trabajo de día. La orquesta se armó en las horas que sobraban.","type":"text"}]},{"type":"paragraph","content":[{"text":"El comienzo de Roque fue más duro todavía. Llegó siendo adolescente y, según él mismo cuenta, pasó un tiempo zafaconeando comida para poder sobrevivir. Nada en los discos lo sugiere —son incansablemente alegres—, que es como suele ocurrir.","type":"text"}]},{"type":"paragraph","content":[{"text":"El merengue de Nueva York","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo que la ciudad le hizo a la música fue acelerarla y apretarla. Una orquesta de merengue neoyorquina tocaba para un salón donde nadie había ido a sentarse, y los arreglos respondían a eso: más cortos, más duros, con los metales golpeados en vez de sostenidos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hierro era el músico de los dos —pianista, compositor, arreglista— y Roque la voz y el organizador. De ese reparto salieron más de cuarenta éxitos. Tus Besos, Cuándo Llegará, Mentirosa, Rosa Blanca, Se Muere, Rodolfo, Ven Junto a Mí, Los Hombres, No Juegue Con Lo Mío.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bad Bad Bad y Where Are You, My Love llevan título en inglés, y no es tanto una apuesta por el mercado estadounidense como una descripción exacta de quién estaba en el salón. El público era bilingüe y la banda no fingió lo contrario.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Recuerdos salió en 1990 e Image of the 90’s en 1991, y detrás vino Manzana Mix en 1993: un popurrí largo, que era el formato que aquella década le exigía a una orquesta de baile.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los dos fundadores acabaron separándose, y al público dominicano le dolió bastante.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cuarenta años","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2022 la orquesta celebró sus cuarenta años con una gira que abrió en Nueva York y siguió por Puerto Rico y República Dominicana, y a Roque y a Hierro los homenajearon juntos en San Juan.","type":"text"}]},{"type":"paragraph","content":[{"text":"Roque ha seguido trabajando. En diciembre de 2023 grabó Vamo’ Amanecer con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"7ae74eec-a93b-4dca-8e71-d441facb712f"}},{"text":": un director de orquesta de Nueva York y un cantante de la isla, cuarenta años después de que aquellas dos escenas debieran ser cosas separadas.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'victor-roque-y-la-gran-manzana'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'victor-roque-y-la-gran-manzana') AND locale = 'en'), '4ff2f7e4-b578-4afe-9dc7-ad0ece52bead', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'victor-roque-y-la-gran-manzana') AND locale = 'en'), '90f2476b-2714-42a3-81f1-e7cd90c1b250', 'artist', 'db00c1d0-00ce-4bde-9e7e-f5f6a3bd9250');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'victor-roque-y-la-gran-manzana') AND locale = 'es'), '7ae74eec-a93b-4dca-8e71-d441facb712f', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'victor-roque-y-la-gran-manzana') AND locale = 'es'), 'b18b1b45-c5ae-41f0-846a-a12b2f57a773', 'artist', 'db00c1d0-00ce-4bde-9e7e-f5f6a3bd9250');

COMMIT;
