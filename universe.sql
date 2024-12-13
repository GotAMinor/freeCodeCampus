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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_star integer,
    diameter numeric,
    age_myears integer,
    description text
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
    name character varying(30) NOT NULL,
    planet_id integer,
    type character varying(30),
    orbital_period numeric
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
    name character varying(30) NOT NULL,
    star_id integer,
    is_habitable boolean DEFAULT false,
    type character varying(30),
    orbital_period numeric
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    is_alien boolean DEFAULT false,
    description text,
    population bigint
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    is_binary boolean DEFAULT false,
    type character varying(30),
    age_myears integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_sta_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_sta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_sta_id_seq OWNER TO freecodecamp;

--
-- Name: star_sta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_sta_id_seq OWNED BY public.star.star_id;


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
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_sta_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000, 100000, 13000, 'The galaxy containing our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, 220000, 10000, 'The closest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000000, 60000, 3000, 'A member of our Local Group of galaxies.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 300000000, 150000, 10000, 'A classic spiral galaxy located in the constellation Canes Venatici.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 800000000, 50000, 10000, 'A spiral galaxy located in the constellation Virgo.');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 200000000, 100000, 10000, 'A giant elliptical galaxy in the constellation Centaurus.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 'Natural', 27.3);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Natural', 0.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Natural', 1.3);
INSERT INTO public.moon VALUES (4, 'Titan', 5, 'Natural', 15.9);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 'Natural', 3.5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 'Natural', 7.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 'Natural', 16.7);
INSERT INTO public.moon VALUES (8, 'Iapetus', 5, 'Natural', 79.3);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 'Natural', 4.5);
INSERT INTO public.moon VALUES (10, 'Enceladus', 5, 'Natural', 1.37);
INSERT INTO public.moon VALUES (11, 'Triton', 6, 'Natural', 5.9);
INSERT INTO public.moon VALUES (12, 'Charon', 7, 'Natural', 6.4);
INSERT INTO public.moon VALUES (13, 'Miranda', 8, 'Natural', 1.4);
INSERT INTO public.moon VALUES (14, 'Oberon', 8, 'Natural', 13.5);
INSERT INTO public.moon VALUES (15, 'Titania', 8, 'Natural', 8.7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 8, 'Natural', 4.1);
INSERT INTO public.moon VALUES (17, 'Hyperion', 5, 'Natural', 21.3);
INSERT INTO public.moon VALUES (18, 'Mimas', 5, 'Natural', 0.943);
INSERT INTO public.moon VALUES (19, 'Dione', 5, 'Natural', 2.7);
INSERT INTO public.moon VALUES (20, 'Ceres', 9, 'Dwarf', 4.6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Terrestrial', 365.25);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 'Terrestrial', 687);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 'Terrestrial', 225);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, false, 'Gas Giant', 4332.59);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, false, 'Gas Giant', 10759.22);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, false, 'Ice Giant', 30688.5);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, false, 'Ice Giant', 60182);
INSERT INTO public.planet VALUES (8, 'Proxima b', 4, true, 'Terrestrial', 11.2);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 2, false, 'Terrestrial', 3.2);
INSERT INTO public.planet VALUES (10, 'Beta Pictoris b', 3, false, 'Gas Giant', 8.2);
INSERT INTO public.planet VALUES (11, '55 Cancri e', 5, false, 'Super-Earth', 0.736);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 6, true, 'Terrestrial', 6.1);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Human', 1, false, 'Species native to Earth.', 7800000000);
INSERT INTO public.species VALUES (2, 'Martian', 2, true, 'Hypothetical life on Mars.', 0);
INSERT INTO public.species VALUES (3, 'Titanian', 3, true, 'Hypothetical life on Titan.', 0);
INSERT INTO public.species VALUES (4, 'Ganymedean', 4, true, 'Hypothetical life on Ganymede.', 0);
INSERT INTO public.species VALUES (5, 'Ceresian', 5, true, 'Hypothetical life on Ceres.', 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, false, 'Main Sequence', 200);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, true, 'Main Sequence', 5500);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, false, 'Red Supergiant', 800);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, false, 'Red Dwarf', 4000);
INSERT INTO public.star VALUES (5, 'Rigel', 1, false, 'Blue Supergiant', 800);
INSERT INTO public.star VALUES (6, 'Antares', 1, false, 'Red Supergiant', 1200);
INSERT INTO public.star VALUES (7, 'Vega', 1, false, 'Main Sequence', 450);
INSERT INTO public.star VALUES (8, 'Aldebaran', 2, false, 'Red Giant', 650);
INSERT INTO public.star VALUES (9, 'Deneb', 1, false, 'Blue Supergiant', 10000);


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
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 5, true);


--
-- Name: star_sta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_sta_id_seq', 9, true);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

