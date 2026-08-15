import { Analytics } from "@vercel/analytics/react";
import { SpeedInsights } from "@vercel/speed-insights/next";

import RoutePageView from "@/components/analytics/RoutePageView";
import GradientBackground from "@/components/atoms/GradientBackground";

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
    >
      <body className="min-h-screen font-sans antialiased">
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
