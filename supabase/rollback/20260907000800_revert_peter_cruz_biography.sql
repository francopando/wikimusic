BEGIN;

-- Reverts 20260907000800_rewrite_peter_cruz_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Peter Cruz',
       sort_name = NULL,
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue-orquesta',
       date_of_birth = '1960-05-27',
       birth_year = 1960,
       date_of_death = NULL,
       birth_place = 'Yamasá',
       province = 'Monte Plata',
       first_name = 'Pedro',
       middle_name = 'Antonio',
       last_name = 'de La Cruz',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = 'peter.cruz.71653318',
       instagram = 'petercruzoficial',
       disambiguation = NULL,
       bio_en = '**Pedro Antonio de la Cruz**, known professionally as **Peter Cruz**, is a Dominican merengue singer born in **Yamasá, Monte Plata, Dominican Republic**, and recognized as one of the emblematic voices of the genre during the 1980s. His work spans several of the most influential orchestras of the era, including **Cheché Abreu**, **Aníbal Bravo**, **Wilfrido Vargas**, and the **Orquesta Internacional**, where he became one of the principal vocalists. His interpretation of **“Cometa Blanca”** is considered one of the defining merengue hits of the decade and a signature piece of his career.

## **Early Life and Musical Beginnings**

Pedro Antonio de la Cruz was born and raised in Yamasá, a rural municipality in the province of Monte Plata. His early musical development took place in local ensembles, most notably **Caonabo y sus Muchachos**, where he began performing merengue while also cultivating an interest in boleros and romantic ballads.

Following his family’s relocation to Santo Domingo, Cruz gained access to the capital’s musical circuit. He joined a local orchestra as a **chorister**, occasionally performing boleros, which provided his first structured experience within a professional ensemble.

## **Professional Debut: Cheché Abreu**

Cruz’s first major professional opportunity came with **Cheché Abreu y sus Colosos**, one of the most active orchestras of the late 1970s. Under Abreu’s direction—known for strict discipline due to his background as a naval officer—Cruz developed the punctuality, rehearsal habits, and stage discipline that would shape his later career.

During this period, he recorded:

- **“Llegó la mañana”**  
- **“Ay caray”**  
- **“Entre espuma”**  
- **“Tu ausencia”**  
- Various salsa tracks, as the orchestra performed both merengue and salsa.

He shared the front line with Pedro María (“El Profeta”) and Cheché Abreu himself, gaining visibility as a versatile vocalist.

## **Transition to Aníbal Bravo**

After leaving Cheché Abreu, Cruz received multiple informal offers from other orchestras but ultimately joined **Aníbal Bravo**. Although he did not record with Bravo due to contractual obligations with the Cubaney label, he performed live versions of his earlier merengues and the arrangement **“Melina”**, which he interpreted on television.

## **Wilfrido Vargas Era**

Cruz’s next major step was joining **Wilfrido Vargas**, one of the most influential directors in Dominican merengue. Vargas recruited him specifically for his ability to handle **high‑timbre, high‑register coros**, which were essential to the group’s sound.

During his three‑year tenure, Cruz:

- Recorded coros for the album **El Jardinero**.  
- Participated in international tours across the United States, Central America, South America, and the Caribbean.  
- Recorded several tracks that became hits, including:  
  - **“Lo ajeno se deja quieto”**  
  - **“Rompa todo el mundo”**  
  - **“El añoñaito”**  
  - **“Te olvidé”**

Although Ruby Pérez was the official lead vocalist, Cruz’s voice is present throughout the group’s recordings and live arrangements of the period.

## **Formation of the Orquesta Internacional**

In 1985, Cruz became a founding member of the **Orquesta Internacional**, created under the Interdos corporate umbrella. The project assembled some of the most respected musicians in the country:

- **Ramón Orlando** – musical director  
- **Joe Nicolás** – bass  
- **Crispín Fernández** – saxophone  
- **Caqui Ruiz** – saxophone  
- **Fermín Cruz** – trumpet  
- **Marco Orlando** – trombone  

Cruz was one of the orchestra’s principal vocalists and contributed to its early identity and success.

## **Key Recordings**

His most notable recordings with the Internacional include:

- **“Cometa Blanca”**  
- **“Tu mujer”**  
- **“El trovador”**  
- **“Cómo te atreves”**  
- **“Embrujado”**

