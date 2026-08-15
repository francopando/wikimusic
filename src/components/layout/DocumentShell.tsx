import { Analytics } from "@vercel/analytics/react";
import { SpeedInsights } from "@vercel/speed-insights/next";
import { Finlandica_Text, Instrument_Serif, Inter } from "next/font/google";

import RoutePageView from "@/components/analytics/RoutePageView";
import GradientBackground from "@/components/atoms/GradientBackground";

const finlandica = Finlandica_Text({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  variable: "--font-finlandica",
});

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
  preload: false,
});

const instrumentSerif = Instrument_Serif({
  subsets: ["latin"],
  weight: "400",
  variable: "--font-serif",
  preload: false,
});

export default function DocumentShell({
  children,
  lang,
}: {
  children: React.ReactNode;
  lang: "en" | "es";
}) {
  return (
    <html
      lang={lang}
      suppressHydrationWarning
      className={`${finlandica.variable} ${inter.variable} ${instrumentSerif.variable}`}
    >
      <body className={`${finlandica.className} antialiased min-h-screen`}>
        <GradientBackground />

        <div
          className="fixed inset-0 -z-20 pointer-events-none"
          style={{
            background: `
              linear-gradient(135deg, rgba(0, 45, 98, 0.08) 0%, transparent 35%),
              linear-gradient(45deg, transparent 65%, rgba(206, 17, 38, 0.08) 100%),
              radial-gradient(ellipse at 50% 0%, rgba(0, 45, 98, 0.12) 0%, transparent 50%),
              radial-gradient(ellipse at 100% 100%, rgba(206, 17, 38, 0.12) 0%, transparent 50%)
            `,
          }}
        />

        <RoutePageView />
        {children}

        {process.env.NODE_ENV === "production" && <Analytics />}
        {process.env.NODE_ENV === "production" && <SpeedInsights />}
      </body>
    </html>
  );
}
