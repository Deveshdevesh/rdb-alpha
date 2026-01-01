--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50),
    distance_from_earth integer NOT NULL,
    description text,
    is_active boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    planet_type character varying(50),
    population bigint
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mission text NOT NULL,
    launched boolean NOT NULL,
    crew_capacity integer
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.spacecraft ALTER COLUMN spacecraft_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.spacecraft_spacecraft_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass numeric(6,2),
    is_visible boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 'Spiral', 0, 'Our home galaxy', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 'Spiral', 2537000, 'Nearest major galaxy', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 'Spiral', 3000000, 'Small spiral galaxy', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Whirlpool', 'Spiral', 23000000, 'Interacting galaxy', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Sombrero', 'Elliptical', 29000000, 'Large bright core', false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Pinwheel', 'Spiral', 21000000, 'Face-on galaxy', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 1, 1737, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 2, 11, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 2, 6, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Alpha', 3, 700, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Beta', 3, 450, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Gamma', 4, 800, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Delta', 4, 300, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Epsilon', 5, 600, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Zeta', 5, 220, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Eta', 6, 150, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Theta', 7, 400, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Iota', 7, 120, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Kappa', 8, 130, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Lambda', 8, 200, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Mu', 9, 900, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Nu', 9, 320, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Xi', 10, 260, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Omicron', 11, 110, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Pi', 12, 140, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Rho', 12, 300, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Earth', 1, true, 'Terrestrial', 8000000000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Mars', 1, false, 'Terrestrial', 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Venus', 1, false, 'Terrestrial', 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Proxima b', 2, true, 'Exoplanet', 10000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Sirius I', 3, false, 'Gas Giant', 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Sirius II', 3, false, 'Rocky', 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Andro-1', 4, false, 'Rocky', 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Andro-2', 4, false, 'Ice', 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Tri-Prime', 5, true, 'Super-Earth', 500000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Tri-2', 5, false, 'Rocky', 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Whirl-1', 6, false, 'Gas Giant', 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Whirl-2', 6, false, 'Ice', 0);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft OVERRIDING SYSTEM VALUE VALUES (1, 'Voyager 1', 'Interstellar exploration', true, 0);
INSERT INTO public.spacecraft OVERRIDING SYSTEM VALUE VALUES (2, 'Discovery', 'Orbital research', true, 7);
INSERT INTO public.spacecraft OVERRIDING SYSTEM VALUE VALUES (3, 'Ares', 'Mars colonization project', false, 50);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, 4600, 1.00, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Proxima Centauri', 1, 4500, 0.12, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Sirius', 1, 250, 2.10, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Andromeda A', 2, 5000, 3.40, false);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Triangulum Alpha', 3, 2000, 1.50, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Whirlpool Prime', 4, 3000, 4.20, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

