--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-07-23 22:26:20

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
-- TOC entry 4986 (class 1262 OID 540983)
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
-- TOC entry 224 (class 1259 OID 549176)
-- Name: master_board; Type: TABLE; Schema: master_schema; Owner: postgres
--

CREATE TABLE master_schema.master_board (
    id integer NOT NULL,
    row_id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE master_schema.master_board OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 549175)
-- Name: master_board_id_seq; Type: SEQUENCE; Schema: master_schema; Owner: postgres
--

CREATE SEQUENCE master_schema.master_board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE master_schema.master_board_id_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 223
-- Name: master_board_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_board_id_seq OWNED BY master_schema.master_board.id;


--
-- TOC entry 230 (class 1259 OID 549213)
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
-- TOC entry 229 (class 1259 OID 549212)
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
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 229
-- Name: master_chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_chapters_id_seq OWNED BY master_schema.master_chapters.id;


--
-- TOC entry 226 (class 1259 OID 549185)
-- Name: master_classes; Type: TABLE; Schema: master_schema; Owner: postgres
--

CREATE TABLE master_schema.master_classes (
    id integer NOT NULL,
    row_id text NOT NULL,
    board_row_id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE master_schema.master_classes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 549184)
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
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 225
-- Name: master_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_classes_id_seq OWNED BY master_schema.master_classes.id;


--
-- TOC entry 228 (class 1259 OID 549199)
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
-- TOC entry 227 (class 1259 OID 549198)
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
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 227
-- Name: master_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_subjects_id_seq OWNED BY master_schema.master_subjects.id;


--
-- TOC entry 236 (class 1259 OID 549270)
-- Name: chapters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chapters (
    id integer NOT NULL,
    row_id text NOT NULL,
    subject_id text,
    school_id text,
    name text NOT NULL,
    description text,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.chapters OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 549269)
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chapters_id_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 235
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
-- TOC entry 238 (class 1259 OID 549286)
-- Name: chapters; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.chapters (
    id integer NOT NULL,
    row_id text NOT NULL,
    subject_id text,
    school_id text,
    name text NOT NULL,
    description text,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.chapters OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 549285)
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.chapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.chapters_id_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 237
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.chapters_id_seq OWNED BY school_schema.chapters.id;


--
-- TOC entry 232 (class 1259 OID 549238)
-- Name: class; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.class (
    id integer NOT NULL,
    row_id text NOT NULL,
    school_id text,
    teacher_id text,
    name text NOT NULL,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.class OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 549237)
-- Name: class_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.class_id_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 231
-- Name: class_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.class_id_seq OWNED BY school_schema.class.id;


--
-- TOC entry 220 (class 1259 OID 541174)
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
-- TOC entry 219 (class 1259 OID 541173)
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
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 219
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.schools_id_seq OWNED BY school_schema.schools.id;


--
-- TOC entry 240 (class 1259 OID 549330)
-- Name: students; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.students (
    id integer NOT NULL,
    row_id text NOT NULL,
    user_id text,
    class_id text,
    school_id text,
    name text,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.students OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 549329)
-- Name: students_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.students_id_seq OWNER TO postgres;

--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 239
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.students_id_seq OWNED BY school_schema.students.id;


--
-- TOC entry 234 (class 1259 OID 549254)
-- Name: subjects; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.subjects (
    id integer NOT NULL,
    row_id text NOT NULL,
    class_id text,
    school_id text,
    name text NOT NULL,
    description text,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.subjects OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 549253)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.subjects_id_seq OWNER TO postgres;

--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 233
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.subjects_id_seq OWNED BY school_schema.subjects.id;


--
-- TOC entry 218 (class 1259 OID 541161)
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
-- TOC entry 217 (class 1259 OID 541160)
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
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 217
-- Name: super_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.super_admin_id_seq OWNED BY school_schema.super_admin.id;


--
-- TOC entry 222 (class 1259 OID 541188)
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
-- TOC entry 221 (class 1259 OID 541187)
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
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.users_id_seq OWNED BY school_schema.users.id;


