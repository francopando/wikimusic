import { defineRouting } from "next-intl/routing";

export const LOCALE_COOKIE_NAME = "mangulina_locale";
export const LOCALE_COOKIE_MAX_AGE = 365 * 24 * 60 * 60;

export const routing = defineRouting({
  locales: ["en", "es"],
  defaultLocale: "en",
  // English keeps clean URLs (/artists); Spanish is prefixed (/es/artists).
  localePrefix: "as-needed",
  // The URL is the single source of truth. The cookie only remembers a
  // preference for the switcher — it must never trigger an automatic redirect.
  localeDetection: false,
  // The client-side language switcher remembers the preference. Public page
  // responses must not vary by or write cookies so Vercel can cache each URL.
  localeCookie: false,
});

export type AppLocale = (typeof routing.locales)[number];
