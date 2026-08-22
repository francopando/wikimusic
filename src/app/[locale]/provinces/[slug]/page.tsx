import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { getTranslations } from "next-intl/server";

import ArtistDirectory from "@/components/artists/ArtistDirectory";
import { getArtistDirectoryInitialData } from "@/lib/artistDirectoryData";
import {
  getPublishedProvinceBySlug,
  getPublishedProvinces,
  getProvinceDisplayName,
} from "@/lib/provinces";
import { createPageMetadata } from "@/lib/seo";

type ProvincePageProps = {
  params: Promise<{ slug: string; locale: string }>;
};

// Render dynamically (matches genres/[slug]); the localized root layout reads
// the request locale, which is incompatible with static prerendering here.
/**
 * Province profiles are cacheable HTML.
 *
 * The route was force-dynamic and read searchParams for directory filter
 * state, so every request re-rendered at origin and the populated
 * generateStaticParams below was inert. The server now renders the canonical,
 * unfiltered province; ArtistDirectory loads filtered or paginated views on
 * the client exactly as it already did when the server payload did not match
 * the requested view.
 *
 * The 24h TTL is a fallback: artist publication and role changes invalidate
 * this through PUBLIC_ARTIST_DIRECTORY_CACHE_TAG. Province rows themselves
 * have no admin mutation route.
 */
export const revalidate = 86400;

export async function generateStaticParams() {
  const provinces = await getPublishedProvinces();
  return provinces.map((province) => ({ slug: province.slug }));
}

export async function generateMetadata({ params }: ProvincePageProps): Promise<Metadata> {
  const { slug, locale } = await params;
  const province = await getPublishedProvinceBySlug(slug);
  if (!province) return {};
  const provinceDisplayName = getProvinceDisplayName(province.name);

  const title = `Dominican Artists from ${provinceDisplayName}`;
  return createPageMetadata({
    title,
    description: `Explore Dominican artists from ${provinceDisplayName}, including singers, composers, musicians, DJs, and other figures in Dominican music.`,
    path: `/provinces/${province.slug}`,
    locale,
  });
}

export default async function ProvinceArtistsPage({ params }: ProvincePageProps) {
  const { slug } = await params;
  const province = await getPublishedProvinceBySlug(slug);
  if (!province) notFound();
  const provinceDisplayName = getProvinceDisplayName(province.name);

  const t = await getTranslations("artistDirectory");
  const initialData = await getArtistDirectoryInitialData({
    fixedProvince: province.name,
  });

  return (
    <ArtistDirectory
      path={`/provinces/${province.slug}`}
      heading={t("provinceHeading", { province: provinceDisplayName })}
      mobileTitlePrefix={t("provinceMobilePrefix")}
      mobileTitleHighlight={provinceDisplayName}
      intro={t("provinceIntro", { province: provinceDisplayName })}
      fixedProvince={province.name}
      showProvinceSelector
      hideGenreFilter
      initialData={initialData}
    />
  );
}
