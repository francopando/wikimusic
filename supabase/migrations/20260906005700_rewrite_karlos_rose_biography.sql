BEGIN;

-- Rewrite the catalogue entry for Karlos Rosé.
--
-- Karlos Rosé. Filler in English, nothing in Spanish, no occupations, no real
-- surname, no place -- on a bachatero with four number ones on Billboard's
-- tropical chart.
--
-- FILLED: last_name was stored as "Rosé", which is the stage name. His legal
-- name is Carlos De La Rosa, so first_name Carlos and last_name De La Rosa go
-- in and Rosé moves to stage_name and aliases, where it belongs.
--
-- ADDED: occupations composer and producer -- English Wikipedia lists him as
-- singer, songwriter, record producer and musician -- genres, disambiguation.
-- birth_year 1995 was already stored and matches 27 May 1995.
--
-- PLACE LEFT EMPTY ON PURPOSE. province and birth_place stay NULL. Not one
-- source found -- Wikipedia, Billboard, the San Diego Union-Tribune, El Caribe,
-- his own label pages -- names a town or a province. "Dominican Republic" is
-- all any of them give. The audit will keep flagging this row for a missing
-- place and it should: the gap is real and filling it with the capital would be
-- an invention.
--
-- SOURCES: English Wikipedia, which is well sourced on him and carries the
-- Billboard chart history: the birth on 27 May 1995, the start as a singer on
-- the television programme Divertido con Jochy at seventeen, the 2012 debut
-- single Just the Way You Are and its number one on Tropical Songs, Infiel in
-- 2013 reaching number one too, I'll Be There with Arthur Hanlon at number
-- four, Niña de Mi Corazón at number one in 2014 and Mi Lugar Es Contigo at
-- number one in 2015, the albums Géminis in 2015 and Sabotaje in 2019, and the
-- labels Machete Music, UMG, Joch Entertainment, WK Records and 212 Music
-- Management. El Caribe, 23 July 2012, "Los covers alimentan a la bachata
-- urbana", by Máximo Jiménez and José Nova, which is where the pattern was
-- first named in print. The San Diego Union-Tribune, 7 and 8 June 2015, on the
-- debut album and on the origins of the three covers. Voxxi, 1 June 2013, on
-- the Hanlon collaboration. Revista Global's essay placing him and Alejandra
-- among the singers who followed the makers of bachata urbana with a stylised
-- bachata of their own. El Caribe, 19 February 2015, listing him among the
-- Dominicans up for a Premio Lo Nuestro that year.
--
-- AWARD NOT LOADED. El Caribe names him as a Premio Lo Nuestro nominee in 2015
-- but does not give the category, and no nominee list found names him. A row
-- with a null category on a single unspecific mention is worse than no row. It
-- is in neither the prose nor the table.
--
-- NOT WRITTEN: view counts.
--
-- NOT LINKED: Arthur Hanlon, Paty Cantú, Bruno Mars, Horacio Palencia and
-- Daniel Calderón y Los Gigantes are not Dominican. Luchy DR and Classay are
-- Dominican and have no entries.
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
       name = 'Karlos Rosé',
       sort_name = 'De La Rosa, Carlos',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1995-05-27',
       birth_year = 1995,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Carlos',
       middle_name = NULL,
       last_name = 'De La Rosa',
       second_last_name = NULL,
       stage_name = 'Karlos Rosé',
       aliases = ARRAY['Karlos Rose', 'K. Rose', 'Carlos De La Rosa']::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'ballads-romantic']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@KarlosRoseMusicVEVO',
       facebook = 'KarlosRose',
       instagram = 'karlosrose',
       disambiguation = 'Bachatero, born Carlos De La Rosa; Just the Way You Are, Infiel, Mi Lugar Es Contigo',
       bio_en = 'Karlos Rosé, born Carlos De La Rosa, is a Dominican bachata singer, songwriter and producer. He has taken four records to number one on Billboard’s tropical chart, and three of the four were somebody else’s songs first.

**From a television studio**

He started as a singer on the television programme Divertido con Jochy, at seventeen. That is an unusual door into bachata — the genre normally arrives through a bar, a colmadón or a requinto, not through a variety show — and it explains the finish on the records, which sound built for broadcast from the first bar.

**The covers**

Just the Way You Are, in 2012, was Bruno Mars in bachata, and it went to number one. Infiel, the year after, was a song by the Colombian group Daniel Calderón y Los Gigantes, and it went to number one as well. Niña de Mi Corazón, by the Mexican Horacio Palencia, did the same in 2014. In between he sang I’ll Be There, from the Jackson 5 catalogue, with the American pianist Arthur Hanlon, and reached number four.

