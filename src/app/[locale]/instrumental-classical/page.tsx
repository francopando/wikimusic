import ArtistDirectory from "@/components/artists/ArtistDirectory";
import { getArtistOccupationOptions } from "@/lib/artistOccupationOptions";
import { getArtistDirectoryInitialData } from "@/lib/artistDirectoryData";
import { createArtistDirectoryMetadata } from "@/lib/artist-role-pages";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  return createArtistDirectoryMetadata(
    "instrumentalClassical",
    "/instrumental-classical",
    locale,
  );
}

type InstrumentalClassicalPageProps = {
  searchParams: Promise<Record<string, string | string[] | undefined>>;
};

export default async function InstrumentalClassicalPage({
  searchParams,
}: InstrumentalClassicalPageProps) {
  const occupationOptions = await getArtistOccupationOptions("instrumentalist");
  const initialData = await getArtistDirectoryInitialData({
    searchParams: await searchParams,
    role: "instrumentalist",
  });

  return (
    <ArtistDirectory
      path="/instrumental-classical"
      i18nKey="instrumentalClassical"
      role="instrumentalist"
      hideGenreFilter
      hideProvinceSelector
      occupationOptions={occupationOptions}
      initialData={initialData}
    />
  );
}
