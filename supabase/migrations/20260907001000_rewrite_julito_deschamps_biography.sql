BEGIN;

-- Rewrite the catalogue entry for Julito Deschamps.
--
-- Julito Deschamps. Rewrite. What was here was machine-written and it opened by
-- declaring that "public records do not document Julito Deschamps' date of
-- birth" -- over a row that already stored 16 September 1930 and a death on 14
-- November 1985. It also filed him as a singer and nothing else, with an empty
-- instruments array.
--
-- HE WAS A PIANIST AND A GUITARIST. Spanish Wikipedia's first line calls him "un
-- pianista, guitarrista, cantante y compositor dominicano de boleros y baladas";
-- its infobox lists piano, guitar and voice; Los Archivos de Américo Mejía and
-- every history page that circulates about him say the same. instruments goes
-- from empty to piano, guitar and voice, and occupations gains composer.
--
-- THE BEST THING IN THIS ENTRY IS A CORRECTED CREDIT, and it corrects an error
-- that has been copied across a dozen pages including one run by the successor
-- of the very body involved.
--
-- The widely reposted paragraph reads: "En 1969 Julito Deschamps graba SUS
-- composiciones «Navidad del 69» y «Aguinaldo 69»". They were not his. Two
-- sources published within a day of each other, both on the occasion of the
-- composer's death, say otherwise:
--
--   - Yaguaza / Norte Diario, 13 August 2015, headline "Julito Deschamps grabó
--     primeras canciones de Mundito": "En 1969 Deschamps, con el grupo del
--     maestro Enriquillo Sánchez, grabó 'Navidad 69' y 'Aguinaldo 69', dos temas
--     que Mundito calificó su lírica, como llamados a la sublevación contra el
--     gobierno de Joaquín Balaguer. Las canciones fueron prohibidas por la
--     Comisión de Espectáculos Públicos y Radiofonía."
--   - LaCrónica.do's obituary of Mundito Espinal, 12 August 2015, which frames
--     the same recording as the moment Espinal's words began to be heard.
--
-- So: the songs are MUNDITO ESPINAL's, they were his first recordings, their
-- lyrics were read as calls to rise against the Balaguer government, and they
-- were BANNED. A 45 rpm single from 1969 in a collector's catalogue is billed
-- "Julio A. Román y su Conjunto - Cantando Julito Deschamps", which does not
-- match the Enriquillo Sánchez credit; the entry names neither backing group
-- because the two accounts disagree.
--
-- "Dictadura con Apoyo Popular" is named in the same propagated paragraph as
-- coming after those two. No author is given anywhere for it, so it is named
-- without one.
--
-- THE PARENTAGE IS USED, UNLIKE THE ONE REFUSED ON REYCHESTA, and the difference
-- is worth stating. Spanish Wikipedia says he was the father of the late MC Papo
-- of Sandy & Papo MC. That is corroborated from a second direction: Wikipedia's
-- separate article on LUIS DESCHAMPS -- Papo's legal name, the surname itself
-- being the evidence -- lists Julito Deschamps among his related acts. Two
-- independent articles, plus the shared surname, plus Dominican music pages
-- stating it. The Anthony Ríos claim on Reychesta had one unreferenced sentence
-- and its own copies, and nothing else. Different evidence, different answer.
--
-- A DEATH DATE VARIANT. The row and Wikipedia both give 14 November 1985. One
-- widely shared post says he died on the 13th. Not changed; recorded here.
--
-- FILLED: sort_name and stage_name, both null; first_name and last_name, both
-- null; aliases El Matemático, which Wikipedia explains as coming from the
-- mathematical exactness of his repertoire choices; occupations composer;
-- genres; instruments; disambiguation.
--
-- LEFT ALONE: date_of_birth 1930-09-16 and birth_year -- Wikipedia gives only
-- the year, so the day and month in the row are neither confirmed nor
-- contradicted and are not touched. province and birth_place Santo Domingo,
-- death_year 1985, date_of_death, ended true and the legend tag all stay.
--
-- SOURCES: Spanish Wikipedia and its citations, which include Listín Diario's
-- "El 'feeling' de Julito" of 17 June 2010 and Imágenes Dominicanas' "Julito
-- Deschamps nunca actuó en televisión" of 13 August 2013 -- both URLs are now
-- dead and are cited as Wikipedia cites them. German Wikipedia, from which the
-- Spanish article is partly translated. Yaguaza / Norte Diario, 13 August 2015,
-- and LaCrónica.do, 12 August 2015, for the banned recordings. Wikipedia's
-- article on Luis Deschamps. Los Archivos de Américo Mejía and Dominican music
-- history pages for the instruments and the boîte circuit. A collector's listing
-- of the 1969 45 rpm single.
--
-- NOT WRITTEN: nothing about how he died, and nothing private. The Mundito
-- Espinal connection is here because it is a credit.
--
-- NOT LINKED: Olga Guillot is Cuban and Pedro Flores Puerto Rican. Mundito
-- Espinal, Enriquillo Sánchez, Papatín Ovalles, Antonio Morel, Jesús Torres
-- Tejeda, Andrés de Jesús, Julio A. Román, Luis Deschamps and the duo Sandy &
-- Papo MC have no entries. Antonio Morel and Sandy & Papo MC are the notable
-- gaps -- Morel led one of the defining merengue orchestras and wrote the first
-- song Deschamps ever recorded.
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
       name = 'Julito Deschamps',
       sort_name = 'Deschamps, Julito',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'ballads-bolero',
       date_of_birth = '1930-09-16',
       birth_year = 1930,
       date_of_death = '1985-11-14',
       birth_place = 'Santo Domingo',
       province = 'Santo Domingo',
       first_name = 'Julio',
       middle_name = NULL,
       last_name = 'Deschamps',
       second_last_name = NULL,
       stage_name = 'Julito Deschamps',
       aliases = ARRAY['El Matemático']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY['voice', 'piano', 'guitar']::text[],
       genres = ARRAY['bolero', 'ballads']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Bolerista, pianist and guitarist of the Dominican boîte era',
       bio_en = 'Julito Deschamps was a Dominican bolero singer, pianist, guitarist and composer, and the defining voice of the country’s late-night music. He worked in small rooms for most of his life and refused the things that would have made him famous.

