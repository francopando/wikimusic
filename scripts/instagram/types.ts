// Shared types for the Instagram engagement worker.
//
// The worker's persistent memory is keyed by POST, not by profile, so a
// profile becomes eligible again as soon as it publishes something new.

/** Outcome recorded for a single post. */
export type PostResult = "liked" | "already_liked" | "skipped" | "failed";

/** One post the worker has seen, stored under its Instagram shortcode. */
export type PostRecord = {
  url: string;
  result: PostResult;
  processed_at: string;
  /** Present for `failed`/`skipped` so a later run can see what went wrong. */
  reason?: string;
};

/**
 * Profile-level outcome for runs that never reached a post (private account,
 * deleted profile, no posts yet). Kept beside `posts` so the post map only
 * ever contains real post identifiers.
 */
export type ProfileAttempt = {
  result: PostResult;
  reason?: string;
  at: string;
};

/**
 * The newest post seen by the most recent digest sweep. Deliberately separate
 * from `posts`: a digest only *looks*, so observing a post must never mark it
 * as handled and suppress a later like.
 */
export type DigestObservation = {
  post_id: string;
  url: string;
  at: string;
};

/** The most recent reason a sweep could not read a profile. */
export type ProfileProblemRecord = {
  kind: string;
  message: string;
  at: string;
};

/**
 * A known, expected reason a profile cannot be read — "this account is private
 * and my follow request is pending", "this artist genuinely has no posts".
 *
 * Acknowledging suppresses that ONE problem. If the profile later fails for a
 * different reason, or starts working, it surfaces again: the point is to
 * silence steady state, never to stop watching.
 */
export type Acknowledgement = {
  /** The problem kind this covers. A different kind still reports. */
  kind: string;
  note?: string;
  at: string;
};

export type ProfileRecord = {
  posts: Record<string, PostRecord>;
  last_attempt?: ProfileAttempt;
  last_digest?: DigestObservation;
  last_problem?: ProfileProblemRecord;
  acknowledged?: Acknowledgement;
  /**
   * When this profile was last opened, whatever the outcome. Drives the
   * round-robin queue: a profile's newest post is only knowable by visiting,
   * so the queue orders by "least recently looked at" rather than trying to
   * predict which profiles have something new.
   */
  last_seen_at?: string;
};

export type ActivityHistory = Record<string, ProfileRecord>;

/** A profile to process, sourced from the existing `artists` table. */
export type InstagramProfile = {
  artistId: string;
  artistName: string;
  slug: string;
  /** Lowercased canonical handle — also the activity-history key. */
  username: string;
  profileUrl: string;
};

/** A post identified on a profile page. */
export type LatestPost = {
  /** Instagram shortcode, e.g. `DAbc123XyZ`. Stable across sessions. */
  id: string;
  url: string;
  /** True when the grid marked this entry as pinned. */
  pinned: boolean;
};

/**
 * Why a profile could not be processed. `fatal` reasons stop the whole run
 * because they will repeat for every remaining profile.
 */
export type ProfileProblem = {
  kind:
    | "private"
    | "restricted"
    | "unavailable"
    | "no_posts"
    | "posts_hidden"
    | "post_unreadable"
    | "navigation"
    | "timeout"
    | "unexpected_state"
    | "login_required"
    | "challenge";
  message: string;
  fatal: boolean;
};

export class InstagramProfileError extends Error {
  readonly problem: ProfileProblem;

  constructor(problem: ProfileProblem) {
    super(problem.message);
    this.name = "InstagramProfileError";
    this.problem = problem;
  }
}

/**
 * The browser-facing surface the worker depends on. Keeping it an interface
 * lets the run loop be tested without launching Instagram, and keeps every
 * Instagram selector inside the one module that implements it.
 */
export interface InstagramDriver {
  openProfile(username: string): Promise<void>;
  findLatestPost(): Promise<LatestPost | null>;
  isPostLiked(post: LatestPost): Promise<boolean>;
  likePost(post: LatestPost): Promise<boolean>;
}
