import ArtistDirectory from "@/components/artists/ArtistDirectory";
import {
  getAwardedArtistRankings,
  getAwardFilterOptions,
} from "@/lib/artistAwards";
import { getArtistDirectoryInitialData } from "@/lib/artistDirectoryData";
import { createPageMetadata } from "@/lib/seo";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  return createPageMetadata({
    title: "Most Awarded Dominican Artists",
    description:
      "Explore the most awarded Dominican artists and their achievements in Mangulina, the Dominican Music Database.",
    path: "/artists/most-awarded",
    locale,
  });
}

type MostAwardedArtistsPageProps = {
  searchParams: Promise<Record<string, string | string[] | undefined>>;
};

export default async function MostAwardedArtistsPage({
  searchParams,
}: MostAwardedArtistsPageProps) {
  const resolvedSearchParams = await searchParams;
  const award = Array.isArray(resolvedSearchParams.award)
    ? resolvedSearchParams.award[0]
    : resolvedSearchParams.award;
  const awardOptions = await getAwardFilterOptions();
  const selectedAward = awardOptions.some((option) => option.value === award)
    ? award
    : undefined;
  const [type, id] = selectedAward?.split(":") ?? [];
  const awardRankings = await getAwardedArtistRankings(
    type === "award" || type === "category" ? { type, id } : undefined,
  );
  const rankedArtistIds = awardRankings.map((ranking) => ranking.artist_id);
  // This page stays dynamic: ?award= is validated against a bounded option
  // list and genuinely drives the server-computed rankings below. The raw
  // query string is deliberately not passed into the directory cache key,
  // which would otherwise mint an entry per arbitrary query.
  const initialData = await getArtistDirectoryInitialData({
    rankedArtistIds,
  });

  return (
    <ArtistDirectory
      path="/artists/most-awarded"
      i18nKey="mostAwarded"
      hideGenreFilter
      hideProvinceSelector
      rankedArtistIds={rankedArtistIds}
      awardRankings={awardRankings}
      awardOptions={awardOptions}
      initialData={initialData}
    />
  );
}
