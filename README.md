# Mexicano Cup 🎾☕

A live, shared padel scoreboard for Mexicano-format tournaments. Every court enters
their own scores on their own phone; standings sync live via Supabase. Refresh-proof.

## Format
- Individual points scoring — you win points *for yourself* each round with a rotating partner.
- 12 points per game (each player serves 3 → team scores always sum to 12).
- After each round, pairings re-seed by standings (top + bottom vs the two middle).
- Highest individual total wins. 👑

## Setup

### 1. Supabase
1. Create a project (Free tier is fine).
2. SQL Editor → New query → paste `supabase-setup.sql` → Run.
3. Settings → API → copy your **Project URL** and **anon public** key.

### 2. Wire the app
In `index.html`, replace:
```js
const SUPABASE_URL  = 'PASTE_YOUR_PROJECT_URL';
const SUPABASE_ANON = 'PASTE_YOUR_ANON_KEY';
```

### 3. Deploy
- **GitHub Pages** (free): push repo → Settings → Pages → deploy from `main`/root.
- Point a Porkbun domain via CNAME → `doghousecode.github.io`.

## Play
Open the live URL → **Create new tournament** → share the `?t=CODE` link with the crew.
Each court taps their own score. Anyone can advance rounds or end the tournament.

## Notes
- The anon key is public by design (safe to commit). **Never** commit the service_role key.
- RLS is wide open — fine for a mates-only app, don't reuse this project for anything sensitive.
- Free Supabase projects auto-pause after 7 days idle; just un-pause before the next game.
