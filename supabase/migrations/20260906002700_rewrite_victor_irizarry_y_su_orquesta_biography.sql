BEGIN;

-- Rewrite the catalogue entry for Víctor Irizarry y su Orquesta.
--
-- Victor Irizarry y su Orquesta. Filler in English, nothing in Spanish, no
-- gender, no instrument -- and the province was the importer's default.
--
-- OVERWRITTEN: province "Distrito Nacional" -> "La Romana" and birth_place
-- "Santo Domingo" -> "La Romana". Republica Merengue states it plainly -- "El
-- destacado cantante, bajista y director de orquesta Victor Irizarry es de la
-- Romana, Republica Dominicana" -- and the fullest biography written about him
-- was published by a La Romana history page.
--
-- ADDED: gender male, bassist, bandleader and arranger in occupations, bass in
-- instruments, and salsa in genres. He is described everywhere as a singer, a
-- bass player and an orchestra director, in that order, and as a figure in
-- merengue and salsa both.
--
-- SOURCES: "Victor Irizarry: El bajo de oro y la voz indomable que sacudio el
-- merengue", by Carlos "Manolete" Romero with a biographical frame by Manny
-- Castillo, published by the page La Romana y su Historia: he refused to remain
-- an accompanying bassist, took on directing his own orchestra and the lead
-- microphone, and "1974 marco un antes y un despues en la historia del
-- merengue" -- what that page calls the earthquake of La Soga and his national
-- consecration -- after which he returned to the Dominican Republic at the head
-- of an orchestra. Republica Merengue for La Romana and for merengue and salsa
-- both. Merengue Forever and other Dominican pages: singer, bassist and
-- orchestra director, popular and successful through the seventies and
-- eighties. MusicBrainz for the albums Victor Irizarry y... su Orquesta (1974),
-- La nueva fuerza (1976), Sabor... y merengue (1982) and Y seguira con eso...?
-- (1982), and for the later reissues Hits clasicos and La voa sazona (2023).
-- Spotify for the salsa album Pruebe Y Compare Mi Salsa (1978). A record
-- collector's listing of the Victor Irizarry Y Su Orquesta LP issued on New
-- York's Teca Records, described as a mix of salsa and merengue.
-- LARADIOESTACION's transfer of La Soga, dated 1974.
--
-- NOT WRITTEN: a date of birth. None is published anywhere found. The
-- biographical piece about him circulates only on social media and is not
-- indexed in full.
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
       name = 'Víctor Irizarry y su Orquesta',
       sort_name = 'Irizarry, Víctor',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue-orquesta',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'La Romana',
       province = 'La Romana',
       first_name = 'Víctor',
       middle_name = NULL,
       last_name = 'Irizarry',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['Víctor Irizarry']::text[],
       occupations = '["bassist","bandleader","arranger"]'::jsonb,
       instruments = ARRAY['bass']::text[],
       genres = ARRAY['merengue', 'salsa']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = 'channel/UCiLjavQwGOZNaoVAsHb-dHA',
       facebook = 'VictorIrizarryOrquesta',
       instagram = NULL,
       disambiguation = 'Dominican singer, bassist and bandleader from La Romana; the voice on La Soga',
       bio_en = 'Víctor Irizarry is a Dominican singer, bass player and orchestra leader from La Romana. He was one of the successful merengue names of the seventies and eighties, and La Soga is the record he is remembered by.

**The bass player who took the microphone**

He began where bass players begin, at the back. What the Dominican writers who have gone back over his career keep saying is that he refused to stay there: he took on running his own orchestra and singing lead at the same time, which is two jobs that pull in opposite directions.

A bandleader who sings has to hear the whole arrangement from inside his own vocal line. A bass player who sings has it harder still, because the bass is the part that cannot drift. One Dominican page calls him the golden bass and the untameable voice, and the compliment is really about doing both at once.

**La Soga**

The song landed in 1974 and the same page calls it an earthquake. Merengue at that moment was moving from the dance halls into a national commercial music, and a record that caught in that year caught everywhere.

