// Starts the worker's Chrome as an ordinary browser with a debugging port.
//
//   npm run instagram:chrome
//
// Why this exists: Playwright sets `navigator.webdriver = true` on browsers it
// launches itself. A Chrome started normally — like this one — never has that
// flag set, and the worker then *attaches* to it over CDP instead of launching
// it. Nothing is patched or spoofed; the flag is simply never introduced.
//
// It uses its own profile directory rather than your everyday Chrome profile,
// so a long run cannot disturb your normal browsing and there is no profile
// lock fight with the Chrome you already have open.
//
// Leave this window running, then start the worker in another terminal.

import "dotenv/config";
import { spawn } from "node:child_process";
import { existsSync } from "node:fs";

import { DEFAULT_USER_DATA_DIR, DEFAULT_CDP_PORT, probeCdpEndpoint } from "./instagramBrowser";

/** Usual install locations for Chrome on Windows and macOS. */
const CHROME_CANDIDATES = [
  "C:/Program Files/Google/Chrome/Application/chrome.exe",
  "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe",
  `${process.env.LOCALAPPDATA ?? ""}/Google/Chrome/Application/chrome.exe`,
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
];

function findChrome(): string {
  const configured = process.env.IG_CHROME_PATH;
  if (configured && existsSync(configured)) return configured;

  const found = CHROME_CANDIDATES.find((candidate) => candidate && existsSync(candidate));

  if (!found) {
    throw new Error(
      "Could not find Chrome. Set IG_CHROME_PATH to the chrome executable and try again.",
    );
  }

  return found;
}

async function main(): Promise<void> {
  const port = Number.parseInt(process.env.IG_CDP_PORT ?? String(DEFAULT_CDP_PORT), 10);
  const userDataDir = process.env.IG_USER_DATA_DIR ?? DEFAULT_USER_DATA_DIR;

  const existing = await probeCdpEndpoint(`http://127.0.0.1:${port}`);

  if (existing) {
    console.log(`Chrome is already listening on port ${port} (${existing}).`);
    console.log("Nothing to do — the worker will attach to it.");
    return;
  }

  const chromePath = findChrome();

  const child = spawn(
    chromePath,
    [
      `--remote-debugging-port=${port}`,
      `--user-data-dir=${userDataDir}`,
      "--no-first-run",
      "--no-default-browser-check",
      "https://www.instagram.com/",
    ],
    { detached: true, stdio: "ignore" },
  );

  child.unref();

  console.log(`Started Chrome (${chromePath})`);
  console.log(`  profile:  ${userDataDir}`);
  console.log(`  debug on: http://127.0.0.1:${port}`);
  console.log("");
  console.log("If Instagram asks you to log in, do it in this window — by hand.");
  console.log("Then leave the window open and run:");
  console.log("");
  console.log("  npm run instagram:worker -- --dry-run --limit 3");
  console.log("");
  console.log("The worker attaches to this browser, opens its own tab, and");
  console.log("closes that tab when it finishes. Your other tabs are untouched.");
}

main().catch((error: unknown) => {
  console.error(`[FATAL] ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
});
