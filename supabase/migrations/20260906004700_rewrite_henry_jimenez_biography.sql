BEGIN;

-- Rewrite the catalogue entry for Henry Jiménez.
--
-- Henry Jiménez. Filler in English, nothing in Spanish, no genres, no
-- instruments -- on a Grammy-winning producer and arranger whose credits run
-- through thirty years of merengue and who is behind two groups already in the
-- catalogue.
--
-- ADDED: instruments piano; occupations musical_director beside the musician,
-- arranger and composer already stored; genres; aliases; disambiguation; the
-- diaspora tag.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default, and no date of birth. Worth a second look
-- by the editor: the one account of his schooling has him at Madison Park High
-- School in Boston before the Berklee scholarship, and his studio and his
-- working life are in New York. He may not have grown up in Santo Domingo at
-- all. Nothing found states where he was born, so the stored value is not
-- replaced by a guess.
--
-- SOURCES: DiarioDigitalRD, 20 August 2020, "¿Quién es Henry Jiménez y qué ha
-- hecho en la música?", by Yamilé Tejada Tapia, which is a year-by-year
-- chronology and is the backbone of this entry: Madison Park High School and
-- the Berklee scholarship; Cocoband in 1990 and the arrangements on Llegaron
-- Los Cocotuces; La Morenita for Los Toros Band and Pum Pum for Lisa M in 1991;
-- Traigo la Bomba for Vico C and Toño Rosario in 1992-93 and the first Sony
-- alliance; Los Homeboys in 1994; En Tus Manos for Milly Quezada in 1995 and
-- Hasta Siempre in 1997 with the Jaragua concert; the productions for Jessica
-- Cristina, Jaileen Cintrón, Gisselle, Merenbooty Girls and Melina León; Manny
-- Manuel's Lleno de Vida in 1999 and its Latin Grammy nomination; Mambo Studio
-- in Manhattan and the Grammy for Olga Tañón's Olga Viva, Viva Olga in 2000;
-- the musical direction of Johnny Ventura's SOY at the Teatro Nacional; the
-- arrangement of Resistiré for Toño Rosario and its Billboard placing; the two
-- Latin Grammys of 2006 for MQ; the Megatón at Madison Square Garden in 2009;
-- Volvió la Navidad for Johnny Ventura in 2010; Un Hombre Nuevo for Fernando
-- Villalona, Merengue del Año at the Casandras in 2011; the Miriam Cruz years
-- and Es Cosa de Él, Es Necesario and La Carnada; the Casandra arranger
-- nominations of 2012-13; Divas by Jiménez in 2014; the Radio City night in
-- 2016; and the fourteen-year gestation of Esto Es Merengue. Aplatanao News,
-- 27 January 2022, and El Cañero, 26 January 2022, on the flashmob launch.
-- Spotify, YouTube Music and AllMusic for the releases: It's About Time (Ya Era
-- Hora), 1997; Can You Handle This?, 1998; Dominicano Alza la Mano and
-- Llorarás, 2022; Esto Es Merengue Vol. 1, 2023. His own X account for the
-- self-description "Arreglista - Pianista - Compositor".
--
-- AWARDS NOT LOADED HERE. The chronology names a Grammy, two Latin Grammys,
-- three Latin Grammy nominations, a Casandra Merengue del Año, a Soberano
-- Merengue del Año and two Casandra arranger nominations. Most of those were
-- given for records credited to other artists, and several are producer or
-- engineer credits rather than artist awards, so which of them belong on his
-- row and which on the performer's is an editorial question rather than a
-- clerical one. They stay in the prose until that is settled.
--
-- NOT LINKED: Los Homeboys and Divas by Jiménez, both his own groups, are in
-- the catalogue but not published -- needs_review -- so a reference to either
-- would render as dead text. They are named in the prose and should be linked
-- once they are published. Olga Tañón, Vico C, Lisa M, Manny Manuel, Elvis
-- Crespo, Grupo Manía, Gisselle and Melina León are not Dominican. Jessica
-- Cristina, Jaileen Cintrón, César Flores and Merenbooty Girls have no entries.
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
       name = 'Henry Jiménez',
       sort_name = 'Jiménez, Henry',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'producer',
       primary_genre = 'merengue',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Henry',
       middle_name = NULL,
       last_name = 'Jiménez',
       second_last_name = NULL,
       stage_name = 'Henry Jiménez',
       aliases = ARRAY['Mr. Henry Homeboy']::text[],
       occupations = '["musician","arranger","composer","musical_director"]'::jsonb,
       instruments = ARRAY['piano']::text[],
       genres = ARRAY['merengue-orquesta']::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = NULL,
       youtube = '@HenryJiménezOficial',
       facebook = 'henryjimenezoficial',
       instagram = 'henryjimenezoficial',
       disambiguation = 'Merengue producer, arranger and pianist; Los Homeboys, Esto Es Merengue',
       bio_en = 'Henry Jiménez is a Dominican pianist, arranger, composer and record producer. He works from New York and his name sits in the small print of a great many merengue records that other people are remembered for.

