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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    main_star integer NOT NULL,
    number_of_stars integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years integer,
    weight_in_trillion_solar_masses numeric(4,2),
    name character varying(20) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    radious_in_km integer,
    age_in_millions_of_years integer,
    weight_relative_to_earth numeric(5,3),
    has_water boolean,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    radious_in_km integer,
    age_in_millions_of_years integer,
    description text,
    weight_relative_to_earth numeric(4,2),
    has_water boolean,
    star_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    radious_in_km integer,
    age_in_millions_of_years integer,
    weight_in_solar_masses numeric(4,2),
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Beagle', 3, 8);
INSERT INTO public.constellation VALUES (2, 'Bulldog', 5, 12);
INSERT INTO public.constellation VALUES (3, 'Poodle', 2, 15);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 13610, 0, 1.50, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 10010, 3, 1.00, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 13510, 25, 2.30, 'Pinwheel');
INSERT INTO public.galaxy VALUES (4, 12530, 7, 4.60, 'Samsung');
INSERT INTO public.galaxy VALUES (5, 6000, 90, 0.70, 'Chombuca');
INSERT INTO public.galaxy VALUES (6, 16320, 34, 4.20, 'Hotwheels');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (16, 8896, 523, 1.309, true, 7, 'Zeus');
INSERT INTO public.moon VALUES (17, 1231, 808, 1.858, false, 4, 'Hera');
INSERT INTO public.moon VALUES (18, 2798, 112, 1.196, false, 7, 'Poseidon');
INSERT INTO public.moon VALUES (19, 9971, 437, 1.056, true, 10, 'Demeter');
INSERT INTO public.moon VALUES (20, 8794, 433, 0.073, false, 8, 'Athena');
INSERT INTO public.moon VALUES (21, 3180, 465, 0.743, false, 6, 'Apollo');
INSERT INTO public.moon VALUES (22, 9871, 473, 0.290, false, 5, 'Artemis');
INSERT INTO public.moon VALUES (23, 7729, 264, 1.329, false, 6, 'Ares');
INSERT INTO public.moon VALUES (24, 5717, 409, 0.186, true, 9, 'Aphrodite');
INSERT INTO public.moon VALUES (25, 9135, 155, 0.102, false, 1, 'Hephaestus');
INSERT INTO public.moon VALUES (26, 4740, 776, 0.668, true, 12, 'Hermes');
INSERT INTO public.moon VALUES (27, 8937, 994, 1.772, false, 11, 'Hestia');
INSERT INTO public.moon VALUES (28, 5284, 355, 1.502, false, 7, 'Dionysus');
INSERT INTO public.moon VALUES (29, 1202, 930, 1.206, false, 11, 'Hades');
INSERT INTO public.moon VALUES (30, 6458, 518, 1.921, true, 11, 'Persephone');
INSERT INTO public.moon VALUES (31, 9489, 148, 0.780, false, 11, 'Hecate');
INSERT INTO public.moon VALUES (32, 5522, 552, 1.002, true, 12, 'Hypnos');
INSERT INTO public.moon VALUES (33, 1331, 240, 1.799, false, 4, 'Nike');
INSERT INTO public.moon VALUES (34, 1725, 887, 1.230, false, 6, 'Tyche');
INSERT INTO public.moon VALUES (35, 4818, 874, 0.545, false, 5, 'Nemesis');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 12345, 678, 'Desert planet with two suns', 3.45, false, 3, 'Michael');
INSERT INTO public.planet VALUES (2, 98765, 432, 'Icy moon with methane lakes', 2.10, true, 6, 'David');
INSERT INTO public.planet VALUES (3, 54321, 876, 'Lush planet with vast oceans', 4.32, false, 1, 'Matthew');
INSERT INTO public.planet VALUES (4, 24680, 135, 'Gas giant with swirling storms', 1.98, true, 5, 'Daniel');
INSERT INTO public.planet VALUES (5, 13579, 246, 'Volcanic planet with toxic atmosphere', 5.67, false, 4, 'Andrew');
INSERT INTO public.planet VALUES (6, 36987, 531, 'Ringed planet with rocky moons', 3.21, true, 2, 'James');
INSERT INTO public.planet VALUES (7, 24680, 357, 'Frozen planet with ice caps', 2.75, false, 6, 'William');
INSERT INTO public.planet VALUES (8, 86420, 219, 'Molten world with lava oceans', 6.89, true, 3, 'Christopher');
INSERT INTO public.planet VALUES (9, 75319, 624, 'Forest planet with towering trees', 4.32, false, 2, 'Joseph');
INSERT INTO public.planet VALUES (10, 15963, 482, 'Oceanic planet with coral reefs', 3.14, true, 1, 'Benjamin');
INSERT INTO public.planet VALUES (11, 35791, 845, 'Stormy planet with lightning storms', 5.67, false, 5, 'Samuel');
INSERT INTO public.planet VALUES (12, 58204, 136, 'Dusty planet with ancient ruins', 2.08, true, 4, 'Alexander');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 600000, 400, 1.00, 1, 'SUN');
INSERT INTO public.star VALUES (2, 804000, 690, 1.90, 3, 'Paula');
INSERT INTO public.star VALUES (3, 926312, 1560, 3.10, 2, 'Carla');
INSERT INTO public.star VALUES (4, 743000, 580, 2.40, 4, 'Victoria');
INSERT INTO public.star VALUES (5, 667569, 320, 1.70, 5, 'Camila');
INSERT INTO public.star VALUES (6, 1469852, 2134, 6.10, 6, 'Luciana');


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 35, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_main_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_main_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_main_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_main_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_main_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_main_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