**The boîte**

A boîte is a small dark room with a piano, a few tables and no stage worth the name. Santo Domingo and Santiago had a circuit of them through the sixties and seventies, and that circuit is where Dominican bolero actually lived — not on the radio, not in the ballrooms, but at close range in front of forty people at two in the morning.

He was the figure of that world. The voice is powerful and complaining at once, the diction exact, and everything about the delivery assumes the listener is close enough to hear him breathe.

**The mathematician**

Musicians called him el matemático because of how he chose songs. His repertoire is a very deliberate list — Sortilegio, La Gloria Eres Tú, Delirio, ¿Cómo Fue?, Miénteme, Tres Palabras, Pecadora, Te Necesito, Yo Vivo Mi Vida, Amor Perdido — and almost everything he picked up became identified with him.

He came into it as a singer with Papatín Ovalles’s orchestra in 1952, and his first recording did not arrive until 1960: Tu Palabra y La Mía, written by Antonio Morel. What made his name was Será Muy Fácil, by Jesús Torres Tejeda. Llorará Por Mí, Dos Palabras, Negra Soledad, Poquita Fe, Háblame, Olvídate de Mí, Torpeza, Cosas del Alma, Tú Mi Delirio and Como Duele Una Traición followed.

Sólo Para Amarte, Llorarás Por Mí and a record made with the Cuban singer Olga Guillot are among the albums.

**The songs that were banned**

In 1969 he recorded two Christmas songs, Navidad 69 and Aguinaldo 69. They were the first compositions ever recorded of a writer named Mundito Espinal, and by Espinal’s own reading their lyrics were calls to rise against the government of Joaquín Balaguer.

