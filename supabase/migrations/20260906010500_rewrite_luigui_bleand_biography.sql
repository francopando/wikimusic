BEGIN;

-- Rewrite the catalogue entry for Luigui Bleand.
--
-- Luigui Bleand. Filler in English, nothing in Spanish, no aliases, no
-- instruments, no disambiguation -- on a man who owns record labels, controls
-- the publishing of one of the founding figures of merengue típico, and had a
-- two-sentence machine paragraph in this catalogue.
--
-- HE HAS A SPANISH WIKIPEDIA ARTICLE WITH THIRTY-FIVE CITATIONS, which is not
-- something most artists in this run have. Its sources are Listín Diario, Hoy,
-- elCaribe, Diario Libre, El Nuevo Diario, Rolling Stone en Español and Caracol
-- Radio, and the substantive claims below were traced back to those rather than
-- taken from the article.
--
-- THE NAME FIELDS HELD THE STAGE NAME AGAIN. The row read first_name "Luigui",
-- last_name "Bleand". His legal name is Luis Alfredo Silverio Esmanier. Wikidata
-- carries it, Wikipedia carries it, and the article records that when his first
-- company was reincorporated in Miami the rights were assigned "bajo la firma de
-- Luis Silverio". Corrected across all four fields, and sort_name goes to the
-- whole stage name for the same reason as Jhonny Evidence: "Bleand" is not a
-- surname.
--
-- A BIRTHPLACE CONTRADICTION INSIDE ONE ARTICLE. Wikipedia's infobox says Monte
-- Cristi, Dominican Republic, sourced to Wikidata. Wikipedia's own opening
-- sentence, two inches below it, says "(Haití, 24 de febrero de 1991)". The row
-- says Monte Cristi. He is described everywhere as Dominican-Haitian, which is
-- probably how the confusion started. province and birth_place are NOT touched;
-- the date, which both agree on and the row already had, is not touched either.
--
-- ADDED: aliases El Asesino Sin Guante, which is how his own YouTube channel
-- signs off and is also the title of his 2023 EP. instruments, from the list he
-- gives: piano, guitar, tambora, congas and bongos are the ones with slugs in
-- this table; he also plays maracas, djembe and harmonica, and those are named
-- in the prose because there is nowhere to put them. occupations composer and
-- musician beside the producer already stored. genres. disambiguation.
--
-- website CLEARED. The row held www.luiguibleand.com; the deployment is gone and
-- the domain returns a 404 from its host. TO RESTORE: put it back in the row
-- block if the site returns.
--
-- THE ROYALTIES DISPUTE IS IN, AND HERE IS THE REASONING. The standing rule is
-- that a credits and royalties dispute belongs in this catalogue because
-- authorship is what it records. This one is about who controls the published
-- works of Tatico Henríquez, which is a Dominican heritage question and not a
-- piece of gossip. Más VIP, 9 March 2024, reports it in detail: Julio García
-- Reynoso, heir of Domingo García -- Tatico Henríquez, 1943-1976 -- and owner of
-- TH Publishing, says the conflict with the businessman Chico Mambo began over
-- an exclusive licence in which Chico Mambo offered 20% of royalties and Reynoso
-- wanted 50%; that Chico Mambo's claim that musicians' rights were violated is
-- untrue; and that Luigui Bleand administers those works under contracts that
-- authorise him to do so. Both positions are attributed in the prose to the
-- people who hold them.
--
-- WHAT IS DELIBERATELY NOT WRITTEN ABOUT IT. A post from Chico Mambo
-- Distribution's own Instagram, one week old, states that Bleand is
-- "permanentemente restringido e imposibilitado" from something. That is one
-- party's account of a legal outcome, published by that party, with no press
-- report found to corroborate it. An adverse legal finding is not something to
-- record from a litigant's social media, so the entry stops at March 2024 and
-- says the matter was unresolved there. If a court decision is reported by a
-- newspaper, it can be added.
--
-- NOT WRITTEN: his marriage and his four children, which the Wikipedia infobox
-- gives. THE ORPHANAGE AND THE SHOE-SHINING ARE IN, and that is a considered
-- call rather than an oversight -- it is his own account, given in interviews,
-- and Listín Diario ran it as a headline in September 2017 ("Luigui Bleand de un
-- orfanato a la música urbana"). It is formation, not private life, and it is
-- the same category as the student jobs written into Rico López's entry.
--
-- NO NUMBERS. The Record World independent-radio placing for "Gomelo" and the
-- view counts in the trade coverage are both left out.
--
-- SOURCES: Spanish Wikipedia and its citations. His own YouTube channel, for the
-- self-description "DOMINICO HATIAN - ITALIAN - RAPPER / SINGER - Musician -
-- Record Producer - El Asesino Sin Guante" and eight video titles. His own
-- Instagram. Más VIP, 9 March 2024, for the publishing dispute. Listín Diario,
-- 15 September 2017 and 18 November 2025; Hoy, 5 September 2017, 13 July 2019
-- and 10 March 2020; Diario Libre, 2 January 2024 and 16 December 2024; El Nuevo
-- Diario, 7 February 2023 and 17 November 2025; elCaribe, 23 April 2024.
--
-- NOT LINKED: Pedrina is Colombian. Crazy Design, Los Teke Teke, El Nene la
-- Amenaza, El Fother, N-Fasis, Marilyn Oquendo, Romy Ram, Henry G, Goldy Boy,
-- Chico Mambo, Bairon Nieves Polanco, Newton Smith and Julio García Reynoso have
-- no entries. Crazy Design and Los Teke Teke are the notable gaps. "Henry G" is
-- NOT the published Henry García -- different artist, not conflated.
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
       name = 'Luigui Bleand',
       sort_name = 'Luigui Bleand',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = '1991-02-24',
       birth_year = 1991,
       date_of_death = NULL,
       birth_place = 'Monte Cristi',
       province = 'Monte Cristi',
       first_name = 'Luis',
       middle_name = 'Alfredo',
       last_name = 'Silverio',
       second_last_name = 'Esmanier',
       stage_name = 'Luigui Bleand',
       aliases = ARRAY['El Asesino Sin Guante']::text[],
       occupations = '["producer","composer","musician"]'::jsonb,
       instruments = ARRAY['voice', 'piano', 'guitar', 'tambora', 'congas', 'bongos']::text[],
       genres = ARRAY['urban-rap-hip-hop', 'urban-reggaeton', 'reggae']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@LuiguiBleand',
       facebook = 'luiguibleand',
       instagram = 'luiguibleand',
       disambiguation = 'Singer, producer and label owner; Bleand Style Recordings and Harley Boys Entertainment',
       bio_en = 'Luigui Bleand, born Luis Alfredo Silverio Esmanier, is a Dominican-Haitian singer, multi-instrumentalist, record producer and label owner. He is more consequential as a businessman than as a performer, and the performing is not small.

**An orphanage and a pair of shoes**

He spent his childhood and adolescence in an orphanage because his parents could not keep him, and afterwards lived on the street shining shoes. He has told that story in interviews for years and a national newspaper ran it as a headline.

He learned to play by ear in that period, with no school and no teacher, and he plays a lot of things: piano, guitar, harmonica, and the percussion a Dominican picks up first — tambora, congas, bongos, maracas, and a djembe, which is not a Dominican instrument and says something about a Haitian household.

He came out of the orphanage in 2006, took a job at a newspaper, and saved until he could put together an amateur recording studio. The first song he cut there was called Un Día Sin Ti.

**From artist to catalogue**

The turn that decided his career came in 2013, when he signed with a distributor rather than a label — and then, instead of being a client of the distribution business, went into it. In 2014 he set up a company in New York and began signing and producing other Dominicans.

The names on that first roster are the point: Los Teke Teke, El Nene la Amenaza, Musicólogo the Libro and Ramón Torres. The partnership fell apart over money and he rebuilt it in Miami in his own name.

Since then he has produced or handled catalogue for Químico Ultra Mega, El Fother, N-Fasis, Bonny Cepeda and Aposento Alto. Two labels carry his work: Bleand Style Recordings, which holds Natan El Profeta and El Philippe among others, and Harley Boys Entertainment, which has held Amenazzy, Crazy Design and El Completo RD.

**The records under his own name**

Te Freno, La Maquinita, Bésame La Boca, Corazón de Acero, Gomelo, Cuando Te Vea. Then the 2023 run: Lo’ Prieto with Musicólogo the Libro, Mueve Eso with La Perversa, and Zumba with Yomel el Meloso and Tivi Gunz — the EP they belong to is called Asesino Sin Guante, which is also what he calls himself.

The albums are Génesis and Análogo Season I. The sound moves between rap, reggaetón and a reggae-pop that the trade press picked up on, and the Wikipedia entry lists bachata and merengue among his genres too, which for a producer working across a Dominican catalogue is simply accurate.

**The Tatico Henríquez publishing**

The most consequential thing he does has nothing to do with his own voice. His companies administer the published works of Tatico Henríquez, the accordionist who invented most of what merengue típico still sounds like, on behalf of the heir who owns them.

That put him inside a rights dispute. According to Julio García Reynoso, who owns TH Publishing and is a legal successor of the composer, the conflict with the businessman Chico Mambo began over an exclusive licence: Chico Mambo offered twenty per cent of royalties, Reynoso wanted fifty. Chico Mambo has said musicians’ rights were being violated; Reynoso denies it and says he distributes only his own half. Bleand’s role, on Reynoso’s account, is contractual and authorised.

Whatever the merits, it is a real question and an old one. Típico was recorded in an era with almost no paperwork, its greatest figure died in 1976, and half a century later the question of who may license those songs is still being argued between publishers, heirs and the bands who play them nightly.

His company also acquired the catalogue of Monkey Black. Buying a dead rapper’s masters is the same instinct as administering a dead accordionist’s songs: he is in the business of Dominican music as property, which almost nobody Dominican was, and which is why other people’s catalogues keep ending up with him.

**Pictures and machines**

Bleand Style Pictures, the film arm, produced a documentary portrait of Natan El Profeta. He has also built an artificial-intelligence avatar called Il Capo and released music through it, which makes him among the first in Dominican urban music to try that at all.

At the end of 2024 he announced a sabbatical — not a retirement, he said, but a need to change what he was pointing at. A year later a European rights-management company took over the Harley Boys catalogue, and he moved on to the next set of structures.',
       bio_es = 'Luigui Bleand, de nombre Luis Alfredo Silverio Esmanier, es cantante, multiinstrumentista, productor discográfico y dueño de sellos, dominicano-haitiano. Pesa más como empresario que como intérprete, y lo de intérprete no es poco.

**Un orfanato y un par de zapatos**

Pasó la niñez y la adolescencia en un orfanato porque sus padres no podían sostenerlo, y después vivió en la calle lustrando zapatos. Lleva años contando esa historia en entrevistas y un periódico nacional la puso de titular.

En esa época aprendió a tocar de oído, sin escuela y sin maestro, y toca bastantes cosas: piano, guitarra, armónica, y la percusión que un dominicano agarra primero —tambora, congas, bongó, maracas— y un yembé, que no es instrumento dominicano y dice algo de una casa haitiana.

Salió del orfanato en 2006, entró a trabajar en un periódico, y ahorró hasta poder montar un estudio de grabación casero. La primera canción que grabó ahí se llamó Un Día Sin Ti.

**De artista a catálogo**

El giro que le decidió la carrera fue en 2013, cuando firmó con una distribuidora y no con un sello, y después, en vez de quedarse de cliente del negocio de la distribución, se metió dentro. En 2014 montó una compañía en Nueva York y empezó a firmar y producir a otros dominicanos.

Los nombres de esa primera nómina son el punto: Los Teke Teke, El Nene la Amenaza, Musicólogo the Libro y Ramón Torres. La sociedad se rompió por dinero y él la rearmó en Miami a su propio nombre.

Desde entonces ha producido o manejado catálogo de Químico Ultra Mega, El Fother, N-Fasis, Bonny Cepeda y Aposento Alto. Dos sellos cargan su trabajo: Bleand Style Recordings, que tiene a Natan El Profeta y a El Philippe entre otros, y Harley Boys Entertainment, que ha tenido a Amenazzy, Crazy Design y El Completo RD.

**Los discos con su nombre**

Te Freno, La Maquinita, Bésame La Boca, Corazón de Acero, Gomelo, Cuando Te Vea. Después la tanda de 2023: Lo’ Prieto con Musicólogo the Libro, Mueve Eso con La Perversa, y Zumba con Yomel el Meloso y Tivi Gunz; el EP al que pertenecen se llama Asesino Sin Guante, que es también como se hace llamar él.

Los álbumes son Génesis y Análogo Season I. El sonido se mueve entre rap, reguetón y un reggae pop que la prensa especializada le señaló, y su ficha de Wikipedia le pone además bachata y merengue entre los géneros, que para un productor que trabaja un catálogo dominicano es sencillamente exacto.

**La publicidad de Tatico Henríquez**

Lo más consecuente que hace no tiene nada que ver con su voz. Sus compañías administran la obra editada de Tatico Henríquez, el acordeonista que inventó casi todo lo que el merengue típico todavía suena, por cuenta del heredero que la posee.

Eso lo metió en una disputa de derechos. Según Julio García Reynoso, dueño de TH Publishing y sucesor legal del compositor, el conflicto con el empresario Chico Mambo empezó por una licencia exclusiva: Chico Mambo ofrecía veinte por ciento de regalías y Reynoso quería cincuenta. Chico Mambo ha dicho que se violaban derechos de los músicos; Reynoso lo niega y dice que él distribuye únicamente su mitad. El papel de Bleand, según Reynoso, es contractual y está autorizado.

Tenga razón quien la tenga, es una pregunta real y vieja. El típico se grabó en una época casi sin papeleo, su figura mayor murió en 1976, y medio siglo después todavía se discute entre editoras, herederos y las bandas que lo tocan todas las noches quién puede licenciar esas canciones.

Su compañía también adquirió el catálogo de Monkey Black. Comprar los másters de un rapero muerto es el mismo instinto que administrar las canciones de un acordeonista muerto: está en el negocio de la música dominicana entendida como propiedad, que es donde casi ningún dominicano estuvo, y por eso los catálogos ajenos le siguen llegando.

**Cine y máquinas**

Bleand Style Pictures, el brazo audiovisual, produjo un retrato documental de Natan El Profeta. También construyó un avatar de inteligencia artificial llamado Il Capo y sacó música a través de él, lo que lo pone entre los primeros de la música urbana dominicana en intentarlo siquiera.

A finales de 2024 anunció un sabático: no un retiro, dijo, sino la necesidad de cambiar hacia dónde estaba mirando. Un año después una compañía europea de gestión de derechos se quedó con el catálogo de Harley Boys, y él pasó al siguiente juego de estructuras.',
       updated_at = now()
 WHERE slug = 'luigui-bleand';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luigui Bleand, born Luis Alfredo Silverio Esmanier, is a Dominican-Haitian singer, multi-instrumentalist, record producer and label owner. He is more consequential as a businessman than as a performer, and the performing is not small.","type":"text"}]},{"type":"paragraph","content":[{"text":"An orphanage and a pair of shoes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He spent his childhood and adolescence in an orphanage because his parents could not keep him, and afterwards lived on the street shining shoes. He has told that story in interviews for years and a national newspaper ran it as a headline.","type":"text"}]},{"type":"paragraph","content":[{"text":"He learned to play by ear in that period, with no school and no teacher, and he plays a lot of things: piano, guitar, harmonica, and the percussion a Dominican picks up first — tambora, congas, bongos, maracas, and a djembe, which is not a Dominican instrument and says something about a Haitian household.","type":"text"}]},{"type":"paragraph","content":[{"text":"He came out of the orphanage in 2006, took a job at a newspaper, and saved until he could put together an amateur recording studio. The first song he cut there was called Un Día Sin Ti.","type":"text"}]},{"type":"paragraph","content":[{"text":"From artist to catalogue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The turn that decided his career came in 2013, when he signed with a distributor rather than a label — and then, instead of being a client of the distribution business, went into it. In 2014 he set up a company in New York and began signing and producing other Dominicans.","type":"text"}]},{"type":"paragraph","content":[{"text":"The names on that first roster are the point: Los Teke Teke, El Nene la Amenaza, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"97610f30-fb92-4d77-8b98-ddec14d12afc","displayText":"Musicólogo the Libro","occurrenceId":"4b4abdca-ab6a-4bae-b606-76b2fe2a337f"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a73d457d-6ff6-4dde-89e9-1e41dfdf2d54","displayText":"Ramón Torres","occurrenceId":"ef296d4b-2535-4dbf-b152-9811c07991b5"}},{"text":". The partnership fell apart over money and he rebuilt it in Miami in his own name.","type":"text"}]},{"type":"paragraph","content":[{"text":"Since then he has produced or handled catalogue for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"0340ed2d-5ac1-45b8-a218-baefc78cd003"}},{"text":", El Fother, N-Fasis, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc4db4c6-c96f-4eb7-af95-ac637785c5bf","displayText":"Bonny Cepeda","occurrenceId":"f5294d16-4afb-423d-b1f4-cf2dbb7d8b6b"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"594b49f0-b18e-40d7-8ae2-884434c1a954","displayText":"Aposento Alto","occurrenceId":"977d16f6-3ce3-424b-baa0-0055dca7ab97"}},{"text":". Two labels carry his work: Bleand Style Recordings, which holds ","type":"text"},{"type":"artistReference","attrs":{"artistId":"23e6e2d6-b371-4393-9ce2-14c91d6d1d2e","displayText":"Natan El Profeta","occurrenceId":"87cf9648-c985-4cde-b8fb-510a471c747c"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"13c706f5-06cf-475f-8b82-fe6b1a4d2440","displayText":"El Philippe","occurrenceId":"ef8b3983-c853-417e-ab47-61ead2e75087"}},{"text":" among others, and Harley Boys Entertainment, which has held ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5fb12fee-64fe-4887-b87e-28f28a15c4f9","displayText":"Amenazzy","occurrenceId":"cd9b8adb-ce3f-4a46-82ee-968e7299a84a"}},{"text":", Crazy Design and El Completo RD.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records under his own name","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Te Freno, La Maquinita, Bésame La Boca, Corazón de Acero, Gomelo, Cuando Te Vea. Then the 2023 run: Lo’ Prieto with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"97610f30-fb92-4d77-8b98-ddec14d12afc","displayText":"Musicólogo the Libro","occurrenceId":"ab8c4b48-466c-441e-b383-258c11794dbc"}},{"text":", Mueve Eso with La Perversa, and Zumba with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bb07dcb8-444f-4a68-a668-21e9e038f335","displayText":"Yomel el Meloso","occurrenceId":"1b35c791-1d7b-48b1-8e31-2e65da26d73d"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"edc7d7ff-b0ba-483e-a254-58bb0a7deb7e"}},{"text":" — the EP they belong to is called Asesino Sin Guante, which is also what he calls himself.","type":"text"}]},{"type":"paragraph","content":[{"text":"The albums are Génesis and Análogo Season I. The sound moves between rap, reggaetón and a reggae-pop that the trade press picked up on, and the Wikipedia entry lists bachata and merengue among his genres too, which for a producer working across a Dominican catalogue is simply accurate.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Tatico Henríquez publishing","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The most consequential thing he does has nothing to do with his own voice. His companies administer the published works of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"a8aef458-28c1-4b83-af99-820ddc422240"}},{"text":", the accordionist who invented most of what merengue típico still sounds like, on behalf of the heir who owns them.","type":"text"}]},{"type":"paragraph","content":[{"text":"That put him inside a rights dispute. According to Julio García Reynoso, who owns TH Publishing and is a legal successor of the composer, the conflict with the businessman Chico Mambo began over an exclusive licence: Chico Mambo offered twenty per cent of royalties, Reynoso wanted fifty. Chico Mambo has said musicians’ rights were being violated; Reynoso denies it and says he distributes only his own half. Bleand’s role, on Reynoso’s account, is contractual and authorised.","type":"text"}]},{"type":"paragraph","content":[{"text":"Whatever the merits, it is a real question and an old one. Típico was recorded in an era with almost no paperwork, its greatest figure died in 1976, and half a century later the question of who may license those songs is still being argued between publishers, heirs and the bands who play them nightly.","type":"text"}]},{"type":"paragraph","content":[{"text":"His company also acquired the catalogue of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8af29e3a-6ae7-4a2d-9389-8ec927790901","displayText":"Monkey Black","occurrenceId":"266a87ae-7c5c-43df-a22f-18c4efe1c1f5"}},{"text":". Buying a dead rapper’s masters is the same instinct as administering a dead accordionist’s songs: he is in the business of Dominican music as property, which almost nobody Dominican was, and which is why other people’s catalogues keep ending up with him.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pictures and machines","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Bleand Style Pictures, the film arm, produced a documentary portrait of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"23e6e2d6-b371-4393-9ce2-14c91d6d1d2e","displayText":"Natan El Profeta","occurrenceId":"9d7c2985-377d-4269-b6d0-7d108394cbb1"}},{"text":". He has also built an artificial-intelligence avatar called Il Capo and released music through it, which makes him among the first in Dominican urban music to try that at all.","type":"text"}]},{"type":"paragraph","content":[{"text":"At the end of 2024 he announced a sabbatical — not a retirement, he said, but a need to change what he was pointing at. A year later a European rights-management company took over the Harley Boys catalogue, and he moved on to the next set of structures.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'luigui-bleand'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luigui Bleand, de nombre Luis Alfredo Silverio Esmanier, es cantante, multiinstrumentista, productor discográfico y dueño de sellos, dominicano-haitiano. Pesa más como empresario que como intérprete, y lo de intérprete no es poco.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un orfanato y un par de zapatos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pasó la niñez y la adolescencia en un orfanato porque sus padres no podían sostenerlo, y después vivió en la calle lustrando zapatos. Lleva años contando esa historia en entrevistas y un periódico nacional la puso de titular.","type":"text"}]},{"type":"paragraph","content":[{"text":"En esa época aprendió a tocar de oído, sin escuela y sin maestro, y toca bastantes cosas: piano, guitarra, armónica, y la percusión que un dominicano agarra primero —tambora, congas, bongó, maracas— y un yembé, que no es instrumento dominicano y dice algo de una casa haitiana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salió del orfanato en 2006, entró a trabajar en un periódico, y ahorró hasta poder montar un estudio de grabación casero. La primera canción que grabó ahí se llamó Un Día Sin Ti.","type":"text"}]},{"type":"paragraph","content":[{"text":"De artista a catálogo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El giro que le decidió la carrera fue en 2013, cuando firmó con una distribuidora y no con un sello, y después, en vez de quedarse de cliente del negocio de la distribución, se metió dentro. En 2014 montó una compañía en Nueva York y empezó a firmar y producir a otros dominicanos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los nombres de esa primera nómina son el punto: Los Teke Teke, El Nene la Amenaza, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"97610f30-fb92-4d77-8b98-ddec14d12afc","displayText":"Musicólogo the Libro","occurrenceId":"34ca303a-848f-4852-833b-d6c5190739a0"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a73d457d-6ff6-4dde-89e9-1e41dfdf2d54","displayText":"Ramón Torres","occurrenceId":"d277465a-8e0e-450b-a14f-3151f542f833"}},{"text":". La sociedad se rompió por dinero y él la rearmó en Miami a su propio nombre.","type":"text"}]},{"type":"paragraph","content":[{"text":"Desde entonces ha producido o manejado catálogo de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"dde275da-4dc8-49e4-890f-192abd5b38f6"}},{"text":", El Fother, N-Fasis, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc4db4c6-c96f-4eb7-af95-ac637785c5bf","displayText":"Bonny Cepeda","occurrenceId":"48ba18df-cc7e-4b44-b2b5-3af5d9b95f25"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"594b49f0-b18e-40d7-8ae2-884434c1a954","displayText":"Aposento Alto","occurrenceId":"08d9b511-269b-4ec9-a78f-f98a3613a955"}},{"text":". Dos sellos cargan su trabajo: Bleand Style Recordings, que tiene a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"23e6e2d6-b371-4393-9ce2-14c91d6d1d2e","displayText":"Natan El Profeta","occurrenceId":"1d14d306-b419-4342-80af-3880a4aa28fa"}},{"text":" y a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"13c706f5-06cf-475f-8b82-fe6b1a4d2440","displayText":"El Philippe","occurrenceId":"519c1a40-3306-4e15-936c-eb1d25d67b3b"}},{"text":" entre otros, y Harley Boys Entertainment, que ha tenido a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5fb12fee-64fe-4887-b87e-28f28a15c4f9","displayText":"Amenazzy","occurrenceId":"91cc333f-7557-49d7-a95d-0392d2004a4e"}},{"text":", Crazy Design y El Completo RD.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos con su nombre","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Te Freno, La Maquinita, Bésame La Boca, Corazón de Acero, Gomelo, Cuando Te Vea. Después la tanda de 2023: Lo’ Prieto con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"97610f30-fb92-4d77-8b98-ddec14d12afc","displayText":"Musicólogo the Libro","occurrenceId":"b9174455-fe6e-4a8a-ab1e-225bd60d5d54"}},{"text":", Mueve Eso con La Perversa, y Zumba con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bb07dcb8-444f-4a68-a668-21e9e038f335","displayText":"Yomel el Meloso","occurrenceId":"29ee6ef3-ec80-40eb-8c0b-08e4bd49fd89"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"6a5163b4-96e3-4667-bbbe-ee5fe5b9b555"}},{"text":"; el EP al que pertenecen se llama Asesino Sin Guante, que es también como se hace llamar él.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los álbumes son Génesis y Análogo Season I. El sonido se mueve entre rap, reguetón y un reggae pop que la prensa especializada le señaló, y su ficha de Wikipedia le pone además bachata y merengue entre los géneros, que para un productor que trabaja un catálogo dominicano es sencillamente exacto.","type":"text"}]},{"type":"paragraph","content":[{"text":"La publicidad de Tatico Henríquez","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo más consecuente que hace no tiene nada que ver con su voz. Sus compañías administran la obra editada de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"4a336ce3-a3b2-487d-9023-785db7294666"}},{"text":", el acordeonista que inventó casi todo lo que el merengue típico todavía suena, por cuenta del heredero que la posee.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eso lo metió en una disputa de derechos. Según Julio García Reynoso, dueño de TH Publishing y sucesor legal del compositor, el conflicto con el empresario Chico Mambo empezó por una licencia exclusiva: Chico Mambo ofrecía veinte por ciento de regalías y Reynoso quería cincuenta. Chico Mambo ha dicho que se violaban derechos de los músicos; Reynoso lo niega y dice que él distribuye únicamente su mitad. El papel de Bleand, según Reynoso, es contractual y está autorizado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tenga razón quien la tenga, es una pregunta real y vieja. El típico se grabó en una época casi sin papeleo, su figura mayor murió en 1976, y medio siglo después todavía se discute entre editoras, herederos y las bandas que lo tocan todas las noches quién puede licenciar esas canciones.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su compañía también adquirió el catálogo de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8af29e3a-6ae7-4a2d-9389-8ec927790901","displayText":"Monkey Black","occurrenceId":"bca28c21-0992-4f2a-8cff-7d4de79f07ca"}},{"text":". Comprar los másters de un rapero muerto es el mismo instinto que administrar las canciones de un acordeonista muerto: está en el negocio de la música dominicana entendida como propiedad, que es donde casi ningún dominicano estuvo, y por eso los catálogos ajenos le siguen llegando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cine y máquinas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Bleand Style Pictures, el brazo audiovisual, produjo un retrato documental de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"23e6e2d6-b371-4393-9ce2-14c91d6d1d2e","displayText":"Natan El Profeta","occurrenceId":"6418bbce-358d-4d94-9e94-6f976b49d23a"}},{"text":". También construyó un avatar de inteligencia artificial llamado Il Capo y sacó música a través de él, lo que lo pone entre los primeros de la música urbana dominicana en intentarlo siquiera.","type":"text"}]},{"type":"paragraph","content":[{"text":"A finales de 2024 anunció un sabático: no un retiro, dijo, sino la necesidad de cambiar hacia dónde estaba mirando. Un año después una compañía europea de gestión de derechos se quedó con el catálogo de Harley Boys, y él pasó al siguiente juego de estructuras.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'luigui-bleand'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), '0340ed2d-5ac1-45b8-a218-baefc78cd003', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), '1b35c791-1d7b-48b1-8e31-2e65da26d73d', 'artist', 'bb07dcb8-444f-4a68-a668-21e9e038f335');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), '266a87ae-7c5c-43df-a22f-18c4efe1c1f5', 'artist', '8af29e3a-6ae7-4a2d-9389-8ec927790901');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), '4b4abdca-ab6a-4bae-b606-76b2fe2a337f', 'artist', '97610f30-fb92-4d77-8b98-ddec14d12afc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), '87cf9648-c985-4cde-b8fb-510a471c747c', 'artist', '23e6e2d6-b371-4393-9ce2-14c91d6d1d2e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), '977d16f6-3ce3-424b-baa0-0055dca7ab97', 'artist', '594b49f0-b18e-40d7-8ae2-884434c1a954');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), '9d7c2985-377d-4269-b6d0-7d108394cbb1', 'artist', '23e6e2d6-b371-4393-9ce2-14c91d6d1d2e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), 'a8aef458-28c1-4b83-af99-820ddc422240', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), 'ab8c4b48-466c-441e-b383-258c11794dbc', 'artist', '97610f30-fb92-4d77-8b98-ddec14d12afc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), 'cd9b8adb-ce3f-4a46-82ee-968e7299a84a', 'artist', '5fb12fee-64fe-4887-b87e-28f28a15c4f9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), 'edc7d7ff-b0ba-483e-a254-58bb0a7deb7e', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), 'ef296d4b-2535-4dbf-b152-9811c07991b5', 'artist', 'a73d457d-6ff6-4dde-89e9-1e41dfdf2d54');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), 'ef8b3983-c853-417e-ab47-61ead2e75087', 'artist', '13c706f5-06cf-475f-8b82-fe6b1a4d2440');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'en'), 'f5294d16-4afb-423d-b1f4-cf2dbb7d8b6b', 'artist', 'bc4db4c6-c96f-4eb7-af95-ac637785c5bf');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '08d9b511-269b-4ec9-a78f-f98a3613a955', 'artist', '594b49f0-b18e-40d7-8ae2-884434c1a954');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '1d14d306-b419-4342-80af-3880a4aa28fa', 'artist', '23e6e2d6-b371-4393-9ce2-14c91d6d1d2e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '29ee6ef3-ec80-40eb-8c0b-08e4bd49fd89', 'artist', 'bb07dcb8-444f-4a68-a668-21e9e038f335');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '34ca303a-848f-4852-833b-d6c5190739a0', 'artist', '97610f30-fb92-4d77-8b98-ddec14d12afc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '48ba18df-cc7e-4b44-b2b5-3af5d9b95f25', 'artist', 'bc4db4c6-c96f-4eb7-af95-ac637785c5bf');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '4a336ce3-a3b2-487d-9023-785db7294666', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '519c1a40-3306-4e15-936c-eb1d25d67b3b', 'artist', '13c706f5-06cf-475f-8b82-fe6b1a4d2440');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '6418bbce-358d-4d94-9e94-6f976b49d23a', 'artist', '23e6e2d6-b371-4393-9ce2-14c91d6d1d2e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '6a5163b4-96e3-4667-bbbe-ee5fe5b9b555', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), '91cc333f-7557-49d7-a95d-0392d2004a4e', 'artist', '5fb12fee-64fe-4887-b87e-28f28a15c4f9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), 'b9174455-fe6e-4a8a-ab1e-225bd60d5d54', 'artist', '97610f30-fb92-4d77-8b98-ddec14d12afc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), 'bca28c21-0992-4f2a-8cff-7d4de79f07ca', 'artist', '8af29e3a-6ae7-4a2d-9389-8ec927790901');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), 'd277465a-8e0e-450b-a14f-3151f542f833', 'artist', 'a73d457d-6ff6-4dde-89e9-1e41dfdf2d54');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luigui-bleand') AND locale = 'es'), 'dde275da-4dc8-49e4-890f-192abd5b38f6', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

COMMIT;