**“Cometa Blanca”**—originally recorded by Spanish singer Chiquetete—became the orchestra’s breakthrough hit. Cruz discovered the song while touring in Venezuela, brought it to Ramón Orlando, and insisted on adapting it to merengue. The track became one of the most important merengues of the 1980s and a defining moment in Cruz’s career.

## **Solo Career**

After leaving the Internacional, Cruz established his own orchestra and released several successful singles, including:

- **“Secretos”**  
- **“Mi tristeza es mía”**  
- **“Coqueta”**  
- **“El ganador”**

These songs solidified his presence as a solo artist and expanded his repertoire beyond the orchestral format.

## **Musical Style**

Peter Cruz is known for:

- a clear, high‑timbre vocal tone,  
- strong command of merengue phrasing and rhythmic articulation,  
- versatility across merengue, son, salsa, and romantic repertoire,  
- adaptability to both ensemble and solo formats.

His vocal style became a reference point for merengue singers of the 1980s and 1990s.

## **Later Years and Health**

In June 2019, Cruz suffered a heart attack and was hospitalized at the Milstein Hospital of Columbia University in Manhattan. After recovering, he resumed musical activity and continued performing and recording.

## **Legacy**

Peter Cruz is regarded as:

- one of the essential voices of Dominican merengue’s golden era,  
- a foundational member of the Orquesta Internacional,  
- the interpreter of one of the most iconic merengues of the 1980s (“Cometa Blanca”),  
- a vocalist whose work spans several of the genre’s most influential orchestras.

His contributions remain central to the history of Dominican merengue and continue to influence new generations of musicians.',
       bio_es = '**Peter Cruz** (nacido en **Yamasá, provincia Monte Plata**, República Dominicana) es un cantante dominicano de merengue, reconocido por su participación en varias de las orquestas más influyentes del país durante las décadas de 1970 y 1980, y por su papel como una de las voces emblemáticas de la **Orquesta Internacional**. Su interpretación de **“Cometa Blanca”** se convirtió en uno de los éxitos más representativos del merengue de los años 80 y en su sello artístico más reconocido. Su trayectoria incluye colaboraciones con Cheché Abreu, Aníbal Bravo, Wilfrido Vargas y posteriormente su propia agrupación.

## **Primeros años y formación**

Peter Cruz nació en Yamasá, un municipio de la provincia Monte Plata. Sus primeros pasos en la música se dieron en su pueblo natal, donde comenzó a cantar con el grupo local **Caonabo y sus muchachos**. Aunque interpretaba merengue en vivo, su inclinación inicial estaba orientada hacia **boleros y baladas**, géneros que formaron parte de su repertorio temprano.

Tras la mudanza familiar a Santo Domingo, Cruz tuvo contacto con agrupaciones de la capital y recibió su primera oportunidad profesional en una orquesta urbana, donde trabajó como corista e intérprete ocasional de boleros.

## **Carrera temprana: Cheché Abreu**

Su primera experiencia profesional de alto perfil fue con **Cheché Abreu y sus Colosos**, donde ingresó como corista y posteriormente como cantante de algunos temas. Entre 1978 y 1981 grabó merengues y también salsa, debido a que la orquesta tenía un formato híbrido.   

Durante esta etapa:

- Adquirió disciplina profesional debido al estricto manejo de horarios del maestro Abreu.  
- Grabó temas como **“Llegó la mañana”**, **“Ay caray”**, **“Entre espuma”**, **“Tu ausencia”**, entre otros.  
- Compartió frente con Pedro María (“El Profeta”) y el propio Cheché Abreu.  

Esta etapa marcó su entrada formal al circuito profesional del merengue.

## **Paso por Aníbal Bravo**

Tras su salida de Cheché Abreu, Cruz recibió varias propuestas, pero finalmente ingresó a la orquesta de **Aníbal Bravo**, con quien trabajó aproximadamente ocho meses. Aunque no grabó producciones oficiales debido a compromisos previos con el sello discográfico Cubaney, sí interpretó en vivo algunos de sus temas anteriores y el merengue **“Melina”**, arreglado por Bravo.

## **Etapa con Wilfrido Vargas**

Posteriormente fue reclutado por **Wilfrido Vargas**, quien buscaba una voz capaz de manejar coros de alta exigencia tonal. Cruz permaneció tres años en la agrupación, donde:

