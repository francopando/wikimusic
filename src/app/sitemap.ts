import type { MetadataRoute } from "next";

import { genreDefinitions } from "@/lib/genres";
import { localeAlternates } from "@/lib/seo";
import { getSupabaseClient } from "@/lib/supabase";
import { getPublishedProvinces } from "@/lib/provinces";
import { getArchiveCounts } from "@/lib/getSongsByYear";
import { getReleaseDecadeCounts, getReleaseTypeCounts } from "@/lib/releaseApi";

const PAGE_SIZE = 1000;

export const revalidate = 3600;

type ArtistSitemapRow = { id: string; slug: string | null };
type ReleaseSitemapRow = {
  id: string;
  slug: string | null;
  release_artist_id: string | null;
};
type RecordingSitemapRow = {
  slug: string | null;
  artist_id: string | null;
  release_id: string | null;
};
type GenreSitemapRow = { slug: string | null };

async function getPublishedArtists() {
  const supabase = getSupabaseClient();
  const rows: ArtistSitemapRow[] = [];

  for (let from = 0; ; from += PAGE_SIZE) {
    const { data, error } = await supabase
      .from("artists")
      .select("id,slug")
      .eq("status", "published")
      .not("slug", "is", null)
      .range(from, from + PAGE_SIZE - 1);

    if (error) throw error;
    const page = (data ?? []) as ArtistSitemapRow[];
    rows.push(...page);
    if (page.length < PAGE_SIZE) break;
  }

  return rows;
}

async function getReleases() {
  const supabase = getSupabaseClient();
  const rows: ReleaseSitemapRow[] = [];

  for (let from = 0; ; from += PAGE_SIZE) {
    const { data, error } = await supabase
      .from("releases")
      .select("id,slug,release_artist_id")
      .not("slug", "is", null)
      .range(from, from + PAGE_SIZE - 1);

    if (error) throw error;
    const page = (data ?? []) as ReleaseSitemapRow[];
    rows.push(...page);
    if (page.length < PAGE_SIZE) break;
  }

  return rows;
}

async function getRecordings() {
  const supabase = getSupabaseClient();
  const rows: RecordingSitemapRow[] = [];

  for (let from = 0; ; from += PAGE_SIZE) {
    const { data, error } = await supabase
      .from("recordings")
      .select("slug,artist_id,release_id")
      .not("slug", "is", null)
      .range(from, from + PAGE_SIZE - 1);

    if (error) throw error;
    const page = (data ?? []) as RecordingSitemapRow[];
    rows.push(...page);
    if (page.length < PAGE_SIZE) break;
  }

  return rows;
}

async function getActiveGenreSlugs() {
  const supabase = getSupabaseClient();
  const { data, error } = await supabase
    .from("genres")
    .select("slug")
    .eq("active", true)
    .eq("level", 0)
    .is("parent_id", null)
    .not("slug", "is", null);

  if (error) throw error;
  return (data ?? []) as GenreSitemapRow[];
}

function entries(path: string, priority?: number): MetadataRoute.Sitemap {
  const languages = localeAlternates(path);

  // Google requires a separate <url> entry for every localized version. Each
  // entry repeats the same reciprocal hreflang set, including itself.
  return ([languages.en, languages.es] as const).map((url) => ({
    url,
    changeFrequency: "weekly",
    priority,
    alternates: { languages },
  }));
}

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const [artists, releases, recordings, databaseGenres, provinces] = await Promise.all([
    getPublishedArtists(),
    getReleases(),
    getRecordings(),
    getActiveGenreSlugs(),
    getPublishedProvinces(),
  ]);
  const [{ decadeCounts, yearCounts }, releaseTypeCounts, releaseDecadeCounts] = await Promise.all([
    getArchiveCounts(),
    getReleaseTypeCounts(),
    getReleaseDecadeCounts(),
  ]);

  const publishedArtistIds = new Set(artists.map((artist) => artist.id));
  const publicReleases = releases.filter(
    (release) => !release.release_artist_id || publishedArtistIds.has(release.release_artist_id),
  );
  const publicReleaseIds = new Set(publicReleases.map((release) => release.id));
  const publicRecordings = recordings.filter((recording) => {
    if (recording.artist_id) return publishedArtistIds.has(recording.artist_id);
    if (recording.release_id) return publicReleaseIds.has(recording.release_id);
    return true;
  });
  const genreSlugs = new Set([
    ...genreDefinitions.map((genre) => genre.slug),
    ...databaseGenres.map((genre) => genre.slug).filter((slug): slug is string => Boolean(slug)),
  ]);

  return [
    ...entries("/", 1),
    ...entries("/discover", 0.8),
    ...entries("/artists", 0.9),
    ...entries("/artists/legends", 0.8),
    ...entries("/artists/emerging", 0.8),
    ...entries("/artists/most-awarded", 0.8),
    ...entries("/instrumental-classical", 0.7),
    ...entries("/composers", 0.8),
    ...entries("/songwriters", 0.8),
    ...entries("/lyricists", 0.8),
    ...entries("/arrangers", 0.8),
    ...entries("/musical-directors", 0.8),
    ...entries("/musicians", 0.8),
    ...entries("/djs", 0.8),
    ...entries("/producers", 0.8),
    ...entries("/christian", 0.8),
    ...entries("/archive", 0.9),
    ...entries("/releases", 0.9),
    ...entries("/releases/most-viewed", 0.8),
    ...entries("/releases/recent", 0.8),
    ...entries("/releases/essential", 0.7),
    ...entries("/artists/birthdays", 0.7),
    ...entries("/about", 0.6),
    ...entries("/contact", 0.5),
    ...entries("/contributors", 0.5),
    ...entries("/privacy-policy", 0.4),
    ...entries("/terms-of-use", 0.4),
    ...entries("/dmca", 0.4),
    ...Object.keys(decadeCounts)
      .filter((decade) => decadeCounts[decade] > 0)
      .sort((a, b) => Number(b.slice(0, 4)) - Number(a.slice(0, 4)))
      .flatMap((decade) => entries(`/archive/${decade}`, 0.8)),
    ...Object.keys(yearCounts)
      .filter((year) => yearCounts[year] > 0)
      .sort((a, b) => Number(b) - Number(a))
      .flatMap((year) => entries(`/archive/${year}`, 0.7)),
    ...releaseTypeCounts.flatMap((type) => entries(`/releases/${type.slug}`, 0.7)),
    ...releaseDecadeCounts.flatMap((decade) => entries(`/releases/${decade.slug}`, 0.7)),
    ...provinces.flatMap((province) => entries(`/provinces/${province.slug}`, 0.8)),
    ...artists.flatMap((artist) => entries(`/artists/${artist.slug}`, 0.8)),
    ...publicRecordings.flatMap((recording) => entries(`/songs/${recording.slug}`, 0.7)),
    ...publicReleases.flatMap((release) => entries(`/releases/${release.slug}`, 0.7)),
    ...[...genreSlugs].flatMap((slug) => entries(`/genres/${slug}`, 0.7)),
  ];
}
