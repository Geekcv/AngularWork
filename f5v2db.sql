--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-08-03 15:12:59

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
-- TOC entry 5035 (class 1262 OID 540983)
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
-- TOC entry 5 (class 2615 OID 582137)
-- Name: master_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA master_schema;


ALTER SCHEMA master_schema OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 582138)
-- Name: school_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA school_schema;


ALTER SCHEMA school_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 582139)
-- Name: master_board; Type: TABLE; Schema: master_schema; Owner: postgres
--

CREATE TABLE master_schema.master_board (
    id integer NOT NULL,
    row_id text NOT NULL,
    name text NOT NULL,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE master_schema.master_board OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 582146)
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
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 217
-- Name: master_board_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_board_id_seq OWNED BY master_schema.master_board.id;


--
-- TOC entry 218 (class 1259 OID 582147)
-- Name: master_chapters; Type: TABLE; Schema: master_schema; Owner: postgres
--

CREATE TABLE master_schema.master_chapters (
    id integer NOT NULL,
    row_id text NOT NULL,
    subject_row_id text NOT NULL,
    name text NOT NULL,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE master_schema.master_chapters OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 582154)
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
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 219
-- Name: master_chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_chapters_id_seq OWNED BY master_schema.master_chapters.id;


--
-- TOC entry 220 (class 1259 OID 582155)
-- Name: master_classes; Type: TABLE; Schema: master_schema; Owner: postgres
--

CREATE TABLE master_schema.master_classes (
    id integer NOT NULL,
    row_id text NOT NULL,
    board_row_id text NOT NULL,
    name text NOT NULL,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE master_schema.master_classes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 582162)
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
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 221
-- Name: master_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_classes_id_seq OWNED BY master_schema.master_classes.id;


--
-- TOC entry 222 (class 1259 OID 582163)
-- Name: master_subjects; Type: TABLE; Schema: master_schema; Owner: postgres
--

CREATE TABLE master_schema.master_subjects (
    id integer NOT NULL,
    row_id text NOT NULL,
    class_row_id text NOT NULL,
    name text NOT NULL,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE master_schema.master_subjects OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 582170)
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
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 223
-- Name: master_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_subjects_id_seq OWNED BY master_schema.master_subjects.id;


--
-- TOC entry 224 (class 1259 OID 582171)
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
    up_on timestamp without time zone DEFAULT now() NOT NULL,
    is_completed boolean DEFAULT false,
    completed_on timestamp without time zone,
    completed_by text
);


ALTER TABLE school_schema.chapters OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 582179)
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
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 225
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.chapters_id_seq OWNED BY school_schema.chapters.id;


--
-- TOC entry 226 (class 1259 OID 582180)
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
-- TOC entry 227 (class 1259 OID 582187)
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
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 227
-- Name: class_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.class_id_seq OWNED BY school_schema.class.id;


--
-- TOC entry 228 (class 1259 OID 582188)
-- Name: exams; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.exams (
    id integer NOT NULL,
    row_id text NOT NULL,
    subject_id text,
    chapter_id text,
    created_by text,
    name text NOT NULL,
    total_marks integer,
    passing_marks integer,
    duration_minutes integer,
    scheduled_on timestamp without time zone,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.exams OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 582195)
-- Name: exams_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.exams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.exams_id_seq OWNER TO postgres;

--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 229
-- Name: exams_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.exams_id_seq OWNED BY school_schema.exams.id;


--
-- TOC entry 230 (class 1259 OID 582196)
-- Name: mcqs; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.mcqs (
    id integer NOT NULL,
    row_id text NOT NULL,
    chapter_id text,
    question text NOT NULL,
    option_a text,
    option_b text,
    option_c text,
    option_d text,
    correct_option text,
    created_by text,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.mcqs OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 582203)
-- Name: mcqs_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.mcqs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.mcqs_id_seq OWNER TO postgres;

