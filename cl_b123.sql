--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-07-21 21:45:38

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

DROP DATABASE classroom;
--
-- TOC entry 4910 (class 1262 OID 540983)
-- Name: classroom; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE classroom WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE classroom OWNER TO postgres;

\connect classroom

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
-- TOC entry 6 (class 2615 OID 540984)
-- Name: master_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA master_schema;


ALTER SCHEMA master_schema OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 541040)
-- Name: school_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA school_schema;


ALTER SCHEMA school_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 541027)
-- Name: master_chapters; Type: TABLE; Schema: master_schema; Owner: postgres
--

CREATE TABLE master_schema.master_chapters (
    id integer NOT NULL,
    row_id text NOT NULL,
    subject_row_id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE master_schema.master_chapters OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 541026)
-- Name: master_chapters_id_seq; Type: SEQUENCE; Schema: master_schema; Owner: postgres
--

CREATE SEQUENCE master_schema.master_chapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE master_schema.master_chapters_id_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 221
-- Name: master_chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_chapters_id_seq OWNED BY master_schema.master_chapters.id;


--
-- TOC entry 218 (class 1259 OID 540995)
-- Name: master_classes; Type: TABLE; Schema: master_schema; Owner: postgres
--

CREATE TABLE master_schema.master_classes (
    id integer NOT NULL,
    row_id text NOT NULL,
    board text NOT NULL,
    name text NOT NULL
);


ALTER TABLE master_schema.master_classes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 540994)
-- Name: master_classes_id_seq; Type: SEQUENCE; Schema: master_schema; Owner: postgres
--

CREATE SEQUENCE master_schema.master_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE master_schema.master_classes_id_seq OWNER TO postgres;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 217
-- Name: master_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_classes_id_seq OWNED BY master_schema.master_classes.id;


--
-- TOC entry 220 (class 1259 OID 541013)
-- Name: master_subjects; Type: TABLE; Schema: master_schema; Owner: postgres
--

CREATE TABLE master_schema.master_subjects (
    id integer NOT NULL,
    row_id text NOT NULL,
    class_row_id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE master_schema.master_subjects OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 541012)
-- Name: master_subjects_id_seq; Type: SEQUENCE; Schema: master_schema; Owner: postgres
--

CREATE SEQUENCE master_schema.master_subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE master_schema.master_subjects_id_seq OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 219
-- Name: master_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_subjects_id_seq OWNED BY master_schema.master_subjects.id;


--
-- TOC entry 226 (class 1259 OID 541174)
-- Name: schools; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.schools (
    id integer NOT NULL,
    row_id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text,
    address text,
    is_active boolean DEFAULT true,
    board_id text,
    created_by text,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.schools OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 541173)
-- Name: schools_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.schools_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.schools_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 225
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.schools_id_seq OWNED BY school_schema.schools.id;


--
-- TOC entry 224 (class 1259 OID 541161)
-- Name: super_admin; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.super_admin (
    id integer NOT NULL,
    row_id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    user_type smallint NOT NULL,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.super_admin OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 541160)
-- Name: super_admin_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.super_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.super_admin_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 223
-- Name: super_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.super_admin_id_seq OWNED BY school_schema.super_admin.id;


--
-- TOC entry 228 (class 1259 OID 541188)
-- Name: users; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.users (
    id integer NOT NULL,
    row_id text NOT NULL,
    school_id text,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    role smallint NOT NULL,
    is_active boolean DEFAULT true,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.users OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 541187)
-- Name: users_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.users_id_seq OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 227
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.users_id_seq OWNED BY school_schema.users.id;


