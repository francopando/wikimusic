import "dotenv/config";
import { createHash } from "node:crypto";
import { mkdir, writeFile } from "node:fs/promises";
import { resolve } from "node:path";
import pg from "pg";
import { editorialDocumentToPlainText, plainTextToEditorialDocument } from "../../src/lib/editorial/plainText";
import { validateEditorialDocument } from "../../src/lib/editorial/validate";

type Locale = "en" | "es";
type ArtistRow = { id: string; name: string; slug: string; bio: string | null; bio_en: string | null; bio_es: string | null };
type ExistingRow = { id: string; owner_artist_id: string; locale: Locale; status: "draft" | "published"; revision: number; schema_version: number; document: unknown };
type AuditRow = {
  artistId: string; artistName: string; slug: string; locale: Locale; sourceColumn: "bio_en" | "bio_es";
  sourceHash: string; documentHash: string; derivedHash: string; result: string; documentId?: string;
  normalizationChanged: boolean; error?: string;
};

const mode = process.argv[2] ?? "dry-run";
const connectionString = process.env.DATABASE_URL;
if (!connectionString) throw new Error("DATABASE_URL is required.");
const client = new pg.Client({ connectionString, ssl: { rejectUnauthorized: false } });
const reportDirectory = resolve("docs/reports/editorial");
const batchSize = 50;

function sha256(value: string) { return createHash("sha256").update(value, "utf8").digest("hex"); }
function stableDocumentJson(value: unknown) { return JSON.stringify(value); }
function isPopulated(value: string | null) { return Boolean(value && value.trim()); }

function analyzeSource(artist: ArtistRow, locale: Locale, existing: ExistingRow | undefined): AuditRow {
  const sourceColumn = locale === "en" ? "bio_en" : "bio_es";
  const source = artist[sourceColumn];
  const base = { artistId: artist.id, artistName: artist.name, slug: artist.slug, locale, sourceColumn } as const;
  if (!isPopulated(source)) return { ...base, sourceHash: sha256(source ?? ""), documentHash: "", derivedHash: "", result: "skipped_empty", normalizationChanged: false };
  if (existing) return { ...base, sourceHash: sha256(source!), documentHash: sha256(stableDocumentJson(existing.document)), derivedHash: "", result: existing.status === "draft" ? "conflict_existing_draft" : "skipped_existing", documentId: existing.id, normalizationChanged: false };
  try {
    const document = plainTextToEditorialDocument(source!);
    const validation = validateEditorialDocument(1, document);
    if (!validation.ok) return { ...base, sourceHash: sha256(source!), documentHash: sha256(stableDocumentJson(document)), derivedHash: "", result: "invalid", normalizationChanged: false, error: validation.issues.map((issue) => `${issue.path}: ${issue.message}`).join("; ") };
    const derived = editorialDocumentToPlainText(document);
    const expectedNormalized = source!.replace(/\r\n?/g, "\n").split(/\n{2,}/).join("\n\n");
    const matches = derived === expectedNormalized;
    return { ...base, sourceHash: sha256(expectedNormalized), documentHash: sha256(stableDocumentJson(document)), derivedHash: sha256(derived), result: matches ? "ready" : "mismatch", normalizationChanged: source !== derived, error: matches ? undefined : "Derived plain text differs from documented normalization." };
  } catch (error) {
    return { ...base, sourceHash: sha256(source!), documentHash: "", derivedHash: "", result: "invalid", normalizationChanged: false, error: error instanceof Error ? error.message : String(error) };
  }
}

async function loadState(includeRemovedBio = true) {
  const artistColumns = includeRemovedBio ? "id,name,slug,bio,bio_en,bio_es" : "id,name,slug,null::text as bio,bio_en,bio_es";
  const artists = (await client.query<ArtistRow>(`select ${artistColumns} from public.artists order by id`)).rows;
  const existing = (await client.query<ExistingRow>("select id,owner_artist_id,locale,status,revision,schema_version,document from public.editorial_documents where document_type='artist_biography' order by owner_artist_id,locale")).rows;
  const byKey = new Map(existing.map((row) => [`${row.owner_artist_id}:${row.locale}`, row]));
  return { artists, existing, byKey };
}

