// Browser session for the Instagram worker.
//
// The worker never handles Instagram credentials. It reuses a browser you are
// already signed into, in one of two ways:
//
//   1. Attach to a running Chrome (preferred — reuses your normal session):
//        chrome.exe --remote-debugging-port=9222
//        IG_CDP_ENDPOINT=http://127.0.0.1:9222
//
//   2. A dedicated persistent Chrome profile (default). The first run opens a
//      browser window; sign in to Instagram there once, by hand. The profile
//      directory keeps that session for later runs.
//
// No stealth plugins, no fingerprint spoofing, no automation-detection
// workarounds — this is an ordinary browser doing ordinary navigation.

import path from "node:path";

import { chromium, type Browser, type BrowserContext, type Page } from "playwright";

export type BrowserSession = {
  page: Page;
  context: BrowserContext;
  close: () => Promise<void>;
  /** How the session was obtained, for logging. */
  mode: "cdp" | "persistent";
  /** Profile directory in use, or the endpoint when attached over CDP. */
  origin: string;
};

export type BrowserSessionOptions = {
  /** CDP endpoint of an already-running Chrome, e.g. http://127.0.0.1:9222 */
  cdpEndpoint?: string;
  /** Directory holding the dedicated Chrome profile. */
  userDataDir?: string;
  headless?: boolean;
};

export const DEFAULT_USER_DATA_DIR = path.resolve(".instagram-profile");
export const DEFAULT_CDP_PORT = 9222;

/**
 * Returns the browser version string if a CDP endpoint answers, else null.
 * Used to prefer an already-running Chrome over launching a new one.
 */
export async function probeCdpEndpoint(endpoint: string): Promise<string | null> {
  try {
    const response = await fetch(new URL("/json/version", endpoint), {
      signal: AbortSignal.timeout(2_000),
    });

    if (!response.ok) return null;

    const payload = (await response.json()) as { Browser?: string };
    return payload.Browser ?? "unknown";
  } catch {
    return null;
  }
}

/**
 * Reports whether the browser already holds a signed-in Instagram session.
 *
 * This only asks the browser whether a `sessionid` cookie exists; the value is
 * never read, logged or stored. Checking once up front means a signed-out run
 * stops immediately instead of failing on every profile in turn.
 */
export async function isSignedIn(context: BrowserContext): Promise<boolean> {
  const cookies = await context.cookies("https://www.instagram.com");
  return cookies.some((cookie) => cookie.name === "sessionid" && cookie.value !== "");
}

/** Actionable guidance for a session that is not signed in. */
export function signInInstructions(mode: BrowserSession["mode"], userDataDir: string): string {
  if (mode === "cdp") {
    return [
      "The Chrome you attached to is not signed in to Instagram.",
      "Sign in in that Chrome window, then run the worker again.",
    ].join("\n");
  }

  return [
    "The worker's Chrome profile is not signed in to Instagram.",
    "",
    "Sign in once, by hand, in the worker's own browser:",
    `  npm run instagram:sign-in`,
    "",
    `That opens Chrome using ${userDataDir}. Log in to Instagram there, close the`,
    "window, and the session is reused by later runs.",
    "",
    "Alternatively, attach to a Chrome you are already signed in to:",
    "  1. Start Chrome with --remote-debugging-port=9222",
    "  2. Set IG_CDP_ENDPOINT=http://127.0.0.1:9222",
  ].join("\n");
}

/**
 * Opens a browser session, attaching to an existing Chrome when a CDP
 * endpoint is configured and falling back to a persistent local profile.
 */
export async function openBrowserSession(
  options: BrowserSessionOptions = {},
): Promise<BrowserSession> {
  const configured = options.cdpEndpoint ?? process.env.IG_CDP_ENDPOINT;

  // An explicitly configured endpoint must work or fail loudly.
  if (configured) {
    return attachOverCdp(configured);
  }

  // Otherwise prefer a Chrome that is already running with a debugging port
  // (see `npm run instagram:chrome`). Attaching to a normally-started browser
  // avoids the `navigator.webdriver` flag that Playwright sets on browsers it
  // launches itself, so it is the better default whenever it is available.
  const port = Number.parseInt(process.env.IG_CDP_PORT ?? String(DEFAULT_CDP_PORT), 10);
  const autoEndpoint = `http://127.0.0.1:${port}`;

  if (await probeCdpEndpoint(autoEndpoint)) {
    return attachOverCdp(autoEndpoint);
  }

  return launchPersistentProfile(
    options.userDataDir ?? process.env.IG_USER_DATA_DIR ?? DEFAULT_USER_DATA_DIR,
    options.headless ?? false,
  );
}

async function attachOverCdp(endpoint: string): Promise<BrowserSession> {
  let browser: Browser;

  try {
    browser = await chromium.connectOverCDP(endpoint);
  } catch (error) {
    throw new Error(
      `Could not attach to Chrome at ${endpoint}: ${(error as Error).message}\n` +
        "Start Chrome with --remote-debugging-port=9222, or unset IG_CDP_ENDPOINT " +
        "to use the dedicated profile instead.",
    );
  }

  const context = browser.contexts()[0];

  if (!context) {
    await browser.close();
    throw new Error(`Chrome at ${endpoint} exposed no browser context.`);
  }

  // Always open a dedicated tab. Reusing context.pages()[0] would navigate
  // away from whatever the user already had open in that window.
  const page = await context.newPage();

  return {
    page,
    context,
    mode: "cdp",
    origin: endpoint,
    close: async () => {
      // Close only our own tab, then detach. Never close a browser the user
      // is working in — browser.close() on a CDP connection disconnects, but
      // dropping our tab first keeps their window exactly as we found it.
      try {
        await page.close();
      } catch {
        // The tab may already be gone; detaching is what matters.
      }

      await browser.close();
    },
  };
}

async function launchPersistentProfile(
  userDataDir: string,
  headless: boolean,
): Promise<BrowserSession> {
  const context = await chromium.launchPersistentContext(userDataDir, {
    channel: "chrome",
    headless,
    viewport: { width: 1280, height: 900 },
  });

  const page = context.pages()[0] ?? (await context.newPage());

  return {
    page,
    context,
    mode: "persistent",
    origin: userDataDir,
    close: async () => {
      await context.close();
    },
  };
}
