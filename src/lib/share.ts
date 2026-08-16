export type SharePayload = {
  title: string;
  text: string;
  url: string;
};

export type ShareOutcome = "shared" | "copied" | "cancelled" | "failed";

type ShareDependencies = {
  share?: (payload: SharePayload) => Promise<void>;
  copy: (url: string) => Promise<boolean>;
};

function isShareCancellation(error: unknown): boolean {
  return error instanceof DOMException && error.name === "AbortError";
}

export async function shareOrCopy(
  payload: SharePayload,
  { share, copy }: ShareDependencies,
): Promise<ShareOutcome> {
  if (share) {
    try {
      await share(payload);
      return "shared";
    } catch (error) {
      if (isShareCancellation(error)) return "cancelled";
    }
  }

  try {
    return await copy(payload.url) ? "copied" : "failed";
  } catch {
    return "failed";
  }
}
