--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe


create table galaxy (
  galaxy_id serial primary key,
  name varchar(40) not null unique,
  age_in_millions_of_years int,
  has_life boolean,
  has_water boolean,
  description text
);

create table star (
  star_id serial primary key,
  name varchar(40) not null unique,
  age_in_millions_of_years int,
  has_life boolean,
  has_water boolean,
  description text,
  distance_from_earth numeric
);

create table planet (
  planet_id serial primary key,
  name varchar(40) not null unique,
  age_in_millions_of_years int,
  has_life boolean,
  has_water boolean,
  description text,
  distance_from_earth numeric
);

create table moon (
  moon_id serial primary key,
  name varchar(40) not null unique,
  age_in_millions_of_years int,
  has_life boolean,
  has_water boolean,
  description text,
  distance_from_earth numeric
);

create table black_hole (
  black_hole_id serial primary key,
  name varchar(40) not null unique,
  age_in_millions_of_years int,
  description text,
  distance_from_earth numeric
);

alter table star
add column galaxy_id int;

alter table planet
add column star_id int;

alter table moon
add column planet_id int;

alter table star
add constraint fk_star_galaxy_id foreign key (galaxy_id)
references galaxy (galaxy_id);

alter table planet
add constraint fk_planet_star_id foreign key (star_id)
references star (star_id);

alter table moon
add constraint fk_moon_planet_id foreign key (planet_id)
references planet (planet_id);

insert into galaxy (name, age_in_millions_of_years, has_life, has_water, description)
values
('milky way', 1316000, true, true, 'milky'),
('galaxy2', 1316000, false, false, 'red'),
('galaxy3', 1316000, false, false, 'red'),
('galaxy4', 1316000, false, false, 'red'),
('galaxy5', 1316000, false, false, 'red'),
('galaxy6', 1316000, false, false, 'red');

insert into star (name, age_in_millions_of_years, has_life, has_water, description, distance_from_earth, galaxy_id)
values
('sun', 100000, true, true, 'hot', 100000, 1),
('star2', 1316000, false, false, 'blue', 900000, 2),
('star3', 1316000, false, false, 'blue', 900000, 3),
('star4', 1316000, false, false, 'blue', 900000, 4),
('star5', 1316000, false, false, 'blue', 900000, 5),
('star6', 1316000, false, false, 'blue', 900000, 6);

insert into planet (name, age_in_millions_of_years, has_life, has_water, description, distance_from_earth, star_id)
values
('earth', 100000, true, true, 'blue', 0, 1),
('planet2', 100000, false, false, 'red', 100000, 2),
('planet3', 100000, false, false, 'yellow', 100000, 2),
('planet4', 100000, false, false, 'blue', 100000, 3),
('planet5', 100000, false, false, 'orange', 100000, 3),
('planet6', 100000, false, false, 'cold and grey', 100000, 4),
('planet7', 100000, false, false, 'blue and hot', 100000, 5),
('planet8', 100000, false, false, 'orange', 100000, 6),
('planet9', 100000, false, false, 'blue', 100000, 5),
('planet10', 100000, false, false, 'red and smelly', 100000, 6),
('planet11', 100000, false, false, 'blue', 100000, 4),
('planet12', 100000, false, false, 'blue', 100000, 1);

insert into moon (name, age_in_millions_of_years, has_life, has_water, description, distance_from_earth, planet_id)
values
('moon', 10000, true, false, 'white', 10000, 1),
('moon2', 10000, false, true, 'white', 9000, 3),
('moon3', 10000, false, true, 'white', 9000, 4),
('moon4', 10000, false, false, 'white', 9000, 5),
('moon5', 10000, false, true, 'white', 9000, 6),
('moon6', 10000, false, true, 'white', 9000, 7),
('moon7', 10000, false, false, 'white', 9000, 8),
('moon8', 10000, false, true, 'white', 9000, 9),
('moon9', 10000, false, true, 'white', 9000, 10),
('moon10', 10000, false, true, 'white', 9000, 11),
('moon11', 10000, false, true, 'white', 9000, 12),
('moon12', 10000, false, false, 'white', 9000, 1),
('moon13', 10000, false, true, 'white', 9000, 2),
('moon14', 10000, false, true, 'white', 9000, 3),
('moon15', 10000, false, false, 'white', 9000, 4),
('moon16', 10000, false, true, 'white', 9000, 5),
('moon17', 10000, false, true, 'white', 9000, 6),
('moon18', 10000, false, false, 'white', 9000, 7),
('moon19', 10000, false, true, 'white', 9000, 8),
('moon20', 10000, false, true, 'white', 9000, 9);

insert into black_hole (name, age_in_millions_of_years, description, distance_from_earth)
values
('ngc1', 189999, 'scary', 999999),
('sagittarius a', 189999, 'scary', 999999),
('black hole', 189999, 'scary', 999999);

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO freecodecamp;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

