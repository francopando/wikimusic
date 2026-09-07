BEGIN;

-- Rewrite the catalogue entry for Dioni Fernández y El Equipo.
--
-- Dioni Fernández y El Equipo. Rewrite. The old entry was machine-written, with
-- its section titles glued to the body text by line breaks, and it linked to
-- ITSELF twice in each language -- an artistReference from Dioni Fernández's own
-- page to Dioni Fernández's own page, which renders as a link that goes nowhere.
-- Those are gone.
--
-- THE MACHINE TEXT GOT THE FORMATIVE YEARS WRONG. It said he studied guitar with
-- "Roberto Olea" and played rock with a band called "Iron Fire". Juan Colón --
-- the saxophonist who wrote the standard method on the merengue jaleo, and whose
-- essay on Crispín Fernández was the backbone of that entry -- published a piece
-- on Dioni in March 2013 that says otherwise, and in more detail:
--
--   - at sixteen he played guitar in a rock group called HIERRO DE FUEGO. "Iron
--     Fire" is that name translated into English, which is what a machine does
--     and a researcher does not.
--   - he then studied at the academia IRIS DEL VALLE with the teacher ALICIA
--     PÉREZ, not with Roberto Olea.
--   - he studied piano formally at the Conservatorio Nacional de Música FOR FIVE
--     YEARS.
--
-- THE ENTRY INTO MERENGUE IS A GOOD STORY AND IT WAS MISSING. Colón: he went
-- from the conservatory to playing with Félix del Rosario because of an
-- emergency -- the orchestra's regular pianist had to be covered. Félix was
-- impressed and he stayed about three years. After Bonny Cepeda resigned, Dioni
-- took over as director of Los Hijos del Rey for a couple of years. Then, in
-- 1980, he formed Sandy, Dioni y El Equipo with Sandy Reyes.
--
-- EL EQUIPO AS A SCHOOL IS THE ENTRY. Colón's line is that working with Dioni
-- was the official passport for every singer of the moment, and that the band
-- was a university for singing. The roster he lists is checkable against this
-- catalogue and nine of them are published here: Benny Sadel, Sergio Vargas,
-- Pablo Martínez, Charlie Rodríguez, Kaki Vargas, Carlos David, plus Sandy
-- Reyes, Bonny Cepeda and Félix del Rosario on the other side of the story. All
-- nine are linked. A tenth singer he names, Luis Manuel, has no entry.
--
-- FILLED: occupations composer and producer beside the bandleader, musician and
-- arranger already stored; genres; instruments guitar beside the piano already
-- there -- the guitar is where he started and it is the reason the arrangements
-- sound the way they do; disambiguation.
--
-- LEFT ALONE: type group, gender male, province Distrito Nacional, birth_place
-- Santo Domingo, date_of_birth 1952-03-24, the name fields and the legend tag.
-- The row treats the man and the band as one record, which is how the catalogue
-- already handles Ramón Orlando & Orquesta Internacional.
--
-- SOURCES: Juan Colón's piece of 20 March 2013, which is the fullest account and
-- the one that corrects the machine text. Publicidad Dominicana, 11 November
-- 2024, which independently describes El Equipo as a university of merengue.
-- Listín Diario, 30 October 2019, "Dioni Fernández: la historia de un maestro
-- del merengue", for thirteen recorded productions -- the URL is now dead and is
-- cited from its index entry. República Merengue for the singers' roster and for
-- the 1985 album Fiesta & Fiesta with Pablo Martínez singing Loco Loco. Color
-- Visión and Joan Abreu's interviews of June 2026, which show he is active.
--
-- NOT WRITTEN: nothing private. The old text quoted him on how his grandmother
-- chose his name from a pharmacy almanac; it is charming and it is family, and
-- it is not here.
--
-- NOT LINKED: LOS HIJOS DEL REY has no entry, which is a real gap -- it is one
-- of the merengue orchestras of that era and he directed it. Luis Manuel, the
-- academia Iris del Valle, Alicia Pérez and the rock band Hierro de Fuego have
-- no entries either.
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
       name = 'Dioni Fernández y El Equipo',
       sort_name = 'Fernández, Dioni y El Equipo',
       type = 'group',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = '1952-03-24',
       birth_year = 1952,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'José',
       middle_name = 'Dionisio',
       last_name = 'Fernández',
       second_last_name = 'Zapata',
       stage_name = 'Dioni Fernández y El Equipo',
       aliases = ARRAY['Dioni Fernandez', 'El Equipo']::text[],
       occupations = '["bandleader","musician","arranger","composer","producer"]'::jsonb,
       instruments = ARRAY['piano', 'guitar']::text[],
       genres = ARRAY['merengue-orquesta']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = '@dfestudio',
       facebook = 'dionifernandezoficial',
       instagram = 'dionifernandez_oficial',
       disambiguation = 'Merengue bandleader, pianist and arranger; El Equipo was the band the romantic-merengue singers came through',
       bio_en = 'Dioni Fernández, born José Dionisio Fernández Zapata, is a Dominican bandleader, pianist, arranger and producer, and El Equipo is the orchestra he ran. Between them they trained most of the singers who defined merengue’s romantic decade.

