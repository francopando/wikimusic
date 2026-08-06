const HTTP_PROTOCOLS = new Set(["http:", "https:"]);

export function normalizeEditorialLink(value: string): string | null {
  const trimmed = value.trim();
  if (!trimmed || /[\u0000-\u001f\u007f]/.test(trimmed)) return null;
  const candidate = /^[a-z][a-z\d+.-]*:/i.test(trimmed) ? trimmed : `https://${trimmed}`;
  try {
    const url = new URL(candidate);
    return HTTP_PROTOCOLS.has(url.protocol) && url.hostname ? url.href : null;
  } catch {
    return null;
  }
}
