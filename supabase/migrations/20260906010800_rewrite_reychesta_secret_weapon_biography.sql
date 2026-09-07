BEGIN;

-- Rewrite the catalogue entry for Reychesta Secret Weapon.
--
-- Reychesta Secret Weapon. Filler in English -- two sentences -- no sort_name,
-- no stage_name, no instruments, no disambiguation. He founded and named Tres
-- Coronas, wrote a chorus for Plan B, made a record with Alejandro Sanz and
-- wrote a WWE wrestler's entrance theme. The row said none of it.
--
-- HE HAS A LONG SPANISH WIKIPEDIA ARTICLE AND IT CARRIES A MAINTENANCE BANNER
-- SAYING IT NEEDS REFERENCES. That shapes everything below: the article is
-- detailed, internally consistent and almost entirely unsourced, so its claims
-- are used where they are corroborated elsewhere and rejected where they are
-- not. Two claims are rejected outright and both are explained.
--
-- REJECTED CLAIM 1 -- THE PARENTAGE. The article says he is the son of Anthony
-- Ríos, one of the largest figures in twentieth-century Dominican popular music
-- and the subject of a posthumous homage at the 2019 Soberano gala. Searching
-- the exact claim returns Wikipedia, Spotify's artist blurb, and a row of
-- Facebook pages, every one of them reproducing the same paragraph word for
-- word. There is no independent source. Anthony Ríos IS in this catalogue, so a
-- link was available and is NOT made: asserting a parentage between two real,
-- named people on one unreferenced sentence is exactly what the identity rule
-- exists to stop. If a newspaper or an interview confirms it, the link is one
-- line.
--
-- REJECTED CLAIM 2 -- THE BIRTHPLACE, and this is a deliberate consistency call.
-- The article says Santiago; the row says Santo Domingo, Distrito Nacional. A
-- Last.fm biography from 2009 also says Santo Domingo. The article's Santiago is
-- echoed only by copies of itself. Having refused the parentage from this source
-- for lack of corroboration, accepting the birthplace from it would be applying
-- two standards to one document. province and birth_place are NOT touched. This
-- is an open question for the editor and the answer would settle both fields.
--
-- Note that date_of_birth 1978-10-06 already in the row matches the article
-- exactly, which suggests the row was partly built from it -- another reason not
-- to treat the two as independent of each other.
--
-- WHAT IS USED, BECAUSE IT IS CORROBORATED. Tres Coronas is documented on
-- Discogs and in Vice's Latin American edition, which the article cites. The
-- Chosen Few and Machete Music releases are commercially published records. The
-- WWE theme has a release date and a credited co-writer. The Alejandro Sanz
-- remix is on a commercially released special edition. The Plan B chorus credit
-- is the one repeated most widely outside Wikipedia.
--
-- FILLED: sort_name and stage_name, both null. instruments -- piano, guitar and
-- saxophone, which he learned at a performing-arts school, plus voice.
-- occupations composer beside the musician already stored, which is the whole
-- point of him: he writes for other people. genres. disambiguation.
--
-- THE ALIASES ARE REPLACED. The row held ["Reychesta Secret Weapon", "Rey
-- Chester"] -- the first a copy of the name field, the second attested nowhere.
-- In their place go the four the article lists and that appear on records: Secret
-- Weapon, Arma Secreta, Primera Corona, Triple Corona, plus Rey Chesta, which is
-- the display name on his own Instagram.
--
-- THE YOUTUBE HANDLE GAINS ITS @. The row stored "TheRealReychestaSW" with no
-- prefix -- one of the sixty-four records flagged for that. The channel resolves
-- at @TheRealReychestaSW and the value is corrected in place.
--
-- NOT WRITTEN, AND FIRMLY. Reports circulated on social media in 2024 and 2025
-- about his health following an incident in New York. Health is outside what this
-- record keeps, the reports are social-media posts rather than journalism, and
-- the subject of them is the kind that does the most harm when it is repeated
-- carelessly. Nothing about it appears in the biography and nothing more is said
-- about it here. He is alive and still releasing -- a track with Trader OG went
-- up days before this entry was written -- so ended stays false and no death
-- fields are set.
--
-- A NAME COLLISION HEADED OFF. "Falsedades" samples the Puerto Rican singer
-- CARMITA Jiménez, from her 1960 recording Peligro. This catalogue contains a
-- CARMEN Jiménez -- La Caribeña, a living merengue singer born in Puerto Rico to
-- a Dominican mother, who founded Merenchata. Different people, sixty years
-- apart. Not linked, and recorded here so nobody links them later.
--
-- SOURCES: Spanish Wikipedia, treated as above. Discogs and Vice, which it
-- cites, for Tres Coronas. His own YouTube channel -- twenty-four videos and the
-- About panel -- and his own Instagram, which gives Primera Corona Records.
-- Last.fm's older biographies. Spotify's artist page.
--
-- NOT LINKED: P.N.O and Rocca are Colombian; Tempo, DJ Playero, MC Ceja, Plan B,
-- Arcángel, Zion & Lennox, Gotay and D.OZi are Puerto Rican; Alejandro Sanz is
-- Spanish; Twista, Chris Rivers, Cuban Link and Dave East are American; Maluma
-- is Colombian. Boy Wonder, Sensato, Fuego, Jenny La Sexy Voz and Artwell Smart
-- have no entries. "Mely Mel", listed on one posse cut, is NOT linked to the
-- published MelyMel: the spelling is also how Melle Mel is written in Spanish and
-- the track is a Latin rap posse cut full of American guests, so the identity is
-- not established.
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
       name = 'Reychesta Secret Weapon',
       sort_name = 'Reychesta Secret Weapon',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = '1978-10-06',
       birth_year = 1978,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'José',
       middle_name = 'Alberto',
       last_name = 'Collado',
       second_last_name = NULL,
       stage_name = 'Reychesta',
       aliases = ARRAY['Secret Weapon', 'Arma Secreta', 'Primera Corona', 'Triple Corona', 'Rey Chesta']::text[],
       occupations = '["musician","composer"]'::jsonb,
       instruments = ARRAY['voice', 'piano', 'guitar', 'saxophone']::text[],
       genres = ARRAY['urban-rap-hip-hop', 'urban-trap', 'urban-reggaeton']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@TheRealReychestaSW',
       facebook = 'ReychestaSecretWeapon',
       instagram = 'reychestasw',
       disambiguation = 'Rapper and songwriter; founding member of Tres Coronas, based in Queens',
       bio_en = 'Reychesta, born José Alberto Collado and long billed as Secret Weapon, is a Dominican rapper and songwriter based in Queens. He is one of the most internationally connected figures Dominican hip-hop has produced and one of the least written about at home.

**A performing-arts school and a plane**

He was put into a performing-arts school at five and came out of it playing piano, guitar and saxophone — a formal musical education that almost nobody in Dominican rap has. At nine his mother took him to Corona, in Queens, and he grew up inside American hip-hop instead of beside it.

He was back in the Dominican Republic as a teenager, in a group called Public Mc, and by 1997 was freestyling on a Spanish-language morning radio show. The following year, in New York, he cut a vinyl EP in English with a group called Cliffhangaz for Fat Beats — an underground label with real standing, and an unusual first credit for a Dominican.

In 1999 the dancers from Ivy Queen’s shows gave him DJ Playero’s phone number. He called it, flew to Ponce, was met at the airport by Playero and Tempo, stayed two weeks and recorded with them. That is how careers were made in that decade: a number passed backstage, and a plane.

**Tres Coronas**

In 2001 he met P.N.O in New York, who brought in Rocca, and the three of them became one of the definitive Latin American rap groups of the decade. He named it: they were watching a horse race on television, the commentator said triple crown, and he suggested Tres Coronas.

The group is remembered as Colombian, because two of its three members were. The Dominican in it named it, wrote on it, and was there from the first session. The songs are on Parcero Production and then on Machete Music, and there are two documentaries about them.

It ended badly. He signed to Boy Wonder’s label some months before leaving, and after he left the other two kept the name — registered, on his account, without his consent. Everything since has been shadowed by it: he has released rehearsal tapes, remastered a track he had sung as a duet into a solo, and cut a long line of records aimed squarely at his former partners, who have answered.

A group name is a piece of property, and a rap group is usually three people with no contract between them. This is the most consequential thing in his biography and the thing least likely to appear in a discography.

**The songs he wrote for other people**

His best-known record as an artist is Falsedades, built by Artwell Smart on an SP1200 out of violins lifted from a 1960 ballad by the Puerto Rican singer Carmita Jiménez. He also cut Me Quieren Arrestar with producers who have three Grammys between them, and a record with Twista.

But the writing is where he has left the deepest mark. He wrote the chorus of Frikitona for Plan B, a record most of Latin America can sing. He made a remix with Alejandro Sanz. And in 2011 WWE commissioned him to write and perform the entrance theme for one of its wrestlers, alongside the man who had scored that company for thirty years.

Later he wrote much of a mixtape for another singer, including her records with Zion & Lennox, Maluma and Dave East. A Dominican from Queens writing a Puerto Rican woman’s verses for a Colombian star to sing on is the actual shape of Latin urban music, and it is invisible from any track listing.

**Primera Corona**

After falling out with his label in 2016 he changed his name to Primera Corona, to cut the link to the company, and released an EP produced by Artwell Smart with a guest verse from Big Pun’s son. He runs his own imprint, Primera Corona Records, and has kept putting out mixtapes.

Everything about him is a document of the same thing: Dominican rap did not stay in Santo Domingo. It went to Queens, to Ponce, to Bogotá and back, and the man who was in all those rooms has almost no coverage in the country he is from.',
       bio_es = 'Reychesta, de nombre José Alberto Collado y anunciado durante años como Secret Weapon, es rapero y compositor dominicano radicado en Queens. Es de las figuras más conectadas internacionalmente que ha dado el hip hop dominicano y de las menos escritas en su propio país.

**Una escuela de artes escénicas y un avión**

Lo metieron en una escuela de artes escénicas a los cinco años y salió de ahí tocando piano, guitarra y saxofón: una educación musical formal que casi nadie tiene en el rap dominicano. A los nueve su madre se lo llevó a Corona, en Queens, y se crió dentro del hip hop estadounidense y no al lado.

De adolescente estaba de vuelta en la República Dominicana, en un grupo llamado Public Mc, y para 1997 improvisaba en un programa matutino de radio en español. Al año siguiente, en Nueva York, grabó un EP en vinilo y en inglés con un grupo llamado Cliffhangaz para Fat Beats: un sello underground con peso real, y un primer crédito insólito para un dominicano.

En 1999 las bailarinas de los shows de Ivy Queen le dieron el número de DJ Playero. Llamó, voló a Ponce, lo recibieron en el aeropuerto Playero y Tempo, se quedó dos semanas y grabó con ellos. Así se hacían las carreras en esa década: un número que alguien te pasa detrás de una tarima, y un avión.

**Tres Coronas**

En 2001 conoció en Nueva York a P.N.O, que metió a Rocca, y los tres armaron uno de los grupos de rap latinoamericano definitivos de la década. El nombre lo puso él: estaban viendo una carrera de caballos en televisión, el narrador dijo triple crown, y él propuso Tres Coronas.

Al grupo se le recuerda como colombiano, porque dos de sus tres integrantes lo eran. El dominicano lo bautizó, escribió en él y estuvo desde la primera sesión. Los discos salieron por Parcero Production y después por Machete Music, y hay dos documentales sobre ellos.

Terminó mal. Él había firmado con el sello de Boy Wonder unos meses antes de irse, y después de su salida los otros dos se quedaron con el nombre, registrado —según su relato— sin su consentimiento. Todo lo que vino después quedó marcado por eso: publicó un ensayo del grupo, remasterizó como tema solista una canción que había cantado a dúo, y grabó una fila larga de tiraeras contra sus antiguos socios, que le han contestado.

El nombre de un grupo es una propiedad, y un grupo de rap suele ser tres personas sin ningún contrato entre ellas. Esto es lo más consecuente de su biografía y lo que menos posibilidades tiene de aparecer en una discografía.

**Las canciones que escribió para otros**

Su disco más conocido como artista es Falsedades, que Artwell Smart armó en una SP1200 con violines sacados de una balada de 1960 de la puertorriqueña Carmita Jiménez. También grabó Me Quieren Arrestar con productores que suman tres Grammys, y un tema con Twista.

Pero donde ha dejado la marca más honda es escribiendo. Suyo es el coro de Frikitona, de Plan B, un disco que casi toda América Latina se sabe. Hizo un remix con Alejandro Sanz. Y en 2011 la WWE le encargó componer e interpretar el tema de entrada de uno de sus luchadores, junto al hombre que llevaba treinta años haciéndole la música a esa empresa.

Después escribió buena parte de un mixtape de otra cantante, incluidos sus temas con Zion & Lennox, Maluma y Dave East. Un dominicano de Queens escribiéndole los versos a una puertorriqueña para que encima cante una estrella colombiana es la forma real de la música urbana latina, y no se ve en ninguna lista de créditos.

**Primera Corona**

Tras romper con su sello en 2016 se cambió el nombre a Primera Corona, para cortar el vínculo con la compañía, y sacó un EP producido por Artwell Smart con una estrofa invitada del hijo de Big Pun. Maneja su propio sello, Primera Corona Records, y no ha dejado de publicar mixtapes.

Todo en él documenta lo mismo: el rap dominicano no se quedó en Santo Domingo. Se fue a Queens, a Ponce, a Bogotá y de vuelta, y el hombre que estuvo en todas esas salas casi no tiene cobertura en el país del que salió.',
       updated_at = now()
 WHERE slug = 'reychesta-secret-weapon';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'reychesta-secret-weapon')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'reychesta-secret-weapon')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Reychesta, born José Alberto Collado and long billed as Secret Weapon, is a Dominican rapper and songwriter based in Queens. He is one of the most internationally connected figures Dominican hip-hop has produced and one of the least written about at home.","type":"text"}]},{"type":"paragraph","content":[{"text":"A performing-arts school and a plane","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was put into a performing-arts school at five and came out of it playing piano, guitar and saxophone — a formal musical education that almost nobody in Dominican rap has. At nine his mother took him to Corona, in Queens, and he grew up inside American hip-hop instead of beside it.","type":"text"}]},{"type":"paragraph","content":[{"text":"He was back in the Dominican Republic as a teenager, in a group called Public Mc, and by 1997 was freestyling on a Spanish-language morning radio show. The following year, in New York, he cut a vinyl EP in English with a group called Cliffhangaz for Fat Beats — an underground label with real standing, and an unusual first credit for a Dominican.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 1999 the dancers from Ivy Queen’s shows gave him DJ Playero’s phone number. He called it, flew to Ponce, was met at the airport by Playero and Tempo, stayed two weeks and recorded with them. That is how careers were made in that decade: a number passed backstage, and a plane.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tres Coronas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2001 he met P.N.O in New York, who brought in Rocca, and the three of them became one of the definitive Latin American rap groups of the decade. He named it: they were watching a horse race on television, the commentator said triple crown, and he suggested Tres Coronas.","type":"text"}]},{"type":"paragraph","content":[{"text":"The group is remembered as Colombian, because two of its three members were. The Dominican in it named it, wrote on it, and was there from the first session. The songs are on Parcero Production and then on Machete Music, and there are two documentaries about them.","type":"text"}]},{"type":"paragraph","content":[{"text":"It ended badly. He signed to Boy Wonder’s label some months before leaving, and after he left the other two kept the name — registered, on his account, without his consent. Everything since has been shadowed by it: he has released rehearsal tapes, remastered a track he had sung as a duet into a solo, and cut a long line of records aimed squarely at his former partners, who have answered.","type":"text"}]},{"type":"paragraph","content":[{"text":"A group name is a piece of property, and a rap group is usually three people with no contract between them. This is the most consequential thing in his biography and the thing least likely to appear in a discography.","type":"text"}]},{"type":"paragraph","content":[{"text":"The songs he wrote for other people","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His best-known record as an artist is Falsedades, built by Artwell Smart on an SP1200 out of violins lifted from a 1960 ballad by the Puerto Rican singer Carmita Jiménez. He also cut Me Quieren Arrestar with producers who have three Grammys between them, and a record with Twista.","type":"text"}]},{"type":"paragraph","content":[{"text":"But the writing is where he has left the deepest mark. He wrote the chorus of Frikitona for Plan B, a record most of Latin America can sing. He made a remix with Alejandro Sanz. And in 2011 WWE commissioned him to write and perform the entrance theme for one of its wrestlers, alongside the man who had scored that company for thirty years.","type":"text"}]},{"type":"paragraph","content":[{"text":"Later he wrote much of a mixtape for another singer, including her records with Zion & Lennox, Maluma and Dave East. A Dominican from Queens writing a Puerto Rican woman’s verses for a Colombian star to sing on is the actual shape of Latin urban music, and it is invisible from any track listing.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primera Corona","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"After falling out with his label in 2016 he changed his name to Primera Corona, to cut the link to the company, and released an EP produced by Artwell Smart with a guest verse from Big Pun’s son. He runs his own imprint, Primera Corona Records, and has kept putting out mixtapes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Everything about him is a document of the same thing: Dominican rap did not stay in Santo Domingo. It went to Queens, to Ponce, to Bogotá and back, and the man who was in all those rooms has almost no coverage in the country he is from.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'reychesta-secret-weapon'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Reychesta, de nombre José Alberto Collado y anunciado durante años como Secret Weapon, es rapero y compositor dominicano radicado en Queens. Es de las figuras más conectadas internacionalmente que ha dado el hip hop dominicano y de las menos escritas en su propio país.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una escuela de artes escénicas y un avión","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo metieron en una escuela de artes escénicas a los cinco años y salió de ahí tocando piano, guitarra y saxofón: una educación musical formal que casi nadie tiene en el rap dominicano. A los nueve su madre se lo llevó a Corona, en Queens, y se crió dentro del hip hop estadounidense y no al lado.","type":"text"}]},{"type":"paragraph","content":[{"text":"De adolescente estaba de vuelta en la República Dominicana, en un grupo llamado Public Mc, y para 1997 improvisaba en un programa matutino de radio en español. Al año siguiente, en Nueva York, grabó un EP en vinilo y en inglés con un grupo llamado Cliffhangaz para Fat Beats: un sello underground con peso real, y un primer crédito insólito para un dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 1999 las bailarinas de los shows de Ivy Queen le dieron el número de DJ Playero. Llamó, voló a Ponce, lo recibieron en el aeropuerto Playero y Tempo, se quedó dos semanas y grabó con ellos. Así se hacían las carreras en esa década: un número que alguien te pasa detrás de una tarima, y un avión.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tres Coronas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2001 conoció en Nueva York a P.N.O, que metió a Rocca, y los tres armaron uno de los grupos de rap latinoamericano definitivos de la década. El nombre lo puso él: estaban viendo una carrera de caballos en televisión, el narrador dijo triple crown, y él propuso Tres Coronas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Al grupo se le recuerda como colombiano, porque dos de sus tres integrantes lo eran. El dominicano lo bautizó, escribió en él y estuvo desde la primera sesión. Los discos salieron por Parcero Production y después por Machete Music, y hay dos documentales sobre ellos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Terminó mal. Él había firmado con el sello de Boy Wonder unos meses antes de irse, y después de su salida los otros dos se quedaron con el nombre, registrado —según su relato— sin su consentimiento. Todo lo que vino después quedó marcado por eso: publicó un ensayo del grupo, remasterizó como tema solista una canción que había cantado a dúo, y grabó una fila larga de tiraeras contra sus antiguos socios, que le han contestado.","type":"text"}]},{"type":"paragraph","content":[{"text":"El nombre de un grupo es una propiedad, y un grupo de rap suele ser tres personas sin ningún contrato entre ellas. Esto es lo más consecuente de su biografía y lo que menos posibilidades tiene de aparecer en una discografía.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las canciones que escribió para otros","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su disco más conocido como artista es Falsedades, que Artwell Smart armó en una SP1200 con violines sacados de una balada de 1960 de la puertorriqueña Carmita Jiménez. También grabó Me Quieren Arrestar con productores que suman tres Grammys, y un tema con Twista.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pero donde ha dejado la marca más honda es escribiendo. Suyo es el coro de Frikitona, de Plan B, un disco que casi toda América Latina se sabe. Hizo un remix con Alejandro Sanz. Y en 2011 la WWE le encargó componer e interpretar el tema de entrada de uno de sus luchadores, junto al hombre que llevaba treinta años haciéndole la música a esa empresa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después escribió buena parte de un mixtape de otra cantante, incluidos sus temas con Zion & Lennox, Maluma y Dave East. Un dominicano de Queens escribiéndole los versos a una puertorriqueña para que encima cante una estrella colombiana es la forma real de la música urbana latina, y no se ve en ninguna lista de créditos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primera Corona","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Tras romper con su sello en 2016 se cambió el nombre a Primera Corona, para cortar el vínculo con la compañía, y sacó un EP producido por Artwell Smart con una estrofa invitada del hijo de Big Pun. Maneja su propio sello, Primera Corona Records, y no ha dejado de publicar mixtapes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Todo en él documenta lo mismo: el rap dominicano no se quedó en Santo Domingo. Se fue a Queens, a Ponce, a Bogotá y de vuelta, y el hombre que estuvo en todas esas salas casi no tiene cobertura en el país del que salió.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'reychesta-secret-weapon'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
