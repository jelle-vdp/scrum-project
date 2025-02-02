--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: category; Type: TABLE; Schema: public; Owner: lucas
--

CREATE TABLE public.category (
    id integer NOT NULL,
    cetagory character varying(255) NOT NULL
);


ALTER TABLE public.category OWNER TO lucas;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: lucas
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO lucas;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucas
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: product_seq; Type: SEQUENCE; Schema: public; Owner: lucas
--

CREATE SEQUENCE public.product_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_seq OWNER TO lucas;

--
-- Name: product; Type: TABLE; Schema: public; Owner: lucas
--

CREATE TABLE public.product (
    id integer DEFAULT nextval('public.product_seq'::regclass) NOT NULL,
    product_name character varying(255) NOT NULL,
    amount integer NOT NULL,
    price integer NOT NULL,
    category_id integer,
    post_date date NOT NULL,
    user_id integer,
    product_description character varying(255) DEFAULT NULL::character varying,
    image bytea,
    theme_id integer
);


ALTER TABLE public.product OWNER TO lucas;

--
-- Name: theme; Type: TABLE; Schema: public; Owner: lucas
--

CREATE TABLE public.theme (
    id integer NOT NULL,
    theme_name character varying(255) NOT NULL
);


ALTER TABLE public.theme OWNER TO lucas;

--
-- Name: theme_id_seq; Type: SEQUENCE; Schema: public; Owner: lucas
--

CREATE SEQUENCE public.theme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theme_id_seq OWNER TO lucas;

--
-- Name: theme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucas
--

ALTER SEQUENCE public.theme_id_seq OWNED BY public.theme.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: lucas
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255),
    email character varying(70) NOT NULL,
    username character varying(30) NOT NULL,
    password character varying(20) NOT NULL
);


ALTER TABLE public."user" OWNER TO lucas;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: lucas
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO lucas;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucas
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: theme id; Type: DEFAULT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public.theme ALTER COLUMN id SET DEFAULT nextval('public.theme_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: lucas
--

COPY public.category (id, cetagory) FROM stdin;
1	Trading cards
2	Action figures
3	Plushies
4	Clothing
5	Manga
6	Light novels
7	Accessoires 
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: lucas
--

COPY public.product (id, product_name, amount, price, category_id, post_date, user_id, product_description, image, theme_id) FROM stdin;
3	Doctor Strange action figure	2	9999	2	2022-08-17	1	An action figure of Doctor Strange.	\N	8
4	Marvel mug	2	500	7	2022-08-17	2	A mug with Marvel comic panels.	\N	8
5	One Piece volume 1 manga	4	1399	5	2022-08-17	3	The first volume of the beloved manga One Piece.	\N	3
\.


--
-- Data for Name: theme; Type: TABLE DATA; Schema: public; Owner: lucas
--

COPY public.theme (id, theme_name) FROM stdin;
1	Dragonball Z
2	Naruto
3	One piece
4	Pokémon
5	Hajime no Ippo
6	Attack on titan
7	DC
8	Marvel
9	Death note
10	Black clover
11	Chainsaw Man
12	Jujutsu Kaisen
13	Berserk
14	Yakuza
15	Elden ring
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: lucas
--

COPY public."user" (id, firstname, lastname, email, username, password) FROM stdin;
1	Besart	Elezi	besartelezi@becode.org	Bigbez	ilovebecode
2	Shiva	Mottaghi	shivamottaghi@becode.org	Shishi	ilovemyhusband
3	Jelle	Van de Poel	jellevdp@becode.org	Snelle Jelle	ihatefish
4	Lucas	Stocker	lucasstocker@becode.org	Gepoverlow	palomita
5	Pablo	Garcia Plaza	Pablogp@becode.org	Pgp	ilikemate
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucas
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- Name: product_seq; Type: SEQUENCE SET; Schema: public; Owner: lucas
--

SELECT pg_catalog.setval('public.product_seq', 6, false);


--
-- Name: theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucas
--

SELECT pg_catalog.setval('public.theme_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucas
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: theme theme_pk; Type: CONSTRAINT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public.theme
    ADD CONSTRAINT theme_pk PRIMARY KEY (id);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: product_category_id_fk; Type: INDEX; Schema: public; Owner: lucas
--

CREATE INDEX product_category_id_fk ON public.product USING btree (category_id);


--
-- Name: product_theme_id_fk; Type: INDEX; Schema: public; Owner: lucas
--

CREATE INDEX product_theme_id_fk ON public.product USING btree (theme_id);


--
-- Name: product_user_id_fk; Type: INDEX; Schema: public; Owner: lucas
--

CREATE INDEX product_user_id_fk ON public.product USING btree (user_id);


--
-- Name: product product_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fk FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: product product_theme_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_theme_id_fk FOREIGN KEY (theme_id) REFERENCES public.theme(id);


--
-- Name: product product_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: lucas
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_user_id_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

