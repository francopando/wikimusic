import "./globals.css";
import type { Metadata } from "next";
import { Outfit, Instrument_Serif } from "next/font/google";
import Navbar from "@/components/Navbar";

const outfit = Outfit({ subsets: ["latin"], variable: "--font-outfit" });
const instrumentSerif = Instrument_Serif({ subsets: ["latin"], weight: "400", variable: "--font-serif" });

export const metadata: Metadata = {
  title: "Dominican Music Database | domidb",
  description: "Explore artists and songs_old with lyrics, translations, and cultural notes.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${outfit.variable} ${instrumentSerif.variable}`} suppressHydrationWarning>
      <body className="min-h-screen relative font-outfit antialiased">
        {/* Dominican Flag-Inspired 4-Way Gradient with White Cross */}
        <div 
          className="fixed inset-0 -z-10 pointer-events-none"
          style={{
            background: 'linear-gradient(90deg, transparent 0%, #FFFFFF 25%, #FFFFFF 75%, transparent 100%), linear-gradient(180deg, transparent 0%, #FFFFFF 25%, #FFFFFF 75%, transparent 100%), radial-gradient(ellipse at 0% 0%, #0052CC 0%, transparent 30%), radial-gradient(ellipse at 100% 0%, #EF4444 0%, transparent 30%), radial-gradient(ellipse at 0% 100%, #EF4444 0%, transparent 30%), radial-gradient(ellipse at 100% 100%, #0052CC 0%, transparent 30%)',
            backgroundSize: '200% 200%',
          }}
        />
        
        <Navbar />
        
        <div className="pt-24">{children}</div>
      </body>
    </html>
  );
}