import assert from "node:assert/strict";
import { describe, it } from "node:test";

import { shareOrCopy, type SharePayload } from "../src/lib/share";

const payload: SharePayload = {
  title: "Profile | Mangulina",
  text: "Explore Profile on Mangulina.",
  url: "https://mangulina.do/artists/profile",
};

describe("shareOrCopy", () => {
  it("uses native sharing with the complete localized payload", async () => {
    let received: SharePayload | null = null;
    let copied = false;
    const outcome = await shareOrCopy(payload, {
      share: async (value) => { received = value; },
      copy: async () => { copied = true; return true; },
    });

    assert.equal(outcome, "shared");
    assert.deepEqual(received, payload);
    assert.equal(copied, false);
  });

  it("copies the canonical URL when native sharing is unavailable", async () => {
    let copiedUrl = "";
    const outcome = await shareOrCopy(payload, {
      copy: async (url) => { copiedUrl = url; return true; },
    });

    assert.equal(outcome, "copied");
    assert.equal(copiedUrl, payload.url);
  });

  it("treats native share cancellation as a no-op", async () => {
    let copied = false;
    const outcome = await shareOrCopy(payload, {
      share: async () => { throw new DOMException("Cancelled", "AbortError"); },
      copy: async () => { copied = true; return true; },
    });

    assert.equal(outcome, "cancelled");
    assert.equal(copied, false);
  });

  it("falls back after a real native failure and fails gracefully if copying also fails", async () => {
    const copied = await shareOrCopy(payload, {
      share: async () => { throw new Error("Share failed"); },
      copy: async () => true,
    });
    const failed = await shareOrCopy(payload, {
      share: async () => { throw new Error("Share failed"); },
      copy: async () => { throw new Error("Copy failed"); },
    });

    assert.equal(copied, "copied");
    assert.equal(failed, "failed");
  });
});
