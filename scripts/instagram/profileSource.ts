// Reads Instagram profiles from the existing `artists` table.
//
// The `instagram` column is free text and has accumulated three shapes over
// time: bare handles (`alexbueno_rd`), full URLs (`https://www.instagram.com/
// djscuff/`) and `@handle`. Everything is normalized to a bare lowercase
// handle, which is also the activity-history key.

import pg from "pg";

import type { InstagramProfile } from "./types";

/** Instagram allows letters, digits, periods and underscores, up to 30 chars. */
const HANDLE_PATTERN = /^[a-z0-9._]{1,30}$/;

export type RejectedProfile = {
  artistName: string;
  slug: string;
  rawValue: string;
  reason: string;
};

export type ProfileQueryResult = {
  profiles: InstagramProfile[];
  rejected: RejectedProfile[];
  /** Handles that appear on more than one artist; processed once. */
  duplicates: string[];
};

export function profileUrlFor(username: string): string {
  return `https://www.instagram.com/${username}/`;
}

/**
 * Extracts a bare lowercase handle from whatever the column holds.
 * Returns null when the value cannot be read as an Instagram handle.
 */
export function normalizeHandle(rawValue: string | null | undefined): string | null {
  if (typeof rawValue !== "string") return null;

  let value = rawValue.trim();
  if (value === "") return null;

  // Full or partial URL: keep the first path segment after the host.
  const urlMatch = value.match(/(?:^|\/\/|\s)(?:www\.)?instagram\.com\/(.*)$/i);
  if (urlMatch) {
    value = urlMatch[1];
  }

  // Drop query strings, fragments and any trailing path.
  value = value.split(/[?#]/)[0];
  value = value.split("/").filter(Boolean)[0] ?? "";
  value = value.replace(/^@+/, "").trim().toLowerCase();

  if (value === "" || !HANDLE_PATTERN.test(value)) return null;

  return value;
}

export type FetchProfilesOptions = {
  /** Artist statuses to include. Defaults to published only. */
  statuses?: string[];
  /** Skip profiles that sort before this handle or artist name. */
  startAt?: string;
};

/**
 * Fetches artists that carry an Instagram handle, in stable alphabetical
 * order so runs are reproducible and resumable.
 */
export async function fetchInstagramProfiles(
  options: FetchProfilesOptions = {},
): Promise<ProfileQueryResult> {
  const statuses = options.statuses ?? ["published"];
  const connectionString = process.env.DATABASE_URL;

  if (!connectionString) {
    throw new Error("Missing DATABASE_URL. The worker reads profiles from the existing database.");
  }

  const client = new pg.Client({
    connectionString,
    ssl: { rejectUnauthorized: false },
  });

  await client.connect();

  try {
    const { rows } = await client.query<{
      id: string;
      name: string;
      slug: string;
      instagram: string | null;
    }>(
      `select id, name, slug, instagram
         from artists
        where status = any($1::text[])
          and instagram is not null
          and btrim(instagram) <> ''
        order by name asc, slug asc`,
      [statuses],
    );

    const profiles: InstagramProfile[] = [];
    const rejected: RejectedProfile[] = [];
    const duplicates: string[] = [];
    const seen = new Set<string>();

    for (const row of rows) {
      const username = normalizeHandle(row.instagram);

      if (!username) {
        rejected.push({
          artistName: row.name,
          slug: row.slug,
          rawValue: row.instagram ?? "",
          reason: "unreadable Instagram handle",
        });
        continue;
      }

      if (seen.has(username)) {
        duplicates.push(username);
        continue;
      }

      seen.add(username);
      profiles.push({
        artistId: row.id,
        artistName: row.name,
        slug: row.slug,
        username,
        profileUrl: profileUrlFor(username),
      });
    }

    const startAt = options.startAt?.trim().toLowerCase();
    const ordered = startAt
      ? profiles.filter(
          (profile) =>
            profile.username >= startAt || profile.artistName.toLowerCase() >= startAt,
        )
      : profiles;

    return { profiles: ordered, rejected, duplicates };
  } finally {
    await client.end();
  }
}
