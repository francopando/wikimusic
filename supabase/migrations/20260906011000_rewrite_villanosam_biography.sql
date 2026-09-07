BEGIN;

-- Rewrite the catalogue entry for Villanosam.
--
-- Villanosam. Filler in English -- two sentences -- no sort_name, no
-- stage_name, no aliases, no occupations, no genres, no disambiguation. He is
-- named routinely among the pillars of Dominican rap and the row said nothing at
-- all.
--
-- HIS OWN BLOG FROM 2010 IS THE SOURCE, AND IT IS A GOOD ONE. villano-sam.
-- blogspot.com, posted 20 July 2010, opens: "Villanosam El Negron Alias Toño
-- Stone, El Mayimbe!!! Nacido Winston Antonio Aponte Acta, Hijo de Marina Ant.
-- Acta de Aponte y Winston Bruno Aponte Agesta, en santo domingo a los 20 dias
-- de Febrero del año 1979... el año de uno de los peores ciclones que hayan
-- pasado por republica dominicana, el ciclon David". That confirms the legal
-- name and the birth date already in the row, exactly, and gives two aliases.
--
-- A BIRTHPLACE CONFLICT LEFT OPEN. That same sentence says "en santo domingo",
-- and the discarded filler paragraph also said Santo Domingo, while the row says
-- San Pedro de Macorís for both province and birth_place. The blog's lower-case
-- "santo domingo" is ambiguous -- it is also how Dominicans have long referred to
-- the country -- and every other source ties him to San Pedro: he is named as
-- part of the San Pedro rap movement, and his own 2010 announcement says the San
-- Andreas video was shot entirely in that city. province and birth_place are NOT
-- touched and the conflict is recorded here.
--
-- FILLED: sort_name and stage_name, both null. aliases El Negrón, Toño Stone and
-- El Mayimbe, all three from his own blog and the last two used as billing.
-- occupations composer and producer -- several of his own videos are captioned
-- "Producido por Villanosam", and his channel describes him as "artista,
-- compositor y productor musical". genres. disambiguation.
--
-- THE 2010 POSSE CUT IS THE MOST USEFUL DOCUMENT IN THIS ENTRY. His blog lists
-- the cast of "El Regreso del Rap", produced by JMX, Metro and Public Ent:
-- Dkano, Villanosam, Poeta Callejero, Toxic Crow, Lolo El Microfono, Micros Way,
-- Melymel, La Material, Milka La Mas Dura, Mario Frias, Joa "El Super MC",
-- Colombo Rubirosa, LR, PLF, Shadow Blow and Shelow Shaq. Nine of those are
-- published here and are linked. It is a roll-call of who was making Dominican
-- rap in that year, written down at the time by somebody who was on it.
--
-- AND IT DATES THE MILKA COHORT INDEPENDENTLY. Milka la Más Dura, MelyMel and La
-- Materialista all appear on that 2010 list, which corroborates from a
-- contemporaneous document the cohort framing written into Milka's entry earlier
-- today from a 2022 retrospective.
--
-- A CLAIM ATTRIBUTED, NOT ASSERTED. The blog reproduces Alofoke's declaration
-- that three records -- Lápiz Conciente's Yo Soy Papa, El Regreso del Rap, and
-- Villanosam's San Andreas -- had killed dembow. Dembow plainly did not die. It
-- is written as what was said at the time, which is what makes it interesting.
--
-- SOURCES: his own blog, ten posts from July and August 2010. His own YouTube
-- channel -- thirty video titles and the About text. His own Instagram. Facebook
-- and Instagram posts from Dominican rap pages, several of them recent, which
-- list him among the genre's foundational names alongside Lápiz Conciente,
-- Mozart la Para, Toxic Crow and Monkey Black.
--
-- NOT WRITTEN: his parents are named in his own blog and are not repeated here;
-- naming them adds nothing musical. No follower counts.
--
-- NOT LINKED: Dkano, Micros Way, Mario Frías, Joa "El Super MC", Colombo
-- Rubirosa, LR, PLF, Goldyboy, Bazooka Jun, Eric Meca and the production houses
-- Public Ent and JMX have no entries.
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
       name = 'Villanosam',
       sort_name = 'Villanosam',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = '1979-02-20',
       birth_year = 1979,
       date_of_death = NULL,
       birth_place = 'San Pedro de Macorís',
       province = 'San Pedro de Macorís',
       first_name = 'Winston',
       middle_name = 'Antonio',
       last_name = 'Aponte',
       second_last_name = 'Acta',
       stage_name = 'Villanosam',
       aliases = ARRAY['El Negrón', 'Toño Stone', 'El Mayimbe']::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-dembow']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@villanosamoficial',
       facebook = 'VillanosamOficial',
       instagram = 'villanosamoficial',
       disambiguation = 'Rapper and producer from San Pedro de Macorís; San Andreas, Mafu Tama',
       bio_en = 'Villanosam, born Winston Antonio Aponte Acta, is a Dominican rapper and producer working out of San Pedro de Macorís. When Dominicans list the people who built rap in the country, his name comes up with Lápiz Conciente, Mozart la Para, Toxic Crow and Monkey Black, and unlike most of them he has never had a hit that crossed over.

