// Classification and report rendering for the digest sweep.
//
// Kept free of Playwright and the filesystem so the interesting logic —
// "is this post new since we last looked?" — is unit tested directly.

import type { ActivityHistory, InstagramProfile, LatestPost } from "./types";

export type DigestStatus = "new_post" | "unchanged" | "problem" | "known";

export type DigestEntry = {
  artist: string;
  slug: string;
  username: string;
  profileUrl: string;
  status: DigestStatus;
  post?: LatestPost;
  /** Set when status is "problem" or "known". */
  problem?: string;
  /** The problem's kind, used to decide whether an acknowledgement still holds. */
  problemKind?: string;
  /** Note recorded when the problem was acknowledged. */
  acknowledgedNote?: string;
  /** True when a previously acknowledged profile became readable again. */
  acknowledgementCleared?: boolean;
  /** True when the newest post was already liked by a previous worker run. */
  alreadyHandled: boolean;
};

/** Results that mean a post has already been dealt with by the liking worker. */
const HANDLED = new Set(["liked", "already_liked"]);

/**
 * Decides how a profile's newest post should be reported.
 *
 * "New" means: we have not reported this exact post in a previous digest.
 * A post already liked by the worker is still reported as new the first time
 * a digest sees it, but flagged as handled so you know there is nothing to do.
 */
export function classifyProfile(
  profile: InstagramProfile,
  post: LatestPost | null,
  history: ActivityHistory,
  problem?: { kind: string; message: string },
): DigestEntry {
  const entry = history[profile.username];
  const base = {
    artist: profile.artistName,
    slug: profile.slug,
    username: profile.username,
    profileUrl: profile.profileUrl,
    alreadyHandled: false,
  };

  // A profile that could not be read, either because the driver reported a
  // problem or because no post was found at all.
  const failure = problem ?? (post ? null : { kind: "no_posts", message: "no usable post found" });

  if (failure) {
    const ack = entry?.acknowledged;
    // The acknowledgement covers one specific problem. A different problem is
    // a change in state and must still be reported.
    const stillKnown = ack !== undefined && ack.kind === failure.kind;

    return {
      ...base,
      status: stillKnown ? "known" : "problem",
      problem: failure.message,
      problemKind: failure.kind,
      ...(stillKnown && ack.note ? { acknowledgedNote: ack.note } : {}),
    };
  }

  if (!post) {
    // Unreachable given the branch above, but keeps the types honest.
    return { ...base, status: "problem", problem: "no usable post found", problemKind: "no_posts" };
  }

  const alreadyHandled = HANDLED.has(entry?.posts[post.id]?.result ?? "");
  const seenInLastDigest = entry?.last_digest?.post_id === post.id;

  return {
    ...base,
    post,
    alreadyHandled,
    status: seenInLastDigest ? "unchanged" : "new_post",
    // A profile that is readable again has outlived its acknowledgement.
    ...(entry?.acknowledged ? { acknowledgementCleared: true } : {}),
  };
}

export type DigestSummary = {
  generatedAt: string;
  scanned: number;
  newPosts: number;
  unchanged: number;
  problems: number;
  known: number;
  entries: DigestEntry[];
};

export function summarize(entries: DigestEntry[], generatedAt: string): DigestSummary {
  return {
    generatedAt,
    scanned: entries.length,
    newPosts: entries.filter((entry) => entry.status === "new_post").length,
    unchanged: entries.filter((entry) => entry.status === "unchanged").length,
    problems: entries.filter((entry) => entry.status === "problem").length,
    known: entries.filter((entry) => entry.status === "known").length,
    entries,
  };
}

/** Renders the digest as Markdown, sorted so the actionable part comes first. */
export function renderMarkdown(summary: DigestSummary): string {
  const date = summary.generatedAt.slice(0, 10);
  const lines: string[] = [];

  lines.push(`# Instagram digest — ${date}`);
  lines.push("");
  lines.push(
    "Read-only sweep of artist Instagram profiles. One page view per artist; " +
      "no posts were opened, and **nothing was liked**.",
  );
  lines.push("");
  lines.push(`- Profiles scanned: **${summary.scanned}**`);
  lines.push(`- Artists with a new post: **${summary.newPosts}**`);
  lines.push(`- Unchanged since last digest: **${summary.unchanged}**`);
  lines.push(`- Profiles needing attention: **${summary.problems}**`);
  if (summary.known > 0) {
    lines.push(`- Known unreadable (acknowledged): ${summary.known}`);
  }
  lines.push("");

  // A profile that recovered is news, and the loudest thing in the report.
  const recovered = summary.entries.filter((entry) => entry.acknowledgementCleared);

  if (recovered.length > 0) {
    lines.push("## Readable again");
    lines.push("");
    lines.push(
      "These were acknowledged as unreadable and now return posts. Their " +
        "acknowledgements have been cleared.",
    );
    lines.push("");

    for (const entry of recovered) {
      lines.push(`- **${entry.artist}** ([\`${entry.username}\`](${entry.profileUrl}))`);
    }

    lines.push("");
  }

  const fresh = summary.entries
    .filter((entry) => entry.status === "new_post")
    .sort((a, b) => a.artist.localeCompare(b.artist));

  if (fresh.length > 0) {
    lines.push("## New posts");
    lines.push("");
    lines.push("| Artist | Handle | Post | Note |");
    lines.push("|---|---|---|---|");

    for (const entry of fresh) {
      const note = entry.alreadyHandled ? "already liked" : entry.post?.pinned ? "pinned" : "";
      lines.push(
        `| ${entry.artist} | [\`${entry.username}\`](${entry.profileUrl}) | [${entry.post?.id}](${entry.post?.url}) | ${note} |`,
      );
    }

    lines.push("");
  }

  const problems = summary.entries
    .filter((entry) => entry.status === "problem")
    .sort((a, b) => a.artist.localeCompare(b.artist));

  if (problems.length > 0) {
    lines.push("## Profiles needing attention");
    lines.push("");
    lines.push("These handles could not be read. Worth checking the value stored on the artist.");
    lines.push("");
    lines.push("| Artist | Handle | Problem |");
    lines.push("|---|---|---|");

    for (const entry of problems) {
      lines.push(
        `| ${entry.artist} | [\`${entry.username}\`](${entry.profileUrl}) | ${entry.problem ?? "unknown"} |`,
      );
    }

    lines.push("");
  }

  const known = summary.entries
    .filter((entry) => entry.status === "known")
    .sort((a, b) => a.artist.localeCompare(b.artist));

  if (known.length > 0) {
    lines.push("<details>");
    lines.push(`<summary>Known unreadable — ${known.length} acknowledged, no action needed</summary>`);
    lines.push("");
    lines.push("| Artist | Handle | Reason | Acknowledged as |");
    lines.push("|---|---|---|---|");

    for (const entry of known) {
      lines.push(
        `| ${entry.artist} | [\`${entry.username}\`](${entry.profileUrl}) | ` +
          `${entry.problemKind ?? "unknown"} | ${entry.acknowledgedNote ?? "—"} |`,
      );
    }

    lines.push("");
    lines.push("</details>");
    lines.push("");
  }

  if (fresh.length === 0 && problems.length === 0) {
    lines.push("Nothing new since the last digest.");
    lines.push("");
  }

  return lines.join("\n");
}
