-- Выполните в Supabase: SQL Editor -> New query -> Run
create table if not exists rz (
  id text primary key,
  coll text not null,
  data jsonb not null,
  u bigint not null
);
create index if not exists rz_u_idx on rz (u);
alter table rz enable row level security;
drop policy if exists "rz_open" on rz;
create policy "rz_open" on rz for all to anon using (true) with check (true);
