BEGIN;

-- Reverts 20260905140000_restore_orphaned_editorial_references.sql.
-- Removes exactly the rows that migration inserted, by (document, occurrence)
-- pair, so relation rows that already existed are untouched, and reinstates
-- the stale rows it deleted. Restores the state where these mentions render
-- as plain text.

DELETE FROM editorial_entity_references WHERE editorial_document_id = '8cb3a608-d0aa-4ecb-8172-f26f0bc6e10d' AND occurrence_id = '4b560cbb-aa59-445c-904a-29dcc2e2cd28';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'be9e8ccf-0032-4189-be7f-717282da1dd4' AND occurrence_id = 'dcd5bb91-4056-4fa7-85f1-4ad83ea64e12';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'be9e8ccf-0032-4189-be7f-717282da1dd4' AND occurrence_id = '8af21aa1-c3f6-4bdb-b125-eb3fd4e93ca2';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'be9e8ccf-0032-4189-be7f-717282da1dd4' AND occurrence_id = 'd7121546-d00a-4af0-9f36-942ad23536b9';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'be9e8ccf-0032-4189-be7f-717282da1dd4' AND occurrence_id = 'a778140b-531d-4911-bead-90154e4bec5e';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'be9e8ccf-0032-4189-be7f-717282da1dd4' AND occurrence_id = 'f5cc61e4-fb3b-4a1d-b87a-9116b54ecd28';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'be9e8ccf-0032-4189-be7f-717282da1dd4' AND occurrence_id = '23a63c8f-aa0a-40c4-a84f-7ff4e5f283c9';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'be9e8ccf-0032-4189-be7f-717282da1dd4' AND occurrence_id = 'c4e1efb1-dc75-469c-91a6-21640f95ecb4';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '554caa7f-3342-4202-bf3d-2cbee4b18548' AND occurrence_id = '6c0c1f68-5d8e-4a35-b559-54aee31b302f';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '554caa7f-3342-4202-bf3d-2cbee4b18548' AND occurrence_id = '4d04f819-bfb4-4cb1-8b64-59655ec6ef90';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '554caa7f-3342-4202-bf3d-2cbee4b18548' AND occurrence_id = 'b5594a3e-8a88-4b33-9d0c-7bc07f66a75b';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '554caa7f-3342-4202-bf3d-2cbee4b18548' AND occurrence_id = 'aad87bec-591a-4822-989e-371151784038';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '554caa7f-3342-4202-bf3d-2cbee4b18548' AND occurrence_id = 'e4cd0135-9abf-4d96-a796-0dadbdc1eb41';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '554caa7f-3342-4202-bf3d-2cbee4b18548' AND occurrence_id = 'b6fba039-60ad-4857-b06a-b86efaf6538c';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '554caa7f-3342-4202-bf3d-2cbee4b18548' AND occurrence_id = 'e437dd3a-a402-41fb-b27f-ab2b30eba5e2';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '554caa7f-3342-4202-bf3d-2cbee4b18548' AND occurrence_id = 'bfc06686-ac2a-4882-93fe-0db1c1881275';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '554caa7f-3342-4202-bf3d-2cbee4b18548' AND occurrence_id = '7c691c7d-a58a-4ca0-bf3f-d6f828182190';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ec23852d-ea99-49b9-a75b-36d7ceacbd29' AND occurrence_id = 'a292d2ee-ab07-4ade-b05f-5989018eec65';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ec23852d-ea99-49b9-a75b-36d7ceacbd29' AND occurrence_id = 'cd36bfe9-ec33-4606-967c-d9b437b7ebff';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ec23852d-ea99-49b9-a75b-36d7ceacbd29' AND occurrence_id = '894270f0-fb83-457d-9c21-1c5da4d810db';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ec23852d-ea99-49b9-a75b-36d7ceacbd29' AND occurrence_id = '540641fb-f80e-43e3-8bc1-c6450d2169b2';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ec23852d-ea99-49b9-a75b-36d7ceacbd29' AND occurrence_id = '9279f991-099b-4607-994e-b9ad761bf12a';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ec23852d-ea99-49b9-a75b-36d7ceacbd29' AND occurrence_id = '9eb0d69d-d63d-4bbd-8ab3-6512a0df0419';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ec23852d-ea99-49b9-a75b-36d7ceacbd29' AND occurrence_id = '842ac717-0910-469e-849f-9ccce6919ca1';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ec23852d-ea99-49b9-a75b-36d7ceacbd29' AND occurrence_id = 'dffb6454-ba1d-42ad-8197-3c76983a4d52';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ec23852d-ea99-49b9-a75b-36d7ceacbd29' AND occurrence_id = '1b3e46c4-7f2f-4b1e-ae9a-5ed05176f106';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '88889428-b468-41ad-9357-af5dc71a7f70' AND occurrence_id = 'b99bc6b6-ec34-48d9-846b-70419c07cfeb';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '88889428-b468-41ad-9357-af5dc71a7f70' AND occurrence_id = 'a38a2a94-a713-460d-b9e3-b924e6bbb4be';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '0a41757e-2f6a-4916-a1f2-5f2dc14125b2' AND occurrence_id = '76f4611d-2dc2-4edc-a30c-f57c3072b5db';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '0a41757e-2f6a-4916-a1f2-5f2dc14125b2' AND occurrence_id = 'ee0bb9c6-9413-43b1-8206-684a55e6f3b9';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ee5a46f3-9387-4271-8db8-b4cb15c1c90a' AND occurrence_id = 'a3654339-ed3b-4e3d-b1bf-41eca7d02c65';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'ee5a46f3-9387-4271-8db8-b4cb15c1c90a' AND occurrence_id = 'b47b2c36-e36b-48e1-b734-c709c4587593';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '1dfac941-17a2-43e7-9f29-0283f56ca4b7' AND occurrence_id = '363c4cdf-15e6-4b28-bd05-ba00e8fd3e60';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '62300e59-1cb5-43c3-8be7-2611bd9aadbe' AND occurrence_id = 'f8577536-3d61-462e-ae45-6c846140acaa';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '62300e59-1cb5-43c3-8be7-2611bd9aadbe' AND occurrence_id = '5197db54-8ce9-410c-96b3-2095223b503c';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '62300e59-1cb5-43c3-8be7-2611bd9aadbe' AND occurrence_id = 'de80cd9f-8faf-4825-ac94-9cae27a9ed4d';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '62300e59-1cb5-43c3-8be7-2611bd9aadbe' AND occurrence_id = '6d8eea88-b067-48b6-a716-19b55cb58a6d';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '62300e59-1cb5-43c3-8be7-2611bd9aadbe' AND occurrence_id = '11d06959-40dd-4037-96bd-9d736b0f97bd';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'aa456ca4-c0a5-4171-a646-73f3315dea5e' AND occurrence_id = 'c7c39f36-9191-433e-ac6f-1f2fe697cc67';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'aa456ca4-c0a5-4171-a646-73f3315dea5e' AND occurrence_id = '3195cacd-0cd1-48e7-abc6-ede4469c7927';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'aa456ca4-c0a5-4171-a646-73f3315dea5e' AND occurrence_id = 'f9df6100-63f3-45c8-a73f-6e979d01cf3d';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'aa456ca4-c0a5-4171-a646-73f3315dea5e' AND occurrence_id = 'd123752f-07d0-4e2f-8a3a-223885c84a84';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'aa456ca4-c0a5-4171-a646-73f3315dea5e' AND occurrence_id = '0f114436-8a66-492b-948a-02c1cc9987d3';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'aa456ca4-c0a5-4171-a646-73f3315dea5e' AND occurrence_id = 'd6162485-354d-4e67-bb78-e6fc6dce2e3c';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '029ab794-f307-4ffa-ab6e-ce9a41084422' AND occurrence_id = 'ce1a0a5e-cf5e-4f7e-ab4f-d78cbf68d366';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '1971d182-412a-4686-95a9-babdec4cc738' AND occurrence_id = '1e33ac88-a6f7-4425-ab81-40d3c4512c80';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '1971d182-412a-4686-95a9-babdec4cc738' AND occurrence_id = '60c8a3fe-d52f-4f2b-8819-f76c653ee7e4';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '1971d182-412a-4686-95a9-babdec4cc738' AND occurrence_id = 'f5008bf2-9e35-4159-afb3-21a11b28c85e';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '1971d182-412a-4686-95a9-babdec4cc738' AND occurrence_id = '2c85fa96-f8e7-4716-8449-353b3e450302';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '1971d182-412a-4686-95a9-babdec4cc738' AND occurrence_id = 'f9075a47-34e8-4e7b-936f-8d05fa758297';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '1971d182-412a-4686-95a9-babdec4cc738' AND occurrence_id = 'e722534f-a710-442d-b342-2ae603eb1385';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '1971d182-412a-4686-95a9-babdec4cc738' AND occurrence_id = '6fe8b6d7-297d-4dd6-8aa2-9be0f8b69c40';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'e10dd243-8076-4973-97b1-83c9e615f88b' AND occurrence_id = 'c10b12c0-2d94-410a-ae97-b3f46acbaa40';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '8d77d6da-fc7c-4d68-a3d0-5a606a1e6e36' AND occurrence_id = '4760d53f-ad53-43bc-a0f5-c43d30336919';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'eb0a07d6-d9d5-4b7b-b87d-290225bad599' AND occurrence_id = '0b3e4e70-ffe7-4d29-8d75-3a8071b9c463';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '1f95bbbc-e962-4ab8-b618-8a868eeea217' AND occurrence_id = '2c50c31f-bcf0-4d9c-b507-4055ff634850';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'a441f11a-7746-413f-a598-9793c9f43c1e' AND occurrence_id = '6e8c6291-0fd5-4a38-a398-bed62238e14e';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'a441f11a-7746-413f-a598-9793c9f43c1e' AND occurrence_id = '6f784387-4604-4753-b392-ff8c303fa0a6';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'a441f11a-7746-413f-a598-9793c9f43c1e' AND occurrence_id = '318454b3-cafa-4ee7-8c68-c78d49176aa1';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'a441f11a-7746-413f-a598-9793c9f43c1e' AND occurrence_id = 'f5668b02-c535-4890-87a1-2e4cbb917d41';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'a441f11a-7746-413f-a598-9793c9f43c1e' AND occurrence_id = '5fe8e0b7-b46f-4dbf-a5ba-fa5e0d098113';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'a441f11a-7746-413f-a598-9793c9f43c1e' AND occurrence_id = 'a73201d3-6454-45b9-9bbf-e75f5104ef46';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'a441f11a-7746-413f-a598-9793c9f43c1e' AND occurrence_id = 'b99ea11c-a8c8-4ac7-b10b-19e04ec510bc';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '04d653bc-be32-4cf5-8ddf-f231fda87bcf' AND occurrence_id = '69a9fc92-57cf-4f4c-b666-e78f9672d6cf';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '68a51f4d-e669-4a89-b518-3f0eead1f8ad' AND occurrence_id = '242940ce-6697-4dd3-ba1d-337cc2b8eef4';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '0d0ef9ea-2fcb-438d-b169-d3052afe7b87' AND occurrence_id = '76391d24-119b-40fc-ba08-7d324acc69b6';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '0d0ef9ea-2fcb-438d-b169-d3052afe7b87' AND occurrence_id = '3f6e3d09-0b57-4649-a607-d48027c7e342';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '0d0ef9ea-2fcb-438d-b169-d3052afe7b87' AND occurrence_id = '4ff37a1d-68d0-475d-a13c-7ae62dbf920b';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '0d0ef9ea-2fcb-438d-b169-d3052afe7b87' AND occurrence_id = '6aa44f01-aff1-4e25-90e3-54e7b2e90d00';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '0d0ef9ea-2fcb-438d-b169-d3052afe7b87' AND occurrence_id = 'e496511d-3193-43b9-b80b-2bed9752bc04';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '64d3ff4f-1d80-4278-8605-d38308c48be0' AND occurrence_id = '06880bd8-8561-4fa4-a37f-1cdae5624ba0';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '47385195-954b-4d6b-8f92-a764bfe7ea24' AND occurrence_id = 'f87afa6a-ee79-4e93-966e-fce7f5f61e0d';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '97faf784-b953-448e-a4d8-6e9e63c99428' AND occurrence_id = '9856b6ed-282c-499a-b247-2134ee489fa5';
DELETE FROM editorial_entity_references WHERE editorial_document_id = 'bd304917-726f-486b-a211-e87661aa4287' AND occurrence_id = '33f9dff0-ef1b-47d6-af43-1bc36d821b65';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '06542874-8abe-4c57-8020-3c7913950cb4' AND occurrence_id = '6e0e41e8-8bcf-4b1d-82be-560ea8b07807';
DELETE FROM editorial_entity_references WHERE editorial_document_id = '9aa783db-9404-453b-9d91-47702606f037' AND occurrence_id = '4c78a510-e958-4b4d-848c-ebfc2c31e8e6';

-- Reinstates the relation rows the migration deleted.
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('0fd727cf-c3fd-4583-9274-380280884931', 'e3549075-4b3f-453f-a849-53e9c5bd2fb3', 'artist', 'fb7698ed-caa4-474e-851b-a9ce63a4cf11');
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('42f37686-09ac-4ad8-b6f8-72e150808b07', 'd4ffbb46-99ff-49d7-99aa-187e9367ecef', 'artist', 'fb7698ed-caa4-474e-851b-a9ce63a4cf11');
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('bbda8797-0236-4a5d-9d8b-6171564d68cc', 'f0b69357-1b52-4cd7-a21e-dd5d26002ebe', 'artist', 'b7e694df-25d3-4318-ae30-3bad12a50744');
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('965af113-b50e-4d1a-b7e2-1cc1070dca03', '66794731-635f-41af-8a10-2707e434962a', 'artist', 'b7e694df-25d3-4318-ae30-3bad12a50744');

COMMIT;
