import { revalidateTag } from "next/cache";

/**
 * Global tag carried by every artist portfolio entry.
 *
 * Clearing it drops the portfolio of every artist at once, which is what a
 * schema or layout change to the portfolio itself needs. It is NOT what an
 * edit to one artist needs — see the per-artist tag below.
 */
export const ARTIST_PORTFOLIO_CACHE_TAG = "artist-portfolios";

/**
 * Per-artist tag, so one artist's portfolio can be dropped on its own.
 *
 * Why this exists: getArtistWorksPortfolio caches one entry per artist id, but
 * every entry used to carry only the shared tag above. Invalidating a single
 * artist therefore dropped all of them, and because each profile page rebuild
 * writes roughly 34 KB — about 4.2 ISR write units — one admin save cost a
 * rebuild of the whole artist catalogue rather than of the artist it touched.
 *
 * That is bounded by the size of the catalogue, so it gets worse as the
 * catalogue grows: at 643 published artists a stray save costs around 5,400
 * write units, and at 5,000 it would cost around 42,000 — a fifth of a month's
 * Hobby allowance for changing one word.
 *
 * Entries carry both tags, so the global sweep still works when it is really
 * wanted and the targeted drop is available when it is not.
 */
export function artistPortfolioTag(artistId: string) {
  return `artist-portfolio:${artistId}`;
}

/** Drops every artist portfolio. Reach for the per-artist version instead. */
export function invalidateArtistPortfolioCache() {
  revalidateTag(ARTIST_PORTFOLIO_CACHE_TAG, { expire: 0 });
}

/** Drops one artist's portfolio and leaves every other artist cached. */
export function invalidateArtistPortfolio(artistId: string) {
  if (!artistId) return;
  revalidateTag(artistPortfolioTag(artistId), { expire: 0 });
}
