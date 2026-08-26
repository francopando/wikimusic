# Instagram engagement worker

Walks the Instagram profiles already stored on `artists`, one at a time, and
likes each artist's newest post once. History is kept **per post**, so a
profile becomes eligible again as soon as it publishes something new, and
repeat runs never like the same post twice.

## Commands

Recommended flow. Step 1 is once ever; steps 2-3 are what you run each session.

```bash
npm run instagram:chrome
```

Starts a normal Chrome with a debugging port, on its own profile
(`.instagram-profile/`), pointed at Instagram. Sign in there by hand the first
time. **Leave this window open** — the worker attaches to it. This is the step
that matters most (see *Why attach* below).

```bash
npm run instagram:worker -- --dry-run --limit 3
```

Reports what it would do. Clicks nothing, records nothing.

```bash
npm run instagram:worker -- --limit 40
```

The real run. Paces at one profile every 3 minutes by default, so `--limit 40`
is about a two-hour session. Stop it any time with Ctrl-C; the history is
already saved.

| Flag | Meaning |
|---|---|
| `--limit <n>` | Process at most `n` profiles |
| `--dry-run` | Report only; never like, never record |
| `--status <list>` | Artist statuses to include (default `published`) |
| `--start-at <name>` | Resume from a handle or artist name |
| `--delay <ms>` | Pause between profiles (default `180000` — 3 minutes) |

Bookkeeping and manual work:

```bash
npm run instagram:status                  # progress across the catalogue
npm run instagram:next   -- --limit 25    # next profiles, least-recently-seen first
npm run instagram:record                  # record a hand-done result (JSON on stdin)
npm run instagram:verify-selectors        # selector check against local fixtures
npm run instagram:typecheck
```

`instagram:next` and `instagram:record` exist for profiles handled by hand in a
browser rather than by the worker. Both share the same history file, so the two
approaches can never double-like the same post.

## Pacing and run length

At the default 3 minutes per profile:

| Batch | Run length |
|---|---|
| 20 | 1 hour |
| 40 | 2 hours |
| 60 | 3 hours |

417 profiles is about 21 hours of total running, so this is designed to be done
in bounded sessions rather than one sitting. Successive runs order profiles by
**least recently seen**, so each session moves into new territory instead of
re-checking the profiles the last run already finished.

The delay is flat rate limiting — one profile per interval, evenly spaced. It
does not randomise or imitate human timing.

## Digest — the recommended monthly workflow

```bash
npm run instagram:digest
```

A **read-only** sweep. It opens each artist's profile, reads the newest post
from the grid, and writes a Markdown report of who has published since the last
digest. It never opens a post, never clicks, and never likes.

| Flag | Meaning |
|---|---|
| `--limit <n>` | Scan at most `n` profiles |
| `--delay <ms>` | Pause between profiles (default `20000`) |
| `--status <list>` | Artist statuses to include (default `published`) |
| `--out <path>` | Write the report somewhere other than `data/digests/` |

The report lands in `data/digests/instagram-digest-<date>.md` with two tables:
artists with a new post, and profiles that could not be read — the second is
useful data quality signal for the artist records, independent of engagement.

Two things worth knowing:

- **It does not need a signed-in session.** The profile grid is readable signed
  out, and reads made that way are not attributed to your account at all. It
  warns if you are signed out, because Instagram login-walls anonymous browsing
  sooner, and stops cleanly if that happens.
- **A digest observation never suppresses a later like.** What the digest sees
  is stored in `last_digest`, separate from the `posts` map the liking worker
  consults.

### Acknowledging a known-unreadable profile

Some profiles will never be readable, and that is fine: a private account whose
follow request is outstanding, an artist who genuinely posts nothing. Left
alone they appear in every digest and bury the entries that actually changed.

```bash
npm run instagram:ack -- anderbock --note "follow request pending"
npm run instagram:ack -- --list
npm run instagram:ack -- anderbock --clear
```

An acknowledgement silences **one specific problem kind**. The profile is still
scanned every sweep and drops into a collapsed "known unreadable" footer
instead of the attention table. It resurfaces when something actually changes:

- **A different problem** — a private account that becomes `unavailable` is a
  deleted account, and reports normally. An acknowledgement is never a blanket
  mute.
- **It becomes readable** — the profile is reported under "Readable again", and
  its now-obsolete acknowledgement is cleared automatically.

The acknowledgement records the kind from the last recorded failure. Use
`--kind <kind>` to acknowledge a state you already know about before a sweep
has recorded it.

One caveat: problem kind depends on the session. The same profile can read as
`restricted` signed out and `no_posts` signed in. If you acknowledge from one
mode and later sweep in the other, it surfaces once with the new kind —
acknowledge it again and it stays quiet. That is the mechanism working, not a
bug, but it is worth knowing before the first signed-in sweep.

### Why a profile can fail

"No posts" and "cannot see the posts" are different problems, and conflating
them makes a perfectly good handle look like bad data. The sweep distinguishes:

| Reported as | Meaning | Action |
|---|---|---|
| `no_posts` | The account genuinely has zero posts | Nothing to do |
| `posts_hidden` | Posts exist but this session cannot see them | Re-run signed in |
| `restricted` | Age-gated profile | Needs a signed-in, age-verified session |
| `private` | Private account | Follow it, or accept it is unreadable |
| `unavailable` | Deleted or wrong handle | Check the stored value |

The post count comes from the page's `og:description`, which Instagram fills
in even when the grid is not rendered — that is what separates the first two
rows. This distinction was added after a batch review in which eleven profiles
all reported "no usable post found" and every one turned out to have a correct
handle.

