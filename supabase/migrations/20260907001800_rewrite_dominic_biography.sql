BEGIN;

-- Rewrite the catalogue entry for Dominic.
--
-- Dominic. Rewrite -- the last of the nine machine-written entries.
--
-- THE DEATH DATE IS FILLED IN, AND IT IS EXACT. The row had death_year 2020 and
-- an empty date_of_death. Two Dominican salsa pages posted it within
-- forty-eight hours of each other: Tom Datos on 16 August 2020 -- "Domingo
-- Isaias Díaz 'Dominic', 'La Voz Sublime De La Salsa', fallece el día de ayer 15
-- de agosto del presente año 2020 en New York" -- and Promoboom on 17 August
-- 2020, "Fallece en New York, Domingo Isaias Díaz 'Dominic', 'La Voz Sublime De
-- La Salsa'". date_of_death becomes 2020-08-15.
--
-- HOW HE DIED IS NOT WRITTEN. The old machine text said his career was "cut
-- short when he tragically passed away". Cause of death is outside what this
-- record keeps and the adverb is doing no work.
--
-- THE BIRTHPLACE IS LEFT ALONE AND FLAGGED. The row says Mayagüez, Puerto Rico,
-- with province "Nacido en el Exterior". Nothing found confirms it -- searching
-- his name against Mayagüez returns nothing at all. What the sources DO say is
-- that he grew up in Villa Consuelo, in Santo Domingo, and one of them puts the
-- house on calle Eusebio Mansueta. Born in Puerto Rico and raised in Santo
-- Domingo is a perfectly ordinary Caribbean biography and the two facts do not
-- contradict each other, so the field stays and the barrio goes in the prose.
-- birth_year 1975 is consistent with the reports that he was forty-five when he
-- died and is likewise not touched.
--
-- WHY HE IS IN A DOMINICAN CATALOGUE AT ALL, since the row says he was born
-- abroad: he was raised in Santo Domingo, he is described everywhere as a
-- Dominican salsero, and the old text records that he said in interviews he felt
-- Dominican. The standing criterion here is belonging to Dominican music rather
-- than birthplace, which is why Félix Cumbé, Silvio Mora, Prince Royce and
-- twenty others are in this table.
--
-- FILLED: sort_name is already set; occupations gains vocalist beside the
-- composer already stored; genres; instruments; disambiguation. The alias "La
-- Voz Sublime De La Salsa" is kept and its capitalisation normalised.
--
-- SOURCES: Tom Datos and Promoboom, August 2020, for the death. Music Isaías for
-- the single Lo Pasado, Pasado on Sky Records. México en Salsa for Niégalo Todo
-- and Te Deseo and for the company he is filed with. Latina Stereo's profile of
-- the arranger David "Piro" Rodríguez, which lists Dominic among the romantic
-- salsa singers he worked with. Facebook salsa history pages for Villa Consuelo
-- and the move to New York in the nineties.
--
-- NOT LINKED: the romantic-salsa circuit he belonged to is almost entirely
-- Puerto Rican or New York Puerto Rican -- Johnny Rivera, Puerto Rican Power,
-- Charlie Cardona, Maelo Ruiz, Ray Sepúlveda, Frankie Negrón, George Lamond,
-- DLG, Kevin Ceballos. Mickey Taveras is Dominican and has no entry, and neither
-- does the arranger David "Piro" Rodríguez; both go on the missing list.
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
       name = 'Dominic',
       sort_name = 'Dominic',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'salsa',
       date_of_birth = NULL,
       birth_year = 1975,
       date_of_death = '2020-08-15',
       birth_place = 'Mayagüez',
       province = 'Nacido en el Exterior',
       first_name = 'Domingo',
       middle_name = 'Isaías',
       last_name = 'Díaz',
       second_last_name = NULL,
       stage_name = 'Dominic',
       aliases = ARRAY['La Voz Sublime de la Salsa']::text[],
       occupations = '["composer","vocalist"]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY['bolero']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Romantic salsa singer; Niégalo Todo',
       bio_en = 'Dominic, born Domingo Isaías Díaz, was a Dominican salsa singer. He worked the romantic salsa circuit out of New York in the late nineties and two thousands, and he was billed as the sublime voice of salsa, which is the sort of name a promoter gives a singer who can actually sing.

