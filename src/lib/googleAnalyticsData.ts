import { createSign } from "node:crypto";

/**
 * Server-side client for the Google Analytics 4 Data API (v1beta).
 *
 * Auth model: a Google Cloud service account granted Viewer access on the GA4
 * property (no OAuth flow). The service-account JWT is signed locally with
 * node:crypto and exchanged for a short-lived access token, so no Google SDK
 * dependency is needed.
 *
 * Server-side only — the private key must never reach the client bundle, so
 * none of these env vars may use a NEXT_PUBLIC_ prefix.
 */

const GA4_DATA_API_BASE = "https://analyticsdata.googleapis.com/v1beta";
const GOOGLE_TOKEN_ENDPOINT = "https://oauth2.googleapis.com/token";
const ANALYTICS_READONLY_SCOPE = "https://www.googleapis.com/auth/analytics.readonly";
const REPORT_DATE_RANGE = { startDate: "28daysAgo", endDate: "today" };
const ROW_LIMIT = 10;

export interface GoogleAnalyticsDataConfig {
  propertyId: string;
  clientEmail: string;
  privateKey: string;
}

/**
 * Reads and validates the GA4 Data API configuration. Returns null when any
 * piece is missing or malformed, which the admin UI surfaces as
 * "Not Connected" rather than an error.
 */
export function getGoogleAnalyticsDataConfig(
  propertyId = process.env.GA4_PROPERTY_ID,
  clientEmail = process.env.GA4_SERVICE_ACCOUNT_EMAIL,
  privateKey = process.env.GA4_SERVICE_ACCOUNT_PRIVATE_KEY,
): GoogleAnalyticsDataConfig | null {
  const id = propertyId?.trim();
  const email = clientEmail?.trim();
  // Vercel env vars often store the PEM with literal "\n" escapes.
  const key = privateKey?.trim().replace(/\\n/g, "\n");

  if (!id || !/^\d+$/.test(id)) return null;
  if (!email || !email.includes("@")) return null;
  if (!key || !key.includes("PRIVATE KEY")) return null;

  return { propertyId: id, clientEmail: email, privateKey: key };
}

/** GA4 returns date dimension values as YYYYMMDD; normalize to ISO. */
export function formatGa4Date(value: string): string {
  return /^\d{8}$/.test(value)
    ? `${value.slice(0, 4)}-${value.slice(4, 6)}-${value.slice(6, 8)}`
    : value;
}

function base64UrlEncode(input: string): string {
  return Buffer.from(input).toString("base64url");
}

interface CachedToken {
  accessToken: string;
  // Epoch ms after which the token must be re-minted.
  expiresAt: number;
}

let cachedToken: CachedToken | null = null;

async function getAccessToken(config: GoogleAnalyticsDataConfig): Promise<string> {
  // 60s safety margin so an almost-expired token is never used mid-request.
  if (cachedToken && cachedToken.expiresAt - 60_000 > Date.now()) {
    return cachedToken.accessToken;
  }

  const issuedAt = Math.floor(Date.now() / 1000);
  const header = base64UrlEncode(JSON.stringify({ alg: "RS256", typ: "JWT" }));
  const claims = base64UrlEncode(
    JSON.stringify({
      iss: config.clientEmail,
      scope: ANALYTICS_READONLY_SCOPE,
      aud: GOOGLE_TOKEN_ENDPOINT,
      iat: issuedAt,
      exp: issuedAt + 3600,
    }),
  );
  const signature = createSign("RSA-SHA256")
    .update(`${header}.${claims}`)
    .sign(config.privateKey)
    .toString("base64url");

  const response = await fetch(GOOGLE_TOKEN_ENDPOINT, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
      assertion: `${header}.${claims}.${signature}`,
    }),
  });

  if (!response.ok) {
    const detail = await response.text();
    throw new Error(`GA4 token exchange failed (${response.status}): ${detail}`);
  }

  const payload = (await response.json()) as { access_token: string; expires_in: number };
  cachedToken = {
    accessToken: payload.access_token,
    expiresAt: Date.now() + payload.expires_in * 1000,
  };
  return payload.access_token;
}

// Minimal subset of the GA4 Data API runReport request/response shapes.
interface RunReportRequest {
  dateRanges: Array<{ startDate: string; endDate: string }>;
  metrics: Array<{ name: string }>;
  dimensions?: Array<{ name: string }>;
  dimensionFilter?: unknown;
  orderBys?: unknown[];
  limit?: string;
}

interface Ga4Row {
  dimensionValues?: Array<{ value: string }>;
  metricValues?: Array<{ value: string }>;
}

interface RunReportResponse {
  rows?: Ga4Row[];
}

