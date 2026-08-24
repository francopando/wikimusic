/**
 * Spanish editorial content for genre pages.
 *
 * Genre title/subtitle/description/history are sourced from the Supabase
 * `genres` table (falling back to `genres.ts` for general editorial copy).
 * History is database-authored only; Spanish history falls back to the
 * database-authored English history when no Spanish value is available.
 *
 * Coverage is enforced by `npm run i18n:audit` (genre-content parity check).
 */

export type GenreContentOverride = {
  title?: string;
  subtitle?: string;
  description?: string;
  history?: string;
};

export const bachataHistoryEs = [
  "**Qué es la bachata**\nLa bachata es música, canto, poesía popular y baile social nacidos en la República Dominicana. Su centro expresivo es la guitarra y sus letras suelen hablar, con lenguaje directo, de amor, deseo, ausencia, traición, nostalgia y vida cotidiana. Antes de nombrar un género, la palabra «bachata» designaba una reunión informal y festiva; con el tiempo pasó a identificar esta tradición dominicana de cuerdas, percusión y baile en pareja.",
  "**Raíces y nacimiento discográfico**\nSe formó a partir del bolero rítmico y del bolero de guitarra, en diálogo con el son cubano, la guaracha, el cha-cha-chá y el merengue. Las reuniones campesinas, los patios, bares y barrios populares fueron espacios decisivos para su desarrollo. Tras el fin de la dictadura de Trujillo y la apertura de la industria discográfica, José Manuel Calderón grabó en 1962 «Borracho de amor» y «Qué será de mí (Condena)», reconocidas entre las primeras bachatas registradas. En aquel momento se hablaba también de bolero campesino, música de guitarra o música de amargue.",
  "**Una música marginada**\nDurante las décadas de 1960 y 1970, buena parte de la radio comercial, la prensa y las élites culturales la despreciaron por asociarla con la pobreza rural, los barrios periféricos, los bares y los prostíbulos. «Música de amargue» describía tanto la intensidad de sus relatos como el prejuicio social que pesaba sobre sus intérpretes y oyentes. Radio Guarachita, fundada por Radhamés Aracena, fue fundamental: grabó, difundió y distribuyó a artistas que encontraban cerradas muchas otras puertas.",
  "**Pioneros y consolidación**\nJosé Manuel Calderón, Edilio Paredes, Ramón Cordero, Mélida Rodríguez, Aridia Ventura y Leonardo Paniagua figuran entre las voces y guitarras que definieron la primera etapa. Luis Segura, «El Añoñaíto», dio al amargue una enorme proyección popular; «Pena por ti» (1982) suele señalarse como un punto de inflexión en su entrada a públicos más amplios. Las mujeres participaron desde temprano, aunque la industria les ofreció menos oportunidades y visibilidad.",
  "**Cómo suena y cómo se toca**\nEl conjunto típico reúne requinto o guitarra principal, segunda o guitarra rítmica, bajo, bongó y güira; la voz principal puede apoyarse en coros. El requinto contesta al cantante con arpegios, adornos e interludios; la segunda sostiene la síncopa; el bajo dibuja el impulso armónico; y bongó y güira organizan el pulso bailable. En la interpretación se oyen cambios de textura conocidos como derecho, majao y mambo: no son canciones distintas, sino maneras de intensificar, aliviar o abrir el arreglo. También existen formatos acústicos, eléctricos y ampliados con tambora, teclados, saxofón u otros recursos.",
  "**De las cuerdas acústicas al sonido eléctrico**\nLa bachata temprana empleaba guitarras de cuerdas de nailon y maracas. Entre finales de los setenta y los ochenta se aceleró, absorbió más elementos del merengue y sustituyó progresivamente las maracas por la güira metálica. Blas Durán popularizó una sonoridad más eléctrica y vigorosa —«Mujeres hembras» (1987) es una referencia decisiva—, mientras guitarristas como Luis Vargas expandieron el lenguaje del requinto con efectos, fraseos más agresivos y una producción moderna.",
  "**Del amargue a la aceptación nacional**\nEn los años ochenta y noventa, Luis Segura, Blas Durán, Luis Vargas, Antony Santos, Raulín Rodríguez y otros convirtieron una música estigmatizada en fenómeno nacional y transnacional. Antony Santos combinó lirismo romántico, energía bailable y guitarra eléctrica en un estilo de enorme influencia. En paralelo, Víctor Víctor y Sonia Silvestre acercaron la bachata a otros circuitos culturales. Juan Luis Guerra y 4.40 dieron un salto internacional con *Bachata Rosa* (1990), un álbum de producción sofisticada que ganó el Grammy y ayudó a transformar la percepción pública del género.",
  "**La diáspora y la bachata global**\nLa migración dominicana llevó la bachata a Nueva York, Puerto Rico y otras comunidades, y después a Europa y América Latina. Aventura, formado en el Bronx, mezcló la base guitarrera con R&B, hip-hop y pop; «Obsesión» (2002) se convirtió en un éxito internacional. Monchy & Alexandra, Xtreme, Prince Royce y Romeo Santos ampliaron después su alcance sin borrar la conversación entre tradición y modernidad. Hoy conviven grabaciones de raíz, bachata romántica, propuestas urbanas, fusiones pop y experimentos electrónicos.",
  "**El baile dominicano**\nSe baila en pareja sobre una estructura musical de cuatro tiempos, normalmente organizada en frases de ocho. El paso básico desplaza el peso durante tres tiempos y marca o acentúa el cuarto con el pie y la cadera; puede comenzar en cualquiera de las direcciones y adaptarse a la música. La forma dominicana privilegia la conexión, el juego rítmico, los cambios entre posición abierta y cerrada, los giros y un trabajo de pies espontáneo. No existe una única secuencia obligatoria: escuchar la güira, el bongó, el bajo, la guitarra y las pausas guía la improvisación.",
  "**Estilos de baile difundidos internacionalmente**\nLa bachata tradicional o dominicana conserva el énfasis rítmico y el diálogo de los pies. La bachata moderna, desarrollada fuera de la isla, incorpora líneas, giros y patrones tomados de otros bailes de pareja. La bachata sensual, surgida en España, emplea disociaciones, ondas corporales y una conexión más continua para interpretar melodías y pausas. También circulan fusiones como bachatango y bachata urbana. Son maneras de bailar creadas en contextos distintos; no deben confundirse automáticamente con subgéneros musicales ni sustituir el origen dominicano de la tradición.",
  "**Temas, lenguaje e identidad**\nEl repertorio abarca despecho, erotismo, reconciliación, humor, migración y orgullo social. Sus cantantes convirtieron experiencias antes excluidas de la cultura oficial en memoria compartida. Por eso la historia de la bachata es también una historia de clase, raza, género, urbanización y diáspora: pasó de ser usada como etiqueta despectiva a funcionar como emblema de identidad dominicana y vínculo entre generaciones.",
  "**Patrimonio vivo**\nEn 2019, la UNESCO inscribió «la música y el baile de la bachata dominicana» en la Lista Representativa del Patrimonio Cultural Inmaterial de la Humanidad. La distinción reconoce una práctica transmitida en familias, comunidades, celebraciones, academias y escenarios de la diáspora. Más que una pieza de museo, la bachata sigue cambiando cada vez que una guitarra improvisa, una letra cuenta una experiencia nueva o una pareja interpreta el compás.",
].join("\n\n");

