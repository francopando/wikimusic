BEGIN;

-- Create the catalogue entry for Radhamés Aracena.
--
-- Radhamés Aracena. Ficha nueva -- la primera de la lista de prioridad, y el
-- hueco más grande que tenía el catálogo.
--
-- POR QUÉ EL PRIMERO. Radio Guarachita ya se nombra en cinco fichas publicadas
-- -- jose-manuel-calderon, robin-carino, cheche-abreu, tony-seval y, como sello,
-- otra vez tony-seval -- y la de Tony Seval nombra a "Radhamés Aracena" con todas
-- sus letras en los dos idiomas sin poder enlazarlo, porque no existía. Además no
-- es intérprete: nadie iba a escribirlo de rebote haciendo otra ficha.
--
-- DIECISÉIS ARTISTAS DE LOS QUE APARECEN EN SUS FUENTES YA ESTÁN PUBLICADOS.
-- Comprobados uno por uno con verificar-faltantes.cjs: jose-manuel-calderon,
-- leonardo-paniagua, blas-duran, ramon-cordero, edilio-paredes, tatico-henriquez,
-- guandulito, fefita-la-grande, cuco-valoy, tony-seval, joan-soriano,
-- juan-bautista, antony-santos, luis-segura, ramon-orlando y aridia-ventura.
-- Se enlazan doce; meter los dieciséis convertiría la prosa en un índice.
--
-- LA CORRECCIÓN QUE TRAE ESTA FICHA. El mito dice que Aracena fue el primero en
-- poner bachata en la radio. No lo fue, y la fuente de que no lo fue es él mismo:
-- iASO recoge que Aracena reconocía a Cuco Valoy como el primer disc jockey del
-- país en ponerla al aire. Antes que él estaban Valoy en Radio Tropical, bajo el
-- nombre "El Suki Suki sabrosón", y José Tabar Asilis, "Charlie-Charlie", en La
-- Voz del Trópico. Lo de Aracena no fue la primicia sino el alcance. La ficha lo
-- dice así porque es lo que dicen las fuentes y porque es más interesante.
--
-- LA DISPUTA POR CONTRATOS Y REGALÍAS VA DENTRO. Es la regla de esta casa: la
-- vida privada queda fuera, pero la autoría y las regalías son justo lo que un
-- catálogo registra. Van los turnos de doce horas descalzos que recuerdan Edilio
-- Paredes y Joan Soriano, los honorarios magros, las regalías que los herederos
-- siguen reclamando, y la costumbre de volver a grabar con sus artistas el éxito
-- ajeno -- documentada con nombres: los temas de Juan Bautista regrabados en los
-- ochenta con José Manuel Félix, "El Solterito del Sur". Va también que muchos de
-- esos mismos artistas le agradecen la carrera. Las dos cosas son ciertas.
--
-- LO QUE QUEDA FUERA. El segundo sello se llamaba Zuni por su mujer; la ficha
-- nombra los dos sellos y no explica el nombre, porque la familia no es asunto de
-- esta base. Nombres de hijos, sepultura y estado civil, fuera por lo mismo.
--
-- CONFLICTO QUE NO SE RESUELVE SOLO. Wikipedia en español dice que murió en
-- MIAMI; la inglesa dice que en SANTO DOMINGO. Las dos coinciden en el 11 de
-- diciembre de 1999 y en los 69 años, y iASO confirma fecha y edad sin decir
-- dónde. La fila guarda la fecha, que es lo que está acordado, y la prosa no
-- nombra ciudad. Una publicación de Facebook da 1998: es minoritaria contra tres
-- fuentes y se descarta.
--
-- primary_genre VA VACÍO Y ES CORRECTO. La regla del runner: quien trabaja detrás
-- de la consola y no firma obra propia no lleva género. primary_role es producer y
-- las ocupaciones -- radio_host, engineer, executive -- ya existen en la tabla, no
-- se inventa ninguna.
--
-- FUENTES: Wikipedia en español e inglés. El ensayo de iASO Records "Radhames
-- Aracena and Radio Guarachita", que es la fuente larga y de donde salen la tienda
-- de El Conde, la máquina de pinball, la sesión de 1962 con José Manuel Calderón,
-- la cola de los sábados y el testimonio de los zapatos. La ficha de Cuco Valoy en
-- iASO para la primacía. Deborah Pacini Hernández, "Bachata: A Social History of
-- Dominican Popular Music" (Temple University Press, 1995), citada por las dos
-- Wikipedias. La cita del historiador Arístides Incháustegui, vía iASO.
--
-- NOMBRES NUEVOS PARA LA LISTA DE FALTANTES: Homero León Díaz, el director de La
-- Voz del Trópico que le dio la primera oportunidad; José Manuel Félix "El
-- Solterito del Sur"; Bernardo Ortiz; Inocencia Cruz; Fabio Sanabia; Los Hermanos
-- Veloz; Antonio Gómez Salcedo; Víctor Estévez; El Chivo Sin Ley; el historiador
-- Arístides Incháustegui; y Juan López, el empresario que compró la emisora.
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
       name = 'Radhamés Aracena',
       sort_name = 'Aracena, Radhamés',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'producer',
       primary_genre = NULL,
       date_of_birth = '1930-05-13',
       birth_year = 1930,
       date_of_death = '1999-12-11',
       birth_place = 'Santiago de los Caballeros',
       province = 'Santiago',
       first_name = 'Radhamés',
       middle_name = NULL,
       last_name = 'Aracena',
       second_last_name = NULL,
       stage_name = 'Radhamés Aracena',
       aliases = ARRAY['Charming Radhamés']::text[],
       occupations = '["radio_host","engineer","executive"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Broadcaster and producer; founded Radio Guarachita and Discos la Guarachita and put bachata on national radio',
       bio_en = 'Radhamés Aracena was a Dominican broadcaster, record producer and businessman. He built the radio station, the studio, the pressing plant and the label that carried bachata out of the bars and into every house in the country, and he did it while the rest of Dominican media was refusing to play the music at all.