--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 231
-- Name: mcqs_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.mcqs_id_seq OWNED BY school_schema.mcqs.id;


--
-- TOC entry 245 (class 1259 OID 582393)
-- Name: questions; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.questions (
    id integer NOT NULL,
    row_id text NOT NULL,
    chapter_id text NOT NULL,
    type text,
    content text NOT NULL,
    options jsonb,
    correct_answer jsonb NOT NULL,
    marks integer DEFAULT 1,
    difficulty text,
    explanation text,
    created_by text,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.questions OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 582392)
-- Name: questions_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.questions_id_seq OWNER TO postgres;

--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 244
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.questions_id_seq OWNED BY school_schema.questions.id;


--
-- TOC entry 232 (class 1259 OID 582204)
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
-- TOC entry 233 (class 1259 OID 582212)
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
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 233
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.schools_id_seq OWNED BY school_schema.schools.id;


--
-- TOC entry 234 (class 1259 OID 582213)
-- Name: students; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.students (
    id integer NOT NULL,
    row_id text NOT NULL,
    name text,
    email text,
    phone text,
    password text,
    class_id text,
    school_id text,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL,
    user_row_id text
);


ALTER TABLE school_schema.students OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 582220)
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
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 235
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.students_id_seq OWNED BY school_schema.students.id;


--
-- TOC entry 236 (class 1259 OID 582221)
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
    up_on timestamp without time zone DEFAULT now() NOT NULL,
    teacher_id text
);


ALTER TABLE school_schema.subjects OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 582228)
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
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 237
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.subjects_id_seq OWNED BY school_schema.subjects.id;


--
-- TOC entry 238 (class 1259 OID 582229)
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
-- TOC entry 239 (class 1259 OID 582236)
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
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 239
-- Name: super_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.super_admin_id_seq OWNED BY school_schema.super_admin.id;


--
-- TOC entry 240 (class 1259 OID 582237)
-- Name: teachers; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.teachers (
    id integer NOT NULL,
    row_id text NOT NULL,
    name text,
    email text,
    phone text,
    password text,
    qualification text,
    school_id text,
    experience_years integer,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL,
    user_row_id text
);


ALTER TABLE school_schema.teachers OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 582244)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.teachers_id_seq OWNER TO postgres;

--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 241
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.teachers_id_seq OWNED BY school_schema.teachers.id;


--
-- TOC entry 242 (class 1259 OID 582245)
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
-- TOC entry 243 (class 1259 OID 582253)
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
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 243
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.users_id_seq OWNED BY school_schema.users.id;


