BEGIN;

-- Lenny Salcedo — new artist record and biography (both locales).
--
-- Dominican Christian singer, songwriter and producer from Moca; half of the
-- duo Juanpa & Lenny, and a 2014 Latin Grammy nominee.
--
-- Sourcing: career chronology, birthplace, the Elila Mena schooling and the
-- award tallies come from the artist's own site, lennysalcedo.com; the 2014
-- Latin Grammy nomination (Best Christian Album in Spanish, for the album
-- Nuevo, released via One Music Entertainment and LP Musik) is corroborated by
-- Dominican press coverage naming the full nominee field; the February 2023
-- Juanpa & Lenny reunion and the December 2025 Al Otro Lado collaboration with
-- Chris Lebrón come from Listín Diario and Diario Libre respectively.
--
-- Not recorded: year of birth. His own site gives the day and month (6 March)
-- but no year, and date_of_birth cannot store a partial date — birth_day and
-- birth_month are generated from it. The day and month appear in the prose
-- instead of being completed with a guessed year.
--
-- No artistReference nodes: every proper name in the prose was audited against
-- the catalogue and none of them is a catalogued artist, so all correctly
-- remain plain text.

INSERT INTO artists (
  id, name, sort_name, slug, first_name, last_name, type, status, gender,
  primary_role, occupations, primary_genre, genres, artist_tags,
  disambiguation, birth_place, province, website, instagram, facebook, youtube,
  has_image, created_at, updated_at
) VALUES (
  'a42ec361-635d-467f-9b7c-f2ccda1cb8e3',
  'Lenny Salcedo',
  'Salcedo, Lenny',
  'lenny-salcedo',
  'Lenny',
  'Salcedo',
  'solo_artist',
  'published',
  'male',
  'singer',
  -- must not repeat primary_role. "writer" covers the two published books.
  '["songwriter", "producer", "writer"]'::jsonb,
  'worship',
  ARRAY[]::text[],
  ARRAY['christian']::text[],
  'Dominican Christian singer-songwriter and producer, of the duo Juanpa & Lenny',
  'Moca',
  'Espaillat',
  'https://www.lennysalcedo.com/',
  'lennysalcedo',
  'Lennysalcedoofficial',
  -- Stored as the channel URL rather than an @handle: the handle could not be
  -- confirmed to resolve to this channel, and ArtistFactsCard already parses
  -- the youtube.com/channel/<id> form.
  'https://www.youtube.com/channel/UCgv3suvKSp-yXLp7mot6gPQ',
  false,
  now(),
  now()
)
ON CONFLICT (slug) DO NOTHING;

