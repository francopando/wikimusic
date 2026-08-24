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

/**
 * Crawlers denied the whole site.
 *
 * Amazonbot walks the catalogue exhaustively: 3.3K edge requests in a 12h
 * window at a 2% cache hit rate, meaning almost every request was a distinct
 * URL with no cache entry, forcing a cold origin render. That accounted for
 * roughly 60% of all function invocations and the largest single share of ISR
 * writes. It feeds Alexa and Amazon product search, so it returns no
 * organic-search value for this catalogue.
 *
 * Deliberately narrow: Googlebot, GoogleOther, bingbot and DuckDuckBot are
 * untouched, and no path rule changes for anyone. This is a user-agent denial,
 * not an adjustment to what the site exposes.
 *
 * robots.txt is advisory. Amazon documents that Amazonbot honours it; if the
 * traffic does not fall within a day or two, enforcement belongs in the Vercel
 * firewall rather than here.
 */
const BLOCKED_CRAWLERS = ["Amazonbot"];

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
      ...BLOCKED_CRAWLERS.map((userAgent) => ({
        userAgent,
        disallow: "/",
      })),
    ],
    sitemap: buildCanonical("/sitemap.xml"),
    host: buildCanonical("/"),
  };
}

export default function robots(): MetadataRoute.Robots {
  return createRobotsPolicy(allowSearchIndexing);
}
