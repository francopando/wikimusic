BEGIN;

-- Rewrite the catalogue entry for Carmen Jiménez.
--
-- Carmen Jimenez. Filler in English, nothing in Spanish, no gender -- and a
-- birthplace that is wrong in a way that matters.
--
-- NATIONALITY: FOR THE EDITOR TO DECIDE, and the entry is written so that
-- either decision is easy. She was born in Puerto Rico and raised in New York.
-- Her father is from Loiza, Puerto Rico; her mother is from San Jose de las
-- Matas, Dominican Republic. Diario Libre calls her "cantante puertorriquena"
-- in one headline and "la artista boricua dominicana" in the body of the same
-- piece.
--
-- THE CASE FOR KEEPING HER: this catalogue already holds artists born abroad to
-- Dominican families -- Prince Royce, Mark B, Daniel Santacruz, all filed under
-- the Born Abroad sentinel. Her mother is Dominican, she works in merengue and
-- nothing else, she recorded her fourth album in Santiago, and she invented and
-- runs a label named for a Dominican fusion. THE CASE AGAINST: unlike Felix
-- Cumbe, Silvio Mora, Dominic or O.G. Black, no source found says she has ever
-- lived in the Dominican Republic. She is Dominican by descent and by trade,
-- not by residence.
--
-- OVERWRITTEN: birth_place "Santo Domingo" -> "Puerto Rico" and province
-- "Distrito Nacional" -> "Born Abroad". The old pair was the importer's default
-- and it was simply false; correcting it is right whichever way the nationality
-- question goes. Added the diaspora tag on the same reasoning.
--
-- ADDED: gender female, the aliases she is billed under, and composer, producer
-- and music educator in occupations.
--
-- SOURCES: Operabase's artist page, which carries her own biography: "Carmen
-- Jimenez is descended from a mixture of the Caribbean, her father is from
-- Loiza, Puerto Rico... and her mother is from San Jose de las Matas, Dominican
-- Republic... Carmen Jimenez was born in Puerto Rico and raised in New York",
-- and which files her as a mezzo-soprano; the same page dates Caribena Soy to
-- October 2023, calls it her fourth album, and says it was recorded in Santiago
-- and produced by Merenchata. Her own site, carmenjimenez.com, which describes
-- her as a composer and music producer and the founder of Merenchata; her own
-- Instagram account, @merenchatamusica, repeating the family account. Listin
-- Diario, 7 July 2024, "La doctora y cantante Carmen Jimenez lanza su nuevo
-- album Caribena soy, en honor a sus origenes", on the formal Dominican launch.
-- Diario Libre, 7 January 2025, on the album Pasion and on the billing she gives
-- herself, "La Show Woman del Merengue". Her own video copy for Caribena Soy:
-- "compuesta e interpretada por Carmen Jimenez, resalta la belleza de la
-- Republica Dominicana y Puerto Rico". MusicBrainz for the single Feliz Navidad,
-- 20 September 2024, and Spotify for No Sufras Como Yo, Imagine and Fue Por
-- Interes. Merenchata's own release copy for the single Carnaval.
--
-- NOT WRITTEN: what her doctorate is in. Dominican outlets introduce her as
-- "la doctora y cantante" without saying, and guessing would be inventing.
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
       name = 'Carmen Jiménez',
       sort_name = 'Jiménez, Carmen',
       type = 'solo_artist',
       status = 'published',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Puerto Rico',
       province = 'Born Abroad',
       first_name = 'Carmen',
       middle_name = NULL,
       last_name = 'Jiménez',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['La Caribeña', 'La Show Woman del Merengue']::text[],
       occupations = '["composer","producer","music educator"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['bachata']::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = 'www.carmenjimenez.com',
       youtube = '@carmenjimenez8886',
       facebook = NULL,
       instagram = 'merenchatamusica',
       disambiguation = 'Merengue singer and founder of Merenchata; Dominican mother, born in Puerto Rico',
       bio_en = 'Carmen Jiménez is a merengue singer, composer and producer who records under the name La Caribeña and bills herself as la Show Woman del Merengue. She founded Merenchata, which is both her label and her name for the merengue-and-bachata fusion she works in.

**Two islands and a third city**

Her father is from Loíza, on the Puerto Rican coast; her mother is from San José de las Matas, in the Dominican Cibao. She was born in Puerto Rico and grew up in New York, which makes her a Caribbean of the kind the twentieth century produced in large numbers and the record industry has never known where to file.

She has settled it herself by naming the album after it. Caribeña Soy is written and sung by her and is explicitly about the beauty of both islands — a title that refuses to choose, from a woman who has been asked to choose all her life.

**Recording in Santiago**

Caribeña Soy is her fourth album. It came out in October 2023, cut in Santiago de los Caballeros and produced by her own Merenchata, and it was formally launched in the Dominican Republic the following July. Pasión followed in January 2025.

Carnaval, Feliz Navidad, No Sufras Como Yo, Fue Por Interés and a merengue reading of Imagine are among the singles. The voice is trained — she is filed as a mezzo-soprano in the classical directories — and that is audible in merengue, where most singing is done by ear and at volume.

**Running the label**

Merenchata is not a vanity imprint. She writes, produces and releases through it, and the Dominican press treats its announcements as news. Owning the company that puts out your own records is rare for a woman in merengue and rarer still for one who did not come up inside a Dominican orchestra.

Dominican outlets introduce her as la doctora y cantante — she holds a doctorate as well as a career — and as an educator and a businesswoman. The singing is one of several things she does properly.',
       bio_es = 'Carmen Jiménez es cantante, compositora y productora de merengue, graba bajo el nombre de La Caribeña y se anuncia como la Show Woman del Merengue. Fundó Merenchata, que es a la vez su sello y el nombre que le puso a la fusión de merengue y bachata en la que trabaja.