--
-- TOC entry 4756 (class 2604 OID 549179)
-- Name: master_board id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_board ALTER COLUMN id SET DEFAULT nextval('master_schema.master_board_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 549216)
-- Name: master_chapters id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters ALTER COLUMN id SET DEFAULT nextval('master_schema.master_chapters_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 549188)
-- Name: master_classes id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes ALTER COLUMN id SET DEFAULT nextval('master_schema.master_classes_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 549202)
-- Name: master_subjects id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects ALTER COLUMN id SET DEFAULT nextval('master_schema.master_subjects_id_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 549273)
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 549289)
-- Name: chapters id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.chapters ALTER COLUMN id SET DEFAULT nextval('school_schema.chapters_id_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 549241)
-- Name: class id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.class ALTER COLUMN id SET DEFAULT nextval('school_schema.class_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 541177)
-- Name: schools id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools ALTER COLUMN id SET DEFAULT nextval('school_schema.schools_id_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 549333)
-- Name: students id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.students ALTER COLUMN id SET DEFAULT nextval('school_schema.students_id_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 549257)
-- Name: subjects id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.subjects ALTER COLUMN id SET DEFAULT nextval('school_schema.subjects_id_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 541164)
-- Name: super_admin id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin ALTER COLUMN id SET DEFAULT nextval('school_schema.super_admin_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 541191)
-- Name: users id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users ALTER COLUMN id SET DEFAULT nextval('school_schema.users_id_seq'::regclass);


--
-- TOC entry 4964 (class 0 OID 549176)
-- Dependencies: 224
-- Data for Name: master_board; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_board (id, row_id, name) VALUES (1, 'board-cbse', 'CBSE') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name) VALUES (2, 'board-rbse', 'RBSE') ON CONFLICT DO NOTHING;


--
-- TOC entry 4970 (class 0 OID 549213)
-- Dependencies: 230
-- Data for Name: master_chapters; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name) VALUES (1, 'chap-cbse-1-math-1', 'sub-cbse-1-math', 'Numbers') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name) VALUES (2, 'chap-cbse-1-math-2', 'sub-cbse-1-math', 'Addition') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name) VALUES (3, 'chap-cbse-1-math-3', 'sub-cbse-1-math', 'Subtraction') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name) VALUES (4, 'chap-rbse-1-math-1', 'sub-rbse-1-math', 'गिनती') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name) VALUES (5, 'chap-rbse-1-math-2', 'sub-rbse-1-math', 'जोड़') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name) VALUES (6, 'chap-rbse-1-math-3', 'sub-rbse-1-math', 'घटाव') ON CONFLICT DO NOTHING;


--
-- TOC entry 4966 (class 0 OID 549185)
-- Dependencies: 226
-- Data for Name: master_classes; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (1, 'cls-cbse-1', 'board-cbse', 'Class 1') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (2, 'cls-cbse-2', 'board-cbse', 'Class 2') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (3, 'cls-cbse-3', 'board-cbse', 'Class 3') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (4, 'cls-cbse-4', 'board-cbse', 'Class 4') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (5, 'cls-cbse-5', 'board-cbse', 'Class 5') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (6, 'cls-rbse-1', 'board-rbse', 'Class 1') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (7, 'cls-rbse-2', 'board-rbse', 'Class 2') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (8, 'cls-rbse-3', 'board-rbse', 'Class 3') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (9, 'cls-rbse-4', 'board-rbse', 'Class 4') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name) VALUES (10, 'cls-rbse-5', 'board-rbse', 'Class 5') ON CONFLICT DO NOTHING;


--
-- TOC entry 4968 (class 0 OID 549199)
-- Dependencies: 228
-- Data for Name: master_subjects; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name) VALUES (1, 'sub-cbse-1-eng', 'cls-cbse-1', 'English') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name) VALUES (2, 'sub-cbse-1-math', 'cls-cbse-1', 'Math') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name) VALUES (3, 'sub-cbse-1-evs', 'cls-cbse-1', 'EVS') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name) VALUES (4, 'sub-rbse-1-hin', 'cls-rbse-1', 'Hindi') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name) VALUES (5, 'sub-rbse-1-math', 'cls-rbse-1', 'Math') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name) VALUES (6, 'sub-rbse-1-evs', 'cls-rbse-1', 'EVS') ON CONFLICT DO NOTHING;


