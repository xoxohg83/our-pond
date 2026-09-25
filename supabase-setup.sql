-- =============================================================
-- OUR ENCHANTED POND: paste all of this into Supabase > SQL Editor > New query, then Run.
-- =============================================================

-- 1. Our dates (adventures)
create table if not exists public.dates (
  id          uuid primary key default gen_random_uuid(),
  title       text not null,
  when_at     timestamptz,
  place       text default '',
  note        text default '',
  kind        text not null default 'together' check (kind in ('together','surprise')),
  planner     text default '',
  clues       text default '',
  created_at  timestamptz not null default now()
);

-- 2. Our memories (photos)
create table if not exists public.memories (
  id          uuid primary key default gen_random_uuid(),
  caption     text default '',
  photo_path  text not null,
  date_id     uuid references public.dates(id) on delete set null,
  taken_on    date,
  added_by    text default '',
  created_at  timestamptz not null default now()
);

-- 3. Only a signed-in pond account can read or change anything
alter table public.dates    enable row level security;
alter table public.memories enable row level security;

drop policy if exists "pond dates" on public.dates;
create policy "pond dates" on public.dates for all to authenticated using (true) with check (true);
drop policy if exists "pond memories" on public.memories;
create policy "pond memories" on public.memories for all to authenticated using (true) with check (true);

-- 4. A private photo bucket
insert into storage.buckets (id, name, public) values ('photos','photos',false)
on conflict (id) do nothing;

drop policy if exists "pond photos read" on storage.objects;
create policy "pond photos read" on storage.objects for select to authenticated using (bucket_id = 'photos');
drop policy if exists "pond photos add" on storage.objects;
create policy "pond photos add" on storage.objects for insert to authenticated with check (bucket_id = 'photos');
drop policy if exists "pond photos remove" on storage.objects;
create policy "pond photos remove" on storage.objects for delete to authenticated using (bucket_id = 'photos');

-- 5. Our first adventures (add the dates later in the Calendar tab)
insert into public.dates (title, kind, planner, created_at)
select * from (values
  ('Amusement park','together','Xo', now() - interval '3 days'),
  ('Stand-up comedy','together','Xo', now() - interval '2 days'),
  ('Dancing','together','Xo', now() - interval '1 day')
) v(title, kind, planner, created_at)
where not exists (select 1 from public.dates);
