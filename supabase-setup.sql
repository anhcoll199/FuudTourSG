-- Chạy toàn bộ file này trong Supabase: SQL Editor > New query > Run

create table if not exists public.quan_an (
  id          uuid primary key default gen_random_uuid(),
  ten_quan    text not null,
  dia_chi     text not null,
  quan        text not null,
  ten_mon     text not null,
  gia_tu      integer not null check (gia_tu >= 0),
  gia_den     integer not null check (gia_den >= gia_tu),
  gio_mo      time not null,
  gio_dong    time not null,
  created_at  timestamptz not null default now()
);

alter table public.quan_an enable row level security;

drop policy if exists "quan_an_select" on public.quan_an;
drop policy if exists "quan_an_insert" on public.quan_an;
drop policy if exists "quan_an_update" on public.quan_an;
drop policy if exists "quan_an_delete" on public.quan_an;

create policy "quan_an_select" on public.quan_an for select to anon using (true);
create policy "quan_an_insert" on public.quan_an for insert to anon with check (true);
create policy "quan_an_update" on public.quan_an for update to anon using (true) with check (true);
create policy "quan_an_delete" on public.quan_an for delete to anon using (true);
