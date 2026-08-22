// app/page.tsx

import type { Metadata } from "next";
import MainWrapper from "@/components/layout/MainWrapper";
import PageSection from "@/components/layout/PageSection";
import { getHomeData } from "@/lib/homeApi";
import FeaturedArtistSection from "@/components/organisms/FeaturedArtistSection";
import TopArtistsSection from "@/components/organisms/TopArtistsSection";
import TrendingSongsSection from "@/components/organisms/MostSearchedSongs";
import BrowseByGenreSection from "@/components/organisms/BrowseByGenreSection";
import BrowseByRegionSection from "@/components/organisms/BrowseByRegionSection";
import MostAwardedArtistsSection from "@/components/organisms/MostAwardedArtistsSection";
import ProminentComposersSection from "@/components/organisms/ProminentComposersSection";
import TopDjsSection from "@/components/organisms/TopDjsSection";
import BirthdaySection from "@/components/organisms/BirthdaySection";
import TopChristianArtistsSection from "@/components/organisms/TopChristianArtistsSection";
import ClassicalArtistsSection from "@/components/organisms/ClassicalArtistsSection";
import TopRisingStarsSection from "@/components/organisms/TopRisingStarsSection";
import TopLegendsArtistsSection from "@/components/organisms/TopLegendsArtistsSection";
import DecadeTimelineCarousel from "@/components/home/DecadeTimelineCarousel";
import { getArchiveCounts } from "@/lib/getSongsByYear";
import { createPageMetadata, type SeoLocale } from "@/lib/seo";
import JsonLd from "@/components/seo/JsonLd";
import { buildLocalizedCanonical, SITE_NAME, SITE_URL } from "@/lib/seo";
import { getTranslations } from "next-intl/server";

const HOME_METADATA: Record<SeoLocale, { title: string; description: string }> = {
  en: {
    title: "Mangulina — The Dominican Music Database",
    description:
      "Explore Dominican artists, songs, albums, genres, awards, and music history.",
  },
  es: {
    title: "Mangulina — La Base de Datos de Música Dominicana",
    description:
      "Explora artistas, canciones, álbumes, géneros, premios e historia de la música dominicana.",
  },
};

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}): Promise<Metadata> {
  const { locale: routeLocale } = await params;
  const locale: SeoLocale = routeLocale === "es" ? "es" : "en";
  const { title, description } = HOME_METADATA[locale];

  return createPageMetadata({
    title,
    description,
    path: "/",
    locale,
  });
}

export const revalidate = 600; // 10 minutes

export default async function HomePage({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale: routeLocale } = await params;
  const locale: SeoLocale = routeLocale === "es" ? "es" : "en";
  const t = await getTranslations({ locale, namespace: "homepageIdentity" });
  const canonicalUrl = buildLocalizedCanonical("/", locale);
  const { description } = HOME_METADATA[locale];
  const [data, archiveCounts] = await Promise.all([
    getHomeData(locale),
    getArchiveCounts(),
  ]);

  return (
    <MainWrapper className="homepage-section-titles-red !pb-0">
      <JsonLd
        data={[
          {
            "@context": "https://schema.org",
            "@type": "WebSite",
            "@id": `${SITE_URL}/#website`,
            name: SITE_NAME,
            alternateName: "Dominican Music Database",
            url: SITE_URL,
            inLanguage: ["en", "es"],
            description:
              "Mangulina is a Dominican Music Database dedicated to documenting artists, songs, releases, genres, and Dominican music history.",
            publisher: { "@id": `${SITE_URL}/#organization` },
          },
          {
            "@context": "https://schema.org",
            "@type": "Organization",
            "@id": `${SITE_URL}/#organization`,
            name: SITE_NAME,
            alternateName: "Dominican Music Database",
            url: SITE_URL,
            description:
              "Mangulina is a Dominican Music Database dedicated to documenting artists, songs, releases, genres, and Dominican music history.",
          },
          {
            "@context": "https://schema.org",
            "@type": "WebPage",
            "@id": `${canonicalUrl}#webpage`,
            name: t("title"),
            description,
            url: canonicalUrl,
            inLanguage: locale,
            isPartOf: { "@id": `${SITE_URL}/#website` },
          },
        ]}
      />
      <PageSection className="!mt-6 !mb-2">
        <div className="max-w-4xl">
          <h1 className="text-2xl sm:text-3xl font-normal tracking-tight text-gray-800">
            {t("title")}
          </h1>
          <p className="mt-2 text-sm sm:text-base leading-relaxed text-gray-600">
            {t("introduction")}
          </p>
        </div>
      </PageSection>
      <PageSection>
        <FeaturedArtistSection featuredArtist={data.featuredArtist} />
      </PageSection>

      {data.topArtists.length > 0 && (
        <PageSection>
          <TopArtistsSection topArtists={data.topArtists} />
        </PageSection>
      )}

      <PageSection>
        <DecadeTimelineCarousel decadeCounts={archiveCounts.decadeCounts} />
      </PageSection>

      {data.christianArtists.length > 0 && (
        <PageSection>
          <TopChristianArtistsSection christianArtists={data.christianArtists} />
        </PageSection>
      )}

      <PageSection>
        <BrowseByGenreSection />
      </PageSection>

      <PageSection>
        <MostAwardedArtistsSection artists={data.mostAwardedArtists} />
      </PageSection>

      {data.trendingSongs.length > 0 && (
        <PageSection>
          <TrendingSongsSection songs={data.trendingSongs} />
        </PageSection>
      )}

      {data.legendsArtists.length > 0 && (
        <PageSection>
          <TopLegendsArtistsSection artists={data.legendsArtists} />
        </PageSection>
      )}

      <PageSection>
        <BrowseByRegionSection regions={data.regions} />
      </PageSection>

      {data.classicalArtists.length > 0 && (
        <PageSection>
          <ClassicalArtistsSection classicalArtists={data.classicalArtists} />
        </PageSection>
      )}

      {data.composers.length > 0 && (
        <PageSection>
          <ProminentComposersSection composers={data.composers} />
        </PageSection>
      )}

      {data.djs.length > 0 && (
        <PageSection>
          <TopDjsSection djs={data.djs} />
        </PageSection>
      )}

      {data.risingStars.length > 0 && (
        <PageSection>
          <TopRisingStarsSection risingStars={data.risingStars} />
        </PageSection>
      )}

      <PageSection className="!mb-2">
        <BirthdaySection birthdayArtists={data.birthdayArtists} />
      </PageSection>
    </MainWrapper>
  );
}
