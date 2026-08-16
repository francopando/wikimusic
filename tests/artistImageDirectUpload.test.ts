import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const adminPage = readFileSync("src/app/admin/(protected)/artists/page.tsx", "utf8");
const artistEndpoint = readFileSync("src/app/api/admin/artist-image/route.ts", "utf8");
const sharedImageEndpoint = readFileSync("src/app/api/admin/image-upload/route.ts", "utf8");
const storageMigration = readFileSync(
  "supabase/migrations/20260821000000_harden_artist_original_uploads.sql",
  "utf8",
);

test("artist originals upload directly to a server-authorized Supabase path", () => {
  assert.match(adminPage, /action:\s*"authorize"/);
  assert.match(adminPage, /uploadToSignedUrl\(/);
  assert.match(adminPage, /action:\s*"finalize"/);
  assert.doesNotMatch(adminPage, /formData\.set\("target",\s*"artist"\)/);
  assert.doesNotMatch(adminPage, /fetch\("\/api\/admin\/image-upload"/);
});

test("artist API bodies contain metadata only and never parse image bytes", () => {
  assert.match(artistEndpoint, /request\.json\(\)/);
  assert.doesNotMatch(artistEndpoint, /request\.formData\(\)/);
  assert.doesNotMatch(artistEndpoint, /file\.arrayBuffer\(\)/);
  assert.match(artistEndpoint, /createSignedUploadUrl\(objectPath/);
  assert.match(artistEndpoint, /\.download\(objectPath\)/);
});

test("finalization preserves the established original and derivative contracts", () => {
  assert.match(artistEndpoint, /artists-images-original/);
  assert.match(artistEndpoint, /artists-images/);
  assert.match(artistEndpoint, /resize\(300, 300, \{ fit: "cover", position: "centre" \}\)/);
  assert.match(artistEndpoint, /webp\(\{ quality: 88 \}\)/);
  assert.match(artistEndpoint, /`\$\{artistId\}\.webp`/);
  assert.match(artistEndpoint, /has_image: true, image_updated_at: imageUpdatedAt/);
});

test("authorization is server-side, path-bound, typed, and size-limited", () => {
  assert.ok(artistEndpoint.indexOf("const auth = await requireAdminApiRole") < artistEndpoint.indexOf("request.json()"));
  assert.match(artistEndpoint, /isAllowedOriginalPath\(artistId, objectPath\)/);
  assert.match(artistEndpoint, /25 \* 1024 \* 1024/);
  assert.match(artistEndpoint, /"image\/jpeg"/);
  assert.match(artistEndpoint, /"image\/png"/);
  assert.match(artistEndpoint, /"image\/webp"/);
  assert.doesNotMatch(adminPage, /SUPABASE_SERVICE_ROLE_KEY/);
});

test("Storage enforces the direct-upload contract and shared uploads reject artist files", () => {
  assert.match(storageMigration, /file_size_limit = 26214400/);
  assert.match(storageMigration, /'image\/jpeg', 'image\/png', 'image\/webp'/);
  assert.doesNotMatch(sharedImageEndpoint, /target !== "artist"/);
  assert.doesNotMatch(sharedImageEndpoint, /artist:\s*\{ bucket:/);
});
