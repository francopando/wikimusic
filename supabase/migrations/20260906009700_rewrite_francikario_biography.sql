BEGIN;

-- Rewrite the catalogue entry for Francikario.
--
-- Francikario. Filler in English, nothing in Spanish, no aliases, no
-- disambiguation -- on a Dominican whose entire career was built in Italy.
--
-- PRIMARY_GENRE CHANGED, AND IT IS THE EDITOR'S TO REVERSE. The row said
-- urban-rap-hip-hop. He describes himself twice, in his own words, as a
-- reggaetón artist: the biography on his YouTube channel opens "es un cantante
-- de reggaeton", and his Instagram bio reads "I’m an international reggaeton
-- artist based in New York City". The Italian outlet that has covered him for a
-- decade calls him "cantautore e rapper dominicano", so the rap is real and it
-- is not the main thing. primary_genre goes to urban-reggaeton and
-- urban-rap-hip-hop moves into the genres array beside urbano, so nothing is
-- lost. TO REVERT: the primary_genre line in the row block below.
--
-- A BIRTH YEAR THE SOURCES SPLIT ON, AND WHY THE ROW STANDS.
--
--   24 April 1995  -- his own YouTube channel biography, and the stored row
--   24 April 1989  -- MusicBrainz's life-span for his MBID
--   "Classe '89"   -- Latin Music Official, the Italian outlet
--
-- Everyone agrees on 24 April. The row is left at 1995 for two reasons. First,
-- the machine-written paragraph being replaced here also said 1989, which means
-- somebody working on this row afterwards changed it to 1995 deliberately --
-- the field encodes a decision, not an oversight. Second, MusicBrainz has
-- already been caught in this run with a wrong birth year (Sharlene) and a wrong
-- gender (Lismar), and the Italian press copy is artist-supplied like the
-- channel is. Recorded, not resolved.
--
-- AND A BIRTHPLACE. Latin Music Official says he was born in Bayaguana, which is
-- in Monte Plata, not in the Distrito Nacional. His own channel says Santo
-- Domingo and MusicBrainz's begin-area says Santo Domingo. Two to one, and the
-- two include his own words, so province and birth_place are not touched. If
-- Bayaguana is ever confirmed, province becomes Monte Plata.
--
-- BOTH STORED HANDLES CHECK OUT. facebook "francikariofanpage" is his page --
-- bio in Spanish, English and Italian, which is the whole biography in three
-- lines -- even though MusicBrainz lists a different one, francikariooficial.
-- instagram "FRANCIKARIO" is live and reads "FRANCIKARIO 🇩🇴🇮🇹🇺🇸". After the
-- Esme row sent readers to a Mexican television presenter, every handle in this
-- run gets opened.
--
-- ADDED: occupations producer beside composer. Latin Music Official reports that
-- Latin Lover was "composto, prodotto e scritto da Francikario, oltre che
-- interpretato da lo stesso" -- written, produced and performed by him.
-- disambiguation. genres.
--
-- SOURCES: his own YouTube channel, for the biography and for twenty-three
-- videos including the two-part footage of him opening for Daddy Yankee at
-- Latinoamericando and the Gente de Zona openings. His own Instagram and
-- Facebook. Latin Music Official, an Italian Latin-music outlet, which is the
-- independent source here and has covered him across ten years: the Universal
-- Music Italia signing, the Le Gustò video shot between Otranto and Nardò, the
-- Italian radio rotation, an interview with Manuele Feula, Campeón with Jangy
-- Leeon produced by Jack The Smoker, Bandolero produced by Bdope, Latin Lover,
-- Mi Alma and the 2019 NY Freestyle. A Dominican urban-music blog's 2012
-- download list, for the early 3L Traficante records. MusicBrainz and Discogs.
--
-- NOT WRITTEN: no follower counts. Nothing about his family.
--
-- NOT LINKED: Daddy Yankee, Farruko, J Álvarez and Gente de Zona are not
-- Dominican; Jangy Leeon, Jack The Smoker and Bdope are Italian; Drake is
-- Canadian. None of them belongs on the missing list. 3L Traficante, Noly, Ricky
-- Lindo and Dylan Golden could not be established as Dominican and are not added
-- either.
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
       name = 'Francikario',
       sort_name = 'Francikario',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-reggaeton',
       date_of_birth = '1995-04-24',
       birth_year = 1995,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Francisco',
       middle_name = NULL,
       last_name = 'Puente',
       second_last_name = NULL,
       stage_name = 'Francikario',
       aliases = ARRAY[]::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@FrancikarioTV',
       facebook = 'francikariofanpage',
       instagram = 'FRANCIKARIO',
       disambiguation = 'Reggaetón singer; career built in Milan, now working from New York',
       bio_en = 'Francikario, born Francisco Puente, is a Dominican reggaetón singer, songwriter and producer. He was born in Santo Domingo and has made almost none of his music there: the career was built in Milan and continues in New York.

