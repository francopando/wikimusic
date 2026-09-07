import { createHash, timingSafeEqual } from "node:crypto";
import { NextResponse } from "next/server";

import { createServiceRoleClient } from "@/lib/supabaseService";

import {
  revalidateAllArtistProfiles,
  revalidateArtistProfilePaths,
} from "@/lib/revalidateArtistProfile";
import {
  revalidateReleaseProfilePaths,
  revalidateSongProfilePaths,
} from "@/lib/revalidateCatalogProfiles";
import { parseRevalidationRequest } from "@/lib/revalidationRequest";

/**
 * Manual revalidation for changes written outside the admin routes.
 *
 * Admin saves already revalidate the entities they touch. Editorial passes
 * that write straight to Postgres do not — no Next.js code runs, so the
 * affected profiles keep serving their cached copy until the 7-day fallback
 * TTL expires. This endpoint closes that gap: run the pass, then name what
 * changed.
 *
 * Deliberately outside /api/admin. The locale proxy gates that prefix behind a
 * Supabase session (src/proxy.ts), which a shell script cannot present, so
 * authentication here is a bearer token instead. That makes the route
 * reachable without a browser, so it is fail-closed: with REVALIDATION_TOKEN
 * unset every request is refused, and a deployment that never sets it cannot
 * be poked at.
 *
 * The token authorizes cache invalidation and nothing else — it grants no read
 * or write access to any data. The worst a leaked token achieves is forcing
 * pages to regenerate, which costs ISR writes.
 */

export const dynamic = "force-dynamic";

function isAuthorized(request: Request) {
  const expected = process.env.REVALIDATION_TOKEN;
  if (!expected) return false;

  const header = request.headers.get("authorization") ?? "";
  const match = /^Bearer\s+(.+)$/i.exec(header.trim());
  if (!match) return false;

  // Hash both sides first: timingSafeEqual requires equal lengths, and
  // comparing raw values would leak the token's length through the error path.
  const provided = createHash("sha256").update(match[1]).digest();
  const reference = createHash("sha256").update(expected).digest();

  return timingSafeEqual(provided, reference);
}

export async function POST(request: Request) {
  if (!isAuthorized(request)) {
    return NextResponse.json(
      { ok: false, error: "Invalid or missing revalidation token." },
      { status: 401 },
    );
  }

  let body: unknown;
  try {
    body = await request.json();
  } catch {
    return NextResponse.json(
      { ok: false, error: "Request body must be valid JSON." },
      { status: 400 },
    );
  }

  const parsed = parseRevalidationRequest(body);
  if (!parsed.ok) {
    return NextResponse.json({ ok: false, error: parsed.error }, { status: 400 });
  }

  const { artists, songs, releases, allArtists } = parsed.request;

  // allArtists is the deliberate sweep: it clears the shared portfolio tag that
  // every artist profile reads, rebuilding the whole artist catalogue. Reach
  // for it when the portfolio's shape changed for everyone, not to publish a
  // handful of entries -- at ~4.2 ISR write units per profile and two locales
  // it costs roughly 5,400 units today and scales with the catalogue.
  if (allArtists) {
    revalidateAllArtistProfiles();
  }

  // Named artists are targeted: each drops only its own portfolio entry and its
  // own paths. Resolving slug -> id in one query is what makes that possible;
  // without the id the portfolio cannot be targeted and falls back to the clock.
  if (artists.length) {
    const { data: rows } = await createServiceRoleClient()
      .from("artists")
      .select("id,slug")
      .in("slug", artists);
    const idBySlug = new Map((rows ?? []).map((row) => [row.slug, row.id]));
    for (const slug of artists) {
      revalidateArtistProfilePaths(slug, idBySlug.get(slug) ?? null);
    }
  }
  for (const slug of songs) revalidateSongProfilePaths(slug);
  for (const slug of releases) revalidateReleaseProfilePaths(slug);

  return NextResponse.json({
    ok: true,
    revalidated: {
      artists: artists.length,
      songs: songs.length,
      releases: releases.length,
      allArtists,
    },
  });
}
