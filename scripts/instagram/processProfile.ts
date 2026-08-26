// Per-profile decision logic, deliberately free of Playwright so the whole
// flow can be exercised in tests against a fake driver.

import { isPostAlreadyProcessed } from "./activityStore";
import {
  InstagramProfileError,
  type ActivityHistory,
  type InstagramDriver,
  type InstagramProfile,
  type LatestPost,
  type PostResult,
  type ProfileProblem,
} from "./types";

export type ProfileOutcome = {
  profile: InstagramProfile;
  result: PostResult;
  post?: LatestPost;
  reason?: string;
  /** True when the post was already recorded by an earlier run. */
  previouslyProcessed: boolean;
  /** True when a fatal condition means the run should stop entirely. */
  fatal: boolean;
  /** In dry-run mode, the action the worker would have taken. */
  wouldLike?: boolean;
};

export type ProcessOptions = {
  dryRun: boolean;
};

/**
 * Runs one profile through the pipeline: open, find newest post, consult the
 * history, check the liked state, like when needed.
 *
 * Never throws for ordinary profile problems — those become a recorded
 * outcome so the run continues with the next profile.
 */
export async function processProfile(
  driver: InstagramDriver,
  profile: InstagramProfile,
  history: ActivityHistory,
  options: ProcessOptions,
): Promise<ProfileOutcome> {
  const base = { profile, previouslyProcessed: false, fatal: false } as const;

  // Held outside the try so a failure after the post was identified is still
  // attributed to that post, which is what makes the retry post-granular.
  let identified: LatestPost | undefined;

  try {
    await driver.openProfile(profile.username);

    const post = await driver.findLatestPost();
    identified = post ?? undefined;

    if (!post) {
      return { ...base, result: "skipped", reason: "no usable post found" };
    }

    if (isPostAlreadyProcessed(history, profile.username, post.id)) {
      return { ...base, result: "skipped", post, previouslyProcessed: true, reason: "already processed" };
    }

    const alreadyLiked = await driver.isPostLiked(post);

    if (alreadyLiked) {
      return { ...base, result: "already_liked", post };
    }

    if (options.dryRun) {
      // Report only. Nothing is clicked and nothing is recorded as processed.
      return { ...base, result: "skipped", post, reason: "dry run", wouldLike: true };
    }

    const confirmed = await driver.likePost(post);

    if (!confirmed) {
      return {
        ...base,
        result: "failed",
        post,
        reason: "like click did not produce a confirmed liked state",
      };
    }

    return { ...base, result: "liked", post };
  } catch (error) {
    const problem = toProblem(error);

    return {
      ...base,
      result: "failed",
      ...(identified ? { post: identified } : {}),
      reason: `${problem.kind}: ${problem.message}`,
      fatal: problem.fatal,
    };
  }
}

function toProblem(error: unknown): ProfileProblem {
  if (error instanceof InstagramProfileError) return error.problem;

  const message = error instanceof Error ? error.message : String(error);
  const kind = /timeout/i.test(message) ? "timeout" : "unexpected_state";

  return { kind, message, fatal: false };
}
