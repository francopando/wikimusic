import { NextResponse } from "next/server";
import { getSupabaseClient } from "@/lib/supabase";
import { HOME_ARTIST_CARD_LIMIT } from "@/lib/homepageLimits";
import type { Artist } from "@/types/music";

const LOCAL_DATE_PATTERN = /^\d{4}-\d{2}-\d{2}$/;

export async function GET(request: Request) {
  const date = new URL(request.url).searchParams.get("date")?.trim() ?? "";

  if (!LOCAL_DATE_PATTERN.test(date)) {
    return NextResponse.json(
      { ok: false, error: "A valid local date is required." },
      { status: 400 },
    );
  }

  const { data, error } = await getSupabaseClient().rpc(
    "get_homepage_birthday_artists",
    {
      p_today: date,
      p_limit: HOME_ARTIST_CARD_LIMIT,
    },
  );

  if (error) {
    console.error("Birthday artists RPC failed:", error);
    return NextResponse.json(
      { ok: false, error: "Unable to load birthday artists." },
      { status: 500 },
    );
  }

  return NextResponse.json(
    { ok: true, artists: (data ?? []) as Artist[] },
    {
      headers: {
        "Cache-Control": "public, s-maxage=3600, stale-while-revalidate=86400",
      },
    },
  );
}
