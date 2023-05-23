--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    attempts integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(25) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (484, 402, 592);
INSERT INTO public.games VALUES (485, 402, 66);
INSERT INTO public.games VALUES (486, 403, 75);
INSERT INTO public.games VALUES (487, 403, 842);
INSERT INTO public.games VALUES (488, 402, 298);
INSERT INTO public.games VALUES (489, 402, 757);
INSERT INTO public.games VALUES (490, 402, 951);
INSERT INTO public.games VALUES (491, 404, 786);
INSERT INTO public.games VALUES (492, 404, 643);
INSERT INTO public.games VALUES (493, 405, 396);
INSERT INTO public.games VALUES (494, 404, 97);
INSERT INTO public.games VALUES (495, 404, 157);
INSERT INTO public.games VALUES (496, 404, 315);
INSERT INTO public.games VALUES (497, 406, 597);
INSERT INTO public.games VALUES (498, 406, 43);
INSERT INTO public.games VALUES (499, 407, 96);
INSERT INTO public.games VALUES (500, 407, 463);
INSERT INTO public.games VALUES (501, 408, 954);
INSERT INTO public.games VALUES (502, 409, 739);
INSERT INTO public.games VALUES (503, 409, 367);
INSERT INTO public.games VALUES (504, 408, 605);
INSERT INTO public.games VALUES (505, 408, 43);
INSERT INTO public.games VALUES (506, 408, 775);
INSERT INTO public.games VALUES (472, 398, 306);
INSERT INTO public.games VALUES (473, 398, 410);
INSERT INTO public.games VALUES (474, 399, 569);
INSERT INTO public.games VALUES (475, 398, 774);
INSERT INTO public.games VALUES (476, 398, 436);
INSERT INTO public.games VALUES (477, 398, 831);
INSERT INTO public.games VALUES (478, 400, 390);
INSERT INTO public.games VALUES (479, 401, 781);
INSERT INTO public.games VALUES (480, 401, 507);
INSERT INTO public.games VALUES (481, 400, 593);
INSERT INTO public.games VALUES (482, 400, 877);
INSERT INTO public.games VALUES (483, 400, 633);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (402, 'user_1684881246171');
INSERT INTO public.players VALUES (403, 'user_1684881246170');
INSERT INTO public.players VALUES (404, 'user_1684881419921');
INSERT INTO public.players VALUES (405, 'user_1684881419920');
INSERT INTO public.players VALUES (406, 'user_1684881691818');
INSERT INTO public.players VALUES (407, 'user_1684881691819');
INSERT INTO public.players VALUES (408, 'user_1684881789626');
INSERT INTO public.players VALUES (409, 'user_1684881789625');
INSERT INTO public.players VALUES (398, 'user_1684881201449');
INSERT INTO public.players VALUES (399, 'user_1684881201448');
INSERT INTO public.players VALUES (400, 'user_1684881222139');
INSERT INTO public.players VALUES (401, 'user_1684881222138');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 506, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 409, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- PostgreSQL database dump complete
--

