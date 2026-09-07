BEGIN;

-- Reverts 20260907000400_rewrite_julito_deschamps_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Julito Deschamps',
       sort_name = NULL,
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
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = NULL,
       bio_en = '**Julito Deschamps** was a Dominican singer associated with bolero, romantic song, and the urban bohemian tradition of mid‑20th‑century Dominican music. His career developed primarily in nightclubs and boites in Santo Domingo and Santiago, where he became a representative figure of intimate bolero performance. His recordings circulated in the Dominican Republic and among Caribbean and Latin communities abroad, establishing him as a distinctive voice within Dominican romantic music.

## **Early Life and Background**

Public records do not document Julito Deschamps’ date of birth or early musical formation. His emergence in the Dominican musical scene is situated in the early 1950s, a period marked by the growth of orchestras, dance halls, and small urban venues that shaped the country’s nightlife and bolero culture.

## **Professional Beginnings**

Deschamps began his professional career as a singer with the **Papatín Ovalles Orchestra** in 1952, entering the circuit of dance orchestras active in Santo Domingo. His earliest known recording is the bolero **“Tu palabra y la mía”**, composed by Antonio Morel and released in 1960. This recording marked the beginning of a repertoire that he would continue to interpret throughout his career.

## **Artistic Development**

## **Nightclubs and Boites**

Most of Deschamps’ artistic activity took place in boites and nightclubs, venues characterized by small audiences and close‑range performances. These spaces were central to the dissemination of bolero in the Dominican Republic during the mid‑20th century, and they provided the setting in which Deschamps developed his interpretive style and built his reputation.

## **Repertoire**

His repertoire included works by Dominican and Latin American composers, among them:

- *Será muy fácil*  
- *Llorará por mí*  
- *Dos palabras*  
- *Negra soledad*  
- *Poquita fe*  
- *Háblame*  
- *Olvídate de mí*  
- *Torpeza*  
- *Cosas del alma*  
- *Tú, mi delirio*  
- *Como duele una traición*  

He also performed widely recognized boleros from the broader Latin American tradition, including *Sortilegio*, *La gloria eres tú*, *Evocación*, *Delirio*, *¿Cómo fue?*, *Miénteme*, *Tres palabras*, *Pecadora*, *Te necesito*, *Yo vivo mi vida*, and *Amor perdido*.

## **Collaborations**

Several of his studio recordings featured the saxophonist **Andrés De Jesús**, whose participation contributed to the characteristic sound of Deschamps’ recorded work.

## **Media Presence**

Unlike other performers of his era, Deschamps maintained limited media exposure. His career centered on live performance and studio recording, with minimal participation in television or large‑scale promotional circuits.

## **Musical Style**

Julito Deschamps’ work is situated within the bolero and romantic song tradition performed in urban Dominican settings between the 1950s and 1970s. His musical approach was characterized by:

- emphasis on vocal clarity,  
- selection of repertoire rooted in the Latin American bolero canon,  
- accompaniment typically based on small ensembles,  
- and performance contexts oriented toward intimate audiences rather than mass‑market stages.

His presence in boites and nightclubs positioned him within the Dominican bolero movement that flourished in mid‑century urban nightlife.

## **Death**

Julito Deschamps died on **13 November 1985** in Santo Domingo. His recordings continue to circulate among collectors, radio archives, and digital platforms, preserving his role in the development of Dominican bolero.

## **Legacy**

Julito Deschamps is regarded as a representative figure of Dominican bolero performed in small urban venues during the mid‑20th century. His repertoire, his sustained activity in boites, and his contribution to the diffusion of romantic song in the Dominican Republic place him within the historical framework of the country’s bolero tradition. Although documentation about his life is limited, surviving recordings and references in musical chronicles allow for his inclusion among notable contributors to Dominican romantic music.',
       bio_es = '**Julito Deschamps** fue un cantante dominicano asociado al bolero, la balada y la tradición bohemia urbana de mediados del siglo XX. Su carrera se desarrolló principalmente en boites y clubes nocturnos de la República Dominicana, donde se convirtió en una figura representativa del repertorio romántico interpretado en espacios íntimos. Su obra circuló en el país y en comunidades caribeñas y latinas en el extranjero, consolidándose como una voz distintiva dentro del bolero dominicano.

## **Primeros años y formación**

Los datos sobre los primeros años de Julito Deschamps son escasos y no existen registros públicos que documenten su fecha de nacimiento o formación musical inicial. Su aparición en la escena artística dominicana se sitúa a comienzos de la década de 1950, en un momento en que las orquestas bailables y los clubes nocturnos comenzaban a consolidarse como espacios centrales de la vida musical urbana.