**A shop on El Conde**

He was born in Santiago in 1930 and grew up in the capital, which in those years carried the dictator’s name. At eighteen, still in school, he walked into a radio station and asked the director for a chance at the microphone. He got it, and within a few years he was one of the best-known voices on the dial.

His programme was an hour of music followed by a full hour of advertisements. He charged almost nothing for the airtime and sold it to corner shops and neighbourhood businesses, and the striking thing is that listeners stayed through the ads. That instinct — that ordinary people would sit through anything if it sounded like their own lives — is the whole of his later career in miniature.

In 1955 he opened a record shop in the partitioned front room of a widow’s house near El Conde, the capital’s smart shopping street, with a borrowed record player so customers could listen before buying. He had the local rights to the Mexican label that issued Pedro Infante, and he added more: the catalogue of the bolero singer Lucho Gatica, a Colombian house whose guitar music sold heavily on the island, and eventually RCA and CBS.

Four years later he moved to a real storefront on El Conde itself — and that same year the dictator’s family opened a pressing plant and made importing foreign records illegal, which removed his entire stock at a stroke. He kept the business alive by putting a pinball machine in the shop. He also began recording local bands with a microphone and a tape deck, which is how the rest of it started.

**Guarachita on the dial**

The dictatorship ended in 1961 and the equipment of a controlled media system came onto the market cheap. He bought a transmitter and a licence, spent a year testing, and in 1964 put Radio Guarachita on 690 AM.

The building had two floors. Upstairs were the studios and a radio theatre that seated a hundred and fifty people for live broadcasts, with the main booth open to anyone who wandered in. Downstairs he sold electronics — mostly parts for mending radios and televisions, which tells you exactly who he expected his listeners to be.

He opened by playing the imported Mexican and Cuban records he stocked in the shop, on the theory that a station should sound polished. Then he looked at who was actually listening: people newly arrived in the city from the countryside, who wanted the local guitar music and did not care that it was badly recorded. He abandoned the polish and gave them what they wanted.

**Not the first, but the one that carried**

He is often called the first man to put bachata on the radio. He was not, and the best authority for that is Aracena himself, who credited Cuco Valoy as the first disc jockey in the country to play it on air — Valoy did it on another station under a stage name, years before, and a broadcaster known as Charlie-Charlie was doing it too.

What Aracena had was reach. His was a national AM signal at a moment when the wealthy families who controlled the rest of Dominican media had settled into an outright boycott of the music, calling it vulgar and a drag on the country. He ignored them and ended up with something close to a monopoly on the genre’s diffusion, which is a different achievement from being first and a larger one.

**The queue on Saturday morning**

His first records were cut on gear meant for advertising jingles and they sounded like it. After a session with José Manuel Calderón in 1962 he is said to have been too embarrassed to let the singer hear the playback. He bought better equipment, taught himself to engineer, and then sat in on the mixing of everything the label released and drew the sleeve artwork himself.

Musicians began gathering outside his house on Saturday mornings hoping for a turn at the microphone. The ones who got it include a large share of the names the genre is now built on: José Manuel Calderón, Leonardo Paniagua, Blas Durán, Ramón Cordero and Edilio Paredes. Merengue típico came through the same door — Tatico Henríquez, Guandulito and Fefita la Grande all made records there — and so, later, did Luis Segura.

He built the rest of the chain around the studio: a pressing factory that manufactured for his own two labels and for rival producers as well, on top of the shop and the station. He controlled the recording, the manufacture, the distribution and the airplay of the music he sold, which no competitor could match.

**The station that read the mail**

Guarachita was also, and this is not a footnote, a postal service. Announcers read out listeners’ letters and telegrams on air around the clock, in a country where almost nobody had a telephone. Somebody arriving in the capital to find a relative whose address they had lost could go to the station and have the family called to meet them there.

People kept the radio on all day in case their name came up. Nothing about that was charity — it was the most effective audience-retention scheme anyone in Dominican radio has ever devised — but it made the station a fixture of ordinary life for a very large number of people, and it is the reason the music that played between the messages went everywhere.

**What the musicians were paid**

The other half of the record is not flattering. Session players remember the studio, which occupied a floor of his own house, as a hard place to work: Edilio Paredes and Joan Soriano have both described being made to take their shoes off at the door and play twelve-hour shifts barefoot without being fed.

The contracts have been disputed for decades. Fees were small, and the families of dead artists are still claiming royalties they say were never paid. He also had a settled habit of taking other people’s hits: when a record he did not own started selling, he would cut his own version with one of his artists and let the station do the rest. In the eighties he did it repeatedly to Juan Bautista, re-recording song after song with a singer billed as El Solterito del Sur until the copies were better known than the originals.

And yet many of the same musicians say they owe him their careers, and say it without irony. Both things are true at once, and any account that keeps only one of them is describing someone else.

**Losing the country**

