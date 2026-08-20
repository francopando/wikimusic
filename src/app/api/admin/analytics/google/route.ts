import { NextResponse } from "next/server";
import { requireAdminApiRole } from "@/lib/adminApiAuth";
import {
  fetchGoogleAnalyticsReports,
  getGoogleAnalyticsDataConfig,
} from "@/lib/googleAnalyticsData";

/**
 * Returns GA4 marketing/audience reports for the admin analytics dashboard.
 *
 * Connection is configuration-based (service account env vars), so the
 * response distinguishes "not configured" (connected: false, 200) from a
 * genuine GA4 API failure (502).
 */
export async function GET() {
  const auth = await requireAdminApiRole("editor");
  if (auth.response) return auth.response;

  const config = getGoogleAnalyticsDataConfig();
  if (!config) {
    return NextResponse.json({ connected: false });
  }

  try {
    const reports = await fetchGoogleAnalyticsReports(config);
    return NextResponse.json({
      connected: true,
      propertyId: config.propertyId,
      reports,
      timestamp: new Date().toISOString(),
    });
  } catch (error) {
    console.error("Google Analytics Data API error:", error);
    return NextResponse.json(
      { connected: true, error: "Failed to fetch Google Analytics reports" },
      { status: 502 },
    );
  }
}
