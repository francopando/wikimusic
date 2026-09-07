import { NextResponse } from "next/server";
import sharp from "sharp";

import { requireAdminApiRole } from "@/lib/adminApiAuth";
import { revalidateHomepageData } from "@/lib/homepageCache";
import { revalidateArtistProfilePaths } from "@/lib/revalidateArtistProfile";
import { createServiceRoleClient } from "@/lib/supabaseService";

const ORIGINAL_BUCKET = "artists-images-original";
const PUBLIC_BUCKET = "artists-images";
const MAX_SOURCE_BYTES = 25 * 1024 * 1024;
const MAX_INPUT_PIXELS = 25_000_000;
const UUID_PATTERN = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;
const MIME_TO_EXTENSION = {
  "image/jpeg": "jpg",
  "image/png": "png",
  "image/webp": "webp",
} as const;
const FORMAT_TO_EXTENSION = { jpeg: "jpg", png: "png", webp: "webp" } as const;

type UploadAction = "authorize" | "finalize";

function jsonError(error: string, code: string, status: number) {
  return NextResponse.json({ ok: false, error, code }, { status });
}

function getOriginalPath(artistId: string, mimeType: keyof typeof MIME_TO_EXTENSION) {
  return `${artistId}.${MIME_TO_EXTENSION[mimeType]}`;
}

function isAllowedOriginalPath(artistId: string, objectPath: string) {
  return Object.values(MIME_TO_EXTENSION).some(
    (extension) => objectPath === `${artistId}.${extension}`,
  );
}

export async function POST(request: Request) {
  const auth = await requireAdminApiRole("editor");
  if (auth.response) return auth.response;

  let body: Record<string, unknown>;
  try {
    body = (await request.json()) as Record<string, unknown>;
  } catch {
    return jsonError("Invalid image upload request.", "invalid_request", 400);
  }

  const action = body.action as UploadAction | undefined;
  const artistId = body.artistId;
  if (
    (action !== "authorize" && action !== "finalize") ||
    typeof artistId !== "string" ||
    !UUID_PATTERN.test(artistId)
  ) {
    return jsonError("Invalid image upload request.", "invalid_request", 400);
  }

  const supabase = createServiceRoleClient();
  const { data: artist, error: artistError } = await supabase
    .from("artists")
    .select("id,slug")
    .eq("id", artistId)
    .maybeSingle();

  if (artistError) {
    console.error("Artist image target lookup failed:", artistError);
    return jsonError("Image upload failed. Please try again.", "server_error", 500);
  }
  if (!artist) return jsonError("Artist not found.", "artist_not_found", 404);

  if (action === "authorize") {
    const mimeType = body.mimeType;
    const fileSize = body.fileSize;
    if (typeof mimeType !== "string" || !(mimeType in MIME_TO_EXTENSION)) {
      return jsonError("This file type is not supported.", "unsupported_type", 415);
    }
    if (
      typeof fileSize !== "number" ||
      !Number.isSafeInteger(fileSize) ||
      fileSize <= 0 ||
      fileSize > MAX_SOURCE_BYTES
    ) {
      return jsonError("The image is too large.", "file_too_large", 413);
    }

    const objectPath = getOriginalPath(
      artistId,
      mimeType as keyof typeof MIME_TO_EXTENSION,
    );
    const { data, error } = await supabase.storage
      .from(ORIGINAL_BUCKET)
      .createSignedUploadUrl(objectPath, { upsert: true });

    if (error || !data?.token) {
      console.error("Artist original signed upload authorization failed:", error);
      return jsonError("Image upload failed. Please try again.", "storage_authorization_failed", 500);
    }

    return NextResponse.json({
      ok: true,
      bucket: ORIGINAL_BUCKET,
      objectPath,
      token: data.token,
    });
  }

  const objectPath = body.objectPath;
  if (
    typeof objectPath !== "string" ||
    !isAllowedOriginalPath(artistId, objectPath)
  ) {
    return jsonError("Invalid image upload reference.", "invalid_upload_reference", 400);
  }

  const { data: original, error: downloadError } = await supabase.storage
    .from(ORIGINAL_BUCKET)
    .download(objectPath);
  if (downloadError || !original) {
    console.error("Artist original download failed:", downloadError);
    return jsonError("Image processing failed. Please try again.", "processing_failed", 500);
  }
  if (original.size <= 0 || original.size > MAX_SOURCE_BYTES) {
    return jsonError("The image is too large.", "file_too_large", 413);
  }

  let output: Buffer;
  try {
    const input = Buffer.from(await original.arrayBuffer());
    const image = sharp(input, { failOn: "warning", limitInputPixels: MAX_INPUT_PIXELS });
    const metadata = await image.metadata();
    const expectedExtension = objectPath.slice(objectPath.lastIndexOf(".") + 1);
    if (
      !metadata.format ||
      !(metadata.format in FORMAT_TO_EXTENSION) ||
      FORMAT_TO_EXTENSION[metadata.format as keyof typeof FORMAT_TO_EXTENSION] !== expectedExtension
    ) {
      return jsonError("This file type is not supported.", "unsupported_type", 415);
    }

    output = await image
      .rotate()
      .resize(300, 300, { fit: "cover", position: "centre" })
      .webp({ quality: 88 })
      .toBuffer();
  } catch (error) {
    console.error("Artist image decoding or processing failed:", error);
    return jsonError("This file type is not supported.", "unsupported_type", 415);
  }

  const publicObjectPath = `${artistId}.webp`;
  const { error: uploadError } = await supabase.storage
    .from(PUBLIC_BUCKET)
    .upload(publicObjectPath, output, {
      upsert: true,
      contentType: "image/webp",
      cacheControl: "0",
    });
  if (uploadError) {
    console.error("Artist optimized image upload failed:", uploadError);
    return jsonError("Image processing failed. Please try again.", "processing_failed", 500);
  }

  const imageUpdatedAt = new Date().toISOString();
  const { error: updateError } = await supabase
    .from("artists")
    .update({ has_image: true, image_updated_at: imageUpdatedAt })
    .eq("id", artistId);
  if (updateError) {
    console.error("Artist image metadata update failed:", updateError);
    return jsonError("Image processing failed. Please try again.", "processing_failed", 500);
  }

  if (artist.slug) revalidateArtistProfilePaths(artist.slug, artistId);
  revalidateHomepageData();

  return NextResponse.json({
    ok: true,
    objectName: publicObjectPath,
    originalObjectPath: objectPath,
    imageUpdatedAt,
  });
}
