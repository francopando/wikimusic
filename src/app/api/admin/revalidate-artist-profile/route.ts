import { NextResponse } from "next/server";
import { requireAdminApiRole } from "@/lib/adminApiAuth";
import { createServiceRoleClient } from "@/lib/supabaseService";
import { revalidateArtistProfilePaths } from "@/lib/revalidateArtistProfile";

export async function POST(request: Request) {
  const auth = await requireAdminApiRole();
  if (auth.response) return auth.response;

  const { slug } = (await request.json()) as { slug?: unknown };
  const normalizedSlug = typeof slug === "string" ? slug.trim() : "";

  if (!normalizedSlug) {
    return NextResponse.json(
      { ok: false, error: "Artist slug is required." },
      { status: 400 },
    );
  }

  // Resolve the id so only this artist's portfolio entry is dropped. Without
  // it the helper cannot target the portfolio and leaves it to the clock.
  const { data: artist } = await createServiceRoleClient()
    .from("artists")
    .select("id")
    .eq("slug", normalizedSlug)
    .maybeSingle();

  revalidateArtistProfilePaths(normalizedSlug, artist?.id ?? null);

  return NextResponse.json({ ok: true });
}