--
-- TOC entry 4759 (class 2604 OID 582254)
-- Name: master_board id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_board ALTER COLUMN id SET DEFAULT nextval('master_schema.master_board_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 582255)
-- Name: master_chapters id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters ALTER COLUMN id SET DEFAULT nextval('master_schema.master_chapters_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 582256)
-- Name: master_classes id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes ALTER COLUMN id SET DEFAULT nextval('master_schema.master_classes_id_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 582257)
-- Name: master_subjects id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects ALTER COLUMN id SET DEFAULT nextval('master_schema.master_subjects_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 582258)
-- Name: chapters id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.chapters ALTER COLUMN id SET DEFAULT nextval('school_schema.chapters_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 582259)
-- Name: class id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.class ALTER COLUMN id SET DEFAULT nextval('school_schema.class_id_seq'::regclass);


--
-- TOC entry 4778 (class 2604 OID 582260)
-- Name: exams id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.exams ALTER COLUMN id SET DEFAULT nextval('school_schema.exams_id_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 582261)
-- Name: mcqs id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.mcqs ALTER COLUMN id SET DEFAULT nextval('school_schema.mcqs_id_seq'::regclass);


--
-- TOC entry 4804 (class 2604 OID 582396)
-- Name: questions id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.questions ALTER COLUMN id SET DEFAULT nextval('school_schema.questions_id_seq'::regclass);


--
-- TOC entry 4784 (class 2604 OID 582262)
-- Name: schools id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools ALTER COLUMN id SET DEFAULT nextval('school_schema.schools_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 582263)
-- Name: students id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.students ALTER COLUMN id SET DEFAULT nextval('school_schema.students_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 582264)
-- Name: subjects id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.subjects ALTER COLUMN id SET DEFAULT nextval('school_schema.subjects_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 582265)
-- Name: super_admin id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin ALTER COLUMN id SET DEFAULT nextval('school_schema.super_admin_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 582266)
-- Name: teachers id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.teachers ALTER COLUMN id SET DEFAULT nextval('school_schema.teachers_id_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 582267)
-- Name: users id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users ALTER COLUMN id SET DEFAULT nextval('school_schema.users_id_seq'::regclass);


--
-- TOC entry 5000 (class 0 OID 582139)
-- Dependencies: 216
-- Data for Name: master_board; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (5, '1753514986841_BNB0', 'CBSE', '2025-07-26 12:59:46.924467', '2025-07-26 12:59:46.924467') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (6, '1753515007425_7ayH', 'RBSE', '2025-07-26 13:00:09.505668', '2025-07-26 13:00:09.505668') ON CONFLICT DO NOTHING;


--
-- TOC entry 5002 (class 0 OID 582147)
-- Dependencies: 218
-- Data for Name: master_chapters; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (12, '1753515171648_y4d1', '1753515148764_CVCM', 'number', '2025-07-26 13:02:51.649768', '2025-07-26 13:02:51.649768') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (13, '1753515188573_IqDb', '1753515122547_zqPz', 'opps', '2025-07-26 13:03:08.576808', '2025-07-26 13:03:08.576808') ON CONFLICT DO NOTHING;


--
-- TOC entry 5004 (class 0 OID 582155)
-- Dependencies: 220
-- Data for Name: master_classes; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (15, '1753515038002_Gp8q', '1753514986841_BNB0', 'Class 1', '2025-07-26 13:00:38.076023', '2025-07-26 13:00:38.076023') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (16, '1753515057161_KV3S', '1753514986841_BNB0', 'class 2', '2025-07-26 13:00:57.237603', '2025-07-26 13:00:57.237603') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (17, '1753515084327_1Qih', '1753515007425_7ayH', 'class 10', '2025-07-26 13:01:26.679543', '2025-07-26 13:01:26.679543') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (18, '1753515102712_BWP7', '1753515007425_7ayH', 'class 12', '2025-07-26 13:01:42.821246', '2025-07-26 13:01:42.821246') ON CONFLICT DO NOTHING;


--
-- TOC entry 5006 (class 0 OID 582163)
-- Dependencies: 222
-- Data for Name: master_subjects; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (15, '1753515122547_zqPz', '1753515102712_BWP7', 'Java', '2025-07-26 13:02:02.548892', '2025-07-26 13:02:02.548892') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (16, '1753515139713_mSa5', '1753515102712_BWP7', 'cpp', '2025-07-26 13:02:19.715174', '2025-07-26 13:02:19.715174') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (17, '1753515148764_CVCM', '1753515057161_KV3S', 'math', '2025-07-26 13:02:28.765935', '2025-07-26 13:02:28.765935') ON CONFLICT DO NOTHING;


--
-- TOC entry 5008 (class 0 OID 582171)
-- Dependencies: 224
-- Data for Name: chapters; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (45, '1753517539773_J0I0', '1753517539754_Ueau', '1753517539711_lNn3', 'opps', '', '2025-07-26 13:42:19.713506', '2025-07-27 10:37:53.017943', true, '2025-07-27 05:07:53.016', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (47, '1754112455482_Xasb', '1754111963630_gFsd', '1753517539711_lNn3', 'lp', NULL, '2025-08-02 10:57:35.667645', '2025-08-02 10:57:35.667645', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (48, '1754112504313_ucYC', '1753517539780_SG2I', '1753517539711_lNn3', 'operatores', NULL, '2025-08-02 10:58:24.314814', '2025-08-02 10:58:34.556058', true, '2025-08-02 05:28:34.554', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5010 (class 0 OID 582180)
-- Dependencies: 226
-- Data for Name: class; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (66, '1753517539733_Lmly', '1753517539711_lNn3', 'null', 'class 10', '2025-07-26 13:42:19.713506', '2025-07-26 13:42:19.713506') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (67, '1753517539746_TptI', '1753517539711_lNn3', 'null', 'class 12', '2025-07-26 13:42:19.713506', '2025-07-26 13:42:19.713506') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (68, '1753521886621_OtsB', '1753517539711_lNn3', NULL, 'class 9', '2025-07-26 14:54:46.624143', '2025-07-26 14:54:46.624143') ON CONFLICT DO NOTHING;


--
-- TOC entry 5012 (class 0 OID 582188)
-- Dependencies: 228
-- Data for Name: exams; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--



--
-- TOC entry 5014 (class 0 OID 582196)
-- Dependencies: 230
-- Data for Name: mcqs; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.mcqs (id, row_id, chapter_id, question, option_a, option_b, option_c, option_d, correct_option, created_by, cr_on, up_on) VALUES (1, '1753593631761_EvB3', '1753517539773_J0I0', 'What is your name', 'kirti', 'kundan', 'abhi', 'hlle', 'C', NULL, '2025-07-27 10:50:32.124919', '2025-07-27 10:50:32.124919') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.mcqs (id, row_id, chapter_id, question, option_a, option_b, option_c, option_d, correct_option, created_by, cr_on, up_on) VALUES (2, '1754111815953_9QCQ', '1753517539773_J0I0', 'kl', 'm', 'l', 'p', 'm', 'C', NULL, '2025-08-02 10:46:56.11123', '2025-08-02 10:46:56.11123') ON CONFLICT DO NOTHING;


--
-- TOC entry 5029 (class 0 OID 582393)
-- Dependencies: 245
-- Data for Name: questions; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, marks, difficulty, explanation, created_by, cr_on, up_on) VALUES (1, '1754121274548_cICQ', '1754112504313_ucYC', 'video_mcq', 'mknbv', 'null', '{}', 1, 'medium', NULL, '1753517638889_jmXA', '2025-08-02 13:24:34.737435', '2025-08-02 13:24:34.737435') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, marks, difficulty, explanation, created_by, cr_on, up_on) VALUES (2, '1754121575063_zt2A', '1753517539773_J0I0', 'checkbox', 'klmo', '[{"text": "op", "label": "A"}, {"text": "ml", "label": "B"}, {"text": "ui", "label": "C"}, {"text": "op", "label": "D"}]', '{"selected": ["C"]}', 1, 'medium', NULL, '1753517638889_jmXA', '2025-08-02 13:29:35.246488', '2025-08-02 13:29:35.246488') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, marks, difficulty, explanation, created_by, cr_on, up_on) VALUES (3, '1754121622307_Mb7W', '1754112504313_ucYC', 'checkbox', 'uio', '[{"text": "ner", "label": "A"}, {"text": "wer", "label": "B"}, {"text": "qw", "label": "C"}, {"text": "yui", "label": "D"}]', '{"selected": ["A", "C"]}', 1, 'medium', NULL, '1753517638889_jmXA', '2025-08-02 13:30:24.476345', '2025-08-02 13:30:24.476345') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, marks, difficulty, explanation, created_by, cr_on, up_on) VALUES (4, '1754121672699_DGLU', '1753517539773_J0I0', 'mcq', 'cvhxghdf', '[{"text": "fdgh", "label": "A"}, {"text": "fgsd", "label": "B"}, {"text": "fds", "label": "C"}, {"text": "cvn", "label": "D"}]', '{"selected": "D"}', 1, 'medium', NULL, '1753517638889_jmXA', '2025-08-02 13:31:12.870509', '2025-08-02 13:31:12.870509') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, marks, difficulty, explanation, created_by, cr_on, up_on) VALUES (5, '1754121903515_W3HK', '1753517539773_J0I0', 'image_mcq', 'jklbhvgh', 'null', '{}', 1, 'medium', NULL, '1753517638889_jmXA', '2025-08-02 13:35:03.729684', '2025-08-02 13:35:03.729684') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, marks, difficulty, explanation, created_by, cr_on, up_on) VALUES (6, '1754122088511_veHD', '1753517539773_J0I0', 'image_mcq', 'iop', '[{"text": "jk", "label": "A"}, {"text": "mk", "label": "B"}, {"text": "yu", "label": "C"}, {"text": "kl", "label": "D"}]', '{"selected": "B"}', 1, 'medium', NULL, '1753517638889_jmXA', '2025-08-02 13:38:08.691449', '2025-08-02 13:38:08.691449') ON CONFLICT DO NOTHING;


--
-- TOC entry 5016 (class 0 OID 582204)
-- Dependencies: 232
-- Data for Name: schools; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on) VALUES (21, '1753517539711_lNn3', 'lucky', 'lucky@gmail.com', '78912345566', 'mandore', true, '1753515007425_7ayH', '1729832842723_A9f6', '2025-07-26 13:42:19.713506', '2025-07-26 13:42:19.713506') ON CONFLICT DO NOTHING;


--
-- TOC entry 5018 (class 0 OID 582213)
-- Dependencies: 234
-- Data for Name: students; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (5, '1753524932465_LLZy', 'abhi', 'abhi@gamil.com', '8901234', '1234', '1753517539733_Lmly', '1753517539711_lNn3', '2025-07-26 15:45:32.466696', '2025-07-26 15:45:32.466696', '1753524932465_Il6Z') ON CONFLICT DO NOTHING;


--
-- TOC entry 5020 (class 0 OID 582221)
-- Dependencies: 236
-- Data for Name: subjects; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (51, '1753517539754_Ueau', '1753517539746_TptI', '1753517539711_lNn3', 'Java', '', '2025-07-26 13:42:19.713506', '2025-07-26 14:51:14.740589', '1753517638889_jmXA') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (52, '1753517539780_SG2I', '1753517539746_TptI', '1753517539711_lNn3', 'cpp', '', '2025-07-26 13:42:19.713506', '2025-07-26 14:52:29.803152', '1753517638889_jmXA') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (53, '1753521894851_sEiT', '1753521886621_OtsB', '1753517539711_lNn3', 'hindi', NULL, '2025-07-26 14:54:54.85375', '2025-07-26 14:55:04.463569', '1753517638889_jmXA') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (54, '1753522495767_cFaX', '1753517539733_Lmly', '1753517539711_lNn3', 'english', NULL, '2025-07-26 15:04:55.769409', '2025-07-26 15:05:05.556704', '1753517670049_y7zc') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (55, '1753523643296_woCi', '1753517539746_TptI', '1753517539711_lNn3', 'phyton', NULL, '2025-07-26 15:24:03.46406', '2025-07-26 15:24:14.900388', '1753523546482_DgVK') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (56, '1754111963630_gFsd', '1753517539746_TptI', '1753517539711_lNn3', 'io', NULL, '2025-08-02 10:49:23.632632', '2025-08-02 10:49:23.632632', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5022 (class 0 OID 582229)
-- Dependencies: 238
-- Data for Name: super_admin; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.super_admin (id, row_id, name, email, password, user_type, cr_on, up_on) VALUES (1, '1729832842723_A9f6', 'Fintech', 'fintech@admin.com', '1234', 1, '2025-07-21 20:43:35.971272', '2025-07-21 20:43:35.971272') ON CONFLICT DO NOTHING;


--
-- TOC entry 5024 (class 0 OID 582237)
-- Dependencies: 240
-- Data for Name: teachers; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (9, '1753517638889_Y0FO', 'deepak', 'deepak@gmail.com', '901234', '1234', 'mca', '1753517539711_lNn3', 3, '2025-07-26 13:43:58.890658', '2025-07-26 13:43:58.890658', '1753517638889_jmXA') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (10, '1753517670049_Nugj', 'surab', 'surab@gmail.com', '56789', '1234', 'bca', '1753517539711_lNn3', 2, '2025-07-26 13:44:30.049574', '2025-07-26 13:44:30.049574', '1753517670049_y7zc') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (11, '1753523546482_oYiB', 'kundan', 'kundan@gmail.com', '90123411', '1234', 'mca', '1753517539711_lNn3', 1, '2025-07-26 15:22:26.483322', '2025-07-26 15:22:26.483322', '1753523546482_DgVK') ON CONFLICT DO NOTHING;


--
-- TOC entry 5026 (class 0 OID 582245)
-- Dependencies: 242
-- Data for Name: users; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (36, '1753517539711_U3db', '1753517539711_lNn3', 'lucky', 'lucky@gmail.com', '1234', 2, true, '2025-07-26 13:42:19.713506', '2025-07-26 13:42:19.713506') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (37, '1753517638889_jmXA', '1753517539711_lNn3', 'deepak', 'deepak@gmail.com', '1234', 3, true, '2025-07-26 13:43:58.890658', '2025-07-26 13:43:58.890658') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (38, '1753517670049_y7zc', '1753517539711_lNn3', 'surab', 'surab@gmail.com', '1234', 3, true, '2025-07-26 13:44:30.049574', '2025-07-26 13:44:30.049574') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (39, '1753523546482_DgVK', '1753517539711_lNn3', 'kundan', 'kundan@gmail.com', '1234', 3, true, '2025-07-26 15:22:26.483322', '2025-07-26 15:22:26.483322') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (40, '1753524932465_Il6Z', '1753517539711_lNn3', 'abhi', 'abhi@gamil.com', '1234', 4, true, '2025-07-26 15:45:32.466696', '2025-07-26 15:45:32.466696') ON CONFLICT DO NOTHING;


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 217
-- Name: master_board_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_board_id_seq', 6, true);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 219
-- Name: master_chapters_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_chapters_id_seq', 13, true);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 221
-- Name: master_classes_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_classes_id_seq', 18, true);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 223
-- Name: master_subjects_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_subjects_id_seq', 17, true);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 225
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.chapters_id_seq', 48, true);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 227
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.class_id_seq', 68, true);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 229
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.exams_id_seq', 1, false);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 231
-- Name: mcqs_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.mcqs_id_seq', 2, true);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 244
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.questions_id_seq', 6, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 233
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.schools_id_seq', 21, true);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 235
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.students_id_seq', 5, true);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 237
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.subjects_id_seq', 56, true);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 239
-- Name: super_admin_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.super_admin_id_seq', 1, true);


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 241
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.teachers_id_seq', 11, true);


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 243
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.users_id_seq', 40, true);


--
-- TOC entry 4809 (class 2606 OID 582269)
-- Name: master_board master_board_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_board
    ADD CONSTRAINT master_board_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4811 (class 2606 OID 582271)
-- Name: master_chapters master_chapters_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters
    ADD CONSTRAINT master_chapters_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4813 (class 2606 OID 582273)
-- Name: master_classes master_classes_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes
    ADD CONSTRAINT master_classes_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4815 (class 2606 OID 582275)
-- Name: master_subjects master_subjects_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects
    ADD CONSTRAINT master_subjects_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4817 (class 2606 OID 582277)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4819 (class 2606 OID 582279)
-- Name: class class_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4821 (class 2606 OID 582281)
-- Name: exams exams_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4823 (class 2606 OID 582283)
-- Name: mcqs mcqs_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.mcqs
    ADD CONSTRAINT mcqs_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4843 (class 2606 OID 582403)
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4845 (class 2606 OID 582405)
-- Name: questions questions_row_id_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.questions
    ADD CONSTRAINT questions_row_id_key UNIQUE (row_id);


--
-- TOC entry 4825 (class 2606 OID 582285)
-- Name: schools schools_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools
    ADD CONSTRAINT schools_email_key UNIQUE (email);


--
-- TOC entry 4827 (class 2606 OID 582287)
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4829 (class 2606 OID 582289)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4831 (class 2606 OID 582291)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4833 (class 2606 OID 582293)
-- Name: super_admin super_admin_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin
    ADD CONSTRAINT super_admin_email_key UNIQUE (email);


--
-- TOC entry 4835 (class 2606 OID 582295)
-- Name: super_admin super_admin_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin
    ADD CONSTRAINT super_admin_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4837 (class 2606 OID 582297)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4839 (class 2606 OID 582299)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4841 (class 2606 OID 582301)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4846 (class 2606 OID 582302)
-- Name: master_chapters master_chapters_subject_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters
    ADD CONSTRAINT master_chapters_subject_row_id_fkey FOREIGN KEY (subject_row_id) REFERENCES master_schema.master_subjects(row_id);


--
-- TOC entry 4847 (class 2606 OID 582307)
-- Name: master_classes master_classes_board_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes
    ADD CONSTRAINT master_classes_board_row_id_fkey FOREIGN KEY (board_row_id) REFERENCES master_schema.master_board(row_id);


--
-- TOC entry 4848 (class 2606 OID 582312)
-- Name: master_subjects master_subjects_class_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects
    ADD CONSTRAINT master_subjects_class_row_id_fkey FOREIGN KEY (class_row_id) REFERENCES master_schema.master_classes(row_id);


--
-- TOC entry 4849 (class 2606 OID 582317)
-- Name: chapters chapters_subject_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.chapters
    ADD CONSTRAINT chapters_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES school_schema.subjects(row_id);


--
-- TOC entry 4850 (class 2606 OID 582322)
-- Name: class class_school_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.class
    ADD CONSTRAINT class_school_id_fkey FOREIGN KEY (school_id) REFERENCES school_schema.schools(row_id);


--
-- TOC entry 4851 (class 2606 OID 582327)
-- Name: mcqs mcqs_chapter_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.mcqs
    ADD CONSTRAINT mcqs_chapter_id_fkey FOREIGN KEY (chapter_id) REFERENCES school_schema.chapters(row_id);


--
-- TOC entry 4856 (class 2606 OID 582406)
-- Name: questions questions_chapter_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.questions
    ADD CONSTRAINT questions_chapter_id_fkey FOREIGN KEY (chapter_id) REFERENCES school_schema.chapters(row_id);


--
-- TOC entry 4852 (class 2606 OID 582332)
-- Name: students students_user_row_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.students
    ADD CONSTRAINT students_user_row_id_fkey FOREIGN KEY (user_row_id) REFERENCES school_schema.users(row_id);


--
-- TOC entry 4853 (class 2606 OID 582337)
-- Name: subjects subjects_class_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.subjects
    ADD CONSTRAINT subjects_class_id_fkey FOREIGN KEY (class_id) REFERENCES school_schema.class(row_id);


--
-- TOC entry 4854 (class 2606 OID 582342)
-- Name: teachers teachers_user_row_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.teachers
    ADD CONSTRAINT teachers_user_row_id_fkey FOREIGN KEY (user_row_id) REFERENCES school_schema.users(row_id);


--
-- TOC entry 4855 (class 2606 OID 582347)
-- Name: users users_school_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_school_id_fkey FOREIGN KEY (school_id) REFERENCES school_schema.schools(row_id);


-- Completed on 2025-08-03 15:13:00

--
-- PostgreSQL database dump complete
--