**A rock guitarist**

He started at sixteen playing guitar in a rock band called Hierro de Fuego. That is a genuinely unusual door into merengue, and it is the first thing to know about how his records sound.

Then he did it the hard way round: an academy, a teacher, and five years of formal piano at the Conservatorio Nacional de Música. A Dominican dance-band leader with a conservatory training is rare, and a conservatory-trained leader who came up through rock is close to unique.

**The emergency**

His entry into professional merengue was an accident. Félix del Rosario needed somebody to cover for the orchestra’s pianist, and Dioni was the substitute. He was kept on and stayed about three years — the most efficient audition in the history of the genre.

When Bonny Cepeda resigned from Los Hijos del Rey, Dioni took over the direction and ran it for a couple of years. He had gone from emergency stand-in to running one of the country’s orchestras in a very short time.

**El Equipo**

In 1980 he formed a band with Sandy Reyes — Sandy, Dioni y El Equipo — and this is where he became an arranger and producer rather than a hired player. El Guardia del Arsenal, La Mina de Amor and Pun Pun Pun come from that period.

What it turned into was Dioni Fernández y El Equipo, and what that band did for Dominican music is not really about its own records. Almost every singer of the romantic merengue era went through it: Benny Sadel, Sergio Vargas, Pablo Martínez, Charlie Rodríguez, Kaki Vargas, Carlos David and Luis Manuel among them.

Musicians of that generation put it plainly: working with Dioni was the passport. If you had done a season with El Equipo you could go anywhere, and if you had not, you had something to prove.

**What an arranger decides**

His arrangements are the reason. He writes the trumpets and the saxophones so that they answer each other rather than pile up, and the discipline is audible — every instrument where it belongs and nothing fighting for the same space.

That is a conservatory habit applied to a dance band, and it produced a house style that other producers copied. Thirteen recorded productions carry it, and so do the records he arranged for singers who had already left him.

Running a band is the other half of the job and the half nobody writes about: hiring, rehearsing, paying, keeping authority over a room of twelve people who all want a solo. He did that for decades without the band splitting, which in Dominican merengue is the rarer achievement.',
       bio_es = 'Dioni Fernández, de nombre José Dionisio Fernández Zapata, es director, pianista, arreglista y productor dominicano, y El Equipo es la orquesta que dirigió. Entre los dos formaron a casi todos los cantantes que definieron la década romántica del merengue.

**Un guitarrista de rock**

Empezó a los dieciséis tocando guitarra en una banda de rock llamada Hierro de Fuego. Es una puerta de entrada al merengue genuinamente rara, y es lo primero que hay que saber para entender cómo suenan sus discos.

Después lo hizo al revés de como se acostumbra: una academia, una maestra, y cinco años de piano formal en el Conservatorio Nacional de Música. Un director de orquesta bailable dominicano con formación de conservatorio es raro, y uno que además venga del rock es casi único.

**La emergencia**

Su entrada al merengue profesional fue un accidente. A Félix del Rosario le hacía falta alguien que cubriera al pianista de la orquesta, y Dioni fue el sustituto. Se quedó, y estuvo unos tres años: la audición más eficiente de la historia del género.

Cuando Bonny Cepeda renunció a Los Hijos del Rey, Dioni asumió la dirección y la llevó un par de años. Había pasado de suplente de emergencia a dirigir una de las orquestas del país en muy poco tiempo.

**El Equipo**

En 1980 formó una banda con Sandy Reyes —Sandy, Dioni y El Equipo— y ahí es donde se hizo arreglista y productor en vez de músico contratado. El Guardia del Arsenal, La Mina de Amor y Pun Pun Pun salen de esa etapa.