**San Pedro**

San Pedro de Macorís had a rap scene when the capital had the loudest one, and people who followed the movement remember going down there because the boys were lit up — and lit up with rap, not with dembow. That distinction is the whole story of his career.

He shot the video for San Andreas entirely in the city, which for a Dominican rapper in that period was a statement: the cameras went to San Pedro instead of the artist going to Santo Domingo.

**The year rap was going to win**

In 2010 he was on El Regreso del Rap, a posse cut whose credit list is a photograph of the moment: Poeta Callejero, Toxic Crow, Lolo en el Micrófono, MelyMel, La Materialista, Milka la Más Dura, Shadow Blow, Shelow Shaq and half a dozen more, all on one record.

The Dominican urban press declared at the time that between that record, Lápiz Conciente’s Yo Soy Papa and Villanosam’s own San Andreas, the dembow era was over and rap had taken the country back.

It had not. Dembow went on to become the largest Dominican musical export in fifty years. But the declaration is worth having on record, because it captures what the rappers believed about their own moment, and because the three records it names really were the strongest rap the country had made in a decade.

The same period gave him El Sapito with Mozart la Para, which got him onto Italian television, and Mafu Tama, which is the one people still shout back at him.

**Still making them himself**

He produces. Several of his own records are captioned as produced by him, he has posted his own instrumentals, and he describes himself as an artist, songwriter and producer rather than only a rapper.

The recent catalogue is long and unfussy — Cuero Frío Frío, Todo Ya Es Tuyo, Fama, Compota, Veneno, La Tipa, Lo Cuero, Tequila, La Jugosa, Nunca Fue Así, Drama, Paca, Lo Guante — and a remix of Blanca Con Culo brought in La Materialista. There is a salsa choke on there too.

He plays New Jersey and the northeastern Dominican circuit, which is where a Dominican rapper of his generation now works. Nobody has written a profile of him. He has been making the records anyway for a quarter of a century.',
       bio_es = 'Villanosam, de nombre Winston Antonio Aponte Acta, es rapero y productor dominicano, de San Pedro de Macorís. Cuando los dominicanos hacen la lista de la gente que construyó el rap en el país, su nombre sale junto a Lápiz Conciente, Mozart la Para, Toxic Crow y Monkey Black, y a diferencia de casi todos ellos nunca ha tenido un éxito que cruzara.

**San Pedro**

San Pedro de Macorís tenía escena de rap cuando la capital tenía la más ruidosa, y la gente que seguía el movimiento recuerda haber bajado hasta allá porque los muchachos estaban encendidos, y encendidos con rap, no con dembow. Esa distinción es la historia entera de su carrera.