**Learning the trade**

He studied at Madison Park High School and won a scholarship to the Berklee College of Music in Boston, which is not the usual training for a merengue arranger and shows in the writing.

He joined Pochy y su Cocoband as pianist in 1990 and arranged El Mujerón and El Boche on Llegaron los Cocotuces. The year after that he arranged La Morenita for Los Toros Band — Héctor Acosta’s first hit — and Pum Pum for Lisa M. Traigo la Bomba, for Vico C and Toño Rosario, came next, and with it the first alliance with Sony.

**The Milly years**

In 1995 he produced and arranged En Tus Manos for Milly Quezada. The record carried Entre Tu Cuerpo y el Mío, better known as Solo Contigo, and it put her back at the top.

Hasta Siempre followed in 1997, and he was musical director for the concert of the same name at the Hotel Jaragua. It had been announced as her farewell. The album and the night went so well that she did not retire.

He kept working with her through Vive, the twentieth-anniversary set and the compilations, and in 2006 two Latin Grammys came out of MQ — one as arranger, one as engineer, which is an unusual pair to hold on the same record.

**Mambo Studio**

He opened his own room in Manhattan in 2000 and the same year won a Grammy as producer of Olga Tañón’s Olga Viva, Viva Olga. Manny Manuel’s Lleno de Vida, the year before, had already been nominated for a Latin Grammy.

The label work of that period ran through Sony, BMG and Capitol, on records for Jessica Cristina, Jaileen Cintrón, Gisselle, Merenbooty Girls and Melina León. He also spent a decade producing advertising music in New York for companies whose names have nothing to do with merengue, which is how a working arranger pays for the studio.

**Directing the room**

He was musical director of Johnny Ventura’s SOY at the Teatro Nacional, and later produced Volvió la Navidad for him. He arranged Resistiré for Toño Rosario, which reached the tropical chart. He produced Un Hombre Nuevo for Fernando Villalona, which took Merengue del Año at the Casandras.

Then came the run with Miriam Cruz: Es Cosa de Él, which held the Dominican radio charts for half a year, then Es Necesario, written by Johnny Ventura, and La Carnada, written by Ramón Orlando, which won Merengue del Año at the Soberanos.

At Radio City Music Hall in 2016 he directed a night built on nineties merengue, with Milly Quezada, Wilfrido Vargas, Jossie Esteban, Kinito Méndez, Pochy Familia, Sergio Vargas, Oro Sólido, Mala Fe and both of his own groups on the same stage.

**His own bands, and the long project**

He launched Los Homeboys in 1994, and the group became a fixture of the New York merengue circuit. Divas by Jiménez, an all-female merengue group, followed in 2014, and for three years it was the face of a Dominican public campaign against violence towards women. In 2017 he produced a tribute to the women of merengue, ending a night at the Estadio Olímpico with an homage to Belkis Concepción.