function summarize(rows: AuditRow[]) {
  const byLocale = Object.fromEntries((["en", "es"] as const).map((locale) => {
    const localeRows = rows.filter((row) => row.locale === locale);
    const results: Record<string, number> = {};
    for (const row of localeRows) results[row.result] = (results[row.result] ?? 0) + 1;
    return [locale, { eligible: localeRows.filter((row) => row.result !== "skipped_empty").length, normalizationChanged: localeRows.filter((row) => row.normalizationChanged).length, ...results }];
  }));
  return { batchSize, byLocale };
}

async function writeReport(name: string, title: string, rows: AuditRow[], extra: string[] = []) {
  await mkdir(reportDirectory, { recursive: true });
  const summary = summarize(rows);
  const exceptions = rows.filter((row) => !["ready", "migrated", "skipped_empty", "skipped_existing"].includes(row.result));
  const lines = [`# ${title}`, "", `Generated: ${new Date().toISOString()}`, "", `Batch size: ${batchSize}`, "", "## Summary", "", "```json", JSON.stringify(summary, null, 2), "```", "", ...extra, "## Exceptions and skips", "", "| Artist UUID | Slug | Locale | Result | Source SHA-256 | Document SHA-256 | Derived SHA-256 | Detail |", "|---|---|---|---|---|---|---|---|", ...exceptions.map((row) => `| ${row.artistId} | ${row.slug} | ${row.locale} | ${row.result} | ${row.sourceHash} | ${row.documentHash} | ${row.derivedHash} | ${(row.error ?? "").replaceAll("|", "\\|")} |`), ""];
  await writeFile(resolve(reportDirectory, name), lines.join("\n"), "utf8");
}

async function dryRun() {
  const { artists, byKey } = await loadState();
  const rows = artists.flatMap((artist) => (["en", "es"] as const).map((locale) => analyzeSource(artist, locale, byKey.get(`${artist.id}:${locale}`))));
  const differing = artists.filter((artist) => isPopulated(artist.bio) && isPopulated(artist.bio_en) && artist.bio !== artist.bio_en);
  const bioOnly = artists.filter((artist) => isPopulated(artist.bio) && !isPopulated(artist.bio_en));
  const extra = ["## Legacy consolidation", "", `- Eligible bio → bio_en copies: ${bioOnly.length}`, `- Differing populated bio/bio_en variants: ${differing.length}`, `- Both bio and bio_en empty: ${artists.filter((a) => !isPopulated(a.bio) && !isPopulated(a.bio_en)).length}`, "", "## Discarded non-authoritative bio variants", "", "| Artist UUID | Name | Slug | bio SHA-256 | bio_en SHA-256 | Result |", "|---|---|---|---|---|---|", ...differing.map((artist) => `| ${artist.id} | ${artist.name.replaceAll("|", "\\|")} | ${artist.slug} | ${sha256(artist.bio!)} | ${sha256(artist.bio_en!)} | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |`), ""];
  await writeReport("artist-biography-migration-dry-run.md", "Artist Biography Migration Dry Run", rows, extra);
  console.log(JSON.stringify({ summary: summarize(rows), bioOnly: bioOnly.length, differing: differing.length, blocking: rows.filter((row) => ["mismatch", "invalid", "conflict_existing_draft"].includes(row.result)).length }, null, 2));
}

