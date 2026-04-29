import "./globals.css";
import type { Metadata } from "next";
import { Outfit, Instrument_Serif } from "next/font/google";

const outfit = Outfit({
  subsets: ["latin"],
  variable: "--font-outfit",
});

const instrumentSerif = Instrument_Serif({
  subsets: ["latin"],
  weight: "400",
  variable: "--font-serif",
});

export const metadata: Metadata = {
  title: "Dominican Music Database | Wikimusic",
  description: "Explore artists and songs with lyrics, translations, and cultural notes.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${outfit.variable} ${instrumentSerif.variable}`} suppressHydrationWarning>
      <body className="min-h-screen relative font-outfit">
        {/* Subtle Textured Background */}
        <div className="fixed inset-0 -z-10 overflow-hidden pointer-events-none opacity-40">
          <div className="absolute top-[-10%] right-[-5%] w-[50%] h-[50%] bg-red-200/20 blur-[140px] rounded-full" />
          <div className="absolute bottom-[-10%] left-[-5%] w-[40%] h-[40%] bg-slate-200/40 blur-[120px] rounded-full" />
        </div>
        {children}
      </body>
    </html>
  );
}