### Finding the newest post

Pinned posts sort to the front of the grid, so "first tile" is wrong. Two
signals are used, in order:

1. **Post date from the tile image's alt text** (`"Video by X on January 10,
   2024."`). This is the reliable one — it is immune to pinning entirely.
2. **The pin badge**, skipping badge-marked tiles.

Both are needed because they are available in different modes: signed out,
Instagram renders no pin badges but does put dates in alt text; signed in, the
alt text is the post caption but pin badges are present. Relying on either
alone picks a pinned post as "newest" in the other mode — which is a real bug
this code had, caught against `alexmatosoficial`, `adonisproduciendo` and
`adabetsabe`, all of which pin an old post to the top of their grid.

## Browser session

The worker never handles Instagram credentials and builds no authentication of
its own. It reuses a browser you are already signed into. It picks a session in
this order:

1. `IG_CDP_ENDPOINT`, if set — attach to that Chrome.
2. **A Chrome already listening on port 9222** — attach to it. This is what
   `npm run instagram:chrome` gives you, and it is the preferred path.
3. Otherwise, launch its own Chrome profile via Playwright.

### Why attach rather than launch

Playwright sets `navigator.webdriver = true` on browsers it launches. A Chrome
started as an ordinary browser never has that flag set, and attaching to it
does not introduce one. Measured on this machine:

| | `navigator.webdriver` |
|---|---|
| Playwright-launched | `true` |
| CDP attach to a normally-started Chrome | `false` |

Nothing is patched or spoofed to achieve that — the difference is only in who
launched the browser. That is why `instagram:chrome` + attach is the default
recommendation, and why option 3 above is a fallback rather than the main path.

When attached, the worker opens **its own tab** and closes only that tab when
it finishes. Your other tabs are never navigated or closed.

Before a run starts, the worker asks the browser whether an Instagram
`sessionid` cookie exists. If not it stops immediately with instructions,
rather than failing on every profile in turn. The cookie's value is never read,
logged or stored.

There is no bot-detection evasion here, deliberately. On a login wall,
checkpoint or challenge the worker records the problem and **stops the run** —
those conditions repeat for every remaining profile, so continuing would just
hammer Instagram.

## Activity history

`data/instagram-activity.json`, created automatically:

```json
{
  "someprofile": {
    "posts": {
      "ABC123": {
        "url": "https://www.instagram.com/p/ABC123/",
        "result": "liked",
        "processed_at": "2026-08-25T04:30:00.000Z"
      }
    },
    "last_attempt": {
      "result": "skipped",
      "reason": "no usable post found",
      "at": "2026-08-25T04:30:00.000Z"
    }
  }
}
```

Keyed by Instagram shortcode — the stable post identifier. `last_attempt`
holds outcomes for runs that never reached a post (private, deleted, no posts)
so the `posts` map only ever contains real posts.

Behaviour worth knowing:

- **Written after every profile**, atomically (temp file + rename), so a crash
  costs at most the profile in flight.
- **`liked` and `already_liked` are terminal** — those posts are never touched
  again. **`failed` is retried** on the next run; that is the point of
  recording it.
- **A like is only recorded as `liked` when the control actually flipped to
  "Unlike".** An unconfirmed click is recorded `failed`.
- **A dry run writes nothing at all** to the history.
- **Malformed JSON is quarantined**, not fatal: the bad file is renamed to
  `*.corrupt-<timestamp>` and the run continues with a fresh history.
- Contains only public post URLs — no cookies, tokens or credentials.

`logs/instagram-worker.log` records every profile with timestamp, username,
profile URL, post id and URL, action, result and reason.

## Layout

| File | Role |
|---|---|
| `runEngagementWorker.ts` | CLI, run loop, totals |
| `processProfile.ts` | Per-profile decision logic (no Playwright — unit tested) |
| `activityStore.ts` | JSON history: load, atomic save, corruption recovery |
| `instagramPage.ts` | **Every Instagram selector**, page-state detection, driver |
| `instagramBrowser.ts` | Session: CDP attach or persistent profile |
| `launchChrome.ts` | Starts a normal Chrome with a debugging port |
| `queue.ts` | `next` / `record` / `status` for hand-driven work |
| `acknowledge.ts` | Silence a profile's known, expected unreadability |
| `runDigest.ts` | Read-only sweep; writes the Markdown digest |
| `digestReport.ts` | Digest classification and report rendering (pure) |
| `profileSource.ts` | Database query, handle normalization |
| `workerLogger.ts` | Run log + console output |
| `signIn.ts` | One-time manual sign-in helper |
| `verifyDriverAgainstFixtures.ts` | Selector harness against local fixtures |

If Instagram changes its UI, `instagramPage.ts` is the only file that should
need editing.

## Notes on the data

The `artists.instagram` column is free text holding three shapes — bare
handles, full URLs, and `@handle`. `normalizeHandle` reduces all of them to a
bare lowercase handle, which doubles as the history key. Values that cannot be
read as a handle are reported and skipped. Two artists currently share the
handle `jnmusicgroup`; duplicates are collapsed so the profile is visited once.

## Tests

`tests/instagram/` runs under the normal `npm test` and needs no browser:

- `activityStore.test.ts` — persistence, corruption, handle/post-id parsing
- `processProfile.test.ts` — per-profile decisions against a scripted driver
- `runWorker.test.ts` — the real run loop end to end: first run, re-run skips,
  new post re-eligibility, crash mid-run, failed-post retry, fatal abort,
  and that consecutive bounded runs advance through the catalogue
- `digest.test.ts` — digest classification, report rendering, and that a
  digest observation never suppresses a later like