**Milan**

He moved to Italy as a teenager and grew up as an artist in Milan, a city with a large Latin American population and a Spanish-language music circuit that Dominicans at home never hear about.

By the start of the last decade his records were circulating back the other way — tracks cut with 3L Traficante turning up on the download blogs that Dominican urban music ran on before streaming. That is an unusual direction of travel for a Dominican artist and it is the shape of everything he has done since.

**Latinoamericando**

Latinoamericando is the largest Latin music festival in Europe, held in Milan, and in 2013 he was the only local act on it. The following year, after he released the album Mi Turno, the festival brought him back to open the shows.

The names he opened for are Daddy Yankee, Gente de Zona, Farruko and J Álvarez, and he filmed it. His channel still carries the Daddy Yankee opening in two parts and the Gente de Zona sets — which matters, because a support slot is the kind of credit that leaves no trace unless somebody keeps the tape.

**Universal**

In 2015 he signed with Universal Music Italia, and the single Le Gustó came out under that label with a video shot between Otranto and Nardò, down in Puglia. It went into rotation on Italian radio.

A Dominican on a major label’s Italian arm, singing reggaetón in Spanish to an Italian audience, is a career that has no equivalent at home. He also went inside Italian rap rather than staying beside it: Campeón is a record with the Italian rapper Jangy Leeon, produced by Jack The Smoker, and Bandolero was produced by Bdope.

**New York**

He moved to New York in 2018 and has kept releasing from there — a freestyle cut for an Italian platform, Latin Lover, which he wrote, produced and sang himself, Mi Alma, which he dedicates to mothers, Dame Un Besito, A Cualquier Hora and its remix, Yo Voy, and a reggae reading of a Drake song.

His own summary of himself is three flags: Dominican, Italian, American. Dominican music has spent a century being made by people who left, and the New York half of that story is well documented. The Milan half is not, and he is most of it.',
       bio_es = 'Francikario, de nombre Francisco Puente, es cantante, compositor y productor de reguetón dominicano. Nació en Santo Domingo y casi nada de su música la ha hecho ahí: la carrera se armó en Milán y sigue en Nueva York.

**Milán**

Se fue a Italia de adolescente y se hizo artista en Milán, una ciudad con mucha población latinoamericana y un circuito de música en español del que en el país no se entera nadie.

A principios de la década pasada sus temas ya venían de vuelta: grabaciones con 3L Traficante aparecían en los blogs de descargas que sostenían la música urbana dominicana antes del streaming. Es una dirección de viaje rara para un artista dominicano y es la forma de todo lo que ha hecho después.

**Latinoamericando**

Latinoamericando es el festival de música latina más grande de Europa, se hace en Milán, y en 2013 él fue el único artista local en el cartel. Al año siguiente, después de sacar el álbum Mi Turno, el mismo festival lo llamó para abrir los conciertos.

Los nombres a los que les abrió son Daddy Yankee, Gente de Zona, Farruko y J Álvarez, y lo filmó. En su canal siguen la apertura de Daddy Yankee en dos partes y las de Gente de Zona, lo cual importa: abrirle a alguien es la clase de crédito que no deja rastro si nadie guarda el video.

**Universal**

En 2015 firmó con Universal Music Italia, y el sencillo Le Gustó salió por ese sello con un video grabado entre Otranto y Nardò, allá en Apulia. Entró en rotación en la radio italiana.

Un dominicano en el brazo italiano de una disquera grande, cantando reguetón en español para un público italiano, es una carrera que no tiene equivalente en el país. Y se metió dentro del rap italiano en vez de quedarse al lado: Campeón es un tema con el rapero italiano Jangy Leeon, producido por Jack The Smoker, y Bandolero lo produjo Bdope.

**Nueva York**

Se mudó a Nueva York en 2018 y desde ahí no ha parado de sacar temas: un freestyle para una plataforma italiana, Latin Lover, que compuso, produjo y cantó él solo, Mi Alma, que le dedica a las madres, Dame Un Besito, A Cualquier Hora y su remix, Yo Voy, y una versión en reggae de una canción de Drake.