- Grabó coros para la producción **El Jardinero**.  
- Interpretó varios temas que se convirtieron en éxitos, incluyendo:  
  - **“Lo ajeno se deja quieto”**  
  - **“Rompa todo el mundo”**  
  - **“El añoñaito”**  
  - **“Te olvidé”**  
- Viajó extensamente por Estados Unidos, Centroamérica y Sudamérica.   [Testigo.com.do](https://testigo.com.do/peter-cruz-estoy-listo-para-la-pelea/)

Aunque no fue el cantante oficial (rol ocupado por Ruby Pérez), su voz quedó registrada en múltiples producciones y coros fundamentales del repertorio de Wilfrido Vargas.

## **Fundación de la Orquesta Internacional**

En 1985, tras su salida de Wilfrido Vargas, Peter Cruz se unió a **Ramón Orlando** y **Henry García** para formar la **Orquesta Internacional**, bajo el sello Interdos. Esta agrupación reunió a músicos de alto nivel como:

- Joe Nicolás (bajo)  
- Crispín Fernández (saxofón)  
- Caqui Ruiz (saxofón)  
- Fermi Cruz (trompeta)  
- Marco Orlando (trombón)  

La Internacional se convirtió en una de las orquestas más influyentes de la década, y Cruz fue una de sus voces principales.

## **Éxitos con la Internacional**

Entre los temas más destacados interpretados por Peter Cruz se encuentran:

- **“Cometa Blanca”** – su mayor éxito y uno de los merengues más populares de los 80.  
- **“Tu mujer”**  
- **“El trovador”**  
- **“Cómo te atreves”**  
- **“Embrujado”**  

“Cometa Blanca” fue originalmente un tema del cantante español **Chiquetete**, descubierto por Cruz en Venezuela y adaptado al merengue por la Internacional. Su impacto abrió la puerta a la consolidación del proyecto.

## **Carrera como solista**

Tras su salida de la Internacional, Peter Cruz formó su propia agrupación, con la cual logró nuevos éxitos:

- **“Secretos”**  
- **“Mi tristeza es mía”**  
- **“Coqueta”**  
- **“El ganador”**  

Estos temas consolidaron su identidad como solista y lo posicionaron como uno de los merengueros más importantes de su generación.

## **Estilo musical**

Peter Cruz es reconocido por:

- una voz de timbre claro y alto,  
- dominio del merengue tradicional y de fusiones con son y salsa,  
- capacidad para interpretar tanto repertorio romántico como bailable,  
- presencia escénica sólida y adaptable a distintos formatos de orquesta.

Su estilo se convirtió en referencia para vocalistas de merengue de los años 80 y 90.

## **Salud y vida reciente**

En junio de 2019 sufrió un infarto que lo mantuvo hospitalizado en el hospital Milstein de la Universidad de Columbia, en Manhattan. Tras su recuperación, retomó su carrera y anunció nuevas producciones.

Ha continuado activo en presentaciones, entrevistas y proyectos musicales, manteniendo su presencia como figura histórica del merengue dominicano.

## **Legado**

Peter Cruz es considerado:

- una de las voces más emblemáticas del merengue de los años 80,  
- pieza clave en la historia de la Orquesta Internacional,  
- intérprete de uno de los merengues más influyentes del siglo XX (“Cometa Blanca”),  
- un referente vocal dentro del merengue tradicional y de orquesta.

Su trayectoria abarca colaboraciones con los directores más importantes del merengue y una carrera solista que dejó múltiples éxitos en la radio dominicana e internacional.',
       updated_at = now()
 WHERE slug = 'peter-cruz';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"**Pedro Antonio de la Cruz**, known professionally as **Peter Cruz**, is a Dominican merengue singer born in **Yamasá, Monte Plata, Dominican Republic**, and recognized as one of the emblematic voices of the genre during the 1980s. His work spans several of the most influential orchestras of the era, including **Cheché Abreu**, **Aníbal Bravo**, **","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"f8577536-3d61-462e-ae45-6c846140acaa"}},{"text":"**, and the **Orquesta Internacional**, where he became one of the principal vocalists. His interpretation of **“Cometa Blanca”** is considered one of the defining merengue hits of the decade and a signature piece of his career.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Early Life and Musical Beginnings**","type":"text"}]},{"type":"paragraph","content":[{"text":"Pedro Antonio de la Cruz was born and raised in Yamasá, a rural municipality in the province of Monte Plata. His early musical development took place in local ensembles, most notably **Caonabo y sus Muchachos**, where he began performing merengue while also cultivating an interest in boleros and romantic ballads.","type":"text"}]},{"type":"paragraph","content":[{"text":"Following his family’s relocation to Santo Domingo, Cruz gained access to the capital’s musical circuit. He joined a local orchestra as a **chorister**, occasionally performing boleros, which provided his first structured experience within a professional ensemble.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Professional Debut: Cheché Abreu**","type":"text"}]},{"type":"paragraph","content":[{"text":"Cruz’s first major professional opportunity came with **Cheché Abreu y sus Colosos**, one of the most active orchestras of the late 1970s. Under Abreu’s direction—known for strict discipline due to his background as a naval officer—Cruz developed the punctuality, rehearsal habits, and stage discipline that would shape his later career.","type":"text"}]},{"type":"paragraph","content":[{"text":"During this period, he recorded:","type":"text"}]},{"type":"paragraph","content":[{"text":"- **“Llegó la mañana”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Ay caray”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Entre espuma”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Tu ausencia”**  ","type":"text"},{"type":"hardBreak"},{"text":"- Various salsa tracks, as the orchestra performed both merengue and salsa.","type":"text"}]},{"type":"paragraph","content":[{"text":"He shared the front line with Pedro María (“El Profeta”) and Cheché Abreu himself, gaining visibility as a versatile vocalist.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Transition to Aníbal Bravo**","type":"text"}]},{"type":"paragraph","content":[{"text":"After leaving Cheché Abreu, Cruz received multiple informal offers from other orchestras but ultimately joined **Aníbal Bravo**. Although he did not record with Bravo due to contractual obligations with the Cubaney label, he performed live versions of his earlier merengues and the arrangement **“Melina”**, which he interpreted on television.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"5197db54-8ce9-410c-96b3-2095223b503c"}},{"text":" Era**","type":"text"}]},{"type":"paragraph","content":[{"text":"Cruz’s next major step was joining **","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"de80cd9f-8faf-4825-ac94-9cae27a9ed4d"}},{"text":"**, one of the most influential directors in Dominican merengue. Vargas recruited him specifically for his ability to handle **high‑timbre, high‑register coros**, which were essential to the group’s sound.","type":"text"}]},{"type":"paragraph","content":[{"text":"During his three‑year tenure, Cruz:","type":"text"}]},{"type":"paragraph","content":[{"text":"- Recorded coros for the album **El Jardinero**.  ","type":"text"},{"type":"hardBreak"},{"text":"- Participated in international tours across the United States, Central America, South America, and the Caribbean.  ","type":"text"},{"type":"hardBreak"},{"text":"- Recorded several tracks that became hits, including:  ","type":"text"},{"type":"hardBreak"},{"text":"  - **“Lo ajeno se deja quieto”**  ","type":"text"},{"type":"hardBreak"},{"text":"  - **“Rompa todo el mundo”**  ","type":"text"},{"type":"hardBreak"},{"text":"  - **“El añoñaito”**  ","type":"text"},{"type":"hardBreak"},{"text":"  - **“Te olvidé”**","type":"text"}]},{"type":"paragraph","content":[{"text":"Although Ruby Pérez was the official lead vocalist, Cruz’s voice is present throughout the group’s recordings and live arrangements of the period.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Formation of the Orquesta Internacional**","type":"text"}]},{"type":"paragraph","content":[{"text":"In 1985, Cruz became a founding member of the **Orquesta Internacional**, created under the Interdos corporate umbrella. The project assembled some of the most respected musicians in the country:","type":"text"}]},{"type":"paragraph","content":[{"text":"- **","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"6d8eea88-b067-48b6-a716-19b55cb58a6d"}},{"text":"** – musical director  ","type":"text"},{"type":"hardBreak"},{"text":"- **Joe Nicolás** – bass  ","type":"text"},{"type":"hardBreak"},{"text":"- **Crispín Fernández** – saxophone  ","type":"text"},{"type":"hardBreak"},{"text":"- **Caqui Ruiz** – saxophone  ","type":"text"},{"type":"hardBreak"},{"text":"- **Fermín Cruz** – trumpet  ","type":"text"},{"type":"hardBreak"},{"text":"- **Marco Orlando** – trombone  ","type":"text"}]},{"type":"paragraph","content":[{"text":"Cruz was one of the orchestra’s principal vocalists and contributed to its early identity and success.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Key Recordings**","type":"text"}]},{"type":"paragraph","content":[{"text":"His most notable recordings with the Internacional include:","type":"text"}]},{"type":"paragraph","content":[{"text":"- **“Cometa Blanca”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Tu mujer”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“El trovador”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Cómo te atreves”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Embrujado”**","type":"text"}]},{"type":"paragraph","content":[{"text":"**“Cometa Blanca”**—originally recorded by Spanish singer Chiquetete—became the orchestra’s breakthrough hit. Cruz discovered the song while touring in Venezuela, brought it to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"11d06959-40dd-4037-96bd-9d736b0f97bd"}},{"text":", and insisted on adapting it to merengue. The track became one of the most important merengues of the 1980s and a defining moment in Cruz’s career.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Solo Career**","type":"text"}]},{"type":"paragraph","content":[{"text":"After leaving the Internacional, Cruz established his own orchestra and released several successful singles, including:","type":"text"}]},{"type":"paragraph","content":[{"text":"- **“Secretos”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Mi tristeza es mía”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Coqueta”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“El ganador”**","type":"text"}]},{"type":"paragraph","content":[{"text":"These songs solidified his presence as a solo artist and expanded his repertoire beyond the orchestral format.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Musical Style**","type":"text"}]},{"type":"paragraph","content":[{"text":"Peter Cruz is known for:","type":"text"}]},{"type":"paragraph","content":[{"text":"- a clear, high‑timbre vocal tone,  ","type":"text"},{"type":"hardBreak"},{"text":"- strong command of merengue phrasing and rhythmic articulation,  ","type":"text"},{"type":"hardBreak"},{"text":"- versatility across merengue, son, salsa, and romantic repertoire,  ","type":"text"},{"type":"hardBreak"},{"text":"- adaptability to both ensemble and solo formats.","type":"text"}]},{"type":"paragraph","content":[{"text":"His vocal style became a reference point for merengue singers of the 1980s and 1990s.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Later Years and Health**","type":"text"}]},{"type":"paragraph","content":[{"text":"In June 2019, Cruz suffered a heart attack and was hospitalized at the Milstein Hospital of Columbia University in Manhattan. After recovering, he resumed musical activity and continued performing and recording.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Legacy**","type":"text"}]},{"type":"paragraph","content":[{"text":"Peter Cruz is regarded as:","type":"text"}]},{"type":"paragraph","content":[{"text":"- one of the essential voices of Dominican merengue’s golden era,  ","type":"text"},{"type":"hardBreak"},{"text":"- a foundational member of the Orquesta Internacional,  ","type":"text"},{"type":"hardBreak"},{"text":"- the interpreter of one of the most iconic merengues of the 1980s (“Cometa Blanca”),  ","type":"text"},{"type":"hardBreak"},{"text":"- a vocalist whose work spans several of the genre’s most influential orchestras.","type":"text"}]},{"type":"paragraph","content":[{"text":"His contributions remain central to the history of Dominican merengue and continue to influence new generations of musicians.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'peter-cruz'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"**Peter Cruz** (nacido en **Yamasá, provincia Monte Plata**, República Dominicana) es un cantante dominicano de merengue, reconocido por su participación en varias de las orquestas más influyentes del país durante las décadas de 1970 y 1980, y por su papel como una de las voces emblemáticas de la **Orquesta Internacional**. Su interpretación de **“Cometa Blanca”** se convirtió en uno de los éxitos más representativos del merengue de los años 80 y en su sello artístico más reconocido. Su trayectoria incluye colaboraciones con Cheché Abreu, Aníbal Bravo, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"c7c39f36-9191-433e-ac6f-1f2fe697cc67"}},{"text":" y posteriormente su propia agrupación.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Primeros años y formación**","type":"text"}]},{"type":"paragraph","content":[{"text":"Peter Cruz nació en Yamasá, un municipio de la provincia Monte Plata. Sus primeros pasos en la música se dieron en su pueblo natal, donde comenzó a cantar con el grupo local **Caonabo y sus muchachos**. Aunque interpretaba merengue en vivo, su inclinación inicial estaba orientada hacia **boleros y baladas**, géneros que formaron parte de su repertorio temprano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tras la mudanza familiar a Santo Domingo, Cruz tuvo contacto con agrupaciones de la capital y recibió su primera oportunidad profesional en una orquesta urbana, donde trabajó como corista e intérprete ocasional de boleros.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Carrera temprana: Cheché Abreu**","type":"text"}]},{"type":"paragraph","content":[{"text":"Su primera experiencia profesional de alto perfil fue con **Cheché Abreu y sus Colosos**, donde ingresó como corista y posteriormente como cantante de algunos temas. Entre 1978 y 1981 grabó merengues y también salsa, debido a que la orquesta tenía un formato híbrido.   ","type":"text"}]},{"type":"paragraph","content":[{"text":"Durante esta etapa:","type":"text"}]},{"type":"paragraph","content":[{"text":"- Adquirió disciplina profesional debido al estricto manejo de horarios del maestro Abreu.  ","type":"text"},{"type":"hardBreak"},{"text":"- Grabó temas como **“Llegó la mañana”**, **“Ay caray”**, **“Entre espuma”**, **“Tu ausencia”**, entre otros.  ","type":"text"},{"type":"hardBreak"},{"text":"- Compartió frente con Pedro María (“El Profeta”) y el propio Cheché Abreu.  ","type":"text"}]},{"type":"paragraph","content":[{"text":"Esta etapa marcó su entrada formal al circuito profesional del merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Paso por Aníbal Bravo**","type":"text"}]},{"type":"paragraph","content":[{"text":"Tras su salida de Cheché Abreu, Cruz recibió varias propuestas, pero finalmente ingresó a la orquesta de **Aníbal Bravo**, con quien trabajó aproximadamente ocho meses. Aunque no grabó producciones oficiales debido a compromisos previos con el sello discográfico Cubaney, sí interpretó en vivo algunos de sus temas anteriores y el merengue **“Melina”**, arreglado por Bravo.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Etapa con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"3195cacd-0cd1-48e7-abc6-ede4469c7927"}},{"text":"**","type":"text"}]},{"type":"paragraph","content":[{"text":"Posteriormente fue reclutado por **","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"f9df6100-63f3-45c8-a73f-6e979d01cf3d"}},{"text":"**, quien buscaba una voz capaz de manejar coros de alta exigencia tonal. Cruz permaneció tres años en la agrupación, donde:","type":"text"}]},{"type":"paragraph","content":[{"text":"- Grabó coros para la producción **El Jardinero**.  ","type":"text"},{"type":"hardBreak"},{"text":"- Interpretó varios temas que se convirtieron en éxitos, incluyendo:  ","type":"text"},{"type":"hardBreak"},{"text":"  - **“Lo ajeno se deja quieto”**  ","type":"text"},{"type":"hardBreak"},{"text":"  - **“Rompa todo el mundo”**  ","type":"text"},{"type":"hardBreak"},{"text":"  - **“El añoñaito”**  ","type":"text"},{"type":"hardBreak"},{"text":"  - **“Te olvidé”**  ","type":"text"},{"type":"hardBreak"},{"text":"- Viajó extensamente por Estados Unidos, Centroamérica y Sudamérica.   [Testigo.com.do](https://testigo.com.do/peter-cruz-estoy-listo-para-la-pelea/)","type":"text"}]},{"type":"paragraph","content":[{"text":"Aunque no fue el cantante oficial (rol ocupado por Ruby Pérez), su voz quedó registrada en múltiples producciones y coros fundamentales del repertorio de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"d123752f-07d0-4e2f-8a3a-223885c84a84"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Fundación de la Orquesta Internacional**","type":"text"}]},{"type":"paragraph","content":[{"text":"En 1985, tras su salida de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"0f114436-8a66-492b-948a-02c1cc9987d3"}},{"text":", Peter Cruz se unió a **","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"d6162485-354d-4e67-bb78-e6fc6dce2e3c"}},{"text":"** y **Henry García** para formar la **Orquesta Internacional**, bajo el sello Interdos. Esta agrupación reunió a músicos de alto nivel como:","type":"text"}]},{"type":"paragraph","content":[{"text":"- Joe Nicolás (bajo)  ","type":"text"},{"type":"hardBreak"},{"text":"- Crispín Fernández (saxofón)  ","type":"text"},{"type":"hardBreak"},{"text":"- Caqui Ruiz (saxofón)  ","type":"text"},{"type":"hardBreak"},{"text":"- Fermi Cruz (trompeta)  ","type":"text"},{"type":"hardBreak"},{"text":"- Marco Orlando (trombón)  ","type":"text"}]},{"type":"paragraph","content":[{"text":"La Internacional se convirtió en una de las orquestas más influyentes de la década, y Cruz fue una de sus voces principales.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Éxitos con la Internacional**","type":"text"}]},{"type":"paragraph","content":[{"text":"Entre los temas más destacados interpretados por Peter Cruz se encuentran:","type":"text"}]},{"type":"paragraph","content":[{"text":"- **“Cometa Blanca”** – su mayor éxito y uno de los merengues más populares de los 80.  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Tu mujer”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“El trovador”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Cómo te atreves”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Embrujado”**  ","type":"text"}]},{"type":"paragraph","content":[{"text":"“Cometa Blanca” fue originalmente un tema del cantante español **Chiquetete**, descubierto por Cruz en Venezuela y adaptado al merengue por la Internacional. Su impacto abrió la puerta a la consolidación del proyecto.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Carrera como solista**","type":"text"}]},{"type":"paragraph","content":[{"text":"Tras su salida de la Internacional, Peter Cruz formó su propia agrupación, con la cual logró nuevos éxitos:","type":"text"}]},{"type":"paragraph","content":[{"text":"- **“Secretos”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Mi tristeza es mía”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“Coqueta”**  ","type":"text"},{"type":"hardBreak"},{"text":"- **“El ganador”**  ","type":"text"}]},{"type":"paragraph","content":[{"text":"Estos temas consolidaron su identidad como solista y lo posicionaron como uno de los merengueros más importantes de su generación.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Estilo musical**","type":"text"}]},{"type":"paragraph","content":[{"text":"Peter Cruz es reconocido por:","type":"text"}]},{"type":"paragraph","content":[{"text":"- una voz de timbre claro y alto,  ","type":"text"},{"type":"hardBreak"},{"text":"- dominio del merengue tradicional y de fusiones con son y salsa,  ","type":"text"},{"type":"hardBreak"},{"text":"- capacidad para interpretar tanto repertorio romántico como bailable,  ","type":"text"},{"type":"hardBreak"},{"text":"- presencia escénica sólida y adaptable a distintos formatos de orquesta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su estilo se convirtió en referencia para vocalistas de merengue de los años 80 y 90.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Salud y vida reciente**","type":"text"}]},{"type":"paragraph","content":[{"text":"En junio de 2019 sufrió un infarto que lo mantuvo hospitalizado en el hospital Milstein de la Universidad de Columbia, en Manhattan. Tras su recuperación, retomó su carrera y anunció nuevas producciones.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ha continuado activo en presentaciones, entrevistas y proyectos musicales, manteniendo su presencia como figura histórica del merengue dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Legado**","type":"text"}]},{"type":"paragraph","content":[{"text":"Peter Cruz es considerado:","type":"text"}]},{"type":"paragraph","content":[{"text":"- una de las voces más emblemáticas del merengue de los años 80,  ","type":"text"},{"type":"hardBreak"},{"text":"- pieza clave en la historia de la Orquesta Internacional,  ","type":"text"},{"type":"hardBreak"},{"text":"- intérprete de uno de los merengues más influyentes del siglo XX (“Cometa Blanca”),  ","type":"text"},{"type":"hardBreak"},{"text":"- un referente vocal dentro del merengue tradicional y de orquesta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su trayectoria abarca colaboraciones con los directores más importantes del merengue y una carrera solista que dejó múltiples éxitos en la radio dominicana e internacional.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'peter-cruz'), 2)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), '11d06959-40dd-4037-96bd-9d736b0f97bd', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), '5197db54-8ce9-410c-96b3-2095223b503c', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), '6d8eea88-b067-48b6-a716-19b55cb58a6d', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), 'de80cd9f-8faf-4825-ac94-9cae27a9ed4d', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'en'), 'f8577536-3d61-462e-ae45-6c846140acaa', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), '0f114436-8a66-492b-948a-02c1cc9987d3', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), '3195cacd-0cd1-48e7-abc6-ede4469c7927', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), 'c7c39f36-9191-433e-ac6f-1f2fe697cc67', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), 'd123752f-07d0-4e2f-8a3a-223885c84a84', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), 'd6162485-354d-4e67-bb78-e6fc6dce2e3c', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'peter-cruz') AND locale = 'es'), 'f9df6100-63f3-45c8-a73f-6e979d01cf3d', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

COMMIT;