Bachata changed in the nineties. The guitars went electric, the boycott quietly collapsed as the music turned respectable, the diaspora carried it abroad, and foreign labels with real budgets arrived to sign the artists he had spent thirty years developing. Competing with them was a new experience for him.

His answer was to move Guarachita from AM to FM. It sounded better and it cost him everything that mattered: the AM signal had covered the whole republic, and the FM one reached Santo Domingo. The station that had made a national genre became a city station.

He died in December 1999, at sixty-nine, with a stack of unfinished projects. Two of them were ahead of anything else he had done: a record by Joan Soriano and an album of bachatas sung in Haitian Creole. The tapes were lost. Both were eventually made again by other people, the Creole record only fifteen years later.',
       bio_es = 'Radhamés Aracena fue locutor, productor discográfico y empresario dominicano. Levantó la emisora, el estudio, la fábrica de discos y el sello que sacaron la bachata de los bares y la metieron en todas las casas del país, y lo hizo mientras el resto de los medios dominicanos se negaba a poner esa música.

**Una tienda en El Conde**

Nació en Santiago en 1930 y se crió en la capital, que en esos años llevaba el nombre del dictador. A los dieciocho, todavía en la escuela, se metió en una emisora y le pidió al director una oportunidad frente al micrófono. Se la dieron, y en pocos años era una de las voces más conocidas del dial.

Su programa era una hora de música seguida de una hora entera de anuncios. Cobraba casi nada por el aire y se lo vendía a colmados y negocios de barrio, y lo llamativo es que el público se quedaba a oír la publicidad. Esa intuición —que la gente común aguanta lo que sea si suena a su propia vida— es toda su carrera posterior en miniatura.

En 1955 abrió una tienda de discos en la sala dividida de la casa de una viuda, cerca de El Conde, la calle elegante del comercio capitaleño, con un tocadiscos prestado para que el cliente oyera antes de comprar. Tenía los derechos locales del sello mexicano que editaba a Pedro Infante, y fue sumando: el catálogo del bolerista Lucho Gatica, una casa colombiana cuya música de guitarra se vendía muchísimo en la isla, y con el tiempo la RCA y la CBS.

Cuatro años después se mudó a un local de verdad sobre El Conde, y ese mismo año la familia del dictador montó una prensadora y prohibió importar discos extranjeros, que era exactamente todo lo que él tenía en los estantes. Mantuvo el negocio a flote poniendo una máquina de pinball en la tienda. También empezó a grabar grupos locales con un micrófono y una grabadora, y de ahí sale lo demás.

**Guarachita en el dial**

La dictadura terminó en 1961 y los equipos de un sistema de medios controlado salieron baratos al mercado. Compró un transmisor y una licencia, se pasó un año probando, y en 1964 puso Radio Guarachita en el 690 de AM.

El edificio tenía dos pisos. Arriba estaban los estudios y un radioteatro con capacidad para ciento cincuenta personas donde se transmitía en vivo, con la cabina principal abierta a quien entrara. Abajo vendía electrónica, sobre todo piezas para reparar radios y televisores, lo que dice con bastante precisión a quién esperaba tener escuchando.

Arrancó poniendo los discos mexicanos y cubanos importados que surtía en la tienda, con la idea de que una emisora debía sonar fina. Después miró quién lo oía de verdad: gente recién llegada del campo a la ciudad, que quería la música de guitarra de aquí y a la que no le importaba que estuviera mal grabada. Renunció a la finura y les dio lo que pedían.

**No fue el primero, fue el que llegó**

Suele decirse que fue el primero en poner bachata en la radio. No lo fue, y la mejor autoridad para decirlo es él mismo, que le reconocía a Cuco Valoy haber sido el primer disc jockey del país en ponerla al aire: Valoy lo hacía en otra emisora y bajo un nombre inventado, años antes, y un locutor conocido como Charlie-Charlie también.

Lo que Aracena tenía era alcance. La suya era una señal de AM nacional en un momento en que las familias adineradas dueñas del resto de los medios dominicanos habían instalado un boicot declarado contra esa música, a la que llamaban vulgar y estorbo para el progreso. Él los ignoró y terminó con algo muy parecido a un monopolio sobre la difusión del género, que es otro mérito distinto de haber llegado primero, y mayor.

**La cola de los sábados**

Sus primeros discos se grabaron con equipos hechos para cuñas publicitarias y sonaban a eso. Después de una sesión con José Manuel Calderón en 1962 cuentan que le dio vergüenza dejar que el cantante oyera el resultado. Compró mejores equipos, aprendió a operarlos, y a partir de ahí se sentó en la mezcla de todo lo que sacaba el sello y dibujó él mismo las portadas.

Los músicos empezaron a hacer cola frente a su casa los sábados por la mañana esperando un turno de micrófono. Entre los que lo consiguieron está buena parte de los nombres sobre los que hoy se sostiene el género: José Manuel Calderón, Leonardo Paniagua, Blas Durán, Ramón Cordero y Edilio Paredes. El merengue típico entró por la misma puerta —Tatico Henríquez, Guandulito y Fefita la Grande grabaron ahí— y más tarde también Luis Segura.

Montó el resto de la cadena alrededor del estudio: una fábrica de discos que prensaba para sus dos sellos y también para productores rivales, encima de la tienda y de la emisora. Controlaba la grabación, la fabricación, la distribución y la difusión de la música que vendía, y con eso ningún competidor podía medirse.

**La emisora que leía las cartas**

