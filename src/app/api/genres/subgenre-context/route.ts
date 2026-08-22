import { NextResponse } from "next/server";

import { getSubgenreContext } from "@/lib/genreApi";

/**
 * Artists and media for one subgenre, used by the genre page's client-side
 * subgenre filter.
 *
 * The canonical genre page is statically cached and always renders the
 * unfiltered genre; this endpoint supplies the two regions that actually
 * differ when a visitor selects a subgenre. It reads only the existing cached
 * genre helpers, so it adds no new database load beyond what the page already
 * performed, and it accepts nothing but two slugs — there is no unbounded
 * parameter surface here.
 */
export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const genre = (searchParams.get("genre") ?? "").trim();
  const subgenre = (searchParams.get("subgenre") ?? "").trim();

  if (!genre || !subgenre) {
    return NextResponse.json(
      { ok: false, error: "genre and subgenre are required." },
      { status: 400 },
    );
  }

  const context = await getSubgenreContext(genre, subgenre);
  if (!context) {
    return NextResponse.json({ ok: false, error: "Unknown genre or subgenre." }, { status: 404 });
  }

  return NextResponse.json({ ok: true, ...context });
}
