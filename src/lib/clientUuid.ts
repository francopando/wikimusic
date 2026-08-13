type BrowserCrypto = {
  randomUUID?: () => string;
  getRandomValues?: <T extends ArrayBufferView | null>(array: T) => T;
};

let fallbackCounter = 0;

function formatUuidV4(bytes: Uint8Array) {
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  const hex = Array.from(bytes, (byte) => byte.toString(16).padStart(2, "0")).join("");
  return `${hex.slice(0, 8)}-${hex.slice(8, 12)}-${hex.slice(12, 16)}-${hex.slice(16, 20)}-${hex.slice(20)}`;
}

function fillWithoutCrypto(bytes: Uint8Array) {
  // This path is only for legacy/non-browser test runtimes with no Web Crypto.
  // Time, a process-local counter, performance time, and Math.random are mixed;
  // Math.random is not the sole source of uniqueness.
  fallbackCounter = (fallbackCounter + 1) >>> 0;
  const time = Date.now();
  const performanceTime = Math.floor(globalThis.performance?.now?.() ?? 0);
  let state = (time ^ (time / 0x100000000) ^ performanceTime ^ fallbackCounter) >>> 0;
  for (let index = 0; index < bytes.length; index += 1) {
    state = (Math.imul(state ^ (state >>> 15), 2246822519) + index + fallbackCounter) >>> 0;
    bytes[index] = (state ^ Math.floor(Math.random() * 256)) & 0xff;
  }
  return bytes;
}

export function createClientUuid(cryptoSource: BrowserCrypto | undefined = globalThis.crypto) {
  if (typeof cryptoSource?.randomUUID === "function") {
    return cryptoSource.randomUUID();
  }

  const bytes = new Uint8Array(16);
  if (typeof cryptoSource?.getRandomValues === "function") {
    cryptoSource.getRandomValues(bytes);
  } else {
    fillWithoutCrypto(bytes);
  }
  return formatUuidV4(bytes);
}
