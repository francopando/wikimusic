import ArtistStatusDirectoryPage from "@/components/artists/ArtistStatusDirectoryPage";
import { createPageMetadata } from "@/lib/seo";

// Canonical directory HTML is cacheable: the shell no longer depends on
// searchParams, so filtered/paginated views are handled client-side and cannot
// multiply Full Route Cache entries. Artist mutations invalidate this through
// PUBLIC_ARTIST_DIRECTORY_CACHE_TAG, so the TTL is a fallback.
export const revalidate = 86400;


export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  return createPageMetadata({
    title: "Dominican Music Legends",
    description:
      "Explore legendary Dominican artists and influential figures who shaped Dominican music history in Mangulina, the Dominican Music Database.",
    path: "/artists/legends",
    locale,
  });
}

export default async function DominicanMusicLegendsPage() {
  return (
    <ArtistStatusDirectoryPage
      path="/artists/legends"
      i18nKey="legends"
      artistStatus="legend"
    />
  );
}
