import type { MetadataRoute } from "next";

import { buildCanonical } from "@/lib/seo";

// Indexing is deliberately opt-in so connecting or previewing a deployment
// cannot expose the site to crawlers before the official launch.
const allowSearchIndexing =
  process.env.VERCEL_ENV === "production" &&
  process.env.ALLOW_SEARCH_INDEXING === "true";

const INTERNAL_PATHS = ["/admin", "/admin/", "/api/", "/auth/", "/debug"];

/**
 * Paths crawlers are kept out of: everything internal, plus site search.
 *
 * Search result pages are user-driven and effectively unbounded — every query
 * is another crawlable URL with no standalone value, and the catalog they
 * point at is already covered by the sitemap. Blocking the crawl is the
 * smallest mechanism that works: metadata `noindex` would fight the existing
 * canonical to /search, and the site publishes no SearchAction markup that
 * depends on /search being crawlable.
 */
const CRAWLER_DISALLOWED = [...INTERNAL_PATHS, "/search"];
const META_CRAWLERS = ["facebookexternalhit", "Facebot", "meta-externalagent"];

export function createRobotsPolicy(indexingEnabled: boolean): MetadataRoute.Robots {
  if (!indexingEnabled) {
    return {
      rules: {
        userAgent: "*",
        disallow: "/",
      },
    };
  }

  return {
    rules: [
      {
        userAgent: "*",
        allow: "/",
        disallow: CRAWLER_DISALLOWED,
      },
      ...META_CRAWLERS.map((userAgent) => ({
        userAgent,
        allow: "/",
        disallow: CRAWLER_DISALLOWED,
      })),
    ],
    sitemap: buildCanonical("/sitemap.xml"),
    host: buildCanonical("/"),
  };
}

export default function robots(): MetadataRoute.Robots {
  return createRobotsPolicy(allowSearchIndexing);
}