## **Inicios profesionales**

Deschamps inició su trayectoria profesional como cantante en la **orquesta de Papatín Ovalles** en 1952, integrándose al circuito de agrupaciones que animaban salones y clubes de Santo Domingo. Su primera grabación conocida corresponde al bolero **“Tu palabra y la mía”**, de Antonio Morel, registrada en 1960. A partir de esta etapa comenzó a construir un repertorio que lo acompañaría durante toda su carrera.

## **Desarrollo artístico**

## **Boites y clubes nocturnos**

La mayor parte de la actividad artística de Deschamps se desarrolló en boites y clubes nocturnos de Santo Domingo y Santiago. Estos espacios, caracterizados por audiencias reducidas y presentaciones de formato íntimo, fueron el escenario principal donde interpretó boleros y canciones románticas que posteriormente se asociaron a su nombre.

## **Repertorio**

Su repertorio incluyó composiciones de autores dominicanos y latinoamericanos, entre ellas:

- *Será muy fácil*  
- *Llorará por mí*  
- *Dos palabras*  
- *Negra soledad*  
- *Poquita fe*  
- *Háblame*  
- *Olvídate de mí*  
- *Torpeza*  
- *Cosas del alma*  
- *Tú, mi delirio*  
- *Como duele una traición*  

También interpretó obras ampliamente difundidas en el bolero tradicional, como *Sortilegio*, *La gloria eres tú*, *Evocación*, *Delirio*, *¿Cómo fue?*, *Miénteme*, *Tres palabras*, *Pecadora*, *Te necesito*, *Yo vivo mi vida* y *Amor perdido*.

## **Colaboraciones**

En varias de sus grabaciones fue acompañado por el saxofonista **Andrés De Jesús**, cuya participación contribuyó a definir la sonoridad característica de sus interpretaciones en estudio.

## **Relación con los medios**

A diferencia de otros intérpretes de su época, Deschamps mantuvo una presencia pública limitada. Su actividad se concentró en presentaciones en vivo y grabaciones, sin participación frecuente en televisión ni en circuitos mediáticos de mayor alcance.

## **Estilo musical**

El estilo de Julito Deschamps se enmarca dentro del bolero y la canción romántica interpretada en contextos urbanos de mediados del siglo XX. Su enfoque se caracterizó por:

- interpretación centrada en la claridad vocal,  
- repertorio seleccionado dentro de la tradición del bolero latinoamericano,  
- acompañamiento instrumental reducido,  
- y presentaciones en espacios íntimos más que en escenarios masivos.

Su figura se asocia al desarrollo del bolero en la República Dominicana durante la transición entre las décadas de 1950 y 1970, periodo en el que los clubes nocturnos desempeñaron un papel importante en la difusión de este género.

## **Fallecimiento**

Julito Deschamps falleció el **13 de noviembre de 1985** en Santo Domingo. Su obra continúa presente en colecciones de melómanos y en grabaciones que circulan en medios digitales y archivos privados, manteniendo su relevancia dentro de la historia del bolero dominicano.

## **Legado**

