import type { ComponentType, SVGProps } from "react";
import {
  AudioWaveform,
  BoomBox,
  Disc3,
  Drum,
  Ellipsis,
  Guitar,
  Heart,
  Headphones,
  MicVocal,
  Music,
  Music4,
  Radio,
  Waves,
} from "lucide-react";
import { GiMusicalNotes, GiMusicalScore, GiSaxophone } from "react-icons/gi";

type GenreIcon = ComponentType<
  SVGProps<SVGSVGElement> & {
    "aria-hidden"?: boolean;
  }
>;

export type GenreDefinition = {
  slug: string;
  title: string;
  subtitle: string;
  description: string;
  history?: string;
  historyEs?: string;
  primaryGenre: string | null;
  aliases: string[];
  relatedGenres: string[];
  catalogId?: number;
  subgenres?: GenreSubgenre[];
  href: string;
  color: string;
  icon: GenreIcon;
};

export type GenreSubgenre = {
  id: number;
  slug: string;
  name: string;
  description: string | null;
  history?: string | null;
  historyEs?: string | null;
};

export const genreSpectrumGradients = {
  merengue: "bg-gradient-to-br from-red-500 to-orange-500",
  bachata: "bg-gradient-to-br from-orange-500 to-amber-500",
  salsa: "bg-gradient-to-br from-amber-500 to-emerald-600",
  urbano: "bg-gradient-to-br from-emerald-600 to-teal-500",
  ballads: "bg-gradient-to-br from-teal-500 to-sky-500",
  rock: "bg-gradient-to-br from-sky-500 to-blue-600",
  instrumental: "bg-gradient-to-br from-blue-600 to-indigo-500",
  fusion: "bg-gradient-to-br from-indigo-500 to-violet-500",
  folklore: "bg-gradient-to-br from-violet-500 to-gray-300",
  more: "bg-gradient-to-br from-gray-300 to-gray-400",
} as const;