async function migrate() {
  await client.query("BEGIN");
  try {
    const consolidation = await client.query("update public.artists set bio_en=bio where (bio_en is null or btrim(bio_en)='') and bio is not null and btrim(bio)<>'' returning id");
    const remaining = await client.query("select count(*)::integer as count from public.artists where bio is not null and btrim(bio)<>'' and (bio_en is null or btrim(bio_en)='')");
    if (remaining.rows[0].count !== 0) throw new Error("Populated bio remains without bio_en after consolidation.");
    const { artists, byKey } = await loadState();
    const audit = artists.flatMap((artist) => (["en", "es"] as const).map((locale) => analyzeSource(artist, locale, byKey.get(`${artist.id}:${locale}`))));
    const blocking = audit.filter((row) => ["mismatch", "invalid", "conflict_existing_draft"].includes(row.result));
    if (blocking.length) throw new Error(`Migration blocked by ${blocking.length} conversion or existing-document findings.`);
    const ready = audit.filter((row) => row.result === "ready");
    for (let offset = 0; offset < ready.length; offset += batchSize) {
      for (const row of ready.slice(offset, offset + batchSize)) {
        const artist = artists.find((candidate) => candidate.id === row.artistId)!;
        const document = plainTextToEditorialDocument(artist[row.sourceColumn]!);
        const saved = await client.query("select * from public.upsert_editorial_document($1,$2,$3,$4,$5,$6::jsonb,$7)", ["artist_biography", row.artistId, row.locale, 1, "published", JSON.stringify(document), 0]);
        row.result = "migrated"; row.documentId = saved.rows[0]?.id;
      }
    }
    await client.query("COMMIT");
    const differing = artists.filter((artist) => isPopulated(artist.bio) && isPopulated(artist.bio_en) && artist.bio !== artist.bio_en);
    const extra = ["## Consolidation", "", `- Rows copied bio → bio_en: ${consolidation.rowCount ?? 0}`, `- Nonempty bio_en overwritten: 0`, `- Remaining populated bio with empty bio_en: 0`, "", "## Discarded non-authoritative bio variants", "", "| Artist UUID | Name | Slug | bio SHA-256 | bio_en SHA-256 | Result |", "|---|---|---|---|---|---|", ...differing.map((artist) => `| ${artist.id} | ${artist.name.replaceAll("|", "\\|")} | ${artist.slug} | ${sha256(artist.bio!)} | ${sha256(artist.bio_en!)} | discarded_non_authoritative_bio_variant; bio_en preserved and migrated |`), ""];
    await writeReport("artist-biography-migration-result.md", "Artist Biography Migration Result", audit, extra);
    console.log(JSON.stringify({ copied: consolidation.rowCount ?? 0, summary: summarize(audit) }, null, 2));
  } catch (error) { await client.query("ROLLBACK"); throw error; }
}

async function verify() {
  const { artists, existing } = await loadState(false);
  const artistById = new Map(artists.map((artist) => [artist.id, artist]));
  const findings: Array<{ severity: string; code: string; documentId?: string; artistId?: string; locale?: string }> = [];
  for (const document of existing) {
    const artist = artistById.get(document.owner_artist_id); const source = artist?.[document.locale === "en" ? "bio_en" : "bio_es"];
    const validation = validateEditorialDocument(document.schema_version, document.document);
    if (!validation.ok) findings.push({ severity: "blocking", code: "invalid_document", documentId: document.id });
    if (!artist) findings.push({ severity: "blocking", code: "missing_owner", documentId: document.id });
    if (document.status === "published" && source && editorialDocumentToPlainText(document.document) !== source.replace(/\r\n?/g, "\n").split(/\n{2,}/).join("\n\n")) findings.push({ severity: "blocking", code: "legacy_mismatch", documentId: document.id, artistId: artist?.id, locale: document.locale });
    if (document.status === "published" && isPopulated(source) && editorialDocumentToPlainText(document.document).length === 0) findings.push({ severity: "blocking", code: "published_empty_conflict", documentId: document.id });
  }
  for (const artist of artists) for (const locale of ["en", "es"] as const) if (isPopulated(artist[locale === "en" ? "bio_en" : "bio_es"]) && !existing.some((d) => d.owner_artist_id === artist.id && d.locale === locale)) findings.push({ severity: "blocking", code: "missing_structured", artistId: artist.id, locale });
  const references = await client.query("select count(*)::integer as count from public.editorial_entity_references");
  if (references.rows[0].count !== 0) findings.push({ severity: "blocking", code: "unexpected_migration_references" });
  console.log(JSON.stringify({ documents: existing.length, references: references.rows[0].count, blocking: findings.filter((f) => f.severity === "blocking").length, findings }, null, 2));
  if (findings.some((finding) => finding.severity === "blocking")) process.exitCode = 2;
}

await client.connect();
try {
  if (mode === "dry-run") await dryRun(); else if (mode === "migrate") await migrate(); else if (mode === "verify") await verify(); else throw new Error("Use dry-run | migrate | verify");
} finally { await client.end(); }
