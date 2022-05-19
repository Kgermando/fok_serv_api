--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: abonnement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abonnement (
    id integer NOT NULL,
    object character varying NOT NULL,
    "dureeAbonnement" character varying NOT NULL,
    "nomCompletAbonnement" character varying NOT NULL,
    "montantAbonnement" character varying NOT NULL,
    "codeRefAbonnement" character varying NOT NULL,
    "messageConfirmation" character varying NOT NULL,
    "sendAt" timestamp without time zone NOT NULL,
    "readAt" timestamp without time zone NOT NULL,
    read boolean NOT NULL,
    "codeReAbonnement" character varying NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.abonnement OWNER TO postgres;

--
-- Name: abonnement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abonnement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abonnement_id_seq OWNER TO postgres;

--
-- Name: abonnement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abonnement_id_seq OWNED BY public.abonnement.id;


--
-- Name: achat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achat (
    id integer NOT NULL,
    "idProduct" character varying NOT NULL,
    quantity character varying NOT NULL,
    "quantityAchat" character varying NOT NULL,
    "priceAchatUnit" character varying NOT NULL,
    "prixVenteUnit" character varying NOT NULL,
    unite character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.achat OWNER TO postgres;

--
-- Name: achat_credit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achat_credit (
    id integer NOT NULL,
    "idProduct" character varying NOT NULL,
    quantity character varying NOT NULL,
    "quantityAchat" character varying NOT NULL,
    "priceAchatUnit" character varying NOT NULL,
    "prixVenteUnit" character varying NOT NULL,
    unite character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.achat_credit OWNER TO postgres;

--
-- Name: achat_credit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achat_credit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.achat_credit_id_seq OWNER TO postgres;

--
-- Name: achat_credit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achat_credit_id_seq OWNED BY public.achat_credit.id;


--
-- Name: achat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.achat_id_seq OWNER TO postgres;

--
-- Name: achat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achat_id_seq OWNED BY public.achat.id;


--
-- Name: agenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agenda (
    id integer NOT NULL,
    title character varying NOT NULL,
    priority boolean NOT NULL,
    description character varying NOT NULL,
    number integer NOT NULL,
    date timestamp without time zone NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.agenda OWNER TO postgres;

--
-- Name: agenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agenda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agenda_id_seq OWNER TO postgres;

--
-- Name: agenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agenda_id_seq OWNED BY public.agenda.id;


--
-- Name: annuaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annuaire (
    id integer NOT NULL,
    "nomPostnomPrenom" character varying NOT NULL,
    email character varying NOT NULL,
    mobile1 character varying NOT NULL,
    mobile2 character varying NOT NULL,
    "secteurActivite" character varying NOT NULL,
    "nomEntreprise" character varying NOT NULL,
    grade character varying NOT NULL,
    "adresseEntreprise" character varying NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.annuaire OWNER TO postgres;

--
-- Name: annuaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annuaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annuaire_id_seq OWNER TO postgres;

--
-- Name: annuaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annuaire_id_seq OWNED BY public.annuaire.id;


--
-- Name: archive_credit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive_credit (
    id integer NOT NULL,
    "idProduct" character varying NOT NULL,
    quantity character varying NOT NULL,
    "quantityAchat" character varying NOT NULL,
    "priceAchatUnit" character varying NOT NULL,
    "prixVenteUnit" character varying NOT NULL,
    unite character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    paye boolean NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.archive_credit OWNER TO postgres;

--
-- Name: archive_credit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archive_credit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archive_credit_id_seq OWNER TO postgres;

--
-- Name: archive_credit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archive_credit_id_seq OWNED BY public.archive_credit.id;


--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    "idProductCart" character varying NOT NULL,
    "quantityCart" character varying NOT NULL,
    "priceCart" character varying NOT NULL,
    unite character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- Name: creancecart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.creancecart (
    id integer NOT NULL,
    cart json,
    client character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.creancecart OWNER TO postgres;

--
-- Name: creancecart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.creancecart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creancecart_id_seq OWNER TO postgres;

--
-- Name: creancecart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.creancecart_id_seq OWNED BY public.creancecart.id;


--
-- Name: depenses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.depenses (
    id integer NOT NULL,
    motant character varying NOT NULL,
    libele character varying NOT NULL,
    motif character varying NOT NULL,
    date timestamp without time zone,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.depenses OWNER TO postgres;

--
-- Name: depenses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.depenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.depenses_id_seq OWNER TO postgres;

--
-- Name: depenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.depenses_id_seq OWNED BY public.depenses.id;


--
-- Name: facturecart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturecart (
    id integer NOT NULL,
    cart json,
    client character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.facturecart OWNER TO postgres;

--
-- Name: facturecart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturecart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturecart_id_seq OWNER TO postgres;

--
-- Name: facturecart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturecart_id_seq OWNED BY public.facturecart.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    destinataire character varying NOT NULL,
    subject character varying NOT NULL,
    message character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    read boolean NOT NULL
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: prod_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prod_model (
    id integer NOT NULL,
    categorie character varying NOT NULL,
    "sousCategorie1" character varying NOT NULL,
    "sousCategorie2" character varying NOT NULL,
    "sousCategorie3" character varying NOT NULL,
    "sousCategorie4" character varying NOT NULL,
    "idProduct" character varying NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.prod_model OWNER TO postgres;

--
-- Name: prod_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prod_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prod_model_id_seq OWNER TO postgres;

--
-- Name: prod_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prod_model_id_seq OWNED BY public.prod_model.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: venteshistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venteshistory (
    id integer NOT NULL,
    "idProductCart" character varying NOT NULL,
    "quantityCart" character varying NOT NULL,
    "priceTotalCart" character varying NOT NULL,
    unite character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    telephone character varying NOT NULL,
    succursale character varying NOT NULL,
    "nameBusiness" character varying NOT NULL
);


ALTER TABLE public.venteshistory OWNER TO postgres;

--
-- Name: venteshistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venteshistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venteshistory_id_seq OWNER TO postgres;

--
-- Name: venteshistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venteshistory_id_seq OWNED BY public.venteshistory.id;


--
-- Name: abonnement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abonnement ALTER COLUMN id SET DEFAULT nextval('public.abonnement_id_seq'::regclass);


--
-- Name: achat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achat ALTER COLUMN id SET DEFAULT nextval('public.achat_id_seq'::regclass);


--
-- Name: achat_credit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achat_credit ALTER COLUMN id SET DEFAULT nextval('public.achat_credit_id_seq'::regclass);


--
-- Name: agenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda ALTER COLUMN id SET DEFAULT nextval('public.agenda_id_seq'::regclass);


--
-- Name: annuaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annuaire ALTER COLUMN id SET DEFAULT nextval('public.annuaire_id_seq'::regclass);


--
-- Name: archive_credit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_credit ALTER COLUMN id SET DEFAULT nextval('public.archive_credit_id_seq'::regclass);


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- Name: creancecart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creancecart ALTER COLUMN id SET DEFAULT nextval('public.creancecart_id_seq'::regclass);


--
-- Name: depenses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depenses ALTER COLUMN id SET DEFAULT nextval('public.depenses_id_seq'::regclass);


--
-- Name: facturecart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturecart ALTER COLUMN id SET DEFAULT nextval('public.facturecart_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: prod_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prod_model ALTER COLUMN id SET DEFAULT nextval('public.prod_model_id_seq'::regclass);


--
-- Name: venteshistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venteshistory ALTER COLUMN id SET DEFAULT nextval('public.venteshistory_id_seq'::regclass);


--
-- Name: abonnement abonnement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abonnement
    ADD CONSTRAINT abonnement_pkey PRIMARY KEY (id);


--
-- Name: achat_credit achat_credit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achat_credit
    ADD CONSTRAINT achat_credit_pkey PRIMARY KEY (id);


--
-- Name: achat achat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achat
    ADD CONSTRAINT achat_pkey PRIMARY KEY (id);


--
-- Name: agenda agenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda
    ADD CONSTRAINT agenda_pkey PRIMARY KEY (id);


--
-- Name: annuaire annuaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annuaire
    ADD CONSTRAINT annuaire_pkey PRIMARY KEY (id);


--
-- Name: archive_credit archive_credit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_credit
    ADD CONSTRAINT archive_credit_pkey PRIMARY KEY (id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: creancecart creancecart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creancecart
    ADD CONSTRAINT creancecart_pkey PRIMARY KEY (id);


--
-- Name: depenses depenses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depenses
    ADD CONSTRAINT depenses_pkey PRIMARY KEY (id);


--
-- Name: facturecart facturecart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturecart
    ADD CONSTRAINT facturecart_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: prod_model prod_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prod_model
    ADD CONSTRAINT prod_model_pkey PRIMARY KEY (id);


--
-- Name: venteshistory venteshistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venteshistory
    ADD CONSTRAINT venteshistory_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