El video de San Andreas lo rodó completo en la ciudad, que para un rapero dominicano de esa época era una declaración: las cámaras bajaron a San Pedro en vez de que el artista subiera a Santo Domingo.

**El año en que el rap iba a ganar**

En 2010 estuvo en El Regreso del Rap, un tema colectivo cuya lista de créditos es una fotografía del momento: Poeta Callejero, Toxic Crow, Lolo en el Micrófono, MelyMel, La Materialista, Milka la Más Dura, Shadow Blow, Shelow Shaq y media docena más, todos en un mismo disco.

La prensa urbana dominicana declaró entonces que entre ese tema, Yo Soy Papa de Lápiz Conciente y el propio San Andreas de Villanosam, la era del dembow se había acabado y el rap le había devuelto el país al rap.

No se había acabado. El dembow terminó siendo la exportación musical dominicana más grande en cincuenta años. Pero la declaración merece quedar registrada, porque retrata lo que los raperos creían de su propio momento, y porque los tres discos que nombra sí eran el rap más fuerte que había hecho el país en una década.

De ese mismo tramo salió El Sapito con Mozart la Para, que lo puso en la televisión italiana, y Mafu Tama, que es la que todavía le gritan de vuelta.

**Todavía haciéndolos él**

Produce. Varios de sus temas van rotulados como producidos por él, ha subido sus propias pistas instrumentales, y se describe como artista, compositor y productor musical antes que solo como rapero.

El catálogo reciente es largo y sin adornos —Cuero Frío Frío, Todo Ya Es Tuyo, Fama, Compota, Veneno, La Tipa, Lo Cuero, Tequila, La Jugosa, Nunca Fue Así, Drama, Paca, Lo Guante— y un remix de Blanca Con Culo metió a La Materialista. También hay una salsa choke ahí dentro.