El Caribe put the practice in a headline as early as 2012: the covers are what feed bachata urbana. It is a fair description and not necessarily a complaint. Bachata has always worked by absorbing other people’s songs and handing them back with a requinto and a bongo underneath — what changed with his generation is that the songs being absorbed were English-language pop and Colombian vallenato rather than boleros.

**Géminis and Sabotaje**

Mi Lugar Es Contigo, in 2015, was his own, and it also went to number one. Géminis came the same year and gathered all of it — Ojos Verdes, Mentías, Princesita, Por Amarte, Enséñame a Olvidar, and both a bachata and a pop version of Mi Lugar Es Contigo, which is the record label showing its hand about where he was being aimed.

Sabotaje followed in 2019: Te Salvaré, Siento Que Muero, La Ronda, El Juego, Mi Cama Es Testigo, Brindo, No Dejo De Amarte. He has kept releasing singles since — Tan Fácil, El Espejo, La Verdad, Un Mal Sueño, Yo No Me Muero Por Nadie, A Gritos De Esperanza.

**On the dance circuit**

He works the international bachata-dance festivals, which is a market of its own: rooms full of people in Sydney or Milan who learned the steps before they learned the language. Very little Dominican music reaches an audience that way, and it is a large part of why bachata now travels further than merengue.

Nothing found names the town he comes from — every source says only the country.',
       bio_es = 'Karlos Rosé, de nombre Carlos De La Rosa, es cantante, compositor y productor de bachata dominicano. Ha llevado cuatro discos al número uno de la lista tropical de Billboard, y tres de los cuatro eran canciones de otra gente primero.

**De un estudio de televisión**

Empezó como cantante en el programa de televisión Divertido con Jochy, a los diecisiete años. Es una puerta rara para entrar a la bachata —el género normalmente llega por un bar, un colmadón o un requinto, no por un programa de variedades— y explica el acabado de los discos, que suenan hechos para transmisión desde el primer compás.

**Los covers**

Just the Way You Are, en 2012, era Bruno Mars en bachata, y llegó al número uno. Infiel, al año siguiente, era un tema del grupo colombiano Daniel Calderón y Los Gigantes, y también llegó al número uno. Niña de Mi Corazón, del mexicano Horacio Palencia, hizo lo mismo en 2014. Entremedio cantó I’ll Be There, del cancionero de los Jackson 5, con el pianista estadounidense Arthur Hanlon, y llegó al cuatro.

El Caribe puso la práctica en un titular ya en 2012: los covers son lo que alimenta a la bachata urbana. Es una descripción justa y no necesariamente una queja. La bachata siempre ha funcionado absorbiendo canciones ajenas y devolviéndolas con un requinto y un bongó debajo; lo que cambió con su generación es que lo que se absorbía era pop en inglés y vallenato colombiano en vez de boleros.

**Géminis y Sabotaje**

Mi Lugar Es Contigo, en 2015, sí era suya, y también llegó al número uno. Géminis salió ese mismo año y lo recogió todo: Ojos Verdes, Mentías, Princesita, Por Amarte, Enséñame a Olvidar, y una versión en bachata y otra en pop de Mi Lugar Es Contigo, que es el sello enseñando la mano sobre hacia dónde lo apuntaban.

Sabotaje llegó en 2019: Te Salvaré, Siento Que Muero, La Ronda, El Juego, Mi Cama Es Testigo, Brindo, No Dejo De Amarte. Desde entonces ha seguido sacando sencillos: Tan Fácil, El Espejo, La Verdad, Un Mal Sueño, Yo No Me Muero Por Nadie, A Gritos De Esperanza.

**En el circuito de baile**

Trabaja los festivales internacionales de baile de bachata, que son un mercado aparte: salones llenos de gente en Sídney o en Milán que aprendió los pasos antes que el idioma. Muy poca música dominicana llega a un público por esa vía, y es buena parte de la razón por la que hoy la bachata viaja más lejos que el merengue.

