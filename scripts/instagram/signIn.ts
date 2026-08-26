// One-time, manual Instagram sign-in for the worker's own Chrome profile.
//
//   npm run instagram:sign-in
//
// This opens a normal Chrome window and navigates to Instagram. YOU sign in
// there yourself. The script never reads, types, stores or transmits your
// credentials — it only waits until the browser reports a session, then exits
// so the profile directory keeps that session for later worker runs.

import "dotenv/config";

import {
  DEFAULT_USER_DATA_DIR,
  isSignedIn,
  openBrowserSession,
} from "./instagramBrowser";

const POLL_INTERVAL_MS = 2_000;
const TIMEOUT_MS = 10 * 60 * 1_000;

async function main(): Promise<void> {
  const userDataDir = process.env.IG_USER_DATA_DIR ?? DEFAULT_USER_DATA_DIR;
  const session = await openBrowserSession({ headless: false });

  console.log(`Opened Chrome (${session.mode}: ${session.origin}).`);

  if (await isSignedIn(session.context)) {
    console.log("This browser is already signed in to Instagram. Nothing to do.");
    await session.close();
    return;
  }

  await session.page.goto("https://www.instagram.com/accounts/login/", {
    waitUntil: "domcontentloaded",
  });

  console.log("");
  console.log("Sign in to Instagram in the browser window that just opened.");
  console.log("Type your credentials directly into Instagram's own page —");
  console.log("this script does not handle them and cannot see them.");
  console.log("");
  console.log(`Waiting up to ${TIMEOUT_MS / 60_000} minutes for a session…`);

  const deadline = Date.now() + TIMEOUT_MS;
  let signedIn = false;

  while (Date.now() < deadline) {
    await new Promise((resolve) => setTimeout(resolve, POLL_INTERVAL_MS));

    if (await isSignedIn(session.context)) {
      signedIn = true;
      break;
    }
  }

  if (signedIn) {
    console.log("");
    console.log(`Signed in. The session is stored in ${userDataDir} and will be reused.`);
    console.log("You can now run: npm run instagram:worker -- --dry-run --limit 5");
  } else {
    console.log("");
    console.log("No session detected before the timeout. Nothing was changed.");
    process.exitCode = 1;
  }

  await session.close();
}

main().catch((error: unknown) => {
  console.error(`[FATAL] ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
});
