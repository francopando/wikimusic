BEGIN;

-- Reverts 20260905320000_drop_occupations_repeating_primary_role.sql.
--
-- Restores each of the 234 affected artists to the exact occupations
-- array it held beforehand, including the redundant values that migration
-- removed. Keyed by id, so records changed since are not disturbed beyond
-- their occupations column.

UPDATE artists SET occupations = '["musician","vocalist"]'::jsonb, updated_at = now() WHERE id = '9761143c-4e04-4590-8fa7-fe82674a6cf7';  -- [MERGED] Juan Luis Guerra  & 4.40
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '3b50d339-1ddb-455f-80fd-34cd953a44b4';  -- Abel
UPDATE artists SET occupations = '["rapper","songwriter","composer","producer"]'::jsonb, updated_at = now() WHERE id = '61781451-6220-4b5c-9074-9c1b6d2ec2ab';  -- Ada Betsabé
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = '5ea95de4-bc3f-468f-8d7e-442eab202a93';  -- Adriel Music
UPDATE artists SET occupations = '["producer"]'::jsonb, updated_at = now() WHERE id = '83278734-f0dc-4561-92f2-d2b029f60861';  -- Adriel.sfx
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = '88304ea5-3c5f-4a3d-8f72-6e99e925ccb7';  -- AKINOhayLEY
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'afa7b00a-ebe4-4a62-aa94-f120f810af67';  -- Albert Mendez
UPDATE artists SET occupations = '["saxophonist","arranger","musician"]'::jsonb, updated_at = now() WHERE id = '0d90e940-b27f-4983-8146-81899c729246';  -- Albertino Graciano
UPDATE artists SET occupations = '["composer","pianist","arranger","producer","bandleader"]'::jsonb, updated_at = now() WHERE id = '12263c19-ea47-4a2b-b33f-1c42e397f344';  -- Alberto "Ringo" Martínez
UPDATE artists SET occupations = '["vocalist","composer","actor"]'::jsonb, updated_at = now() WHERE id = '1410b448-6357-4895-a32a-58708697e10d';  -- Alberto Beltrán
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = 'dba9a057-4e1b-4602-b0af-dd14aeb264e3';  -- Alejandro Torrens
UPDATE artists SET occupations = '["vocalist","guitarist"]'::jsonb, updated_at = now() WHERE id = '6c3e0d74-23b7-4d80-969f-9d5319ee5127';  -- Alex Bueno
UPDATE artists SET occupations = '["percussionist","bandleader","musician"]'::jsonb, updated_at = now() WHERE id = 'cc388346-fb30-46cc-90ae-4ee0ac2c35c4';  -- Alex Díaz
UPDATE artists SET occupations = '["songwriter","vocalist","producer","guitarist"]'::jsonb, updated_at = now() WHERE id = 'a0c641ff-4a9a-4171-a765-7bea47e623b6';  -- Alex Ferreira
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = '14777546-5b72-4dcf-b18a-15320124a0ee';  -- Alex Matos
UPDATE artists SET occupations = '["songwriter","vocalist","guitarist"]'::jsonb, updated_at = now() WHERE id = '59f1f901-ea28-41d4-afa9-f7385dd594a4';  -- Alih Jey
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'afa96005-6c92-419e-8ab9-2fc4d2ae0cc0';  -- Alinna Vargas
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '2f416ff2-3d9f-46ac-9072-13f4ba73c391';  -- Allendy
UPDATE artists SET occupations = '["vocalist","bandleader","songwriter"]'::jsonb, updated_at = now() WHERE id = '71cf6272-50ba-4bb9-8211-b3d3bddfe3ae';  -- Amarfis
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = '5fb12fee-64fe-4887-b87e-28f28a15c4f9';  -- Amenazzy
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '22de671f-2ec6-41f9-abef-7effec5bed97';  -- Anaís
UPDATE artists SET occupations = '["songwriter","vocalist","guitarist"]'::jsonb, updated_at = now() WHERE id = 'c834e323-7e56-4e4b-8413-b02556eb2ecc';  -- Andre Parra Marte
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'b3bfb1d2-2727-4181-a9f2-680dbe84b16b';  -- André Velóz
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = '4fc53691-33ab-4ae0-a2e5-72b5d67b2183';  -- Andrés Rodríguez
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'b8f26dfb-06b1-43de-8117-ef1c60b2e206';  -- Angel Dior
UPDATE artists SET occupations = '["vocalist","producer"]'::jsonb, updated_at = now() WHERE id = '987ec9d9-fcf0-4afd-be22-ba74c3d620d6';  -- Anon Müller
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '600d9e8c-4b46-40f2-a083-24ef05f5bfbe';  -- Anthony
UPDATE artists SET occupations = '["vocalist","musician"]'::jsonb, updated_at = now() WHERE id = 'de2f4d59-b736-4691-961a-f1f010e67f85';  -- AntiHippie
UPDATE artists SET occupations = '["vocalist","guitarist"]'::jsonb, updated_at = now() WHERE id = '3c671ce9-585f-492f-bc0c-7cf3da6f75c6';  -- Antonio Vásquez
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'a7692e02-72d2-4cd2-914a-63e14073698e';  -- Aramis Villalona
UPDATE artists SET occupations = '["vocalist","musician"]'::jsonb, updated_at = now() WHERE id = '3bcd6c98-08d9-4008-8b5f-72ce8a10afa5';  -- Archaios
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = '01db8904-c39e-428d-bbea-da4049a79ee6';  -- Aridia Ventura
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '8e7eee90-35c9-4151-a8a5-fa91c8b311cf';  -- Arrozito
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'e324ca2d-27a5-491b-97e7-f8c81396cfcc';  -- Asdrubar
UPDATE artists SET occupations = '["vocalist","bandleader"]'::jsonb, updated_at = now() WHERE id = '15775d55-9e10-46bc-8516-ee7468724ec0';  -- Benny Sadel
UPDATE artists SET occupations = '["composer","musician","lyricist"]'::jsonb, updated_at = now() WHERE id = '19e6c6f8-bdd7-4137-953f-0657b8617259';  -- Bienvenido Brens
UPDATE artists SET occupations = '["composer","pianist"]'::jsonb, updated_at = now() WHERE id = '4b85d1eb-ebaa-42b5-9901-5e2805af9138';  -- Bienvenido Fabián
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '4363445d-711d-4e7f-b60b-7de274f81d17';  -- Blackee Impala
UPDATE artists SET occupations = '["musician","vocalist"]'::jsonb, updated_at = now() WHERE id = '3dd4ffd4-6d58-4e78-b6d8-28f126eaed08';  -- BlackFox
UPDATE artists SET occupations = '["vocalist","guitarist","songwriter"]'::jsonb, updated_at = now() WHERE id = '2b644026-3e99-4229-a729-003f04103f30';  -- Blas Durán
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = 'c61142b8-986a-4ae0-a31b-f93b056237e4';  -- Brandom Regino
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '550df3b5-6488-4aec-a476-a5d28d52ceea';  -- Bulin 47
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = 'a81458f1-ccaa-451a-8cd5-2afd4d27affb';  -- Casandra Damirón
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = '9e585186-f3b8-4720-979b-505f6198558e';  -- Charytin
UPDATE artists SET occupations = '["musician","singer","composer","percussionist"]'::jsonb, updated_at = now() WHERE id = '0337dec9-fe9d-485f-be56-a9120b92fbe8';  -- Chichi Peralta
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = 'cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b';  -- Chimbala
UPDATE artists SET occupations = '["singer","composer","musician"]'::jsonb, updated_at = now() WHERE id = 'c11c2dda-ffa1-4f09-9d24-00dc4473bc8d';  -- Cuco Valoy
UPDATE artists SET occupations = '["vocalist","musician"]'::jsonb, updated_at = now() WHERE id = '05c24036-cee1-4fee-bc15-6e376235d153';  -- Daniel Checo
UPDATE artists SET occupations = '["composer","vocalist","producer","musician"]'::jsonb, updated_at = now() WHERE id = '84aba9ce-ba69-4caa-b71b-2bedb2f848fc';  -- Daniel Santacruz
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '33b2b3b7-67a7-4bb5-a02b-21765c961297';  -- Dary Hezz
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'bd9602a9-9fc8-4792-b8cc-a470742a216d';  -- Delfín Tu Salsero
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '6f95dfa1-463d-4487-b774-82c63358f1c9';  -- Devin
UPDATE artists SET occupations = '["vocalist","bandleader","musician"]'::jsonb, updated_at = now() WHERE id = '439a9467-df91-459c-9c87-aa8640b780f8';  -- Dioris Valladares
UPDATE artists SET occupations = '["dj","producer","musician","songwriter","composer"]'::jsonb, updated_at = now() WHERE id = '8243655e-17a7-4dea-98ee-1c16674c38cd';  -- DJ Adoni
UPDATE artists SET occupations = '["dj","singer","songwriter","producer"]'::jsonb, updated_at = now() WHERE id = '56339ed8-84c9-47eb-be7f-41449dd04865';  -- DJ Arelis Hot
UPDATE artists SET occupations = '["dj"]'::jsonb, updated_at = now() WHERE id = 'fc7db5b6-35fe-4f8d-a7b3-d1a3c13f495d';  -- DJ Gabriel Beast
UPDATE artists SET occupations = '["dj"]'::jsonb, updated_at = now() WHERE id = '9615de95-19e4-46be-bad8-9ed67cb3c6b8';  -- DJ Joe Catador
UPDATE artists SET occupations = '["dj"]'::jsonb, updated_at = now() WHERE id = 'dd05b1f8-01cb-4e63-a630-db82c9583f18';  -- DJ Mari D
UPDATE artists SET occupations = '["dj","producer"]'::jsonb, updated_at = now() WHERE id = '919b182d-973f-4f11-96a4-cb3a9763afd4';  -- DJ Miller
UPDATE artists SET occupations = '["dj","producer"]'::jsonb, updated_at = now() WHERE id = 'e0c48f11-acb7-4cf5-a1e3-6874f59ddc2e';  -- DJ Plano
UPDATE artists SET occupations = '["dj","producer","singer"]'::jsonb, updated_at = now() WHERE id = '9bf41d47-c5ab-45e3-b048-7bb7886b0912';  -- DJ Scuff
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '36ebc210-c772-4d02-a92f-cdedb953692a';  -- Dominic
UPDATE artists SET occupations = '["vocalist","producer","composer"]'::jsonb, updated_at = now() WHERE id = '6321da6c-e2d5-490a-a4e8-416bbee81edf';  -- Don Miguelo
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'c960822a-caf3-4598-8714-172139a91957';  -- Donaty
UPDATE artists SET occupations = '["vocalist","musician"]'::jsonb, updated_at = now() WHERE id = '60322cee-49d2-431b-9a5c-1f17b860ef8a';  -- Draconum Oth
UPDATE artists SET occupations = '["composer","vocalist","musician"]'::jsonb, updated_at = now() WHERE id = '41fa2ce2-dd3d-44b8-82b5-ab2df86f9a8a';  -- Duluc
UPDATE artists SET occupations = '["vocalist","bandleader","composer"]'::jsonb, updated_at = now() WHERE id = 'ae3c0afb-0e0a-4506-bbe6-a59c3c68bb1e';  -- Eddy Herrera
UPDATE artists SET occupations = '["producer","vocalist"]'::jsonb, updated_at = now() WHERE id = 'b8699416-10d2-4c84-a43a-2a035387126f';  -- Eklectico
UPDATE artists SET occupations = '["vocalist","composer","producer"]'::jsonb, updated_at = now() WHERE id = '559f2ed4-8831-483b-bc00-7cb4f340ad92';  -- El Alfa
UPDATE artists SET occupations = '["composer","vocalist","producer"]'::jsonb, updated_at = now() WHERE id = 'd4551f69-84e9-4c33-a51e-1dbd8ea2aff0';  -- El Cata
UPDATE artists SET occupations = '["vocalist","composer","musician"]'::jsonb, updated_at = now() WHERE id = '8be8c38c-e6a5-4e0d-83d1-8c8d20813ce6';  -- El Chaval de la Bachata
UPDATE artists SET occupations = '["vocalist","composer","songwriter"]'::jsonb, updated_at = now() WHERE id = '0b2e1a39-b265-42d6-95d5-85ad930eee84';  -- El Cherry Scom
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'fd3c8182-ba3a-4b0d-9c19-e7dfaa1658fb';  -- El Fecho RD
UPDATE artists SET occupations = '["vocalist","bandleader","composer"]'::jsonb, updated_at = now() WHERE id = '9da4edbe-7d7e-4bf1-8c23-ee01bb5ee65b';  -- El Jeffrey
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '0c783b45-906d-4488-9381-211f8ac2b942';  -- El Negro 5 Estrellas
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '8da26ee1-8079-4232-b9a2-66eccee08cb3';  -- Elenita Santos
UPDATE artists SET occupations = '["vocalist","composer","musician"]'::jsonb, updated_at = now() WHERE id = 'e566c763-02c1-4f96-8a82-edbba9fc0bb2';  -- Elvis Martínez
UPDATE artists SET occupations = '["composer","producer","lyricist"]'::jsonb, updated_at = now() WHERE id = 'c0b20b8c-bb08-4bcf-b993-db19712a9fe1';  -- Emil Cerda
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'f37c7f0f-9bf4-4e80-a151-9a944b07baf0';  -- Enerolisa Núñez
UPDATE artists SET occupations = '["composer","musician"]'::jsonb, updated_at = now() WHERE id = '894e8c21-3cb7-4eb1-8742-266b5624029e';  -- Enrique de Marchena
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '4c291d80-954a-4c8f-8f82-6317253b26d8';  -- Esme
UPDATE artists SET occupations = '["musician","vocalist"]'::jsonb, updated_at = now() WHERE id = 'f838a2ce-b6eb-4200-8d4f-c3c8c28217da';  -- Expresión Joven
UPDATE artists SET occupations = '["vocalist","composer","musician"]'::jsonb, updated_at = now() WHERE id = '60b0cfd0-b572-4d0f-a913-bbeb1aa734c6';  -- Fausto Rey
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '00dd094f-71fd-4ffe-a9dd-1ad335738bbb';  -- Félix Cumbé
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '7744d410-2d0b-49f8-a99d-8182e36dafd0';  -- Félix Manuel
UPDATE artists SET occupations = '["vocalist","composer","bandleader"]'::jsonb, updated_at = now() WHERE id = '29832daf-f093-4ccb-820d-441cdc3f48c0';  -- Fernando Echavarría
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'fb2a3c19-e28e-44ec-984b-ddad8b76e579';  -- Fernando Soriano
UPDATE artists SET occupations = '["vocalist","bandleader","composer"]'::jsonb, updated_at = now() WHERE id = 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd';  -- Fernando Villalona
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '725f7cd5-de62-4e76-b382-0d55c160d51f';  -- Flow 28
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'a49523d4-ca03-4274-8213-2ec356fadf5e';  -- Francikario
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'ddd4bc68-eaef-400f-a272-1ca003902b57';  -- Francisco Casanova
UPDATE artists SET occupations = '["musician","vocalist","bandleader","composer"]'::jsonb, updated_at = now() WHERE id = '3680fc10-c3fd-42c4-ad54-90d79b226a7d';  -- Francisco Ulloa
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '2cb00350-16da-41b4-bec9-5c86b5d8438c';  -- Frank Cruz
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '3dd83e6b-2058-4d04-ac68-38e11d9348a9';  -- Frank Reyes
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '04551571-0568-4e91-8d64-d04936c0cd47';  -- Franklin the Boss
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '79f11fdc-3b07-4453-aae1-75f95cc22e6b';  -- Frecox Unic
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'dab88410-db45-49e3-a663-6b2547e46d9e';  -- Freddy Antonio Sarante Perdomo
UPDATE artists SET occupations = '["vocalist","composer","producer"]'::jsonb, updated_at = now() WHERE id = 'cf03a666-9ffc-4679-916f-f233959eb989';  -- Gabriel Pagán
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = '059d4b29-4925-48f1-a171-9d0bfc450141';  -- Genoveva La Patrona
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '28abb584-d43a-4338-9cda-71f3bd78ab4c';  -- Gior Chambonea
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '70ffca41-564f-4104-8b2a-b67f64036362';  -- Griselda Soriano
UPDATE artists SET occupations = '["musician","vocalist"]'::jsonb, updated_at = now() WHERE id = '5ce0aa05-7d1a-4750-8cd2-dab62b06a244';  -- Grupo Extra
UPDATE artists SET occupations = '["vocalist","musician"]'::jsonb, updated_at = now() WHERE id = '9c78ca86-12dd-4d96-ad24-adcdf7a0761b';  -- Grupo Rush
UPDATE artists SET occupations = '["actor","composer","vocalist"]'::jsonb, updated_at = now() WHERE id = '2993cde1-f93d-4cf0-9668-fa1e54b09919';  -- Haraca Kiko
UPDATE artists SET occupations = '["vocalist","bandleader","composer"]'::jsonb, updated_at = now() WHERE id = 'dee014d6-cb3c-4abb-9262-165538277a0d';  -- Héctor Acosta “El Torito”
UPDATE artists SET occupations = '["vocalist","arranger"]'::jsonb, updated_at = now() WHERE id = 'fb068903-a085-4a3f-b846-0be0b3e28934';  -- Henry García
UPDATE artists SET occupations = '["musician","arranger","producer","composer"]'::jsonb, updated_at = now() WHERE id = '1519cbca-ae0a-4ede-924b-244a49c9024e';  -- Henry Jiménez
UPDATE artists SET occupations = '["vocalist","composer","producer"]'::jsonb, updated_at = now() WHERE id = '8dcfc4e1-9af4-4378-9e19-52573af429a7';  -- Henry Santos
UPDATE artists SET occupations = '["vocalist","musician"]'::jsonb, updated_at = now() WHERE id = '1cd11a22-573a-43b4-8f54-fbd08329a4e2';  -- Ilegales
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '78edb083-e4c4-4031-80a5-c0fcd6a72f2d';  -- Indhira Rubiera
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'be3bd870-e380-44a2-82c5-4849e2022f6e';  -- Inka
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '729fe0b1-aff4-4b83-a76e-f4cb1799f72d';  -- Irka Mateo
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'c3c8db11-c77d-4356-ade2-224feda694fa';  -- Ismael Bueno
UPDATE artists SET occupations = '["vocalist","composer","lyricist"]'::jsonb, updated_at = now() WHERE id = 'b2d83ba2-33f6-4616-9045-357530630b33';  -- J NOA
UPDATE artists SET occupations = '["vocalist","composer","musician"]'::jsonb, updated_at = now() WHERE id = 'bd3ad92b-1a26-48dd-a667-8a0debeaf5a3';  -- Jandy Feliz
UPDATE artists SET occupations = '["vocalist","bandleader","producer"]'::jsonb, updated_at = now() WHERE id = 'acb54568-08b4-4f5b-a6b8-5f50f33dfcbe';  -- Jandy Ventura
UPDATE artists SET occupations = '["pianist","musician","arranger","conductor","producer"]'::jsonb, updated_at = now() WHERE id = '6b6d24d4-c6fe-42d6-8937-2d2f9f6c9292';  -- Janina Rosado
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '65ebdda7-27ba-4150-ae60-12c3236e3d16';  -- Jankobow
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '7d104f9a-1fef-4e74-99c1-6e107eb24fd4';  -- Jeyless
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '0612d71d-ee8e-4ff3-98b8-349652d7bfcf';  -- Jezzy
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'b22dbf04-c87b-4842-baac-0616b7613208';  -- Jhoni the Voice
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'd052c7a7-e721-4653-a904-afb6fd11c6a7';  -- Jhonny Evidence
UPDATE artists SET occupations = '["vocalist","composer","lyricist"]'::jsonb, updated_at = now() WHERE id = '90ed5c7e-595d-4931-8a81-7f9101642800';  -- Joa El Super MC
UPDATE artists SET occupations = '["vocalist","musician","composer"]'::jsonb, updated_at = now() WHERE id = '4d9ac6ac-6802-47f4-8731-5fa567713513';  -- Joan Soriano
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '8cfccb47-4269-4202-94bd-0b51f734ef0e';  -- Jocelyn Quezada
UPDATE artists SET occupations = '["vocalist","bandleader"]'::jsonb, updated_at = now() WHERE id = '4956d243-7a2f-40f5-84e8-09a218f3a5a7';  -- Jochy Hernández
UPDATE artists SET occupations = '["vocalist","musician","composer","producer"]'::jsonb, updated_at = now() WHERE id = 'aec32df5-cc5a-43c2-ac33-02bc8caa1cf5';  -- Joe Veras
UPDATE artists SET occupations = '["musician"]'::jsonb, updated_at = now() WHERE id = '1ef2c413-7ee7-450f-82ad-540dac7b6b92';  -- Johnny Chocolate
UPDATE artists SET occupations = '["vocalist","bandleader","composer"]'::jsonb, updated_at = now() WHERE id = '3f8bafec-e5ee-415d-8405-9551cceeeb9b';  -- Johnny Ventura
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'c99a96f2-8b37-4b30-b90d-4fd331eed0f8';  -- Joly SC
UPDATE artists SET occupations = '["musician","composer","bandleader"]'::jsonb, updated_at = now() WHERE id = '53215c59-9bfa-476f-8889-7b5aaebcac5b';  -- Jonatan Piña Duluc
UPDATE artists SET occupations = '["vocalist","bandleader"]'::jsonb, updated_at = now() WHERE id = 'f8531cdb-3d19-4dd2-9ec1-a49dc5516252';  -- José Bello
UPDATE artists SET occupations = '["musician","bandleader","vocalist"]'::jsonb, updated_at = now() WHERE id = 'ced86e3a-4e99-4cee-ab0a-ad6ede956ea0';  -- José El Calvo
UPDATE artists SET occupations = '["vocalist","actor"]'::jsonb, updated_at = now() WHERE id = '29726fa1-dc21-4db1-8208-77c03fc25f4e';  -- José Heredia
UPDATE artists SET occupations = '["vocalist","composer","musician"]'::jsonb, updated_at = now() WHERE id = '27c82e93-8c8f-4466-86ab-e1afba1e5487';  -- José Manuel Calderón
UPDATE artists SET occupations = '["musician","arranger","bandleader","composer","vocalist"]'::jsonb, updated_at = now() WHERE id = 'b41d4bd2-9303-4834-885e-e7dee35a0287';  -- José Peña Suazo y La Banda Gorda
UPDATE artists SET occupations = '["composer","musician"]'::jsonb, updated_at = now() WHERE id = '8af28323-f2b3-49ac-844f-27e30ffeea6e';  -- José Rufino Reyes y Siancas
UPDATE artists SET occupations = '["vocalist","bandleader","composer"]'::jsonb, updated_at = now() WHERE id = '8c784f57-4ee4-41b5-b140-c45d0da1c5f6';  -- Joseíto Mateo
UPDATE artists SET occupations = '["vocalist","musician"]'::jsonb, updated_at = now() WHERE id = '02b306b3-acc0-4800-b314-05683205d1c5';  -- Jossie Esteban y La Patrulla 15
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'bfe5f1a7-c6e5-45f6-96b7-d06eb088e1eb';  -- JP RMT
UPDATE artists SET occupations = '["vocalist","musician","composer"]'::jsonb, updated_at = now() WHERE id = '9736b552-1a72-4b02-9eac-88a453536809';  -- Juan Bautista
UPDATE artists SET occupations = '["composer","bandleader"]'::jsonb, updated_at = now() WHERE id = '8da2665e-3035-4a8d-810c-98d2d8c8a27b';  -- Juan Bautista Alfonseca
UPDATE artists SET occupations = '["composer","musician","bandleader"]'::jsonb, updated_at = now() WHERE id = 'a4f98603-5d27-4971-bea9-d8c1c9e996da';  -- Juan Francisco García
UPDATE artists SET occupations = '["producer"]'::jsonb, updated_at = now() WHERE id = '84cdb60f-a0a4-4b2a-bac1-7c25474c8f3d';  -- Juan Hidalgo
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'b34a3ded-ded2-4bca-b46d-c964b0a70176';  -- Juan Lanfranco
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '0086e436-b259-4781-9438-ec8918350b77';  -- Juan Manuel
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'd2c0eb06-4b6e-45d1-b795-3778cdf82488';  -- Juliana O'Neal
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '1f3323f3-cb20-439c-bcd6-473c5b62f755';  -- Junior & Jorge
UPDATE artists SET occupations = '["vocalist","producer"]'::jsonb, updated_at = now() WHERE id = '9e148524-3310-448e-b1a0-df0093ea2af7';  -- Kalimete
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '63d21eeb-86d7-447b-9ddc-b764046880dc';  -- Karlos Rosé
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '3b9ec76f-530f-423f-a1a6-710d243fe536';  -- Kewdy de Los Santos
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1';  -- Kiko el Crazy
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '2a4813af-a826-410e-9475-b2bd1474b234';  -- Kiko Rodríguez
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '381b198b-b175-4be5-ad05-7b878d739e3a';  -- Killer Rap
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '80afcde5-4535-48ee-944f-8c157f61ae36';  -- King Streetz
UPDATE artists SET occupations = '["vocalist","composer","arranger","producer"]'::jsonb, updated_at = now() WHERE id = 'c73737c2-0106-4a87-8dbe-5f1650d34342';  -- Kinito Méndez
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '6de9f638-4a9f-4fcc-ab2b-8b836166101c';  -- Korven Brox
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '15c08a48-b94b-41c8-99d8-53144397c787';  -- Krisspy
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '1b072bb2-eeac-41da-956e-cd5bb576a901';  -- La Baby
UPDATE artists SET occupations = '["vocalist","musician"]'::jsonb, updated_at = now() WHERE id = 'c462498c-0f4d-464f-b624-a576f8080e9d';  -- La India Canela
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = 'd08f2c85-7f47-449e-a486-a19ba3b5841a';  -- La Insuperable
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '639de91e-2507-491c-a58a-ce4e77af065d';  -- La Materialista
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '5b9432ff-6258-4c61-ba25-d403398288f7';  -- La Mayeya
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '6a9881c8-8d0b-4144-857b-67e7319498c9';  -- La Pajarita La Paul
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '5944b296-9419-418a-a0e9-bcd7fcf35a82';  -- Lapiitoh Dangers
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '102e7b78-ff98-4adc-9a54-ae73791fb176';  -- Lápiz Conciente
UPDATE artists SET occupations = '["vocalist","musician"]'::jsonb, updated_at = now() WHERE id = '35c38532-efe6-4e27-a836-875c3b6ba928';  -- Lenny Santana
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '068ab5ca-818e-46b3-a933-f034faaa3ea5';  -- Leny
UPDATE artists SET occupations = '["producer","composer","arranger"]'::jsonb, updated_at = now() WHERE id = '5cbc8f2b-cb68-4ebd-8006-6837be54bbe4';  -- Leo RD
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '71f57b0b-1070-401b-b2c5-b7d4ea9a716b';  -- Lismar
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = '8a0f2603-fc00-48a1-a50a-deefa0f661fd';  -- Lolo en el Micrófono
UPDATE artists SET occupations = '["producer","musician"]'::jsonb, updated_at = now() WHERE id = '32c17637-5cad-40d0-b828-3604bdbd6bba';  -- Lucien Le Grub
UPDATE artists SET occupations = '["vocalist","producer"]'::jsonb, updated_at = now() WHERE id = '87e66e95-ba18-43d3-b636-607d607f5151';  -- Luigui Bleand
UPDATE artists SET occupations = '["conductor","composer","musician"]'::jsonb, updated_at = now() WHERE id = '360bec27-421a-466f-8604-3598aa46a7a4';  -- Luis Alberti
UPDATE artists SET occupations = '["composer"]'::jsonb, updated_at = now() WHERE id = 'aefd5b14-694e-4f3e-ad31-ade13f14ca64';  -- Luis Armando Rivera González
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '91a38407-26b0-473a-94e1-42e0ea544479';  -- Luis Caracter
UPDATE artists SET occupations = '["composer","vocalist","musician"]'::jsonb, updated_at = now() WHERE id = 'dab6636c-21fd-4e34-a0a2-e59e9e147bbd';  -- Luis Kalaff
UPDATE artists SET occupations = '["vocalist","composer"]'::jsonb, updated_at = now() WHERE id = '6302aca6-2203-456f-ad96-6bd2f26ee9b3';  -- Luis Miguel del Amargue
UPDATE artists SET occupations = '["vocalist","composer","musician"]'::jsonb, updated_at = now() WHERE id = '5ceceef0-765d-4e01-8017-85422a263357';  -- Luis Segura
UPDATE artists SET occupations = '["vocalist","composer","musician"]'::jsonb, updated_at = now() WHERE id = '0760875d-6b6f-4a48-8aed-6e57934d1baa';  -- Luis Vargas
UPDATE artists SET occupations = '["producer","composer"]'::jsonb, updated_at = now() WHERE id = 'e611e3fc-c00d-46e6-b397-27425787d6d1';  -- Luny
UPDATE artists SET occupations = '["producer","composer","musician"]'::jsonb, updated_at = now() WHERE id = 'ef56311a-ac4b-451e-a7a7-97e5f240cd47';  -- Luny Tunes
UPDATE artists SET occupations = '["singer","songwriter","musician"]'::jsonb, updated_at = now() WHERE id = 'fc8e9689-004d-46d8-9458-b238aaa05aae';  -- Luys Bien
UPDATE artists SET occupations = '["producer","composer","songwriter","singer"]'::jsonb, updated_at = now() WHERE id = '4688614f-d936-4fb8-8bf1-04008de4256b';  -- Maffio
UPDATE artists SET occupations = '["singer","songwriter","producer"]'::jsonb, updated_at = now() WHERE id = '358ff3da-d3b2-4158-b601-3abc1005f927';  -- Manny Cruz
UPDATE artists SET occupations = '["composer"]'::jsonb, updated_at = now() WHERE id = 'b916e519-f427-45d3-9a42-b5c1ff6d6509';  -- Manuel de Jesús Jiménez Ortega
UPDATE artists SET occupations = '["singer","songwriter","composer"]'::jsonb, updated_at = now() WHERE id = '629a7daa-5ab3-4b77-825f-6795b8c4a566';  -- Marcos Yaroide
UPDATE artists SET occupations = '["singer","songwriter"]'::jsonb, updated_at = now() WHERE id = '080c0205-8b66-4f16-915e-1d867acf82cc';  -- Maridalia Hernández
UPDATE artists SET occupations = '["composer"]'::jsonb, updated_at = now() WHERE id = 'f5bdc55b-ac05-45cc-b118-375010a44f21';  -- Mario de Jesús Báez
UPDATE artists SET occupations = '["composer","saxophonist","instrumentalist","arranger"]'::jsonb, updated_at = now() WHERE id = 'f0a5c773-b904-4feb-bf20-9d938bead0b1';  -- Mario Rivera
UPDATE artists SET occupations = '["singer","songwriter"]'::jsonb, updated_at = now() WHERE id = '259b6b41-fa15-44ac-ab39-e341e1e97256';  -- Martha Heredia
UPDATE artists SET occupations = '["musician","singer","composer"]'::jsonb, updated_at = now() WHERE id = '6eccc3e7-82bf-435f-8ae1-ea7e8a721560';  -- Martín Valoy
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = 'c8f5d138-684d-4883-9d40-03282d57e1f5';  -- Mélida Rodríguez
UPDATE artists SET occupations = '["singer","songwriter"]'::jsonb, updated_at = now() WHERE id = '73cac635-71c3-407f-b9f5-02a705d6956b';  -- Messiah
UPDATE artists SET occupations = '["singer","songwriter","producer"]'::jsonb, updated_at = now() WHERE id = 'b6063f89-aac3-48da-9833-6e6d98ec341d';  -- Mickey Taveras
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = '0d586b6c-5699-4c0b-913f-4d702e507301';  -- Milka la Más Dura
UPDATE artists SET occupations = '["singer","songwriter"]'::jsonb, updated_at = now() WHERE id = '070e7449-814e-4ea6-a009-7a091b7e4878';  -- Milly Quezada
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = 'a64fb989-aabd-49dd-a718-54429f2e912d';  -- Miriam y las Chicas
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = '8af29e3a-6ae7-4a2d-9389-8ec927790901';  -- Monkey Black
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = 'fc7077d7-2374-4de2-82ed-3c30d01238e0';  -- MÓRIA
UPDATE artists SET occupations = '["singer","songwriter"]'::jsonb, updated_at = now() WHERE id = 'fa9cc802-28ca-4695-b585-f75aa90a2b6c';  -- Mozart la Para
UPDATE artists SET occupations = '["singer","songwriter"]'::jsonb, updated_at = now() WHERE id = '97610f30-fb92-4d77-8b98-ddec14d12afc';  -- Musicólogo the Libro
UPDATE artists SET occupations = '["vocalist","actress"]'::jsonb, updated_at = now() WHERE id = '5f3b74e3-fd2f-4d65-b25c-39367e1b3dee';  -- Nathalie Peña-Comas
UPDATE artists SET occupations = '["singer","songwriter"]'::jsonb, updated_at = now() WHERE id = 'af726afa-c7a0-47da-99bb-a4c7669a8785';  -- Natti Natasha
UPDATE artists SET occupations = '["singer","composer"]'::jsonb, updated_at = now() WHERE id = 'd5f32223-92d0-43c4-b039-0a8a4eb48ada';  -- Negrito Chapuseaux
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = '19124a2a-a49c-435e-989e-049b5dc3726c';  -- Niní Cáffaro
UPDATE artists SET occupations = '["singer","producer"]'::jsonb, updated_at = now() WHERE id = '97b42ad8-6465-42a8-a673-15aacedb01f5';  -- NMNL
UPDATE artists SET occupations = '["vocalist","bandleader"]'::jsonb, updated_at = now() WHERE id = '868b96d3-8a3d-4b7d-a6e4-0b2faa3c4c4a';  -- Pablo Martínez
UPDATE artists SET occupations = '["composer","lyricist","arranger","vocalist"]'::jsonb, updated_at = now() WHERE id = '6daac2c1-9759-4980-bffd-a53e67b42b1b';  -- Palmer Hernández
UPDATE artists SET occupations = '["singer","composer"]'::jsonb, updated_at = now() WHERE id = '34b63c95-f79a-4f7b-aa1d-426926d12959';  -- Pavel Núñez
UPDATE artists SET occupations = '["guitarist","singer"]'::jsonb, updated_at = now() WHERE id = '40b02936-92e3-4149-98e8-0ba1118eeb7c';  -- Puerto Plata
UPDATE artists SET occupations = '["composer","pianist","songwriter","musician"]'::jsonb, updated_at = now() WHERE id = 'ba42e200-51b0-437b-99ac-1daf39ade337';  -- Rafael Solano
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'fb770e9d-a17f-4718-884f-e1bd44a11b61';  -- Rafely Rosario
UPDATE artists SET occupations = '["singer","songwriter"]'::jsonb, updated_at = now() WHERE id = 'a73d457d-6ff6-4dde-89e9-1e41dfdf2d54';  -- Ramón Torres
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = 'faf3e4cb-808e-419c-87ff-5126eed85e73';  -- Raulín Rosendo
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = '0001efad-adc4-4c01-8c72-3fc681b50511';  -- Rosangela Abreu
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = 'cff70c92-8632-4c66-b5a0-81622c8128b0';  -- Rubby Pérez
UPDATE artists SET occupations = '["dj","producer"]'::jsonb, updated_at = now() WHERE id = 'a35802ef-6a43-427d-af4b-410afceb4455';  -- Sammy the Greatest
UPDATE artists SET occupations = '["singer","composer"]'::jsonb, updated_at = now() WHERE id = 'ae72a84f-28eb-44d2-8553-b840a4a1c1fe';  -- Sandy MC
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = '54e852e9-cc3b-4208-9645-3425ce2f7d1a';  -- Santiago Cerón
UPDATE artists SET occupations = '["vocalist","songwriter"]'::jsonb, updated_at = now() WHERE id = 'f57eb2e7-9ca7-463d-baee-8b3ea1800e6b';  -- Secreto “El Famoso Biberón”
UPDATE artists SET occupations = '["musician","singer"]'::jsonb, updated_at = now() WHERE id = '059a9e99-5d11-433e-97b9-9c35e57908f1';  -- Sergio Vargas
UPDATE artists SET occupations = '["singer","musician"]'::jsonb, updated_at = now() WHERE id = '2cc97ca9-126d-48c5-922f-e9d5c8b0360d';  -- Sonia Silvestre
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = '6df3d91b-324e-4ec5-bd78-78be8ef4e3f1';  -- Sujeto Oro 24
UPDATE artists SET occupations = '["singer","songwriter"]'::jsonb, updated_at = now() WHERE id = '3e1718be-c12d-42f5-85e7-2156d9574940';  -- Tokischa
UPDATE artists SET occupations = '["singer","singer-songwriter"]'::jsonb, updated_at = now() WHERE id = '6fc762d4-96b8-4ecf-aca8-fdf52936658e';  -- Toño Rosario
UPDATE artists SET occupations = '["composer","singer","musician","guitarist"]'::jsonb, updated_at = now() WHERE id = '4968d375-0833-49e2-8442-633cbaa39404';  -- Vicente García
UPDATE artists SET occupations = '["guitarist","singer","composer","percussionist","musician"]'::jsonb, updated_at = now() WHERE id = '4b4bf9da-fe4a-4fc6-be40-1b1b5413dfb3';  -- Víctor Víctor
UPDATE artists SET occupations = '["vocalist"]'::jsonb, updated_at = now() WHERE id = 'aa8fe337-ebfe-4307-a25e-c00586620f74';  -- Vitico
UPDATE artists SET occupations = '["singer","composer","songwriter"]'::jsonb, updated_at = now() WHERE id = 'd24796f7-ab52-4997-8af5-d44443434825';  -- Wilmelia
UPDATE artists SET occupations = '["singer","composer"]'::jsonb, updated_at = now() WHERE id = '8e29188a-215b-4c6c-b34a-45b381765e46';  -- Xiomara Fortuna
UPDATE artists SET occupations = '["singer"]'::jsonb, updated_at = now() WHERE id = 'a92fa7a6-842f-44fe-95cb-103c3c38f903';  -- Yoskar Sarante
UPDATE artists SET occupations = '["musician","vocalist","bandleader","composer"]'::jsonb, updated_at = now() WHERE id = '76c3c113-eea0-4dbd-8e71-c7dc6662c86c';  -- Yovanny Polanco
UPDATE artists SET occupations = '["musician","arranger","producer","composer"]'::jsonb, updated_at = now() WHERE id = '8f849c06-39bb-4a5c-9326-a2574a824ccd';  -- Ysrael Casado

COMMIT;