Esto Es Merengue is the project he has been assembling for fourteen years: an album, a concert tour and a documentary, with a hundred and twenty-eight artists and seventy-five musicians. The first single, Dominicano Alza la Mano, was launched with a flashmob in January 2022 and gathers Milly Quezada, Johnny Ventura, Miriam Cruz, Fernando Villalona, Wilfrido Vargas and Eddy Herrera on one recording. Vol. 1 of the album arrived in 2023.

The stated purpose is preservation — to keep the genre teachable, and to get younger musicians to take it up. Coming from someone who has spent thirty years making the records rather than talking about them, it reads less like a slogan than like an inventory.',
       bio_es = 'Henry Jiménez es pianista, arreglista, compositor y productor discográfico dominicano. Trabaja desde Nueva York y su nombre está en la letra pequeña de muchísimos discos de merengue por los que se recuerda a otra gente.

**Aprender el oficio**

Estudió en el Madison Park High School y ganó una beca para el Berklee College of Music de Boston, que no es la formación habitual de un arreglista de merengue y se le nota en la escritura.

Entró a Pochy y su Cocoband como pianista en 1990 y arregló El Mujerón y El Boche en Llegaron los Cocotuces. Al año siguiente arregló La Morenita para Los Toros Band — el primer éxito de Héctor Acosta — y Pum Pum para Lisa M. Después vino Traigo la Bomba, para Vico C y Toño Rosario, y con ella la primera alianza con Sony.

**Los años de Milly**

En 1995 produjo y arregló En Tus Manos para Milly Quezada. El disco llevaba Entre Tu Cuerpo y el Mío, mejor conocida como Solo Contigo, y la devolvió a los primeros lugares.

En 1997 vino Hasta Siempre, y él fue director musical del concierto del mismo nombre en el Hotel Jaragua. Se había anunciado como la despedida de ella. El álbum y la noche salieron tan bien que no se retiró.

Siguió trabajando con ella en Vive, en el disco del vigésimo aniversario y en las recopilaciones, y en 2006 salieron dos Latin Grammy de MQ: uno como arreglista y otro como ingeniero, que es una pareja rara de sostener en un mismo disco.

**Mambo Studio**

Abrió su propia sala en Manhattan en el año 2000 y ese mismo año ganó un Grammy como productor de Olga Viva, Viva Olga, de Olga Tañón. El año anterior, Lleno de Vida, de Manny Manuel, ya había quedado nominado al Latin Grammy.

El trabajo de sello de esa época pasó por Sony, BMG y Capitol, en discos para Jessica Cristina, Jaileen Cintrón, Gisselle, Merenbooty Girls y Melina León. También pasó una década produciendo música publicitaria en Nueva York para empresas que no tienen nada que ver con el merengue, que es como un arreglista de oficio le paga al estudio.

**Dirigir la sala**

Fue director musical de SOY, de Johnny Ventura, en el Teatro Nacional, y después le produjo Volvió la Navidad. Arregló Resistiré para Toño Rosario, que entró a la lista tropical. Le produjo Un Hombre Nuevo a Fernando Villalona, que se llevó el Merengue del Año en los Casandra.

Luego vino la racha con Miriam Cruz: Es Cosa de Él, que se mantuvo medio año en la radio dominicana, después Es Necesario, de la autoría de Johnny Ventura, y La Carnada, de la autoría de Ramón Orlando, que ganó Merengue del Año en los Soberano.

En el Radio City Music Hall, en 2016, dirigió una noche armada sobre el merengue de los noventa, con Milly Quezada, Wilfrido Vargas, Jossie Esteban, Kinito Méndez, Pochy Familia, Sergio Vargas, Oro Sólido, Mala Fe y sus dos agrupaciones en el mismo escenario.

