"use client";

import { useCallback, useEffect, useState } from "react";
import { TrendChart } from "@/components/analytics/TrendChart";
import type { GoogleAnalyticsReports, LabeledMetricRow } from "@/lib/googleAnalyticsData";

const FUTURE_CAPABILITIES = [
  "Audience",
  "Acquisition",
  "Traffic Sources",
  "Organic Search",
  "Landing Pages",
  "Countries",
  "Devices",
  "Engagement",
  "Conversions",
];

const SETUP_STEPS = [
  "Create a Google Cloud service account and enable the Google Analytics Data API.",
  "In GA4 Admin → Property access management, add the service account email as Viewer.",
  "Set GA4_PROPERTY_ID, GA4_SERVICE_ACCOUNT_EMAIL, and GA4_SERVICE_ACCOUNT_PRIVATE_KEY in Vercel (server-side, Production).",
  "Redeploy — this tab connects automatically once the variables are present.",
];

interface GoogleAnalyticsResponse {
  connected: boolean;
  propertyId?: string;
  reports?: GoogleAnalyticsReports;
  error?: string;
  timestamp?: string;
}

function formatDurationSeconds(totalSeconds: number) {
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = Math.round(totalSeconds % 60);
  return minutes > 0 ? `${minutes}m ${seconds}s` : `${seconds}s`;
}

function ReportCard({
  title,
  description,
  children,
}: {
  title: string;
  description?: string;
  children: React.ReactNode;
}) {
  return (
    <section className="rounded-xl border border-black/5 bg-white p-5 shadow-sm sm:p-6">
      <div className="mb-5">
        <h2 className="text-xs font-medium uppercase tracking-[0.2em] text-[#CE1126]">{title}</h2>
        {description && <p className="mt-2 text-xs text-gray-500">{description}</p>}
      </div>
      {children}
    </section>
  );
}

function EmptyRow({ message }: { message: string }) {
  return <p className="py-5 text-center text-sm text-gray-500">{message}</p>;
}

function LabeledRowList({ rows }: { rows: LabeledMetricRow[] }) {
  if (rows.length === 0) return <EmptyRow message="No data for this period yet." />;
  return (
    <div className="divide-y divide-gray-100">
      {rows.map((row) => (
        <div key={row.label} className="flex items-center justify-between gap-4 py-1.5">
          <span className="min-w-0 truncate text-sm font-medium text-[#002D62]">{row.label}</span>
          <span className="shrink-0 text-sm tabular-nums text-gray-600">
            {row.value.toLocaleString()}
          </span>
        </div>
      ))}
    </div>
  );
}

function SummaryStat({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-lg border border-gray-100 bg-gray-50 px-4 py-3">
      <p className="text-[11px] font-medium uppercase tracking-[0.14em] text-gray-500">{label}</p>
      <p className="mt-1 text-xl font-bold tabular-nums text-[#002D62]">{value}</p>
    </div>
  );
}

function StatusHeader({
  connected,
  propertyId,
  action,
}: {
  connected: boolean;
  propertyId?: string;
  action?: React.ReactNode;
}) {
  return (
    <section className="rounded-xl border border-black/5 bg-white p-5 shadow-sm sm:p-6">
      <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
        <div>
          <h2 className="text-xs font-medium uppercase tracking-[0.2em] text-[#CE1126]">
            Google Analytics Integration
          </h2>
          <div className="mt-3 flex items-center gap-2">
            <span
              className={`inline-block h-2.5 w-2.5 rounded-full ${connected ? "bg-green-500" : "bg-gray-300"}`}
              aria-hidden
            />
            <span className="text-sm font-medium text-gray-700">
              {connected ? "Connected" : "Not Connected"}
            </span>
            {connected && propertyId && (
              <span className="text-xs text-gray-400">GA4 property {propertyId}</span>
            )}
          </div>
          <p className="mt-3 max-w-2xl text-sm leading-relaxed text-gray-500">
            Google Analytics focuses on marketing and audience analytics — who your visitors are,
            where they come from, and how they engage. It complements Mangulina&apos;s product
            analytics rather than replacing them.
          </p>
        </div>
        {action}
      </div>
    </section>
  );
}