export const genreDefinitions = [
  {
    slug: "merengue",
    title: "Merengue",
    subtitle: "Pambiche, Típico",
    description:
      "Merengue is one of the most representative sounds of Dominican identity, combining dance, rhythm, orchestration, and popular storytelling.",
    primaryGenre: "merengue",
    aliases: ["merengue", "pambiche", "típico", "tipico", "merengue típico", "merengue tipico"],
    relatedGenres: ["bachata", "salsa", "folklore", "fusion"],
    href: "/genres/merengue",
    color: genreSpectrumGradients.merengue,
    icon: GiMusicalNotes,
  },
  {
    slug: "bachata",
    title: "Bachata",
    subtitle: "Romantic, Traditional, Modern",
    description:
      "Bachata is a Dominican genre shaped by guitar-based romantic expression, bolero influence, and popular neighborhood storytelling.",
    primaryGenre: "bachata",
    history: [
      "**What is bachata?**\nBachata is music, song, popular poetry, and social dance born in the Dominican Republic. The guitar is its expressive center, and its lyrics often speak directly about love, desire, absence, betrayal, nostalgia, and everyday life. Before naming a genre, the word “bachata” referred to an informal, lively gathering; over time, it came to identify this Dominican tradition of strings, percussion, and partner dancing.",
      "**Roots and the first recordings**\nThe genre developed from rhythmic bolero and guitar-based bolero in conversation with Cuban son, guaracha, cha-cha-chá, and merengue. Rural gatherings, patios, bars, and working-class neighborhoods were crucial to its growth. After the end of the Trujillo dictatorship and the opening of the recording industry, José Manuel Calderón recorded “Borracho de amor” and “Qué será de mí (Condena)” in 1962, recognized among the earliest recorded bachatas. At the time, the music was also called rural bolero, guitar music, or música de amargue—music of bitterness.",
      "**A marginalized music**\nDuring the 1960s and 1970s, much of commercial radio, the press, and the cultural elite disparaged bachata because of its association with rural poverty, peripheral neighborhoods, bars, and brothels. The name música de amargue described both the intensity of its stories and the social prejudice carried by its performers and listeners. Radio Guarachita, founded by Radhamés Aracena, was essential: it recorded, broadcast, and distributed artists who found many other doors closed to them.",
      "**Pioneers and consolidation**\nJosé Manuel Calderón, Edilio Paredes, Ramón Cordero, Mélida Rodríguez, Aridia Ventura, and Leonardo Paniagua were among the voices and guitarists who shaped the early period. Luis Segura, “El Añoñaíto,” brought amargue to an enormous popular audience; “Pena por ti” (1982) is often identified as a turning point in its movement toward broader acceptance. Women participated from the beginning, although the industry gave them fewer opportunities and less visibility.",
      "**How bachata sounds and is played**\nThe standard ensemble brings together a requinto or lead guitar, segunda or rhythm guitar, bass, bongó, and güira, with a lead singer often supported by backing vocals. The requinto answers the singer with arpeggios, ornaments, and interludes; the segunda maintains the syncopation; the bass supplies harmonic momentum; and the bongó and güira organize the dance pulse. Performances move through textures commonly called derecho, majao, and mambo—not separate songs, but ways of easing, intensifying, or opening the arrangement. Bachata can also be played in acoustic, electric, or expanded formats with tambora, keyboards, saxophone, and other instruments.",
      "**From acoustic strings to an electric sound**\nEarly bachata used nylon-string guitars and maracas. From the late 1970s through the 1980s, the music became faster, absorbed more elements of merengue, and gradually replaced maracas with the metal güira. Blas Durán popularized a more forceful electric sound—“Mujeres hembras” (1987) is a decisive reference—while guitarists such as Luis Vargas expanded the requinto vocabulary through effects, more aggressive phrasing, and modern production.",
      "**From amargue to national acceptance**\nDuring the 1980s and 1990s, Luis Segura, Blas Durán, Luis Vargas, Antony Santos, Raulín Rodríguez, and others transformed a stigmatized music into a national and transnational phenomenon. Antony Santos combined romantic lyricism, dance energy, and electric guitar in a hugely influential style. In parallel, Víctor Víctor and Sonia Silvestre brought bachata into different cultural circuits. Juan Luis Guerra and 4.40 made an international leap with *Bachata Rosa* (1990), a sophisticated production that won a Grammy and helped reshape public perceptions of the genre.",
      "**The diaspora and global bachata**\nDominican migration carried bachata to New York, Puerto Rico, and other communities, and later throughout Europe and Latin America. Formed in the Bronx, Aventura blended its guitar foundation with R&B, hip-hop, and pop; “Obsesión” (2002) became an international hit. Monchy & Alexandra, Xtreme, Prince Royce, and Romeo Santos later extended its reach without erasing the conversation between tradition and modernity. Roots-oriented recordings, romantic bachata, urban productions, pop fusions, and electronic experiments now coexist.",
      "**Dominican dance**\nBachata is danced with a partner over four musical beats, usually organized into eight-count phrases. The basic step transfers weight for three beats and marks or accents the fourth with the foot and hip; it can begin in any direction and adapt to the music. Dominican dancing emphasizes connection, rhythmic play, movement between open and closed positions, turns, and spontaneous footwork. There is no single mandatory sequence: listening to the güira, bongó, bass, guitar, and musical pauses guides the improvisation.",
      "**Dance styles spread internationally**\nTraditional or Dominican bachata preserves rhythmic emphasis and a lively dialogue in the feet. Modern bachata, developed outside the island, incorporates lines, turns, and patterns borrowed from other partner dances. Sensual bachata, which emerged in Spain, uses isolations, body waves, and a more continuous connection to interpret melodies and pauses. Fusions such as bachatango and urban bachata also circulate internationally. These are dance approaches created in different settings; they should not automatically be confused with musical subgenres or allowed to obscure the tradition’s Dominican origin.",
      "**Themes, language, and identity**\nThe repertoire encompasses heartbreak, eroticism, reconciliation, humor, migration, and social pride. Its singers turned experiences once excluded from official culture into shared memory. The history of bachata is therefore also a history of class, race, gender, urbanization, and diaspora: a term once used dismissively became an emblem of Dominican identity and a bond between generations.",
      "**Living heritage**\nIn 2019, UNESCO inscribed “the music and dance of Dominican bachata” on the Representative List of the Intangible Cultural Heritage of Humanity. The designation recognizes a practice transmitted through families, communities, celebrations, academies, and stages across the diaspora. Bachata is not a museum piece: it continues to change whenever a guitar improvises, a lyric tells a new experience, or a dancing couple interprets the rhythm.",
    ].join("\n\n"),
    aliases: ["bachata", "bachata tradicional", "bachata moderna", "bachata romántica", "bachata romantica"],
    relatedGenres: ["merengue", "ballads", "urbano"],
    href: "/genres/bachata",
    color: genreSpectrumGradients.bachata,
    icon: Heart,
  },
  {
    slug: "salsa",
    title: "Salsa",
    subtitle: "Tropical, Dance",
    description:
      "Salsa in the Dominican context connects Caribbean rhythm, dance culture, and Dominican performers who contributed to the wider tropical music scene.",
    primaryGenre: "salsa",
    aliases: ["salsa", "salsa dominicana", "tropical"],
    relatedGenres: ["merengue", "bachata", "ballads"],
    href: "/genres/salsa",
    color: genreSpectrumGradients.salsa,
    icon: Drum,
  },
  {
    slug: "urbano",
    title: "Urbano",
    subtitle: "Dembow, Reggaeton",
    description:
      "Dominican urban music includes dembow, reggaeton, rap, trap, and related contemporary styles that reflect youth culture, street expression, and global Latin trends.",
    primaryGenre: "urban",
    aliases: ["urban", "urbano", "dembow", "reggaeton", "rap", "hip-hop", "hip hop", "trap"],
    relatedGenres: ["fusion", "bachata", "merengue"],
    href: "/genres/urbano",
    color: genreSpectrumGradients.urbano,
    icon: Disc3,
  },
  {
    slug: "pop",
    title: "Pop",
    subtitle: "Latin Pop, Contemporary",
    description:
      "Pop highlights Dominican artists and recordings shaped by contemporary songwriting, mainstream production, and Latin pop influences.",
    primaryGenre: "pop",
    aliases: ["pop", "latin pop", "pop latino", "christian pop", "pop cristiano"],
    relatedGenres: ["ballads", "rock", "electronic", "urbano"],
    href: "/genres/pop",
    color: "bg-fuchsia-500",
    icon: Radio,
  },
  {
    slug: "rock",
    title: "Rock",
    subtitle: "Rock, Alternative",
    description:
      "Rock covers Dominican rock, alternative, punk, metal, and guitar-driven music across generations.",
    primaryGenre: "rock",
    aliases: ["rock", "alternative", "alternativo", "punk", "metal", "latin rock"],
    relatedGenres: ["pop", "electronic", "fusion"],
    href: "/genres/rock",
    color: genreSpectrumGradients.rock,
    icon: Guitar,
  },
  {
    slug: "reggae",
    title: "Reggae",
    subtitle: "Reggae, Caribbean",
    description:
      "Reggae includes Dominican recordings connected to reggae, dancehall, and wider Caribbean musical exchange.",
    primaryGenre: "reggae",
    aliases: ["reggae", "dancehall", "tropical reggae"],
    relatedGenres: ["urbano", "fusion", "rock"],
    href: "/genres/reggae",
    color: "bg-lime-600",
    icon: Headphones,
  },
  {
    slug: "jazz",
    title: "Jazz",
    subtitle: "Jazz, Latin Jazz",
    description:
      "Jazz documents Dominican jazz musicians, improvisers, ensembles, and recordings shaped by Latin and Caribbean traditions.",
    primaryGenre: "jazz",
    aliases: ["jazz", "latin jazz", "jazz fusion"],
    relatedGenres: ["instrumental", "fusion", "folklore"],
    href: "/genres/jazz",
    color: "bg-violet-700",
    icon: Music4,
  },
  {
    slug: "electronic",
    title: "Electronic",
    subtitle: "Electronic, Dance",
    description:
      "Electronic covers Dominican DJs, producers, dance music, and recordings built around electronic production and experimentation.",
    primaryGenre: "electronic",
    aliases: ["electronic", "electrónica", "electronica", "edm", "dance", "dj"],
    relatedGenres: ["pop", "rock", "fusion", "urbano"],
    href: "/genres/electronic",
    color: "bg-cyan-600",
    icon: AudioWaveform,
  },
  {
    slug: "instrumental",
    title: "Instrumental",
    subtitle: "Classical",
    description:
      "Instrumental music highlights Dominican musicians, arrangers, orchestras, classical performers, and instrumental works connected to Dominican musical culture.",
    primaryGenre: "instrumental",
    aliases: ["instrumental", "classical", "clásica", "clasica", "orchestral", "orquesta", "piano"],
    relatedGenres: ["jazz", "fusion", "folklore", "ballads"],
    href: "/genres/instrumental",
    color: genreSpectrumGradients.instrumental,
    icon: GiMusicalScore,
  },
  {
    slug: "ballads",
    title: "Ballads",
    subtitle: "Bolero, Romantic",
    description:
      "Ballads include romantic songs, bolero-influenced recordings, and vocal performances centered on melody, lyrics, and emotional interpretation.",
    primaryGenre: "ballads",
    aliases: ["ballads", "ballad", "balada", "baladas", "bolero", "romantic", "romántica", "romantica"],
    relatedGenres: ["bachata", "salsa", "instrumental"],
    href: "/genres/ballads",
    color: genreSpectrumGradients.ballads,
    icon: MicVocal,
  },
  {
    slug: "folklore",
    title: "Folklore",
    subtitle: "Traditional, Roots",
    description:
      "Folklore represents traditional and roots-based Dominican music, preserving regional rhythms, cultural memory, and popular heritage.",
    primaryGenre: "folklore",
    aliases: ["folklore", "folklórico", "folklorico", "traditional", "tradicional", "roots", "raices", "raíces"],
    relatedGenres: ["merengue", "instrumental", "fusion"],
    href: "/genres/folklore",
    color: genreSpectrumGradients.folklore,
    icon: BoomBox,
  },
  {
    slug: "fusion",
    title: "Fusion",
    subtitle: "Tropical, Experimental",
    description:
      "Fusion includes Dominican artists and recordings that deliberately blend established genres, tropical traditions, and global influences.",
    primaryGenre: "fusion",
    aliases: ["fusion", "fusión", "experimental", "tropical fusion", "afro-caribbean fusion"],
    relatedGenres: ["instrumental", "jazz", "rock", "electronic", "urbano", "folklore", "merengue"],
    href: "/genres/fusion",
    color: genreSpectrumGradients.fusion,
    icon: GiSaxophone,
  },
  {
    slug: "more",
    title: "More Genres",
    subtitle: "Explore more Dominican sounds",
    description:
      "Explore additional Dominican genres, styles, and musical categories that do not fit into the main groups.",
    primaryGenre: null,
    aliases: [],
    relatedGenres: ["merengue", "bachata", "salsa", "urbano", "ballads", "pop", "rock", "reggae", "jazz", "electronic", "instrumental", "folklore", "fusion"],
    href: "/genres/more",
    color: genreSpectrumGradients.more,
    icon: Ellipsis,
  },
] satisfies GenreDefinition[];

export function getGenreDefinition(slug: string) {
  return genreDefinitions.find((genre) => genre.slug === slug) ?? null;
}

export function createGenericGenreDefinition({
  id,
  slug,
  title,
  description,
  aliases,
  subgenres,
}: {
  id: number;
  slug: string;
  title: string;
  description: string;
  aliases: string[];
  subgenres: GenreSubgenre[];
}): GenreDefinition {
  return {
    slug,
    title,
    subtitle: subgenres.slice(0, 3).map((subgenre) => subgenre.name).join(", "),
    description,
    primaryGenre: null,
    aliases,
    relatedGenres: [],
    catalogId: id,
    subgenres,
    href: `/genres/${slug}`,
    color: "bg-gray-300",
    icon: Ellipsis,
  };
}
