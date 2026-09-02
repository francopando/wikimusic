import "dotenv/config";

import { SITE_URL } from "../src/lib/seo";
import {
  MAX_SLUGS_PER_ENTITY,
  REVALIDATION_TARGETS,
  type RevalidationTarget,
} from "../src/lib/revalidationRequest";

/**
 * Refreshes public profiles after an editorial pass that wrote straight to
 * Postgres.
 *
 * Admin saves revalidate what they touch. Direct database work does not — no
 * Next.js code runs, so profiles keep serving cached copies until their 30-day
 * fallback TTL expires. Run this at the end of such a pass and name what
 * changed.
 *
 *   npm run revalidate -- --all-artists
 *   npm run revalidate -- --songs ojala-que-llueva-cafe,bachata-rosa
 *   npm run revalidate -- --artists juan-luis-guerra --releases bachata-rosa
 *   cat slugs.txt | npm run revalidate -- --songs -
 *
 * Slugs are batched automatically, so a pass over thousands of recordings can
 * be piped in wholesale.
 */

const USAGE = `Usage: npm run revalidate -- [options]

  --artists  <slugs>   Artist slugs (comma-separated, or "-" to read stdin)
  --songs    <slugs>   Recording slugs
  --releases <slugs>   Release slugs
  --all-artists        Refresh every artist profile in one call
  --url      <origin>  Target origin (default: the canonical site origin)
  --dry-run            Print what would be sent, then exit

Requires REVALIDATION_TOKEN in the environment.`;

type Args = {
  targets: Record<RevalidationTarget, string[]>;
  allArtists: boolean;
  url: string | null;
  dryRun: boolean;
};

async function readStdin() {
  const chunks: Buffer[] = [];
  for await (const chunk of process.stdin) chunks.push(Buffer.from(chunk));
  return Buffer.concat(chunks).toString("utf8");
}

function splitSlugs(raw: string) {
  return raw
    .split(/[\s,]+/)
    .map((slug) => slug.trim())
    .filter(Boolean);
}

async function parseArgs(argv: string[]): Promise<Args> {
  const args: Args = {
    targets: { artists: [], songs: [], releases: [] },
    allArtists: false,
    url: null,
    dryRun: false,
  };

  for (let i = 0; i < argv.length; i += 1) {
    const flag = argv[i];

    if (flag === "--all-artists") {
      args.allArtists = true;
      continue;
    }
    if (flag === "--dry-run") {
      args.dryRun = true;
      continue;
    }
    if (flag === "--url") {
      args.url = argv[++i] ?? null;
      continue;
    }
    if (flag === "--help" || flag === "-h") {
      console.log(USAGE);
      process.exit(0);
    }

    const target = REVALIDATION_TARGETS.find((name) => flag === `--${name}`);
    if (!target) {
      throw new Error(`Unknown option "${flag}".\n\n${USAGE}`);
    }

    const value = argv[++i];
    if (!value) throw new Error(`"${flag}" needs a value.`);
    args.targets[target].push(
      ...splitSlugs(value === "-" ? await readStdin() : value),
    );
  }

  return args;
}

function chunk<T>(items: T[], size: number) {
  const batches: T[][] = [];
  for (let i = 0; i < items.length; i += size) {
    batches.push(items.slice(i, i + size));
  }
  return batches;
}

/**
 * One request per entity per batch. Mixing entities would make a partial
 * failure ambiguous — this way a failed batch names exactly what did not
 * refresh, and re-running it is safe because revalidation is idempotent.
 */
function buildPayloads(args: Args) {
  const payloads: Record<string, unknown>[] = [];

  if (args.allArtists) payloads.push({ allArtists: true });

  for (const target of REVALIDATION_TARGETS) {
    const slugs = [...new Set(args.targets[target])];
    // --all-artists already sweeps every artist; naming them again would be
    // thousands of redundant path revalidations.
    if (target === "artists" && args.allArtists) continue;
    for (const batch of chunk(slugs, MAX_SLUGS_PER_ENTITY)) {
      payloads.push({ [target]: batch });
    }
  }

  return payloads;
}

async function main() {
  const args = await parseArgs(process.argv.slice(2));
  const payloads = buildPayloads(args);

  if (!payloads.length) {
    console.error("Nothing to revalidate.\n\n" + USAGE);
    process.exit(1);
  }

  // SITE_URL, not NEXT_PUBLIC_SITE_URL: the canonical origin is a constant in
  // src/lib/seo.ts precisely so a preview host can never stand in for it, and
  // nothing in the app reads the env var. Pass --url to target somewhere else.
  const origin = (args.url ?? SITE_URL).replace(/\/+$/, "");
  const endpoint = `${origin}/api/revalidate`;

  if (args.dryRun) {
    console.log(`POST ${endpoint}`);
    for (const payload of payloads) console.log("  " + JSON.stringify(payload));
    return;
  }

  const token = process.env.REVALIDATION_TOKEN;
  if (!token) {
    console.error("REVALIDATION_TOKEN is not set.");
    process.exit(1);
  }

  let failures = 0;

  for (const [index, payload] of payloads.entries()) {
    const label = `${index + 1}/${payloads.length}`;
    const response = await fetch(endpoint, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(payload),
    });

    const body = (await response.json().catch(() => null)) as
      | { ok?: boolean; error?: string; revalidated?: Record<string, unknown> }
      | null;

    if (!response.ok || !body?.ok) {
      failures += 1;
      console.error(
        `  [${label}] failed (${response.status}): ${body?.error ?? "no response body"}`,
      );
      console.error(`             payload: ${JSON.stringify(payload)}`);
      continue;
    }

    console.log(`  [${label}] ${JSON.stringify(body.revalidated)}`);
  }

  if (failures) {
    console.error(`\n${failures} of ${payloads.length} batches failed.`);
    process.exit(1);
  }

  console.log(`\nRevalidated via ${endpoint}.`);
}

main().catch((error) => {
  console.error(error instanceof Error ? error.message : error);
  process.exit(1);
});