--
-- TOC entry 4976 (class 0 OID 549270)
-- Dependencies: 236
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4978 (class 0 OID 549286)
-- Dependencies: 238
-- Data for Name: chapters; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (1, '1753200353229_DJfX', '1753200353225_kMH6', '1753200353181_HisA', 'Numbers', '', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (2, '1753200353235_OkxW', '1753200353225_kMH6', '1753200353181_HisA', 'Addition', '', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (3, '1753200353237_qxAD', '1753200353225_kMH6', '1753200353181_HisA', 'Subtraction', '', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (4, '1753200770929_rJHv', '1753200770925_a6iN', '1753200770878_klW5', 'गिनती', '', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (5, '1753200770936_g23g', '1753200770925_a6iN', '1753200770878_klW5', 'जोड़', '', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (6, '1753200770938_Zbju', '1753200770925_a6iN', '1753200770878_klW5', 'घटाव', '', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (7, '1753287067352_wqCx', '1753287067343_RIPc', '1753287067227_YNnz', 'Numbers', '', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (8, '1753287067372_2ZMD', '1753287067343_RIPc', '1753287067227_YNnz', 'Addition', '', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (9, '1753287067374_G55T', '1753287067343_RIPc', '1753287067227_YNnz', 'Subtraction', '', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (10, '1753288969782_7PAV', '1753288969776_aECb', '1753288969716_U4p6', 'गिनती', '', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (11, '1753288969790_KKKa', '1753288969776_aECb', '1753288969716_U4p6', 'जोड़', '', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on) VALUES (12, '1753288969791_iyjX', '1753288969776_aECb', '1753288969716_U4p6', 'घटाव', '', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;


--
-- TOC entry 4972 (class 0 OID 549238)
-- Dependencies: 232
-- Data for Name: class; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (1, '1753200353199_WX0Q', '1753200353181_HisA', 'null', 'Class 1', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (2, '1753200353241_zb9M', '1753200353181_HisA', 'null', 'Class 2', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (3, '1753200353245_D1A5', '1753200353181_HisA', 'null', 'Class 3', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (4, '1753200353249_qyid', '1753200353181_HisA', 'null', 'Class 4', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (5, '1753200353254_WORk', '1753200353181_HisA', 'null', 'Class 5', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (6, '1753200508814_ZBk3', '1753200508801_PoXb', 'null', 'Class 1', '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (7, '1753200508849_XPJA', '1753200508801_PoXb', 'null', 'Class 2', '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (8, '1753200508852_yt33', '1753200508801_PoXb', 'null', 'Class 3', '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (9, '1753200508856_xcL9', '1753200508801_PoXb', 'null', 'Class 4', '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (10, '1753200508862_17ex', '1753200508801_PoXb', 'null', 'Class 5', '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (11, '1753200770894_OuiI', '1753200770878_klW5', 'null', 'Class 1', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (12, '1753200770944_kFKL', '1753200770878_klW5', 'null', 'Class 2', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (13, '1753200770950_nzWG', '1753200770878_klW5', 'null', 'Class 3', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (14, '1753200770954_PUXy', '1753200770878_klW5', 'null', 'Class 4', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (15, '1753200770958_4BFD', '1753200770878_klW5', 'null', 'Class 5', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (16, '1753287067293_B138', '1753287067227_YNnz', 'null', 'Class 1', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (17, '1753287067391_ZzEn', '1753287067227_YNnz', 'null', 'Class 2', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (18, '1753287067405_YViL', '1753287067227_YNnz', 'null', 'Class 3', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (19, '1753287067410_MPCL', '1753287067227_YNnz', 'null', 'Class 4', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (20, '1753287067414_KfO7', '1753287067227_YNnz', 'null', 'Class 5', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (21, '1753288969743_NtTv', '1753288969716_U4p6', 'null', 'Class 1', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (22, '1753288969796_kWXB', '1753288969716_U4p6', 'null', 'Class 2', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (23, '1753288969800_q1yF', '1753288969716_U4p6', 'null', 'Class 3', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (24, '1753288969805_gB6E', '1753288969716_U4p6', 'null', 'Class 4', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (25, '1753288969809_BQwY', '1753288969716_U4p6', 'null', 'Class 5', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;


--
-- TOC entry 4960 (class 0 OID 541174)
-- Dependencies: 220
-- Data for Name: schools; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (1, '1729833318836_opVF', 'Sunrise Public School', 'contact@sunrise.edu.in', '9876543210', '123, MG Road, Delhi', true, 'CBSE-2025', '1729832842723_A9f6', '2025-07-21 20:45:26.156045', '2025-07-21 20:45:26.156045') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (2, '1729862517376_duwd', 'Green Valley International', 'info@greenvalley.org', '9123456780', '88, Nehru Nagar, Mumbai', true, 'ICSE-2025', '1729832842723_A9f6', '2025-07-21 20:45:26.156045', '2025-07-21 20:45:26.156045') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (3, '1753197452110_uwO0', 'jk', 'jk@gmail.com', '7891234567', 'gh', true, 'io', '1729832842723_A9f6', '2025-07-22 20:47:32.111166', '2025-07-22 20:47:32.111166') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (4, '1753197677899_H8NH', 'mk', 'mk@gmail.com', '9045678901', 'nljhgfc', true, 'kjbhv', '1729832842723_A9f6', '2025-07-22 20:51:17.90044', '2025-07-22 20:51:17.90044') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (5, '1753198492822_4eZr', 'qwer', 'qwer@dfs', '8097965456675', 'kmjhbgv', true, 'icse', '1729832842723_A9f6', '2025-07-22 21:04:52.824478', '2025-07-22 21:04:52.824478') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (6, '1753200141633_tRfl', 'sdf', 'xcbv@sghdf', '3456345', 'sdfgsd', true, 'cbse', '1729832842723_A9f6', '2025-07-22 21:32:21.634519', '2025-07-22 21:32:21.634519') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (7, '1753200353181_HisA', 'test', 'test@gmail.com', '123490', 'jk', true, 'board-cbse', '1729832842723_A9f6', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (8, '1753200508801_PoXb', 'test2', 'test2@gmail.com', '90123454', 'hello', true, 'board-rbse', '1729832842723_A9f6', '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (9, '1753200770878_klW5', 'test3', 'test3@gmail.com', '8903344565', 'jk', true, 'board-rbse', '1729832842723_A9f6', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (10, '1753287067227_YNnz', 'hello', 'hello123@gmail.com', '83446456344', 'hello', true, 'board-cbse', '1729832842723_A9f6', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (11, '1753288969716_U4p6', 'hello', 'test55@gmail.com', '89012345423', 'fgsdfg', true, 'board-rbse', NULL, '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;


--
-- TOC entry 4980 (class 0 OID 549330)
-- Dependencies: 240
-- Data for Name: students; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--



--
-- TOC entry 4974 (class 0 OID 549254)
-- Dependencies: 234
-- Data for Name: subjects; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (1, '1753200353211_vAFy', '1753200353199_WX0Q', '1753200353181_HisA', 'English', '', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (2, '1753200353225_kMH6', '1753200353199_WX0Q', '1753200353181_HisA', 'Math', '', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (3, '1753200353238_xSep', '1753200353199_WX0Q', '1753200353181_HisA', 'EVS', '', '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (4, '1753200508825_rF5m', '1753200508814_ZBk3', '1753200508801_PoXb', 'Hindi', '', '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (5, '1753200508838_KK8s', '1753200508814_ZBk3', '1753200508801_PoXb', 'Math', '', '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (6, '1753200508845_0gVv', '1753200508814_ZBk3', '1753200508801_PoXb', 'EVS', '', '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (7, '1753200770912_rV2H', '1753200770894_OuiI', '1753200770878_klW5', 'Hindi', '', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (8, '1753200770925_a6iN', '1753200770894_OuiI', '1753200770878_klW5', 'Math', '', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (9, '1753200770939_IcD4', '1753200770894_OuiI', '1753200770878_klW5', 'EVS', '', '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (10, '1753287067320_P9yN', '1753287067293_B138', '1753287067227_YNnz', 'English', '', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (11, '1753287067343_RIPc', '1753287067293_B138', '1753287067227_YNnz', 'Math', '', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (12, '1753287067381_fiqV', '1753287067293_B138', '1753287067227_YNnz', 'EVS', '', '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (13, '1753288969760_VM17', '1753288969743_NtTv', '1753288969716_U4p6', 'Hindi', '', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (14, '1753288969776_aECb', '1753288969743_NtTv', '1753288969716_U4p6', 'Math', '', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on) VALUES (15, '1753288969792_TWyX', '1753288969743_NtTv', '1753288969716_U4p6', 'EVS', '', '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;


--
-- TOC entry 4958 (class 0 OID 541161)
-- Dependencies: 218
-- Data for Name: super_admin; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.super_admin (id, row_id, name, email, password, user_type, cr_on, up_on) VALUES (1, '1729832842723_A9f6', 'Fintech', 'fintech@admin.com', '1234', 1, '2025-07-21 20:43:35.971272', '2025-07-21 20:43:35.971272') ON CONFLICT DO NOTHING;


--
-- TOC entry 4962 (class 0 OID 541188)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (3, '1729862581947_gSB6', '1729862517376_duwd', 'Neha Singh', 'neha@greenvalley.org', '1234', 2, true, '2025-07-21 20:47:47.558312', '2025-07-21 20:47:47.558312') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (2, '1730194518661_8l0z', '1729833318836_opVF', 'Manoj Verma', 'manoj@sunrise.edu.in', '1234', 3, true, '2025-07-21 20:47:47.558312', '2025-07-21 20:47:47.558312') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (1, '1730195703778_zSb1', '1729833318836_opVF', 'Anjali Mehta', 'anjali@sunrise.edu.in', '1234', 2, true, '2025-07-21 20:47:47.558312', '2025-07-21 20:47:47.558312') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (4, '1753197677899_Zj9t', '1753197677899_H8NH', 'mk', 'mk@gmail.com', 'undefined', 2, true, '2025-07-22 20:51:17.90044', '2025-07-22 20:51:17.90044') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (5, '1753198492823_NAT8', '1753198492822_4eZr', 'qwer', 'qwer@dfs', '1234', 2, true, '2025-07-22 21:04:52.824478', '2025-07-22 21:04:52.824478') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (6, '1753200141633_KP6w', '1753200141633_tRfl', 'sdf', 'xcbv@sghdf', '1234', 2, true, '2025-07-22 21:32:21.634519', '2025-07-22 21:32:21.634519') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (7, '1753200353181_dzUD', '1753200353181_HisA', 'test', 'test@gmail.com', '1234jk', 2, true, '2025-07-22 21:35:53.182393', '2025-07-22 21:35:53.182393') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (8, '1753200508801_flV2', '1753200508801_PoXb', 'test2', 'test2@gmail.com', '1234', 2, true, '2025-07-22 21:38:28.801873', '2025-07-22 21:38:28.801873') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (9, '1753200770878_qWqJ', '1753200770878_klW5', 'test3', 'test3@gmail.com', '1234', 2, true, '2025-07-22 21:42:50.879206', '2025-07-22 21:42:50.879206') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (10, '1753287067228_amBY', '1753287067227_YNnz', 'hello', 'hello123@gmail.com', '1234', 2, true, '2025-07-23 21:41:07.230909', '2025-07-23 21:41:07.230909') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (11, '1753288969716_M8mD', '1753288969716_U4p6', 'hello', 'test55@gmail.com', '1234', 2, true, '2025-07-23 22:12:49.717849', '2025-07-23 22:12:49.717849') ON CONFLICT DO NOTHING;


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 223
-- Name: master_board_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_board_id_seq', 2, true);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 229
-- Name: master_chapters_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_chapters_id_seq', 6, true);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 225
-- Name: master_classes_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_classes_id_seq', 10, true);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 227
-- Name: master_subjects_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_subjects_id_seq', 6, true);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 235
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chapters_id_seq', 1, false);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 237
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.chapters_id_seq', 12, true);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 231
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.class_id_seq', 25, true);


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 219
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.schools_id_seq', 11, true);


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 239
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.students_id_seq', 1, false);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 233
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.subjects_id_seq', 15, true);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 217
-- Name: super_admin_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.super_admin_id_seq', 1, true);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.users_id_seq', 11, true);


--
-- TOC entry 4788 (class 2606 OID 549183)
-- Name: master_board master_board_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_board
    ADD CONSTRAINT master_board_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4794 (class 2606 OID 549220)
-- Name: master_chapters master_chapters_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters
    ADD CONSTRAINT master_chapters_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4790 (class 2606 OID 549192)
-- Name: master_classes master_classes_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes
    ADD CONSTRAINT master_classes_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4792 (class 2606 OID 549206)
-- Name: master_subjects master_subjects_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects
    ADD CONSTRAINT master_subjects_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4800 (class 2606 OID 549279)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4802 (class 2606 OID 549295)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4796 (class 2606 OID 549247)
-- Name: class class_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4780 (class 2606 OID 541186)
-- Name: schools schools_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools
    ADD CONSTRAINT schools_email_key UNIQUE (email);


--
-- TOC entry 4782 (class 2606 OID 541184)
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4804 (class 2606 OID 549339)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4798 (class 2606 OID 549263)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4776 (class 2606 OID 541172)
-- Name: super_admin super_admin_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin
    ADD CONSTRAINT super_admin_email_key UNIQUE (email);


--
-- TOC entry 4778 (class 2606 OID 541170)
-- Name: super_admin super_admin_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin
    ADD CONSTRAINT super_admin_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4784 (class 2606 OID 541200)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4786 (class 2606 OID 541198)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4808 (class 2606 OID 549221)
-- Name: master_chapters master_chapters_subject_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters
    ADD CONSTRAINT master_chapters_subject_row_id_fkey FOREIGN KEY (subject_row_id) REFERENCES master_schema.master_subjects(row_id);


--
-- TOC entry 4806 (class 2606 OID 549193)
-- Name: master_classes master_classes_board_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes
    ADD CONSTRAINT master_classes_board_row_id_fkey FOREIGN KEY (board_row_id) REFERENCES master_schema.master_board(row_id);


--
-- TOC entry 4807 (class 2606 OID 549207)
-- Name: master_subjects master_subjects_class_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects
    ADD CONSTRAINT master_subjects_class_row_id_fkey FOREIGN KEY (class_row_id) REFERENCES master_schema.master_classes(row_id);


--
-- TOC entry 4811 (class 2606 OID 549280)
-- Name: chapters chapters_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES school_schema.subjects(row_id);


--
-- TOC entry 4812 (class 2606 OID 549296)
-- Name: chapters chapters_subject_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.chapters
    ADD CONSTRAINT chapters_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES school_schema.subjects(row_id);


--
-- TOC entry 4809 (class 2606 OID 549248)
-- Name: class class_school_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.class
    ADD CONSTRAINT class_school_id_fkey FOREIGN KEY (school_id) REFERENCES school_schema.schools(row_id);


--
-- TOC entry 4813 (class 2606 OID 549340)
-- Name: students students_user_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.students
    ADD CONSTRAINT students_user_id_fkey FOREIGN KEY (user_id) REFERENCES school_schema.users(row_id);


--
-- TOC entry 4810 (class 2606 OID 549264)
-- Name: subjects subjects_class_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.subjects
    ADD CONSTRAINT subjects_class_id_fkey FOREIGN KEY (class_id) REFERENCES school_schema.class(row_id);


--
-- TOC entry 4805 (class 2606 OID 541201)
-- Name: users users_school_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_school_id_fkey FOREIGN KEY (school_id) REFERENCES school_schema.schools(row_id);


-- Completed on 2025-07-23 22:26:22

--
-- PostgreSQL database dump complete
--

