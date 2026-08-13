import { mkdir, readFile } from "node:fs/promises";
import path from "node:path";
import dotenv from "dotenv";
import sharp from "sharp";
import { createClient } from "@supabase/supabase-js";

dotenv.config();

const ARTIST_ID = "c958758c-a949-4bd9-963d-6d48bc750b60";
const SOURCE_PNG = "C:\\Users\\fvpg\\.codex\\generated_images\\019e764c-4aca-79c3-9a47-00f8d65a2157\\ig_0167315b4f17e660016a1c94b8d9548198a3ac1b0734bf1821.png";
const OUTPUT_DIR = path.join("scripts", "artist-image-staging");
const OUTPUT_PNG = path.join(OUTPUT_DIR, `${ARTIST_ID}.png`);
const OUTPUT_WEBP = path.join(OUTPUT_DIR, `${ARTIST_ID}.webp`);

function requireEnv(...names: string[]): string {
  for (const name of names) {
    const value = process.env[name];
    if (value) {
      return value;
    }
  }
  throw new Error(`Missing required environment variable: ${names.join(" or ")}`);
}

async function uploadFile(bucket: string, filePath: string, contentType: string) {
  const supabaseUrl = requireEnv("SUPABASE_URL", "NEXT_PUBLIC_SUPABASE_URL");
  const supabaseKey = requireEnv("SUPABASE_SERVICE_ROLE_KEY");
  const supabase = createClient(supabaseUrl, supabaseKey, {
    auth: { persistSession: false },
  });
  const fileName = path.basename(filePath);
  const file = await readFile(filePath);

  const { error: uploadError } = await supabase.storage
    .from(bucket)
    .upload(fileName, file, {
      contentType,
      upsert: true,
    });

  if (uploadError) {
    throw new Error(`${bucket}/${fileName} upload failed: ${uploadError.message}`);
  }

  const { data, error: listError } = await supabase.storage
    .from(bucket)
    .list("", { search: fileName, limit: 100 });

  if (listError) {
    throw new Error(`${bucket}/${fileName} verification failed: ${listError.message}`);
  }

  const exists = data.some((item) => item.name === fileName);
  if (!exists) {
    throw new Error(`${bucket}/${fileName} was uploaded but could not be verified`);
  }
}

async function main() {
  await mkdir(OUTPUT_DIR, { recursive: true });
  await sharp(SOURCE_PNG)
    .resize(1024, 1024, { fit: "cover", position: "center" })
    .png({ compressionLevel: 9 })
    .toFile(OUTPUT_PNG);
  const pngMetadata = await sharp(OUTPUT_PNG).metadata();
  await sharp(OUTPUT_PNG)
    .resize(300, 300, { fit: "cover", position: "center" })
    .webp({ quality: 90 })
    .toFile(OUTPUT_WEBP);
  const webpMetadata = await sharp(OUTPUT_WEBP).metadata();

  await uploadFile("artists-images-original", OUTPUT_PNG, "image/png");
  await uploadFile("artists-images", OUTPUT_WEBP, "image/webp");

  console.table({
    originalPng: OUTPUT_PNG,
    originalWidth: pngMetadata.width,
    originalHeight: pngMetadata.height,
    webp: OUTPUT_WEBP,
    webpWidth: webpMetadata.width,
    webpHeight: webpMetadata.height,
    originalBucketPath: `artists-images-original/${ARTIST_ID}.png`,
    webpBucketPath: `artists-images/${ARTIST_ID}.webp`,
  });
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