export const genreContentEs: Record<string, GenreContentOverride> = {
  merengue: {
    subtitle: "Pambiche, Típico",
    description:
      "El merengue es uno de los sonidos más representativos de la identidad dominicana, combinando baile, ritmo, orquestación y narrativa popular.",
  },
  bachata: {
    subtitle: "Romántica, Tradicional, Moderna",
    description:
      "La bachata es un género dominicano moldeado por la expresión romántica con guitarra, la influencia del bolero y la narrativa popular de los barrios.",
    history: bachataHistoryEs,
  },
  salsa: {
    subtitle: "Tropical, Bailable",
    description:
      "La salsa, en el contexto dominicano, conecta el ritmo caribeño, la cultura del baile y a los intérpretes dominicanos que aportaron a la escena más amplia de la música tropical.",
  },
  urbano: {
    subtitle: "Dembow, Reggaetón",
    description:
      "La música urbana dominicana incluye dembow, reggaetón, rap, trap y estilos contemporáneos relacionados que reflejan la cultura juvenil, la expresión callejera y las tendencias latinas globales.",
  },
  pop: {
    subtitle: "Pop Latino, Contemporáneo",
    description:
      "El pop destaca a artistas y grabaciones dominicanas moldeadas por la composición contemporánea, la producción comercial y las influencias del pop latino.",
  },
  rock: {
    subtitle: "Rock, Alternativo",
    description:
      "El rock abarca el rock dominicano, el alternativo, el punk, el metal y la música impulsada por guitarras a través de las generaciones.",
  },
  reggae: {
    subtitle: "Reggae, Caribeño",
    description:
      "El reggae incluye grabaciones dominicanas conectadas con el reggae, el dancehall y el intercambio musical caribeño más amplio.",
  },
  jazz: {
    subtitle: "Jazz, Jazz Latino",
    description:
      "El jazz documenta a músicos de jazz dominicanos, improvisadores, agrupaciones y grabaciones moldeadas por las tradiciones latinas y caribeñas.",
  },
  electronic: {
    title: "Electrónica",
    subtitle: "Electrónica, Dance",
    description:
      "La música electrónica abarca a DJs, productores, música de baile y grabaciones dominicanas construidas en torno a la producción electrónica y la experimentación.",
  },
  instrumental: {
    subtitle: "Clásica",
    description:
      "La música instrumental destaca a músicos, arreglistas, orquestas e intérpretes clásicos dominicanos, así como obras instrumentales conectadas con la cultura musical dominicana.",
  },
  ballads: {
    title: "Baladas",
    subtitle: "Bolero, Romántica",
    description:
      "Las baladas incluyen canciones románticas, grabaciones con influencia del bolero e interpretaciones vocales centradas en la melodía, la letra y la interpretación emocional.",
  },
  folklore: {
    title: "Folclore",
    subtitle: "Tradicional, Raíces",
    description:
      "El folclore representa la música tradicional y de raíces dominicana, preservando los ritmos regionales, la memoria cultural y el patrimonio popular.",
  },
  fusion: {
    title: "Fusión",
    subtitle: "Tropical, Experimental",
    description:
      "La fusión incluye a artistas y grabaciones dominicanas que mezclan deliberadamente géneros establecidos, tradiciones tropicales e influencias globales.",
  },
  more: {
    title: "Más Géneros",
    subtitle: "Explora más sonidos dominicanos",
    description:
      "Explora géneros, estilos y categorías musicales dominicanas adicionales que no encajan en los grupos principales.",
  },
};

/**
 * Returns a genre-like object with its editorial fields replaced by Spanish
 * copy when `locale === "es"` and a translation exists; otherwise unchanged.
 */
export function localizeGenreContent<
  T extends {
    slug: string;
    title: string;
    subtitle?: string | null;
    description?: string | null;
    history?: string | null;
    historyEs?: string | null;
  },
>(genre: T, locale: string): T {
  if (locale !== "es") return genre;
  const es = genreContentEs[genre.slug];
  if (!es) return genre;
  return {
    ...genre,
    title: es.title ?? genre.title,
    subtitle: es.subtitle ?? genre.subtitle,
    description: es.description ?? genre.description,
    history: genre.historyEs ?? es.history ?? genre.history,
  };
}
