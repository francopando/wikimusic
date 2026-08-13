import assert from "node:assert/strict";
import test from "node:test";

import { readApiJson } from "../src/lib/clientApiResponse";

test("readApiJson parses JSON responses", async () => {
  const result = await readApiJson<{ ok: true; value: number }>(
    new Response(JSON.stringify({ ok: true, value: 7 }), {
      status: 200,
      headers: { "content-type": "application/json; charset=utf-8" },
    }),
    "Test endpoint",
  );

  assert.deepEqual(result, { ok: true, value: 7 });
});

test("readApiJson turns non-JSON responses into controlled API errors", async () => {
  const result = await readApiJson(
    new Response("Server action not found.", {
      status: 404,
      statusText: "Not Found",
      headers: { "content-type": "text/plain" },
    }),
    "Image upload endpoint",
  );

  assert.deepEqual(result, {
    ok: false,
    error: "Image upload endpoint returned 404 Not Found as text/plain: Server action not found.",
  });
});

test("readApiJson turns malformed JSON into a controlled API error", async () => {
  const result = await readApiJson(
    new Response("<html>", {
      status: 500,
      statusText: "Internal Server Error",
      headers: { "content-type": "application/json" },
    }),
    "Genres endpoint",
  );

  assert.deepEqual(result, {
    ok: false,
    error: "Genres endpoint returned malformed JSON (500 Internal Server Error).",
  });
});