Guarachita era además, y esto no es una nota al pie, un servicio de correos. Los locutores leían al aire las cartas y los telegramas de los oyentes a toda hora, en un país donde casi nadie tenía teléfono. Quien llegaba a la capital a buscar a un pariente cuya dirección había perdido podía pasar por la emisora y hacer que llamaran a la familia a encontrarse allí.

La gente dejaba el radio encendido todo el día por si sonaba su nombre. Nada de aquello era caridad —es el mecanismo de retención de audiencia más eficaz que ha inventado nadie en la radio dominicana—, pero convirtió a la emisora en parte de la vida corriente de muchísima gente, y es la razón por la que la música que sonaba entre mensaje y mensaje llegó a todas partes.

**Lo que cobraban los músicos**

La otra mitad del expediente no favorece. Los músicos de sesión recuerdan aquel estudio, que ocupaba un piso de su propia casa, como un sitio duro: Edilio Paredes y Joan Soriano han contado los dos que los hacían descalzarse en la puerta y tocar turnos de doce horas sin zapatos y sin darles de comer.

Los contratos llevan décadas discutiéndose. Los honorarios eran pequeños, y las familias de artistas ya muertos siguen reclamando regalías que dicen que nunca se pagaron. Tenía además la costumbre asentada de quedarse con el éxito ajeno: cuando pegaba un disco que no era suyo, sacaba su propia versión con alguno de sus artistas y dejaba que la emisora hiciera el resto. En los ochenta se lo hizo una y otra vez a Juan Bautista, regrabándole tema tras tema con un cantante anunciado como El Solterito del Sur hasta que las copias se conocieron más que los originales.

Y aun así muchos de esos mismos músicos dicen que le deben la carrera, y lo dicen sin ironía. Las dos cosas son ciertas a la vez, y cualquier relato que se quede con una sola está describiendo a otra persona.

**Perder el país**

La bachata cambió en los noventa. Las guitarras se electrificaron, el boicot se vino abajo en silencio a medida que la música se volvía presentable, la diáspora se la llevó afuera, y llegaron sellos extranjeros con presupuesto a firmar a los artistas que él había pasado treinta años criando. Competir con eso era una experiencia nueva para él.

Su respuesta fue mudar Guarachita de AM a FM. Sonaba mejor y le costó lo único que importaba: la señal de AM cubría la república entera y la de FM llegaba a Santo Domingo. La emisora que había hecho un género nacional se quedó en emisora de una ciudad.