export default function GoogleAnalyticsTab() {
  const [data, setData] = useState<GoogleAnalyticsResponse | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchData = useCallback(async () => {
    setIsLoading(true);
    try {
      const response = await fetch("/api/admin/analytics/google");
      const payload = (await response.json()) as GoogleAnalyticsResponse;
      if (!response.ok) {
        throw new Error(payload.error ?? "Failed to fetch Google Analytics reports");
      }
      setData(payload);
      setError(null);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Unknown error");
    } finally {
      setIsLoading(false);
    }
  }, []);

  // Initial load — Radix mounts this tab's content only when it is opened.
  useEffect(() => {
    // eslint-disable-next-line react-hooks/set-state-in-effect -- This starts the initial remote data load.
    void fetchData();
  }, [fetchData]);

  if (isLoading && !data) {
    return (
      <div className="space-y-6">
        {[...Array(3)].map((_, i) => (
          <div key={i} className="rounded-xl border border-black/5 bg-white p-5 shadow-sm sm:p-6">
            <div className="mb-5 h-4 w-32 animate-pulse rounded bg-gray-200" />
            <div className="space-y-3">
              {[...Array(3)].map((_, j) => (
                <div key={j} className="h-3 animate-pulse rounded bg-gray-100" />
              ))}
            </div>
          </div>
        ))}
      </div>
    );
  }

  if (error) {
    return (
      <div className="space-y-6">
        <StatusHeader
          connected
          action={
            <button
              type="button"
              onClick={() => void fetchData()}
              className="inline-flex shrink-0 items-center gap-2 rounded-lg bg-[#CE1126] px-5 py-2.5 text-xs font-semibold uppercase tracking-[0.16em] text-white shadow-sm transition hover:bg-[#8B0000]"
            >
              Retry
            </button>
          }
        />
        <div className="rounded-xl border border-[#CE1126]/20 bg-white px-6 py-8 text-center">
          <p className="text-sm text-[#8B0000]">Failed to load Google Analytics: {error}</p>
        </div>
      </div>
    );
  }

  if (!data?.connected) {
    return (
      <div className="space-y-6">
        <StatusHeader
          connected={false}
          action={
            <button
              type="button"
              disabled
              title="Configure the GA4 service-account environment variables to connect"
              className="inline-flex shrink-0 cursor-not-allowed items-center gap-2 rounded-lg border border-gray-200 bg-white px-5 py-2.5 text-xs font-semibold uppercase tracking-[0.16em] text-gray-400 shadow-sm"
            >
              Connect Google Analytics
            </button>
          }
        />

        <section className="rounded-xl border border-black/5 bg-white p-5 shadow-sm sm:p-6">
          <h2 className="mb-4 text-xs font-medium uppercase tracking-[0.2em] text-[#CE1126]">
            Setup Required
          </h2>
          <p className="mb-4 text-xs text-gray-500">
            This tab connects through a Google Cloud service account — no interactive sign-in.
          </p>
          <ol className="list-decimal space-y-2 pl-5">
            {SETUP_STEPS.map((step) => (
              <li key={step} className="text-sm leading-relaxed text-gray-600">
                {step}
              </li>
            ))}
          </ol>
        </section>

        <section className="rounded-xl border border-black/5 bg-white p-5 shadow-sm sm:p-6">
          <h2 className="mb-4 text-xs font-medium uppercase tracking-[0.2em] text-[#CE1126]">
            Coming with GA4
          </h2>
          <p className="mb-4 text-xs text-gray-500">
            Once connected, this tab will surface GA4 reports:
          </p>
          <div className="grid grid-cols-2 gap-x-6 gap-y-2 sm:grid-cols-3">
            {FUTURE_CAPABILITIES.map((cap) => (
              <div key={cap} className="flex items-center gap-2 py-1">
                <span className="inline-block h-1.5 w-1.5 rounded-full bg-gray-300" aria-hidden />
                <span className="text-sm text-gray-600">{cap}</span>
              </div>
            ))}
          </div>
        </section>
      </div>
    );
  }

  const reports = data.reports;
  if (!reports) return null;

  return (
    <div className="space-y-6">
      <StatusHeader
        connected
        propertyId={data.propertyId}
        action={
          <button
            type="button"
            onClick={() => void fetchData()}
            disabled={isLoading}
            className="inline-flex shrink-0 items-center gap-2 rounded-lg border border-gray-200 bg-white px-5 py-2.5 text-xs font-semibold uppercase tracking-[0.16em] text-gray-600 shadow-sm transition hover:border-[#CE1126] hover:text-[#CE1126] disabled:cursor-not-allowed disabled:opacity-50"
          >
            {isLoading ? "Refreshing…" : "Refresh"}
          </button>
        }
      />

      <ReportCard title="Audience" description="Last 28 days.">
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
          <SummaryStat label="Active Users" value={reports.summary.activeUsers.toLocaleString()} />
          <SummaryStat label="New Users" value={reports.summary.newUsers.toLocaleString()} />
          <SummaryStat label="Sessions" value={reports.summary.sessions.toLocaleString()} />
          <SummaryStat label="Page Views" value={reports.summary.pageViews.toLocaleString()} />
          <SummaryStat
            label="Avg. Session"
            value={formatDurationSeconds(reports.summary.averageSessionDurationSeconds)}
          />
          <SummaryStat
            label="Engagement Rate"
            value={`${Math.round(reports.summary.engagementRate * 100)}%`}
          />
        </div>
      </ReportCard>

      <div className="grid gap-6 lg:grid-cols-2">
        <ReportCard title="Engagement" description="Active users per day, last 28 days.">
          <TrendChart
            title="Active users per day"
            data={reports.dailyTrend.map((row) => ({ date: row.date, views: row.activeUsers }))}
            color="blue"
          />
        </ReportCard>

        <ReportCard title="Acquisition · Traffic Sources" description="Sessions by channel group.">
          <LabeledRowList rows={reports.channels} />
        </ReportCard>

        <ReportCard title="Landing Pages" description="Sessions by entry page.">
          <LabeledRowList rows={reports.landingPages} />
        </ReportCard>

        <ReportCard title="Organic Search" description="Organic-search sessions by landing page.">
          <LabeledRowList rows={reports.organicLandingPages} />
        </ReportCard>

        <ReportCard title="Countries" description="Active users by country.">
          <LabeledRowList rows={reports.countries} />
        </ReportCard>

        <ReportCard title="Devices" description="Active users by device category.">
          <LabeledRowList rows={reports.devices} />
        </ReportCard>

        <ReportCard title="Top Pages" description="Page views by path.">
          <LabeledRowList rows={reports.topPages} />
        </ReportCard>

        <ReportCard
          title="Conversions"
          description="Key events (configure key events in GA4 to populate)."
        >
          <LabeledRowList rows={reports.keyEvents} />
        </ReportCard>
      </div>
    </div>
  );
}
