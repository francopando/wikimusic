import { NextResponse } from "next/server";
import sharp from "sharp";

import { requireAdminApiRole } from "@/lib/adminApiAuth";
import { createServiceRoleClient } from "@/lib/supabaseService";

const MAX_SOURCE_BYTES = 10 * 1024 * 1024;
const MAX_INPUT_PIXELS = 25_000_000;
const UUID_PATTERN = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;
const ALLOWED_INPUT_FORMATS = new Set(["jpeg", "png", "webp"]);

type ImageTarget = "contributor" | "externalContributor";

const targetConfig = {
  contributor: { bucket: "contributors-images", table: "contributors", size: 600 },
  externalContributor: { bucket: "contributors-images", table: "external_contributors", size: 600 },
} as const;

export async function POST(request: Request) {
  const auth = await requireAdminApiRole("editor");
  if (auth.response) return auth.response;

  const contentLength = Number(request.headers.get("content-length"));
  if (Number.isFinite(contentLength) && contentLength > MAX_SOURCE_BYTES + 1024 * 1024) {
    return NextResponse.json({ ok: false, error: "Upload request is too large." }, { status: 413 });
  }

  let form: FormData;
  try {
    form = await request.formData();
  } catch {
    return NextResponse.json({ ok: false, error: "Invalid multipart upload." }, { status: 400 });
  }

  const target = form.get("target");
  const entityId = form.get("entityId");
  const file = form.get("file");

  if ((target !== "contributor" && target !== "externalContributor") || typeof entityId !== "string" || !UUID_PATTERN.test(entityId)) {
    return NextResponse.json({ ok: false, error: "Invalid image target or entity id." }, { status: 400 });
  }
  if (!(file instanceof File) || file.size === 0 || file.size > MAX_SOURCE_BYTES) {
    return NextResponse.json({ ok: false, error: "Image must be between 1 byte and 10 MB." }, { status: 400 });
  }

  const config = targetConfig[target as ImageTarget];
  const supabase = createServiceRoleClient();
  const { data: entity, error: entityError } = await supabase
    .from(config.table)
    .select("id")
    .eq("id", entityId)
    .maybeSingle();

  if (entityError) return NextResponse.json({ ok: false, error: entityError.message }, { status: 500 });
  if (!entity) return NextResponse.json({ ok: false, error: "Image target does not exist." }, { status: 404 });

  let output: Buffer;
  try {
    const input = Buffer.from(await file.arrayBuffer());
    const image = sharp(input, { failOn: "warning", limitInputPixels: MAX_INPUT_PIXELS });
    const metadata = await image.metadata();
    if (!metadata.format || !ALLOWED_INPUT_FORMATS.has(metadata.format)) {
      return NextResponse.json({ ok: false, error: "Only decoded JPEG, PNG, or WebP images are accepted." }, { status: 415 });
    }
    output = await image
      .rotate()
      .resize(config.size, config.size, { fit: "cover", position: "centre" })
      .webp({ quality: 88 })
      .toBuffer();
  } catch {
    return NextResponse.json({ ok: false, error: "The upload is not a valid supported image." }, { status: 415 });
  }

  const objectName = `${entityId}.webp`;
  const { error: uploadError } = await supabase.storage.from(config.bucket).upload(objectName, output, {
    upsert: true,
    contentType: "image/webp",
    cacheControl: "3600",
  });
  if (uploadError) return NextResponse.json({ ok: false, error: uploadError.message }, { status: 500 });

  const imageUpdatedAt = new Date().toISOString();
  if (target === "externalContributor") {
    const { error: updateError } = await supabase
      .from("external_contributors")
      .update({ has_image: true, image_updated_at: imageUpdatedAt })
      .eq("id", entityId);
    if (updateError) return NextResponse.json({ ok: false, error: updateError.message }, { status: 500 });
  }

  return NextResponse.json({ ok: true, objectName, imageUpdatedAt });
}
