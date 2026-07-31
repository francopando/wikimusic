import ArtistRoleDirectoryPage from "@/components/artists/ArtistRoleDirectoryPage";
import { ARTIST_ROLE_PAGES } from "@/lib/artist-role-pages";
import { createPageMetadata } from "@/lib/seo";
import { getTranslations } from "next-intl/server";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  const t = await getTranslations({
    locale,
    namespace: "artistDirectory.musicalDirectors",
  });
  return createPageMetadata({
    title: t("metadataTitle"),
    description: t("metadataDescription"),
    path: ARTIST_ROLE_PAGES.musicalDirectors.path,
    locale,
  });
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
