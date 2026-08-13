import "dotenv/config";
import { writeFile } from "node:fs/promises";
import path from "node:path";
import pg from "pg";
import { createClient, type SupabaseClient } from "@supabase/supabase-js";

const COVER_BUCKET = "cover-art";
const COVER_PREFIX = "150px";
const STORAGE_PAGE_SIZE = 1_000;
const SAMPLE_LIMIT = Number.parseInt(process.env.AUDIT_SAMPLE_LIMIT ?? "25", 10);
const REPORT_PATH = path.join("scripts", "audit-database-health-report.json");
const MISSING_COVERS_CSV_PATH = path.join("scripts", "audit-missing-covers.csv");
const RELATIONAL_ISSUES_CSV_PATH = path.join("scripts", "audit-relational-issues.csv");

type ColumnMap = Map<string, Set<string>>;

type AuditIssue = {
  key: string;
  label: string;
  count: number;
  sampleIds: string[];
  skipped?: boolean;
  reason?: string;
};

type Release = {
  id: string;
  title: string | null;
};

type CoverAudit = {
  bucket: string;
  prefix: string;
  expectedPathPattern: string;
  releaseCount: number;
  fileCount: number;
  matchingReleaseCount: number;
  missingReleaseCount: number;
  orphanFileCount: number;
  sampleMissingCoverReleases: Release[];
  sampleOrphanCoverFiles: string[];
};

type Report = {
  generatedAt: string;
  safety: {
    mode: "read-only";
    databaseOperations: string[];
    storageOperations: string[];
    usedServiceRoleKey: boolean;
  };
  schemaAssumptions: {
    presentTables: string[];
    skippedAudits: Array<{ key: string; reason: string }>;
  };
  relationalIssues: AuditIssue[];
  coverArt: CoverAudit;
};

const REQUIRED_TABLES = [
  "artists",
  "recordings",
  "recording_credits",
  "tracks",
  "releases",
  "release_groups",
  "mediums",
  "works",
  "work_credits",
];

function requireEnv(name: string, fallback?: string): string {
  const value = process.env[name] ?? (fallback ? process.env[fallback] : undefined);
  if (!value) {
    throw new Error(`Missing ${name}${fallback ? ` or ${fallback}` : ""} in environment.`);
  }
  return value;
}

function hasTable(columns: ColumnMap, table: string): boolean {
  return columns.has(table);
}

function hasColumn(columns: ColumnMap, table: string, column: string): boolean {
  return columns.get(table)?.has(column) ?? false;
}

function missingDependencyReason(columns: ColumnMap, dependencies: Array<[string, string?]>): string | null {
  const missing = dependencies
    .filter(([table, column]) => !hasTable(columns, table) || (column ? !hasColumn(columns, table, column) : false))
    .map(([table, column]) => (column ? `${table}.${column}` : table));

  return missing.length > 0 ? `Missing schema dependency: ${missing.join(", ")}` : null;
}

async function loadSchema(client: pg.Client): Promise<ColumnMap> {
  const result = await client.query<{
    table_name: string;
    column_name: string;
  }>(
    `
      select table_name, column_name
      from information_schema.columns
      where table_schema = 'public'
        and table_name = any($1)
      order by table_name, ordinal_position
    `,
    [REQUIRED_TABLES],
  );

  const columns: ColumnMap = new Map();
  for (const row of result.rows) {
    if (!columns.has(row.table_name)) {
      columns.set(row.table_name, new Set());
    }
    columns.get(row.table_name)?.add(row.column_name);
  }

  return columns;
}

async function countFromSql(client: pg.Client, sql: string): Promise<number> {
  const result = await client.query<{ count: string }>(sql);
  return Number(result.rows[0]?.count ?? 0);
}

async function sampleIdsFromSql(client: pg.Client, sql: string): Promise<string[]> {
  const result = await client.query<{ id: string }>(sql, [SAMPLE_LIMIT]);
  return result.rows.map((row) => row.id);
}

