// Selector harness for PlaywrightInstagramDriver.
//
//   npm run instagram:verify-selectors
//
// Serves local HTML that mirrors Instagram's profile grid and post markup,
// then drives the real driver against it. This exercises the selector logic,
// pinned-post handling and the like-and-confirm flow without opening
// Instagram or needing a signed-in session.
//
// It is a development aid, not a claim that the selectors still match the
// live site — only a real signed-in run can show that.

import { chromium, type Browser } from "playwright";

import { PlaywrightInstagramDriver } from "./instagramPage";
import { InstagramProfileError, type LatestPost } from "./types";

const GRID_TILE = (id: string, pinned: boolean): string => `
  <a href="/p/${id}/">
    ${pinned ? '<svg aria-label="Pinned post icon" height="16"></svg>' : ""}
    <img alt="post ${id}" />
  </a>`;

function profileHtml(tiles: Array<{ id: string; pinned: boolean }>): string {
  return `<!doctype html><html><body><main><section>
    ${tiles.map((tile) => GRID_TILE(tile.id, tile.pinned)).join("\n")}
  </section></main></body></html>`;
}

/** Post page. The comment-level like uses height="12" and must be ignored. */
function postHtml(liked: boolean): string {
  return `<!doctype html><html><body><article>
    <section>
      <div role="button" id="main-like">
        <svg aria-label="${liked ? "Unlike" : "Like"}" height="24"></svg>
      </div>
    </section>
    <ul>
      <li><div role="button" id="comment-like">
        <svg aria-label="Like" height="12"></svg>
      </div></li>
    </ul>
    <script>
      document.getElementById('main-like').addEventListener('click', () => {
        document.querySelector('#main-like svg').setAttribute('aria-label', 'Unlike');
      });
      document.getElementById('comment-like').addEventListener('click', () => {
        throw new Error('the comment like button must never be clicked');
      });
    </script>
  </article></body></html>`;
}

const PRIVATE_HTML = `<!doctype html><html><body><main>
  <h2>This Account is Private</h2><p>Follow to see their photos and videos.</p>
</main></body></html>`;

const UNAVAILABLE_HTML = `<!doctype html><html><body><main>
  <h2>Sorry, this page isn't available.</h2>
</main></body></html>`;

const NO_POSTS_HTML = `<!doctype html><html><body><main><section>
  <h2>No Posts Yet</h2>
</section></main></body></html>`;

const LOGIN_HTML = `<!doctype html><html><body><main>
  <h1>Log in to Instagram</h1>
</main></body></html>`;

type Check = { name: string; ok: boolean; detail: string };
const checks: Check[] = [];

function record(name: string, ok: boolean, detail = ""): void {
  checks.push({ name, ok, detail });
  console.log(`${ok ? "  PASS" : "  FAIL"}  ${name}${detail ? ` — ${detail}` : ""}`);
}

/** Routes every instagram.com request to a fixture chosen by the handle/post. */
async function buildDriver(browser: Browser, routes: Record<string, string>) {
  const context = await browser.newContext();

  await context.route("**://*.instagram.com/**", async (route) => {
    const url = new URL(route.request().url());
    const key = url.pathname;
    const body = routes[key];

    if (body === undefined) {
      await route.fulfill({ status: 404, contentType: "text/html", body: "<html></html>" });
      return;
    }

    await route.fulfill({ status: 200, contentType: "text/html", body });
  });

  const page = await context.newPage();
  return {
    driver: new PlaywrightInstagramDriver(page, { settleMs: 50, timeoutMs: 5_000 }),
    close: () => context.close(),
  };
}

async function expectProblem(
  action: () => Promise<unknown>,
  expectedKind: string,
  name: string,
): Promise<void> {
  try {
    await action();
    record(name, false, `expected a ${expectedKind} problem but none was raised`);
  } catch (error) {
    if (error instanceof InstagramProfileError) {
      record(name, error.problem.kind === expectedKind, `got ${error.problem.kind}`);
    } else {
      record(name, false, `unexpected error: ${(error as Error).message}`);
    }
  }
}

async function main(): Promise<void> {
  const browser = await chromium.launch({ channel: "chrome", headless: true });

  try {
    console.log("Newest-post identification");
    {
      const { driver, close } = await buildDriver(browser, {
        "/plain/": profileHtml([
          { id: "NEWEST1", pinned: false },
          { id: "OLDER1", pinned: false },
        ]),
        "/pinned/": profileHtml([
          { id: "PINNED1", pinned: true },
          { id: "PINNED2", pinned: true },
          { id: "NEWEST2", pinned: false },
        ]),
        "/allpinned/": profileHtml([{ id: "ONLYPIN", pinned: true }]),
      });

      await driver.openProfile("plain");
      const plain = await driver.findLatestPost();
      record(
        "first grid tile is taken as the newest post",
        plain?.id === "NEWEST1",
        `got ${plain?.id}`,
      );
      record(
        "post URL is canonicalised",
        plain?.url === "https://www.instagram.com/p/NEWEST1/",
        `got ${plain?.url}`,
      );

      await driver.openProfile("pinned");
      const pinned = await driver.findLatestPost();
      record(
        "pinned tiles are skipped in favour of the newest real post",
        pinned?.id === "NEWEST2",
        `got ${pinned?.id}`,
      );

      await driver.openProfile("allpinned");
      const allPinned = await driver.findLatestPost();
      record(
        "an all-pinned grid falls back to the first tile",
        allPinned?.id === "ONLYPIN",
        `got ${allPinned?.id}`,
      );

      await close();
    }

    console.log("Liked-state detection and liking");
    {
      const post: LatestPost = {
        id: "UNLIKED",
        url: "https://www.instagram.com/p/UNLIKED/",
        pinned: false,
      };
      const likedPost: LatestPost = {
        id: "LIKEDONE",
        url: "https://www.instagram.com/p/LIKEDONE/",
        pinned: false,
      };

      const { driver, close } = await buildDriver(browser, {
        "/p/UNLIKED/": postHtml(false),
        "/p/LIKEDONE/": postHtml(true),
      });

      record("an unliked post reads as not liked", (await driver.isPostLiked(post)) === false);
      record("an already-liked post reads as liked", (await driver.isPostLiked(likedPost)) === true);

      const confirmed = await driver.likePost(post);
      record("liking clicks the post control and confirms the new state", confirmed === true);
      record("state is re-readable as liked after the click", (await driver.isPostLiked(post)) === true);

      await close();
    }

    console.log("Problem pages");
    {
      const { driver, close } = await buildDriver(browser, {
        "/privateacct/": PRIVATE_HTML,
        "/goneacct/": UNAVAILABLE_HTML,
        "/emptyacct/": NO_POSTS_HTML,
        "/walledacct/": LOGIN_HTML,
      });

      await expectProblem(
        () => driver.openProfile("privateacct"),
        "private",
        "a private profile is reported as private",
      );
      await expectProblem(
        () => driver.openProfile("goneacct"),
        "unavailable",
        "a deleted profile is reported as unavailable",
      );
      await expectProblem(
        () => driver.openProfile("emptyacct"),
        "no_posts",
        "an empty profile is reported as having no posts",
      );
      await expectProblem(
        () => driver.openProfile("walledacct"),
        "login_required",
        "a login wall is reported as login_required",
      );

      await close();
    }
  } finally {
    await browser.close();
  }

  const failed = checks.filter((check) => !check.ok);
  console.log(`\n${checks.length - failed.length}/${checks.length} selector checks passed.`);

  if (failed.length > 0) {
    process.exitCode = 1;
  }
}

main().catch((error: unknown) => {
  console.error(`[FATAL] ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
});
