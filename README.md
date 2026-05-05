# 🎵 Dominican Music Database

A modern web application built to explore, preserve, and showcase **Dominican music culture**, including artists, genres, and musical history.

This project is designed with a clean UI, fast performance, and a scalable architecture.

---

## 📖 About the Project

The **Dominican Music Database** is a digital platform dedicated to cataloging and presenting Dominican music in an accessible and modern way.

The goal is to:
- 🎧 Discover Dominican artists and their work  
- 🎼 Explore genres and musical styles  
- 📚 Preserve cultural and musical heritage  
- ⚡ Provide a fast and intuitive user experience  

---

## ⚙️ Tech Stack

This project is built using modern web technologies:

- **Next.js 16** – Full-stack React framework with App Router  
- **React 19** – Component-based architecture  
- **TypeScript** – Type-safe development  
- **Tailwind CSS 4** – Utility-first styling system  
- **Supabase** – Backend-as-a-Service (PostgreSQL + Auth)  
- **Lucide React** – Modern icon library  

---

## ✨ Features

- 🔎 Fast search and browsing of artists and music  
- 🎧 Clean and modern UI design  
- 📱 Fully responsive (mobile + desktop)  
- 🧱 Modular and reusable components  
- ⚡ Optimized performance with Next.js  

---

## 🚀 Getting Started

Follow these steps to run the project locally:

### 1. Clone the repository
```bash
git clone https://github.com/francopando/domidb.git
cd domidb
```

### 2. Install dependencies
```bash
npm install
```

### 3. Set up environment variables

Create a `.env.local` file in the root directory with the following variables:

#### Frontend (Public)
```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

#### Backend/Seeding (Private)
```env
SUPABASE_URL=your_supabase_project_url
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

You can obtain these values from your Supabase project dashboard:
- Go to **Settings > API** in your Supabase project
- Find your project URL and API keys (Anon Key and Service Role Key)

### 4. Seed the database (optional)
```bash
npm run seed
```

This will populate the database with initial artist data.

### 5. Run the development server
```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

---

## 📦 Build and Deploy

### Build for production
```bash
npm run build
npm start
```