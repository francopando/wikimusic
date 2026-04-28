/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        // This matches the variable name we set in layout.tsx
        outfit: ["var(--font-outfit)", "sans-serif"],
      },
    },
  },
  plugins: [],
};