**Dos islas y una tercera ciudad**

Su padre es de Loíza, en la costa puertorriqueña; su madre es de San José de las Matas, en el Cibao dominicano. Ella nació en Puerto Rico y se crió en Nueva York, lo que la hace caribeña de una clase que el siglo veinte produjo en cantidad y que la industria del disco nunca ha sabido dónde archivar.

Ella misma lo resolvió poniéndole nombre al disco. Caribeña Soy está escrita y cantada por ella y trata explícitamente de la belleza de las dos islas: un título que se niega a escoger, de una mujer a la que le han pedido escoger toda la vida.

**Grabar en Santiago**

Caribeña Soy es su cuarto álbum. Salió en octubre de 2023, grabado en Santiago de los Caballeros y producido por su propia Merenchata, y se lanzó formalmente en República Dominicana en julio siguiente. Pasión vino en enero de 2025.

Carnaval, Feliz Navidad, No Sufras Como Yo, Fue Por Interés y una lectura merenguera de Imagine están entre los sencillos. La voz es de estudio —los directorios de música clásica la registran como mezzosoprano— y eso se oye en el merengue, donde casi todo el mundo canta de oído y a volumen.

**Llevar el sello**

Merenchata no es un sello de vanidad. Ella escribe, produce y publica por ahí, y la prensa dominicana trata sus anuncios como noticia. Ser dueña de la empresa que saca tus propios discos es raro para una mujer en el merengue, y más raro todavía para una que no se formó dentro de una orquesta dominicana.

Los medios dominicanos la presentan como la doctora y cantante —tiene un doctorado además de una carrera— y como educadora y empresaria. Cantar es una de varias cosas que hace bien.',
       updated_at = now()
 WHERE slug = 'carmen-jimenez';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'carmen-jimenez')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'carmen-jimenez')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Carmen Jiménez is a merengue singer, composer and producer who records under the name La Caribeña and bills herself as la Show Woman del Merengue. She founded Merenchata, which is both her label and her name for the merengue-and-bachata fusion she works in.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two islands and a third city","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Her father is from Loíza, on the Puerto Rican coast; her mother is from San José de las Matas, in the Dominican Cibao. She was born in Puerto Rico and grew up in New York, which makes her a Caribbean of the kind the twentieth century produced in large numbers and the record industry has never known where to file.","type":"text"}]},{"type":"paragraph","content":[{"text":"She has settled it herself by naming the album after it. Caribeña Soy is written and sung by her and is explicitly about the beauty of both islands — a title that refuses to choose, from a woman who has been asked to choose all her life.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recording in Santiago","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Caribeña Soy is her fourth album. It came out in October 2023, cut in Santiago de los Caballeros and produced by her own Merenchata, and it was formally launched in the Dominican Republic the following July. Pasión followed in January 2025.","type":"text"}]},{"type":"paragraph","content":[{"text":"Carnaval, Feliz Navidad, No Sufras Como Yo, Fue Por Interés and a merengue reading of Imagine are among the singles. The voice is trained — she is filed as a mezzo-soprano in the classical directories — and that is audible in merengue, where most singing is done by ear and at volume.","type":"text"}]},{"type":"paragraph","content":[{"text":"Running the label","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Merenchata is not a vanity imprint. She writes, produces and releases through it, and the Dominican press treats its announcements as news. Owning the company that puts out your own records is rare for a woman in merengue and rarer still for one who did not come up inside a Dominican orchestra.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican outlets introduce her as la doctora y cantante — she holds a doctorate as well as a career — and as an educator and a businesswoman. The singing is one of several things she does properly.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'carmen-jimenez'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Carmen Jiménez es cantante, compositora y productora de merengue, graba bajo el nombre de La Caribeña y se anuncia como la Show Woman del Merengue. Fundó Merenchata, que es a la vez su sello y el nombre que le puso a la fusión de merengue y bachata en la que trabaja.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos islas y una tercera ciudad","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su padre es de Loíza, en la costa puertorriqueña; su madre es de San José de las Matas, en el Cibao dominicano. Ella nació en Puerto Rico y se crió en Nueva York, lo que la hace caribeña de una clase que el siglo veinte produjo en cantidad y que la industria del disco nunca ha sabido dónde archivar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ella misma lo resolvió poniéndole nombre al disco. Caribeña Soy está escrita y cantada por ella y trata explícitamente de la belleza de las dos islas: un título que se niega a escoger, de una mujer a la que le han pedido escoger toda la vida.","type":"text"}]},{"type":"paragraph","content":[{"text":"Grabar en Santiago","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Caribeña Soy es su cuarto álbum. Salió en octubre de 2023, grabado en Santiago de los Caballeros y producido por su propia Merenchata, y se lanzó formalmente en República Dominicana en julio siguiente. Pasión vino en enero de 2025.","type":"text"}]},{"type":"paragraph","content":[{"text":"Carnaval, Feliz Navidad, No Sufras Como Yo, Fue Por Interés y una lectura merenguera de Imagine están entre los sencillos. La voz es de estudio —los directorios de música clásica la registran como mezzosoprano— y eso se oye en el merengue, donde casi todo el mundo canta de oído y a volumen.","type":"text"}]},{"type":"paragraph","content":[{"text":"Llevar el sello","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Merenchata no es un sello de vanidad. Ella escribe, produce y publica por ahí, y la prensa dominicana trata sus anuncios como noticia. Ser dueña de la empresa que saca tus propios discos es raro para una mujer en el merengue, y más raro todavía para una que no se formó dentro de una orquesta dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los medios dominicanos la presentan como la doctora y cantante —tiene un doctorado además de una carrera— y como educadora y empresaria. Cantar es una de varias cosas que hace bien.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'carmen-jimenez'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
