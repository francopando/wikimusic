export function normalizeSevenDayViews(value: number | null | undefined): number {
  return value ?? 0;
}

export function hasPositiveViews(value: number | string | null | undefined): boolean {
  return Number(value) > 0;
}

export function hasPositiveRecentOrAllTimeViews(
  recentViews: number | null | undefined,
  allTimeViews: number | string | null | undefined,
): boolean {
  return normalizeSevenDayViews(recentViews) > 0 || hasPositiveViews(allTimeViews);
}

/**
 * Supabase returns trend rows newest-first. Keep only the requested window and
 * reverse it for chronological chart rendering.
 */
export function chronologicalTrendRows<T>(
  rows: readonly T[] | null | undefined,
  daysBack: number,
): T[] {
  if (!Number.isFinite(daysBack) || daysBack <= 0) return [];
  return [...(rows ?? [])].slice(0, Math.floor(daysBack)).reverse();
}