**Sus propias bandas, y el proyecto largo**

Fundó Los Homeboys en 1994, y el grupo se volvió fijo del circuito merenguero de Nueva York. Divas by Jiménez, una agrupación de merengue enteramente femenina, llegó en 2014, y durante tres años fue la imagen de una campaña pública dominicana contra la violencia hacia las mujeres. En 2017 produjo un tributo a las damas del merengue, y cerró una noche en el Estadio Olímpico con un homenaje a Belkis Concepción.

Esto Es Merengue es el proyecto que lleva catorce años armando: un álbum, una gira de conciertos y un documental, con ciento veintiocho artistas y setenta y cinco músicos. El primer sencillo, Dominicano Alza la Mano, se lanzó con un flashmob en enero de 2022 y reúne en una sola grabación a Milly Quezada, Johnny Ventura, Miriam Cruz, Fernando Villalona, Wilfrido Vargas y Eddy Herrera. El Vol. 1 del álbum salió en 2023.

El propósito declarado es preservar: mantener el género enseñable y conseguir que los músicos jóvenes lo agarren. Viniendo de alguien que lleva treinta años haciendo los discos en vez de hablar de ellos, se lee menos como consigna que como inventario.',
       updated_at = now()
 WHERE slug = 'henry-jimenez';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Henry Jiménez is a Dominican pianist, arranger, composer and record producer. He works from New York and his name sits in the small print of a great many merengue records that other people are remembered for.","type":"text"}]},{"type":"paragraph","content":[{"text":"Learning the trade","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He studied at Madison Park High School and won a scholarship to the Berklee College of Music in Boston, which is not the usual training for a merengue arranger and shows in the writing.","type":"text"}]},{"type":"paragraph","content":[{"text":"He joined ","type":"text"},{"type":"artistReference","attrs":{"artistId":"001831dd-3baa-4512-88f5-f420ec7c2619","displayText":"Pochy y su Cocoband","occurrenceId":"c7b68e80-3a0b-44de-a52d-217249905768"}},{"text":" as pianist in 1990 and arranged El Mujerón and El Boche on Llegaron los Cocotuces. The year after that he arranged La Morenita for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73032c71-e46c-45b1-b02c-8f4de18426ad","displayText":"Los Toros Band","occurrenceId":"4bcb6122-9ec2-4278-8ad3-5a4756a6dd47"}},{"text":" — Héctor Acosta’s first hit — and Pum Pum for Lisa M. Traigo la Bomba, for Vico C and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6fc762d4-96b8-4ecf-aca8-fdf52936658e","displayText":"Toño Rosario","occurrenceId":"879cd80a-e607-41c7-82df-076b26acf913"}},{"text":", came next, and with it the first alliance with Sony.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Milly years","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 1995 he produced and arranged En Tus Manos for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"070e7449-814e-4ea6-a009-7a091b7e4878","displayText":"Milly Quezada","occurrenceId":"4ccef54f-9721-43ff-965d-2faba30faa84"}},{"text":". The record carried Entre Tu Cuerpo y el Mío, better known as Solo Contigo, and it put her back at the top.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hasta Siempre followed in 1997, and he was musical director for the concert of the same name at the Hotel Jaragua. It had been announced as her farewell. The album and the night went so well that she did not retire.","type":"text"}]},{"type":"paragraph","content":[{"text":"He kept working with her through Vive, the twentieth-anniversary set and the compilations, and in 2006 two Latin Grammys came out of MQ — one as arranger, one as engineer, which is an unusual pair to hold on the same record.","type":"text"}]},{"type":"paragraph","content":[{"text":"Mambo Studio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He opened his own room in Manhattan in 2000 and the same year won a Grammy as producer of Olga Tañón’s Olga Viva, Viva Olga. Manny Manuel’s Lleno de Vida, the year before, had already been nominated for a Latin Grammy.","type":"text"}]},{"type":"paragraph","content":[{"text":"The label work of that period ran through Sony, BMG and Capitol, on records for Jessica Cristina, Jaileen Cintrón, Gisselle, Merenbooty Girls and Melina León. He also spent a decade producing advertising music in New York for companies whose names have nothing to do with merengue, which is how a working arranger pays for the studio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Directing the room","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was musical director of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"47f7debe-b9ce-457b-9b2d-108d14bac77f"}},{"text":"’s SOY at the Teatro Nacional, and later produced Volvió la Navidad for him. He arranged Resistiré for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6fc762d4-96b8-4ecf-aca8-fdf52936658e","displayText":"Toño Rosario","occurrenceId":"eae2bc4e-89fb-4124-9787-9310577e0422"}},{"text":", which reached the tropical chart. He produced Un Hombre Nuevo for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"e9731a29-9821-423f-8293-46a15b10c5f3"}},{"text":", which took Merengue del Año at the Casandras.","type":"text"}]},{"type":"paragraph","content":[{"text":"Then came the run with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc2289d0-ae94-48b5-8eb9-7f0ae18b845a","displayText":"Miriam Cruz","occurrenceId":"82ce1e88-8c8a-40e9-9286-d3251a9effa7"}},{"text":": Es Cosa de Él, which held the Dominican radio charts for half a year, then Es Necesario, written by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"05be5067-5651-47c4-95d3-de8556650782"}},{"text":", and La Carnada, written by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"76ee218d-dd59-4211-a6df-4ef17817c80f"}},{"text":", which won Merengue del Año at the Soberanos.","type":"text"}]},{"type":"paragraph","content":[{"text":"At Radio City Music Hall in 2016 he directed a night built on nineties merengue, with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"070e7449-814e-4ea6-a009-7a091b7e4878","displayText":"Milly Quezada","occurrenceId":"70004e15-7acc-42c5-b0af-b687152114fe"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"27f5463e-7854-4577-b56b-5d9868679513"}},{"text":", Jossie Esteban, Kinito Méndez, Pochy Familia, Sergio Vargas, Oro Sólido, Mala Fe and both of his own groups on the same stage.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own bands, and the long project","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He launched Los Homeboys in 1994, and the group became a fixture of the New York merengue circuit. Divas by Jiménez, an all-female merengue group, followed in 2014, and for three years it was the face of a Dominican public campaign against violence towards women. In 2017 he produced a tribute to the women of merengue, ending a night at the Estadio Olímpico with an homage to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0d7c68df-63ca-4b6b-9a8f-c6c1a62912f1","displayText":"Belkis Concepción","occurrenceId":"c2c72c82-2be1-4992-882c-c2bdf13a1529"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Esto Es Merengue is the project he has been assembling for fourteen years: an album, a concert tour and a documentary, with a hundred and twenty-eight artists and seventy-five musicians. The first single, Dominicano Alza la Mano, was launched with a flashmob in January 2022 and gathers ","type":"text"},{"type":"artistReference","attrs":{"artistId":"070e7449-814e-4ea6-a009-7a091b7e4878","displayText":"Milly Quezada","occurrenceId":"f830417d-a24e-4f3a-93b1-a1c721f3e066"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"d54c6166-1ca1-467d-97ea-dc6ac2bc0759"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc2289d0-ae94-48b5-8eb9-7f0ae18b845a","displayText":"Miriam Cruz","occurrenceId":"8cc2f2f0-5540-4a8f-bde3-75532e00269d"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"77414f7c-777e-47c2-afa3-da6fad098ecd"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"66370bcb-7373-4afa-8b08-a4402984c9f2"}},{"text":" and Eddy Herrera on one recording. Vol. 1 of the album arrived in 2023.","type":"text"}]},{"type":"paragraph","content":[{"text":"The stated purpose is preservation — to keep the genre teachable, and to get younger musicians to take it up. Coming from someone who has spent thirty years making the records rather than talking about them, it reads less like a slogan than like an inventory.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'henry-jimenez'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Henry Jiménez es pianista, arreglista, compositor y productor discográfico dominicano. Trabaja desde Nueva York y su nombre está en la letra pequeña de muchísimos discos de merengue por los que se recuerda a otra gente.","type":"text"}]},{"type":"paragraph","content":[{"text":"Aprender el oficio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Estudió en el Madison Park High School y ganó una beca para el Berklee College of Music de Boston, que no es la formación habitual de un arreglista de merengue y se le nota en la escritura.","type":"text"}]},{"type":"paragraph","content":[{"text":"Entró a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"001831dd-3baa-4512-88f5-f420ec7c2619","displayText":"Pochy y su Cocoband","occurrenceId":"d4d5329a-0fb8-4d62-90fb-4bef13a88f40"}},{"text":" como pianista en 1990 y arregló El Mujerón y El Boche en Llegaron los Cocotuces. Al año siguiente arregló La Morenita para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73032c71-e46c-45b1-b02c-8f4de18426ad","displayText":"Los Toros Band","occurrenceId":"e7088d3e-99df-4a9c-868e-3c7e115b96f5"}},{"text":" — el primer éxito de Héctor Acosta — y Pum Pum para Lisa M. Después vino Traigo la Bomba, para Vico C y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6fc762d4-96b8-4ecf-aca8-fdf52936658e","displayText":"Toño Rosario","occurrenceId":"0e507f19-05d8-4988-9652-60349c744667"}},{"text":", y con ella la primera alianza con Sony.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los años de Milly","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1995 produjo y arregló En Tus Manos para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"070e7449-814e-4ea6-a009-7a091b7e4878","displayText":"Milly Quezada","occurrenceId":"2e1605f3-68bd-41ca-b214-9bcfa9e2bb20"}},{"text":". El disco llevaba Entre Tu Cuerpo y el Mío, mejor conocida como Solo Contigo, y la devolvió a los primeros lugares.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 1997 vino Hasta Siempre, y él fue director musical del concierto del mismo nombre en el Hotel Jaragua. Se había anunciado como la despedida de ella. El álbum y la noche salieron tan bien que no se retiró.","type":"text"}]},{"type":"paragraph","content":[{"text":"Siguió trabajando con ella en Vive, en el disco del vigésimo aniversario y en las recopilaciones, y en 2006 salieron dos Latin Grammy de MQ: uno como arreglista y otro como ingeniero, que es una pareja rara de sostener en un mismo disco.","type":"text"}]},{"type":"paragraph","content":[{"text":"Mambo Studio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Abrió su propia sala en Manhattan en el año 2000 y ese mismo año ganó un Grammy como productor de Olga Viva, Viva Olga, de Olga Tañón. El año anterior, Lleno de Vida, de Manny Manuel, ya había quedado nominado al Latin Grammy.","type":"text"}]},{"type":"paragraph","content":[{"text":"El trabajo de sello de esa época pasó por Sony, BMG y Capitol, en discos para Jessica Cristina, Jaileen Cintrón, Gisselle, Merenbooty Girls y Melina León. También pasó una década produciendo música publicitaria en Nueva York para empresas que no tienen nada que ver con el merengue, que es como un arreglista de oficio le paga al estudio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dirigir la sala","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fue director musical de SOY, de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"20e508b2-4bb5-4cb8-b2e5-ed50278edd79"}},{"text":", en el Teatro Nacional, y después le produjo Volvió la Navidad. Arregló Resistiré para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6fc762d4-96b8-4ecf-aca8-fdf52936658e","displayText":"Toño Rosario","occurrenceId":"c4d983a0-8313-43ab-a8c0-7e3c2202a504"}},{"text":", que entró a la lista tropical. Le produjo Un Hombre Nuevo a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"6d61a2d2-5e2e-4c32-93cd-a7ed5b2658ef"}},{"text":", que se llevó el Merengue del Año en los Casandra.","type":"text"}]},{"type":"paragraph","content":[{"text":"Luego vino la racha con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc2289d0-ae94-48b5-8eb9-7f0ae18b845a","displayText":"Miriam Cruz","occurrenceId":"393e2721-e36c-45ce-967c-da43d6e204b8"}},{"text":": Es Cosa de Él, que se mantuvo medio año en la radio dominicana, después Es Necesario, de la autoría de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"ed465714-6c5a-4726-a805-d32eaa97ebed"}},{"text":", y La Carnada, de la autoría de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"8b25c0d4-dd79-4167-accb-847a5526b770"}},{"text":", que ganó Merengue del Año en los Soberano.","type":"text"}]},{"type":"paragraph","content":[{"text":"En el Radio City Music Hall, en 2016, dirigió una noche armada sobre el merengue de los noventa, con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"070e7449-814e-4ea6-a009-7a091b7e4878","displayText":"Milly Quezada","occurrenceId":"8bee0bdb-fb4e-4bc5-a4d8-6824e0ac5684"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"1b56bc3d-2517-416e-8002-743db1e841f1"}},{"text":", Jossie Esteban, Kinito Méndez, Pochy Familia, Sergio Vargas, Oro Sólido, Mala Fe y sus dos agrupaciones en el mismo escenario.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sus propias bandas, y el proyecto largo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fundó Los Homeboys en 1994, y el grupo se volvió fijo del circuito merenguero de Nueva York. Divas by Jiménez, una agrupación de merengue enteramente femenina, llegó en 2014, y durante tres años fue la imagen de una campaña pública dominicana contra la violencia hacia las mujeres. En 2017 produjo un tributo a las damas del merengue, y cerró una noche en el Estadio Olímpico con un homenaje a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0d7c68df-63ca-4b6b-9a8f-c6c1a62912f1","displayText":"Belkis Concepción","occurrenceId":"c3581115-8352-400b-b596-e88ef270d232"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Esto Es Merengue es el proyecto que lleva catorce años armando: un álbum, una gira de conciertos y un documental, con ciento veintiocho artistas y setenta y cinco músicos. El primer sencillo, Dominicano Alza la Mano, se lanzó con un flashmob en enero de 2022 y reúne en una sola grabación a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"070e7449-814e-4ea6-a009-7a091b7e4878","displayText":"Milly Quezada","occurrenceId":"9dbe05cf-267d-4f27-8559-eefe707616da"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"357c0d99-5ab7-4aed-aea1-ea0614e34f3f"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc2289d0-ae94-48b5-8eb9-7f0ae18b845a","displayText":"Miriam Cruz","occurrenceId":"5e3497a0-ab64-4fdd-806c-4ca91bab98d1"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"1270bf36-dda7-4230-98ab-b68f810bed16"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"a8aaa005-1fff-4155-a5be-2ed0d999bcc4"}},{"text":" y Eddy Herrera. El Vol. 1 del álbum salió en 2023.","type":"text"}]},{"type":"paragraph","content":[{"text":"El propósito declarado es preservar: mantener el género enseñable y conseguir que los músicos jóvenes lo agarren. Viniendo de alguien que lleva treinta años haciendo los discos en vez de hablar de ellos, se lee menos como consigna que como inventario.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'henry-jimenez'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '05be5067-5651-47c4-95d3-de8556650782', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '27f5463e-7854-4577-b56b-5d9868679513', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '47f7debe-b9ce-457b-9b2d-108d14bac77f', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '4bcb6122-9ec2-4278-8ad3-5a4756a6dd47', 'artist', '73032c71-e46c-45b1-b02c-8f4de18426ad');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '4ccef54f-9721-43ff-965d-2faba30faa84', 'artist', '070e7449-814e-4ea6-a009-7a091b7e4878');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '66370bcb-7373-4afa-8b08-a4402984c9f2', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '70004e15-7acc-42c5-b0af-b687152114fe', 'artist', '070e7449-814e-4ea6-a009-7a091b7e4878');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '76ee218d-dd59-4211-a6df-4ef17817c80f', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '77414f7c-777e-47c2-afa3-da6fad098ecd', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '82ce1e88-8c8a-40e9-9286-d3251a9effa7', 'artist', 'bc2289d0-ae94-48b5-8eb9-7f0ae18b845a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '879cd80a-e607-41c7-82df-076b26acf913', 'artist', '6fc762d4-96b8-4ecf-aca8-fdf52936658e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), '8cc2f2f0-5540-4a8f-bde3-75532e00269d', 'artist', 'bc2289d0-ae94-48b5-8eb9-7f0ae18b845a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), 'c2c72c82-2be1-4992-882c-c2bdf13a1529', 'artist', '0d7c68df-63ca-4b6b-9a8f-c6c1a62912f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), 'c7b68e80-3a0b-44de-a52d-217249905768', 'artist', '001831dd-3baa-4512-88f5-f420ec7c2619');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), 'd54c6166-1ca1-467d-97ea-dc6ac2bc0759', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), 'e9731a29-9821-423f-8293-46a15b10c5f3', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), 'eae2bc4e-89fb-4124-9787-9310577e0422', 'artist', '6fc762d4-96b8-4ecf-aca8-fdf52936658e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'en'), 'f830417d-a24e-4f3a-93b1-a1c721f3e066', 'artist', '070e7449-814e-4ea6-a009-7a091b7e4878');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '0e507f19-05d8-4988-9652-60349c744667', 'artist', '6fc762d4-96b8-4ecf-aca8-fdf52936658e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '1270bf36-dda7-4230-98ab-b68f810bed16', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '1b56bc3d-2517-416e-8002-743db1e841f1', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '20e508b2-4bb5-4cb8-b2e5-ed50278edd79', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '2e1605f3-68bd-41ca-b214-9bcfa9e2bb20', 'artist', '070e7449-814e-4ea6-a009-7a091b7e4878');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '357c0d99-5ab7-4aed-aea1-ea0614e34f3f', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '393e2721-e36c-45ce-967c-da43d6e204b8', 'artist', 'bc2289d0-ae94-48b5-8eb9-7f0ae18b845a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '5e3497a0-ab64-4fdd-806c-4ca91bab98d1', 'artist', 'bc2289d0-ae94-48b5-8eb9-7f0ae18b845a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '6d61a2d2-5e2e-4c32-93cd-a7ed5b2658ef', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '8b25c0d4-dd79-4167-accb-847a5526b770', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '8bee0bdb-fb4e-4bc5-a4d8-6824e0ac5684', 'artist', '070e7449-814e-4ea6-a009-7a091b7e4878');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), '9dbe05cf-267d-4f27-8559-eefe707616da', 'artist', '070e7449-814e-4ea6-a009-7a091b7e4878');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), 'a8aaa005-1fff-4155-a5be-2ed0d999bcc4', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), 'c3581115-8352-400b-b596-e88ef270d232', 'artist', '0d7c68df-63ca-4b6b-9a8f-c6c1a62912f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), 'c4d983a0-8313-43ab-a8c0-7e3c2202a504', 'artist', '6fc762d4-96b8-4ecf-aca8-fdf52936658e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), 'd4d5329a-0fb8-4d62-90fb-4bef13a88f40', 'artist', '001831dd-3baa-4512-88f5-f420ec7c2619');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), 'e7088d3e-99df-4a9c-868e-3c7e115b96f5', 'artist', '73032c71-e46c-45b1-b02c-8f4de18426ad');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'henry-jimenez') AND locale = 'es'), 'ed465714-6c5a-4726-a805-d32eaa97ebed', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

COMMIT;