async function runIssue(
  client: pg.Client,
  columns: ColumnMap,
  issue: {
    key: string;
    label: string;
    dependencies: Array<[string, string?]>;
    countSql: string;
    sampleSql: string;
  },
): Promise<AuditIssue> {
  const reason = missingDependencyReason(columns, issue.dependencies);
  if (reason) {
    return {
      key: issue.key,
      label: issue.label,
      count: 0,
      sampleIds: [],
      skipped: true,
      reason,
    };
  }

  const count = await countFromSql(client, issue.countSql);
  const sampleIds = await sampleIdsFromSql(client, issue.sampleSql);

  return {
    key: issue.key,
    label: issue.label,
    count,
    sampleIds,
  };
}

async function fetchAllReleases(client: pg.Client, columns: ColumnMap): Promise<Release[]> {
  const reason = missingDependencyReason(columns, [["releases", "id"]]);
  if (reason) {
    throw new Error(reason);
  }

  const titleColumn = hasColumn(columns, "releases", "title") ? "title" : "null as title";
  const result = await client.query<Release>(`
    select id, ${titleColumn}
    from public.releases
    order by id
  `);

  return result.rows;
}

function isStorageFolder(item: { id?: string | null; metadata?: unknown; name: string }): boolean {
  return !item.id && !item.metadata && !item.name.includes(".");
}

async function listStorageFiles(
  supabase: SupabaseClient,
  bucket: string,
  prefix = "",
): Promise<string[]> {
  const files: string[] = [];
  let offset = 0;

  while (true) {
    const { data, error } = await supabase.storage.from(bucket).list(prefix, {
      limit: STORAGE_PAGE_SIZE,
      offset,
      sortBy: { column: "name", order: "asc" },
    });

    if (error) {
      throw new Error(`Storage list failed for ${bucket}/${prefix}: ${error.message}`);
    }

    const page = data ?? [];
    for (const item of page) {
      const fullPath = prefix ? `${prefix}/${item.name}` : item.name;
      if (isStorageFolder(item)) {
        files.push(...await listStorageFiles(supabase, bucket, fullPath));
      } else {
        files.push(fullPath);
      }
    }

    if (page.length < STORAGE_PAGE_SIZE) {
      break;
    }
    offset += STORAGE_PAGE_SIZE;
  }

  return files;
}

function auditCoverArt(releases: Release[], storageFiles: string[]): CoverAudit {
  const releaseIds = new Set(releases.map((release) => release.id));
  const storageFileSet = new Set(storageFiles);
  const expectedPath = (releaseId: string) => `${COVER_PREFIX}/${releaseId}.webp`;
  const missing = releases.filter((release) => !storageFileSet.has(expectedPath(release.id)));
  const orphanFiles = storageFiles.filter((file) => {
    if (!file.endsWith(".webp")) return true;
    const rootFileName = file.includes("/") ? file.slice(file.lastIndexOf("/") + 1) : file;
    const releaseId = rootFileName.replace(/\.webp$/i, "");
    return file !== expectedPath(releaseId) || !releaseIds.has(releaseId);
  });

  return {
    bucket: COVER_BUCKET,
    prefix: COVER_PREFIX,
    expectedPathPattern: "150px/{release.id}.webp",
    releaseCount: releases.length,
    fileCount: storageFiles.length,
    matchingReleaseCount: releases.length - missing.length,
    missingReleaseCount: missing.length,
    orphanFileCount: orphanFiles.length,
    sampleMissingCoverReleases: missing.slice(0, SAMPLE_LIMIT),
    sampleOrphanCoverFiles: orphanFiles.slice(0, SAMPLE_LIMIT),
  };
}

