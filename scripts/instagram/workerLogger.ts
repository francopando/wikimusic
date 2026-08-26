// Console progress plus an append-only run log at logs/instagram-worker.log.
//
// The log line is deliberately flat key=value text: greppable, diffable, and
// readable without tooling. It never contains session data.

import { appendFile, mkdir } from "node:fs/promises";
import path from "node:path";

import type { PostResult } from "./types";

export type LogEntry = {
  username: string;
  profileUrl: string;
  postId?: string;
  postUrl?: string;
  action: string;
  result: PostResult | "dry_run" | "aborted";
  reason?: string;
};

export class WorkerLogger {
  private readonly filePath: string;
  private ready: Promise<void> | null = null;

  constructor(filePath: string) {
    this.filePath = filePath;
  }

  private async ensureDirectory(): Promise<void> {
    this.ready ??= mkdir(path.dirname(this.filePath), { recursive: true }).then(() => undefined);
    await this.ready;
  }

  /** Appends one structured line to the run log. */
  async log(entry: LogEntry): Promise<void> {
    const fields: Array<[string, string | undefined]> = [
      ["username", entry.username],
      ["profile", entry.profileUrl],
      ["post", entry.postId],
      ["post_url", entry.postUrl],
      ["action", entry.action],
      ["result", entry.result],
      ["reason", entry.reason],
    ];

    const line = fields
      .filter((pair): pair is [string, string] => pair[1] !== undefined && pair[1] !== "")
      .map(([key, value]) => `${key}=${quote(value)}`)
      .join(" ");

    await this.ensureDirectory();
    await appendFile(this.filePath, `${new Date().toISOString()} ${line}\n`, "utf8");
  }

  /** Writes a free-text marker (run start, run end, aborts). */
  async note(message: string): Promise<void> {
    await this.ensureDirectory();
    await appendFile(this.filePath, `${new Date().toISOString()} ${message}\n`, "utf8");
  }
}

/** Quotes only when a value contains whitespace, keeping lines easy to scan. */
function quote(value: string): string {
  const collapsed = value.replace(/\s+/g, " ").trim();
  return /\s/.test(collapsed) ? JSON.stringify(collapsed) : collapsed;
}

// --- Console output --------------------------------------------------------

export const console_ = {
  processing(username: string): void {
    console.log(`[PROCESSING] ${username}`);
  },
  newPost(username: string, postId: string): void {
    console.log(`[NEW POST] ${username} -> ${postId}`);
  },
  liked(username: string): void {
    console.log(`[LIKED] ${username}`);
  },
  alreadyLiked(username: string): void {
    console.log(`[ALREADY LIKED] ${username}`);
  },
  skipped(username: string, reason: string): void {
    console.log(`[SKIPPED] ${username} -> ${reason}`);
  },
  failed(username: string, reason: string): void {
    console.log(`[FAILED] ${username} -> ${reason}`);
  },
  wouldLike(username: string, postId: string): void {
    console.log(`[DRY RUN] ${username} -> would like ${postId}`);
  },
};