-- English biography. The Spanish is written
-- independently rather than translated.
INSERT INTO editorial_documents (
  id, document_type, locale, schema_version, document, status,
  owner_artist_id, revision, created_at, updated_at
) VALUES (
  '58338457-e074-4820-a5fc-5d41af48b89f', 'artist_biography', 'en', 1,
  $json${"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Lenny Salcedo is a Dominican Christian singer, songwriter and producer from Moca, nominated for a Latin Grammy in 2014 and, as half of the duo Juanpa & Lenny, the co-author of Al Otro Lado — a song that became a fixture of Dominican Christian youth in the early 2000s and has outlived the duo that made it. He has worked on both sides of the glass, producing and writing for artists well outside the Christian market."}]},{"type":"paragraph","content":[{"type":"text","text":"Moca and an early musical schooling","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Salcedo was born on 6 March in Moca, in the province of Espaillat. He read before he was three, and at seven his mother, María Abreu, enrolled him at the Elila Mena elementary music school in Santo Domingo, where he took up instruments, solfège and voice. The training turned into teaching early: he was recognised nationally as the country's youngest teacher and named most outstanding teacher in 2002."}]},{"type":"paragraph","content":[{"type":"text","text":"Six In One and Juanpa & Lenny","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"At seventeen he founded Six In One, which recorded close to three albums and established itself among the leading groups in Santo Domingo. In 2004 he formed the duo Juanpa & Lenny, which became the most widely heard Spanish-language male duo in Christian music and reached the top of the sacred-music charts across Latin America. Their first single was El amor viene de Dios; in 2010, El Milagro held the upper positions of Puerto Rican Christian radio for more than nine consecutive weeks."}]},{"type":"paragraph","content":[{"type":"text","text":"Al Otro Lado is the record the duo is remembered by. It reached well past the churches that first carried it, and in February 2023 Salcedo brought Juanpa & Lenny back together for the first time in twelve years. In December 2025 he recorded the song again as an acoustic live collaboration with the Puerto Rican singer Chris Lebrón."}]},{"type":"paragraph","content":[{"type":"text","text":"Solo career and the Latin Grammy nomination","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"His solo career opened in 2011 with Todo Obra Para Bien. The album Nuevo, released through One Music Entertainment and his own LP Musik, brought him a 2014 Latin Grammy nomination for Best Christian Album in Spanish, in a field that also included Marcos Witt, Marcos Vidal, Coalo Zamorano and Danilo Montero. La Biblia Dice followed in 2018 and charted at home and across Latin America, and in 2020 he marked twenty years in music with Un Milagro Con Tu Nombre."}]},{"type":"paragraph","content":[{"type":"text","text":"Producing, writing and publishing","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Salcedo produces through LP Musik and the SongFactoryRD studios, and his work as a writer and producer has reached artists working entirely outside Christian music, among them Divino, Víctor Manuelle and Ozuna; Nicky Jam has taken up his compositions as well. He has also published two books, Al otro Lado and Todo obra para bien, both named for songs."}]},{"type":"paragraph","content":[{"type":"text","text":"Recognition","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Latin Grammy nomination, Best Christian Album in Spanish, 2014, for Nuevo"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Multiple Premios Soberano nominations"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Galardón — four awards from ten nominations"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Named most outstanding teacher in the Dominican Republic, 2002"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Legacy","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Salcedo's standing rests less on any single record than on a song and a partnership. Al Otro Lado passed from the duo into general use, sung by congregations and covered by artists with no particular connection to Christian music, and the 2023 reunion and 2025 re-recording show a catalogue that has kept circulating rather than settling into nostalgia. His production work is the quieter half of the career: a Dominican Christian writer whose material reached the commercial Latin mainstream without his name attached to it."}]}]}$json$::jsonb,
  'published', 'a42ec361-635d-467f-9b7c-f2ccda1cb8e3', 1, now(), now()
);

UPDATE artists
SET bio_en = 'Lenny Salcedo is a Dominican Christian singer, songwriter and producer from Moca, nominated for a Latin Grammy in 2014 and, as half of the duo Juanpa & Lenny, the co-author of Al Otro Lado — a song that became a fixture of Dominican Christian youth in the early 2000s and has outlived the duo that made it. He has worked on both sides of the glass, producing and writing for artists well outside the Christian market.

**Moca and an early musical schooling**

Salcedo was born on 6 March in Moca, in the province of Espaillat. He read before he was three, and at seven his mother, María Abreu, enrolled him at the Elila Mena elementary music school in Santo Domingo, where he took up instruments, solfège and voice. The training turned into teaching early: he was recognised nationally as the country''s youngest teacher and named most outstanding teacher in 2002.

**Six In One and Juanpa & Lenny**

At seventeen he founded Six In One, which recorded close to three albums and established itself among the leading groups in Santo Domingo. In 2004 he formed the duo Juanpa & Lenny, which became the most widely heard Spanish-language male duo in Christian music and reached the top of the sacred-music charts across Latin America. Their first single was El amor viene de Dios; in 2010, El Milagro held the upper positions of Puerto Rican Christian radio for more than nine consecutive weeks.

Al Otro Lado is the record the duo is remembered by. It reached well past the churches that first carried it, and in February 2023 Salcedo brought Juanpa & Lenny back together for the first time in twelve years. In December 2025 he recorded the song again as an acoustic live collaboration with the Puerto Rican singer Chris Lebrón.

**Solo career and the Latin Grammy nomination**

His solo career opened in 2011 with Todo Obra Para Bien. The album Nuevo, released through One Music Entertainment and his own LP Musik, brought him a 2014 Latin Grammy nomination for Best Christian Album in Spanish, in a field that also included Marcos Witt, Marcos Vidal, Coalo Zamorano and Danilo Montero. La Biblia Dice followed in 2018 and charted at home and across Latin America, and in 2020 he marked twenty years in music with Un Milagro Con Tu Nombre.

**Producing, writing and publishing**

Salcedo produces through LP Musik and the SongFactoryRD studios, and his work as a writer and producer has reached artists working entirely outside Christian music, among them Divino, Víctor Manuelle and Ozuna; Nicky Jam has taken up his compositions as well. He has also published two books, Al otro Lado and Todo obra para bien, both named for songs.

**Recognition**

- Latin Grammy nomination, Best Christian Album in Spanish, 2014, for Nuevo  
- Multiple Premios Soberano nominations  
- El Galardón — four awards from ten nominations  
- Named most outstanding teacher in the Dominican Republic, 2002