The Comisión de Espectáculos Públicos y Radiofonía banned them. A third, Dictadura con Apoyo Popular, is named in the accounts as following.

It is worth being exact about whose songs those were, because almost every page that repeats the story says Deschamps was recording his own compositions. He was not. He was the singer a young writer got, and being sung by him was how a composer arrived — which is a description of what he was worth in that decade.

**The refusal**

He never appeared on television. In a country where a career was built on a variety programme and where every contemporary of his was on screen, he simply did not go, and a Dominican newspaper was still writing about that decision twenty-eight years after his death.

That is why he is remembered the way he is: not through footage, because there is almost none, but through recordings and through people who were in the room. The bohemian who refused the noise is the phrase that keeps getting used about him, and it is accurate about the career as well as the voice.

He died in 1985, at fifty-five. His son recorded too, a generation later and in a form he would not have recognised: Papo, of the merenrap duo Sandy & Papo MC, who also died young.',
       bio_es = 'Julito Deschamps fue cantante de boleros, pianista, guitarrista y compositor dominicano, y la voz que define la música nocturna del país. Trabajó en salones pequeños casi toda su vida y rechazó lo que lo habría vuelto famoso.

**La boîte**

Una boîte es un salón chiquito y oscuro con un piano, unas mesas y ninguna tarima que merezca el nombre. Santo Domingo y Santiago tuvieron un circuito de ellas durante los sesenta y los setenta, y ahí fue donde de verdad vivió el bolero dominicano: no en la radio, no en los salones de baile, sino a corta distancia delante de cuarenta personas a las dos de la mañana.

Él era la figura de ese mundo. La voz es potente y quejumbrosa a la vez, la dicción exacta, y todo en la entrega da por sentado que el que oye está lo bastante cerca para oírlo respirar.

**El matemático**

Los músicos le decían el matemático por cómo escogía las canciones. Su repertorio es una lista muy deliberada —Sortilegio, La Gloria Eres Tú, Delirio, ¿Cómo Fue?, Miénteme, Tres Palabras, Pecadora, Te Necesito, Yo Vivo Mi Vida, Amor Perdido— y casi todo lo que agarró terminó identificándose con él.

Entró como cantante en la orquesta de Papatín Ovalles en 1952, y su primera grabación no llegó hasta 1960: Tu Palabra y La Mía, de Antonio Morel. Lo que le hizo el nombre fue Será Muy Fácil, de Jesús Torres Tejeda. Detrás vinieron Llorará Por Mí, Dos Palabras, Negra Soledad, Poquita Fe, Háblame, Olvídate de Mí, Torpeza, Cosas del Alma, Tú Mi Delirio y Como Duele Una Traición.

Entre los álbumes están Sólo Para Amarte, Llorarás Por Mí y un disco hecho con la cubana Olga Guillot.

**Las canciones prohibidas**

En 1969 grabó dos aguinaldos, Navidad 69 y Aguinaldo 69. Eran las primeras composiciones grabadas de un autor llamado Mundito Espinal, y según la lectura del propio Espinal sus letras eran llamados a la sublevación contra el gobierno de Joaquín Balaguer.

La Comisión de Espectáculos Públicos y Radiofonía las prohibió. Los relatos nombran una tercera detrás, Dictadura con Apoyo Popular.

Conviene ser exacto sobre de quién eran esas canciones, porque casi todas las páginas que repiten la historia dicen que Deschamps grababa composiciones suyas. No lo eran. Él era el cantante que un autor joven consiguió, y que él te cantara era la manera en que un compositor llegaba, lo cual describe bastante bien cuánto valía en esa década.

**La negativa**

Nunca apareció en televisión. En un país donde una carrera se construía en un programa de variedades y donde todos sus contemporáneos estaban en pantalla, él sencillamente no fue, y un periódico dominicano seguía escribiendo sobre esa decisión veintiocho años después de su muerte.

