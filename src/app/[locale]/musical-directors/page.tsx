import ArtistRoleDirectoryPage from "@/components/artists/ArtistRoleDirectoryPage";
import { ARTIST_ROLE_PAGES, createArtistRoleMetadata } from "@/lib/artist-role-pages";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  return createArtistRoleMetadata("musicalDirectors", locale);
}

type MusicalDirectorsPageProps = {
  searchParams: Promise<Record<string, string | string[] | undefined>>;
};

export default async function MusicalDirectorsPage({
  searchParams,
}: MusicalDirectorsPageProps) {
  return (
    <ArtistRoleDirectoryPage
      config={ARTIST_ROLE_PAGES.musicalDirectors}
      searchParams={await searchParams}
    />
  );
}
