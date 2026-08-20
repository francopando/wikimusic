import { NextResponse } from "next/server";

import { requireAdminApiRole } from "@/lib/adminApiAuth";
import { createServiceRoleClient } from "@/lib/supabaseService";
import { revalidateArtistProfilesByArtistIds } from "@/lib/revalidateCatalogProfiles";

const resourceTables = {
  award: "awards",
  category: "award_categories",
  artistAward: "artist_awards",
} as const;

type AwardResource = keyof typeof resourceTables;

function isAwardResource(value: unknown): value is AwardResource {
  return typeof value === "string" && value in resourceTables;
}

function sanitizePayload(resource: AwardResource, value: unknown) {
  if (!value || typeof value !== "object" || Array.isArray(value)) return null;
  const input = value as Record<string, unknown>;
  const allowed = resource === "award"
    ? ["name", "organization", "country", "description"]
    : resource === "category"
      ? ["award_id", "name", "description"]
      : ["artist_id", "award_id", "category_id", "year", "work", "won", "source"];

  return Object.fromEntries(allowed.filter((key) => key in input).map((key) => [key, input[key]]));
}

export async function POST(request: Request) {
  const auth = await requireAdminApiRole("editor");
  if (auth.response) return auth.response;

  const body = await request.json() as { resource?: unknown; id?: unknown; data?: unknown };
  if (!isAwardResource(body.resource)) {
    return NextResponse.json({ ok: false, error: "Invalid award resource." }, { status: 400 });
  }

  const payload = sanitizePayload(body.resource, body.data);
  if (!payload || Object.keys(payload).length === 0) {
    return NextResponse.json({ ok: false, error: "Award data is required." }, { status: 400 });
  }

  const supabase = createServiceRoleClient();
  const table = resourceTables[body.resource];
  const response = typeof body.id === "string" && body.id
    ? await supabase.from(table).update(payload).eq("id", body.id).select("id").maybeSingle()
    : await supabase.from(table).insert(payload).select("id").maybeSingle();

  if (response.error) {
    return NextResponse.json({ ok: false, error: response.error.message }, { status: 500 });
  }

  if (!response.data?.id) {
    return NextResponse.json({ ok: false, error: "No award row was saved." }, { status: 500 });
  }

  // Artist-award rows render in the profile's awards section. The payload may
  // omit artist_id on partial updates, so read it from the saved row. Award
  // and category renames fan out to many artists and stay on the TTL.
  if (body.resource === "artistAward") {
    const { data: savedAward } = await supabase
      .from("artist_awards")
      .select("artist_id")
      .eq("id", response.data.id)
      .maybeSingle();
    await revalidateArtistProfilesByArtistIds([savedAward?.artist_id ?? null]);
  }

  return NextResponse.json({ ok: true, id: response.data.id });
}

export async function DELETE(request: Request) {
  const auth = await requireAdminApiRole("admin");
  if (auth.response) return auth.response;

  const body = await request.json() as { resource?: unknown; id?: unknown };
  if (!isAwardResource(body.resource) || typeof body.id !== "string" || !body.id) {
    return NextResponse.json({ ok: false, error: "Award resource and id are required." }, { status: 400 });
  }

  const supabase = createServiceRoleClient();
  const deletedArtistId =
    body.resource === "artistAward"
      ? (
          await supabase
            .from("artist_awards")
            .select("artist_id")
            .eq("id", body.id)
            .maybeSingle()
        ).data?.artist_id ?? null
      : null;
  const { error } = await supabase
    .from(resourceTables[body.resource])
    .delete()
    .eq("id", body.id);

  if (error) {
    return NextResponse.json({ ok: false, error: error.message }, { status: 500 });
  }

  await revalidateArtistProfilesByArtistIds([deletedArtistId]);

  return NextResponse.json({ ok: true, id: body.id });
}