Toca en Nueva Jersey y en el circuito dominicano del noreste, que es donde trabaja hoy un rapero dominicano de su generación. Nadie le ha escrito un perfil. Él lleva un cuarto de siglo haciendo los discos de todos modos.',
       updated_at = now()
 WHERE slug = 'villanosam';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Villanosam, born Winston Antonio Aponte Acta, is a Dominican rapper and producer working out of San Pedro de Macorís. When Dominicans list the people who built rap in the country, his name comes up with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"9a87f823-bf73-4418-af8f-006f8aa05814"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"7ead66a9-f847-49a4-bd22-00fd197890c8"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d25ea8c2-1e9f-4f77-832a-48886d50c47b","displayText":"Toxic Crow","occurrenceId":"50325c54-40fe-407c-86d7-2afc154564f8"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8af29e3a-6ae7-4a2d-9389-8ec927790901","displayText":"Monkey Black","occurrenceId":"c062cabe-a13b-426c-bb84-12d7438b5b7a"}},{"text":", and unlike most of them he has never had a hit that crossed over.","type":"text"}]},{"type":"paragraph","content":[{"text":"San Pedro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"San Pedro de Macorís had a rap scene when the capital had the loudest one, and people who followed the movement remember going down there because the boys were lit up — and lit up with rap, not with dembow. That distinction is the whole story of his career.","type":"text"}]},{"type":"paragraph","content":[{"text":"He shot the video for San Andreas entirely in the city, which for a Dominican rapper in that period was a statement: the cameras went to San Pedro instead of the artist going to Santo Domingo.","type":"text"}]},{"type":"paragraph","content":[{"text":"The year rap was going to win","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2010 he was on El Regreso del Rap, a posse cut whose credit list is a photograph of the moment: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cea4b00e-cabe-48a8-9e1b-13b72a92d10a","displayText":"Poeta Callejero","occurrenceId":"845c9d15-4826-4a30-9534-59b425beba5b"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d25ea8c2-1e9f-4f77-832a-48886d50c47b","displayText":"Toxic Crow","occurrenceId":"74e7b7bd-a50e-4de3-9728-d4fa5f74e45f"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8a0f2603-fc00-48a1-a50a-deefa0f661fd","displayText":"Lolo en el Micrófono","occurrenceId":"718a0ddd-aa48-47b2-9e98-51f7f9257e5e"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"580293c3-1e1e-418f-8555-8082665c22b0","displayText":"MelyMel","occurrenceId":"a2da3d7f-241d-432d-91b6-30854805f2c6"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"639de91e-2507-491c-a58a-ce4e77af065d","displayText":"La Materialista","occurrenceId":"d568ed3f-7ade-4d67-81b2-c0940b2f3466"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0d586b6c-5699-4c0b-913f-4d702e507301","displayText":"Milka la Más Dura","occurrenceId":"76d7649f-9a32-4773-bf44-9f2784bb5277"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"433181de-1d36-42a2-80a6-6bac6e36006c"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"b7564093-c33e-49a0-ac1c-c67d8edf8af2"}},{"text":" and half a dozen more, all on one record.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Dominican urban press declared at the time that between that record, Lápiz Conciente’s Yo Soy Papa and Villanosam’s own San Andreas, the dembow era was over and rap had taken the country back.","type":"text"}]},{"type":"paragraph","content":[{"text":"It had not. Dembow went on to become the largest Dominican musical export in fifty years. But the declaration is worth having on record, because it captures what the rappers believed about their own moment, and because the three records it names really were the strongest rap the country had made in a decade.","type":"text"}]},{"type":"paragraph","content":[{"text":"The same period gave him El Sapito with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"d2c4356f-33c7-4d63-9ccc-ce5e94ba106d"}},{"text":", which got him onto Italian television, and Mafu Tama, which is the one people still shout back at him.","type":"text"}]},{"type":"paragraph","content":[{"text":"Still making them himself","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He produces. Several of his own records are captioned as produced by him, he has posted his own instrumentals, and he describes himself as an artist, songwriter and producer rather than only a rapper.","type":"text"}]},{"type":"paragraph","content":[{"text":"The recent catalogue is long and unfussy — Cuero Frío Frío, Todo Ya Es Tuyo, Fama, Compota, Veneno, La Tipa, Lo Cuero, Tequila, La Jugosa, Nunca Fue Así, Drama, Paca, Lo Guante — and a remix of Blanca Con Culo brought in ","type":"text"},{"type":"artistReference","attrs":{"artistId":"639de91e-2507-491c-a58a-ce4e77af065d","displayText":"La Materialista","occurrenceId":"1e8278c9-95cc-4f86-ad7b-c343ba3982ed"}},{"text":". There is a salsa choke on there too.","type":"text"}]},{"type":"paragraph","content":[{"text":"He plays New Jersey and the northeastern Dominican circuit, which is where a Dominican rapper of his generation now works. Nobody has written a profile of him. He has been making the records anyway for a quarter of a century.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'villanosam'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Villanosam, de nombre Winston Antonio Aponte Acta, es rapero y productor dominicano, de San Pedro de Macorís. Cuando los dominicanos hacen la lista de la gente que construyó el rap en el país, su nombre sale junto a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"6ffd28da-9568-4c31-9f3a-8c2e65e7ba5c"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"b5aa05dc-1c5d-4727-9863-45a040e3d1ea"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d25ea8c2-1e9f-4f77-832a-48886d50c47b","displayText":"Toxic Crow","occurrenceId":"17e98f18-8e79-44f7-a1df-f9efa7f07b5e"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8af29e3a-6ae7-4a2d-9389-8ec927790901","displayText":"Monkey Black","occurrenceId":"546b5b54-9deb-4eff-be7c-4ae37d69bb72"}},{"text":", y a diferencia de casi todos ellos nunca ha tenido un éxito que cruzara.","type":"text"}]},{"type":"paragraph","content":[{"text":"San Pedro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"San Pedro de Macorís tenía escena de rap cuando la capital tenía la más ruidosa, y la gente que seguía el movimiento recuerda haber bajado hasta allá porque los muchachos estaban encendidos, y encendidos con rap, no con dembow. Esa distinción es la historia entera de su carrera.","type":"text"}]},{"type":"paragraph","content":[{"text":"El video de San Andreas lo rodó completo en la ciudad, que para un rapero dominicano de esa época era una declaración: las cámaras bajaron a San Pedro en vez de que el artista subiera a Santo Domingo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El año en que el rap iba a ganar","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2010 estuvo en El Regreso del Rap, un tema colectivo cuya lista de créditos es una fotografía del momento: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cea4b00e-cabe-48a8-9e1b-13b72a92d10a","displayText":"Poeta Callejero","occurrenceId":"42294646-7724-403e-b8b2-11d71a327e33"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d25ea8c2-1e9f-4f77-832a-48886d50c47b","displayText":"Toxic Crow","occurrenceId":"ae2cf51a-480a-4315-86b9-a53a3644db2e"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8a0f2603-fc00-48a1-a50a-deefa0f661fd","displayText":"Lolo en el Micrófono","occurrenceId":"5e76f0ec-ea2a-4a76-a1bc-3bcb2d990df8"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"580293c3-1e1e-418f-8555-8082665c22b0","displayText":"MelyMel","occurrenceId":"4193c412-4b15-4a7a-ac98-811741c1cfa6"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"639de91e-2507-491c-a58a-ce4e77af065d","displayText":"La Materialista","occurrenceId":"7b0b56b1-de37-49c7-8cf6-992f377e5cb4"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0d586b6c-5699-4c0b-913f-4d702e507301","displayText":"Milka la Más Dura","occurrenceId":"46a19db7-a2a0-47a3-a009-0ac1f6b10067"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"f4280cc3-7227-447b-a026-e1ef348184c1"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"63da6a48-d700-4778-964d-ba83a098d1e1"}},{"text":" y media docena más, todos en un mismo disco.","type":"text"}]},{"type":"paragraph","content":[{"text":"La prensa urbana dominicana declaró entonces que entre ese tema, Yo Soy Papa de Lápiz Conciente y el propio San Andreas de Villanosam, la era del dembow se había acabado y el rap le había devuelto el país al rap.","type":"text"}]},{"type":"paragraph","content":[{"text":"No se había acabado. El dembow terminó siendo la exportación musical dominicana más grande en cincuenta años. Pero la declaración merece quedar registrada, porque retrata lo que los raperos creían de su propio momento, y porque los tres discos que nombra sí eran el rap más fuerte que había hecho el país en una década.","type":"text"}]},{"type":"paragraph","content":[{"text":"De ese mismo tramo salió El Sapito con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"e22fad48-b04e-4224-9b86-957aa991749d"}},{"text":", que lo puso en la televisión italiana, y Mafu Tama, que es la que todavía le gritan de vuelta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Todavía haciéndolos él","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Produce. Varios de sus temas van rotulados como producidos por él, ha subido sus propias pistas instrumentales, y se describe como artista, compositor y productor musical antes que solo como rapero.","type":"text"}]},{"type":"paragraph","content":[{"text":"El catálogo reciente es largo y sin adornos —Cuero Frío Frío, Todo Ya Es Tuyo, Fama, Compota, Veneno, La Tipa, Lo Cuero, Tequila, La Jugosa, Nunca Fue Así, Drama, Paca, Lo Guante— y un remix de Blanca Con Culo metió a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"639de91e-2507-491c-a58a-ce4e77af065d","displayText":"La Materialista","occurrenceId":"f259108d-0828-45ac-81c8-9d9f64eb728a"}},{"text":". También hay una salsa choke ahí dentro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Toca en Nueva Jersey y en el circuito dominicano del noreste, que es donde trabaja hoy un rapero dominicano de su generación. Nadie le ha escrito un perfil. Él lleva un cuarto de siglo haciendo los discos de todos modos.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'villanosam'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), '1e8278c9-95cc-4f86-ad7b-c343ba3982ed', 'artist', '639de91e-2507-491c-a58a-ce4e77af065d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), '433181de-1d36-42a2-80a6-6bac6e36006c', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), '50325c54-40fe-407c-86d7-2afc154564f8', 'artist', 'd25ea8c2-1e9f-4f77-832a-48886d50c47b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), '718a0ddd-aa48-47b2-9e98-51f7f9257e5e', 'artist', '8a0f2603-fc00-48a1-a50a-deefa0f661fd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), '74e7b7bd-a50e-4de3-9728-d4fa5f74e45f', 'artist', 'd25ea8c2-1e9f-4f77-832a-48886d50c47b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), '76d7649f-9a32-4773-bf44-9f2784bb5277', 'artist', '0d586b6c-5699-4c0b-913f-4d702e507301');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), '7ead66a9-f847-49a4-bd22-00fd197890c8', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), '845c9d15-4826-4a30-9534-59b425beba5b', 'artist', 'cea4b00e-cabe-48a8-9e1b-13b72a92d10a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), '9a87f823-bf73-4418-af8f-006f8aa05814', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), 'a2da3d7f-241d-432d-91b6-30854805f2c6', 'artist', '580293c3-1e1e-418f-8555-8082665c22b0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), 'b7564093-c33e-49a0-ac1c-c67d8edf8af2', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), 'c062cabe-a13b-426c-bb84-12d7438b5b7a', 'artist', '8af29e3a-6ae7-4a2d-9389-8ec927790901');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), 'd2c4356f-33c7-4d63-9ccc-ce5e94ba106d', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'en'), 'd568ed3f-7ade-4d67-81b2-c0940b2f3466', 'artist', '639de91e-2507-491c-a58a-ce4e77af065d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), '17e98f18-8e79-44f7-a1df-f9efa7f07b5e', 'artist', 'd25ea8c2-1e9f-4f77-832a-48886d50c47b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), '4193c412-4b15-4a7a-ac98-811741c1cfa6', 'artist', '580293c3-1e1e-418f-8555-8082665c22b0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), '42294646-7724-403e-b8b2-11d71a327e33', 'artist', 'cea4b00e-cabe-48a8-9e1b-13b72a92d10a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), '46a19db7-a2a0-47a3-a009-0ac1f6b10067', 'artist', '0d586b6c-5699-4c0b-913f-4d702e507301');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), '546b5b54-9deb-4eff-be7c-4ae37d69bb72', 'artist', '8af29e3a-6ae7-4a2d-9389-8ec927790901');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), '5e76f0ec-ea2a-4a76-a1bc-3bcb2d990df8', 'artist', '8a0f2603-fc00-48a1-a50a-deefa0f661fd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), '63da6a48-d700-4778-964d-ba83a098d1e1', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), '6ffd28da-9568-4c31-9f3a-8c2e65e7ba5c', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), '7b0b56b1-de37-49c7-8cf6-992f377e5cb4', 'artist', '639de91e-2507-491c-a58a-ce4e77af065d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), 'ae2cf51a-480a-4315-86b9-a53a3644db2e', 'artist', 'd25ea8c2-1e9f-4f77-832a-48886d50c47b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), 'b5aa05dc-1c5d-4727-9863-45a040e3d1ea', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), 'e22fad48-b04e-4224-9b86-957aa991749d', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), 'f259108d-0828-45ac-81c8-9d9f64eb728a', 'artist', '639de91e-2507-491c-a58a-ce4e77af065d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'villanosam') AND locale = 'es'), 'f4280cc3-7227-447b-a026-e1ef348184c1', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

COMMIT;
