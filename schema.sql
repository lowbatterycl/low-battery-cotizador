-- LowBattery: schema inicial Supabase. Ejecutar en SQL Editor de Supabase.
create table if not exists public.requests (
 id uuid primary key default gen_random_uuid(),
 created_at timestamptz not null default now(),
 name text not null,
 contact_type text not null check(contact_type in ('WhatsApp','Instagram')),
 contact text not null,
 model text not null,
 storage text not null,
 battery integer not null check(battery between 1 and 100),
 issues text[] not null default '{}',
 extra_message text,
 photo_paths text[] not null default '{}',
 offer_clp integer,
 status text not null default 'Pendiente' check(status in ('Pendiente','Evaluado','Oferta enviada','Vendido','Rechazado')),
 admin_notes text
);
alter table public.requests enable row level security;
-- Public can submit a request, but cannot read, update or delete requests.
create policy "public insert requests" on public.requests for insert to anon with check (true);
-- Only the designated administrator can read and manage submissions.
create policy "admin read requests" on public.requests for select to authenticated using (auth.jwt()->>'email' = 'lyonsamuel11@gmail.com');
create policy "admin update requests" on public.requests for update to authenticated using (auth.jwt()->>'email' = 'lyonsamuel11@gmail.com') with check (auth.jwt()->>'email' = 'lyonsamuel11@gmail.com');
create policy "admin delete requests" on public.requests for delete to authenticated using (auth.jwt()->>'email' = 'lyonsamuel11@gmail.com');
-- Storage bucket for photos (private bucket)
insert into storage.buckets(id,name,public) values('request-photos','request-photos',false) on conflict(id) do nothing;
create policy "public upload request photos" on storage.objects for insert to anon with check (bucket_id='request-photos');
create policy "admin view request photos" on storage.objects for select to authenticated using (bucket_id='request-photos' and auth.jwt()->>'email'='lyonsamuel11@gmail.com');