An album followed under his own name, then La Nueva Fuerza in 1976. He had been working out of New York — his orchestra’s LP came out on Teca Records there, and collectors file it as a mix of salsa and merengue — and he brought the band back to the Dominican Republic at the head of it.

**Two genres at once**

He is a figure in salsa as well. Pruebe y Compare Mi Salsa came out in 1978, between the merengue records, and the New York LP sits in salsa collections rather than merengue ones.

That was not unusual for a Dominican bandleader working the New York circuit in those years. The same players covered both, the same audience danced to both, and the distinction mattered more to record shops than to anybody in the room.

**Later records**

Sabor… y Merengue and Y Seguirá Con Eso…? both came in 1982. His catalogue has since been reissued digitally, and La Soga still circulates.

He is one of those artists whose name survives among people who were there and among collectors, and barely anywhere else. There is no published date of birth for him.',
       bio_es = 'Víctor Irizarry es un cantante, bajista y director de orquesta dominicano, de La Romana. Fue uno de los nombres exitosos del merengue de los setenta y los ochenta, y La Soga es el disco por el que se le recuerda.

**El bajista que agarró el micrófono**

Empezó donde empiezan los bajistas, atrás. Lo que repiten los escritores dominicanos que han vuelto sobre su carrera es que se negó a quedarse ahí: se echó encima dirigir su propia orquesta y cantar la voz principal a la vez, que son dos oficios que tiran para lados contrarios.

Un director que canta tiene que oír el arreglo entero desde dentro de su propia línea de voz. Un bajista que canta lo tiene peor todavía, porque el bajo es la parte que no puede irse. Una página dominicana lo llama el bajo de oro y la voz indomable, y el elogio en realidad va por hacer las dos cosas a la vez.

**La Soga**

La canción cayó en 1974 y esa misma página la llama un terremoto. El merengue estaba pasando en ese momento de los salones de baile a ser una música comercial nacional, y un disco que pegara aquel año pegaba en todas partes.

Detrás vino un álbum con su propio nombre, y después La Nueva Fuerza, en 1976. Venía trabajando desde Nueva York —el elepé de su orquesta salió allá por Teca Records, y los coleccionistas lo archivan como una mezcla de salsa y merengue— y se trajo la banda de vuelta a República Dominicana al frente de ella.

**Dos géneros a la vez**

También es figura de la salsa. Pruebe y Compare Mi Salsa salió en 1978, entre los discos de merengue, y el elepé neoyorquino está en las colecciones de salsa antes que en las de merengue.

No era raro en un director dominicano que trabajara el circuito de Nueva York en aquellos años. Los mismos músicos cubrían los dos géneros, el mismo público bailaba los dos, y la distinción le importaba más a las tiendas de discos que a nadie que estuviera en el salón.

**Discos posteriores**

Sabor… y Merengue y Y Seguirá Con Eso…? salieron los dos en 1982. Su catálogo se ha reeditado después en digital, y La Soga sigue circulando.

