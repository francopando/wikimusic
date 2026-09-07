BEGIN;

-- Wilfrido Vargas — biography rewrite to EDITORIAL_BIOGRAPHY_FORMAT, both locales.
--
-- The stored documents predated the format spec and violated it structurally:
-- section titles were literal text nodes reading "## **Title**" rather than
-- paragraphs holding a single bold text node, the bullet lists were paragraphs
-- of "- item" strings joined by hardBreaks rather than bulletList/listItem
-- blocks, and the prose carried inline bold ("**Wilfrido Radhamés Vargas
-- Martínez**", "**El Barbarazo** (1978)", "**Madison Square Garden**") that
-- Rule 1 forbids. The legacy markdown mirrors carried the same markup.
--
-- Both documents also held artistReference nodes with no matching rows in
-- editorial_entity_references — six orphaned references, a blocking finding
-- under src/lib/editorial/integrity.ts. This migration deletes and reinserts
-- the relation rows so every node has exactly one.
--
-- Enrichment added in this pass, each corroborated by at least two sources:
--   * Musical Excellence Award, Latin Recording Academy, 2018 — presented by
--     Johnny Ventura (LatinGRAMMY.com; Diario Libre; El Caribe).
--   * Grammy nomination, Best Tropical Latin Performance, 1991, for Animation.
--   * Order of Christopher Columbus, Knight grade, 1993, from President
--     Joaquín Balaguer.
--   * Dates attached to the previously undated hit list: Abusadora (1981),
--     El Africano (1984), El Jardinero (1984), La Medicina (1985) and
--     El Baile del Perrito (1989, from the album Itinerario).
--   * Rubby Pérez's tenure with the Beduinos, 1982-1987, and the origin of
--     Volveré, first intended for Jorge Gómez (El Día; Listín Diario).
--
-- Artist references raised from 3 orphaned nodes to 8 linked ones per locale,
-- now covering Johnny Ventura, Víctor Víctor, Rubby Pérez, Las Chicas del Can,
-- The New York Band and Altamira Banda Show — all published catalog records.
--
-- Deliberately NOT recorded: the March 2024 hospitalisation for pneumonia and
-- influenza A. It was widely reported and he was discharged within the week,
-- but a short illness is not a career fact and the entry is better without it.
-- Also left out: the claim that El Baile del Perrito answered a Juan Luis
-- Guerra melody, which appears in entertainment press without any supporting
-- detail and is corroborated nowhere.
--
-- Revision moves 2 -> 3 on both documents, per the never-reuse rule.


-- ---------------------------------------------------------------------------
-- English document. The Spanish text is an independent piece of writing,
-- not a translation of the English.
-- ---------------------------------------------------------------------------
UPDATE editorial_documents
SET document = $json${"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Wilfrido Radhamés Vargas Martínez (born 24 April 1949) is a Dominican trumpeter, bandleader, composer, arranger and producer, and one of the principal architects of modern merengue. Where earlier bandleaders modernised the genre at home, Vargas built the orchestra that carried it abroad: he absorbed Haitian kompa and other Afro-Antillean currents into its rhythmic language, staged merengue as choreographed spectacle, and founded a run of ensembles and launched a run of singers that together defined the genre's commercial peak in the 1980s. The Latin Recording Academy gave him its Musical Excellence Award in 2018."}]},{"type":"paragraph","content":[{"type":"text","text":"Early years and formation","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Vargas was born in Altamira, a rural municipality in the province of Puerto Plata. Music at home came from both parents: his mother, Bienvenida Martínez, played guitar and flute, and his father, Ramón Vargas, was an accordionist and guitarist. At ten he entered the municipal academy of music in Altamira, where he studied solfège and theory. He started on guitar but moved quickly to the trumpet, and by eleven was the municipal band's principal trumpeter, an unusual chair for a boy of that age and an early measure of his technique."}]},{"type":"paragraph","content":[{"type":"text","text":"As an adolescent he worked as a postal carrier alongside his playing, the two jobs together a fair measure of what a rural musician could earn in the Dominican Republic at mid-century. When administrative changes cost him both, he left for Santo Domingo."}]},{"type":"paragraph","content":[{"type":"text","text":"Professional beginnings in Santo Domingo","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"In the capital he entered the working circuit of bars, theatres and merengue ensembles: Bar Herminia, where he made his professional debut on trumpet, the Teatro Stella, and then the orchestras of Paniagua Rodríguez and Rafael Mancebo. These were traditional groups playing the format that prevailed before the modernisation Vargas would help drive, and they earned him a reputation as a trumpeter equally capable in section work and as a soloist."}]},{"type":"paragraph","content":[{"type":"text","text":"Wilfrido Vargas y sus Beduinos","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"In 1972 he founded Wilfrido Vargas y sus Beduinos and recorded his first album with them. The group turned him from instrumentalist into bandleader and became the laboratory for everything that followed: enlarged brass, choreographed staging, and rhythmic structures borrowed from across the Caribbean. It was also a training ground — "},{"type":"artistReference","attrs":{"occurrenceId":"381e57b1-d028-453c-b9d7-3dbc1fa159f1","artistId":"4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3","displayText":"Víctor Víctor"}},{"type":"text","text":" was among the singers who passed through it in the early years."}]},{"type":"paragraph","content":[{"type":"text","text":"Haitian kompa and the remaking of merengue","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"The decisive turn in Vargas's writing came through Haitian kompa, and particularly through Tabou Combo and DP Express. Their rhythmic and harmonic thinking reshaped his approach to merengue and pushed him to fold Afro-Antillean material into Dominican dance music systematically rather than as ornament. The orchestral sound that resulted was built on syncopated rhythmic layering, polyphonic vocal arrangements, hybrid horn writing, kompa-derived harmonic movement, and a theatrical, choreographed stage presentation."}]},{"type":"paragraph","content":[{"type":"text","text":"The work ran parallel to the earlier modernisation of merengue by "},{"type":"artistReference","attrs":{"occurrenceId":"77335bfe-c2c4-4b51-b5bf-dd8eea8b7493","artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura"}},{"type":"text","text":", but it was not the same project. Ventura brought showmanship and a widened instrumentation to a national audience; Vargas brought cross-currents from outside the country, and a sound engineered to travel."}]},{"type":"paragraph","content":[{"type":"text","text":"International expansion","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"From the late 1970s Vargas was among the most visible Dominican artists working abroad. His appearances included Madison Square Garden in 1976, the Havana Jam festival in Cuba in 1979, and Altos de Chavón, where his was the first Dominican orchestra to fill the amphitheatre, alongside touring through Europe, Mexico, South America and the United States. The records of this period paired intricate arrangements with humour and narrative dramatisation, and they did much to make merengue a dominant dance music across Latin America."}]},{"type":"paragraph","content":[{"type":"text","text":"Major recordings","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Barbarazo — 1978, his first international hit"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Abusadora — 1981"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Africano — 1984"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Jardinero — 1984"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"La Medicina — 1985"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Baile del Perrito — 1989, from the album Itinerario"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Comején, A Mover la Colita, El Loco y la Luna and Volveré, all of which remain in the merengue canon"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Ensembles he created and directed","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Beyond his own orchestra, Vargas founded and directed groups that widened what merengue could be:"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"artistReference","attrs":{"occurrenceId":"f35e7027-cb02-48a7-816c-c30d968a47ab","artistId":"6778e4a3-8f63-420f-bdd4-9a0a7e5cacc5","displayText":"Las Chicas del Can"}},{"type":"text","text":" — among the first women's merengue groups to succeed internationally"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"artistReference","attrs":{"occurrenceId":"95fc7795-8e20-46f6-bed8-2b1ff3d13c17","artistId":"2dde2335-84c3-49ba-be43-f3c3ae717d87","displayText":"The New York Band"}},{"type":"text","text":" — merengue crossed with pop, rock and urban material"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"artistReference","attrs":{"occurrenceId":"c6d48718-fdbf-4f81-865a-d86568a2f735","artistId":"e735658a-0cc6-4238-9cf9-e5bebad6724b","displayText":"Altamira Banda Show"}},{"type":"text","text":" — built around theatrical staging and choreography"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"The singers he trained","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Vargas's orchestras were the way into the profession for a generation of Dominican vocalists. "},{"type":"artistReference","attrs":{"occurrenceId":"0ab9fdf6-61d3-439e-8548-35c370eaf87d","artistId":"cff70c92-8632-4c66-b5a0-81622c8128b0","displayText":"Rubby Pérez"}},{"type":"text","text":" sang with the Beduinos from 1982 to 1987, and his recording of Volveré — a song that had first been intended for another singer in the group, Jorge Gómez — became one of the orchestra's largest successes and established him as a soloist. Eddie Herrera, Juancho Viloria and "},{"type":"artistReference","attrs":{"occurrenceId":"9ff264ee-f1e7-4079-b4ea-b2018b4bd0c0","artistId":"4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3","displayText":"Víctor Víctor"}},{"type":"text","text":" also came up through the ensembles. What shaped them was Vargas's rehearsal discipline, his insistence on vocal precision and his ear, and the standard he set became a working model for professional merengue orchestras."}]},{"type":"paragraph","content":[{"type":"text","text":"Recognition","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Order of Christopher Columbus, Knight grade — conferred in 1993 by President Joaquín Balaguer"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Grammy nomination, Best Tropical Latin Performance — 1991, for Animation"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Musical Excellence Award, Latin Recording Academy — 2018, presented to him by "},{"type":"artistReference","attrs":{"occurrenceId":"e6ec9a9f-a3ef-48fb-a005-d1e563c9b281","artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura"}}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Gold and platinum certifications across five decades of releases"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Legacy","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Vargas is one of the figures the modern history of merengue cannot be written without. He rebuilt the orchestra, opened the genre to Afro-Antillean influence, created the ensembles that carried it into new markets, and trained many of the voices that sang it. The transformation of merengue from a national music into a transnational one was not his work alone, but it is not describable without him, and his catalogue remains a standing reference in Caribbean music."}]}]}$json$::jsonb,
    revision = 3,
    updated_at = now()
WHERE id = 'bca898c8-2574-4e08-9ebf-e1803f587af0'
  AND owner_artist_id = '2bc36959-dcce-4e10-9ecf-2cd418eaa489'
  AND locale = 'en';

DELETE FROM editorial_entity_references WHERE editorial_document_id = 'bca898c8-2574-4e08-9ebf-e1803f587af0';

INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('bca898c8-2574-4e08-9ebf-e1803f587af0', '381e57b1-d028-453c-b9d7-3dbc1fa159f1', 'artist', '4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3');  -- Víctor Víctor
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('bca898c8-2574-4e08-9ebf-e1803f587af0', '77335bfe-c2c4-4b51-b5bf-dd8eea8b7493', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');  -- Johnny Ventura
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('bca898c8-2574-4e08-9ebf-e1803f587af0', 'f35e7027-cb02-48a7-816c-c30d968a47ab', 'artist', '6778e4a3-8f63-420f-bdd4-9a0a7e5cacc5');  -- Las Chicas del Can
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('bca898c8-2574-4e08-9ebf-e1803f587af0', '95fc7795-8e20-46f6-bed8-2b1ff3d13c17', 'artist', '2dde2335-84c3-49ba-be43-f3c3ae717d87');  -- The New York Band
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('bca898c8-2574-4e08-9ebf-e1803f587af0', 'c6d48718-fdbf-4f81-865a-d86568a2f735', 'artist', 'e735658a-0cc6-4238-9cf9-e5bebad6724b');  -- Altamira Banda Show
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('bca898c8-2574-4e08-9ebf-e1803f587af0', '0ab9fdf6-61d3-439e-8548-35c370eaf87d', 'artist', 'cff70c92-8632-4c66-b5a0-81622c8128b0');  -- Rubby Pérez
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('bca898c8-2574-4e08-9ebf-e1803f587af0', '9ff264ee-f1e7-4079-b4ea-b2018b4bd0c0', 'artist', '4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3');  -- Víctor Víctor
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('bca898c8-2574-4e08-9ebf-e1803f587af0', 'e6ec9a9f-a3ef-48fb-a005-d1e563c9b281', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');  -- Johnny Ventura

-- Legacy markdown mirror: section titles as **Title** on their own line,
-- bullets as "- item" separated by two spaces + newline, artistReference
-- flattened to its displayText. Not the plain-text flattening of the document.
UPDATE artists
SET bio_en = $sql$Wilfrido Radhamés Vargas Martínez (born 24 April 1949) is a Dominican trumpeter, bandleader, composer, arranger and producer, and one of the principal architects of modern merengue. Where earlier bandleaders modernised the genre at home, Vargas built the orchestra that carried it abroad: he absorbed Haitian kompa and other Afro-Antillean currents into its rhythmic language, staged merengue as choreographed spectacle, and founded a run of ensembles and launched a run of singers that together defined the genre's commercial peak in the 1980s. The Latin Recording Academy gave him its Musical Excellence Award in 2018.

**Early years and formation**

Vargas was born in Altamira, a rural municipality in the province of Puerto Plata. Music at home came from both parents: his mother, Bienvenida Martínez, played guitar and flute, and his father, Ramón Vargas, was an accordionist and guitarist. At ten he entered the municipal academy of music in Altamira, where he studied solfège and theory. He started on guitar but moved quickly to the trumpet, and by eleven was the municipal band's principal trumpeter, an unusual chair for a boy of that age and an early measure of his technique.

As an adolescent he worked as a postal carrier alongside his playing, the two jobs together a fair measure of what a rural musician could earn in the Dominican Republic at mid-century. When administrative changes cost him both, he left for Santo Domingo.

**Professional beginnings in Santo Domingo**

In the capital he entered the working circuit of bars, theatres and merengue ensembles: Bar Herminia, where he made his professional debut on trumpet, the Teatro Stella, and then the orchestras of Paniagua Rodríguez and Rafael Mancebo. These were traditional groups playing the format that prevailed before the modernisation Vargas would help drive, and they earned him a reputation as a trumpeter equally capable in section work and as a soloist.

**Wilfrido Vargas y sus Beduinos**

In 1972 he founded Wilfrido Vargas y sus Beduinos and recorded his first album with them. The group turned him from instrumentalist into bandleader and became the laboratory for everything that followed: enlarged brass, choreographed staging, and rhythmic structures borrowed from across the Caribbean. It was also a training ground — Víctor Víctor was among the singers who passed through it in the early years.

**Haitian kompa and the remaking of merengue**

The decisive turn in Vargas's writing came through Haitian kompa, and particularly through Tabou Combo and DP Express. Their rhythmic and harmonic thinking reshaped his approach to merengue and pushed him to fold Afro-Antillean material into Dominican dance music systematically rather than as ornament. The orchestral sound that resulted was built on syncopated rhythmic layering, polyphonic vocal arrangements, hybrid horn writing, kompa-derived harmonic movement, and a theatrical, choreographed stage presentation.

The work ran parallel to the earlier modernisation of merengue by Johnny Ventura, but it was not the same project. Ventura brought showmanship and a widened instrumentation to a national audience; Vargas brought cross-currents from outside the country, and a sound engineered to travel.

**International expansion**

From the late 1970s Vargas was among the most visible Dominican artists working abroad. His appearances included Madison Square Garden in 1976, the Havana Jam festival in Cuba in 1979, and Altos de Chavón, where his was the first Dominican orchestra to fill the amphitheatre, alongside touring through Europe, Mexico, South America and the United States. The records of this period paired intricate arrangements with humour and narrative dramatisation, and they did much to make merengue a dominant dance music across Latin America.

**Major recordings**

- El Barbarazo — 1978, his first international hit  
- Abusadora — 1981  
- El Africano — 1984  
- El Jardinero — 1984  
- La Medicina — 1985  
- El Baile del Perrito — 1989, from the album Itinerario  
- Comején, A Mover la Colita, El Loco y la Luna and Volveré, all of which remain in the merengue canon

**Ensembles he created and directed**

Beyond his own orchestra, Vargas founded and directed groups that widened what merengue could be:

- Las Chicas del Can — among the first women's merengue groups to succeed internationally  
- The New York Band — merengue crossed with pop, rock and urban material  
- Altamira Banda Show — built around theatrical staging and choreography

**The singers he trained**

Vargas's orchestras were the way into the profession for a generation of Dominican vocalists. Rubby Pérez sang with the Beduinos from 1982 to 1987, and his recording of Volveré — a song that had first been intended for another singer in the group, Jorge Gómez — became one of the orchestra's largest successes and established him as a soloist. Eddie Herrera, Juancho Viloria and Víctor Víctor also came up through the ensembles. What shaped them was Vargas's rehearsal discipline, his insistence on vocal precision and his ear, and the standard he set became a working model for professional merengue orchestras.

**Recognition**

- Order of Christopher Columbus, Knight grade — conferred in 1993 by President Joaquín Balaguer  
- Grammy nomination, Best Tropical Latin Performance — 1991, for Animation  
- Musical Excellence Award, Latin Recording Academy — 2018, presented to him by Johnny Ventura  
- Gold and platinum certifications across five decades of releases

**Legacy**

Vargas is one of the figures the modern history of merengue cannot be written without. He rebuilt the orchestra, opened the genre to Afro-Antillean influence, created the ensembles that carried it into new markets, and trained many of the voices that sang it. The transformation of merengue from a national music into a transnational one was not his work alone, but it is not describable without him, and his catalogue remains a standing reference in Caribbean music.$sql$,
    updated_at = now()
WHERE id = '2bc36959-dcce-4e10-9ecf-2cd418eaa489';


-- ---------------------------------------------------------------------------
-- Spanish document. The Spanish text is an independent piece of writing,
-- not a translation of the English.
-- ---------------------------------------------------------------------------
UPDATE editorial_documents
SET document = $json${"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Wilfrido Radhamés Vargas Martínez (Altamira, Puerto Plata; 24 de abril de 1949) es un trompetista, director de orquesta, compositor, arreglista y productor dominicano, y uno de los arquitectos del merengue moderno. Su aporte no fue solamente componer éxitos: rehízo la orquesta de merengue como espectáculo de gira, incorporó el kompa haitiano y otras corrientes afroantillanas a su lenguaje rítmico, y fundó agrupaciones y formó cantantes que entre todos definieron el momento de mayor alcance comercial del género en los años ochenta. En 2018 la Academia Latina de la Grabación le otorgó el Premio a la Excelencia Musical."}]},{"type":"paragraph","content":[{"type":"text","text":"Primeros años y formación","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Vargas nació en Altamira, municipio rural de la provincia de Puerto Plata. La música le llegó por ambos lados de la casa: su madre, Bienvenida Martínez, tocaba guitarra y flauta, y su padre, Ramón Vargas, era acordeonista y guitarrista. A los diez años entró a la academia municipal de música de Altamira, donde estudió solfeo y teoría. Empezó con la guitarra, pero pasó pronto a la trompeta, y a los once ocupaba la trompeta prima de la banda municipal, una posición poco común para un niño de esa edad y una primera medida de su capacidad técnica."}]},{"type":"paragraph","content":[{"type":"text","text":"En la adolescencia combinó la música con un empleo de cartero, y los dos oficios juntos dan la medida de lo que podía ganar un músico rural en la República Dominicana de mediados del siglo XX. Cuando cambios administrativos le costaron ambos, se marchó a Santo Domingo."}]},{"type":"paragraph","content":[{"type":"text","text":"Inicios profesionales en Santo Domingo","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"En la capital se integró al circuito de bares, teatros y agrupaciones de merengue: el Bar Herminia, donde debutó profesionalmente como trompetista, el Teatro Stella, y después las orquestas de Paniagua Rodríguez y Rafael Mancebo. Eran conjuntos del merengue tradicional, anteriores a la modernización que él mismo ayudaría a empujar, y en ellos se hizo de una reputación como trompetista solvente tanto en la sección como en el solo."}]},{"type":"paragraph","content":[{"type":"text","text":"Wilfrido Vargas y sus Beduinos","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"En 1972 fundó Wilfrido Vargas y sus Beduinos y grabó con ellos su primer álbum. La agrupación lo convirtió de instrumentista en director y funcionó como laboratorio de lo que vendría después: metales ampliados, puesta en escena coreografiada y estructuras rítmicas tomadas de todo el Caribe. Fue también una escuela: por ella pasó "},{"type":"artistReference","attrs":{"occurrenceId":"fb3bcb65-705f-4c52-8208-bb21d223d001","artistId":"4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3","displayText":"Víctor Víctor"}},{"type":"text","text":" entre los vocalistas de los primeros años."}]},{"type":"paragraph","content":[{"type":"text","text":"El kompa haitiano y la transformación del merengue","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"El giro decisivo de su escritura vino del kompa haitiano, y en particular de Tabou Combo y DP Express. Su manera de pensar el ritmo y la armonía le reordenó el enfoque del merengue y lo llevó a incorporar material afroantillano de forma sistemática, no como adorno. El sonido orquestal que salió de ahí se sostiene en la superposición rítmica sincopada, los coros polifónicos, una escritura híbrida de metales, progresiones armónicas derivadas del kompa y una presentación escénica teatral y coreografiada."}]},{"type":"paragraph","content":[{"type":"text","text":"El trabajo corrió en paralelo a la modernización que había iniciado "},{"type":"artistReference","attrs":{"occurrenceId":"5e118521-896f-44e4-99fe-fd13468650f8","artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura"}},{"type":"text","text":", pero no era el mismo proyecto. Ventura aportó espectáculo e instrumentación ampliada para el público nacional; Vargas aportó corrientes de fuera del país y un sonido pensado para viajar."}]},{"type":"paragraph","content":[{"type":"text","text":"Proyección internacional","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Desde finales de los años setenta Vargas fue de los artistas dominicanos más visibles fuera del país. Entre sus presentaciones están el Madison Square Garden en 1976, el festival Havana Jam en Cuba en 1979 y Altos de Chavón, donde la suya fue la primera orquesta dominicana en llenar el anfiteatro, además de giras por Europa, México, Suramérica y Estados Unidos. Los discos de esa etapa combinan arreglos de alta complejidad con humor y dramatización narrativa, y contribuyeron a que el merengue se volviera música de baile dominante en América Latina."}]},{"type":"paragraph","content":[{"type":"text","text":"Grabaciones principales","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Barbarazo — 1978, su primer éxito internacional"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Abusadora — 1981"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Africano — 1984"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Jardinero — 1984"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"La Medicina — 1985"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Baile del Perrito — 1989, del álbum Itinerario"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Comején, A Mover la Colita, El Loco y la Luna y Volveré, todas vigentes en el repertorio del merengue"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Agrupaciones que creó y dirigió","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Además de su propia orquesta, Vargas fundó y dirigió agrupaciones que ampliaron lo que el merengue podía ser:"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"artistReference","attrs":{"occurrenceId":"2fdc3a42-b879-4eb7-ace5-a837982344ab","artistId":"6778e4a3-8f63-420f-bdd4-9a0a7e5cacc5","displayText":"Las Chicas del Can"}},{"type":"text","text":" — de las primeras agrupaciones femeninas de merengue en triunfar internacionalmente"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"artistReference","attrs":{"occurrenceId":"e1e1b26d-0b4d-415b-83a4-3a1fba8bc0ed","artistId":"2dde2335-84c3-49ba-be43-f3c3ae717d87","displayText":"The New York Band"}},{"type":"text","text":" — merengue cruzado con pop, rock y material urbano"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"artistReference","attrs":{"occurrenceId":"9cb89769-82c8-4789-975a-4dd4d929df24","artistId":"e735658a-0cc6-4238-9cf9-e5bebad6724b","displayText":"Altamira Banda Show"}},{"type":"text","text":" — construida sobre la teatralidad escénica y la coreografía"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Los cantantes que formó","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Las orquestas de Vargas fueron la entrada al oficio de toda una generación de vocalistas dominicanos. "},{"type":"artistReference","attrs":{"occurrenceId":"d29be4cd-b436-4a17-bc58-f0b06f5f768c","artistId":"cff70c92-8632-4c66-b5a0-81622c8128b0","displayText":"Rubby Pérez"}},{"type":"text","text":" cantó con los Beduinos entre 1982 y 1987, y su grabación de Volveré — un tema que en principio se había pensado para otro cantante del grupo, Jorge Gómez — se convirtió en uno de los mayores éxitos de la orquesta y lo consagró como solista. Por las agrupaciones pasaron también Eddie Herrera, Juancho Viloria y "},{"type":"artistReference","attrs":{"occurrenceId":"f330ec72-8299-4fd5-a730-f7e7b5516e92","artistId":"4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3","displayText":"Víctor Víctor"}},{"type":"text","text":". Lo que los formó fue la disciplina de ensayo de Vargas, su exigencia de precisión vocal y su oído, y el estándar que fijó quedó como modelo de trabajo para las orquestas profesionales de merengue."}]},{"type":"paragraph","content":[{"type":"text","text":"Reconocimientos","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Orden de Cristóbal Colón, grado de Caballero — otorgada en 1993 por el presidente Joaquín Balaguer"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Nominación al Grammy, Mejor Interpretación Tropical Latina — 1991, por Animation"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Premio a la Excelencia Musical de la Academia Latina de la Grabación — 2018, entregado por "},{"type":"artistReference","attrs":{"occurrenceId":"563b9e95-3980-4904-b690-db309bb65d04","artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura"}}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Discos de oro y platino a lo largo de cinco décadas de publicaciones"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Legado","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Vargas es una de las figuras sin las cuales no se puede escribir la historia moderna del merengue. Rehízo la orquesta, abrió el género a la influencia afroantillana, creó las agrupaciones que lo llevaron a mercados nuevos y formó buena parte de las voces que lo cantaron. La conversión del merengue de música nacional en música transnacional no fue obra suya únicamente, pero no se explica sin él, y su catálogo sigue siendo referencia obligada en la música caribeña."}]}]}$json$::jsonb,
    revision = 3,
    updated_at = now()
