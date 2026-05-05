require("dotenv").config({ path: ".env.local" });

const { createClient } = require("@supabase/supabase-js");

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const artists = [
  "Juan Luis Guerra",
  "Romeo Santos",
  "Aventura",
  "Zion & Lennox",
  "Natti Natasha",
];

async function seed() {
  console.log("Starting seed...");

  // 1. INSERT artists (more stable than upsert for seed)
const { data: artistRows, error: artistError } = await supabase
  .from("artists")
  .upsert(
    artists.map(name => ({ name })),
    { onConflict: "name" }
  )
  .select();

  if (artistError) {
    console.error("Artist insert error:", artistError);
    return;
  }

  if (!artistRows || artistRows.length === 0) {
    console.error("No artists returned. Check RLS or table policies.");
    return;
  }

  console.log("Artists inserted:", artistRows.length);

  // 2. Create recordings
  for (let i = 1; i <= 100; i++) {
    const artist = artistRows[i % artistRows.length];

    const { data: work, error: workError } = await supabase
      .from("works")
      .insert({ title: `Song ${i}` })
      .select()
      .single();

    if (workError || !work) {
      console.error("Work error:", workError);
      continue;
    }

    const { data: recording, error: recError } = await supabase
      .from("recordings")
      .insert({
        title: `Recording ${i}`,
        work_id: work.id,
      })
      .select()
      .single();

    if (recError || !recording) {
      console.error("Recording error:", recError);
      continue;
    }

    const { error: creditError } = await supabase
      .from("recording_credits")
      .insert({
        recording_id: recording.id,
        artist_id: artist.id,
        role: "main",
      });

    if (creditError) {
      console.error("Credit error:", creditError);
    }
  }

  console.log("Seed complete ✔");
}

seed();