Es de esos artistas cuyo nombre sobrevive entre la gente que estuvo y entre los coleccionistas, y casi en ningún otro sitio. No hay fecha de nacimiento publicada.',
       updated_at = now()
 WHERE slug = 'victor-irizarry-y-su-orquesta';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'victor-irizarry-y-su-orquesta')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'victor-irizarry-y-su-orquesta')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Víctor Irizarry is a Dominican singer, bass player and orchestra leader from La Romana. He was one of the successful merengue names of the seventies and eighties, and La Soga is the record he is remembered by.","type":"text"}]},{"type":"paragraph","content":[{"text":"The bass player who took the microphone","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He began where bass players begin, at the back. What the Dominican writers who have gone back over his career keep saying is that he refused to stay there: he took on running his own orchestra and singing lead at the same time, which is two jobs that pull in opposite directions.","type":"text"}]},{"type":"paragraph","content":[{"text":"A bandleader who sings has to hear the whole arrangement from inside his own vocal line. A bass player who sings has it harder still, because the bass is the part that cannot drift. One Dominican page calls him the golden bass and the untameable voice, and the compliment is really about doing both at once.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Soga","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The song landed in 1974 and the same page calls it an earthquake. Merengue at that moment was moving from the dance halls into a national commercial music, and a record that caught in that year caught everywhere.","type":"text"}]},{"type":"paragraph","content":[{"text":"An album followed under his own name, then La Nueva Fuerza in 1976. He had been working out of New York — his orchestra’s LP came out on Teca Records there, and collectors file it as a mix of salsa and merengue — and he brought the band back to the Dominican Republic at the head of it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two genres at once","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is a figure in salsa as well. Pruebe y Compare Mi Salsa came out in 1978, between the merengue records, and the New York LP sits in salsa collections rather than merengue ones.","type":"text"}]},{"type":"paragraph","content":[{"text":"That was not unusual for a Dominican bandleader working the New York circuit in those years. The same players covered both, the same audience danced to both, and the distinction mattered more to record shops than to anybody in the room.","type":"text"}]},{"type":"paragraph","content":[{"text":"Later records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Sabor… y Merengue and Y Seguirá Con Eso…? both came in 1982. His catalogue has since been reissued digitally, and La Soga still circulates.","type":"text"}]},{"type":"paragraph","content":[{"text":"He is one of those artists whose name survives among people who were there and among collectors, and barely anywhere else. There is no published date of birth for him.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'victor-irizarry-y-su-orquesta'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Víctor Irizarry es un cantante, bajista y director de orquesta dominicano, de La Romana. Fue uno de los nombres exitosos del merengue de los setenta y los ochenta, y La Soga es el disco por el que se le recuerda.","type":"text"}]},{"type":"paragraph","content":[{"text":"El bajista que agarró el micrófono","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó donde empiezan los bajistas, atrás. Lo que repiten los escritores dominicanos que han vuelto sobre su carrera es que se negó a quedarse ahí: se echó encima dirigir su propia orquesta y cantar la voz principal a la vez, que son dos oficios que tiran para lados contrarios.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un director que canta tiene que oír el arreglo entero desde dentro de su propia línea de voz. Un bajista que canta lo tiene peor todavía, porque el bajo es la parte que no puede irse. Una página dominicana lo llama el bajo de oro y la voz indomable, y el elogio en realidad va por hacer las dos cosas a la vez.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Soga","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La canción cayó en 1974 y esa misma página la llama un terremoto. El merengue estaba pasando en ese momento de los salones de baile a ser una música comercial nacional, y un disco que pegara aquel año pegaba en todas partes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Detrás vino un álbum con su propio nombre, y después La Nueva Fuerza, en 1976. Venía trabajando desde Nueva York —el elepé de su orquesta salió allá por Teca Records, y los coleccionistas lo archivan como una mezcla de salsa y merengue— y se trajo la banda de vuelta a República Dominicana al frente de ella.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos géneros a la vez","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"También es figura de la salsa. Pruebe y Compare Mi Salsa salió en 1978, entre los discos de merengue, y el elepé neoyorquino está en las colecciones de salsa antes que en las de merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"No era raro en un director dominicano que trabajara el circuito de Nueva York en aquellos años. Los mismos músicos cubrían los dos géneros, el mismo público bailaba los dos, y la distinción le importaba más a las tiendas de discos que a nadie que estuviera en el salón.","type":"text"}]},{"type":"paragraph","content":[{"text":"Discos posteriores","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Sabor… y Merengue y Y Seguirá Con Eso…? salieron los dos en 1982. Su catálogo se ha reeditado después en digital, y La Soga sigue circulando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es de esos artistas cuyo nombre sobrevive entre la gente que estuvo y entre los coleccionistas, y casi en ningún otro sitio. No hay fecha de nacimiento publicada.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'victor-irizarry-y-su-orquesta'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
