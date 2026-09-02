import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { Suspense } from "react";

import MainWrapper from "@/components/layout/MainWrapper";
import ArchiveClient, { type ArchiveInitialData } from "@/app/[locale]/archive/ArchiveClient";
import { parseArchivePeriod } from "@/lib/archivePeriods";
import {
  ARCHIVE_PAGE_SIZE,
  getArchiveCacheKey,
  getArchiveListingPeriod,
} from "@/lib/archiveShared";
import { getSongsByYearRange } from "@/lib/getSongsByYear";
import { createPageMetadata } from "@/lib/seo";

type ArchivePeriodPageProps = {
  params: Promise<{ period: string; locale: string }>;
};

function getArchivePeriodMetadata(periodSlug: string, locale?: string) {
  const period = parseArchivePeriod(periodSlug);
  if (!period) return null;

  if (period.type === "year") {
    return {
      period,
      metadata: createPageMetadata({
        title: `Dominican Music Released in ${period.year} | Mangulina`,
        description: `Browse Dominican music recordings and releases from ${period.year}. Discover artists, songs, and albums from Dominican music history.`,
        path: `/archive/${period.year}`,
        locale,
      }),
    };
  }

  return {
    period,
    metadata: createPageMetadata({
      title: `Dominican Music from the ${period.decade} | Mangulina`,
      description: `Explore Dominican music from the ${period.decade}, including recordings, releases, artists, and albums from Dominican music history.`,
      path: `/archive/${period.decade}`,
      locale,
    }),
  };
}

export async function generateMetadata({ params }: ArchivePeriodPageProps): Promise<Metadata> {
  const { period: periodSlug, locale } = await params;
  const result = getArchivePeriodMetadata(periodSlug, locale);

  if (!result) return {};

  return result.metadata;
}

// The archive spans ~118 periods (decades from 1920 plus every year), each
// cached per locale, and the route has no on-demand invalidation — this clock
// is its only freshness path. At 1h that was ~236 URLs expiring 24x a day,
// the largest ISR cost outside the profile routes. Archive listings describe
// historical catalogue, so a day of lag is immaterial.
export const revalidate = 86400; // 24 hours

// Required for this route to be cacheable at all. A dynamic segment with no
// generateStaticParams is rendered per request, so before this the route was
// pure origin compute: every crawler hit on any of ~236 period URLs paid a
// full render. Returning [] prebuilds nothing (the catalogue must never be
// serialized at build time) and lets dynamicParams fill the cache on first
// request, exactly as the profile routes do.
export function generateStaticParams() {
  return [];
}

export default async function ArchivePeriodPage({
  params,
}: ArchivePeriodPageProps) {
  const { period: periodSlug } = await params;
  const result = getArchivePeriodMetadata(periodSlug);

  if (!result) notFound();
  const listingPeriod = getArchiveListingPeriod(result.period);
  const initialSongs = listingPeriod
    ? await getSongsByYearRange(listingPeriod.startYear, listingPeriod.endYear, {
        limit: ARCHIVE_PAGE_SIZE,
        offset: 0,
        sort: "views",
      })
    : { songs: [], total: 0, hasMore: false };
  const initialData: ArchiveInitialData = {
    ...initialSongs,
    cacheKey: getArchiveCacheKey(listingPeriod, "views", 1),
  };

  return (
    <MainWrapper>
      <Suspense fallback={null}>
        <ArchiveClient period={result.period} initialData={initialData} />
      </Suspense>
    </MainWrapper>
  );
}
