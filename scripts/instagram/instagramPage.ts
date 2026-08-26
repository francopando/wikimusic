// Every Instagram selector and page-state rule lives in this file.
//
// If Instagram changes its UI, this is the only module that should need
// editing. Nothing here tries to disguise the browser or work around
// Instagram's protections: when a login wall, checkpoint or challenge appears
// the driver reports it and the run stops.

import type { Page } from "playwright";

import {
  InstagramProfileError,
  type InstagramDriver,
  type LatestPost,
  type ProfileProblem,
} from "./types";
import { profileUrlFor } from "./profileSource";

// --- Selectors -------------------------------------------------------------

const SELECTORS = {
  /** Post/reel tiles in the profile grid, in visual order. */
  gridLinks: 'main a[href*="/p/"], main a[href*="/reel/"]',
  /**
   * The pin badge Instagram draws on pinned grid tiles.
   * Only rendered for signed-in viewers — signed out, pinned posts still sort
   * first but carry no badge, which is why the date signal below matters.
   */
  pinnedIcon:
    'svg[aria-label="Pinned post icon"], svg[aria-label="Icono de publicación fijada"], img[alt="Pinned post icon"]',
  /** The tile thumbnail. Signed out, its alt text carries the post date. */
  tileImage: "img[alt]",
  /** The post's own like control. height="24" excludes comment likes. */
  likeButton:
    'article svg[aria-label="Like"][height="24"], article svg[aria-label="Me gusta"][height="24"]',
  /** Present only when the post is already liked. */
  unlikeButton:
    'article svg[aria-label="Unlike"][height="24"], article svg[aria-label="No me gusta"][height="24"]',
  postArticle: "article",
} as const;

/** Page-text markers, matched case-insensitively in English and Spanish. */
const TEXT_MARKERS = {
  private: [
    "this account is private",
    "esta cuenta es privada",
    "follow to see their photos",
    "síguela para ver sus fotos",
  ],
  unavailable: [
    "sorry, this page isn",
    "esta página no está disponible",
    "the link you followed may be broken",
    "user not found",
  ],
  noPosts: ["no posts yet", "aún no hay publicaciones", "no hay publicaciones todavía"],
  /** Age-gated profiles. Readable only with a signed-in, age-verified session. */
  restricted: [
    "restricted profile",
    "you must be 16 years old or over",
    "perfil restringido",
    "debes tener 16 años",
  ],
  /**
   * Signed-out markers. The "stay in the loop" / "sign up for instagram"
   * wording is the dialog Instagram shows over a post when the session is not
   * signed in — the state that makes a post page unreadable.
   */
  loginRequired: [
    "log in to instagram",
    "inicia sesión en instagram",
    "sign up to see photos",
    "regístrate para ver fotos",
    "sign up for instagram to stay in the loop",
    "regístrate en instagram para estar al día",
  ],
} as const;

const DEFAULT_TIMEOUT_MS = 20_000;

// --- Page-state detection --------------------------------------------------

function problem(kind: ProfileProblem["kind"], message: string, fatal = false): ProfileProblem {
  return { kind, message, fatal };
}

function matchesAny(haystack: string, needles: readonly string[]): boolean {
  return needles.some((needle) => haystack.includes(needle));
}

/**
 * Classifies the currently loaded page. Returns null when the page looks like
 * a normal, readable profile or post.
 */
async function classifyPage(page: Page): Promise<ProfileProblem | null> {
  const url = page.url();

  if (/\/(challenge|checkpoint)\//i.test(url)) {
    return problem(
      "challenge",
      "Instagram presented a checkpoint/challenge page; stopping without attempting to bypass it.",
      true,
    );
  }

  if (/\/accounts\/(login|suspended)/i.test(url)) {
    return problem(
      "login_required",
      "Instagram redirected to the login page; the browser session is not signed in.",
      true,
    );
  }

  let bodyText = "";
  try {
    bodyText = ((await page.textContent("body", { timeout: 5_000 })) ?? "").toLowerCase();
  } catch {
    return problem("unexpected_state", "Page body could not be read.");
  }

  if (matchesAny(bodyText, TEXT_MARKERS.loginRequired)) {
    return problem(
      "login_required",
      "Instagram is showing a login wall; the browser session is not signed in.",
      true,
    );
  }

  if (matchesAny(bodyText, TEXT_MARKERS.unavailable)) {
    return problem("unavailable", "Profile is unavailable or has been deleted.");
  }

  if (matchesAny(bodyText, TEXT_MARKERS.restricted)) {
    return problem(
      "restricted",
      "Profile is age-restricted; it needs a signed-in, age-verified session to read.",
    );
  }

  if (matchesAny(bodyText, TEXT_MARKERS.private)) {
    return problem("private", "Profile is private; posts are not visible to this account.");
  }

  if (matchesAny(bodyText, TEXT_MARKERS.noPosts)) {
    return problem("no_posts", "Profile has no posts.");
  }

  return null;
}

// --- Driver ----------------------------------------------------------------

