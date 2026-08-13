export async function readApiJson<T>(
  response: Response,
  endpointLabel: string,
): Promise<T> {
  const contentType = response.headers.get("content-type") ?? "";
  if (!contentType.toLowerCase().includes("application/json")) {
    const body = await response.text().catch(() => "");
    const detail = body.trim().replace(/\s+/g, " ").slice(0, 200);
    return {
      ok: false,
      error: `${endpointLabel} returned ${response.status} ${response.statusText || "HTTP error"} as ${contentType || "an unknown content type"}${detail ? `: ${detail}` : ""}`,
    } as T;
  }

  try {
    return (await response.json()) as T;
  } catch {
    return {
      ok: false,
      error: `${endpointLabel} returned malformed JSON (${response.status} ${response.statusText || "HTTP response"}).`,
    } as T;
  }
}