**Legacy**

Salcedo''s standing rests less on any single record than on a song and a partnership. Al Otro Lado passed from the duo into general use, sung by congregations and covered by artists with no particular connection to Christian music, and the 2023 reunion and 2025 re-recording show a catalogue that has kept circulating rather than settling into nostalgia. His production work is the quieter half of the career: a Dominican Christian writer whose material reached the commercial Latin mainstream without his name attached to it.', updated_at = now()
WHERE id = 'a42ec361-635d-467f-9b7c-f2ccda1cb8e3';

-- Spanish biography. The Spanish is written
-- independently rather than translated.
INSERT INTO editorial_documents (
  id, document_type, locale, schema_version, document, status,
  owner_artist_id, revision, created_at, updated_at
) VALUES (
  '3423e294-c367-4c1b-b0e1-6eb242b98753', 'artist_biography', 'es', 1,
  $json${"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Lenny Salcedo es un cantante, compositor y productor cristiano dominicano nacido en Moca, nominado al Grammy Latino en 2014 y coautor, como mitad del dúo Juanpa & Lenny, de Al Otro Lado, una canción que marcó a la juventud cristiana dominicana de comienzos de los 2000 y que ha sobrevivido al dúo que la creó. Ha trabajado a ambos lados del cristal, produciendo y escribiendo para artistas muy ajenos al mercado cristiano."}]},{"type":"paragraph","content":[{"type":"text","text":"Moca y una formación musical temprana","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Salcedo nació un 6 de marzo en Moca, provincia Espaillat. Leía antes de cumplir los tres años, y a los siete su madre, María Abreu, lo inscribió en la escuela elemental de música Elila Mena, en Santo Domingo, donde se inició en los instrumentos, el solfeo y el canto. La formación derivó pronto en docencia: fue reconocido nacionalmente como el maestro más joven del país y distinguido como maestro más destacado en 2002."}]},{"type":"paragraph","content":[{"type":"text","text":"Six In One y Juanpa & Lenny","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"A los diecisiete fundó Six In One, con el que grabó cerca de tres álbumes y se situó entre las agrupaciones más sonadas de Santo Domingo. En 2004 formó el dueto Juanpa & Lenny, que llegó a ser el dúo masculino de habla hispana más escuchado de la música cristiana y encabezó las listas de música sacra en América Latina. Su primer sencillo fue El amor viene de Dios; en 2010, El Milagro se mantuvo más de nueve semanas consecutivas en los primeros lugares de la radio cristiana de Puerto Rico."}]},{"type":"paragraph","content":[{"type":"text","text":"Al Otro Lado es el tema por el que se recuerda al dúo. Rebasó ampliamente las iglesias que lo difundieron primero, y en febrero de 2023 Salcedo reunió a Juanpa & Lenny por primera vez en doce años. En diciembre de 2025 volvió a grabarla como colaboración acústica en vivo con el puertorriqueño Chris Lebrón."}]},{"type":"paragraph","content":[{"type":"text","text":"Carrera solista y la nominación al Grammy Latino","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Su carrera en solitario arrancó en 2011 con Todo Obra Para Bien. El álbum Nuevo, publicado por One Music Entertainment y su propio sello LP Musik, le valió en 2014 una nominación al Grammy Latino como mejor álbum cristiano en español, en una terna que incluía además a Marcos Witt, Marcos Vidal, Coalo Zamorano y Danilo Montero. La Biblia Dice llegó en 2018 y sonó en el país y en toda América Latina, y en 2020 celebró veinte años de carrera con Un Milagro Con Tu Nombre."}]},{"type":"paragraph","content":[{"type":"text","text":"Producción, composición y libros","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Salcedo produce desde LP Musik y los estudios SongFactoryRD, y su trabajo como compositor y productor ha llegado a artistas por completo ajenos a la música cristiana, entre ellos Divino, Víctor Manuelle y Ozuna; Nicky Jam también ha retomado composiciones suyas. Ha publicado además dos libros, Al otro Lado y Todo obra para bien, ambos titulados como canciones."}]},{"type":"paragraph","content":[{"type":"text","text":"Reconocimientos","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Nominación al Grammy Latino, mejor álbum cristiano en español, 2014, por Nuevo"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Varias nominaciones a los Premios Soberano"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Galardón — cuatro premios de diez nominaciones"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Maestro más destacado de la República Dominicana, 2002"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Legado","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"La posición de Salcedo descansa menos en un disco concreto que en una canción y una sociedad. Al Otro Lado pasó del dúo al uso general, cantada por congregaciones y versionada por artistas sin vínculo particular con la música cristiana, y tanto el reencuentro de 2023 como la regrabación de 2025 muestran un repertorio que sigue circulando en vez de instalarse en la nostalgia. Su trabajo de producción es la mitad más callada de la carrera: un compositor cristiano dominicano cuyo material llegó al mainstream latino comercial sin que su nombre viajara con él."}]}]}$json$::jsonb,
  'published', 'a42ec361-635d-467f-9b7c-f2ccda1cb8e3', 1, now(), now()
);