En lo que se convirtió fue en Dioni Fernández y El Equipo, y lo que esa banda hizo por la música dominicana no tiene tanto que ver con sus propios discos. Por ahí pasó casi todo cantante de la época romántica del merengue: Benny Sadel, Sergio Vargas, Pablo Martínez, Charlie Rodríguez, Kaki Vargas, Carlos David y Luis Manuel, entre otros.

Los músicos de esa generación lo dicen sin adornos: trabajar con Dioni era el pasaporte. Si uno había hecho una temporada con El Equipo podía ir a cualquier parte, y si no la había hecho, tenía algo que demostrar.

**Lo que decide un arreglista**

Los arreglos son la razón. Escribe las trompetas y los saxofones para que se contesten y no para que se amontonen, y la disciplina se oye: cada instrumento en su sitio y ninguno peleando por el mismo espacio.

Eso es una costumbre de conservatorio aplicada a una banda de baile, y produjo un estilo de casa que otros productores copiaron. Trece producciones grabadas lo llevan, y también los discos que arregló para cantantes que ya se habían ido de su banda.

Dirigir una orquesta es la otra mitad del oficio y la mitad de la que nadie escribe: contratar, ensayar, pagar, y mantener la autoridad sobre un salón de doce personas que todas quieren un solo. Lo hizo durante décadas sin que la banda se partiera, que en el merengue dominicano es el logro más raro de los dos.',
       updated_at = now()
 WHERE slug = 'dioni-fernandez-y-el-equipo';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dioni Fernández, born José Dionisio Fernández Zapata, is a Dominican bandleader, pianist, arranger and producer, and El Equipo is the orchestra he ran. Between them they trained most of the singers who defined merengue’s romantic decade.","type":"text"}]},{"type":"paragraph","content":[{"text":"A rock guitarist","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He started at sixteen playing guitar in a rock band called Hierro de Fuego. That is a genuinely unusual door into merengue, and it is the first thing to know about how his records sound.","type":"text"}]},{"type":"paragraph","content":[{"text":"Then he did it the hard way round: an academy, a teacher, and five years of formal piano at the Conservatorio Nacional de Música. A Dominican dance-band leader with a conservatory training is rare, and a conservatory-trained leader who came up through rock is close to unique.","type":"text"}]},{"type":"paragraph","content":[{"text":"The emergency","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His entry into professional merengue was an accident. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8fc78100-e51e-48a8-91e9-3007f4c67ec0","displayText":"Félix del Rosario","occurrenceId":"b3daa44d-76f1-40ed-bfd8-8efcc90d9d70"}},{"text":" needed somebody to cover for the orchestra’s pianist, and Dioni was the substitute. He was kept on and stayed about three years — the most efficient audition in the history of the genre.","type":"text"}]},{"type":"paragraph","content":[{"text":"When ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc4db4c6-c96f-4eb7-af95-ac637785c5bf","displayText":"Bonny Cepeda","occurrenceId":"7ee8ee37-9edf-4581-8b31-30b3ffeddb44"}},{"text":" resigned from Los Hijos del Rey, Dioni took over the direction and ran it for a couple of years. He had gone from emergency stand-in to running one of the country’s orchestras in a very short time.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Equipo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 1980 he formed a band with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"49f8aae7-e066-4b01-a836-126082163c52","displayText":"Sandy Reyes","occurrenceId":"375bf5a2-5770-47f8-b9d9-c365517460eb"}},{"text":" — Sandy, Dioni y El Equipo — and this is where he became an arranger and producer rather than a hired player. El Guardia del Arsenal, La Mina de Amor and Pun Pun Pun come from that period.","type":"text"}]},{"type":"paragraph","content":[{"text":"What it turned into was Dioni Fernández y El Equipo, and what that band did for Dominican music is not really about its own records. Almost every singer of the romantic merengue era went through it: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"15775d55-9e10-46bc-8516-ee7468724ec0","displayText":"Benny Sadel","occurrenceId":"63b025c7-b05e-4d8d-97c5-e79fcdf93981"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"eb6533ec-677b-4e5b-9a54-e73a51da8972"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"868b96d3-8a3d-4b7d-a6e4-0b2faa3c4c4a","displayText":"Pablo Martínez","occurrenceId":"18b2415e-f385-40e6-9cd8-e5b7acbdd97e"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5bb869a0-495d-4831-b44f-a6a9f074d3f7","displayText":"Charlie Rodríguez","occurrenceId":"7e84a053-87e2-42ad-8a1c-348e300b3296"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0a36ec1b-2de1-4890-95f2-57d6b19a1d69","displayText":"Kaki Vargas","occurrenceId":"45871f00-fd95-4a85-b4d2-e33f79ab250b"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9d885c35-ffe1-46ee-848a-76cbe55c6704","displayText":"Carlos David","occurrenceId":"b31deb1d-8195-4052-a086-b75b966b3c54"}},{"text":" and Luis Manuel among them.","type":"text"}]},{"type":"paragraph","content":[{"text":"Musicians of that generation put it plainly: working with Dioni was the passport. If you had done a season with El Equipo you could go anywhere, and if you had not, you had something to prove.","type":"text"}]},{"type":"paragraph","content":[{"text":"What an arranger decides","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His arrangements are the reason. He writes the trumpets and the saxophones so that they answer each other rather than pile up, and the discipline is audible — every instrument where it belongs and nothing fighting for the same space.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a conservatory habit applied to a dance band, and it produced a house style that other producers copied. Thirteen recorded productions carry it, and so do the records he arranged for singers who had already left him.","type":"text"}]},{"type":"paragraph","content":[{"text":"Running a band is the other half of the job and the half nobody writes about: hiring, rehearsing, paying, keeping authority over a room of twelve people who all want a solo. He did that for decades without the band splitting, which in Dominican merengue is the rarer achievement.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo'), 4)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dioni Fernández, de nombre José Dionisio Fernández Zapata, es director, pianista, arreglista y productor dominicano, y El Equipo es la orquesta que dirigió. Entre los dos formaron a casi todos los cantantes que definieron la década romántica del merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un guitarrista de rock","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó a los dieciséis tocando guitarra en una banda de rock llamada Hierro de Fuego. Es una puerta de entrada al merengue genuinamente rara, y es lo primero que hay que saber para entender cómo suenan sus discos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después lo hizo al revés de como se acostumbra: una academia, una maestra, y cinco años de piano formal en el Conservatorio Nacional de Música. Un director de orquesta bailable dominicano con formación de conservatorio es raro, y uno que además venga del rock es casi único.","type":"text"}]},{"type":"paragraph","content":[{"text":"La emergencia","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su entrada al merengue profesional fue un accidente. A ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8fc78100-e51e-48a8-91e9-3007f4c67ec0","displayText":"Félix del Rosario","occurrenceId":"b5a12079-8429-45af-92b0-5d1c634b4769"}},{"text":" le hacía falta alguien que cubriera al pianista de la orquesta, y Dioni fue el sustituto. Se quedó, y estuvo unos tres años: la audición más eficiente de la historia del género.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cuando ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc4db4c6-c96f-4eb7-af95-ac637785c5bf","displayText":"Bonny Cepeda","occurrenceId":"3afa41e6-c9d7-4888-bdb3-e3b394664b58"}},{"text":" renunció a Los Hijos del Rey, Dioni asumió la dirección y la llevó un par de años. Había pasado de suplente de emergencia a dirigir una de las orquestas del país en muy poco tiempo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Equipo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1980 formó una banda con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"49f8aae7-e066-4b01-a836-126082163c52","displayText":"Sandy Reyes","occurrenceId":"222e52d1-a77c-4c16-b61f-1cb0187288b2"}},{"text":" —Sandy, Dioni y El Equipo— y ahí es donde se hizo arreglista y productor en vez de músico contratado. El Guardia del Arsenal, La Mina de Amor y Pun Pun Pun salen de esa etapa.","type":"text"}]},{"type":"paragraph","content":[{"text":"En lo que se convirtió fue en Dioni Fernández y El Equipo, y lo que esa banda hizo por la música dominicana no tiene tanto que ver con sus propios discos. Por ahí pasó casi todo cantante de la época romántica del merengue: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"15775d55-9e10-46bc-8516-ee7468724ec0","displayText":"Benny Sadel","occurrenceId":"eb9839d6-0acd-4721-af30-ee403874d660"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"6c1353a1-45d2-40c6-a3e3-f4d8c70682b8"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"868b96d3-8a3d-4b7d-a6e4-0b2faa3c4c4a","displayText":"Pablo Martínez","occurrenceId":"daa2cbf6-87c7-41bc-99eb-522f1bc4fb3e"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5bb869a0-495d-4831-b44f-a6a9f074d3f7","displayText":"Charlie Rodríguez","occurrenceId":"2501bc95-41ee-49bd-ba08-841c869c53ab"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0a36ec1b-2de1-4890-95f2-57d6b19a1d69","displayText":"Kaki Vargas","occurrenceId":"c6c07d6e-83cc-449a-b185-eb56e23e7464"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9d885c35-ffe1-46ee-848a-76cbe55c6704","displayText":"Carlos David","occurrenceId":"34bf5e0c-12fc-4b76-b176-9505e67864a9"}},{"text":" y Luis Manuel, entre otros.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los músicos de esa generación lo dicen sin adornos: trabajar con Dioni era el pasaporte. Si uno había hecho una temporada con El Equipo podía ir a cualquier parte, y si no la había hecho, tenía algo que demostrar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que decide un arreglista","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los arreglos son la razón. Escribe las trompetas y los saxofones para que se contesten y no para que se amontonen, y la disciplina se oye: cada instrumento en su sitio y ninguno peleando por el mismo espacio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eso es una costumbre de conservatorio aplicada a una banda de baile, y produjo un estilo de casa que otros productores copiaron. Trece producciones grabadas lo llevan, y también los discos que arregló para cantantes que ya se habían ido de su banda.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dirigir una orquesta es la otra mitad del oficio y la mitad de la que nadie escribe: contratar, ensayar, pagar, y mantener la autoridad sobre un salón de doce personas que todas quieren un solo. Lo hizo durante décadas sin que la banda se partiera, que en el merengue dominicano es el logro más raro de los dos.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo'), 4)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '18b2415e-f385-40e6-9cd8-e5b7acbdd97e', 'artist', '868b96d3-8a3d-4b7d-a6e4-0b2faa3c4c4a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '375bf5a2-5770-47f8-b9d9-c365517460eb', 'artist', '49f8aae7-e066-4b01-a836-126082163c52');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '45871f00-fd95-4a85-b4d2-e33f79ab250b', 'artist', '0a36ec1b-2de1-4890-95f2-57d6b19a1d69');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '63b025c7-b05e-4d8d-97c5-e79fcdf93981', 'artist', '15775d55-9e10-46bc-8516-ee7468724ec0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '7e84a053-87e2-42ad-8a1c-348e300b3296', 'artist', '5bb869a0-495d-4831-b44f-a6a9f074d3f7');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '7ee8ee37-9edf-4581-8b31-30b3ffeddb44', 'artist', 'bc4db4c6-c96f-4eb7-af95-ac637785c5bf');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), 'b31deb1d-8195-4052-a086-b75b966b3c54', 'artist', '9d885c35-ffe1-46ee-848a-76cbe55c6704');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), 'b3daa44d-76f1-40ed-bfd8-8efcc90d9d70', 'artist', '8fc78100-e51e-48a8-91e9-3007f4c67ec0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), 'eb6533ec-677b-4e5b-9a54-e73a51da8972', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), '222e52d1-a77c-4c16-b61f-1cb0187288b2', 'artist', '49f8aae7-e066-4b01-a836-126082163c52');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), '2501bc95-41ee-49bd-ba08-841c869c53ab', 'artist', '5bb869a0-495d-4831-b44f-a6a9f074d3f7');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), '34bf5e0c-12fc-4b76-b176-9505e67864a9', 'artist', '9d885c35-ffe1-46ee-848a-76cbe55c6704');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), '3afa41e6-c9d7-4888-bdb3-e3b394664b58', 'artist', 'bc4db4c6-c96f-4eb7-af95-ac637785c5bf');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), '6c1353a1-45d2-40c6-a3e3-f4d8c70682b8', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), 'b5a12079-8429-45af-92b0-5d1c634b4769', 'artist', '8fc78100-e51e-48a8-91e9-3007f4c67ec0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), 'c6c07d6e-83cc-449a-b185-eb56e23e7464', 'artist', '0a36ec1b-2de1-4890-95f2-57d6b19a1d69');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), 'daa2cbf6-87c7-41bc-99eb-522f1bc4fb3e', 'artist', '868b96d3-8a3d-4b7d-a6e4-0b2faa3c4c4a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), 'eb9839d6-0acd-4721-af30-ee403874d660', 'artist', '15775d55-9e10-46bc-8516-ee7468724ec0');

COMMIT;