**Villa Consuelo**

He grew up in Villa Consuelo, one of the old working barrios of Santo Domingo — a neighbourhood that has produced a disproportionate share of Dominican musicians and that he was always associated with.

He went to New York in the nineties, which is where a Dominican salsero had to be. Salsa romántica was a New York industry by then: the arrangers, the studios, the radio and the promoters were all in the same few blocks, and the singers came from wherever they came from.

**Niégalo Todo**

Niégalo Todo is the record he is remembered for, and it did what a romantic salsa hit was supposed to do — it went into the rotation and stayed there. Te Esperaré and Te Deseo belong to the same run, and Lo Pasado, Pasado came out on Sky Records.

The genre he worked in has a specific shape. The songs are boleros in everything but rhythm: slow-burning, wounded, sung to one person, and then set over a salsa arrangement that turns private misery into something a room can dance to. He was very good at the first half of that, which is the half that is hard.

He belonged to a bill that was overwhelmingly Puerto Rican — the singers he shared arrangers and stages with were mostly from San Juan or the Bronx. Being the Dominican in a Puerto Rican genre is its own kind of career, and it usually means working twice for the same billing.

**A short life**

He died in New York in August 2020, at forty-five. The salsa pages of the Dominican diaspora carried it within a day of each other; the Dominican press barely did.

That is the shape of the whole story, really. He spent his career singing a Puerto Rican form in an American city with a Dominican passport and a Dominican barrio behind him, and he ended up slightly outside every list that gets kept. The records are still there.',
       bio_es = 'Dominic, de nombre Domingo Isaías Díaz, fue cantante de salsa dominicano. Trabajó el circuito de la salsa romántica desde Nueva York a finales de los noventa y en los dos mil, y lo anunciaban como la voz sublime de la salsa, que es la clase de nombre que un promotor le pone a un cantante que de verdad canta.

**Villa Consuelo**

Se crió en Villa Consuelo, uno de los barrios trabajadores viejos de Santo Domingo: un sector que ha dado una cantidad desproporcionada de músicos dominicanos y con el que siempre se le asoció.

Se fue a Nueva York en los noventa, que era donde tenía que estar un salsero dominicano. Para entonces la salsa romántica era una industria neoyorquina: los arreglistas, los estudios, la radio y los promotores estaban en las mismas pocas cuadras, y los cantantes venían de donde vinieran.

**Niégalo Todo**

Niégalo Todo es el disco por el que se le recuerda, e hizo lo que se suponía que hiciera un éxito de salsa romántica: entró en rotación y se quedó. Te Esperaré y Te Deseo son de esa misma tanda, y Lo Pasado, Pasado salió por Sky Records.

El género en el que trabajó tiene una forma concreta. Las canciones son boleros en todo menos en el ritmo: lentas, heridas, cantadas a una sola persona, y montadas después sobre un arreglo de salsa que convierte una miseria privada en algo que un salón puede bailar. Él era muy bueno en la primera mitad de eso, que es la mitad difícil.

Pertenecía a un cartel abrumadoramente puertorriqueño: los cantantes con los que compartía arreglistas y tarimas eran casi todos de San Juan o del Bronx. Ser el dominicano de un género puertorriqueño es una carrera de un tipo propio, y suele querer decir trabajar el doble por el mismo anuncio.

**Una vida corta**

Murió en Nueva York en agosto de 2020, a los cuarenta y cinco. Las páginas de salsa de la diáspora dominicana lo publicaron con un día de diferencia entre ellas; la prensa dominicana casi no.