Por eso se le recuerda como se le recuerda: no por las imágenes, porque casi no hay, sino por las grabaciones y por la gente que estuvo en el salón. El bohemio que le dijo que no al ruido es la frase que se le repite, y es exacta tanto sobre la carrera como sobre la voz.

Murió en 1985, a los cincuenta y cinco. Su hijo también grabó, una generación después y en una forma que él no habría reconocido: Papo, del dúo de merenrap Sandy & Papo MC, que también murió joven.',
       updated_at = now()
 WHERE slug = 'julito-deschamps';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'julito-deschamps')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'julito-deschamps')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Julito Deschamps was a Dominican bolero singer, pianist, guitarist and composer, and the defining voice of the country’s late-night music. He worked in small rooms for most of his life and refused the things that would have made him famous.","type":"text"}]},{"type":"paragraph","content":[{"text":"The boîte","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A boîte is a small dark room with a piano, a few tables and no stage worth the name. Santo Domingo and Santiago had a circuit of them through the sixties and seventies, and that circuit is where Dominican bolero actually lived — not on the radio, not in the ballrooms, but at close range in front of forty people at two in the morning.","type":"text"}]},{"type":"paragraph","content":[{"text":"He was the figure of that world. The voice is powerful and complaining at once, the diction exact, and everything about the delivery assumes the listener is close enough to hear him breathe.","type":"text"}]},{"type":"paragraph","content":[{"text":"The mathematician","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Musicians called him el matemático because of how he chose songs. His repertoire is a very deliberate list — Sortilegio, La Gloria Eres Tú, Delirio, ¿Cómo Fue?, Miénteme, Tres Palabras, Pecadora, Te Necesito, Yo Vivo Mi Vida, Amor Perdido — and almost everything he picked up became identified with him.","type":"text"}]},{"type":"paragraph","content":[{"text":"He came into it as a singer with Papatín Ovalles’s orchestra in 1952, and his first recording did not arrive until 1960: Tu Palabra y La Mía, written by Antonio Morel. What made his name was Será Muy Fácil, by Jesús Torres Tejeda. Llorará Por Mí, Dos Palabras, Negra Soledad, Poquita Fe, Háblame, Olvídate de Mí, Torpeza, Cosas del Alma, Tú Mi Delirio and Como Duele Una Traición followed.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sólo Para Amarte, Llorarás Por Mí and a record made with the Cuban singer Olga Guillot are among the albums.","type":"text"}]},{"type":"paragraph","content":[{"text":"The songs that were banned","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 1969 he recorded two Christmas songs, Navidad 69 and Aguinaldo 69. They were the first compositions ever recorded of a writer named Mundito Espinal, and by Espinal’s own reading their lyrics were calls to rise against the government of Joaquín Balaguer.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Comisión de Espectáculos Públicos y Radiofonía banned them. A third, Dictadura con Apoyo Popular, is named in the accounts as following.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is worth being exact about whose songs those were, because almost every page that repeats the story says Deschamps was recording his own compositions. He was not. He was the singer a young writer got, and being sung by him was how a composer arrived — which is a description of what he was worth in that decade.","type":"text"}]},{"type":"paragraph","content":[{"text":"The refusal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He never appeared on television. In a country where a career was built on a variety programme and where every contemporary of his was on screen, he simply did not go, and a Dominican newspaper was still writing about that decision twenty-eight years after his death.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is why he is remembered the way he is: not through footage, because there is almost none, but through recordings and through people who were in the room. The bohemian who refused the noise is the phrase that keeps getting used about him, and it is accurate about the career as well as the voice.","type":"text"}]},{"type":"paragraph","content":[{"text":"He died in 1985, at fifty-five. His son recorded too, a generation later and in a form he would not have recognised: Papo, of the merenrap duo Sandy & Papo MC, who also died young.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'julito-deschamps'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Julito Deschamps fue cantante de boleros, pianista, guitarrista y compositor dominicano, y la voz que define la música nocturna del país. Trabajó en salones pequeños casi toda su vida y rechazó lo que lo habría vuelto famoso.","type":"text"}]},{"type":"paragraph","content":[{"text":"La boîte","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Una boîte es un salón chiquito y oscuro con un piano, unas mesas y ninguna tarima que merezca el nombre. Santo Domingo y Santiago tuvieron un circuito de ellas durante los sesenta y los setenta, y ahí fue donde de verdad vivió el bolero dominicano: no en la radio, no en los salones de baile, sino a corta distancia delante de cuarenta personas a las dos de la mañana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Él era la figura de ese mundo. La voz es potente y quejumbrosa a la vez, la dicción exacta, y todo en la entrega da por sentado que el que oye está lo bastante cerca para oírlo respirar.","type":"text"}]},{"type":"paragraph","content":[{"text":"El matemático","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los músicos le decían el matemático por cómo escogía las canciones. Su repertorio es una lista muy deliberada —Sortilegio, La Gloria Eres Tú, Delirio, ¿Cómo Fue?, Miénteme, Tres Palabras, Pecadora, Te Necesito, Yo Vivo Mi Vida, Amor Perdido— y casi todo lo que agarró terminó identificándose con él.","type":"text"}]},{"type":"paragraph","content":[{"text":"Entró como cantante en la orquesta de Papatín Ovalles en 1952, y su primera grabación no llegó hasta 1960: Tu Palabra y La Mía, de Antonio Morel. Lo que le hizo el nombre fue Será Muy Fácil, de Jesús Torres Tejeda. Detrás vinieron Llorará Por Mí, Dos Palabras, Negra Soledad, Poquita Fe, Háblame, Olvídate de Mí, Torpeza, Cosas del Alma, Tú Mi Delirio y Como Duele Una Traición.","type":"text"}]},{"type":"paragraph","content":[{"text":"Entre los álbumes están Sólo Para Amarte, Llorarás Por Mí y un disco hecho con la cubana Olga Guillot.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las canciones prohibidas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1969 grabó dos aguinaldos, Navidad 69 y Aguinaldo 69. Eran las primeras composiciones grabadas de un autor llamado Mundito Espinal, y según la lectura del propio Espinal sus letras eran llamados a la sublevación contra el gobierno de Joaquín Balaguer.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Comisión de Espectáculos Públicos y Radiofonía las prohibió. Los relatos nombran una tercera detrás, Dictadura con Apoyo Popular.","type":"text"}]},{"type":"paragraph","content":[{"text":"Conviene ser exacto sobre de quién eran esas canciones, porque casi todas las páginas que repiten la historia dicen que Deschamps grababa composiciones suyas. No lo eran. Él era el cantante que un autor joven consiguió, y que él te cantara era la manera en que un compositor llegaba, lo cual describe bastante bien cuánto valía en esa década.","type":"text"}]},{"type":"paragraph","content":[{"text":"La negativa","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nunca apareció en televisión. En un país donde una carrera se construía en un programa de variedades y donde todos sus contemporáneos estaban en pantalla, él sencillamente no fue, y un periódico dominicano seguía escribiendo sobre esa decisión veintiocho años después de su muerte.","type":"text"}]},{"type":"paragraph","content":[{"text":"Por eso se le recuerda como se le recuerda: no por las imágenes, porque casi no hay, sino por las grabaciones y por la gente que estuvo en el salón. El bohemio que le dijo que no al ruido es la frase que se le repite, y es exacta tanto sobre la carrera como sobre la voz.","type":"text"}]},{"type":"paragraph","content":[{"text":"Murió en 1985, a los cincuenta y cinco. Su hijo también grabó, una generación después y en una forma que él no habría reconocido: Papo, del dúo de merenrap Sandy & Papo MC, que también murió joven.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'julito-deschamps'), 3)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
