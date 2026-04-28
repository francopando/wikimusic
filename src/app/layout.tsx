import "./globals.css";
import type { Metadata } from "next";
import { Outfit } from "next/font/google";

// Configure the Outfit font
const outfit = Outfit({
  subsets: ["latin"],
  display: "swap",
  variable: "--font-outfit",
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
    <html lang="en" className={outfit.variable}>
      <body className={`${outfit.className} min-h-screen bg-[#FBFBFD] text-[#1d1d1f] antialiased`}>
        {/* Subtle background glow to give it depth across all pages */}
        <div className="fixed inset-0 -z-10 overflow-hidden pointer-events-none">
          <div className="absolute -top-[10%] -right-[10%] w-[40%] h-[40%] bg-pink-50/50 blur-[120px] rounded-full" />
        </div>
        
        {children}
      </body>
    </html>
  );
}