Nada de lo encontrado nombra el pueblo de donde viene: todas las fuentes dicen solamente el país.',
       updated_at = now()
 WHERE slug = 'karlos-rose';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'karlos-rose')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'karlos-rose')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Karlos Rosé, born Carlos De La Rosa, is a Dominican bachata singer, songwriter and producer. He has taken four records to number one on Billboard’s tropical chart, and three of the four were somebody else’s songs first.","type":"text"}]},{"type":"paragraph","content":[{"text":"From a television studio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He started as a singer on the television programme Divertido con Jochy, at seventeen. That is an unusual door into bachata — the genre normally arrives through a bar, a colmadón or a requinto, not through a variety show — and it explains the finish on the records, which sound built for broadcast from the first bar.","type":"text"}]},{"type":"paragraph","content":[{"text":"The covers","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Just the Way You Are, in 2012, was Bruno Mars in bachata, and it went to number one. Infiel, the year after, was a song by the Colombian group Daniel Calderón y Los Gigantes, and it went to number one as well. Niña de Mi Corazón, by the Mexican Horacio Palencia, did the same in 2014. In between he sang I’ll Be There, from the Jackson 5 catalogue, with the American pianist Arthur Hanlon, and reached number four.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Caribe put the practice in a headline as early as 2012: the covers are what feed bachata urbana. It is a fair description and not necessarily a complaint. Bachata has always worked by absorbing other people’s songs and handing them back with a requinto and a bongo underneath — what changed with his generation is that the songs being absorbed were English-language pop and Colombian vallenato rather than boleros.","type":"text"}]},{"type":"paragraph","content":[{"text":"Géminis and Sabotaje","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Mi Lugar Es Contigo, in 2015, was his own, and it also went to number one. Géminis came the same year and gathered all of it — Ojos Verdes, Mentías, Princesita, Por Amarte, Enséñame a Olvidar, and both a bachata and a pop version of Mi Lugar Es Contigo, which is the record label showing its hand about where he was being aimed.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sabotaje followed in 2019: Te Salvaré, Siento Que Muero, La Ronda, El Juego, Mi Cama Es Testigo, Brindo, No Dejo De Amarte. He has kept releasing singles since — Tan Fácil, El Espejo, La Verdad, Un Mal Sueño, Yo No Me Muero Por Nadie, A Gritos De Esperanza.","type":"text"}]},{"type":"paragraph","content":[{"text":"On the dance circuit","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He works the international bachata-dance festivals, which is a market of its own: rooms full of people in Sydney or Milan who learned the steps before they learned the language. Very little Dominican music reaches an audience that way, and it is a large part of why bachata now travels further than merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing found names the town he comes from — every source says only the country.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'karlos-rose'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Karlos Rosé, de nombre Carlos De La Rosa, es cantante, compositor y productor de bachata dominicano. Ha llevado cuatro discos al número uno de la lista tropical de Billboard, y tres de los cuatro eran canciones de otra gente primero.","type":"text"}]},{"type":"paragraph","content":[{"text":"De un estudio de televisión","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó como cantante en el programa de televisión Divertido con Jochy, a los diecisiete años. Es una puerta rara para entrar a la bachata —el género normalmente llega por un bar, un colmadón o un requinto, no por un programa de variedades— y explica el acabado de los discos, que suenan hechos para transmisión desde el primer compás.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los covers","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Just the Way You Are, en 2012, era Bruno Mars en bachata, y llegó al número uno. Infiel, al año siguiente, era un tema del grupo colombiano Daniel Calderón y Los Gigantes, y también llegó al número uno. Niña de Mi Corazón, del mexicano Horacio Palencia, hizo lo mismo en 2014. Entremedio cantó I’ll Be There, del cancionero de los Jackson 5, con el pianista estadounidense Arthur Hanlon, y llegó al cuatro.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Caribe puso la práctica en un titular ya en 2012: los covers son lo que alimenta a la bachata urbana. Es una descripción justa y no necesariamente una queja. La bachata siempre ha funcionado absorbiendo canciones ajenas y devolviéndolas con un requinto y un bongó debajo; lo que cambió con su generación es que lo que se absorbía era pop en inglés y vallenato colombiano en vez de boleros.","type":"text"}]},{"type":"paragraph","content":[{"text":"Géminis y Sabotaje","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Mi Lugar Es Contigo, en 2015, sí era suya, y también llegó al número uno. Géminis salió ese mismo año y lo recogió todo: Ojos Verdes, Mentías, Princesita, Por Amarte, Enséñame a Olvidar, y una versión en bachata y otra en pop de Mi Lugar Es Contigo, que es el sello enseñando la mano sobre hacia dónde lo apuntaban.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sabotaje llegó en 2019: Te Salvaré, Siento Que Muero, La Ronda, El Juego, Mi Cama Es Testigo, Brindo, No Dejo De Amarte. Desde entonces ha seguido sacando sencillos: Tan Fácil, El Espejo, La Verdad, Un Mal Sueño, Yo No Me Muero Por Nadie, A Gritos De Esperanza.","type":"text"}]},{"type":"paragraph","content":[{"text":"En el circuito de baile","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Trabaja los festivales internacionales de baile de bachata, que son un mercado aparte: salones llenos de gente en Sídney o en Milán que aprendió los pasos antes que el idioma. Muy poca música dominicana llega a un público por esa vía, y es buena parte de la razón por la que hoy la bachata viaja más lejos que el merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nada de lo encontrado nombra el pueblo de donde viene: todas las fuentes dicen solamente el país.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'karlos-rose'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