export type PlaywrightDriverOptions = {
  /** Milliseconds to pause after each navigation, to stay gentle on Instagram. */
  settleMs?: number;
  timeoutMs?: number;
};

/**
 * Playwright-backed implementation of the worker's browser surface.
 * One page is reused for the whole run.
 */
export class PlaywrightInstagramDriver implements InstagramDriver {
  private readonly page: Page;
  private readonly settleMs: number;
  private readonly timeoutMs: number;

  constructor(page: Page, options: PlaywrightDriverOptions = {}) {
    this.page = page;
    this.settleMs = options.settleMs ?? 1_500;
    this.timeoutMs = options.timeoutMs ?? DEFAULT_TIMEOUT_MS;
    this.page.setDefaultTimeout(this.timeoutMs);
  }

  private async goto(url: string, context: string): Promise<void> {
    try {
      await this.page.goto(url, { waitUntil: "domcontentloaded", timeout: this.timeoutMs });
    } catch (error) {
      const message = (error as Error).message;
      const kind = /timeout/i.test(message) ? "timeout" : "navigation";
      throw new InstagramProfileError(problem(kind, `${context}: ${message}`));
    }

    await this.page.waitForTimeout(this.settleMs);

    const detected = await classifyPage(this.page);
    if (detected) throw new InstagramProfileError(detected);
  }

  async openProfile(username: string): Promise<void> {
    await this.goto(profileUrlFor(username), `could not open profile @${username}`);
  }

  /**
   * Returns the newest post on the currently open profile.
   *
   * Instagram floats pinned posts to the front of the grid, so the first tile
   * is not necessarily the newest. Pinned tiles are skipped; if every tile is
   * pinned the first one is used, since that is the best available answer.
   */
  async findLatestPost(): Promise<LatestPost | null> {
    try {
      await this.page.waitForSelector(SELECTORS.gridLinks, { timeout: this.timeoutMs });

      // The grid selector resolves as soon as the first anchor exists, but the
      // pin badges inside the tiles paint slightly later. Reading pin state
      // immediately makes a pinned post look unpinned on a cold page load,
      // which silently picks an old post as "newest". Wait for the tile count
      // to stop growing before trusting what is in them.
      await this.waitForGridToSettle();
    } catch {
      // An empty grid is a legitimate outcome, not a failure — but re-check
      // the page first, in case a private/unavailable notice rendered late.
      const detected = await classifyPage(this.page);
      if (detected) throw new InstagramProfileError(detected);

      // No grid and no notice. The header still reports how many posts the
      // account has, which separates "this artist has posted nothing" from
      // "posts exist but this session cannot see them" — very different
      // problems, and reporting both as "no posts" is what makes a correct
      // handle look like bad data.
      const count = await this.readPostCount();

      if (count !== null && count > 0) {
        throw new InstagramProfileError(
          problem(
            "posts_hidden",
            `Profile has ${count} post(s) but none are visible to this session; it likely needs a signed-in account.`,
          ),
        );
      }

      return null;
    }

    const tiles = await this.page.$$(SELECTORS.gridLinks);
    const candidates: Array<LatestPost & { takenAt: number | null }> = [];

    for (const tile of tiles.slice(0, 12)) {
      const href = await tile.getAttribute("href");
      const id = href ? extractPostId(href) : null;
      if (!id || !href) continue;

      const pinned = (await tile.$(SELECTORS.pinnedIcon)) !== null;
      const image = await tile.$(SELECTORS.tileImage);
      const takenAt = extractPostDate(image ? await image.getAttribute("alt") : null);

      candidates.push({ id, url: postUrlFor(href), pinned, takenAt });
    }

    if (candidates.length === 0) return null;

    return pickNewest(candidates);
  }

  /**
   * Reads the account's post count from the page's og:description meta tag,
   * which Instagram populates even when the grid itself is not rendered.
   * Returns null when the count cannot be read.
   */
  private async readPostCount(): Promise<number | null> {
    try {
      const meta = await this.page.getAttribute(
        'meta[property="og:description"]',
        "content",
        { timeout: 3_000 },
      );

      return parsePostCount(meta);
    } catch {
      return null;
    }
  }

  /**
   * Waits until the grid stops adding tiles, then gives the pin badges a beat
   * to paint. Polls rather than sleeping a fixed amount so a fast page is not
   * penalised and a slow one is not misread.
   */
  private async waitForGridToSettle(): Promise<void> {
    let previous = -1;

    for (let attempt = 0; attempt < 10; attempt += 1) {
      const count = (await this.page.$$(SELECTORS.gridLinks)).length;

      if (count > 0 && count === previous) break;

      previous = count;
      await this.page.waitForTimeout(300);
    }

    // Badges are rendered inside tiles that already exist, so a short final
    // wait covers the gap between the anchor appearing and its pin painting.
    await this.page.waitForTimeout(600);
  }