UPDATE artists
SET bio_es = 'Lenny Salcedo es un cantante, compositor y productor cristiano dominicano nacido en Moca, nominado al Grammy Latino en 2014 y coautor, como mitad del dúo Juanpa & Lenny, de Al Otro Lado, una canción que marcó a la juventud cristiana dominicana de comienzos de los 2000 y que ha sobrevivido al dúo que la creó. Ha trabajado a ambos lados del cristal, produciendo y escribiendo para artistas muy ajenos al mercado cristiano.

**Moca y una formación musical temprana**

Salcedo nació un 6 de marzo en Moca, provincia Espaillat. Leía antes de cumplir los tres años, y a los siete su madre, María Abreu, lo inscribió en la escuela elemental de música Elila Mena, en Santo Domingo, donde se inició en los instrumentos, el solfeo y el canto. La formación derivó pronto en docencia: fue reconocido nacionalmente como el maestro más joven del país y distinguido como maestro más destacado en 2002.

**Six In One y Juanpa & Lenny**

A los diecisiete fundó Six In One, con el que grabó cerca de tres álbumes y se situó entre las agrupaciones más sonadas de Santo Domingo. En 2004 formó el dueto Juanpa & Lenny, que llegó a ser el dúo masculino de habla hispana más escuchado de la música cristiana y encabezó las listas de música sacra en América Latina. Su primer sencillo fue El amor viene de Dios; en 2010, El Milagro se mantuvo más de nueve semanas consecutivas en los primeros lugares de la radio cristiana de Puerto Rico.

Al Otro Lado es el tema por el que se recuerda al dúo. Rebasó ampliamente las iglesias que lo difundieron primero, y en febrero de 2023 Salcedo reunió a Juanpa & Lenny por primera vez en doce años. En diciembre de 2025 volvió a grabarla como colaboración acústica en vivo con el puertorriqueño Chris Lebrón.

**Carrera solista y la nominación al Grammy Latino**

Su carrera en solitario arrancó en 2011 con Todo Obra Para Bien. El álbum Nuevo, publicado por One Music Entertainment y su propio sello LP Musik, le valió en 2014 una nominación al Grammy Latino como mejor álbum cristiano en español, en una terna que incluía además a Marcos Witt, Marcos Vidal, Coalo Zamorano y Danilo Montero. La Biblia Dice llegó en 2018 y sonó en el país y en toda América Latina, y en 2020 celebró veinte años de carrera con Un Milagro Con Tu Nombre.

**Producción, composición y libros**

Salcedo produce desde LP Musik y los estudios SongFactoryRD, y su trabajo como compositor y productor ha llegado a artistas por completo ajenos a la música cristiana, entre ellos Divino, Víctor Manuelle y Ozuna; Nicky Jam también ha retomado composiciones suyas. Ha publicado además dos libros, Al otro Lado y Todo obra para bien, ambos titulados como canciones.

**Reconocimientos**

- Nominación al Grammy Latino, mejor álbum cristiano en español, 2014, por Nuevo  
- Varias nominaciones a los Premios Soberano  
- El Galardón — cuatro premios de diez nominaciones  
- Maestro más destacado de la República Dominicana, 2002

**Legado**

La posición de Salcedo descansa menos en un disco concreto que en una canción y una sociedad. Al Otro Lado pasó del dúo al uso general, cantada por congregaciones y versionada por artistas sin vínculo particular con la música cristiana, y tanto el reencuentro de 2023 como la regrabación de 2025 muestran un repertorio que sigue circulando en vez de instalarse en la nostalgia. Su trabajo de producción es la mitad más callada de la carrera: un compositor cristiano dominicano cuyo material llegó al mainstream latino comercial sin que su nombre viajara con él.', updated_at = now()
WHERE id = 'a42ec361-635d-467f-9b7c-f2ccda1cb8e3';

COMMIT;
