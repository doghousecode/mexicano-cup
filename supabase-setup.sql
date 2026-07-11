-- Cappuccino Cup — Supabase setup
-- Run this in Supabase → SQL Editor → New query → Run

create table tournaments (
  id         text primary key,
  target     int  not null default 12,
  round      int  not null default 0,
  status     text not null default 'setup',   -- setup | live | ended
  players    jsonb not null default '[]',
  active     jsonb not null default '[]',
  created_at timestamptz default now()
);

create table matches (
  tournament_id text not null references tournaments(id) on delete cascade,
  round   int  not null,
  court   int  not null,
  a1 text, a2 text, b1 text, b2 text,        -- team A / team B players
  score_a int, score_b int,                  -- null until entered
  primary key (tournament_id, round, court)
);

-- Realtime so every phone updates live
alter publication supabase_realtime add table tournaments;
alter publication supabase_realtime add table matches;

-- Open access (fine for a mates-only fun app; anyone with the anon key can read/write)
alter table tournaments enable row level security;
alter table matches      enable row level security;
create policy "open tournaments" on tournaments for all using (true) with check (true);
create policy "open matches"      on matches      for all using (true) with check (true);