  /** Opens a post page unless it is already the current page. */
  private async ensurePostOpen(post: LatestPost): Promise<void> {
    if (!this.page.url().includes(`/${post.id}/`)) {
      await this.goto(post.url, `could not open post ${post.id}`);
    }

    try {
      await this.page.waitForSelector(SELECTORS.postArticle, { timeout: this.timeoutMs });
    } catch {
      // A signed-out post page renders no <article> at all, only a sign-up
      // dialog — and it still contains a decorative "Like" icon, so failing
      // here rather than hunting for a like control is deliberate.
      const detected = await classifyPage(this.page);
      if (detected) throw new InstagramProfileError(detected);

      throw new InstagramProfileError(
        problem("post_unreadable", `Post ${post.id} did not render a readable post body.`),
      );
    }
  }

  async isPostLiked(post: LatestPost): Promise<boolean> {
    await this.ensurePostOpen(post);

    const liked = await this.page.$(SELECTORS.unlikeButton);
    if (liked) return true;

    const likeable = await this.page.$(SELECTORS.likeButton);
    if (likeable) return false;

    throw new InstagramProfileError(
      problem("unexpected_state", `Neither a like nor an unlike control was found on ${post.id}.`),
    );
  }

  /**
   * Clicks Like and confirms the control flipped to "Unlike".
   * Returns false if the state could not be confirmed, so the caller never
   * records an unverified like.
   */
  async likePost(post: LatestPost): Promise<boolean> {
    await this.ensurePostOpen(post);

    const icon = await this.page.$(SELECTORS.likeButton);
    if (!icon) {
      throw new InstagramProfileError(
        problem("unexpected_state", `Like control disappeared before clicking ${post.id}.`),
      );
    }

    // The clickable element is the button/div wrapping the SVG icon.
    const control = await icon.evaluateHandle(
      (node) => node.closest('[role="button"], button') ?? node.parentElement,
    );
    const element = control.asElement();

    if (!element) {
      throw new InstagramProfileError(
        problem("unexpected_state", `Like control on ${post.id} had no clickable ancestor.`),
      );
    }

    await element.click();

    try {
      await this.page.waitForSelector(SELECTORS.unlikeButton, { timeout: 10_000 });
      return true;
    } catch {
      return false;
    }
  }
}

// --- URL helpers -----------------------------------------------------------

/**
 * Reads the post date out of a grid tile's alt text.
 *
 * Signed out, Instagram writes alt text like
 *   "Video by Alex Matos on January 10, 2024."
 * which is the only reliable ordering signal available in that mode, because
 * pin badges are not rendered for signed-out viewers. Signed in, the alt is
 * the post caption instead and this returns null — pin badges cover that case.
 */
export function extractPostDate(alt: string | null): number | null {
  if (!alt) return null;

  const match = alt.match(/\bon ([A-Z][a-z]+ \d{1,2}, \d{4})\b/);
  if (!match) return null;

  const parsed = Date.parse(match[1]);
  return Number.isNaN(parsed) ? null : parsed;
}

/**
 * Chooses the newest post from the grid.
 *
 * Prefers real dates when the page exposes them, because pinned posts sort to
 * the front of the grid and would otherwise be mistaken for the newest. Falls
 * back to skipping badge-marked pins, then to grid order.
 */
export function pickNewest<T extends LatestPost & { takenAt: number | null }>(
  candidates: T[],
): T | null {
  if (candidates.length === 0) return null;

  const dated = candidates.filter((candidate) => candidate.takenAt !== null);

  if (dated.length > 0) {
    return dated.reduce((newest, candidate) =>
      (candidate.takenAt ?? 0) > (newest.takenAt ?? 0) ? candidate : newest,
    );
  }

  return candidates.find((candidate) => !candidate.pinned) ?? candidates[0];
}

/**
 * Reads the post count out of Instagram's og:description, e.g.
 *   "136K Followers, 969 Following, 0 Posts - See Instagram photos ..."
 * Abbreviated counts ("1.2K Posts") are resolved to an approximate number,
 * which is enough for the only question asked of it: zero, or more than zero.
 */
export function parsePostCount(meta: string | null): number | null {
  if (!meta) return null;

  const match = meta.match(/([\d.,]+)\s*([KMkm]?)\s+Posts/);
  if (!match) return null;

  const value = Number.parseFloat(match[1].replace(/,/g, ""));
  if (Number.isNaN(value)) return null;

  const scale = match[2].toLowerCase() === "k" ? 1_000 : match[2].toLowerCase() === "m" ? 1_000_000 : 1;
  return Math.round(value * scale);
}

/** Pulls the shortcode out of /p/<id>/, /reel/<id>/ or /tv/<id>/. */
export function extractPostId(href: string): string | null {
  const match = href.match(/\/(?:p|reel|reels|tv)\/([A-Za-z0-9_-]+)/);
  return match ? match[1] : null;
}

/** Normalizes a grid href into an absolute, canonical post URL. */
export function postUrlFor(href: string): string {
  const id = extractPostId(href);
  if (!id) return new URL(href, "https://www.instagram.com").toString();

  const isReel = /\/reels?\//.test(href);
  return `https://www.instagram.com/${isReel ? "reel" : "p"}/${id}/`;
}