function csvEscape(value: unknown): string {
  const text = value == null ? "" : String(value);
  return /[",\r\n]/.test(text) ? `"${text.replace(/"/g, '""')}"` : text;
}

function toCsv(headers: string[], rows: unknown[][]): string {
  return [
    headers.map(csvEscape).join(","),
    ...rows.map((row) => row.map(csvEscape).join(",")),
  ].join("\n") + "\n";
}

function printSummary(relationalIssues: AuditIssue[], coverArt: CoverAudit): void {
  console.log("\nRelational health summary");
  console.table(
    relationalIssues.map((issue) => ({
      issue: issue.key,
      count: issue.skipped ? "skipped" : issue.count,
      note: issue.reason ?? "",
    })),
  );

  console.log("\nCover art summary");
  console.table([
    { metric: "releaseCount", count: coverArt.releaseCount },
    { metric: "fileCount", count: coverArt.fileCount },
    { metric: "matchingReleaseCount", count: coverArt.matchingReleaseCount },
    { metric: "missingReleaseCount", count: coverArt.missingReleaseCount },
    { metric: "orphanFileCount", count: coverArt.orphanFileCount },
  ]);
}

async function main(): Promise<void> {
  const supabaseUrl = requireEnv("SUPABASE_URL", "NEXT_PUBLIC_SUPABASE_URL");
  const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const databaseUrl = requireEnv("DATABASE_URL");

  if (!supabaseKey) {
    throw new Error("Missing SUPABASE_SERVICE_ROLE_KEY for the Storage integrity audit.");
  }

  const db = new pg.Client({ connectionString: databaseUrl });
  const supabase = createClient(supabaseUrl, supabaseKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });

  await db.connect();

  try {
    const columns = await loadSchema(db);
    const issues = [
      {
        key: "recordings_without_tracks",
        label: "recordings without tracks",
        dependencies: [["recordings", "id"], ["tracks", "recording_id"]],
        countSql: `
          select count(*) from public.recordings r
          where not exists (select 1 from public.tracks t where t.recording_id = r.id)
        `,
        sampleSql: `
          select r.id from public.recordings r
          where not exists (select 1 from public.tracks t where t.recording_id = r.id)
          order by r.id limit $1
        `,
      },
      {
        key: "recordings_without_recording_credits",
        label: "recordings without recording_credits",
        dependencies: [["recordings", "id"], ["recording_credits", "recording_id"]],
        countSql: `
          select count(*) from public.recordings r
          where not exists (select 1 from public.recording_credits rc where rc.recording_id = r.id)
        `,
        sampleSql: `
          select r.id from public.recordings r
          where not exists (select 1 from public.recording_credits rc where rc.recording_id = r.id)
          order by r.id limit $1
        `,
      },
      {
        key: "recordings_with_missing_work",
        label: "recordings with work_id pointing to missing work",
        dependencies: [["recordings", "id"], ["recordings", "work_id"], ["works", "id"]],
        countSql: `
          select count(*) from public.recordings r
          left join public.works w on w.id = r.work_id
          where r.work_id is not null and w.id is null
        `,
        sampleSql: `
          select r.id from public.recordings r
          left join public.works w on w.id = r.work_id
          where r.work_id is not null and w.id is null
          order by r.id limit $1
        `,
      },
      {
        key: "recordings_with_missing_release",
        label: "recordings with release_id pointing to missing release",
        dependencies: [["recordings", "id"], ["recordings", "release_id"], ["releases", "id"]],
        countSql: `
          select count(*) from public.recordings r
          left join public.releases rel on rel.id = r.release_id
          where r.release_id is not null and rel.id is null
        `,
        sampleSql: `
          select r.id from public.recordings r
          left join public.releases rel on rel.id = r.release_id
          where r.release_id is not null and rel.id is null
          order by r.id limit $1
        `,
      },
      {
        key: "tracks_without_recording",
        label: "tracks without recording",
        dependencies: [["tracks", "id"], ["tracks", "recording_id"], ["recordings", "id"]],
        countSql: `
          select count(*) from public.tracks t
          left join public.recordings r on r.id = t.recording_id
          where t.recording_id is null or r.id is null
        `,
        sampleSql: `
          select t.id from public.tracks t
          left join public.recordings r on r.id = t.recording_id
          where t.recording_id is null or r.id is null
          order by t.id limit $1
        `,
      },
      {
        key: "tracks_without_release",
        label: "tracks without release",
        dependencies: [["tracks", "id"], ["tracks", "release_id"], ["releases", "id"]],
        countSql: `
          select count(*) from public.tracks t
          left join public.releases r on r.id = t.release_id
          where t.release_id is null or r.id is null
        `,
        sampleSql: `
          select t.id from public.tracks t
          left join public.releases r on r.id = t.release_id
          where t.release_id is null or r.id is null
          order by t.id limit $1
        `,
      },
      {
        key: "tracks_without_expected_medium",
        label: "tracks without medium when medium_id is expected/present logic allows",
        dependencies: [["tracks", "id"], ["tracks", "medium_id"], ["mediums", "id"]],
        countSql: `
          select count(*) from public.tracks t
          left join public.mediums m on m.id = t.medium_id
          where t.medium_id is null or m.id is null
        `,
        sampleSql: `
          select t.id from public.tracks t
          left join public.mediums m on m.id = t.medium_id
          where t.medium_id is null or m.id is null
          order by t.id limit $1
        `,
      },
      {
        key: "releases_without_tracks",
        label: "releases without tracks",
        dependencies: [["releases", "id"], ["tracks", "release_id"]],
        countSql: `
          select count(*) from public.releases r
          where not exists (select 1 from public.tracks t where t.release_id = r.id)
        `,
        sampleSql: `
          select r.id from public.releases r
          where not exists (select 1 from public.tracks t where t.release_id = r.id)
          order by r.id limit $1
        `,
      },
      {
        key: "releases_without_release_group",
        label: "releases without release_group",
        dependencies: [["releases", "id"], ["releases", "release_group_id"]],
        countSql: "select count(*) from public.releases where release_group_id is null",
        sampleSql: "select id from public.releases where release_group_id is null order by id limit $1",
      },
      {
        key: "releases_with_missing_release_group",
        label: "releases with release_group_id pointing to missing release_group",
        dependencies: [["releases", "id"], ["releases", "release_group_id"], ["release_groups", "id"]],
        countSql: `
          select count(*) from public.releases r
          left join public.release_groups rg on rg.id = r.release_group_id
          where r.release_group_id is not null and rg.id is null
        `,
        sampleSql: `
          select r.id from public.releases r
          left join public.release_groups rg on rg.id = r.release_group_id
          where r.release_group_id is not null and rg.id is null
          order by r.id limit $1
        `,
      },
      {
        key: "releases_without_release_artist",
        label: "releases without release_artist_id",
        dependencies: [["releases", "id"], ["releases", "release_artist_id"]],
        countSql: "select count(*) from public.releases where release_artist_id is null",
        sampleSql: "select id from public.releases where release_artist_id is null order by id limit $1",
      },
      {
        key: "release_groups_without_releases",
        label: "release_groups without releases",
        dependencies: [["release_groups", "id"], ["releases", "release_group_id"]],
        countSql: `
          select count(*) from public.release_groups rg
          where not exists (select 1 from public.releases r where r.release_group_id = rg.id)
        `,
        sampleSql: `
          select rg.id from public.release_groups rg
          where not exists (select 1 from public.releases r where r.release_group_id = rg.id)
          order by rg.id limit $1
        `,
      },
      {
        key: "mediums_without_releases",
        label: "mediums without releases",
        dependencies: [["mediums", "id"], ["mediums", "release_id"], ["releases", "id"]],
        countSql: `
          select count(*) from public.mediums m
          left join public.releases r on r.id = m.release_id
          where m.release_id is null or r.id is null
        `,
        sampleSql: `
          select m.id from public.mediums m
          left join public.releases r on r.id = m.release_id
          where m.release_id is null or r.id is null
          order by m.id limit $1
        `,
      },
      {
        key: "artists_without_recordings_releases_or_credits",
        label: "artists without recordings/releases/credits",
        dependencies: [
          ["artists", "id"],
          ["recordings", "artist_id"],
          ["releases", "release_artist_id"],
          ["recording_credits", "artist_id"],
          ["work_credits", "artist_id"],
        ],
        countSql: `
          select count(*) from public.artists a
          where not exists (select 1 from public.recordings r where r.artist_id = a.id)
            and not exists (select 1 from public.releases rel where rel.release_artist_id = a.id)
            and not exists (select 1 from public.recording_credits rc where rc.artist_id = a.id)
            and not exists (select 1 from public.work_credits wc where wc.artist_id = a.id)
        `,
        sampleSql: `
          select a.id from public.artists a
          where not exists (select 1 from public.recordings r where r.artist_id = a.id)
            and not exists (select 1 from public.releases rel where rel.release_artist_id = a.id)
            and not exists (select 1 from public.recording_credits rc where rc.artist_id = a.id)
            and not exists (select 1 from public.work_credits wc where wc.artist_id = a.id)
          order by a.id limit $1
        `,
      },
      {
        key: "works_without_recordings",
        label: "works without recordings",
        dependencies: [["works", "id"], ["recordings", "work_id"]],
        countSql: `
          select count(*) from public.works w
          where not exists (select 1 from public.recordings r where r.work_id = w.id)
        `,
        sampleSql: `
          select w.id from public.works w
          where not exists (select 1 from public.recordings r where r.work_id = w.id)
          order by w.id limit $1
        `,
      },
      {
        key: "works_without_work_credits",
        label: "works without work_credits",
        dependencies: [["works", "id"], ["work_credits", "work_id"]],
        countSql: `
          select count(*) from public.works w
          where not exists (select 1 from public.work_credits wc where wc.work_id = w.id)
        `,
        sampleSql: `
          select w.id from public.works w
          where not exists (select 1 from public.work_credits wc where wc.work_id = w.id)
          order by w.id limit $1
        `,
      },
    ];

    const relationalIssues: AuditIssue[] = [];
    for (const issue of issues) {
      relationalIssues.push(await runIssue(db, columns, issue));
    }

    const releases = await fetchAllReleases(db, columns);
    const storageFiles = await listStorageFiles(supabase, COVER_BUCKET, COVER_PREFIX);
    const coverArt = auditCoverArt(releases, storageFiles);
    const skippedAudits = relationalIssues
      .filter((issue) => issue.skipped)
      .map((issue) => ({ key: issue.key, reason: issue.reason ?? "Unknown reason" }));

    const report: Report = {
      generatedAt: new Date().toISOString(),
      safety: {
        mode: "read-only",
        databaseOperations: ["select", "information_schema read"],
        storageOperations: ["list"],
        usedServiceRoleKey: Boolean(process.env.SUPABASE_SERVICE_ROLE_KEY),
      },
      schemaAssumptions: {
        presentTables: [...columns.keys()].sort(),
        skippedAudits,
      },
      relationalIssues,
      coverArt,
    };

    await writeFile(REPORT_PATH, JSON.stringify(report, null, 2) + "\n", "utf8");
    await writeFile(
      MISSING_COVERS_CSV_PATH,
      toCsv(
        ["release_id", "title", "expected_cover_path"],
        releases
          .filter((release) => !storageFiles.includes(`${COVER_PREFIX}/${release.id}.webp`))
          .map((release) => [release.id, release.title, `${COVER_PREFIX}/${release.id}.webp`]),
      ),
      "utf8",
    );
    await writeFile(
      RELATIONAL_ISSUES_CSV_PATH,
      toCsv(
        ["issue_key", "label", "count", "skipped", "reason", "sample_ids"],
        relationalIssues.map((issue) => [
          issue.key,
          issue.label,
          issue.count,
          issue.skipped ? "true" : "false",
          issue.reason ?? "",
          issue.sampleIds.join(" "),
        ]),
      ),
      "utf8",
    );

    printSummary(relationalIssues, coverArt);
    console.log(`\nWrote ${REPORT_PATH}`);
    console.log(`Wrote ${MISSING_COVERS_CSV_PATH}`);
    console.log(`Wrote ${RELATIONAL_ISSUES_CSV_PATH}`);
  } finally {
    await db.end();
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