WHERE id = 'df33c96f-b82e-47e6-b3fc-2849945bb546'
  AND owner_artist_id = '2bc36959-dcce-4e10-9ecf-2cd418eaa489'
  AND locale = 'es';

DELETE FROM editorial_entity_references WHERE editorial_document_id = 'df33c96f-b82e-47e6-b3fc-2849945bb546';

INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('df33c96f-b82e-47e6-b3fc-2849945bb546', 'fb3bcb65-705f-4c52-8208-bb21d223d001', 'artist', '4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3');  -- Víctor Víctor
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('df33c96f-b82e-47e6-b3fc-2849945bb546', '5e118521-896f-44e4-99fe-fd13468650f8', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');  -- Johnny Ventura
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('df33c96f-b82e-47e6-b3fc-2849945bb546', '2fdc3a42-b879-4eb7-ace5-a837982344ab', 'artist', '6778e4a3-8f63-420f-bdd4-9a0a7e5cacc5');  -- Las Chicas del Can
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('df33c96f-b82e-47e6-b3fc-2849945bb546', 'e1e1b26d-0b4d-415b-83a4-3a1fba8bc0ed', 'artist', '2dde2335-84c3-49ba-be43-f3c3ae717d87');  -- The New York Band
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('df33c96f-b82e-47e6-b3fc-2849945bb546', '9cb89769-82c8-4789-975a-4dd4d929df24', 'artist', 'e735658a-0cc6-4238-9cf9-e5bebad6724b');  -- Altamira Banda Show
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('df33c96f-b82e-47e6-b3fc-2849945bb546', 'd29be4cd-b436-4a17-bc58-f0b06f5f768c', 'artist', 'cff70c92-8632-4c66-b5a0-81622c8128b0');  -- Rubby Pérez
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('df33c96f-b82e-47e6-b3fc-2849945bb546', 'f330ec72-8299-4fd5-a730-f7e7b5516e92', 'artist', '4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3');  -- Víctor Víctor
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('df33c96f-b82e-47e6-b3fc-2849945bb546', '563b9e95-3980-4904-b690-db309bb65d04', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');  -- Johnny Ventura

-- Legacy markdown mirror: section titles as **Title** on their own line,
-- bullets as "- item" separated by two spaces + newline, artistReference
-- flattened to its displayText. Not the plain-text flattening of the document.
UPDATE artists
SET bio_es = $sql$Wilfrido Radhamés Vargas Martínez (Altamira, Puerto Plata; 24 de abril de 1949) es un trompetista, director de orquesta, compositor, arreglista y productor dominicano, y uno de los arquitectos del merengue moderno. Su aporte no fue solamente componer éxitos: rehízo la orquesta de merengue como espectáculo de gira, incorporó el kompa haitiano y otras corrientes afroantillanas a su lenguaje rítmico, y fundó agrupaciones y formó cantantes que entre todos definieron el momento de mayor alcance comercial del género en los años ochenta. En 2018 la Academia Latina de la Grabación le otorgó el Premio a la Excelencia Musical.

**Primeros años y formación**

Vargas nació en Altamira, municipio rural de la provincia de Puerto Plata. La música le llegó por ambos lados de la casa: su madre, Bienvenida Martínez, tocaba guitarra y flauta, y su padre, Ramón Vargas, era acordeonista y guitarrista. A los diez años entró a la academia municipal de música de Altamira, donde estudió solfeo y teoría. Empezó con la guitarra, pero pasó pronto a la trompeta, y a los once ocupaba la trompeta prima de la banda municipal, una posición poco común para un niño de esa edad y una primera medida de su capacidad técnica.

En la adolescencia combinó la música con un empleo de cartero, y los dos oficios juntos dan la medida de lo que podía ganar un músico rural en la República Dominicana de mediados del siglo XX. Cuando cambios administrativos le costaron ambos, se marchó a Santo Domingo.

**Inicios profesionales en Santo Domingo**

En la capital se integró al circuito de bares, teatros y agrupaciones de merengue: el Bar Herminia, donde debutó profesionalmente como trompetista, el Teatro Stella, y después las orquestas de Paniagua Rodríguez y Rafael Mancebo. Eran conjuntos del merengue tradicional, anteriores a la modernización que él mismo ayudaría a empujar, y en ellos se hizo de una reputación como trompetista solvente tanto en la sección como en el solo.

**Wilfrido Vargas y sus Beduinos**

En 1972 fundó Wilfrido Vargas y sus Beduinos y grabó con ellos su primer álbum. La agrupación lo convirtió de instrumentista en director y funcionó como laboratorio de lo que vendría después: metales ampliados, puesta en escena coreografiada y estructuras rítmicas tomadas de todo el Caribe. Fue también una escuela: por ella pasó Víctor Víctor entre los vocalistas de los primeros años.

**El kompa haitiano y la transformación del merengue**

El giro decisivo de su escritura vino del kompa haitiano, y en particular de Tabou Combo y DP Express. Su manera de pensar el ritmo y la armonía le reordenó el enfoque del merengue y lo llevó a incorporar material afroantillano de forma sistemática, no como adorno. El sonido orquestal que salió de ahí se sostiene en la superposición rítmica sincopada, los coros polifónicos, una escritura híbrida de metales, progresiones armónicas derivadas del kompa y una presentación escénica teatral y coreografiada.

El trabajo corrió en paralelo a la modernización que había iniciado Johnny Ventura, pero no era el mismo proyecto. Ventura aportó espectáculo e instrumentación ampliada para el público nacional; Vargas aportó corrientes de fuera del país y un sonido pensado para viajar.

**Proyección internacional**

Desde finales de los años setenta Vargas fue de los artistas dominicanos más visibles fuera del país. Entre sus presentaciones están el Madison Square Garden en 1976, el festival Havana Jam en Cuba en 1979 y Altos de Chavón, donde la suya fue la primera orquesta dominicana en llenar el anfiteatro, además de giras por Europa, México, Suramérica y Estados Unidos. Los discos de esa etapa combinan arreglos de alta complejidad con humor y dramatización narrativa, y contribuyeron a que el merengue se volviera música de baile dominante en América Latina.

**Grabaciones principales**

- El Barbarazo — 1978, su primer éxito internacional  
- Abusadora — 1981  
- El Africano — 1984  
- El Jardinero — 1984  
- La Medicina — 1985  
- El Baile del Perrito — 1989, del álbum Itinerario  
- Comején, A Mover la Colita, El Loco y la Luna y Volveré, todas vigentes en el repertorio del merengue

**Agrupaciones que creó y dirigió**

Además de su propia orquesta, Vargas fundó y dirigió agrupaciones que ampliaron lo que el merengue podía ser:

- Las Chicas del Can — de las primeras agrupaciones femeninas de merengue en triunfar internacionalmente  
- The New York Band — merengue cruzado con pop, rock y material urbano  
- Altamira Banda Show — construida sobre la teatralidad escénica y la coreografía

**Los cantantes que formó**

Las orquestas de Vargas fueron la entrada al oficio de toda una generación de vocalistas dominicanos. Rubby Pérez cantó con los Beduinos entre 1982 y 1987, y su grabación de Volveré — un tema que en principio se había pensado para otro cantante del grupo, Jorge Gómez — se convirtió en uno de los mayores éxitos de la orquesta y lo consagró como solista. Por las agrupaciones pasaron también Eddie Herrera, Juancho Viloria y Víctor Víctor. Lo que los formó fue la disciplina de ensayo de Vargas, su exigencia de precisión vocal y su oído, y el estándar que fijó quedó como modelo de trabajo para las orquestas profesionales de merengue.

**Reconocimientos**

- Orden de Cristóbal Colón, grado de Caballero — otorgada en 1993 por el presidente Joaquín Balaguer  
- Nominación al Grammy, Mejor Interpretación Tropical Latina — 1991, por Animation  
- Premio a la Excelencia Musical de la Academia Latina de la Grabación — 2018, entregado por Johnny Ventura  
- Discos de oro y platino a lo largo de cinco décadas de publicaciones

**Legado**

Vargas es una de las figuras sin las cuales no se puede escribir la historia moderna del merengue. Rehízo la orquesta, abrió el género a la influencia afroantillana, creó las agrupaciones que lo llevaron a mercados nuevos y formó buena parte de las voces que lo cantaron. La conversión del merengue de música nacional en música transnacional no fue obra suya únicamente, pero no se explica sin él, y su catálogo sigue siendo referencia obligada en la música caribeña.$sql$,
    updated_at = now()
WHERE id = '2bc36959-dcce-4e10-9ecf-2cd418eaa489';


COMMIT;
