/**
 * Payload handling for the manual revalidation endpoint.
 *
 * Editorial work that writes straight to Postgres — the bulk artist, recording
 * and release passes — runs no Next.js code, so none of the on-demand
 * revalidation in revalidateArtistProfile.ts or revalidateCatalogProfiles.ts
 * ever fires. Those helpers are reached only from an admin save. Public
 * profiles therefore sit on their fallback TTL (30 days) until something tells
 * them the underlying rows changed, which is what /api/revalidate is for.
 *
 * Parsing lives here rather than in the route so the validation rules are
 * testable without standing up a server.
 */

/** Slugs accepted per entity in a single request; the client batches beyond this. */
export const MAX_SLUGS_PER_ENTITY = 500;

export type RevalidationTarget = "artists" | "songs" | "releases";

export const REVALIDATION_TARGETS: RevalidationTarget[] = [
  "artists",
  "songs",
  "releases",
];

export type RevalidationRequest = {
  artists: string[];
  songs: string[];
  releases: string[];
  /**
   * Refreshes every artist profile in one call.
   *
   * Artist revalidation invalidates a shared portfolio tag, so a single slug
   * already sweeps all of them — this flag makes that explicit rather than
   * relying on the side effect. Songs and releases have no equivalent: their
   * revalidation is strictly per-path, so they must be named.
   */
  allArtists: boolean;
};

export type RevalidationParseResult =
  | { ok: true; request: RevalidationRequest }
  | { ok: false; error: string };

function parseSlugList(
  value: unknown,
  field: RevalidationTarget,
): { ok: true; slugs: string[] } | { ok: false; error: string } {
  if (value == null) return { ok: true, slugs: [] };

  if (!Array.isArray(value)) {
    return { ok: false, error: `"${field}" must be an array of slugs.` };
  }

  const slugs: string[] = [];
  for (const entry of value) {
    if (typeof entry !== "string") {
      return { ok: false, error: `"${field}" must contain only strings.` };
    }
    const slug = entry.trim();
    // Silently dropping blanks would hide a caller bug behind a success
    // response, so an empty entry is rejected rather than skipped.
    if (!slug) {
      return { ok: false, error: `"${field}" contains an empty slug.` };
    }
    slugs.push(slug);
  }

  if (slugs.length > MAX_SLUGS_PER_ENTITY) {
    return {
      ok: false,
      error: `"${field}" exceeds ${MAX_SLUGS_PER_ENTITY} slugs; send it in batches.`,
    };
  }

  return { ok: true, slugs: [...new Set(slugs)] };
}

export function parseRevalidationRequest(body: unknown): RevalidationParseResult {
  if (typeof body !== "object" || body === null || Array.isArray(body)) {
    return { ok: false, error: "Request body must be a JSON object." };
  }

  const raw = body as Record<string, unknown>;

  if (raw.allArtists != null && typeof raw.allArtists !== "boolean") {
    return { ok: false, error: '"allArtists" must be a boolean.' };
  }

  const parsed: Record<RevalidationTarget, string[]> = {
    artists: [],
    songs: [],
    releases: [],
  };

  for (const target of REVALIDATION_TARGETS) {
    const result = parseSlugList(raw[target], target);
    if (!result.ok) return { ok: false, error: result.error };
    parsed[target] = result.slugs;
  }

  const allArtists = raw.allArtists === true;
  const total = REVALIDATION_TARGETS.reduce(
    (sum, target) => sum + parsed[target].length,
    0,
  );

  // An empty request almost always means the caller built its payload wrong.
  // Reporting success for a no-op would let a broken editorial script look
  // like it refreshed the catalogue.
  if (!allArtists && total === 0) {
    return {
      ok: false,
      error: "Nothing to revalidate: provide slugs or set allArtists.",
    };
  }

  return { ok: true, request: { ...parsed, allArtists } };
}
