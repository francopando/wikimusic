import type { Artist } from "@/types/music";

export const ARTIST_DIRECTORY_ITEMS_PER_PAGE = 24;

// The province column carries two sentinels so the directory can group artists
// who have no Dominican province: those born outside the country, and those
// whose province is simply unrecorded. They are bookkeeping, not place names,
// and must never be printed as part of an origin.
export const PROVINCE_SENTINELS = new Set(["Born Abroad", "No Province"]);

export function formatOrigin(
  birthPlace: string | null | undefined,
  province: string | null | undefined,
) {
  const realProvince = province && !PROVINCE_SENTINELS.has(province) ? province : null;

  return [birthPlace, realProvince].filter(Boolean).join(", ") || null;
}

export const ARTIST_LIST_SELECT = [
  "id",
  "slug",
  "name",
  "status",
  "primary_role",
  "occupations",
  "primary_genre",
  "stage_name",
  "date_of_birth",
  "province",
  "birth_place",
  "facebook",
  "instagram",
  "genres",
  "artist_tags",
  "has_image",
  "image_updated_at",
  "views",
  "death_year",
].join(",");

export type ArtistDirectoryInitialData = {
  artists: Artist[];
  totalCount: number;
  cacheKey: string;
};