El resumen que él hace de sí mismo son tres banderas: dominicana, italiana y estadounidense. La música dominicana lleva un siglo haciéndola gente que se fue, y la mitad neoyorquina de esa historia está bien documentada. La mitad milanesa no lo está, y él es casi toda.',
       updated_at = now()
 WHERE slug = 'francikario';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'francikario')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'francikario')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Francikario, born Francisco Puente, is a Dominican reggaetón singer, songwriter and producer. He was born in Santo Domingo and has made almost none of his music there: the career was built in Milan and continues in New York.","type":"text"}]},{"type":"paragraph","content":[{"text":"Milan","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He moved to Italy as a teenager and grew up as an artist in Milan, a city with a large Latin American population and a Spanish-language music circuit that Dominicans at home never hear about.","type":"text"}]},{"type":"paragraph","content":[{"text":"By the start of the last decade his records were circulating back the other way — tracks cut with 3L Traficante turning up on the download blogs that Dominican urban music ran on before streaming. That is an unusual direction of travel for a Dominican artist and it is the shape of everything he has done since.","type":"text"}]},{"type":"paragraph","content":[{"text":"Latinoamericando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Latinoamericando is the largest Latin music festival in Europe, held in Milan, and in 2013 he was the only local act on it. The following year, after he released the album Mi Turno, the festival brought him back to open the shows.","type":"text"}]},{"type":"paragraph","content":[{"text":"The names he opened for are Daddy Yankee, Gente de Zona, Farruko and J Álvarez, and he filmed it. His channel still carries the Daddy Yankee opening in two parts and the Gente de Zona sets — which matters, because a support slot is the kind of credit that leaves no trace unless somebody keeps the tape.","type":"text"}]},{"type":"paragraph","content":[{"text":"Universal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2015 he signed with Universal Music Italia, and the single Le Gustó came out under that label with a video shot between Otranto and Nardò, down in Puglia. It went into rotation on Italian radio.","type":"text"}]},{"type":"paragraph","content":[{"text":"A Dominican on a major label’s Italian arm, singing reggaetón in Spanish to an Italian audience, is a career that has no equivalent at home. He also went inside Italian rap rather than staying beside it: Campeón is a record with the Italian rapper Jangy Leeon, produced by Jack The Smoker, and Bandolero was produced by Bdope.","type":"text"}]},{"type":"paragraph","content":[{"text":"New York","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He moved to New York in 2018 and has kept releasing from there — a freestyle cut for an Italian platform, Latin Lover, which he wrote, produced and sang himself, Mi Alma, which he dedicates to mothers, Dame Un Besito, A Cualquier Hora and its remix, Yo Voy, and a reggae reading of a Drake song.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own summary of himself is three flags: Dominican, Italian, American. Dominican music has spent a century being made by people who left, and the New York half of that story is well documented. The Milan half is not, and he is most of it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'francikario'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Francikario, de nombre Francisco Puente, es cantante, compositor y productor de reguetón dominicano. Nació en Santo Domingo y casi nada de su música la ha hecho ahí: la carrera se armó en Milán y sigue en Nueva York.","type":"text"}]},{"type":"paragraph","content":[{"text":"Milán","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se fue a Italia de adolescente y se hizo artista en Milán, una ciudad con mucha población latinoamericana y un circuito de música en español del que en el país no se entera nadie.","type":"text"}]},{"type":"paragraph","content":[{"text":"A principios de la década pasada sus temas ya venían de vuelta: grabaciones con 3L Traficante aparecían en los blogs de descargas que sostenían la música urbana dominicana antes del streaming. Es una dirección de viaje rara para un artista dominicano y es la forma de todo lo que ha hecho después.","type":"text"}]},{"type":"paragraph","content":[{"text":"Latinoamericando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Latinoamericando es el festival de música latina más grande de Europa, se hace en Milán, y en 2013 él fue el único artista local en el cartel. Al año siguiente, después de sacar el álbum Mi Turno, el mismo festival lo llamó para abrir los conciertos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los nombres a los que les abrió son Daddy Yankee, Gente de Zona, Farruko y J Álvarez, y lo filmó. En su canal siguen la apertura de Daddy Yankee en dos partes y las de Gente de Zona, lo cual importa: abrirle a alguien es la clase de crédito que no deja rastro si nadie guarda el video.","type":"text"}]},{"type":"paragraph","content":[{"text":"Universal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2015 firmó con Universal Music Italia, y el sencillo Le Gustó salió por ese sello con un video grabado entre Otranto y Nardò, allá en Apulia. Entró en rotación en la radio italiana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un dominicano en el brazo italiano de una disquera grande, cantando reguetón en español para un público italiano, es una carrera que no tiene equivalente en el país. Y se metió dentro del rap italiano en vez de quedarse al lado: Campeón es un tema con el rapero italiano Jangy Leeon, producido por Jack The Smoker, y Bandolero lo produjo Bdope.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nueva York","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se mudó a Nueva York en 2018 y desde ahí no ha parado de sacar temas: un freestyle para una plataforma italiana, Latin Lover, que compuso, produjo y cantó él solo, Mi Alma, que le dedica a las madres, Dame Un Besito, A Cualquier Hora y su remix, Yo Voy, y una versión en reggae de una canción de Drake.","type":"text"}]},{"type":"paragraph","content":[{"text":"El resumen que él hace de sí mismo son tres banderas: dominicana, italiana y estadounidense. La música dominicana lleva un siglo haciéndola gente que se fue, y la mitad neoyorquina de esa historia está bien documentada. La mitad milanesa no lo está, y él es casi toda.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'francikario'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