--
-- TOC entry 4717 (class 2604 OID 541030)
-- Name: master_chapters id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters ALTER COLUMN id SET DEFAULT nextval('master_schema.master_chapters_id_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 540998)
-- Name: master_classes id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes ALTER COLUMN id SET DEFAULT nextval('master_schema.master_classes_id_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 541016)
-- Name: master_subjects id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects ALTER COLUMN id SET DEFAULT nextval('master_schema.master_subjects_id_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 541177)
-- Name: schools id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools ALTER COLUMN id SET DEFAULT nextval('school_schema.schools_id_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 541164)
-- Name: super_admin id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin ALTER COLUMN id SET DEFAULT nextval('school_schema.super_admin_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 541191)
-- Name: users id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users ALTER COLUMN id SET DEFAULT nextval('school_schema.users_id_seq'::regclass);


--
-- TOC entry 4898 (class 0 OID 541027)
-- Dependencies: 222
-- Data for Name: master_chapters; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--



--
-- TOC entry 4894 (class 0 OID 540995)
-- Dependencies: 218
-- Data for Name: master_classes; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--



--
-- TOC entry 4896 (class 0 OID 541013)
-- Dependencies: 220
-- Data for Name: master_subjects; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--



--
-- TOC entry 4902 (class 0 OID 541174)
-- Dependencies: 226
-- Data for Name: schools; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (1, '1729833318836_opVF', 'Sunrise Public School', 'contact@sunrise.edu.in', '9876543210', '123, MG Road, Delhi', true, 'CBSE-2025', '1729832842723_A9f6', '2025-07-21 20:45:26.156045', '2025-07-21 20:45:26.156045') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (2, '1729862517376_duwd', 'Green Valley International', 'info@greenvalley.org', '9123456780', '88, Nehru Nagar, Mumbai', true, 'ICSE-2025', '1729832842723_A9f6', '2025-07-21 20:45:26.156045', '2025-07-21 20:45:26.156045') ON CONFLICT DO NOTHING;


--
-- TOC entry 4900 (class 0 OID 541161)
-- Dependencies: 224
-- Data for Name: super_admin; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.super_admin (id, row_id, name, email, password, user_type, cr_on, up_on) VALUES (1, '1729832842723_A9f6', 'Fintech', 'fintech@admin.com', '1234', 1, '2025-07-21 20:43:35.971272', '2025-07-21 20:43:35.971272') ON CONFLICT DO NOTHING;


--
-- TOC entry 4904 (class 0 OID 541188)
-- Dependencies: 228
-- Data for Name: users; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (3, '1729862581947_gSB6', '1729862517376_duwd', 'Neha Singh', 'neha@greenvalley.org', '1234', 2, true, '2025-07-21 20:47:47.558312', '2025-07-21 20:47:47.558312') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (2, '1730194518661_8l0z', '1729833318836_opVF', 'Manoj Verma', 'manoj@sunrise.edu.in', '1234', 3, true, '2025-07-21 20:47:47.558312', '2025-07-21 20:47:47.558312') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (1, '1730195703778_zSb1', '1729833318836_opVF', 'Anjali Mehta', 'anjali@sunrise.edu.in', '1234', 2, true, '2025-07-21 20:47:47.558312', '2025-07-21 20:47:47.558312') ON CONFLICT DO NOTHING;


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 221
-- Name: master_chapters_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_chapters_id_seq', 1, false);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 217
-- Name: master_classes_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_classes_id_seq', 1, false);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 219
-- Name: master_subjects_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_subjects_id_seq', 1, false);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 225
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.schools_id_seq', 2, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 223
-- Name: super_admin_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.super_admin_id_seq', 1, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 227
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.users_id_seq', 3, true);


--
-- TOC entry 4734 (class 2606 OID 541034)
-- Name: master_chapters master_chapters_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters
    ADD CONSTRAINT master_chapters_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4730 (class 2606 OID 541002)
-- Name: master_classes master_classes_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes
    ADD CONSTRAINT master_classes_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4732 (class 2606 OID 541020)
-- Name: master_subjects master_subjects_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects
    ADD CONSTRAINT master_subjects_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4740 (class 2606 OID 541186)
-- Name: schools schools_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools
    ADD CONSTRAINT schools_email_key UNIQUE (email);


--
-- TOC entry 4742 (class 2606 OID 541184)
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4736 (class 2606 OID 541172)
-- Name: super_admin super_admin_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin
    ADD CONSTRAINT super_admin_email_key UNIQUE (email);


--
-- TOC entry 4738 (class 2606 OID 541170)
-- Name: super_admin super_admin_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin
    ADD CONSTRAINT super_admin_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4744 (class 2606 OID 541200)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4746 (class 2606 OID 541198)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4748 (class 2606 OID 541035)
-- Name: master_chapters master_chapters_subject_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters
    ADD CONSTRAINT master_chapters_subject_row_id_fkey FOREIGN KEY (subject_row_id) REFERENCES master_schema.master_subjects(row_id);


--
-- TOC entry 4747 (class 2606 OID 541021)
-- Name: master_subjects master_subjects_class_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects
    ADD CONSTRAINT master_subjects_class_row_id_fkey FOREIGN KEY (class_row_id) REFERENCES master_schema.master_classes(row_id);


--
-- TOC entry 4749 (class 2606 OID 541201)
-- Name: users users_school_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_school_id_fkey FOREIGN KEY (school_id) REFERENCES school_schema.schools(row_id);


-- Completed on 2025-07-21 21:45:39

--
-- PostgreSQL database dump complete
--

