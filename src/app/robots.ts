import type { MetadataRoute } from "next";

import { buildCanonical } from "@/lib/seo";

// Indexing is deliberately opt-in so connecting or previewing a deployment
// cannot expose the site to crawlers before the official launch.
const allowSearchIndexing =
  process.env.VERCEL_ENV === "production" &&
  process.env.ALLOW_SEARCH_INDEXING === "true";

const INTERNAL_PATHS = ["/admin", "/admin/", "/api/", "/auth/", "/debug"];
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
        disallow: INTERNAL_PATHS,
      },
      ...META_CRAWLERS.map((userAgent) => ({
        userAgent,
        allow: "/",
        disallow: INTERNAL_PATHS,
      })),
    ],
    sitemap: buildCanonical("/sitemap.xml"),
    host: buildCanonical("/"),
  };
}

export default function robots(): MetadataRoute.Robots {
  return createRobotsPolicy(allowSearchIndexing);
}