Esa es la forma de toda la historia, en realidad. Se pasó la carrera cantando una forma puertorriqueña en una ciudad estadounidense con pasaporte dominicano y un barrio dominicano detrás, y terminó ligeramente fuera de todas las listas que se llevan. Los discos siguen ahí.',
       updated_at = now()
 WHERE slug = 'dominic';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dominic')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dominic')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dominic, born Domingo Isaías Díaz, was a Dominican salsa singer. He worked the romantic salsa circuit out of New York in the late nineties and two thousands, and he was billed as the sublime voice of salsa, which is the sort of name a promoter gives a singer who can actually sing.","type":"text"}]},{"type":"paragraph","content":[{"text":"Villa Consuelo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He grew up in Villa Consuelo, one of the old working barrios of Santo Domingo — a neighbourhood that has produced a disproportionate share of Dominican musicians and that he was always associated with.","type":"text"}]},{"type":"paragraph","content":[{"text":"He went to New York in the nineties, which is where a Dominican salsero had to be. Salsa romántica was a New York industry by then: the arrangers, the studios, the radio and the promoters were all in the same few blocks, and the singers came from wherever they came from.","type":"text"}]},{"type":"paragraph","content":[{"text":"Niégalo Todo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Niégalo Todo is the record he is remembered for, and it did what a romantic salsa hit was supposed to do — it went into the rotation and stayed there. Te Esperaré and Te Deseo belong to the same run, and Lo Pasado, Pasado came out on Sky Records.","type":"text"}]},{"type":"paragraph","content":[{"text":"The genre he worked in has a specific shape. The songs are boleros in everything but rhythm: slow-burning, wounded, sung to one person, and then set over a salsa arrangement that turns private misery into something a room can dance to. He was very good at the first half of that, which is the half that is hard.","type":"text"}]},{"type":"paragraph","content":[{"text":"He belonged to a bill that was overwhelmingly Puerto Rican — the singers he shared arrangers and stages with were mostly from San Juan or the Bronx. Being the Dominican in a Puerto Rican genre is its own kind of career, and it usually means working twice for the same billing.","type":"text"}]},{"type":"paragraph","content":[{"text":"A short life","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He died in New York in August 2020, at forty-five. The salsa pages of the Dominican diaspora carried it within a day of each other; the Dominican press barely did.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the shape of the whole story, really. He spent his career singing a Puerto Rican form in an American city with a Dominican passport and a Dominican barrio behind him, and he ended up slightly outside every list that gets kept. The records are still there.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dominic'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dominic, de nombre Domingo Isaías Díaz, fue cantante de salsa dominicano. Trabajó el circuito de la salsa romántica desde Nueva York a finales de los noventa y en los dos mil, y lo anunciaban como la voz sublime de la salsa, que es la clase de nombre que un promotor le pone a un cantante que de verdad canta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Villa Consuelo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se crió en Villa Consuelo, uno de los barrios trabajadores viejos de Santo Domingo: un sector que ha dado una cantidad desproporcionada de músicos dominicanos y con el que siempre se le asoció.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se fue a Nueva York en los noventa, que era donde tenía que estar un salsero dominicano. Para entonces la salsa romántica era una industria neoyorquina: los arreglistas, los estudios, la radio y los promotores estaban en las mismas pocas cuadras, y los cantantes venían de donde vinieran.","type":"text"}]},{"type":"paragraph","content":[{"text":"Niégalo Todo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Niégalo Todo es el disco por el que se le recuerda, e hizo lo que se suponía que hiciera un éxito de salsa romántica: entró en rotación y se quedó. Te Esperaré y Te Deseo son de esa misma tanda, y Lo Pasado, Pasado salió por Sky Records.","type":"text"}]},{"type":"paragraph","content":[{"text":"El género en el que trabajó tiene una forma concreta. Las canciones son boleros en todo menos en el ritmo: lentas, heridas, cantadas a una sola persona, y montadas después sobre un arreglo de salsa que convierte una miseria privada en algo que un salón puede bailar. Él era muy bueno en la primera mitad de eso, que es la mitad difícil.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pertenecía a un cartel abrumadoramente puertorriqueño: los cantantes con los que compartía arreglistas y tarimas eran casi todos de San Juan o del Bronx. Ser el dominicano de un género puertorriqueño es una carrera de un tipo propio, y suele querer decir trabajar el doble por el mismo anuncio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una vida corta","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Murió en Nueva York en agosto de 2020, a los cuarenta y cinco. Las páginas de salsa de la diáspora dominicana lo publicaron con un día de diferencia entre ellas; la prensa dominicana casi no.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa es la forma de toda la historia, en realidad. Se pasó la carrera cantando una forma puertorriqueña en una ciudad estadounidense con pasaporte dominicano y un barrio dominicano detrás, y terminó ligeramente fuera de todas las listas que se llevan. Los discos siguen ahí.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'dominic'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
