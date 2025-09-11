-- Supabase schema for Chalet Manager
create table if not exists owners (
  id serial primary key,
  name text not null,
  admin_share_percent numeric default 20
);

create table if not exists chalets (
  id serial primary key,
  name text not null,
  owner_id integer references owners(id),
  price numeric,
  capacity integer,
  description text
);

create table if not exists users (
  id serial primary key,
  username text,
  email text,
  role text default 'staff'
);

create table if not exists bookings (
  id serial primary key,
  chalet_id integer references chalets(id),
  user_name text,
  start_date date,
  end_date date,
  price_per_night numeric,
  channel text,
  deposit numeric,
  status text default 'confirmed'
);

create table if not exists expenses (
  id serial primary key,
  chalet_id integer references chalets(id),
  category text,
  amount numeric,
  date date default now(),
  note text
);