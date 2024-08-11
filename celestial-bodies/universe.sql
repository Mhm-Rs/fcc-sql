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
    name character varying(50),
    magnitude numeric(3,2) NOT NULL,
    constellation character varying(50),
    distance_to_earth_in_kpc integer
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
    name character varying(50) NOT NULL,
    radius_in_km integer NOT NULL,
    is_discovered_by_galileo boolean NOT NULL,
    planet_id integer
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
    name character varying(50) NOT NULL,
    planet_type character varying(50) NOT NULL,
    is_habitable boolean NOT NULL,
    temperature_in_celsius integer NOT NULL,
    star_id integer
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
-- Name: ring; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ring (
    ring_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer
);


ALTER TABLE public.ring OWNER TO freecodecamp;

--
-- Name: rings_ring_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rings_ring_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rings_ring_id_seq OWNER TO freecodecamp;

--
-- Name: rings_ring_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rings_ring_id_seq OWNED BY public.ring.ring_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    hipparcos_catalogue integer NOT NULL,
    abs_magnitude numeric(3,2) NOT NULL,
    special_class text NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


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
-- Name: ring ring_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring ALTER COLUMN ring_id SET DEFAULT nextval('public.rings_ring_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.50, 'Sagittarius', 0);
INSERT INTO public.galaxy VALUES (2, 'Magellanic Cloud L', 0.90, 'Dorado/Mensa', 49);
INSERT INTO public.galaxy VALUES (3, 'Magellanic Cloud S', 2.70, 'Tucana', 61);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 3.40, 'Andromeda', 770);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 5.70, 'Triangulum', 890);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 6.84, 'Centaurus', 4200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1738, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 2, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 2, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2, true, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 198, false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252, false, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 295, false, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 561, false, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 764, false, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 2575, false, 6);
INSERT INTO public.moon VALUES (14, 'Ariel', 579, false, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 585, false, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 789, false, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 761, false, 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 236, false, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 1353, false, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 606, true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, -18, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Terrestrial', false, 164, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', false, 464, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, -65, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Giant', false, -110, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Giant', false, -288, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Giant', false, -195, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Giant', false, -214, 1);
INSERT INTO public.planet VALUES (9, 'Orcus', 'Dwarf', false, -229, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Dwarf', false, -229, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf', false, -223, 1);
INSERT INTO public.planet VALUES (12, 'Quaoar', 'Dwarf', false, -228, 1);


--
-- Data for Name: ring; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ring VALUES (1, 'Jovian', 5);
INSERT INTO public.ring VALUES (2, 'Saturnian', 6);
INSERT INTO public.ring VALUES (3, 'Uranian', 7);
INSERT INTO public.ring VALUES (4, 'Neptunian', 8);
INSERT INTO public.ring VALUES (5, 'Haumean', 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Epsilon Sagittarii', 90185, -1.44, 'B9.5lll', 1);
INSERT INTO public.star VALUES (2, 'Alpha Doradus', 21281, -0.36, 'A0lllp(Si)', 2);
INSERT INTO public.star VALUES (3, 'Alpha Tucanae', 110130, -1.05, 'K3lll', 3);
INSERT INTO public.star VALUES (4, 'Mirach', 5447, -1.86, 'M0lllvar', 4);
INSERT INTO public.star VALUES (5, 'Beta Trianguli', 10064, 0.09, 'A5lll', 5);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 71683, 4.34, 'G2V', 6);


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
-- Name: rings_ring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rings_ring_id_seq', 5, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 6, true);


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
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: ring rings_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT rings_name_key UNIQUE (name);


--
-- Name: ring rings_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT rings_pkey PRIMARY KEY (ring_id);


--
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: ring rings_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT rings_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

