-- Kitchen Hub: database setup
-- Paste this whole file into Supabase > SQL Editor > New query, then click Run.
-- Safe to run more than once. It only creates new "kh_" tables, so anything
-- left over from the old Kitchen Hub in this project is not touched.

-- Who is allowed in (filled in by 2-household.sql)
create table if not exists public.kh_household (
  email text primary key
);

create table if not exists public.kh_items (
  id         text primary key default gen_random_uuid()::text,
  name       text not null,
  location   text not null default 'Pantry',
  category   text not null default 'Other',
  qty        text not null default '',
  status     text not null default 'In stock' check (status in ('In stock','Low','Out')),
  notes      text not null default '',
  updated_at timestamptz not null default now()
);

create table if not exists public.kh_extras (
  id         text primary key default gen_random_uuid()::text,
  name       text not null,
  created_at timestamptz not null default now()
);

create table if not exists public.kh_meals (
  id         text primary key default gen_random_uuid()::text,
  type       text not null default 'Dinner' check (type in ('Breakfast','Lunch','Dinner')),
  name       text not null,
  kids       text not null default '',
  adults     text not null default '',
  uses       text not null default '',
  sort_order integer not null default 999
);

-- Is the signed-in person on the household list?
create or replace function public.kh_is_member()
returns boolean
language sql stable security definer
set search_path = public
as $$
  select exists (
    select 1 from public.kh_household
    where lower(email) = lower(auth.jwt() ->> 'email')
  );
$$;
revoke all on function public.kh_is_member() from public;
grant execute on function public.kh_is_member() to authenticated;

-- Lock every table. Only signed-in household members can read or change data.
alter table public.kh_household enable row level security;  -- no policies: only editable from the dashboard
alter table public.kh_items     enable row level security;
alter table public.kh_extras    enable row level security;
alter table public.kh_meals     enable row level security;

drop policy if exists "household members" on public.kh_items;
create policy "household members" on public.kh_items
  for all to authenticated using (public.kh_is_member()) with check (public.kh_is_member());

drop policy if exists "household members" on public.kh_extras;
create policy "household members" on public.kh_extras
  for all to authenticated using (public.kh_is_member()) with check (public.kh_is_member());

drop policy if exists "household members" on public.kh_meals;
create policy "household members" on public.kh_meals
  for all to authenticated using (public.kh_is_member()) with check (public.kh_is_member());

-- Live updates, so changes on one phone show up on the other
do $$
declare t text;
begin
  foreach t in array array['kh_items','kh_extras','kh_meals'] loop
    begin
      execute format('alter publication supabase_realtime add table public.%I', t);
    exception when duplicate_object then null;
    end;
  end loop;
end $$;