async function runReport(
  config: GoogleAnalyticsDataConfig,
  accessToken: string,
  request: RunReportRequest,
): Promise<RunReportResponse> {
  const response = await fetch(
    `${GA4_DATA_API_BASE}/properties/${config.propertyId}:runReport`,
    {
      method: "POST",
      headers: {
        Authorization: `Bearer ${accessToken}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(request),
    },
  );

  if (!response.ok) {
    const detail = await response.text();
    throw new Error(`GA4 runReport failed (${response.status}): ${detail}`);
  }

  return (await response.json()) as RunReportResponse;
}

export interface LabeledMetricRow {
  label: string;
  value: number;
}

export interface DailyTrendRow {
  date: string;
  activeUsers: number;
  pageViews: number;
}

export interface GoogleAnalyticsReports {
  summary: {
    activeUsers: number;
    newUsers: number;
    sessions: number;
    pageViews: number;
    averageSessionDurationSeconds: number;
    engagementRate: number;
  };
  dailyTrend: DailyTrendRow[];
  channels: LabeledMetricRow[];
  countries: LabeledMetricRow[];
  devices: LabeledMetricRow[];
  landingPages: LabeledMetricRow[];
  organicLandingPages: LabeledMetricRow[];
  topPages: LabeledMetricRow[];
  keyEvents: LabeledMetricRow[];
}

function metricNumber(row: Ga4Row | undefined, index: number): number {
  const raw = row?.metricValues?.[index]?.value;
  const parsed = raw === undefined ? NaN : Number(raw);
  return Number.isFinite(parsed) ? parsed : 0;
}

/** Flattens a one-dimension/one-metric report into label/value rows. */
export function toLabeledRows(response: RunReportResponse): LabeledMetricRow[] {
  return (response.rows ?? []).map((row) => {
    // GA4 sends an empty string for unset dimensions (e.g. traffic it has
    // not classified yet); mirror GA's own "(not set)" convention.
    const label = row.dimensionValues?.[0]?.value?.trim();
    return {
      label: label || "(not set)",
      value: metricNumber(row, 0),
    };
  });
}

/**
 * Fetches the admin dashboard's GA4 reports (last 28 days) in parallel.
 * Throws on any API failure; callers translate that into an error state.
 */
export async function fetchGoogleAnalyticsReports(
  config: GoogleAnalyticsDataConfig,
): Promise<GoogleAnalyticsReports> {
  const accessToken = await getAccessToken(config);
  const report = (request: Omit<RunReportRequest, "dateRanges">) =>
    runReport(config, accessToken, { dateRanges: [REPORT_DATE_RANGE], ...request });

  const [
    summary,
    dailyTrend,
    channels,
    countries,
    devices,
    landingPages,
    organicLandingPages,
    topPages,
    keyEvents,
  ] = await Promise.all([
    report({
      metrics: [
        { name: "activeUsers" },
        { name: "newUsers" },
        { name: "sessions" },
        { name: "screenPageViews" },
        { name: "averageSessionDuration" },
        { name: "engagementRate" },
      ],
    }),
    report({
      dimensions: [{ name: "date" }],
      metrics: [{ name: "activeUsers" }, { name: "screenPageViews" }],
      orderBys: [{ dimension: { dimensionName: "date" } }],
    }),
    report({
      dimensions: [{ name: "sessionDefaultChannelGroup" }],
      metrics: [{ name: "sessions" }],
      orderBys: [{ metric: { metricName: "sessions" }, desc: true }],
      limit: String(ROW_LIMIT),
    }),
    report({
      dimensions: [{ name: "country" }],
      metrics: [{ name: "activeUsers" }],
      orderBys: [{ metric: { metricName: "activeUsers" }, desc: true }],
      limit: String(ROW_LIMIT),
    }),
    report({
      dimensions: [{ name: "deviceCategory" }],
      metrics: [{ name: "activeUsers" }],
      orderBys: [{ metric: { metricName: "activeUsers" }, desc: true }],
      limit: String(ROW_LIMIT),
    }),
    report({
      dimensions: [{ name: "landingPage" }],
      metrics: [{ name: "sessions" }],
      orderBys: [{ metric: { metricName: "sessions" }, desc: true }],
      limit: String(ROW_LIMIT),
    }),
    report({
      dimensions: [{ name: "landingPage" }],
      metrics: [{ name: "sessions" }],
      dimensionFilter: {
        filter: {
          fieldName: "sessionDefaultChannelGroup",
          stringFilter: { matchType: "EXACT", value: "Organic Search" },
        },
      },
      orderBys: [{ metric: { metricName: "sessions" }, desc: true }],
      limit: String(ROW_LIMIT),
    }),
    report({
      dimensions: [{ name: "pagePath" }],
      metrics: [{ name: "screenPageViews" }],
      orderBys: [{ metric: { metricName: "screenPageViews" }, desc: true }],
      limit: String(ROW_LIMIT),
    }),
    report({
      dimensions: [{ name: "eventName" }],
      metrics: [{ name: "keyEvents" }],
      orderBys: [{ metric: { metricName: "keyEvents" }, desc: true }],
      limit: String(ROW_LIMIT),
    }),
  ]);

  const summaryRow = summary.rows?.[0];

  return {
    summary: {
      activeUsers: metricNumber(summaryRow, 0),
      newUsers: metricNumber(summaryRow, 1),
      sessions: metricNumber(summaryRow, 2),
      pageViews: metricNumber(summaryRow, 3),
      averageSessionDurationSeconds: metricNumber(summaryRow, 4),
      engagementRate: metricNumber(summaryRow, 5),
    },
    dailyTrend: (dailyTrend.rows ?? []).map((row) => ({
      date: formatGa4Date(row.dimensionValues?.[0]?.value ?? ""),
      activeUsers: metricNumber(row, 0),
      pageViews: metricNumber(row, 1),
    })),
    channels: toLabeledRows(channels),
    countries: toLabeledRows(countries),
    devices: toLabeledRows(devices),
    landingPages: toLabeledRows(landingPages),
    organicLandingPages: toLabeledRows(organicLandingPages),
    topPages: toLabeledRows(topPages),
    // Key events only appear once they are configured in the GA4 property;
    // filter zero rows so an unconfigured property reads as empty.
    keyEvents: toLabeledRows(keyEvents).filter((row) => row.value > 0),
  };
}