Julito Deschamps es considerado una figura representativa del bolero interpretado en espacios urbanos de la República Dominicana. Su repertorio, su presencia en boites y su contribución a la difusión del bolero en el país lo sitúan como un referente dentro de la tradición romántica dominicana de mediados del siglo XX. Aunque su vida y obra no están ampliamente documentadas, las grabaciones disponibles y las referencias en crónicas musicales permiten situarlo como parte importante del desarrollo del bolero en el ámbito local.',
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
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"**Julito Deschamps** was a Dominican singer associated with bolero, romantic song, and the urban bohemian tradition of mid‑20th‑century Dominican music. His career developed primarily in nightclubs and boites in Santo Domingo and Santiago, where he became a representative figure of intimate bolero performance. His recordings circulated in the Dominican Republic and among Caribbean and Latin communities abroad, establishing him as a distinctive voice within Dominican romantic music.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Early Life and Background**","type":"text"}]},{"type":"paragraph","content":[{"text":"Public records do not document Julito Deschamps’ date of birth or early musical formation. His emergence in the Dominican musical scene is situated in the early 1950s, a period marked by the growth of orchestras, dance halls, and small urban venues that shaped the country’s nightlife and bolero culture.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Professional Beginnings**","type":"text"}]},{"type":"paragraph","content":[{"text":"Deschamps began his professional career as a singer with the **Papatín Ovalles Orchestra** in 1952, entering the circuit of dance orchestras active in Santo Domingo. His earliest known recording is the bolero **“Tu palabra y la mía”**, composed by Antonio Morel and released in 1960. This recording marked the beginning of a repertoire that he would continue to interpret throughout his career.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Artistic Development**","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Nightclubs and Boites**","type":"text"}]},{"type":"paragraph","content":[{"text":"Most of Deschamps’ artistic activity took place in boites and nightclubs, venues characterized by small audiences and close‑range performances. These spaces were central to the dissemination of bolero in the Dominican Republic during the mid‑20th century, and they provided the setting in which Deschamps developed his interpretive style and built his reputation.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Repertoire**","type":"text"}]},{"type":"paragraph","content":[{"text":"His repertoire included works by Dominican and Latin American composers, among them:","type":"text"}]},{"type":"paragraph","content":[{"text":"- *Será muy fácil*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Llorará por mí*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Dos palabras*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Negra soledad*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Poquita fe*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Háblame*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Olvídate de mí*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Torpeza*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Cosas del alma*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Tú, mi delirio*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Como duele una traición*  ","type":"text"}]},{"type":"paragraph","content":[{"text":"He also performed widely recognized boleros from the broader Latin American tradition, including *Sortilegio*, *La gloria eres tú*, *Evocación*, *Delirio*, *¿Cómo fue?*, *Miénteme*, *Tres palabras*, *Pecadora*, *Te necesito*, *Yo vivo mi vida*, and *Amor perdido*.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Collaborations**","type":"text"}]},{"type":"paragraph","content":[{"text":"Several of his studio recordings featured the saxophonist **Andrés De Jesús**, whose participation contributed to the characteristic sound of Deschamps’ recorded work.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Media Presence**","type":"text"}]},{"type":"paragraph","content":[{"text":"Unlike other performers of his era, Deschamps maintained limited media exposure. His career centered on live performance and studio recording, with minimal participation in television or large‑scale promotional circuits.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Musical Style**","type":"text"}]},{"type":"paragraph","content":[{"text":"Julito Deschamps’ work is situated within the bolero and romantic song tradition performed in urban Dominican settings between the 1950s and 1970s. His musical approach was characterized by:","type":"text"}]},{"type":"paragraph","content":[{"text":"- emphasis on vocal clarity,  ","type":"text"},{"type":"hardBreak"},{"text":"- selection of repertoire rooted in the Latin American bolero canon,  ","type":"text"},{"type":"hardBreak"},{"text":"- accompaniment typically based on small ensembles,  ","type":"text"},{"type":"hardBreak"},{"text":"- and performance contexts oriented toward intimate audiences rather than mass‑market stages.","type":"text"}]},{"type":"paragraph","content":[{"text":"His presence in boites and nightclubs positioned him within the Dominican bolero movement that flourished in mid‑century urban nightlife.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Death**","type":"text"}]},{"type":"paragraph","content":[{"text":"Julito Deschamps died on **13 November 1985** in Santo Domingo. His recordings continue to circulate among collectors, radio archives, and digital platforms, preserving his role in the development of Dominican bolero.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Legacy**","type":"text"}]},{"type":"paragraph","content":[{"text":"Julito Deschamps is regarded as a representative figure of Dominican bolero performed in small urban venues during the mid‑20th century. His repertoire, his sustained activity in boites, and his contribution to the diffusion of romantic song in the Dominican Republic place him within the historical framework of the country’s bolero tradition. Although documentation about his life is limited, surviving recordings and references in musical chronicles allow for his inclusion among notable contributors to Dominican romantic music.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'julito-deschamps'), 1)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"**Julito Deschamps** fue un cantante dominicano asociado al bolero, la balada y la tradición bohemia urbana de mediados del siglo XX. Su carrera se desarrolló principalmente en boites y clubes nocturnos de la República Dominicana, donde se convirtió en una figura representativa del repertorio romántico interpretado en espacios íntimos. Su obra circuló en el país y en comunidades caribeñas y latinas en el extranjero, consolidándose como una voz distintiva dentro del bolero dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Primeros años y formación**","type":"text"}]},{"type":"paragraph","content":[{"text":"Los datos sobre los primeros años de Julito Deschamps son escasos y no existen registros públicos que documenten su fecha de nacimiento o formación musical inicial. Su aparición en la escena artística dominicana se sitúa a comienzos de la década de 1950, en un momento en que las orquestas bailables y los clubes nocturnos comenzaban a consolidarse como espacios centrales de la vida musical urbana.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Inicios profesionales**","type":"text"}]},{"type":"paragraph","content":[{"text":"Deschamps inició su trayectoria profesional como cantante en la **orquesta de Papatín Ovalles** en 1952, integrándose al circuito de agrupaciones que animaban salones y clubes de Santo Domingo. Su primera grabación conocida corresponde al bolero **“Tu palabra y la mía”**, de Antonio Morel, registrada en 1960. A partir de esta etapa comenzó a construir un repertorio que lo acompañaría durante toda su carrera.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Desarrollo artístico**","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Boites y clubes nocturnos**","type":"text"}]},{"type":"paragraph","content":[{"text":"La mayor parte de la actividad artística de Deschamps se desarrolló en boites y clubes nocturnos de Santo Domingo y Santiago. Estos espacios, caracterizados por audiencias reducidas y presentaciones de formato íntimo, fueron el escenario principal donde interpretó boleros y canciones románticas que posteriormente se asociaron a su nombre.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Repertorio**","type":"text"}]},{"type":"paragraph","content":[{"text":"Su repertorio incluyó composiciones de autores dominicanos y latinoamericanos, entre ellas:","type":"text"}]},{"type":"paragraph","content":[{"text":"- *Será muy fácil*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Llorará por mí*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Dos palabras*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Negra soledad*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Poquita fe*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Háblame*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Olvídate de mí*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Torpeza*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Cosas del alma*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Tú, mi delirio*  ","type":"text"},{"type":"hardBreak"},{"text":"- *Como duele una traición*  ","type":"text"}]},{"type":"paragraph","content":[{"text":"También interpretó obras ampliamente difundidas en el bolero tradicional, como *Sortilegio*, *La gloria eres tú*, *Evocación*, *Delirio*, *¿Cómo fue?*, *Miénteme*, *Tres palabras*, *Pecadora*, *Te necesito*, *Yo vivo mi vida* y *Amor perdido*.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Colaboraciones**","type":"text"}]},{"type":"paragraph","content":[{"text":"En varias de sus grabaciones fue acompañado por el saxofonista **Andrés De Jesús**, cuya participación contribuyó a definir la sonoridad característica de sus interpretaciones en estudio.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Relación con los medios**","type":"text"}]},{"type":"paragraph","content":[{"text":"A diferencia de otros intérpretes de su época, Deschamps mantuvo una presencia pública limitada. Su actividad se concentró en presentaciones en vivo y grabaciones, sin participación frecuente en televisión ni en circuitos mediáticos de mayor alcance.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Estilo musical**","type":"text"}]},{"type":"paragraph","content":[{"text":"El estilo de Julito Deschamps se enmarca dentro del bolero y la canción romántica interpretada en contextos urbanos de mediados del siglo XX. Su enfoque se caracterizó por:","type":"text"}]},{"type":"paragraph","content":[{"text":"- interpretación centrada en la claridad vocal,  ","type":"text"},{"type":"hardBreak"},{"text":"- repertorio seleccionado dentro de la tradición del bolero latinoamericano,  ","type":"text"},{"type":"hardBreak"},{"text":"- acompañamiento instrumental reducido,  ","type":"text"},{"type":"hardBreak"},{"text":"- y presentaciones en espacios íntimos más que en escenarios masivos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su figura se asocia al desarrollo del bolero en la República Dominicana durante la transición entre las décadas de 1950 y 1970, periodo en el que los clubes nocturnos desempeñaron un papel importante en la difusión de este género.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Fallecimiento**","type":"text"}]},{"type":"paragraph","content":[{"text":"Julito Deschamps falleció el **13 de noviembre de 1985** en Santo Domingo. Su obra continúa presente en colecciones de melómanos y en grabaciones que circulan en medios digitales y archivos privados, manteniendo su relevancia dentro de la historia del bolero dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Legado**","type":"text"}]},{"type":"paragraph","content":[{"text":"Julito Deschamps es considerado una figura representativa del bolero interpretado en espacios urbanos de la República Dominicana. Su repertorio, su presencia en boites y su contribución a la difusión del bolero en el país lo sitúan como un referente dentro de la tradición romántica dominicana de mediados del siglo XX. Aunque su vida y obra no están ampliamente documentadas, las grabaciones disponibles y las referencias en crónicas musicales permiten situarlo como parte importante del desarrollo del bolero en el ámbito local.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'julito-deschamps'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