Murió en diciembre de 1999, a los sesenta y nueve años, con una pila de proyectos sin terminar. Dos de ellos iban por delante de todo lo que había hecho: un disco de Joan Soriano y un álbum de bachatas cantadas en creol haitiano. Las cintas se perdieron. Los dos acabaron rehaciéndolos otras manos, el de creol quince años después.',
       updated_at = now()
 WHERE slug = 'radhames-aracena';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Radhamés Aracena was a Dominican broadcaster, record producer and businessman. He built the radio station, the studio, the pressing plant and the label that carried bachata out of the bars and into every house in the country, and he did it while the rest of Dominican media was refusing to play the music at all.","type":"text"}]},{"type":"paragraph","content":[{"text":"A shop on El Conde","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was born in Santiago in 1930 and grew up in the capital, which in those years carried the dictator’s name. At eighteen, still in school, he walked into a radio station and asked the director for a chance at the microphone. He got it, and within a few years he was one of the best-known voices on the dial.","type":"text"}]},{"type":"paragraph","content":[{"text":"His programme was an hour of music followed by a full hour of advertisements. He charged almost nothing for the airtime and sold it to corner shops and neighbourhood businesses, and the striking thing is that listeners stayed through the ads. That instinct — that ordinary people would sit through anything if it sounded like their own lives — is the whole of his later career in miniature.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 1955 he opened a record shop in the partitioned front room of a widow’s house near El Conde, the capital’s smart shopping street, with a borrowed record player so customers could listen before buying. He had the local rights to the Mexican label that issued Pedro Infante, and he added more: the catalogue of the bolero singer Lucho Gatica, a Colombian house whose guitar music sold heavily on the island, and eventually RCA and CBS.","type":"text"}]},{"type":"paragraph","content":[{"text":"Four years later he moved to a real storefront on El Conde itself — and that same year the dictator’s family opened a pressing plant and made importing foreign records illegal, which removed his entire stock at a stroke. He kept the business alive by putting a pinball machine in the shop. He also began recording local bands with a microphone and a tape deck, which is how the rest of it started.","type":"text"}]},{"type":"paragraph","content":[{"text":"Guarachita on the dial","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The dictatorship ended in 1961 and the equipment of a controlled media system came onto the market cheap. He bought a transmitter and a licence, spent a year testing, and in 1964 put Radio Guarachita on 690 AM.","type":"text"}]},{"type":"paragraph","content":[{"text":"The building had two floors. Upstairs were the studios and a radio theatre that seated a hundred and fifty people for live broadcasts, with the main booth open to anyone who wandered in. Downstairs he sold electronics — mostly parts for mending radios and televisions, which tells you exactly who he expected his listeners to be.","type":"text"}]},{"type":"paragraph","content":[{"text":"He opened by playing the imported Mexican and Cuban records he stocked in the shop, on the theory that a station should sound polished. Then he looked at who was actually listening: people newly arrived in the city from the countryside, who wanted the local guitar music and did not care that it was badly recorded. He abandoned the polish and gave them what they wanted.","type":"text"}]},{"type":"paragraph","content":[{"text":"Not the first, but the one that carried","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is often called the first man to put bachata on the radio. He was not, and the best authority for that is Aracena himself, who credited ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c11c2dda-ffa1-4f09-9d24-00dc4473bc8d","displayText":"Cuco Valoy","occurrenceId":"a86aafff-fca0-4326-bab9-7b3f8f94cbe6"}},{"text":" as the first disc jockey in the country to play it on air — Valoy did it on another station under a stage name, years before, and a broadcaster known as Charlie-Charlie was doing it too.","type":"text"}]},{"type":"paragraph","content":[{"text":"What Aracena had was reach. His was a national AM signal at a moment when the wealthy families who controlled the rest of Dominican media had settled into an outright boycott of the music, calling it vulgar and a drag on the country. He ignored them and ended up with something close to a monopoly on the genre’s diffusion, which is a different achievement from being first and a larger one.","type":"text"}]},{"type":"paragraph","content":[{"text":"The queue on Saturday morning","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His first records were cut on gear meant for advertising jingles and they sounded like it. After a session with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"27c82e93-8c8f-4466-86ab-e1afba1e5487","displayText":"José Manuel Calderón","occurrenceId":"031e60af-ac27-42a4-b61c-ddaf5bda4247"}},{"text":" in 1962 he is said to have been too embarrassed to let the singer hear the playback. He bought better equipment, taught himself to engineer, and then sat in on the mixing of everything the label released and drew the sleeve artwork himself.","type":"text"}]},{"type":"paragraph","content":[{"text":"Musicians began gathering outside his house on Saturday mornings hoping for a turn at the microphone. The ones who got it include a large share of the names the genre is now built on: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"27c82e93-8c8f-4466-86ab-e1afba1e5487","displayText":"José Manuel Calderón","occurrenceId":"0bf3e9d7-d3d4-44a0-b49e-4fab7d16c253"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"31915623-3206-4052-b13a-2170226671b9","displayText":"Leonardo Paniagua","occurrenceId":"4e41d43a-093d-4b7e-bb95-9e01ce357f72"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2b644026-3e99-4229-a729-003f04103f30","displayText":"Blas Durán","occurrenceId":"195086e3-0a55-4d24-b9cb-19f69d986146"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"449f86a9-d10e-4fff-976f-9581fb3d03a1","displayText":"Ramón Cordero","occurrenceId":"2c3988c0-cb62-47d9-8bd2-bf1cc9703256"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cbda65a4-c7da-4762-8cf8-f29b942d2ac3","displayText":"Edilio Paredes","occurrenceId":"6e95c25b-9dc2-435d-a8e1-7726013b5a3c"}},{"text":". Merengue típico came through the same door — ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"45ab57b5-a02e-4480-8f6c-e567e1cdee45"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e07267a0-7f9d-4ef5-928c-d4ade7dc921e","displayText":"Guandulito","occurrenceId":"a79d179c-6688-4229-8bbd-a50bc91f1a27"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9333da06-ad03-44eb-9b81-c21d0ccdd0ea","displayText":"Fefita la Grande","occurrenceId":"0f10fd22-a661-4438-aa44-5b864c05cb6d"}},{"text":" all made records there — and so, later, did ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"780ac789-9be1-471a-bea7-b09fe4233104"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"He built the rest of the chain around the studio: a pressing factory that manufactured for his own two labels and for rival producers as well, on top of the shop and the station. He controlled the recording, the manufacture, the distribution and the airplay of the music he sold, which no competitor could match.","type":"text"}]},{"type":"paragraph","content":[{"text":"The station that read the mail","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Guarachita was also, and this is not a footnote, a postal service. Announcers read out listeners’ letters and telegrams on air around the clock, in a country where almost nobody had a telephone. Somebody arriving in the capital to find a relative whose address they had lost could go to the station and have the family called to meet them there.","type":"text"}]},{"type":"paragraph","content":[{"text":"People kept the radio on all day in case their name came up. Nothing about that was charity — it was the most effective audience-retention scheme anyone in Dominican radio has ever devised — but it made the station a fixture of ordinary life for a very large number of people, and it is the reason the music that played between the messages went everywhere.","type":"text"}]},{"type":"paragraph","content":[{"text":"What the musicians were paid","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The other half of the record is not flattering. Session players remember the studio, which occupied a floor of his own house, as a hard place to work: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cbda65a4-c7da-4762-8cf8-f29b942d2ac3","displayText":"Edilio Paredes","occurrenceId":"82aae451-1920-4b5b-a0d5-1ffed72a9d1d"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4d9ac6ac-6802-47f4-8731-5fa567713513","displayText":"Joan Soriano","occurrenceId":"de4a3420-eebb-42e1-80a5-dcb81bc5e8f0"}},{"text":" have both described being made to take their shoes off at the door and play twelve-hour shifts barefoot without being fed.","type":"text"}]},{"type":"paragraph","content":[{"text":"The contracts have been disputed for decades. Fees were small, and the families of dead artists are still claiming royalties they say were never paid. He also had a settled habit of taking other people’s hits: when a record he did not own started selling, he would cut his own version with one of his artists and let the station do the rest. In the eighties he did it repeatedly to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9736b552-1a72-4b02-9eac-88a453536809","displayText":"Juan Bautista","occurrenceId":"47863932-ab37-42ef-9478-e5211472c5df"}},{"text":", re-recording song after song with a singer billed as El Solterito del Sur until the copies were better known than the originals.","type":"text"}]},{"type":"paragraph","content":[{"text":"And yet many of the same musicians say they owe him their careers, and say it without irony. Both things are true at once, and any account that keeps only one of them is describing someone else.","type":"text"}]},{"type":"paragraph","content":[{"text":"Losing the country","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Bachata changed in the nineties. The guitars went electric, the boycott quietly collapsed as the music turned respectable, the diaspora carried it abroad, and foreign labels with real budgets arrived to sign the artists he had spent thirty years developing. Competing with them was a new experience for him.","type":"text"}]},{"type":"paragraph","content":[{"text":"His answer was to move Guarachita from AM to FM. It sounded better and it cost him everything that mattered: the AM signal had covered the whole republic, and the FM one reached Santo Domingo. The station that had made a national genre became a city station.","type":"text"}]},{"type":"paragraph","content":[{"text":"He died in December 1999, at sixty-nine, with a stack of unfinished projects. Two of them were ahead of anything else he had done: a record by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4d9ac6ac-6802-47f4-8731-5fa567713513","displayText":"Joan Soriano","occurrenceId":"8690a946-b589-45ba-a1d0-db1fe56199f7"}},{"text":" and an album of bachatas sung in Haitian Creole. The tapes were lost. Both were eventually made again by other people, the Creole record only fifteen years later.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'radhames-aracena'), 1)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Radhamés Aracena fue locutor, productor discográfico y empresario dominicano. Levantó la emisora, el estudio, la fábrica de discos y el sello que sacaron la bachata de los bares y la metieron en todas las casas del país, y lo hizo mientras el resto de los medios dominicanos se negaba a poner esa música.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una tienda en El Conde","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nació en Santiago en 1930 y se crió en la capital, que en esos años llevaba el nombre del dictador. A los dieciocho, todavía en la escuela, se metió en una emisora y le pidió al director una oportunidad frente al micrófono. Se la dieron, y en pocos años era una de las voces más conocidas del dial.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su programa era una hora de música seguida de una hora entera de anuncios. Cobraba casi nada por el aire y se lo vendía a colmados y negocios de barrio, y lo llamativo es que el público se quedaba a oír la publicidad. Esa intuición —que la gente común aguanta lo que sea si suena a su propia vida— es toda su carrera posterior en miniatura.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 1955 abrió una tienda de discos en la sala dividida de la casa de una viuda, cerca de El Conde, la calle elegante del comercio capitaleño, con un tocadiscos prestado para que el cliente oyera antes de comprar. Tenía los derechos locales del sello mexicano que editaba a Pedro Infante, y fue sumando: el catálogo del bolerista Lucho Gatica, una casa colombiana cuya música de guitarra se vendía muchísimo en la isla, y con el tiempo la RCA y la CBS.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cuatro años después se mudó a un local de verdad sobre El Conde, y ese mismo año la familia del dictador montó una prensadora y prohibió importar discos extranjeros, que era exactamente todo lo que él tenía en los estantes. Mantuvo el negocio a flote poniendo una máquina de pinball en la tienda. También empezó a grabar grupos locales con un micrófono y una grabadora, y de ahí sale lo demás.","type":"text"}]},{"type":"paragraph","content":[{"text":"Guarachita en el dial","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La dictadura terminó en 1961 y los equipos de un sistema de medios controlado salieron baratos al mercado. Compró un transmisor y una licencia, se pasó un año probando, y en 1964 puso Radio Guarachita en el 690 de AM.","type":"text"}]},{"type":"paragraph","content":[{"text":"El edificio tenía dos pisos. Arriba estaban los estudios y un radioteatro con capacidad para ciento cincuenta personas donde se transmitía en vivo, con la cabina principal abierta a quien entrara. Abajo vendía electrónica, sobre todo piezas para reparar radios y televisores, lo que dice con bastante precisión a quién esperaba tener escuchando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Arrancó poniendo los discos mexicanos y cubanos importados que surtía en la tienda, con la idea de que una emisora debía sonar fina. Después miró quién lo oía de verdad: gente recién llegada del campo a la ciudad, que quería la música de guitarra de aquí y a la que no le importaba que estuviera mal grabada. Renunció a la finura y les dio lo que pedían.","type":"text"}]},{"type":"paragraph","content":[{"text":"No fue el primero, fue el que llegó","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Suele decirse que fue el primero en poner bachata en la radio. No lo fue, y la mejor autoridad para decirlo es él mismo, que le reconocía a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c11c2dda-ffa1-4f09-9d24-00dc4473bc8d","displayText":"Cuco Valoy","occurrenceId":"0a2c044d-5588-4832-9034-ac83d811dcc6"}},{"text":" haber sido el primer disc jockey del país en ponerla al aire: Valoy lo hacía en otra emisora y bajo un nombre inventado, años antes, y un locutor conocido como Charlie-Charlie también.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que Aracena tenía era alcance. La suya era una señal de AM nacional en un momento en que las familias adineradas dueñas del resto de los medios dominicanos habían instalado un boicot declarado contra esa música, a la que llamaban vulgar y estorbo para el progreso. Él los ignoró y terminó con algo muy parecido a un monopolio sobre la difusión del género, que es otro mérito distinto de haber llegado primero, y mayor.","type":"text"}]},{"type":"paragraph","content":[{"text":"La cola de los sábados","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Sus primeros discos se grabaron con equipos hechos para cuñas publicitarias y sonaban a eso. Después de una sesión con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"27c82e93-8c8f-4466-86ab-e1afba1e5487","displayText":"José Manuel Calderón","occurrenceId":"206ed94f-29c2-4634-bafc-140d2d7a2ef1"}},{"text":" en 1962 cuentan que le dio vergüenza dejar que el cantante oyera el resultado. Compró mejores equipos, aprendió a operarlos, y a partir de ahí se sentó en la mezcla de todo lo que sacaba el sello y dibujó él mismo las portadas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los músicos empezaron a hacer cola frente a su casa los sábados por la mañana esperando un turno de micrófono. Entre los que lo consiguieron está buena parte de los nombres sobre los que hoy se sostiene el género: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"27c82e93-8c8f-4466-86ab-e1afba1e5487","displayText":"José Manuel Calderón","occurrenceId":"07cc4387-2a11-4a71-9992-3c7fa53d4213"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"31915623-3206-4052-b13a-2170226671b9","displayText":"Leonardo Paniagua","occurrenceId":"a2168f89-25cb-48ef-bee9-17497db74ec2"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2b644026-3e99-4229-a729-003f04103f30","displayText":"Blas Durán","occurrenceId":"1d106ed8-62e5-4fa9-928c-f5ebead49cb5"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"449f86a9-d10e-4fff-976f-9581fb3d03a1","displayText":"Ramón Cordero","occurrenceId":"fb48eda4-5234-419c-93ce-6137103e3f29"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cbda65a4-c7da-4762-8cf8-f29b942d2ac3","displayText":"Edilio Paredes","occurrenceId":"3e5166da-f751-4e86-bedf-350c1dab7e05"}},{"text":". El merengue típico entró por la misma puerta —","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"a233d6b3-8bb9-4867-8d08-c269196bffb2"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e07267a0-7f9d-4ef5-928c-d4ade7dc921e","displayText":"Guandulito","occurrenceId":"b9ab691a-514d-4b8e-b1f4-9e02c67d5668"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9333da06-ad03-44eb-9b81-c21d0ccdd0ea","displayText":"Fefita la Grande","occurrenceId":"f812d25d-6346-4848-8fc1-65b77869b126"}},{"text":" grabaron ahí— y más tarde también ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"01ecb79e-7d74-496b-bb98-c716d3dadaad"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Montó el resto de la cadena alrededor del estudio: una fábrica de discos que prensaba para sus dos sellos y también para productores rivales, encima de la tienda y de la emisora. Controlaba la grabación, la fabricación, la distribución y la difusión de la música que vendía, y con eso ningún competidor podía medirse.","type":"text"}]},{"type":"paragraph","content":[{"text":"La emisora que leía las cartas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Guarachita era además, y esto no es una nota al pie, un servicio de correos. Los locutores leían al aire las cartas y los telegramas de los oyentes a toda hora, en un país donde casi nadie tenía teléfono. Quien llegaba a la capital a buscar a un pariente cuya dirección había perdido podía pasar por la emisora y hacer que llamaran a la familia a encontrarse allí.","type":"text"}]},{"type":"paragraph","content":[{"text":"La gente dejaba el radio encendido todo el día por si sonaba su nombre. Nada de aquello era caridad —es el mecanismo de retención de audiencia más eficaz que ha inventado nadie en la radio dominicana—, pero convirtió a la emisora en parte de la vida corriente de muchísima gente, y es la razón por la que la música que sonaba entre mensaje y mensaje llegó a todas partes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que cobraban los músicos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La otra mitad del expediente no favorece. Los músicos de sesión recuerdan aquel estudio, que ocupaba un piso de su propia casa, como un sitio duro: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cbda65a4-c7da-4762-8cf8-f29b942d2ac3","displayText":"Edilio Paredes","occurrenceId":"8e916177-380e-4737-aace-d3fe101f4d04"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4d9ac6ac-6802-47f4-8731-5fa567713513","displayText":"Joan Soriano","occurrenceId":"0d8c0867-e5c0-4834-8e30-d196bb6c5fc0"}},{"text":" han contado los dos que los hacían descalzarse en la puerta y tocar turnos de doce horas sin zapatos y sin darles de comer.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los contratos llevan décadas discutiéndose. Los honorarios eran pequeños, y las familias de artistas ya muertos siguen reclamando regalías que dicen que nunca se pagaron. Tenía además la costumbre asentada de quedarse con el éxito ajeno: cuando pegaba un disco que no era suyo, sacaba su propia versión con alguno de sus artistas y dejaba que la emisora hiciera el resto. En los ochenta se lo hizo una y otra vez a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9736b552-1a72-4b02-9eac-88a453536809","displayText":"Juan Bautista","occurrenceId":"418dafa8-8f67-4d43-be80-7a66901f2dcf"}},{"text":", regrabándole tema tras tema con un cantante anunciado como El Solterito del Sur hasta que las copias se conocieron más que los originales.","type":"text"}]},{"type":"paragraph","content":[{"text":"Y aun así muchos de esos mismos músicos dicen que le deben la carrera, y lo dicen sin ironía. Las dos cosas son ciertas a la vez, y cualquier relato que se quede con una sola está describiendo a otra persona.","type":"text"}]},{"type":"paragraph","content":[{"text":"Perder el país","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La bachata cambió en los noventa. Las guitarras se electrificaron, el boicot se vino abajo en silencio a medida que la música se volvía presentable, la diáspora se la llevó afuera, y llegaron sellos extranjeros con presupuesto a firmar a los artistas que él había pasado treinta años criando. Competir con eso era una experiencia nueva para él.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su respuesta fue mudar Guarachita de AM a FM. Sonaba mejor y le costó lo único que importaba: la señal de AM cubría la república entera y la de FM llegaba a Santo Domingo. La emisora que había hecho un género nacional se quedó en emisora de una ciudad.","type":"text"}]},{"type":"paragraph","content":[{"text":"Murió en diciembre de 1999, a los sesenta y nueve años, con una pila de proyectos sin terminar. Dos de ellos iban por delante de todo lo que había hecho: un disco de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4d9ac6ac-6802-47f4-8731-5fa567713513","displayText":"Joan Soriano","occurrenceId":"a1a73e1d-d153-47bc-a247-b83bb5fc7483"}},{"text":" y un álbum de bachatas cantadas en creol haitiano. Las cintas se perdieron. Los dos acabaron rehaciéndolos otras manos, el de creol quince años después.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'radhames-aracena'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '031e60af-ac27-42a4-b61c-ddaf5bda4247', 'artist', '27c82e93-8c8f-4466-86ab-e1afba1e5487');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '0bf3e9d7-d3d4-44a0-b49e-4fab7d16c253', 'artist', '27c82e93-8c8f-4466-86ab-e1afba1e5487');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '0f10fd22-a661-4438-aa44-5b864c05cb6d', 'artist', '9333da06-ad03-44eb-9b81-c21d0ccdd0ea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '195086e3-0a55-4d24-b9cb-19f69d986146', 'artist', '2b644026-3e99-4229-a729-003f04103f30');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '2c3988c0-cb62-47d9-8bd2-bf1cc9703256', 'artist', '449f86a9-d10e-4fff-976f-9581fb3d03a1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '45ab57b5-a02e-4480-8f6c-e567e1cdee45', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '47863932-ab37-42ef-9478-e5211472c5df', 'artist', '9736b552-1a72-4b02-9eac-88a453536809');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '4e41d43a-093d-4b7e-bb95-9e01ce357f72', 'artist', '31915623-3206-4052-b13a-2170226671b9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '6e95c25b-9dc2-435d-a8e1-7726013b5a3c', 'artist', 'cbda65a4-c7da-4762-8cf8-f29b942d2ac3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '780ac789-9be1-471a-bea7-b09fe4233104', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '82aae451-1920-4b5b-a0d5-1ffed72a9d1d', 'artist', 'cbda65a4-c7da-4762-8cf8-f29b942d2ac3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), '8690a946-b589-45ba-a1d0-db1fe56199f7', 'artist', '4d9ac6ac-6802-47f4-8731-5fa567713513');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), 'a79d179c-6688-4229-8bbd-a50bc91f1a27', 'artist', 'e07267a0-7f9d-4ef5-928c-d4ade7dc921e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), 'a86aafff-fca0-4326-bab9-7b3f8f94cbe6', 'artist', 'c11c2dda-ffa1-4f09-9d24-00dc4473bc8d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'en'), 'de4a3420-eebb-42e1-80a5-dcb81bc5e8f0', 'artist', '4d9ac6ac-6802-47f4-8731-5fa567713513');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), '01ecb79e-7d74-496b-bb98-c716d3dadaad', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), '07cc4387-2a11-4a71-9992-3c7fa53d4213', 'artist', '27c82e93-8c8f-4466-86ab-e1afba1e5487');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), '0a2c044d-5588-4832-9034-ac83d811dcc6', 'artist', 'c11c2dda-ffa1-4f09-9d24-00dc4473bc8d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), '0d8c0867-e5c0-4834-8e30-d196bb6c5fc0', 'artist', '4d9ac6ac-6802-47f4-8731-5fa567713513');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), '1d106ed8-62e5-4fa9-928c-f5ebead49cb5', 'artist', '2b644026-3e99-4229-a729-003f04103f30');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), '206ed94f-29c2-4634-bafc-140d2d7a2ef1', 'artist', '27c82e93-8c8f-4466-86ab-e1afba1e5487');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), '3e5166da-f751-4e86-bedf-350c1dab7e05', 'artist', 'cbda65a4-c7da-4762-8cf8-f29b942d2ac3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), '418dafa8-8f67-4d43-be80-7a66901f2dcf', 'artist', '9736b552-1a72-4b02-9eac-88a453536809');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), '8e916177-380e-4737-aace-d3fe101f4d04', 'artist', 'cbda65a4-c7da-4762-8cf8-f29b942d2ac3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), 'a1a73e1d-d153-47bc-a247-b83bb5fc7483', 'artist', '4d9ac6ac-6802-47f4-8731-5fa567713513');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), 'a2168f89-25cb-48ef-bee9-17497db74ec2', 'artist', '31915623-3206-4052-b13a-2170226671b9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), 'a233d6b3-8bb9-4867-8d08-c269196bffb2', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), 'b9ab691a-514d-4b8e-b1f4-9e02c67d5668', 'artist', 'e07267a0-7f9d-4ef5-928c-d4ade7dc921e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), 'f812d25d-6346-4848-8fc1-65b77869b126', 'artist', '9333da06-ad03-44eb-9b81-c21d0ccdd0ea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'radhames-aracena') AND locale = 'es'), 'fb48eda4-5234-419c-93ce-6137103e3f29', 'artist', '449f86a9-d10e-4fff-976f-9581fb3d03a1');

COMMIT;
