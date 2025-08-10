--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-08-10 14:20:51

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
-- TOC entry 5029 (class 1262 OID 540983)
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
-- TOC entry 5 (class 2615 OID 590329)
-- Name: master_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA master_schema;


ALTER SCHEMA master_schema OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 590330)
-- Name: school_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA school_schema;


ALTER SCHEMA school_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 590331)
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
-- TOC entry 217 (class 1259 OID 590338)
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
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 217
-- Name: master_board_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_board_id_seq OWNED BY master_schema.master_board.id;


--
-- TOC entry 218 (class 1259 OID 590339)
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
-- TOC entry 219 (class 1259 OID 590346)
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
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 219
-- Name: master_chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_chapters_id_seq OWNED BY master_schema.master_chapters.id;


--
-- TOC entry 220 (class 1259 OID 590347)
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
-- TOC entry 221 (class 1259 OID 590354)
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
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 221
-- Name: master_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_classes_id_seq OWNED BY master_schema.master_classes.id;


--
-- TOC entry 222 (class 1259 OID 590355)
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
-- TOC entry 223 (class 1259 OID 590362)
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
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 223
-- Name: master_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: master_schema; Owner: postgres
--

ALTER SEQUENCE master_schema.master_subjects_id_seq OWNED BY master_schema.master_subjects.id;


--
-- TOC entry 224 (class 1259 OID 590363)
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
-- TOC entry 225 (class 1259 OID 590371)
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
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 225
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.chapters_id_seq OWNED BY school_schema.chapters.id;


--
-- TOC entry 226 (class 1259 OID 590372)
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
-- TOC entry 227 (class 1259 OID 590379)
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
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 227
-- Name: class_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.class_id_seq OWNED BY school_schema.class.id;


--
-- TOC entry 245 (class 1259 OID 598521)
-- Name: exam_submissions; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.exam_submissions (
    id integer NOT NULL,
    row_id text NOT NULL,
    exam_id text,
    student_id text,
    question_id text,
    selected_answer jsonb,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE school_schema.exam_submissions OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 598520)
-- Name: exam_submissions_id_seq; Type: SEQUENCE; Schema: school_schema; Owner: postgres
--

CREATE SEQUENCE school_schema.exam_submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE school_schema.exam_submissions_id_seq OWNER TO postgres;

--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 244
-- Name: exam_submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.exam_submissions_id_seq OWNED BY school_schema.exam_submissions.id;


--
-- TOC entry 228 (class 1259 OID 590380)
-- Name: exams; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.exams (
    id integer NOT NULL,
    row_id text NOT NULL,
    chapter_id text,
    created_by text,
    name text NOT NULL,
    total_marks integer,
    passing_marks integer,
    duration_minutes integer,
    scheduled_on timestamp without time zone,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL,
    question_set jsonb
);


ALTER TABLE school_schema.exams OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 590387)
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
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 229
-- Name: exams_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.exams_id_seq OWNED BY school_schema.exams.id;


--
-- TOC entry 230 (class 1259 OID 590388)
-- Name: questions; Type: TABLE; Schema: school_schema; Owner: postgres
--

CREATE TABLE school_schema.questions (
    id integer NOT NULL,
    row_id text NOT NULL,
    chapter_id text,
    type text,
    content text NOT NULL,
    options jsonb,
    correct_answer jsonb NOT NULL,
    created_by text,
    cr_on timestamp without time zone DEFAULT now() NOT NULL,
    up_on timestamp without time zone DEFAULT now() NOT NULL,
    media_file text,
    class_id text,
    subject_id text
);


ALTER TABLE school_schema.questions OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 590395)
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
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 231
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.questions_id_seq OWNED BY school_schema.questions.id;


--
-- TOC entry 232 (class 1259 OID 590396)
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
    up_on timestamp without time zone DEFAULT now() NOT NULL,
    user_row_id text
);


ALTER TABLE school_schema.schools OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 590404)
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
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 233
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.schools_id_seq OWNED BY school_schema.schools.id;


--
-- TOC entry 234 (class 1259 OID 590405)
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
-- TOC entry 235 (class 1259 OID 590412)
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
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 235
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.students_id_seq OWNED BY school_schema.students.id;


--
-- TOC entry 236 (class 1259 OID 590413)
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
-- TOC entry 237 (class 1259 OID 590420)
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
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 237
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.subjects_id_seq OWNED BY school_schema.subjects.id;


--
-- TOC entry 238 (class 1259 OID 590421)
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
-- TOC entry 239 (class 1259 OID 590428)
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
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 239
-- Name: super_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.super_admin_id_seq OWNED BY school_schema.super_admin.id;


--
-- TOC entry 240 (class 1259 OID 590429)
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
-- TOC entry 241 (class 1259 OID 590436)
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
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 241
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.teachers_id_seq OWNED BY school_schema.teachers.id;


--
-- TOC entry 242 (class 1259 OID 590437)
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
-- TOC entry 243 (class 1259 OID 590445)
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
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 243
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: school_schema; Owner: postgres
--

ALTER SEQUENCE school_schema.users_id_seq OWNED BY school_schema.users.id;


--
-- TOC entry 4759 (class 2604 OID 590446)
-- Name: master_board id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_board ALTER COLUMN id SET DEFAULT nextval('master_schema.master_board_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 590447)
-- Name: master_chapters id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters ALTER COLUMN id SET DEFAULT nextval('master_schema.master_chapters_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 590448)
-- Name: master_classes id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes ALTER COLUMN id SET DEFAULT nextval('master_schema.master_classes_id_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 590449)
-- Name: master_subjects id; Type: DEFAULT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects ALTER COLUMN id SET DEFAULT nextval('master_schema.master_subjects_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 590450)
-- Name: chapters id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.chapters ALTER COLUMN id SET DEFAULT nextval('school_schema.chapters_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 590451)
-- Name: class id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.class ALTER COLUMN id SET DEFAULT nextval('school_schema.class_id_seq'::regclass);


--
-- TOC entry 4804 (class 2604 OID 598524)
-- Name: exam_submissions id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.exam_submissions ALTER COLUMN id SET DEFAULT nextval('school_schema.exam_submissions_id_seq'::regclass);


--
-- TOC entry 4778 (class 2604 OID 590452)
-- Name: exams id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.exams ALTER COLUMN id SET DEFAULT nextval('school_schema.exams_id_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 590453)
-- Name: questions id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.questions ALTER COLUMN id SET DEFAULT nextval('school_schema.questions_id_seq'::regclass);


--
-- TOC entry 4784 (class 2604 OID 590454)
-- Name: schools id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools ALTER COLUMN id SET DEFAULT nextval('school_schema.schools_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 590455)
-- Name: students id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.students ALTER COLUMN id SET DEFAULT nextval('school_schema.students_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 590456)
-- Name: subjects id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.subjects ALTER COLUMN id SET DEFAULT nextval('school_schema.subjects_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 590457)
-- Name: super_admin id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin ALTER COLUMN id SET DEFAULT nextval('school_schema.super_admin_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 590458)
-- Name: teachers id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.teachers ALTER COLUMN id SET DEFAULT nextval('school_schema.teachers_id_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 590459)
-- Name: users id; Type: DEFAULT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users ALTER COLUMN id SET DEFAULT nextval('school_schema.users_id_seq'::regclass);


--
-- TOC entry 4994 (class 0 OID 590331)
-- Dependencies: 216
-- Data for Name: master_board; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (86, '1754568157882_yd98', 'asdfasdfgsdfgsdfgsdfg', '2025-08-07 05:02:37.913686', '2025-08-07 05:02:37.913686') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (87, '1754568713814_decu', 'test1741', '2025-08-07 05:11:53.84235', '2025-08-07 05:11:53.84235') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (21, '1753804190992_aQvL', 'RBSE', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (22, '1753804190992_LhTO', 'BSEB', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (23, '1753804190992_xHZK', 'MPBSE', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (24, '1753804190992_csm3', 'GSEB', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (25, '1753804190992_e2Pw', 'HBSE', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (20, '1753804190992_hPwF', 'CBSE', '2025-07-29 15:35:03', '2025-07-30 05:06:15.953203') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_board (id, row_id, name, cr_on, up_on) VALUES (31, '1753939583049_dccP', 'Abhishek4', '2025-07-30 22:26:23.088051', '2025-08-04 01:26:44.608821') ON CONFLICT DO NOTHING;


--
-- TOC entry 4996 (class 0 OID 590339)
-- Dependencies: 218
-- Data for Name: master_chapters; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (57, '1753804190993_JShw', '1753804190993_lsdo', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (58, '1753804190993_c6T5', '1753804190993_lsdo', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (59, '1753804190993_CL4i', '1753804190993_lsdo', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (60, '1753804190993_eII5', '1753804190993_lsdo', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (61, '1753804190993_9ONk', '1753804190993_lsdo', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (62, '1753804190993_dmpb', '1753804190993_lsdo', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (63, '1753804190993_fzWU', '1753804190993_lsdo', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (64, '1753804190993_q9S6', '1753804190993_lsdo', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (65, '1753804190993_uaDj', '1753804190993_lsdo', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (66, '1753804190993_Pqoq', '1753804190993_lsdo', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (67, '1753804190993_SLqy', '1753804190993_lsdo', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (68, '1753804190993_R9mc', '1753804190993_lsdo', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (69, '1753804190993_Q628', '1753804190993_lsdo', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (70, '1753804190993_4elm', '1753804190993_lsdo', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (71, '1753804190993_fKog', '1753804190993_lsdo', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (72, '1753804190993_oH98', '1753804190993_lsdo', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (73, '1753804190993_oXFd', '1753804190993_xEv9', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (74, '1753804190993_pAdt', '1753804190993_xEv9', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (75, '1753804190993_vVzL', '1753804190993_xEv9', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (76, '1753804190993_vl8w', '1753804190993_xEv9', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (77, '1753804190993_btRX', '1753804190993_xEv9', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (78, '1753804190993_ArAW', '1753804190993_xEv9', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (79, '1753804190993_789y', '1753804190993_xEv9', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (80, '1753804190993_XJ7I', '1753804190993_xEv9', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (81, '1753804190993_o7Ma', '1753804190993_xEv9', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (82, '1753804190993_olgo', '1753804190993_xEv9', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (83, '1753804190993_INsg', '1753804190993_xEv9', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (84, '1753804190993_ubMG', '1753804190993_xEv9', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (85, '1753804190993_JyZm', '1753804190993_xEv9', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (86, '1753804190993_fUwW', '1753804190993_xEv9', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (87, '1753804190993_xPdq', '1753804190993_xEv9', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (88, '1753804190993_Nam4', '1753804190993_xEv9', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (89, '1753804190993_x6Zg', '1753804190993_NL5a', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (90, '1753804190993_BpAO', '1753804190993_NL5a', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (91, '1753804190993_ZqL4', '1753804190993_NL5a', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (92, '1753804190993_91Ja', '1753804190993_NL5a', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (93, '1753804190993_0Woe', '1753804190993_NL5a', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (94, '1753804190993_ZUF0', '1753804190993_NL5a', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (95, '1753804190993_Wsrp', '1753804190993_NL5a', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (96, '1753804190993_uoWL', '1753804190993_NL5a', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (97, '1753804190993_BLLt', '1753804190993_NL5a', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (98, '1753804190993_pXwo', '1753804190993_NL5a', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (99, '1753804190993_lgeS', '1753804190993_NL5a', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (100, '1753804190993_62cP', '1753804190993_NL5a', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (101, '1753804190993_q4V2', '1753804190993_NL5a', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (102, '1753804190993_JVb5', '1753804190993_NL5a', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (103, '1753804190993_gfYL', '1753804190993_NL5a', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (104, '1753804190993_1Q4q', '1753804190993_NL5a', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (105, '1753804190993_DijP', '1753804190993_WA6g', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (106, '1753804190993_eSxq', '1753804190993_WA6g', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (107, '1753804190993_ejrL', '1753804190993_WA6g', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (108, '1753804190993_gBzU', '1753804190993_WA6g', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (109, '1753804190993_Kge0', '1753804190993_WA6g', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (110, '1753804190993_yRNK', '1753804190993_WA6g', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (111, '1753804190993_lqqZ', '1753804190993_WA6g', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (112, '1753804190993_ntj6', '1753804190993_WA6g', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (113, '1753804190993_gEqe', '1753804190993_WA6g', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (114, '1753804190993_TVaN', '1753804190993_WA6g', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (115, '1753804190993_wBdc', '1753804190993_WA6g', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (116, '1753804190993_Uf1P', '1753804190993_WA6g', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (117, '1753804190993_txIK', '1753804190993_WA6g', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (118, '1753804190993_75Gw', '1753804190993_WA6g', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (119, '1753804190993_gvxn', '1753804190993_WA6g', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (120, '1753804190993_6NM4', '1753804190993_WA6g', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (121, '1753804190993_olbW', '1753804190993_5j3H', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (122, '1753804190993_4Heo', '1753804190993_5j3H', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (123, '1753804190993_10De', '1753804190993_5j3H', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (124, '1753804190993_Buwo', '1753804190993_5j3H', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (125, '1753804190993_jeVZ', '1753804190993_5j3H', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (126, '1753804190993_RnPv', '1753804190993_5j3H', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (127, '1753804190993_v57E', '1753804190993_5j3H', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (128, '1753804190993_ubby', '1753804190993_5j3H', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (129, '1753804190993_C44Y', '1753804190993_5j3H', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (130, '1753804190993_K8WN', '1753804190993_5j3H', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (131, '1753804190993_Pm6p', '1753804190993_5j3H', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (132, '1753804190993_qNi2', '1753804190993_5j3H', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (133, '1753804190993_cmbq', '1753804190993_5j3H', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (134, '1753804190993_HyUc', '1753804190993_5j3H', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (135, '1753804190993_XDel', '1753804190993_5j3H', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (136, '1753804190993_X1HB', '1753804190993_5j3H', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (137, '1753804190994_6v6w', '1753804190994_SqGq', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (138, '1753804190994_Zh2L', '1753804190994_SqGq', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (139, '1753804190994_bFIC', '1753804190994_SqGq', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (140, '1753804190994_0pz2', '1753804190994_SqGq', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (141, '1753804190994_YBFl', '1753804190994_SqGq', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (142, '1753804190994_GdSP', '1753804190994_SqGq', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (143, '1753804190994_MbWz', '1753804190994_SqGq', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (144, '1753804190994_7jzY', '1753804190994_SqGq', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (145, '1753804190994_KV94', '1753804190994_SqGq', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (146, '1753804190994_DhM1', '1753804190994_SqGq', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (147, '1753804190994_822u', '1753804190994_SqGq', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (148, '1753804190994_qIsp', '1753804190994_SqGq', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (149, '1753804190994_3Veq', '1753804190994_SqGq', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (150, '1753804190994_lbX5', '1753804190994_SqGq', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (151, '1753804190994_wrdz', '1753804190994_SqGq', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (152, '1753804190994_AuR3', '1753804190994_SqGq', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (153, '1753804190994_NtgV', '1753804190994_uLYh', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (154, '1753804190994_86fI', '1753804190994_uLYh', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (155, '1753804190994_sSfq', '1753804190994_uLYh', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (156, '1753804190994_eK9q', '1753804190994_uLYh', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (157, '1753804190994_Juzn', '1753804190994_uLYh', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (158, '1753804190994_gi9f', '1753804190994_uLYh', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (159, '1753804190994_5H08', '1753804190994_uLYh', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (160, '1753804190994_HVZU', '1753804190994_uLYh', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (161, '1753804190994_6DPR', '1753804190994_uLYh', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (162, '1753804190994_Mnji', '1753804190994_uLYh', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (163, '1753804190994_elQC', '1753804190994_uLYh', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (164, '1753804190994_mrid', '1753804190994_uLYh', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (165, '1753804190994_ImhM', '1753804190994_uLYh', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (166, '1753804190994_d2Da', '1753804190994_uLYh', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (167, '1753804190994_6yhk', '1753804190994_uLYh', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (168, '1753804190994_8ZI5', '1753804190994_uLYh', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (169, '1753804190994_Khwa', '1753804190994_lt9h', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (170, '1753804190994_uETu', '1753804190994_lt9h', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (171, '1753804190994_8Rx2', '1753804190994_lt9h', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (172, '1753804190994_5rgD', '1753804190994_lt9h', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (173, '1753804190994_WcS9', '1753804190994_lt9h', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (174, '1753804190994_hjKJ', '1753804190994_lt9h', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (175, '1753804190994_a3Iq', '1753804190994_lt9h', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (176, '1753804190994_wtim', '1753804190994_lt9h', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (177, '1753804190994_k6Yb', '1753804190994_lt9h', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (178, '1753804190994_piiK', '1753804190994_lt9h', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (179, '1753804190994_Pfdi', '1753804190994_lt9h', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (180, '1753804190994_EjPf', '1753804190994_lt9h', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (181, '1753804190994_Ds4Q', '1753804190994_lt9h', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (182, '1753804190994_kQn5', '1753804190994_lt9h', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (183, '1753804190994_KgnZ', '1753804190994_lt9h', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (184, '1753804190994_WcbZ', '1753804190994_lt9h', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (185, '1753804190994_Wt80', '1753804190994_eUiy', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (186, '1753804190994_mF6m', '1753804190994_eUiy', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (187, '1753804190994_tZ8o', '1753804190994_eUiy', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (188, '1753804190994_e9Qj', '1753804190994_eUiy', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (189, '1753804190994_Qest', '1753804190994_eUiy', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (190, '1753804190994_E1HX', '1753804190994_eUiy', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (191, '1753804190994_BZxk', '1753804190994_eUiy', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (192, '1753804190994_XLf8', '1753804190994_eUiy', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (193, '1753804190994_892r', '1753804190994_eUiy', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (194, '1753804190994_fSh7', '1753804190994_eUiy', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (195, '1753804190994_Tejk', '1753804190994_eUiy', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (196, '1753804190994_zfNy', '1753804190994_eUiy', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (197, '1753804190994_qecj', '1753804190994_eUiy', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (198, '1753804190994_XUUR', '1753804190994_eUiy', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (199, '1753804190994_sc2d', '1753804190994_eUiy', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (342, '1753804190995_GS2d', '1753804190995_i5I7', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (200, '1753804190994_gU1C', '1753804190994_eUiy', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (201, '1753804190994_05Nq', '1753804190994_UpJi', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (202, '1753804190994_0m5u', '1753804190994_UpJi', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (203, '1753804190994_5k9M', '1753804190994_UpJi', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (204, '1753804190994_A85u', '1753804190994_UpJi', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (205, '1753804190994_P88A', '1753804190994_UpJi', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (206, '1753804190994_10vV', '1753804190994_UpJi', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (207, '1753804190994_IDR0', '1753804190994_UpJi', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (208, '1753804190994_o4Ht', '1753804190994_UpJi', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (209, '1753804190994_aqJy', '1753804190994_UpJi', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (210, '1753804190994_Se5w', '1753804190994_UpJi', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (211, '1753804190994_wJiB', '1753804190994_UpJi', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (212, '1753804190994_82DZ', '1753804190994_UpJi', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (213, '1753804190994_BlKb', '1753804190994_UpJi', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (214, '1753804190994_TXoM', '1753804190994_UpJi', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (215, '1753804190994_USV6', '1753804190994_UpJi', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (216, '1753804190994_EEJE', '1753804190994_UpJi', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (217, '1753804190994_y8Nm', '1753804190994_xFLW', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (218, '1753804190994_FhPp', '1753804190994_xFLW', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (219, '1753804190994_Slhm', '1753804190994_xFLW', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (220, '1753804190994_kVLD', '1753804190994_xFLW', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (221, '1753804190994_0joL', '1753804190994_xFLW', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (222, '1753804190994_83lw', '1753804190994_xFLW', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (223, '1753804190994_fYdn', '1753804190994_xFLW', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (224, '1753804190994_4OR3', '1753804190994_xFLW', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (225, '1753804190994_N4sW', '1753804190994_xFLW', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (226, '1753804190994_oQhF', '1753804190994_xFLW', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (227, '1753804190994_Kfhe', '1753804190994_xFLW', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (228, '1753804190994_sjJn', '1753804190994_xFLW', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (229, '1753804190994_uLzu', '1753804190994_xFLW', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (230, '1753804190994_Nw1F', '1753804190994_xFLW', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (231, '1753804190994_gkH4', '1753804190994_xFLW', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (232, '1753804190994_Cv3Z', '1753804190994_xFLW', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (233, '1753804190995_Az1e', '1753804190995_pJ9E', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (234, '1753804190995_mk1D', '1753804190995_pJ9E', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (235, '1753804190995_td0G', '1753804190995_pJ9E', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (236, '1753804190995_asZw', '1753804190995_pJ9E', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (237, '1753804190995_qgMW', '1753804190995_pJ9E', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (238, '1753804190995_EP8o', '1753804190995_pJ9E', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (239, '1753804190995_Jofg', '1753804190995_pJ9E', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (240, '1753804190995_ibPe', '1753804190995_pJ9E', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (241, '1753804190995_6ge2', '1753804190995_pJ9E', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (242, '1753804190995_dEcL', '1753804190995_pJ9E', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (243, '1753804190995_5XQA', '1753804190995_pJ9E', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (244, '1753804190995_CuWS', '1753804190995_pJ9E', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (245, '1753804190995_xiCk', '1753804190995_pJ9E', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (246, '1753804190995_NHSP', '1753804190995_pJ9E', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (247, '1753804190995_6znV', '1753804190995_pJ9E', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (248, '1753804190995_oyLX', '1753804190995_pJ9E', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (249, '1753804190995_BdqK', '1753804190995_gr0G', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (250, '1753804190995_6NuY', '1753804190995_gr0G', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (251, '1753804190995_Mqll', '1753804190995_gr0G', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (252, '1753804190995_3taF', '1753804190995_gr0G', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (253, '1753804190995_iN6d', '1753804190995_gr0G', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (254, '1753804190995_r1YM', '1753804190995_gr0G', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (255, '1753804190995_GHB8', '1753804190995_gr0G', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (256, '1753804190995_vShV', '1753804190995_gr0G', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (257, '1753804190995_1aL2', '1753804190995_gr0G', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (258, '1753804190995_QdHn', '1753804190995_gr0G', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (259, '1753804190995_heOn', '1753804190995_gr0G', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (260, '1753804190995_UUxD', '1753804190995_gr0G', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (261, '1753804190995_BZGd', '1753804190995_gr0G', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (262, '1753804190995_X0eb', '1753804190995_gr0G', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (263, '1753804190995_kQCv', '1753804190995_gr0G', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (264, '1753804190995_DTli', '1753804190995_gr0G', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (265, '1753804190995_1FU9', '1753804190995_vSW1', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (266, '1753804190995_7BwZ', '1753804190995_vSW1', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (267, '1753804190995_toLI', '1753804190995_vSW1', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (268, '1753804190995_TZjJ', '1753804190995_vSW1', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (269, '1753804190995_6TaB', '1753804190995_vSW1', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (270, '1753804190995_onaN', '1753804190995_vSW1', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (343, '1753804190995_j7Q6', '1753804190995_i5I7', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (271, '1753804190995_tiJD', '1753804190995_vSW1', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (272, '1753804190995_n5bd', '1753804190995_vSW1', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (273, '1753804190995_fKv3', '1753804190995_vSW1', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (274, '1753804190995_esiH', '1753804190995_vSW1', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (275, '1753804190995_BtoZ', '1753804190995_vSW1', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (276, '1753804190995_YugC', '1753804190995_vSW1', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (277, '1753804190995_FjFP', '1753804190995_vSW1', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (278, '1753804190995_gRvm', '1753804190995_vSW1', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (279, '1753804190995_IhKs', '1753804190995_vSW1', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (280, '1753804190995_o8JK', '1753804190995_vSW1', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (281, '1753804190995_jnXx', '1753804190995_3h7w', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (282, '1753804190995_qHiz', '1753804190995_3h7w', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (283, '1753804190995_Uj2X', '1753804190995_3h7w', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (284, '1753804190995_OVGA', '1753804190995_3h7w', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (285, '1753804190995_KUaE', '1753804190995_3h7w', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (286, '1753804190995_hJpt', '1753804190995_3h7w', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (287, '1753804190995_BpwL', '1753804190995_3h7w', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (288, '1753804190995_IRnq', '1753804190995_3h7w', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (289, '1753804190995_bwCm', '1753804190995_3h7w', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (290, '1753804190995_5Mog', '1753804190995_3h7w', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (291, '1753804190995_hF1s', '1753804190995_3h7w', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (292, '1753804190995_2OZJ', '1753804190995_3h7w', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (293, '1753804190995_C6hN', '1753804190995_3h7w', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (294, '1753804190995_chrf', '1753804190995_3h7w', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (295, '1753804190995_PkJY', '1753804190995_3h7w', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (296, '1753804190995_1f0Z', '1753804190995_3h7w', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (297, '1753804190995_bmyF', '1753804190995_c7KL', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (298, '1753804190995_QylA', '1753804190995_c7KL', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (299, '1753804190995_Bi4E', '1753804190995_c7KL', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (300, '1753804190995_0y0P', '1753804190995_c7KL', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (301, '1753804190995_3hbc', '1753804190995_c7KL', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (302, '1753804190995_1sJN', '1753804190995_c7KL', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (303, '1753804190995_fplt', '1753804190995_c7KL', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (304, '1753804190995_jiBz', '1753804190995_c7KL', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (305, '1753804190995_tXAv', '1753804190995_c7KL', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (306, '1753804190995_W45E', '1753804190995_c7KL', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (307, '1753804190995_H0nw', '1753804190995_c7KL', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (308, '1753804190995_HXHq', '1753804190995_c7KL', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (309, '1753804190995_lVCf', '1753804190995_c7KL', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (310, '1753804190995_uYVy', '1753804190995_c7KL', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (311, '1753804190995_i76C', '1753804190995_c7KL', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (312, '1753804190995_9rHK', '1753804190995_c7KL', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (313, '1753804190995_8HRE', '1753804190995_QQqC', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (314, '1753804190995_o8oz', '1753804190995_QQqC', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (315, '1753804190995_9N3J', '1753804190995_QQqC', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (316, '1753804190995_0bGa', '1753804190995_QQqC', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (317, '1753804190995_cYKJ', '1753804190995_QQqC', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (318, '1753804190995_m0fE', '1753804190995_QQqC', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (319, '1753804190995_zg9h', '1753804190995_QQqC', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (320, '1753804190995_Oi7p', '1753804190995_QQqC', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (321, '1753804190995_8ZOL', '1753804190995_QQqC', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (322, '1753804190995_2bqB', '1753804190995_QQqC', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (323, '1753804190995_gfo7', '1753804190995_QQqC', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (324, '1753804190995_MTWa', '1753804190995_QQqC', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (325, '1753804190995_aOK0', '1753804190995_QQqC', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (326, '1753804190995_R7s6', '1753804190995_QQqC', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (327, '1753804190995_CNs6', '1753804190995_QQqC', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (328, '1753804190995_pNre', '1753804190995_QQqC', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (329, '1753804190995_Gthq', '1753804190995_i5I7', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (330, '1753804190995_Vbru', '1753804190995_i5I7', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (331, '1753804190995_ngpF', '1753804190995_i5I7', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (332, '1753804190995_PNUy', '1753804190995_i5I7', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (333, '1753804190995_L2zf', '1753804190995_i5I7', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (334, '1753804190995_f5K8', '1753804190995_i5I7', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (335, '1753804190995_2Zsa', '1753804190995_i5I7', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (336, '1753804190995_iVrA', '1753804190995_i5I7', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (337, '1753804190995_yoyp', '1753804190995_i5I7', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (338, '1753804190995_2VzY', '1753804190995_i5I7', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (339, '1753804190995_gItW', '1753804190995_i5I7', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (340, '1753804190995_ROt6', '1753804190995_i5I7', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (341, '1753804190995_S44d', '1753804190995_i5I7', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (344, '1753804190995_itgH', '1753804190995_i5I7', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (345, '1753804190995_TBoT', '1753804190995_Rf9b', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (346, '1753804190995_nyai', '1753804190995_Rf9b', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (347, '1753804190995_YDAX', '1753804190995_Rf9b', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (348, '1753804190995_wSqJ', '1753804190995_Rf9b', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (349, '1753804190995_X86V', '1753804190995_Rf9b', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (350, '1753804190995_7lnD', '1753804190995_Rf9b', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (351, '1753804190995_lp5n', '1753804190995_Rf9b', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (352, '1753804190995_SHUH', '1753804190995_Rf9b', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (353, '1753804190995_rNh2', '1753804190995_Rf9b', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (354, '1753804190995_8wrH', '1753804190995_Rf9b', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (355, '1753804190995_Oizr', '1753804190995_Rf9b', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (356, '1753804190995_TJkJ', '1753804190995_Rf9b', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (357, '1753804190995_wdAz', '1753804190995_Rf9b', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (358, '1753804190995_xw9s', '1753804190995_Rf9b', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (359, '1753804190995_0l4z', '1753804190995_Rf9b', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (360, '1753804190995_L9x2', '1753804190995_Rf9b', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (361, '1753804190996_gy1K', '1753804190996_YH4o', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (362, '1753804190996_xjee', '1753804190996_YH4o', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (363, '1753804190996_8zn6', '1753804190996_YH4o', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (364, '1753804190996_pXO7', '1753804190996_YH4o', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (365, '1753804190996_1b4Z', '1753804190996_YH4o', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (366, '1753804190996_VssW', '1753804190996_YH4o', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (367, '1753804190996_jYwJ', '1753804190996_YH4o', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (368, '1753804190996_SV1y', '1753804190996_YH4o', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (369, '1753804190996_dSl6', '1753804190996_YH4o', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (370, '1753804190996_uAYY', '1753804190996_YH4o', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (371, '1753804190996_LR7f', '1753804190996_YH4o', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (372, '1753804190996_TuHK', '1753804190996_YH4o', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (373, '1753804190996_6zIT', '1753804190996_YH4o', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (374, '1753804190996_uxen', '1753804190996_YH4o', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (375, '1753804190996_AU6C', '1753804190996_YH4o', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (376, '1753804190996_Dtgc', '1753804190996_YH4o', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (377, '1753804190996_8aNR', '1753804190996_C50j', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (378, '1753804190996_Q8ps', '1753804190996_C50j', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (379, '1753804190996_4YHc', '1753804190996_C50j', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (380, '1753804190996_gQRY', '1753804190996_C50j', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (381, '1753804190996_fG7t', '1753804190996_C50j', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (382, '1753804190996_i7bk', '1753804190996_C50j', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (383, '1753804190996_xK8v', '1753804190996_C50j', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (384, '1753804190996_9DyC', '1753804190996_C50j', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (385, '1753804190996_pgJo', '1753804190996_C50j', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (386, '1753804190996_QJvY', '1753804190996_C50j', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (387, '1753804190996_bSyL', '1753804190996_C50j', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (388, '1753804190996_6bMu', '1753804190996_C50j', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (389, '1753804190996_xVYP', '1753804190996_C50j', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (390, '1753804190996_Ykuz', '1753804190996_C50j', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (391, '1753804190996_21XV', '1753804190996_C50j', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (392, '1753804190996_Gf45', '1753804190996_C50j', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (393, '1753804190996_g0t4', '1753804190996_D18I', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (394, '1753804190996_Z571', '1753804190996_D18I', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (395, '1753804190996_gNFy', '1753804190996_D18I', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (396, '1753804190996_HUL0', '1753804190996_D18I', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (397, '1753804190996_yszf', '1753804190996_D18I', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (398, '1753804190996_tpAK', '1753804190996_D18I', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (399, '1753804190996_J06N', '1753804190996_D18I', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (400, '1753804190996_JhyH', '1753804190996_D18I', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (401, '1753804190996_isxL', '1753804190996_D18I', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (402, '1753804190996_hVbX', '1753804190996_D18I', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (403, '1753804190996_GyFu', '1753804190996_D18I', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (404, '1753804190996_X0NW', '1753804190996_D18I', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (405, '1753804190996_1SXv', '1753804190996_D18I', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (406, '1753804190996_xDvF', '1753804190996_D18I', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (407, '1753804190996_PM2C', '1753804190996_D18I', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (408, '1753804190996_stW7', '1753804190996_D18I', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (409, '1753804190996_RFJj', '1753804190996_i0Ax', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (410, '1753804190996_pRYQ', '1753804190996_i0Ax', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (411, '1753804190996_6D1c', '1753804190996_i0Ax', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (412, '1753804190996_3SC6', '1753804190996_i0Ax', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (413, '1753804190996_fZg1', '1753804190996_i0Ax', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (414, '1753804190996_7s5N', '1753804190996_i0Ax', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (486, '1753804190996_7JbH', '1753804190996_WqRb', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (415, '1753804190996_q8JF', '1753804190996_i0Ax', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (416, '1753804190996_kAQk', '1753804190996_i0Ax', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (417, '1753804190996_ZAoS', '1753804190996_i0Ax', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (418, '1753804190996_qm2y', '1753804190996_i0Ax', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (419, '1753804190996_Xev7', '1753804190996_i0Ax', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (420, '1753804190996_uz71', '1753804190996_i0Ax', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (421, '1753804190996_Q5DP', '1753804190996_i0Ax', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (422, '1753804190996_Wl8G', '1753804190996_i0Ax', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (423, '1753804190996_FRjd', '1753804190996_i0Ax', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (424, '1753804190996_TV0G', '1753804190996_i0Ax', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (425, '1753804190996_urZY', '1753804190996_uKUb', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (426, '1753804190996_YDc6', '1753804190996_uKUb', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (427, '1753804190996_SKHf', '1753804190996_uKUb', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (428, '1753804190996_ikiD', '1753804190996_uKUb', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (429, '1753804190996_S8nA', '1753804190996_uKUb', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (430, '1753804190996_VxFx', '1753804190996_uKUb', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (431, '1753804190996_VYMh', '1753804190996_uKUb', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (432, '1753804190996_dH55', '1753804190996_uKUb', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (433, '1753804190996_E0Lt', '1753804190996_uKUb', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (434, '1753804190996_ymEh', '1753804190996_uKUb', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (435, '1753804190996_8lUA', '1753804190996_uKUb', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (436, '1753804190996_NHuA', '1753804190996_uKUb', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (437, '1753804190996_qXHq', '1753804190996_uKUb', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (438, '1753804190996_VDj9', '1753804190996_uKUb', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (439, '1753804190996_IaBF', '1753804190996_uKUb', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (440, '1753804190996_vCBm', '1753804190996_uKUb', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (441, '1753804190996_Gzsb', '1753804190996_TTBv', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (442, '1753804190996_lRy6', '1753804190996_TTBv', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (443, '1753804190996_udwM', '1753804190996_TTBv', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (444, '1753804190996_WIrD', '1753804190996_TTBv', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (445, '1753804190996_mVJM', '1753804190996_TTBv', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (446, '1753804190996_SznF', '1753804190996_TTBv', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (447, '1753804190996_BA1R', '1753804190996_TTBv', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (448, '1753804190996_2I1O', '1753804190996_TTBv', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (449, '1753804190996_iQ8q', '1753804190996_TTBv', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (450, '1753804190996_pYo6', '1753804190996_TTBv', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (451, '1753804190996_aprz', '1753804190996_TTBv', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (452, '1753804190996_XwqI', '1753804190996_TTBv', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (453, '1753804190996_mexm', '1753804190996_TTBv', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (454, '1753804190996_kqZf', '1753804190996_TTBv', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (455, '1753804190996_In1i', '1753804190996_TTBv', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (456, '1753804190996_PR0E', '1753804190996_TTBv', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (457, '1753804190996_wQWE', '1753804190996_D6Ty', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (458, '1753804190996_0Hfc', '1753804190996_D6Ty', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (459, '1753804190996_nIjm', '1753804190996_D6Ty', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (460, '1753804190996_Y6bi', '1753804190996_D6Ty', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (461, '1753804190996_HDEt', '1753804190996_D6Ty', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (462, '1753804190996_OOcB', '1753804190996_D6Ty', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (463, '1753804190996_kdsT', '1753804190996_D6Ty', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (464, '1753804190996_Hvir', '1753804190996_D6Ty', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (465, '1753804190996_dLNP', '1753804190996_D6Ty', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (466, '1753804190996_rSQR', '1753804190996_D6Ty', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (467, '1753804190996_ELf6', '1753804190996_D6Ty', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (468, '1753804190996_z3J3', '1753804190996_D6Ty', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (469, '1753804190996_6509', '1753804190996_D6Ty', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (470, '1753804190996_COMV', '1753804190996_D6Ty', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (471, '1753804190996_oZHF', '1753804190996_D6Ty', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (472, '1753804190996_tqYO', '1753804190996_D6Ty', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (473, '1753804190996_iQ7j', '1753804190996_WqRb', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (474, '1753804190996_tI3S', '1753804190996_WqRb', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (475, '1753804190996_TsT4', '1753804190996_WqRb', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (476, '1753804190996_IcMv', '1753804190996_WqRb', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (477, '1753804190996_MZsq', '1753804190996_WqRb', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (478, '1753804190996_STKG', '1753804190996_WqRb', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (479, '1753804190996_m8xd', '1753804190996_WqRb', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (480, '1753804190996_s8yC', '1753804190996_WqRb', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (481, '1753804190996_Y1FZ', '1753804190996_WqRb', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (482, '1753804190996_mkNS', '1753804190996_WqRb', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (483, '1753804190996_tQLX', '1753804190996_WqRb', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (484, '1753804190996_T5A4', '1753804190996_WqRb', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (485, '1753804190996_nPFZ', '1753804190996_WqRb', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (487, '1753804190996_G5AN', '1753804190996_WqRb', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (488, '1753804190996_qLvL', '1753804190996_WqRb', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (489, '1753804190996_3CPb', '1753804190996_G1sv', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (490, '1753804190996_HJmw', '1753804190996_G1sv', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (491, '1753804190996_y1yn', '1753804190996_G1sv', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (492, '1753804190996_DXh6', '1753804190996_G1sv', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (493, '1753804190996_IANN', '1753804190996_G1sv', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (494, '1753804190996_HZhi', '1753804190996_G1sv', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (495, '1753804190996_nafe', '1753804190996_G1sv', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (496, '1753804190996_Bo5u', '1753804190996_G1sv', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (497, '1753804190996_BeuS', '1753804190996_G1sv', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (498, '1753804190996_ktZZ', '1753804190996_G1sv', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (499, '1753804190996_sPLG', '1753804190996_G1sv', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (500, '1753804190996_XOVt', '1753804190996_G1sv', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (501, '1753804190996_xAiz', '1753804190996_G1sv', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (502, '1753804190996_dgp5', '1753804190996_G1sv', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (503, '1753804190996_TTgY', '1753804190996_G1sv', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (504, '1753804190996_8hJ1', '1753804190996_G1sv', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (505, '1753804190997_xnbY', '1753804190997_mw5x', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (506, '1753804190997_2Gz6', '1753804190997_mw5x', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (507, '1753804190997_b83b', '1753804190997_mw5x', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (508, '1753804190997_1WZJ', '1753804190997_mw5x', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (509, '1753804190997_kJs9', '1753804190997_mw5x', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (510, '1753804190997_dbzg', '1753804190997_mw5x', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (511, '1753804190997_ZL54', '1753804190997_mw5x', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (512, '1753804190997_vjCm', '1753804190997_mw5x', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (513, '1753804190997_CUba', '1753804190997_mw5x', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (514, '1753804190997_Mtxs', '1753804190997_mw5x', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (515, '1753804190997_fZ8W', '1753804190997_mw5x', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (516, '1753804190997_1GEq', '1753804190997_mw5x', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (517, '1753804190997_FAEI', '1753804190997_mw5x', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (518, '1753804190997_e2UB', '1753804190997_mw5x', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (519, '1753804190997_EROF', '1753804190997_mw5x', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (520, '1753804190997_bhJU', '1753804190997_mw5x', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (521, '1753804190997_yYyF', '1753804190997_YAiQ', 'Food: Where Does It Come From?', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (522, '1753804190997_EASm', '1753804190997_YAiQ', 'Components of Food', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (523, '1753804190997_U8XB', '1753804190997_YAiQ', 'Fibre to Fabric', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (524, '1753804190997_N9aQ', '1753804190997_YAiQ', 'Sorting Materials into Groups', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (525, '1753804190997_aLmI', '1753804190997_YAiQ', 'Separation of Substances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (526, '1753804190997_NMJ7', '1753804190997_YAiQ', 'Changes Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (527, '1753804190997_oUR1', '1753804190997_YAiQ', 'Getting to Know Plants', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (528, '1753804190997_uXJA', '1753804190997_YAiQ', 'Body Movements', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (529, '1753804190997_zFBw', '1753804190997_YAiQ', 'The Living Organisms and Their Surroundings', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (530, '1753804190997_DmtR', '1753804190997_YAiQ', 'Motion and Measurement of Distances', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (531, '1753804190997_Wj55', '1753804190997_YAiQ', 'Light, Shadows and Reflections', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (532, '1753804190997_C2lL', '1753804190997_YAiQ', 'Electricity and Circuits', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (533, '1753804190997_Z3Y1', '1753804190997_YAiQ', 'Fun with Magnets', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (534, '1753804190997_18Wm', '1753804190997_YAiQ', 'Water', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (535, '1753804190997_iAvU', '1753804190997_YAiQ', 'Air Around Us', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (536, '1753804190997_RJJt', '1753804190997_YAiQ', 'Garbage In, Garbage Out', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_chapters (id, row_id, subject_row_id, name, cr_on, up_on) VALUES (537, '1754296060976_A42x', '1754296038618_Crax', 'test-chapter1', '2025-08-04 01:27:40.977628', '2025-08-04 01:27:40.977628') ON CONFLICT DO NOTHING;


--
-- TOC entry 4998 (class 0 OID 590347)
-- Dependencies: 220
-- Data for Name: master_classes; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (60, '1753804190993_pjZN', '1753804190992_hPwF', 'Class 1', '2025-07-29 15:35:03', '2025-07-30 05:08:45.30577') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (61, '1753804190993_fsBQ', '1753804190992_hPwF', 'Class 2', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (62, '1753804190993_t7Ee', '1753804190992_hPwF', 'Class 3', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (63, '1753804190993_uNSg', '1753804190992_hPwF', 'Class 4', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (64, '1753804190993_03RE', '1753804190992_hPwF', 'Class 5', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (65, '1753804190993_AvIg', '1753804190992_hPwF', 'Class 6', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (66, '1753804190993_60FL', '1753804190992_hPwF', 'Class 7', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (67, '1753804190993_i7OG', '1753804190992_hPwF', 'Class 8', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (68, '1753804190993_32GP', '1753804190992_hPwF', 'Class 9', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (69, '1753804190993_dWNz', '1753804190992_hPwF', 'Class 10', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (70, '1753804190993_w5rM', '1753804190992_hPwF', 'Class 11', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (71, '1753804190993_Ye5S', '1753804190992_hPwF', 'Class 12', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (72, '1753804190993_Ujqd', '1753804190992_aQvL', 'Class 1', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (73, '1753804190993_TJV5', '1753804190992_aQvL', 'Class 2', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (74, '1753804190993_OTBI', '1753804190992_aQvL', 'Class 3', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (75, '1753804190993_xc6B', '1753804190992_aQvL', 'Class 4', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (76, '1753804190993_8TD6', '1753804190992_aQvL', 'Class 5', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (77, '1753804190993_Kxg8', '1753804190992_aQvL', 'Class 6', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (78, '1753804190993_QU1K', '1753804190992_aQvL', 'Class 7', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (79, '1753804190993_pHcp', '1753804190992_aQvL', 'Class 8', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (80, '1753804190993_Krcm', '1753804190992_aQvL', 'Class 9', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (81, '1753804190993_Y8XQ', '1753804190992_aQvL', 'Class 10', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (82, '1753804190993_nbxE', '1753804190992_aQvL', 'Class 11', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (83, '1753804190993_70gR', '1753804190992_aQvL', 'Class 12', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (84, '1753804190993_ihtK', '1753804190992_LhTO', 'Class 1', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (85, '1753804190993_oYaZ', '1753804190992_LhTO', 'Class 2', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (86, '1753804190993_91de', '1753804190992_LhTO', 'Class 3', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (87, '1753804190993_epO7', '1753804190992_LhTO', 'Class 4', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (88, '1753804190993_ZnxL', '1753804190992_LhTO', 'Class 5', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (89, '1753804190993_4FYb', '1753804190992_LhTO', 'Class 6', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (90, '1753804190993_hMaV', '1753804190992_LhTO', 'Class 7', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (91, '1753804190993_G9uq', '1753804190992_LhTO', 'Class 8', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (92, '1753804190993_5mBD', '1753804190992_LhTO', 'Class 9', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (93, '1753804190993_imiF', '1753804190992_LhTO', 'Class 10', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (94, '1753804190993_7c6O', '1753804190992_LhTO', 'Class 11', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (95, '1753804190993_j16A', '1753804190992_LhTO', 'Class 12', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (96, '1753804190993_h26J', '1753804190992_xHZK', 'Class 1', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (97, '1753804190993_437E', '1753804190992_xHZK', 'Class 2', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (98, '1753804190993_voh0', '1753804190992_xHZK', 'Class 3', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (99, '1753804190993_FHFs', '1753804190992_xHZK', 'Class 4', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (100, '1753804190993_wQ0i', '1753804190992_xHZK', 'Class 5', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (101, '1753804190993_tKAS', '1753804190992_xHZK', 'Class 6', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (102, '1753804190993_i4cs', '1753804190992_xHZK', 'Class 7', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (103, '1753804190993_Ov13', '1753804190992_xHZK', 'Class 8', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (104, '1753804190993_NDzP', '1753804190992_xHZK', 'Class 9', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (105, '1753804190993_ca2n', '1753804190992_xHZK', 'Class 10', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (106, '1753804190993_zZN5', '1753804190992_xHZK', 'Class 11', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (107, '1753804190993_W4qq', '1753804190992_xHZK', 'Class 12', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (108, '1753804190993_FZUC', '1753804190992_csm3', 'Class 1', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (109, '1753804190993_BJn4', '1753804190992_csm3', 'Class 2', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (110, '1753804190993_TmX2', '1753804190992_csm3', 'Class 3', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (111, '1753804190993_1AMf', '1753804190992_csm3', 'Class 4', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (112, '1753804190993_IabW', '1753804190992_csm3', 'Class 5', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (113, '1753804190993_I0lK', '1753804190992_csm3', 'Class 6', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (114, '1753804190993_2Cr3', '1753804190992_csm3', 'Class 7', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (115, '1753804190993_5Pn8', '1753804190992_csm3', 'Class 8', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (116, '1753804190993_ZbP8', '1753804190992_csm3', 'Class 9', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (117, '1753804190993_5RV8', '1753804190992_csm3', 'Class 10', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (118, '1753804190993_LBLC', '1753804190992_csm3', 'Class 11', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (119, '1753804190993_W2gd', '1753804190992_csm3', 'Class 12', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (120, '1753804190993_9H3j', '1753804190992_e2Pw', 'Class 1', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (121, '1753804190993_N25C', '1753804190992_e2Pw', 'Class 2', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (122, '1753804190993_oec2', '1753804190992_e2Pw', 'Class 3', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (123, '1753804190993_eOyp', '1753804190992_e2Pw', 'Class 4', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (124, '1753804190993_hq8t', '1753804190992_e2Pw', 'Class 5', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (125, '1753804190993_MiZn', '1753804190992_e2Pw', 'Class 6', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (126, '1753804190993_d0Jg', '1753804190992_e2Pw', 'Class 7', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (127, '1753804190993_uTDy', '1753804190992_e2Pw', 'Class 8', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (128, '1753804190993_hoJ0', '1753804190992_e2Pw', 'Class 9', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (129, '1753804190993_hDC8', '1753804190992_e2Pw', 'Class 10', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (130, '1753804190993_IwIj', '1753804190992_e2Pw', 'Class 11', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (131, '1753804190993_yyh3', '1753804190992_e2Pw', 'Class 12', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_classes (id, row_id, board_row_id, name, cr_on, up_on) VALUES (133, '1753947832740_xhQf', '1753939583049_dccP', 'test400', '2025-07-31 00:43:52.779095', '2025-07-31 00:43:52.779095') ON CONFLICT DO NOTHING;


--
-- TOC entry 5000 (class 0 OID 590355)
-- Dependencies: 222
-- Data for Name: master_subjects; Type: TABLE DATA; Schema: master_schema; Owner: postgres
--

INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (566, '1754296038618_Crax', '1753947832740_xhQf', 'test-subject1', '2025-08-04 01:27:18.619462', '2025-08-04 01:27:25.162678') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (98, '1753804190993_wM9z', '1753804190993_9H3j', 'English', '2025-07-29 15:35:03', '2025-07-30 05:24:34.711509') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (99, '1753804190993_LsXU', '1753804190993_pjZN', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (100, '1753804190993_kQUS', '1753804190993_pjZN', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (101, '1753804190993_7Yxw', '1753804190993_pjZN', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (102, '1753804190993_HRBj', '1753804190993_fsBQ', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (103, '1753804190993_qEEe', '1753804190993_fsBQ', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (104, '1753804190993_fXCr', '1753804190993_fsBQ', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (105, '1753804190993_jO5Z', '1753804190993_fsBQ', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (106, '1753804190993_v49O', '1753804190993_t7Ee', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (107, '1753804190993_MDme', '1753804190993_t7Ee', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (108, '1753804190993_BkNL', '1753804190993_t7Ee', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (109, '1753804190993_ezPF', '1753804190993_t7Ee', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (110, '1753804190993_mQoc', '1753804190993_uNSg', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (111, '1753804190993_NkiF', '1753804190993_uNSg', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (112, '1753804190993_H4B1', '1753804190993_uNSg', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (113, '1753804190993_FDP8', '1753804190993_uNSg', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (114, '1753804190993_rtAW', '1753804190993_03RE', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (115, '1753804190993_W3U0', '1753804190993_03RE', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (116, '1753804190993_P3bL', '1753804190993_03RE', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (117, '1753804190993_IFJ3', '1753804190993_03RE', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (118, '1753804190993_FJqR', '1753804190993_AvIg', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (119, '1753804190993_BaUH', '1753804190993_AvIg', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (120, '1753804190993_qtFz', '1753804190993_AvIg', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (121, '1753804190993_lsdo', '1753804190993_AvIg', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (122, '1753804190993_L8Z5', '1753804190993_AvIg', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (123, '1753804190993_6O50', '1753804190993_AvIg', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (124, '1753804190993_Uow1', '1753804190993_60FL', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (125, '1753804190993_Zj6L', '1753804190993_60FL', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (126, '1753804190993_Eo2q', '1753804190993_60FL', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (127, '1753804190993_xEv9', '1753804190993_60FL', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (128, '1753804190993_voos', '1753804190993_60FL', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (129, '1753804190993_bpWk', '1753804190993_60FL', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (130, '1753804190993_tRGw', '1753804190993_i7OG', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (131, '1753804190993_TvxP', '1753804190993_i7OG', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (132, '1753804190993_IBLP', '1753804190993_i7OG', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (133, '1753804190993_NL5a', '1753804190993_i7OG', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (134, '1753804190993_Gys9', '1753804190993_i7OG', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (135, '1753804190993_V7IP', '1753804190993_i7OG', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (136, '1753804190993_mZTc', '1753804190993_32GP', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (137, '1753804190993_zm0y', '1753804190993_32GP', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (138, '1753804190993_tNT3', '1753804190993_32GP', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (139, '1753804190993_WA6g', '1753804190993_32GP', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (140, '1753804190993_w6me', '1753804190993_32GP', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (141, '1753804190993_9Vfk', '1753804190993_32GP', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (142, '1753804190993_O06f', '1753804190993_dWNz', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (143, '1753804190993_1juE', '1753804190993_dWNz', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (144, '1753804190993_pD9U', '1753804190993_dWNz', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (145, '1753804190993_5j3H', '1753804190993_dWNz', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (146, '1753804190993_9tWB', '1753804190993_dWNz', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (147, '1753804190993_w14H', '1753804190993_dWNz', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (148, '1753804190993_Lyvv', '1753804190993_w5rM', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (149, '1753804190993_aMpp', '1753804190993_w5rM', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (150, '1753804190993_YTbV', '1753804190993_w5rM', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (151, '1753804190993_St5W', '1753804190993_w5rM', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (152, '1753804190993_Qs9a', '1753804190993_w5rM', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (153, '1753804190993_IHHT', '1753804190993_w5rM', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (154, '1753804190993_45vT', '1753804190993_w5rM', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (155, '1753804190993_vxTN', '1753804190993_w5rM', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (156, '1753804190993_vwPU', '1753804190993_w5rM', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (157, '1753804190993_2edB', '1753804190993_w5rM', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (158, '1753804190993_yDZc', '1753804190993_w5rM', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (159, '1753804190993_6a27', '1753804190993_w5rM', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (160, '1753804190993_yTeX', '1753804190993_w5rM', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (161, '1753804190993_Vq7F', '1753804190993_w5rM', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (162, '1753804190993_utDo', '1753804190993_Ye5S', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (163, '1753804190993_1j3C', '1753804190993_Ye5S', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (164, '1753804190993_QYKN', '1753804190993_Ye5S', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (165, '1753804190993_8akv', '1753804190993_Ye5S', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (166, '1753804190993_dAgj', '1753804190993_Ye5S', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (167, '1753804190993_X1u5', '1753804190993_Ye5S', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (168, '1753804190993_qdpO', '1753804190993_Ye5S', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (169, '1753804190993_s9BG', '1753804190993_Ye5S', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (170, '1753804190993_aJCE', '1753804190993_Ye5S', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (171, '1753804190993_kC1B', '1753804190993_Ye5S', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (172, '1753804190994_k9zi', '1753804190993_Ye5S', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (173, '1753804190994_sHrb', '1753804190993_Ye5S', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (174, '1753804190994_9QWh', '1753804190993_Ye5S', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (175, '1753804190994_7yTS', '1753804190993_Ye5S', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (176, '1753804190994_5GyW', '1753804190993_Ujqd', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (177, '1753804190994_VCtD', '1753804190993_Ujqd', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (178, '1753804190994_fzSd', '1753804190993_Ujqd', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (179, '1753804190994_dIE3', '1753804190993_Ujqd', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (180, '1753804190994_sXKE', '1753804190993_TJV5', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (181, '1753804190994_UeVI', '1753804190993_TJV5', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (182, '1753804190994_9o4s', '1753804190993_TJV5', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (183, '1753804190994_7GXT', '1753804190993_TJV5', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (184, '1753804190994_SMfL', '1753804190993_OTBI', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (185, '1753804190994_n2hU', '1753804190993_OTBI', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (186, '1753804190994_W13b', '1753804190993_OTBI', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (187, '1753804190994_IZWv', '1753804190993_OTBI', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (188, '1753804190994_IxmG', '1753804190993_xc6B', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (189, '1753804190994_kCq7', '1753804190993_xc6B', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (190, '1753804190994_dNKZ', '1753804190993_xc6B', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (191, '1753804190994_965A', '1753804190993_xc6B', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (192, '1753804190994_ET2F', '1753804190993_8TD6', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (193, '1753804190994_0U5N', '1753804190993_8TD6', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (194, '1753804190994_hvMK', '1753804190993_8TD6', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (195, '1753804190994_PuQf', '1753804190993_8TD6', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (196, '1753804190994_bX3t', '1753804190993_Kxg8', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (197, '1753804190994_wxWI', '1753804190993_Kxg8', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (198, '1753804190994_0ej7', '1753804190993_Kxg8', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (199, '1753804190994_SqGq', '1753804190993_Kxg8', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (200, '1753804190994_KS7G', '1753804190993_Kxg8', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (201, '1753804190994_k1Qd', '1753804190993_Kxg8', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (202, '1753804190994_lmiR', '1753804190993_QU1K', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (203, '1753804190994_4l1J', '1753804190993_QU1K', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (204, '1753804190994_5ICI', '1753804190993_QU1K', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (205, '1753804190994_uLYh', '1753804190993_QU1K', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (206, '1753804190994_IaEz', '1753804190993_QU1K', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (207, '1753804190994_9FA1', '1753804190993_QU1K', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (208, '1753804190994_0yLt', '1753804190993_pHcp', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (209, '1753804190994_zuMk', '1753804190993_pHcp', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (210, '1753804190994_rhK2', '1753804190993_pHcp', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (211, '1753804190994_lt9h', '1753804190993_pHcp', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (212, '1753804190994_zcya', '1753804190993_pHcp', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (213, '1753804190994_YfiK', '1753804190993_pHcp', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (214, '1753804190994_JjsH', '1753804190993_Krcm', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (215, '1753804190994_A2bZ', '1753804190993_Krcm', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (216, '1753804190994_EDXT', '1753804190993_Krcm', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (217, '1753804190994_eUiy', '1753804190993_Krcm', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (218, '1753804190994_SF2q', '1753804190993_Krcm', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (219, '1753804190994_CInt', '1753804190993_Krcm', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (220, '1753804190994_DCXf', '1753804190993_Y8XQ', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (221, '1753804190994_Cjgt', '1753804190993_Y8XQ', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (222, '1753804190994_Erm3', '1753804190993_Y8XQ', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (223, '1753804190994_UpJi', '1753804190993_Y8XQ', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (224, '1753804190994_JDqR', '1753804190993_Y8XQ', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (225, '1753804190994_kzZ9', '1753804190993_Y8XQ', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (226, '1753804190994_8C1I', '1753804190993_nbxE', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (227, '1753804190994_9ieO', '1753804190993_nbxE', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (228, '1753804190994_tL3j', '1753804190993_nbxE', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (229, '1753804190994_bug4', '1753804190993_nbxE', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (230, '1753804190994_nDex', '1753804190993_nbxE', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (231, '1753804190994_FB7v', '1753804190993_nbxE', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (232, '1753804190994_jVmv', '1753804190993_nbxE', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (233, '1753804190994_p5i6', '1753804190993_nbxE', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (234, '1753804190994_VAL6', '1753804190993_nbxE', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (235, '1753804190994_2ALZ', '1753804190993_nbxE', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (236, '1753804190994_JF5m', '1753804190993_nbxE', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (237, '1753804190994_MO3o', '1753804190993_nbxE', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (238, '1753804190994_poT3', '1753804190993_nbxE', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (239, '1753804190994_kDYa', '1753804190993_nbxE', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (240, '1753804190994_yDOT', '1753804190993_70gR', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (241, '1753804190994_m1Vh', '1753804190993_70gR', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (242, '1753804190994_uqnO', '1753804190993_70gR', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (243, '1753804190994_SXLm', '1753804190993_70gR', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (244, '1753804190994_F96J', '1753804190993_70gR', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (245, '1753804190994_CZUP', '1753804190993_70gR', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (246, '1753804190994_R4MW', '1753804190993_70gR', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (247, '1753804190994_3I3D', '1753804190993_70gR', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (248, '1753804190994_He1W', '1753804190993_70gR', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (249, '1753804190994_9VH6', '1753804190993_70gR', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (250, '1753804190994_mxum', '1753804190993_70gR', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (251, '1753804190994_PGaK', '1753804190993_70gR', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (252, '1753804190994_FhZT', '1753804190993_70gR', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (253, '1753804190994_3gvZ', '1753804190993_70gR', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (254, '1753804190994_zHyG', '1753804190993_ihtK', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (255, '1753804190994_4nvR', '1753804190993_ihtK', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (256, '1753804190994_aBjG', '1753804190993_ihtK', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (257, '1753804190994_BIQn', '1753804190993_ihtK', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (258, '1753804190994_lqzH', '1753804190993_oYaZ', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (259, '1753804190994_lsLY', '1753804190993_oYaZ', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (260, '1753804190994_UvO1', '1753804190993_oYaZ', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (261, '1753804190994_wNLZ', '1753804190993_oYaZ', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (262, '1753804190994_piia', '1753804190993_91de', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (263, '1753804190994_XDTW', '1753804190993_91de', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (264, '1753804190994_lpVK', '1753804190993_91de', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (265, '1753804190994_TrrR', '1753804190993_91de', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (266, '1753804190994_sUJ3', '1753804190993_epO7', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (267, '1753804190994_soUp', '1753804190993_epO7', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (268, '1753804190994_OZmP', '1753804190993_epO7', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (269, '1753804190994_TJKI', '1753804190993_epO7', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (270, '1753804190994_Z3xU', '1753804190993_ZnxL', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (271, '1753804190994_7IGZ', '1753804190993_ZnxL', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (272, '1753804190994_EJOX', '1753804190993_ZnxL', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (273, '1753804190994_MMwn', '1753804190993_ZnxL', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (274, '1753804190994_7QR3', '1753804190993_4FYb', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (275, '1753804190994_x6SE', '1753804190993_4FYb', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (276, '1753804190994_abtK', '1753804190993_4FYb', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (277, '1753804190994_xFLW', '1753804190993_4FYb', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (278, '1753804190994_mv5E', '1753804190993_4FYb', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (279, '1753804190994_tZHu', '1753804190993_4FYb', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (280, '1753804190994_vZLW', '1753804190993_hMaV', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (281, '1753804190995_4r67', '1753804190993_hMaV', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (282, '1753804190995_8zlj', '1753804190993_hMaV', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (283, '1753804190995_pJ9E', '1753804190993_hMaV', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (284, '1753804190995_adxA', '1753804190993_hMaV', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (285, '1753804190995_yWXm', '1753804190993_hMaV', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (286, '1753804190995_SHgJ', '1753804190993_G9uq', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (287, '1753804190995_Ve0g', '1753804190993_G9uq', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (288, '1753804190995_jpjh', '1753804190993_G9uq', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (289, '1753804190995_gr0G', '1753804190993_G9uq', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (290, '1753804190995_UMa6', '1753804190993_G9uq', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (291, '1753804190995_q3YL', '1753804190993_G9uq', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (292, '1753804190995_aPHW', '1753804190993_5mBD', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (293, '1753804190995_dmiC', '1753804190993_5mBD', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (294, '1753804190995_gPiN', '1753804190993_5mBD', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (295, '1753804190995_vSW1', '1753804190993_5mBD', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (296, '1753804190995_VKEb', '1753804190993_5mBD', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (297, '1753804190995_J8Iz', '1753804190993_5mBD', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (298, '1753804190995_mFXf', '1753804190993_imiF', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (299, '1753804190995_n13Y', '1753804190993_imiF', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (300, '1753804190995_1zEY', '1753804190993_imiF', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (301, '1753804190995_3h7w', '1753804190993_imiF', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (302, '1753804190995_o4HW', '1753804190993_imiF', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (303, '1753804190995_NEL0', '1753804190993_imiF', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (304, '1753804190995_yX3D', '1753804190993_7c6O', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (305, '1753804190995_nqRH', '1753804190993_7c6O', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (306, '1753804190995_tLlK', '1753804190993_7c6O', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (307, '1753804190995_XoDb', '1753804190993_7c6O', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (308, '1753804190995_WTCw', '1753804190993_7c6O', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (309, '1753804190995_jf4U', '1753804190993_7c6O', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (310, '1753804190995_h8E6', '1753804190993_7c6O', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (311, '1753804190995_lcct', '1753804190993_7c6O', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (312, '1753804190995_9JzD', '1753804190993_7c6O', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (313, '1753804190995_NyTc', '1753804190993_7c6O', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (314, '1753804190995_740o', '1753804190993_7c6O', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (315, '1753804190995_XRTu', '1753804190993_7c6O', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (316, '1753804190995_2n5x', '1753804190993_7c6O', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (317, '1753804190995_jegk', '1753804190993_7c6O', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (318, '1753804190995_WSYd', '1753804190993_j16A', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (319, '1753804190995_mZzx', '1753804190993_j16A', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (320, '1753804190995_wYwP', '1753804190993_j16A', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (321, '1753804190995_uMBW', '1753804190993_j16A', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (322, '1753804190995_DhJL', '1753804190993_j16A', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (323, '1753804190995_pZh9', '1753804190993_j16A', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (324, '1753804190995_O9Su', '1753804190993_j16A', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (325, '1753804190995_6apJ', '1753804190993_j16A', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (326, '1753804190995_Jpoo', '1753804190993_j16A', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (327, '1753804190995_x73F', '1753804190993_j16A', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (328, '1753804190995_zaGF', '1753804190993_j16A', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (329, '1753804190995_qZgf', '1753804190993_j16A', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (330, '1753804190995_ZLES', '1753804190993_j16A', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (331, '1753804190995_W93V', '1753804190993_j16A', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (332, '1753804190995_vBcI', '1753804190993_h26J', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (333, '1753804190995_kunm', '1753804190993_h26J', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (334, '1753804190995_AqRL', '1753804190993_h26J', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (335, '1753804190995_mcRN', '1753804190993_h26J', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (336, '1753804190995_Yjfm', '1753804190993_437E', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (337, '1753804190995_ftGM', '1753804190993_437E', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (338, '1753804190995_Zo78', '1753804190993_437E', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (339, '1753804190995_M2g9', '1753804190993_437E', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (340, '1753804190995_2drQ', '1753804190993_voh0', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (341, '1753804190995_e9m3', '1753804190993_voh0', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (342, '1753804190995_16bN', '1753804190993_voh0', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (343, '1753804190995_ofF7', '1753804190993_voh0', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (344, '1753804190995_rc3f', '1753804190993_FHFs', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (345, '1753804190995_C8PP', '1753804190993_FHFs', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (346, '1753804190995_TVeG', '1753804190993_FHFs', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (347, '1753804190995_dtAG', '1753804190993_FHFs', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (348, '1753804190995_XEAq', '1753804190993_wQ0i', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (349, '1753804190995_0Bna', '1753804190993_wQ0i', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (350, '1753804190995_fQdD', '1753804190993_wQ0i', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (351, '1753804190995_tAqw', '1753804190993_wQ0i', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (352, '1753804190995_ipwP', '1753804190993_tKAS', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (353, '1753804190995_H6WB', '1753804190993_tKAS', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (354, '1753804190995_et0B', '1753804190993_tKAS', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (355, '1753804190995_c7KL', '1753804190993_tKAS', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (356, '1753804190995_BW6S', '1753804190993_tKAS', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (357, '1753804190995_US6G', '1753804190993_tKAS', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (358, '1753804190995_WeYw', '1753804190993_i4cs', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (359, '1753804190995_cyJ8', '1753804190993_i4cs', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (360, '1753804190995_Cezr', '1753804190993_i4cs', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (361, '1753804190995_QQqC', '1753804190993_i4cs', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (362, '1753804190995_76Yc', '1753804190993_i4cs', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (363, '1753804190995_W3eS', '1753804190993_i4cs', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (364, '1753804190995_R8V4', '1753804190993_Ov13', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (365, '1753804190995_cSIN', '1753804190993_Ov13', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (366, '1753804190995_k2ha', '1753804190993_Ov13', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (367, '1753804190995_i5I7', '1753804190993_Ov13', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (368, '1753804190995_cOTH', '1753804190993_Ov13', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (369, '1753804190995_L40V', '1753804190993_Ov13', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (370, '1753804190995_D8PD', '1753804190993_NDzP', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (371, '1753804190995_Zk1Y', '1753804190993_NDzP', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (372, '1753804190995_ful9', '1753804190993_NDzP', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (373, '1753804190995_Rf9b', '1753804190993_NDzP', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (374, '1753804190995_N81p', '1753804190993_NDzP', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (375, '1753804190995_eWwI', '1753804190993_NDzP', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (376, '1753804190996_m58a', '1753804190993_ca2n', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (377, '1753804190996_d1jP', '1753804190993_ca2n', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (378, '1753804190996_fpQr', '1753804190993_ca2n', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (379, '1753804190996_YH4o', '1753804190993_ca2n', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (380, '1753804190996_xfhX', '1753804190993_ca2n', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (381, '1753804190996_dyou', '1753804190993_ca2n', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (382, '1753804190996_FN8D', '1753804190993_zZN5', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (383, '1753804190996_wTEh', '1753804190993_zZN5', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (384, '1753804190996_F7AJ', '1753804190993_zZN5', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (385, '1753804190996_uQb0', '1753804190993_zZN5', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (386, '1753804190996_8Y10', '1753804190993_zZN5', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (387, '1753804190996_dZi3', '1753804190993_zZN5', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (388, '1753804190996_ofSm', '1753804190993_zZN5', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (389, '1753804190996_JUHZ', '1753804190993_zZN5', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (390, '1753804190996_6JwE', '1753804190993_zZN5', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (391, '1753804190996_hpzR', '1753804190993_zZN5', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (392, '1753804190996_rIQ5', '1753804190993_zZN5', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (393, '1753804190996_SaIM', '1753804190993_zZN5', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (394, '1753804190996_uBYd', '1753804190993_zZN5', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (395, '1753804190996_Z2jI', '1753804190993_zZN5', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (396, '1753804190996_FM3B', '1753804190993_W4qq', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (397, '1753804190996_S3sA', '1753804190993_W4qq', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (398, '1753804190996_X8lI', '1753804190993_W4qq', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (399, '1753804190996_SQCR', '1753804190993_W4qq', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (400, '1753804190996_M8qx', '1753804190993_W4qq', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (401, '1753804190996_4GvN', '1753804190993_W4qq', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (402, '1753804190996_bTLc', '1753804190993_W4qq', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (403, '1753804190996_WjDF', '1753804190993_W4qq', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (404, '1753804190996_gmzQ', '1753804190993_W4qq', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (405, '1753804190996_3kVp', '1753804190993_W4qq', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (406, '1753804190996_thUH', '1753804190993_W4qq', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (407, '1753804190996_CtvY', '1753804190993_W4qq', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (408, '1753804190996_t5KS', '1753804190993_W4qq', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (409, '1753804190996_SEKG', '1753804190993_W4qq', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (410, '1753804190996_aTGB', '1753804190993_FZUC', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (411, '1753804190996_TWn0', '1753804190993_FZUC', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (412, '1753804190996_9rCw', '1753804190993_FZUC', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (413, '1753804190996_goBj', '1753804190993_FZUC', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (414, '1753804190996_KjXq', '1753804190993_BJn4', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (415, '1753804190996_COwk', '1753804190993_BJn4', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (416, '1753804190996_K0gW', '1753804190993_BJn4', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (417, '1753804190996_a1OS', '1753804190993_BJn4', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (418, '1753804190996_axcJ', '1753804190993_TmX2', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (419, '1753804190996_rhQb', '1753804190993_TmX2', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (420, '1753804190996_eiUH', '1753804190993_TmX2', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (421, '1753804190996_AajM', '1753804190993_TmX2', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (422, '1753804190996_5vyz', '1753804190993_1AMf', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (423, '1753804190996_2f3w', '1753804190993_1AMf', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (424, '1753804190996_DBRM', '1753804190993_1AMf', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (425, '1753804190996_9q3L', '1753804190993_1AMf', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (426, '1753804190996_dY5J', '1753804190993_IabW', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (427, '1753804190996_3oqR', '1753804190993_IabW', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (428, '1753804190996_XBKZ', '1753804190993_IabW', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (429, '1753804190996_fDK8', '1753804190993_IabW', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (430, '1753804190996_gM4n', '1753804190993_I0lK', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (431, '1753804190996_QAim', '1753804190993_I0lK', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (432, '1753804190996_uimb', '1753804190993_I0lK', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (433, '1753804190996_C50j', '1753804190993_I0lK', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (434, '1753804190996_oPZo', '1753804190993_I0lK', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (435, '1753804190996_7w4a', '1753804190993_I0lK', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (436, '1753804190996_5fex', '1753804190993_2Cr3', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (437, '1753804190996_wxuY', '1753804190993_2Cr3', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (438, '1753804190996_2blF', '1753804190993_2Cr3', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (439, '1753804190996_D18I', '1753804190993_2Cr3', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (440, '1753804190996_VVa4', '1753804190993_2Cr3', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (441, '1753804190996_bg6T', '1753804190993_2Cr3', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (442, '1753804190996_J3PY', '1753804190993_5Pn8', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (443, '1753804190996_OE7h', '1753804190993_5Pn8', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (444, '1753804190996_F2fE', '1753804190993_5Pn8', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (445, '1753804190996_i0Ax', '1753804190993_5Pn8', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (446, '1753804190996_F5GE', '1753804190993_5Pn8', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (447, '1753804190996_szQY', '1753804190993_5Pn8', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (448, '1753804190996_iMl3', '1753804190993_ZbP8', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (449, '1753804190996_inEn', '1753804190993_ZbP8', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (450, '1753804190996_LPGD', '1753804190993_ZbP8', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (451, '1753804190996_uKUb', '1753804190993_ZbP8', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (452, '1753804190996_LEaX', '1753804190993_ZbP8', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (453, '1753804190996_Z6XR', '1753804190993_ZbP8', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (454, '1753804190996_LRb6', '1753804190993_5RV8', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (455, '1753804190996_oIm4', '1753804190993_5RV8', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (456, '1753804190996_NtR4', '1753804190993_5RV8', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (457, '1753804190996_TTBv', '1753804190993_5RV8', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (458, '1753804190996_lyhy', '1753804190993_5RV8', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (459, '1753804190996_tVqJ', '1753804190993_5RV8', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (460, '1753804190996_blPT', '1753804190993_LBLC', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (461, '1753804190996_Gnv6', '1753804190993_LBLC', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (462, '1753804190996_NVwC', '1753804190993_LBLC', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (463, '1753804190996_DexT', '1753804190993_LBLC', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (464, '1753804190996_bqq6', '1753804190993_LBLC', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (465, '1753804190996_piSK', '1753804190993_LBLC', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (466, '1753804190996_w5L4', '1753804190993_LBLC', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (467, '1753804190996_ybMx', '1753804190993_LBLC', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (468, '1753804190996_OBkL', '1753804190993_LBLC', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (469, '1753804190996_L6S9', '1753804190993_LBLC', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (470, '1753804190996_dYx9', '1753804190993_LBLC', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (471, '1753804190996_ebaF', '1753804190993_LBLC', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (472, '1753804190996_fMZm', '1753804190993_LBLC', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (473, '1753804190996_rZgJ', '1753804190993_LBLC', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (474, '1753804190996_onIg', '1753804190993_W2gd', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (475, '1753804190996_6o2M', '1753804190993_W2gd', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (476, '1753804190996_7MVN', '1753804190993_W2gd', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (477, '1753804190996_Emqu', '1753804190993_W2gd', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (478, '1753804190996_3ZKT', '1753804190993_W2gd', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (479, '1753804190996_wQPZ', '1753804190993_W2gd', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (480, '1753804190996_ojzR', '1753804190993_W2gd', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (481, '1753804190996_qPYn', '1753804190993_W2gd', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (482, '1753804190996_9Dkt', '1753804190993_W2gd', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (483, '1753804190996_4wzf', '1753804190993_W2gd', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (484, '1753804190996_1x70', '1753804190993_W2gd', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (485, '1753804190996_Gpui', '1753804190993_W2gd', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (486, '1753804190996_2qOe', '1753804190993_W2gd', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (487, '1753804190996_3jeR', '1753804190993_W2gd', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (488, '1753804190996_Xt09', '1753804190993_9H3j', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (489, '1753804190996_SpqE', '1753804190993_9H3j', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (490, '1753804190996_WJ5s', '1753804190993_9H3j', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (491, '1753804190996_BpGL', '1753804190993_9H3j', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (492, '1753804190996_WdIJ', '1753804190993_N25C', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (493, '1753804190996_uHDn', '1753804190993_N25C', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (494, '1753804190996_Om5i', '1753804190993_N25C', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (495, '1753804190996_hz7v', '1753804190993_N25C', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (496, '1753804190996_AR4f', '1753804190993_oec2', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (497, '1753804190996_r1FP', '1753804190993_oec2', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (498, '1753804190996_s2Zf', '1753804190993_oec2', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (499, '1753804190996_491h', '1753804190993_oec2', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (500, '1753804190996_wupK', '1753804190993_eOyp', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (501, '1753804190996_1iay', '1753804190993_eOyp', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (502, '1753804190996_ehwd', '1753804190993_eOyp', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (503, '1753804190996_3AGz', '1753804190993_eOyp', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (504, '1753804190996_rYPD', '1753804190993_hq8t', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (505, '1753804190996_mtuo', '1753804190993_hq8t', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (506, '1753804190996_tgam', '1753804190993_hq8t', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (507, '1753804190996_ei2f', '1753804190993_hq8t', 'EVS', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (508, '1753804190996_mLla', '1753804190993_MiZn', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (509, '1753804190996_XnHt', '1753804190993_MiZn', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (510, '1753804190996_V3dR', '1753804190993_MiZn', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (511, '1753804190996_D6Ty', '1753804190993_MiZn', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (512, '1753804190996_d0sK', '1753804190993_MiZn', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (513, '1753804190996_oKxy', '1753804190993_MiZn', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (514, '1753804190996_pVzZ', '1753804190993_d0Jg', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (515, '1753804190996_AKzS', '1753804190993_d0Jg', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (516, '1753804190996_gzGG', '1753804190993_d0Jg', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (517, '1753804190996_WqRb', '1753804190993_d0Jg', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (518, '1753804190996_B0Eo', '1753804190993_d0Jg', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (519, '1753804190996_StSe', '1753804190993_d0Jg', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (520, '1753804190996_kqwe', '1753804190993_uTDy', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (521, '1753804190996_XIWg', '1753804190993_uTDy', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (522, '1753804190996_KgO8', '1753804190993_uTDy', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (523, '1753804190996_G1sv', '1753804190993_uTDy', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (524, '1753804190996_w6YE', '1753804190993_uTDy', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (525, '1753804190996_6riR', '1753804190993_uTDy', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (526, '1753804190996_XYnf', '1753804190993_hoJ0', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (527, '1753804190997_Qpy2', '1753804190993_hoJ0', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (528, '1753804190997_kYIk', '1753804190993_hoJ0', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (529, '1753804190997_mw5x', '1753804190993_hoJ0', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (530, '1753804190997_J0Hl', '1753804190993_hoJ0', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (531, '1753804190997_KQuj', '1753804190993_hoJ0', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (532, '1753804190997_7fAi', '1753804190993_hDC8', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (533, '1753804190997_VnU8', '1753804190993_hDC8', 'Hindi', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (534, '1753804190997_flDA', '1753804190993_hDC8', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (535, '1753804190997_YAiQ', '1753804190993_hDC8', 'Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (536, '1753804190997_CgiH', '1753804190993_hDC8', 'Social Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (537, '1753804190997_NtLs', '1753804190993_hDC8', 'Sanskrit', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (538, '1753804190997_fTzZ', '1753804190993_IwIj', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (539, '1753804190997_thIG', '1753804190993_IwIj', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (540, '1753804190997_MZIy', '1753804190993_IwIj', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (541, '1753804190997_uGfV', '1753804190993_IwIj', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (542, '1753804190997_kmF9', '1753804190993_IwIj', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (543, '1753804190997_gfmB', '1753804190993_IwIj', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (544, '1753804190997_MhyI', '1753804190993_IwIj', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (545, '1753804190997_fIQs', '1753804190993_IwIj', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (546, '1753804190997_bJwX', '1753804190993_IwIj', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (547, '1753804190997_Lm1N', '1753804190993_IwIj', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (548, '1753804190997_nKkF', '1753804190993_IwIj', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (549, '1753804190997_wYoQ', '1753804190993_IwIj', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (550, '1753804190997_Fye6', '1753804190993_IwIj', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (551, '1753804190997_CKx5', '1753804190993_IwIj', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (552, '1753804190997_blng', '1753804190993_yyh3', 'History', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (553, '1753804190997_itSA', '1753804190993_yyh3', 'Political Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (554, '1753804190997_yywr', '1753804190993_yyh3', 'Psychology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (555, '1753804190997_uwi4', '1753804190993_yyh3', 'Maths', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (556, '1753804190997_C46K', '1753804190993_yyh3', 'Business Studies', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (557, '1753804190997_yz2t', '1753804190993_yyh3', 'Chemistry', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (558, '1753804190997_0Yvr', '1753804190993_yyh3', 'Geography', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (559, '1753804190997_5kM2', '1753804190993_yyh3', 'Sociology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (560, '1753804190997_2xjG', '1753804190993_yyh3', 'Physics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (561, '1753804190997_3cCB', '1753804190993_yyh3', 'Computer Science', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (562, '1753804190997_HiRq', '1753804190993_yyh3', 'Economics', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (563, '1753804190997_NrZM', '1753804190993_yyh3', 'English', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (564, '1753804190997_H42e', '1753804190993_yyh3', 'Accountancy', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;
INSERT INTO master_schema.master_subjects (id, row_id, class_row_id, name, cr_on, up_on) VALUES (565, '1753804190997_qCvj', '1753804190993_yyh3', 'Biology', '2025-07-29 15:35:03', '2025-07-29 15:35:03') ON CONFLICT DO NOTHING;


--
-- TOC entry 5002 (class 0 OID 590363)
-- Dependencies: 224
-- Data for Name: chapters; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (212, '1754042723484_cmzy', '1754042723484_P65I', '1754042723385_ngYv', 'Food: Where Does It Come From?', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (213, '1754042723499_xXct', '1754042723484_P65I', '1754042723385_ngYv', 'Components of Food', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (214, '1754042723500_Dwmo', '1754042723484_P65I', '1754042723385_ngYv', 'Fibre to Fabric', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (215, '1754042723500_xJ0Y', '1754042723484_P65I', '1754042723385_ngYv', 'Sorting Materials into Groups', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (216, '1754042723501_pfGb', '1754042723484_P65I', '1754042723385_ngYv', 'Separation of Substances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (217, '1754042723501_0gGs', '1754042723484_P65I', '1754042723385_ngYv', 'Changes Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (218, '1754042723501_RBzc', '1754042723484_P65I', '1754042723385_ngYv', 'Getting to Know Plants', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (219, '1754042723501_JbXk', '1754042723484_P65I', '1754042723385_ngYv', 'Body Movements', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (220, '1754042723501_UcBB', '1754042723484_P65I', '1754042723385_ngYv', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (221, '1754042723502_YVKP', '1754042723484_P65I', '1754042723385_ngYv', 'Motion and Measurement of Distances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (222, '1754042723502_dkD7', '1754042723484_P65I', '1754042723385_ngYv', 'Light, Shadows and Reflections', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (223, '1754042723502_XKF6', '1754042723484_P65I', '1754042723385_ngYv', 'Electricity and Circuits', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (224, '1754042723502_GHrl', '1754042723484_P65I', '1754042723385_ngYv', 'Fun with Magnets', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (225, '1754042723502_KxEu', '1754042723484_P65I', '1754042723385_ngYv', 'Water', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (226, '1754042723502_4jUB', '1754042723484_P65I', '1754042723385_ngYv', 'Air Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (227, '1754042723502_23U1', '1754042723484_P65I', '1754042723385_ngYv', 'Garbage In, Garbage Out', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (228, '1754042723506_q3cR', '1754042723506_PwTg', '1754042723385_ngYv', 'Food: Where Does It Come From?', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (229, '1754042723506_I92z', '1754042723506_PwTg', '1754042723385_ngYv', 'Components of Food', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (230, '1754042723506_SrRE', '1754042723506_PwTg', '1754042723385_ngYv', 'Fibre to Fabric', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (231, '1754042723506_OQL7', '1754042723506_PwTg', '1754042723385_ngYv', 'Sorting Materials into Groups', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (232, '1754042723507_ygW9', '1754042723506_PwTg', '1754042723385_ngYv', 'Separation of Substances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (233, '1754042723507_QAsD', '1754042723506_PwTg', '1754042723385_ngYv', 'Changes Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (234, '1754042723507_Ywm0', '1754042723506_PwTg', '1754042723385_ngYv', 'Getting to Know Plants', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (235, '1754042723507_EP3B', '1754042723506_PwTg', '1754042723385_ngYv', 'Body Movements', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (236, '1754042723507_mGJ1', '1754042723506_PwTg', '1754042723385_ngYv', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (237, '1754042723507_88g7', '1754042723506_PwTg', '1754042723385_ngYv', 'Motion and Measurement of Distances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (238, '1754042723507_p157', '1754042723506_PwTg', '1754042723385_ngYv', 'Light, Shadows and Reflections', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (239, '1754042723507_Th0n', '1754042723506_PwTg', '1754042723385_ngYv', 'Electricity and Circuits', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (240, '1754042723508_5dYH', '1754042723506_PwTg', '1754042723385_ngYv', 'Fun with Magnets', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (241, '1754042723508_Sfos', '1754042723506_PwTg', '1754042723385_ngYv', 'Water', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (242, '1754042723508_gAcM', '1754042723506_PwTg', '1754042723385_ngYv', 'Air Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (243, '1754042723508_uUnf', '1754042723506_PwTg', '1754042723385_ngYv', 'Garbage In, Garbage Out', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (244, '1754042723511_LIJw', '1754042723511_ERDQ', '1754042723385_ngYv', 'Food: Where Does It Come From?', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (245, '1754042723511_IlLb', '1754042723511_ERDQ', '1754042723385_ngYv', 'Components of Food', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (246, '1754042723511_pesC', '1754042723511_ERDQ', '1754042723385_ngYv', 'Fibre to Fabric', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (247, '1754042723512_8fdm', '1754042723511_ERDQ', '1754042723385_ngYv', 'Sorting Materials into Groups', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (248, '1754042723512_rxIZ', '1754042723511_ERDQ', '1754042723385_ngYv', 'Separation of Substances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (249, '1754042723512_lN3i', '1754042723511_ERDQ', '1754042723385_ngYv', 'Changes Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (250, '1754042723512_PTx8', '1754042723511_ERDQ', '1754042723385_ngYv', 'Getting to Know Plants', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (251, '1754042723512_IUZ4', '1754042723511_ERDQ', '1754042723385_ngYv', 'Body Movements', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (252, '1754042723512_5NLh', '1754042723511_ERDQ', '1754042723385_ngYv', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (253, '1754042723512_I7Qc', '1754042723511_ERDQ', '1754042723385_ngYv', 'Motion and Measurement of Distances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (254, '1754042723513_iAad', '1754042723511_ERDQ', '1754042723385_ngYv', 'Light, Shadows and Reflections', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (255, '1754042723513_cKSx', '1754042723511_ERDQ', '1754042723385_ngYv', 'Electricity and Circuits', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (256, '1754042723513_AaF9', '1754042723511_ERDQ', '1754042723385_ngYv', 'Fun with Magnets', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (44, '1753766673946_f7zZ', '1753766673945_LGat', '1753766673916_pY0v', 'Chapter 1: A Letter to God', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (45, '1753766673958_9MVG', '1753766673945_LGat', '1753766673916_pY0v', 'Chapter 2: Nelson Mandela: Long Walk to Freedom', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (46, '1753766673959_Zurg', '1753766673945_LGat', '1753766673916_pY0v', 'Chapter 3: Two Stories about Flying', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (47, '1753766673959_EElb', '1753766673945_LGat', '1753766673916_pY0v', 'Chapter 4: From the Diary of Anne Frank', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (48, '1753766673959_NAMW', '1753766673945_LGat', '1753766673916_pY0v', 'Chapter 5: Glimpses of India', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (49, '1753766673959_AVZQ', '1753766673945_LGat', '1753766673916_pY0v', 'Chapter 6: Mijbil the Otter', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (50, '1753766673959_FRlf', '1753766673945_LGat', '1753766673916_pY0v', 'Chapter 7: Madam Rides the Bus', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (51, '1753766673959_lOmG', '1753766673945_LGat', '1753766673916_pY0v', 'Chapter 8: The Sermon at Benares', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (52, '1753766673959_InlC', '1753766673945_LGat', '1753766673916_pY0v', 'Chapter 9: The Proposal', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (53, '1753766673960_vXt6', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 1 – Real Numbers', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (54, '1753766673961_yFw7', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 2 – Polynomials', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (55, '1753766673961_7Wt1', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 3 – Pair of Linear Equations in Two Variables', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (56, '1753766673961_2JTM', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 4 – Quadratic Equations', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (57, '1753766673961_bhNI', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 5 – Arithmetic Progressions', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (58, '1753766673961_el7a', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 6 – Triangles', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (59, '1753766673961_ifF3', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 7 – Coordinate Geometry', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (60, '1753766673961_J0hF', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 8 – Introduction to Trigonometry', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (61, '1753766673962_1jAu', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 9 – Some Applications of Trigonometry', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (62, '1753766673962_lDsA', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 10 – Circles', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (63, '1753766673962_xMe7', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 11 – Areas Related to Circle', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (64, '1753766673962_YPVZ', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 12 – Surface Areas and Volumes', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (65, '1753766673962_iP6F', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 13 – Statistics', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (66, '1753766673962_yrDl', '1753766673960_rsdN', '1753766673916_pY0v', 'Chapter 14 – Probability', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (70, '1753766673963_iLwW', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 4 – Carbon and Its Compounds', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (71, '1753766673963_kbJQ', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 5 – Life Process', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (72, '1753766673963_hBEv', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 6 – Control and Coordination', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (73, '1753766673963_0ytk', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 7 – How Do Organisms Reproduce?', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (74, '1753766673963_jKGh', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 8 – Heredity and Evolution', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (75, '1753766673963_xHjz', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 9 – Light – Reflection and Refraction', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (76, '1753766673963_j2px', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 10 – The Human Eye and The Colourful World', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (77, '1753766673963_lk4M', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 11 – Electricity', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (78, '1753766673964_fNp3', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 12 – Magnetic Effects of Electric Current', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (79, '1753766673964_asZQ', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 13 – Our Environment', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (83, '1753766673964_hJKP', '1753766673964_I3oh', '1753766673916_pY0v', 'Chapter 4: Political Parties', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (84, '1753766673964_p1Lu', '1753766673964_I3oh', '1753766673916_pY0v', 'Chapter 5: Outcomes of Democracy', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (257, '1754042723514_ar9S', '1754042723511_ERDQ', '1754042723385_ngYv', 'Water', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (258, '1754042723514_d98O', '1754042723511_ERDQ', '1754042723385_ngYv', 'Air Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (87, '1753781508470_dQ0N', '1753781497492_j8KL', '1753766673916_pY0v', 'new chapter 1', NULL, '2025-07-29 02:31:48.470373', '2025-07-29 02:31:48.470373', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (88, '1753781513934_GXnI', '1753781497492_j8KL', '1753766673916_pY0v', 'cahpter 2', NULL, '2025-07-29 02:31:53.934791', '2025-07-29 02:31:53.934791', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (259, '1754042723514_ZGT4', '1754042723511_ERDQ', '1754042723385_ngYv', 'Garbage In, Garbage Out', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (260, '1754042723519_VFS6', '1754042723519_J0QV', '1754042723385_ngYv', 'Food: Where Does It Come From?', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (261, '1754042723519_GvRd', '1754042723519_J0QV', '1754042723385_ngYv', 'Components of Food', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (262, '1754042723520_k6C7', '1754042723519_J0QV', '1754042723385_ngYv', 'Fibre to Fabric', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (263, '1754042723520_1Q3o', '1754042723519_J0QV', '1754042723385_ngYv', 'Sorting Materials into Groups', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (264, '1754042723520_YYpj', '1754042723519_J0QV', '1754042723385_ngYv', 'Separation of Substances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (265, '1754042723520_Su4t', '1754042723519_J0QV', '1754042723385_ngYv', 'Changes Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (266, '1754042723520_maW3', '1754042723519_J0QV', '1754042723385_ngYv', 'Getting to Know Plants', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (267, '1754042723520_1y8u', '1754042723519_J0QV', '1754042723385_ngYv', 'Body Movements', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (268, '1754042723520_SOWx', '1754042723519_J0QV', '1754042723385_ngYv', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (269, '1754042723520_nYpB', '1754042723519_J0QV', '1754042723385_ngYv', 'Motion and Measurement of Distances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (270, '1754042723520_UULB', '1754042723519_J0QV', '1754042723385_ngYv', 'Light, Shadows and Reflections', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (271, '1754042723520_8OzW', '1754042723519_J0QV', '1754042723385_ngYv', 'Electricity and Circuits', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (272, '1754042723521_6eRx', '1754042723519_J0QV', '1754042723385_ngYv', 'Fun with Magnets', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (273, '1754042723521_VWYM', '1754042723519_J0QV', '1754042723385_ngYv', 'Water', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (274, '1754042723521_CKmz', '1754042723519_J0QV', '1754042723385_ngYv', 'Air Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (275, '1754042723521_U3OL', '1754042723519_J0QV', '1754042723385_ngYv', 'Garbage In, Garbage Out', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (276, '1754042723525_Q8uK', '1754042723524_1rV8', '1754042723385_ngYv', 'Food: Where Does It Come From?', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (277, '1754042723525_CzZT', '1754042723524_1rV8', '1754042723385_ngYv', 'Components of Food', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (278, '1754042723525_4O1L', '1754042723524_1rV8', '1754042723385_ngYv', 'Fibre to Fabric', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (279, '1754042723525_p3LF', '1754042723524_1rV8', '1754042723385_ngYv', 'Sorting Materials into Groups', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (280, '1754042723525_6lnn', '1754042723524_1rV8', '1754042723385_ngYv', 'Separation of Substances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (281, '1754042723525_taEo', '1754042723524_1rV8', '1754042723385_ngYv', 'Changes Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (282, '1754042723525_OdJw', '1754042723524_1rV8', '1754042723385_ngYv', 'Getting to Know Plants', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (283, '1754042723525_x088', '1754042723524_1rV8', '1754042723385_ngYv', 'Body Movements', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (284, '1754042723526_XYwz', '1754042723524_1rV8', '1754042723385_ngYv', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (285, '1754042723526_A9uK', '1754042723524_1rV8', '1754042723385_ngYv', 'Motion and Measurement of Distances', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (286, '1754042723526_7iWq', '1754042723524_1rV8', '1754042723385_ngYv', 'Light, Shadows and Reflections', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (287, '1754042723526_BXBv', '1754042723524_1rV8', '1754042723385_ngYv', 'Electricity and Circuits', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (68, '1753766673963_84Rr', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 2 – Acids Bases and Salt', '', '2025-07-28 22:24:33.916813', '2025-08-04 01:02:35.980156', true, '2025-08-04 08:02:35.951', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (80, '1753766673964_U9RB', '1753766673964_I3oh', '1753766673916_pY0v', 'Chapter 1: Power Sharing', '', '2025-07-28 22:24:33.916813', '2025-08-08 03:59:27.760345', true, '2025-08-08 10:59:27.759', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (82, '1753766673964_HuQ6', '1753766673964_I3oh', '1753766673916_pY0v', 'Chapter 3: Gender, Religion and Caste', '', '2025-07-28 22:24:33.916813', '2025-08-08 03:59:28.744548', true, '2025-08-08 10:59:28.743', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (288, '1754042723526_8imb', '1754042723524_1rV8', '1754042723385_ngYv', 'Fun with Magnets', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (289, '1754042723536_6Tjv', '1754042723524_1rV8', '1754042723385_ngYv', 'Water', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (290, '1754042723537_GGpe', '1754042723524_1rV8', '1754042723385_ngYv', 'Air Around Us', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (291, '1754042723537_6CeZ', '1754042723524_1rV8', '1754042723385_ngYv', 'Garbage In, Garbage Out', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (292, '1754042775799_LliJ', '1754042775799_vEU5', '1754042775777_0Da6', 'Food: Where Does It Come From?', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (293, '1754042775800_Rod3', '1754042775799_vEU5', '1754042775777_0Da6', 'Components of Food', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (294, '1754042775801_LJ6N', '1754042775799_vEU5', '1754042775777_0Da6', 'Fibre to Fabric', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (295, '1754042775801_DyO8', '1754042775799_vEU5', '1754042775777_0Da6', 'Sorting Materials into Groups', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (296, '1754042775801_ZzPU', '1754042775799_vEU5', '1754042775777_0Da6', 'Separation of Substances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (297, '1754042775801_Z89v', '1754042775799_vEU5', '1754042775777_0Da6', 'Changes Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (298, '1754042775801_5ch0', '1754042775799_vEU5', '1754042775777_0Da6', 'Getting to Know Plants', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (299, '1754042775801_mosK', '1754042775799_vEU5', '1754042775777_0Da6', 'Body Movements', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (300, '1754042775801_93PV', '1754042775799_vEU5', '1754042775777_0Da6', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (301, '1754042775801_Jjj4', '1754042775799_vEU5', '1754042775777_0Da6', 'Motion and Measurement of Distances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (302, '1754042775802_LrLI', '1754042775799_vEU5', '1754042775777_0Da6', 'Light, Shadows and Reflections', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (303, '1754042775802_aYpX', '1754042775799_vEU5', '1754042775777_0Da6', 'Electricity and Circuits', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (304, '1754042775802_f8qS', '1754042775799_vEU5', '1754042775777_0Da6', 'Fun with Magnets', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (305, '1754042775802_bA7W', '1754042775799_vEU5', '1754042775777_0Da6', 'Water', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (306, '1754042775802_wpoJ', '1754042775799_vEU5', '1754042775777_0Da6', 'Air Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (307, '1754042775802_8gIV', '1754042775799_vEU5', '1754042775777_0Da6', 'Garbage In, Garbage Out', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (308, '1754042775806_wbzZ', '1754042775805_7j5P', '1754042775777_0Da6', 'Food: Where Does It Come From?', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (309, '1754042775806_HKAr', '1754042775805_7j5P', '1754042775777_0Da6', 'Components of Food', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (310, '1754042775806_x9mT', '1754042775805_7j5P', '1754042775777_0Da6', 'Fibre to Fabric', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (311, '1754042775806_BZco', '1754042775805_7j5P', '1754042775777_0Da6', 'Sorting Materials into Groups', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (312, '1754042775806_4BN2', '1754042775805_7j5P', '1754042775777_0Da6', 'Separation of Substances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (313, '1754042775806_orQM', '1754042775805_7j5P', '1754042775777_0Da6', 'Changes Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (314, '1754042775806_6cRy', '1754042775805_7j5P', '1754042775777_0Da6', 'Getting to Know Plants', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (315, '1754042775807_NgmY', '1754042775805_7j5P', '1754042775777_0Da6', 'Body Movements', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (316, '1754042775807_5Ng0', '1754042775805_7j5P', '1754042775777_0Da6', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (317, '1754042775807_Iba6', '1754042775805_7j5P', '1754042775777_0Da6', 'Motion and Measurement of Distances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (318, '1754042775807_JVWq', '1754042775805_7j5P', '1754042775777_0Da6', 'Light, Shadows and Reflections', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (319, '1754042775807_DCXz', '1754042775805_7j5P', '1754042775777_0Da6', 'Electricity and Circuits', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (320, '1754042775807_HJ0u', '1754042775805_7j5P', '1754042775777_0Da6', 'Fun with Magnets', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (321, '1754042775807_rbQD', '1754042775805_7j5P', '1754042775777_0Da6', 'Water', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (322, '1754042775807_z1nY', '1754042775805_7j5P', '1754042775777_0Da6', 'Air Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (323, '1754042775807_6hUj', '1754042775805_7j5P', '1754042775777_0Da6', 'Garbage In, Garbage Out', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (324, '1754042775812_ulje', '1754042775811_RGaw', '1754042775777_0Da6', 'Food: Where Does It Come From?', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (325, '1754042775812_ICbm', '1754042775811_RGaw', '1754042775777_0Da6', 'Components of Food', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (326, '1754042775812_ykCt', '1754042775811_RGaw', '1754042775777_0Da6', 'Fibre to Fabric', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (327, '1754042775812_noZj', '1754042775811_RGaw', '1754042775777_0Da6', 'Sorting Materials into Groups', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (328, '1754042775812_ZU1o', '1754042775811_RGaw', '1754042775777_0Da6', 'Separation of Substances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (329, '1754042775812_ZlNZ', '1754042775811_RGaw', '1754042775777_0Da6', 'Changes Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (330, '1754042775813_Ak5t', '1754042775811_RGaw', '1754042775777_0Da6', 'Getting to Know Plants', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (331, '1754042775813_WuGg', '1754042775811_RGaw', '1754042775777_0Da6', 'Body Movements', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (332, '1754042775813_FbWZ', '1754042775811_RGaw', '1754042775777_0Da6', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (333, '1754042775813_kcP2', '1754042775811_RGaw', '1754042775777_0Da6', 'Motion and Measurement of Distances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (334, '1754042775813_TeFO', '1754042775811_RGaw', '1754042775777_0Da6', 'Light, Shadows and Reflections', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (335, '1754042775813_OfTJ', '1754042775811_RGaw', '1754042775777_0Da6', 'Electricity and Circuits', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (336, '1754042775813_pnjM', '1754042775811_RGaw', '1754042775777_0Da6', 'Fun with Magnets', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (337, '1754042775813_uYEg', '1754042775811_RGaw', '1754042775777_0Da6', 'Water', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (338, '1754042775813_0eMe', '1754042775811_RGaw', '1754042775777_0Da6', 'Air Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (339, '1754042775813_TavF', '1754042775811_RGaw', '1754042775777_0Da6', 'Garbage In, Garbage Out', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (340, '1754042775817_OcBT', '1754042775817_a3kZ', '1754042775777_0Da6', 'Food: Where Does It Come From?', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (341, '1754042775817_o1Cd', '1754042775817_a3kZ', '1754042775777_0Da6', 'Components of Food', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (342, '1754042775817_j9rv', '1754042775817_a3kZ', '1754042775777_0Da6', 'Fibre to Fabric', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (343, '1754042775817_K0SV', '1754042775817_a3kZ', '1754042775777_0Da6', 'Sorting Materials into Groups', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (344, '1754042775818_HNhQ', '1754042775817_a3kZ', '1754042775777_0Da6', 'Separation of Substances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (345, '1754042775818_KnIb', '1754042775817_a3kZ', '1754042775777_0Da6', 'Changes Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (346, '1754042775818_Y6kh', '1754042775817_a3kZ', '1754042775777_0Da6', 'Getting to Know Plants', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (347, '1754042775818_9WZz', '1754042775817_a3kZ', '1754042775777_0Da6', 'Body Movements', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (348, '1754042775818_kfTd', '1754042775817_a3kZ', '1754042775777_0Da6', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (349, '1754042775818_PWPM', '1754042775817_a3kZ', '1754042775777_0Da6', 'Motion and Measurement of Distances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (350, '1754042775818_3pF8', '1754042775817_a3kZ', '1754042775777_0Da6', 'Light, Shadows and Reflections', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (351, '1754042775818_jvlu', '1754042775817_a3kZ', '1754042775777_0Da6', 'Electricity and Circuits', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (352, '1754042775818_XPVv', '1754042775817_a3kZ', '1754042775777_0Da6', 'Fun with Magnets', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (353, '1754042775819_YCKh', '1754042775817_a3kZ', '1754042775777_0Da6', 'Water', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (354, '1754042775819_mEMS', '1754042775817_a3kZ', '1754042775777_0Da6', 'Air Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (355, '1754042775819_w96k', '1754042775817_a3kZ', '1754042775777_0Da6', 'Garbage In, Garbage Out', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (357, '1754042775823_2h50', '1754042775822_IPCd', '1754042775777_0Da6', 'Components of Food', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (359, '1754042775823_EqZG', '1754042775822_IPCd', '1754042775777_0Da6', 'Sorting Materials into Groups', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (360, '1754042775823_TA7Z', '1754042775822_IPCd', '1754042775777_0Da6', 'Separation of Substances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (361, '1754042775823_JLT7', '1754042775822_IPCd', '1754042775777_0Da6', 'Changes Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (362, '1754042775823_8nuO', '1754042775822_IPCd', '1754042775777_0Da6', 'Getting to Know Plants', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (363, '1754042775823_qu84', '1754042775822_IPCd', '1754042775777_0Da6', 'Body Movements', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (364, '1754042775823_KdHA', '1754042775822_IPCd', '1754042775777_0Da6', 'The Living Organisms and Their Surroundings', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (365, '1754042775823_mCpS', '1754042775822_IPCd', '1754042775777_0Da6', 'Motion and Measurement of Distances', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (366, '1754042775824_44Er', '1754042775822_IPCd', '1754042775777_0Da6', 'Light, Shadows and Reflections', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (367, '1754042775824_09SQ', '1754042775822_IPCd', '1754042775777_0Da6', 'Electricity and Circuits', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (368, '1754042775824_OoLz', '1754042775822_IPCd', '1754042775777_0Da6', 'Fun with Magnets', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (369, '1754042775824_gtem', '1754042775822_IPCd', '1754042775777_0Da6', 'Water', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (370, '1754042775824_HKJC', '1754042775822_IPCd', '1754042775777_0Da6', 'Air Around Us', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (371, '1754042775824_JcTC', '1754042775822_IPCd', '1754042775777_0Da6', 'Garbage In, Garbage Out', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (372, '1754043501147_5DTr', '1754043479595_Hxco', '1754042723385_ngYv', 'chapter_test1', NULL, '2025-08-01 03:18:21.17331', '2025-08-01 03:18:28.164135', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (67, '1753766673962_cuI8', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 1 – Chemical Reactions and Equations', '', '2025-07-28 22:24:33.916813', '2025-08-04 01:01:56.074488', true, '2025-08-04 08:01:56.047', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (69, '1753766673963_v3Sq', '1753766673962_uX2x', '1753766673916_pY0v', 'Chapter 3 – Metals and Non-metals', '', '2025-07-28 22:24:33.916813', '2025-08-04 01:03:09.105488', true, '2025-08-04 08:03:09.079', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (356, '1754042775822_MqrQ', '1754042775822_IPCd', '1754042775777_0Da6', 'Food: Where Does It Come From?', '', '2025-08-01 03:06:15.790871', '2025-08-07 00:43:40.070981', true, '2025-08-07 07:43:40.07', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (358, '1754042775823_Kxhb', '1754042775822_IPCd', '1754042775777_0Da6', 'Fibre to Fabric', '', '2025-08-01 03:06:15.790871', '2025-08-07 01:36:33.778287', true, '2025-08-07 08:36:33.777', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (374, '1754650786424_I2E6', '1754650370800_SiNF', '1753766673916_pY0v', 'test1.2', NULL, '2025-08-08 03:59:46.426019', '2025-08-08 03:59:46.426019', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (375, '1754650793069_Iul0', '1754650370800_SiNF', '1753766673916_pY0v', 'test1.3', NULL, '2025-08-08 03:59:53.071149', '2025-08-08 03:59:53.071149', false, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (373, '1754650748142_OGtE', '1754650370800_SiNF', '1753766673916_pY0v', 'test1.1', NULL, '2025-08-08 03:59:08.143851', '2025-08-08 04:03:39.265119', true, '2025-08-08 11:03:39.264', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.chapters (id, row_id, subject_id, school_id, name, description, cr_on, up_on, is_completed, completed_on, completed_by) VALUES (81, '1753766673964_fNdx', '1753766673964_I3oh', '1753766673916_pY0v', 'Chapter 2: Federalism', '', '2025-07-28 22:24:33.916813', '2025-08-09 11:27:42.993669', true, '2025-08-09 05:57:42.989', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5004 (class 0 OID 590372)
-- Dependencies: 226
-- Data for Name: class; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (84, '1753766673918_9SA7', '1753766673916_pY0v', 'null', 'class 1', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (85, '1753766673923_Y0Xc', '1753766673916_pY0v', 'null', 'class 2', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (86, '1753766673926_oXc2', '1753766673916_pY0v', 'null', 'class 3', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (87, '1753766673928_9vnG', '1753766673916_pY0v', 'null', 'class 4', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (88, '1753766673930_0R7u', '1753766673916_pY0v', 'null', 'class 5', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (89, '1753766673932_85sJ', '1753766673916_pY0v', 'null', 'class 6', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (90, '1753766673934_IbU5', '1753766673916_pY0v', 'null', 'class 7', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (91, '1753766673937_60N7', '1753766673916_pY0v', 'null', 'class 8', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (92, '1753766673942_Wrmq', '1753766673916_pY0v', 'null', 'class 9', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (93, '1753766673945_n2nx', '1753766673916_pY0v', 'null', 'class 10', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (94, '1753766673965_yhbT', '1753766673916_pY0v', 'null', 'class 11  (Science)', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (95, '1753766673967_59lZ', '1753766673916_pY0v', 'null', 'class 12  (Science)', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (96, '1753766673971_aMzO', '1753766673916_pY0v', 'null', 'class 11   (Commerce)', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (97, '1753766673975_EZNi', '1753766673916_pY0v', 'null', 'class 12  (Commerce)', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (98, '1753766673977_aTwB', '1753766673916_pY0v', 'null', 'class 11 (Arts)', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (99, '1753766673980_KdOe', '1753766673916_pY0v', 'null', 'class 12 (Arts)', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (166, '1754042723435_jMro', '1754042723385_ngYv', 'null', 'Class 1', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (167, '1754042723469_j47t', '1754042723385_ngYv', 'null', 'Class 2', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (168, '1754042723471_5vPf', '1754042723385_ngYv', 'null', 'Class 3', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (169, '1754042723474_KTNY', '1754042723385_ngYv', 'null', 'Class 4', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (170, '1754042723477_5t2T', '1754042723385_ngYv', 'null', 'Class 5', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (171, '1754042723480_xLIp', '1754042723385_ngYv', 'null', 'Class 6', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (172, '1754042723504_9slI', '1754042723385_ngYv', 'null', 'Class 7', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (173, '1754042723509_YUFz', '1754042723385_ngYv', 'null', 'Class 8', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (174, '1754042723516_zEQp', '1754042723385_ngYv', 'null', 'Class 9', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (175, '1754042723522_V1pw', '1754042723385_ngYv', 'null', 'Class 10', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (176, '1754042723538_rdQh', '1754042723385_ngYv', 'null', 'Class 11', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (177, '1754042723547_48z5', '1754042723385_ngYv', 'null', 'Class 12', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (178, '1754042775780_eoEH', '1754042775777_0Da6', 'null', 'Class 1', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (179, '1754042775784_6jZZ', '1754042775777_0Da6', 'null', 'Class 2', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (180, '1754042775787_NKQ3', '1754042775777_0Da6', 'null', 'Class 3', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (181, '1754042775789_dbAj', '1754042775777_0Da6', 'null', 'Class 4', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (182, '1754042775792_5NWx', '1754042775777_0Da6', 'null', 'Class 5', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (183, '1754042775795_UtI5', '1754042775777_0Da6', 'null', 'Class 6', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (184, '1754042775803_45rS', '1754042775777_0Da6', 'null', 'Class 7', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (185, '1754042775808_lZcM', '1754042775777_0Da6', 'null', 'Class 8', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (186, '1754042775815_Yhgx', '1754042775777_0Da6', 'null', 'Class 9', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (187, '1754042775820_eYhV', '1754042775777_0Da6', 'null', 'Class 10', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (188, '1754042775826_OZRp', '1754042775777_0Da6', 'null', 'Class 11', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (189, '1754042775835_QJpF', '1754042775777_0Da6', 'null', 'Class 12', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (190, '1754043461139_JyB0', '1754042723385_ngYv', NULL, 'class_test1', '2025-08-01 03:17:41.170395', '2025-08-01 03:17:47.412134') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (191, '1754457302869_Cf5v', '1753766673916_pY0v', NULL, 'स्कूल', '2025-08-05 22:15:02.870012', '2025-08-08 00:50:19.113325') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.class (id, row_id, school_id, teacher_id, name, cr_on, up_on) VALUES (136, '1753781477854_5wM2', '1753766673916_pY0v', NULL, 'class 13', '2025-07-29 02:31:17.884769', '2025-07-29 02:31:17.884769') ON CONFLICT DO NOTHING;


--
-- TOC entry 5023 (class 0 OID 598521)
-- Dependencies: 245
-- Data for Name: exam_submissions; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (5, '1754809886953_npG3', '1754804010831_ATEF', NULL, '1754803933426_cd8Q', '{"selected": "A"}', '2025-08-10 12:41:27.027536', '2025-08-10 12:41:27.027536') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (6, '1754809886953_JNs3', '1754804010831_ATEF', NULL, '1754803970474_aO6x', '{"selected": "CU"}', '2025-08-10 12:41:27.034256', '2025-08-10 12:41:27.034256') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (7, '1754810945062_h9Hl', '1754810431828_VG2t', NULL, '1754718376720_gvZK', '{"selected": "hj"}', '2025-08-10 12:59:05.13862', '2025-08-10 12:59:05.13862') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (8, '1754810945063_RAfi', '1754810431828_VG2t', NULL, '1754803970474_aO6x', '{"selected": "C"}', '2025-08-10 12:59:05.148039', '2025-08-10 12:59:05.148039') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (9, '1754810945063_jEm1', '1754810431828_VG2t', NULL, '1754810310017_HSQP', '{"selected": null}', '2025-08-10 12:59:05.150358', '2025-08-10 12:59:05.150358') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (10, '1754810945063_uHgJ', '1754810431828_VG2t', NULL, '1754810364363_1W9o', '{"selected": null}', '2025-08-10 12:59:05.153093', '2025-08-10 12:59:05.153093') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (11, '1754811421296_BLgR', '1754810431828_VG2t', NULL, '1754718376720_gvZK', '{"selected": "yui"}', '2025-08-10 13:07:03.49296', '2025-08-10 13:07:03.49296') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (12, '1754811421297_4CMK', '1754810431828_VG2t', NULL, '1754803970474_aO6x', '{"selected": "B"}', '2025-08-10 13:07:03.502817', '2025-08-10 13:07:03.502817') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (13, '1754811421297_QBE0', '1754810431828_VG2t', NULL, '1754810310017_HSQP', '{"selected": ["B", "C"]}', '2025-08-10 13:07:03.505325', '2025-08-10 13:07:03.505325') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exam_submissions (id, row_id, exam_id, student_id, question_id, selected_answer, cr_on, up_on) VALUES (14, '1754811421297_CjAu', '1754810431828_VG2t', NULL, '1754810364363_1W9o', '{"selected": ["D", "B"]}', '2025-08-10 13:07:03.508589', '2025-08-10 13:07:03.508589') ON CONFLICT DO NOTHING;


--
-- TOC entry 5006 (class 0 OID 590380)
-- Dependencies: 228
-- Data for Name: exams; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (1, '1754545945243_zDCB', '1753766673964_U9RB', NULL, 'testexam1', 21, 11, 15, '2025-08-11 18:30:00', '2025-08-06 22:52:25.274098', '2025-08-06 22:52:25.274098', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (2, '1754546105145_NVpn', '1753766673964_U9RB', '1753785501716_cgnc', 'test2', 20, 33, 5, '2025-08-14 18:30:00', '2025-08-06 22:55:05.19047', '2025-08-06 22:55:05.19047', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (3, '1754553027313_eiTo', '1754042775822_MqrQ', '1754552518485_8Uy3', 'test_exam1', 44, 20, 12, '2025-08-11 18:30:00', '2025-08-07 00:50:27.341876', '2025-08-07 00:50:27.341876', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (4, '1754553545513_Xj1J', '1754042775822_MqrQ', '1754552518485_8Uy3', 'b1_test', 44, 12, 3, '2025-08-20 18:30:00', '2025-08-07 00:59:05.538714', '2025-08-07 00:59:05.538714', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (5, '1754556183279_C6Mw', '1754042775822_MqrQ', '1754042775777_pvar', 'exam200', 33, 33, 1, '1954-12-31 18:30:00', '2025-08-07 01:43:03.306543', '2025-08-07 01:43:03.306543', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (6, '1754557950713_PaYN', '1754042775822_MqrQ', '1754042775777_0Da6', 'exam205', 89, 33, 20, '2025-08-12 18:30:00', '2025-08-07 02:12:30.738487', '2025-08-07 02:12:30.738487', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (7, '1754558070619_A5tD', '1754042775822_MqrQ', '1754552518485_8Uy3', 'test206', 44, 5, 12, '2025-08-14 18:30:00', '2025-08-07 02:14:30.646829', '2025-08-07 02:14:30.646829', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (8, '1754563553787_WM4h', '1753766673963_84Rr', NULL, 'testExam207', 23, 10, 5, '2025-08-07 18:30:00', '2025-08-07 03:45:53.929694', '2025-08-07 03:45:53.929694', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (9, '1754564107609_3a9I', '1754042775822_MqrQ', '1754552518485_8Uy3', 'testExam208', 34, 4, 44, '2025-08-08 18:30:00', '2025-08-07 03:55:07.636272', '2025-08-07 03:55:07.636272', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (10, '1754564197522_CDMV', '1754042775823_Kxhb', '1754552518485_8Uy3', 'testExam209', 43, 56, 12, '2025-08-10 18:30:00', '2025-08-07 03:56:37.548709', '2025-08-07 03:56:37.548709', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (11, '1754564258730_cx6O', '1754042775823_Kxhb', '1754552518485_8Uy3', 'sdfg', 5, 44, 5, '2025-08-11 18:30:00', '2025-08-07 03:57:38.73151', '2025-08-07 03:57:38.73151', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (12, '1754564324104_8ana', '1754042775822_MqrQ', '1754552554284_7uYr', 'dfgh', 5, 5, 55, '2025-08-14 18:30:00', '2025-08-07 03:58:44.130153', '2025-08-07 03:58:44.130153', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (13, '1754566221184_R3hz', '1754042775822_MqrQ', '1754552518485_8Uy3', 'dfgsdg', 4, 55, 44, '2025-08-20 18:30:00', '2025-08-07 04:30:21.211034', '2025-08-07 04:30:21.211034', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (14, '1754566777623_UvSM', '1754042775823_Kxhb', '1754552518485_8Uy3', 'dfsdfg', 44, 3, 43, '2025-08-21 18:30:00', '2025-08-07 04:39:37.650206', '2025-08-07 04:39:37.650206', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (15, '1754651049162_mNj5', '1754650748142_OGtE', '1753785501716_cgnc', 'test400', 12, 23, 33, '2025-08-22 18:30:00', '2025-08-08 04:04:09.216743', '2025-08-08 04:04:09.216743', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (16, '1754723270924_ynoN', '1753766673964_fNdx', '1753785501716_cgnc', 'tes45', 79, 28, 78, '2025-08-22 18:30:00', '2025-08-09 12:37:51.097551', '2025-08-09 12:37:51.097551', '"1753766673964_fNdx"') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (17, '1754723382023_nEgg', '1753766673964_fNdx', '1753785501716_cgnc', 'kl89', 90, 23, 7, '2025-08-22 18:30:00', '2025-08-09 12:39:44.190529', '2025-08-09 12:39:44.190529', '"1753766673964_fNdx"') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (18, '1754723461922_A9kx', '1753766673964_fNdx', '1753785501716_cgnc', 'ty78', 56, 10, 78, '2025-08-28 18:30:00', '2025-08-09 12:41:04.099226', '2025-08-09 12:41:04.099226', '["1754718376720_gvZK", "1754718350561_8oTo"]') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (19, '1754804010831_ATEF', '1753766673964_fNdx', '1753785501716_cgnc', 'test12', 100, 20, 30, '2025-08-22 18:30:00', '2025-08-10 11:03:32.983149', '2025-08-10 11:03:32.983149', '["1754803970474_aO6x", "1754803933426_cd8Q"]') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.exams (id, row_id, chapter_id, created_by, name, total_marks, passing_marks, duration_minutes, scheduled_on, cr_on, up_on, question_set) VALUES (20, '1754810431828_VG2t', '1753766673964_fNdx', '1753785501716_cgnc', 'test 78', 100, 50, 60, '2025-08-22 18:30:00', '2025-08-10 12:50:31.899112', '2025-08-10 12:50:31.899112', '["1754810364363_1W9o", "1754803970474_aO6x", "1754810310017_HSQP", "1754718376720_gvZK"]') ON CONFLICT DO NOTHING;


--
-- TOC entry 5008 (class 0 OID 590388)
-- Dependencies: 230
-- Data for Name: questions; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (1, '1754627164757_aPIX', '1753766673963_84Rr', 'fill', 'sdfgsg', 'null', '{"answers": ["sbfv"]}', '1753960965414_L2yD', '2025-08-07 21:26:04.758672', '2025-08-07 21:26:04.758672', NULL, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (2, '1754650184927_9nOg', '1753766673964_fNdx', 'tf', 'sdfgsd', 'null', '{"selected": false}', '1753785501716_cgnc', '2025-08-08 03:49:45.058143', '2025-08-08 03:49:45.058143', NULL, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (3, '1754650834616_qlMy', '1754650748142_OGtE', 'mcq', 'vfgesfgsfg', '[{"text": "sf", "label": "A"}, {"text": "sdf", "label": "B"}, {"text": "sdfg", "label": "C"}, {"text": "sdfg", "label": "D"}]', '{"selected": "A"}', '1753785501716_cgnc', '2025-08-08 04:00:34.646624', '2025-08-08 04:00:34.646624', NULL, NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (4, '1754714642230_3qjb', '1753766673964_HuQ6', 'tf', 'mknjbhvg', 'null', '{"selected": false}', '1753785501716_cgnc', '2025-08-09 10:14:02.3038', '2025-08-09 10:14:02.3038', NULL, '1753766673945_n2nx', '1753766673964_I3oh') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (5, '1754718350561_8oTo', '1753766673964_fNdx', 'fill', 'WHAT is you -------', 'null', '{"answers": ["abhishek"]}', '1753785501716_cgnc', '2025-08-09 11:15:52.715762', '2025-08-09 11:15:52.715762', NULL, '1753766673945_n2nx', '1753766673964_I3oh') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (6, '1754718376720_gvZK', '1753766673964_fNdx', 'short', 'how are you', 'null', '{"answers": ["i am fine"]}', '1753785501716_cgnc', '2025-08-09 11:16:16.872823', '2025-08-09 11:16:16.872823', NULL, '1753766673945_n2nx', '1753766673964_I3oh') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (7, '1754718423092_X4pf', '1753766673964_fNdx', 'mcq', 'what is this', '[{"text": "computer", "label": "A"}, {"text": "screen", "label": "B"}, {"text": "mobile", "label": "C"}, {"text": "pen", "label": "D"}]', '{"selected": "B"}', '1753785501716_cgnc', '2025-08-09 11:17:05.255961', '2025-08-09 11:17:05.255961', NULL, '1753766673945_n2nx', '1753766673964_I3oh') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (8, '1754718453947_vKsS', '1753766673964_fNdx', 'tf', 'are c*', 'null', '{"selected": false}', '1753785501716_cgnc', '2025-08-09 11:17:34.109766', '2025-08-09 11:17:34.109766', NULL, '1753766673945_n2nx', '1753766673964_I3oh') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (9, '1754803933426_cd8Q', '1753766673964_fNdx', 'mcq', 'hello what is your name', '[{"text": "abhi", "label": "A"}, {"text": "kirti", "label": "B"}, {"text": "cv", "label": "C"}, {"text": "lips", "label": "D"}]', '{"selected": "A"}', '1753785501716_cgnc', '2025-08-10 11:02:16.837918', '2025-08-10 11:02:16.837918', NULL, '1753766673945_n2nx', '1753766673964_I3oh') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (10, '1754803970474_aO6x', '1753766673964_fNdx', 'mcq', 'what 2+2 ', '[{"text": "9", "label": "A"}, {"text": "3", "label": "B"}, {"text": "4", "label": "C"}, {"text": "6", "label": "D"}]', '{"selected": "C"}', '1753785501716_cgnc', '2025-08-10 11:02:50.627935', '2025-08-10 11:02:50.627935', NULL, '1753766673945_n2nx', '1753766673964_I3oh') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (11, '1754810310017_HSQP', '1753766673964_fNdx', 'checkbox', 'what is 99*99', '[{"text": "100", "label": "A"}, {"text": "9999", "label": "B"}, {"text": "896572", "label": "C"}, {"text": "90", "label": "D"}]', '{"selected": ["B", "C"]}', '1753785501716_cgnc', '2025-08-10 12:48:30.08672', '2025-08-10 12:48:30.08672', NULL, '1753766673945_n2nx', '1753766673964_I3oh') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.questions (id, row_id, chapter_id, type, content, options, correct_answer, created_by, cr_on, up_on, media_file, class_id, subject_id) VALUES (12, '1754810364363_1W9o', '1753766673964_fNdx', 'checkbox', 'what is d', '[{"text": "d is 3", "label": "A"}, {"text": "d 9", "label": "B"}, {"text": "hj id d", "label": "C"}, {"text": "none", "label": "D"}]', '{"selected": ["D", "B"]}', '1753785501716_cgnc', '2025-08-10 12:49:24.439099', '2025-08-10 12:49:24.439099', NULL, '1753766673945_n2nx', '1753766673964_I3oh') ON CONFLICT DO NOTHING;


--
-- TOC entry 5010 (class 0 OID 590396)
-- Dependencies: 232
-- Data for Name: schools; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on, user_row_id) VALUES (31, '1754042775777_0Da6', 'Cambridge Public School', 'cambridge@gmail.com', '7812347890', '72G4+X7H, 7th B Rd, Children Park, Sardarpura, Jodhpur, Rajasthan 342003', true, '1753804190992_e2Pw', '1729832842723_A9f6', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', '1754042775777_pvar') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on, user_row_id) VALUES (22, '1753766673916_pY0v', 'Lucky International School', 'lucky@gmail.com', '9012458910', ' Dangiyawas Bypass, Sector 8, Kudi Bhagtasni Housing Board, Vivek Vihar Yojana, Jodhpur, Rajasthan 342013', true, '1753761924828_98jA', '1729832842723_A9f6', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', '1753766673916_v9gE') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.schools (id, row_id, name, email, phone, address, is_active, board_id, created_by, cr_on, up_on, user_row_id) VALUES (30, '1754042723385_ngYv', 'Adarsh Children Academy', 'adarsg@gmail.com', '9045871280', ' 7XHG+RH2, Kamla Nehru Nagar, 2nd Extension, Chopasani Rd, Jyoti Nagar, Kamla Nehru Nagar, 1st Pulia, Jodhpur, Rajasthan 342001', true, '1753804190992_aQvL', '1729832842723_A9f6', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', '1754042723385_iI8d') ON CONFLICT DO NOTHING;


--
-- TOC entry 5012 (class 0 OID 590405)
-- Dependencies: 234
-- Data for Name: students; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (1, '1753346676827_uIrJ', 'abhishek', 'abhi@gmail.com', '9012345678', '1234', '1753333918208_UpqP', '1753333918205_mAXT', '2025-07-24 01:44:36.828136', '2025-07-24 01:44:36.828136', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (2, '1753347177225_ozfo', 'harsh', 'harsh@gmail.com', '781234567890', '1234', '1753333918208_UpqP', '1753333918205_mAXT', '2025-07-24 01:52:57.226308', '2025-07-24 01:52:57.226308', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (3, '1753347344166_tg1x', 'kundan', 'kundan@gmail.com', '8712367892', '1234', '1753333918208_UpqP', '1753333918205_mAXT', '2025-07-24 01:55:44.167137', '2025-07-24 01:55:44.167137', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (4, '1753443105112_r4Oj', 'qwe', 'qwe@gmail.com', '674567456', '123', '1753333918217_vLNA', '1753333918205_mAXT', '2025-07-25 04:31:45.115638', '2025-07-25 04:31:45.115638', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (5, '1753957002395_yuAi', 'test1', 'test1@gmail.com', '901234589', '1234', '1753766673932_85sJ', '1753766673916_pY0v', '2025-07-31 03:16:42.396737', '2025-07-31 03:16:42.396737', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (6, '1753959426590_EhdH', 'test90', 'test90@gmail.com', '8912345635', '1234', '1753766673918_9SA7', '1753766673916_pY0v', '2025-07-31 03:57:06.591262', '2025-07-31 03:57:06.591262', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (7, '1753959522569_8G2N', 'test91', 'test91@gmail.com', '891234634', '1234', '1753766673945_n2nx', '1753766673916_pY0v', '2025-07-31 03:58:42.569389', '2025-07-31 03:58:42.569389', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (8, '1753959582034_orpk', 'test92', 'test92@gmail.com', '892345789', '1234', '1753766673945_n2nx', '1753766673916_pY0v', '2025-07-31 03:59:42.034405', '2025-07-31 03:59:42.034405', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (9, '1753959674386_GFlW', 'test93', 'test93@gmail.com', '9012345892', '1234', '1753766673980_KdOe', '1753766673916_pY0v', '2025-07-31 04:01:14.387505', '2025-07-31 04:01:14.387505', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (10, '1753959717716_x8to', 'test94', 'test94@gmail.com', '903463453', '1234', '1753766673971_aMzO', '1753766673916_pY0v', '2025-07-31 04:01:57.717316', '2025-07-31 04:01:57.717316', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (11, '1753960134191_Xnyc', 'test78', 'test78@gmail.com', '5678', '1234', '1753781477854_5wM2', '1753766673916_pY0v', '2025-07-31 04:08:54.191969', '2025-07-31 04:08:54.191969', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (12, '1753962444685_EWpe', 'harsh', 'harsh1@gmail.com', '890453', '1234', '1753778505418_EWRE', '1753778505409_9tBh', '2025-07-31 04:47:24.686213', '2025-07-31 04:47:24.686213', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (13, '1754034979139_EkV5', 'himansu', 'himansu@gmail.com', '0012345678', '1234', '1753781477854_5wM2', '1753766673916_pY0v', '2025-08-01 00:56:19.140554', '2025-08-01 00:56:19.140554', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (14, '1754035245741_D32q', 'lokendra', 'lokendra@gamli.com', '6789', '1234', '1753766673975_EZNi', '1753766673916_pY0v', '2025-08-01 01:00:45.742643', '2025-08-01 01:00:45.742643', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (15, '1754043651285_npX5', 'jay', 'jay123@gmail.com', '7812378912', '1234', '1754042723547_48z5', '1754042723385_ngYv', '2025-08-01 03:20:51.285802', '2025-08-01 03:20:51.285802', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (16, '1754044006521_khzC', 'test1552', 'test1552@gmail.com', '890123782', '1234', '1754042723477_5t2T', '1754042723385_ngYv', '2025-08-01 03:26:46.521809', '2025-08-01 03:26:46.521809', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (17, '1754395427657_qB06', 'gtg', 'dyg', 'ghu', 'gyb', '1754042775780_eoEH', '1754042775777_0Da6', '2025-08-05 05:03:47.663851', '2025-08-05 05:03:47.663851', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (18, '1754395731195_dvZf', 'riya', 'rt', 'dt', '1234567098', '1754042775780_eoEH', '1754042775777_0Da6', '2025-08-05 05:08:51.200686', '2025-08-05 05:08:51.200686', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (23, '1754463793921_880d', 'test1', 'test100@gmail.com', '6789126421', '1234', '1754042775787_NKQ3', '1754042775777_0Da6', '2025-08-06 00:03:13.930319', '2025-08-06 00:03:13.930319', '1754463793921_4VLN') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (22, '1754460652622_agMN', 'abhi', 'abhi12_@gmail.com', '6070809050', '1234', '1754042775808_lZcM', '1754042775777_0Da6', '2025-08-05 23:10:52.623008', '2025-08-05 23:10:52.623008', '1754460652622_2giC') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (19, '1754457341376_xPus', 'xyz1', 'xyz1@gmail.com', '7812346789', '1234', '1753766673937_60N7', '1753766673916_pY0v', '2025-08-05 22:15:41.378085', '2025-08-05 22:15:41.378085', '1754457341376_xwrp') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (24, '1754551900466_3rwP', 'test200', 'test200@gmail.com', '78901243245', '1234', '1753766673945_n2nx', '1753766673916_pY0v', '2025-08-07 00:31:40.467228', '2025-08-07 00:31:40.467228', '1754551900466_DT40') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (25, '1754553086663_dRvx', 'test201', 'test201@gmail.com', '8923452345', '1234', '1754042775820_eYhV', '1754042775777_0Da6', '2025-08-07 00:51:26.664672', '2025-08-07 00:51:26.664672', '1754553086663_BdvM') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.students (id, row_id, name, email, phone, password, class_id, school_id, cr_on, up_on, user_row_id) VALUES (26, '1754566526757_YheU', 'test1704', 'test1704_@gmail.com', '9080706050', '9876', '1754042775835_QJpF', '1754042775777_0Da6', '2025-08-07 04:35:26.757679', '2025-08-07 04:35:26.757679', '1754566526757_j7R3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5014 (class 0 OID 590413)
-- Dependencies: 236
-- Data for Name: subjects; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (128, '1753766673919_sclK', '1753766673918_9SA7', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (129, '1753766673921_p4kF', '1753766673918_9SA7', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (131, '1753766673923_3eCN', '1753766673918_9SA7', '1753766673916_pY0v', 'EVS', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (133, '1753766673925_BuwM', '1753766673923_Y0Xc', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (135, '1753766673926_SGSk', '1753766673926_oXc2', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (136, '1753766673927_AuSC', '1753766673926_oXc2', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (138, '1753766673927_j5zI', '1753766673926_oXc2', '1753766673916_pY0v', 'EVS', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (139, '1753766673928_zZ1k', '1753766673928_9vnG', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (140, '1753766673929_bd7o', '1753766673928_9vnG', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (141, '1753766673929_osRT', '1753766673928_9vnG', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (142, '1753766673930_zGBF', '1753766673928_9vnG', '1753766673916_pY0v', 'EVS', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (143, '1753766673930_YBRc', '1753766673930_0R7u', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (144, '1753766673931_0Ixa', '1753766673930_0R7u', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (145, '1753766673931_fmYA', '1753766673930_0R7u', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (146, '1753766673931_rYSh', '1753766673930_0R7u', '1753766673916_pY0v', 'EVS', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (148, '1753766673933_q4Ih', '1753766673932_85sJ', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (149, '1753766673933_mCCI', '1753766673932_85sJ', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (150, '1753766673933_cn71', '1753766673932_85sJ', '1753766673916_pY0v', 'Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (151, '1753766673934_XUOc', '1753766673932_85sJ', '1753766673916_pY0v', 'Social Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (152, '1753766673935_dSyS', '1753766673934_IbU5', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (153, '1753766673935_HrpV', '1753766673934_IbU5', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (154, '1753766673936_6eR7', '1753766673934_IbU5', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (155, '1753766673936_twnu', '1753766673934_IbU5', '1753766673916_pY0v', 'Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (156, '1753766673937_Qtry', '1753766673934_IbU5', '1753766673916_pY0v', ' Social Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (157, '1753766673938_Oyv7', '1753766673937_60N7', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (158, '1753766673939_opAy', '1753766673937_60N7', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (159, '1753766673939_z2zM', '1753766673937_60N7', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (160, '1753766673940_ufRi', '1753766673937_60N7', '1753766673916_pY0v', 'Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (161, '1753766673941_Ctwx', '1753766673937_60N7', '1753766673916_pY0v', 'Social Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (162, '1753766673942_IxWY', '1753766673942_Wrmq', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (163, '1753766673943_WdLf', '1753766673942_Wrmq', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (164, '1753766673943_jqxI', '1753766673942_Wrmq', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (165, '1753766673943_A9D6', '1753766673942_Wrmq', '1753766673916_pY0v', 'Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (166, '1753766673944_FflT', '1753766673942_Wrmq', '1753766673916_pY0v', 'Social Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (167, '1753766673944_6zyv', '1753766673942_Wrmq', '1753766673916_pY0v', 'Sanskrit', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (168, '1753766673945_LGat', '1753766673945_n2nx', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (169, '1753766673959_Fnb2', '1753766673945_n2nx', '1753766673916_pY0v', 'Hindi', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (170, '1753766673960_rsdN', '1753766673945_n2nx', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (173, '1753766673964_LglO', '1753766673945_n2nx', '1753766673916_pY0v', 'Sanskrit', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (174, '1753766673965_SCmB', '1753766673965_yhbT', '1753766673916_pY0v', 'Physics', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (175, '1753766673966_JDCI', '1753766673965_yhbT', '1753766673916_pY0v', 'Chemistry', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (176, '1753766673966_0pRK', '1753766673965_yhbT', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (177, '1753766673967_SI0e', '1753766673965_yhbT', '1753766673916_pY0v', 'Biology', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (178, '1753766673967_u5T0', '1753766673965_yhbT', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (179, '1753766673968_g4uj', '1753766673967_59lZ', '1753766673916_pY0v', 'Physics', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (180, '1753766673968_2YRe', '1753766673967_59lZ', '1753766673916_pY0v', 'Physics', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (181, '1753766673968_oV6Z', '1753766673967_59lZ', '1753766673916_pY0v', 'Chemistry', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (182, '1753766673969_9U3F', '1753766673967_59lZ', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (183, '1753766673970_7dXm', '1753766673967_59lZ', '1753766673916_pY0v', 'Biology', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (184, '1753766673970_xqa9', '1753766673967_59lZ', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (185, '1753766673972_wsNk', '1753766673971_aMzO', '1753766673916_pY0v', 'Accountancy', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (186, '1753766673973_EG88', '1753766673971_aMzO', '1753766673916_pY0v', 'Economics', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (187, '1753766673973_MwJ6', '1753766673971_aMzO', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (188, '1753766673974_k8FU', '1753766673971_aMzO', '1753766673916_pY0v', ' Business Studies', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (189, '1753766673975_nSdr', '1753766673975_EZNi', '1753766673916_pY0v', 'Accountancy', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (190, '1753766673976_7Uu0', '1753766673975_EZNi', '1753766673916_pY0v', ' Business Studies', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (191, '1753766673976_kCQ1', '1753766673975_EZNi', '1753766673916_pY0v', 'Economics', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (192, '1753766673977_9U1F', '1753766673975_EZNi', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (193, '1753766673977_3c8D', '1753766673977_aTwB', '1753766673916_pY0v', 'History', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (194, '1753766673978_xohc', '1753766673977_aTwB', '1753766673916_pY0v', 'Geography', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (195, '1753766673978_KXfK', '1753766673977_aTwB', '1753766673916_pY0v', 'Political Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (196, '1753766673979_rhfJ', '1753766673977_aTwB', '1753766673916_pY0v', 'Economics', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (134, '1753766673925_qoK0', '1753766673923_Y0Xc', '1753766673916_pY0v', 'EVS', '', '2025-07-28 22:24:33.916813', '2025-08-04 00:27:35.963373', '1753960965414_L2yD') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (137, '1753766673927_fklV', '1753766673926_oXc2', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-08-04 00:50:13.978218', '1753960965414_L2yD') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (171, '1753766673962_uX2x', '1753766673945_n2nx', '1753766673916_pY0v', 'Science', '', '2025-07-28 22:24:33.916813', '2025-08-04 01:01:10.582522', '1753960965414_L2yD') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (172, '1753766673964_I3oh', '1753766673945_n2nx', '1753766673916_pY0v', ' Social Science', '', '2025-07-28 22:24:33.916813', '2025-08-05 22:25:44.403997', '1753785501716_cgnc') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (147, '1753766673932_DUqW', '1753766673932_85sJ', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-08-05 22:22:40.982149', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (197, '1753766673979_uEfJ', '1753766673977_aTwB', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (198, '1753766673980_cQfy', '1753766673980_KdOe', '1753766673916_pY0v', 'History', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (199, '1753766673981_fsyB', '1753766673980_KdOe', '1753766673916_pY0v', 'Geography', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (200, '1753766673981_v2wD', '1753766673980_KdOe', '1753766673916_pY0v', ' Political Science', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (201, '1753766673982_L9MD', '1753766673980_KdOe', '1753766673916_pY0v', 'Economics', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (202, '1753766673982_DORb', '1753766673980_KdOe', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (364, '1754042723453_MpEC', '1754042723435_jMro', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (365, '1754042723466_Rdr6', '1754042723435_jMro', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (366, '1754042723467_J6gx', '1754042723435_jMro', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (367, '1754042723468_tu5R', '1754042723435_jMro', '1754042723385_ngYv', 'EVS', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (207, '1753781492551_iaDx', '1753781477854_5wM2', '1753766673916_pY0v', 'enjoy', NULL, '2025-07-29 02:31:32.551397', '2025-07-29 02:31:32.551397', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (208, '1753781497492_j8KL', '1753781477854_5wM2', '1753766673916_pY0v', 'hello', NULL, '2025-07-29 02:31:37.49276', '2025-07-29 02:31:37.49276', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (368, '1754042723469_wTAb', '1754042723469_j47t', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (369, '1754042723470_sSJm', '1754042723469_j47t', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (370, '1754042723470_Udg5', '1754042723469_j47t', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (371, '1754042723471_Soj0', '1754042723469_j47t', '1754042723385_ngYv', 'EVS', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (372, '1754042723472_UmgN', '1754042723471_5vPf', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (373, '1754042723473_RTGa', '1754042723471_5vPf', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (374, '1754042723473_z0te', '1754042723471_5vPf', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (375, '1754042723474_RsMQ', '1754042723471_5vPf', '1754042723385_ngYv', 'EVS', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (376, '1754042723475_Tnz8', '1754042723474_KTNY', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (377, '1754042723475_7i4U', '1754042723474_KTNY', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (378, '1754042723476_U1Yj', '1754042723474_KTNY', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (379, '1754042723476_nwCO', '1754042723474_KTNY', '1754042723385_ngYv', 'EVS', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (380, '1754042723477_DDL0', '1754042723477_5t2T', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (381, '1754042723478_n0XX', '1754042723477_5t2T', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (382, '1754042723479_wXur', '1754042723477_5t2T', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (383, '1754042723479_iMc0', '1754042723477_5t2T', '1754042723385_ngYv', 'EVS', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (384, '1754042723481_PUyE', '1754042723480_xLIp', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (385, '1754042723482_6CPS', '1754042723480_xLIp', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (386, '1754042723483_sru2', '1754042723480_xLIp', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (387, '1754042723484_P65I', '1754042723480_xLIp', '1754042723385_ngYv', 'Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (388, '1754042723502_17g4', '1754042723480_xLIp', '1754042723385_ngYv', 'Social Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (389, '1754042723503_G1HF', '1754042723480_xLIp', '1754042723385_ngYv', 'Sanskrit', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (390, '1754042723504_1Gsg', '1754042723504_9slI', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (391, '1754042723505_NQPN', '1754042723504_9slI', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (392, '1754042723505_E21U', '1754042723504_9slI', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (393, '1754042723506_PwTg', '1754042723504_9slI', '1754042723385_ngYv', 'Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (394, '1754042723508_dmpy', '1754042723504_9slI', '1754042723385_ngYv', 'Social Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (395, '1754042723508_PLK7', '1754042723504_9slI', '1754042723385_ngYv', 'Sanskrit', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (396, '1754042723509_lpWl', '1754042723509_YUFz', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (397, '1754042723510_vJHk', '1754042723509_YUFz', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (398, '1754042723510_AOvC', '1754042723509_YUFz', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (399, '1754042723511_ERDQ', '1754042723509_YUFz', '1754042723385_ngYv', 'Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (400, '1754042723515_hOxQ', '1754042723509_YUFz', '1754042723385_ngYv', 'Social Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (401, '1754042723516_uSpD', '1754042723509_YUFz', '1754042723385_ngYv', 'Sanskrit', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (402, '1754042723517_qkQG', '1754042723516_zEQp', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (403, '1754042723518_5UYj', '1754042723516_zEQp', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (404, '1754042723518_j5Uf', '1754042723516_zEQp', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (405, '1754042723519_J0QV', '1754042723516_zEQp', '1754042723385_ngYv', 'Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (406, '1754042723521_LPiV', '1754042723516_zEQp', '1754042723385_ngYv', 'Social Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (407, '1754042723521_v8b4', '1754042723516_zEQp', '1754042723385_ngYv', 'Sanskrit', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (408, '1754042723523_geOU', '1754042723522_V1pw', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (409, '1754042723523_vCcm', '1754042723522_V1pw', '1754042723385_ngYv', 'Hindi', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (410, '1754042723523_5iu8', '1754042723522_V1pw', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (411, '1754042723524_1rV8', '1754042723522_V1pw', '1754042723385_ngYv', 'Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (412, '1754042723537_FzVm', '1754042723522_V1pw', '1754042723385_ngYv', 'Social Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (413, '1754042723538_mjGV', '1754042723522_V1pw', '1754042723385_ngYv', 'Sanskrit', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (414, '1754042723539_s8mH', '1754042723538_rdQh', '1754042723385_ngYv', 'History', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (415, '1754042723540_nlyK', '1754042723538_rdQh', '1754042723385_ngYv', 'Political Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (416, '1754042723540_KlDX', '1754042723538_rdQh', '1754042723385_ngYv', 'Psychology', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (417, '1754042723541_qAsC', '1754042723538_rdQh', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (418, '1754042723541_QCde', '1754042723538_rdQh', '1754042723385_ngYv', 'Business Studies', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (419, '1754042723542_E2mz', '1754042723538_rdQh', '1754042723385_ngYv', 'Chemistry', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (420, '1754042723542_ZAbx', '1754042723538_rdQh', '1754042723385_ngYv', 'Geography', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (421, '1754042723543_qQhX', '1754042723538_rdQh', '1754042723385_ngYv', 'Sociology', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (422, '1754042723543_23Cm', '1754042723538_rdQh', '1754042723385_ngYv', 'Physics', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (423, '1754042723544_cntH', '1754042723538_rdQh', '1754042723385_ngYv', 'Computer Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (424, '1754042723544_h414', '1754042723538_rdQh', '1754042723385_ngYv', 'Economics', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (425, '1754042723545_uWJm', '1754042723538_rdQh', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (426, '1754042723545_ojk5', '1754042723538_rdQh', '1754042723385_ngYv', 'Accountancy', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (427, '1754042723546_HYxr', '1754042723538_rdQh', '1754042723385_ngYv', 'Biology', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (428, '1754042723548_hCB7', '1754042723547_48z5', '1754042723385_ngYv', 'History', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (429, '1754042723549_Mfww', '1754042723547_48z5', '1754042723385_ngYv', 'Political Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (430, '1754042723550_2wmn', '1754042723547_48z5', '1754042723385_ngYv', 'Psychology', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (431, '1754042723550_RUIA', '1754042723547_48z5', '1754042723385_ngYv', 'Maths', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (432, '1754042723551_pTEB', '1754042723547_48z5', '1754042723385_ngYv', 'Business Studies', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (433, '1754042723551_UpJk', '1754042723547_48z5', '1754042723385_ngYv', 'Chemistry', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (434, '1754042723552_asj2', '1754042723547_48z5', '1754042723385_ngYv', 'Geography', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (435, '1754042723552_y0B5', '1754042723547_48z5', '1754042723385_ngYv', 'Sociology', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (436, '1754042723553_0dih', '1754042723547_48z5', '1754042723385_ngYv', 'Physics', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (437, '1754042723553_QYy7', '1754042723547_48z5', '1754042723385_ngYv', 'Computer Science', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (438, '1754042723554_ert4', '1754042723547_48z5', '1754042723385_ngYv', 'Economics', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (439, '1754042723554_VCRt', '1754042723547_48z5', '1754042723385_ngYv', 'English', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (440, '1754042723554_387V', '1754042723547_48z5', '1754042723385_ngYv', 'Accountancy', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (441, '1754042723555_7Eo8', '1754042723547_48z5', '1754042723385_ngYv', 'Biology', '', '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (442, '1754042775781_SLSX', '1754042775780_eoEH', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (443, '1754042775782_3imW', '1754042775780_eoEH', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (444, '1754042775783_eF4t', '1754042775780_eoEH', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (445, '1754042775783_uJMs', '1754042775780_eoEH', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (446, '1754042775784_L9yL', '1754042775780_eoEH', '1754042775777_0Da6', 'EVS', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (447, '1754042775785_KzwW', '1754042775784_6jZZ', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (448, '1754042775785_SZnq', '1754042775784_6jZZ', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (449, '1754042775786_u7u0', '1754042775784_6jZZ', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (450, '1754042775786_76w6', '1754042775784_6jZZ', '1754042775777_0Da6', 'EVS', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (451, '1754042775787_K4ge', '1754042775787_NKQ3', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (452, '1754042775788_dVhG', '1754042775787_NKQ3', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (453, '1754042775788_D538', '1754042775787_NKQ3', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (454, '1754042775789_B12v', '1754042775787_NKQ3', '1754042775777_0Da6', 'EVS', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (455, '1754042775790_sDLM', '1754042775789_dbAj', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (456, '1754042775790_cYTZ', '1754042775789_dbAj', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (457, '1754042775791_Af5h', '1754042775789_dbAj', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (458, '1754042775791_ne0p', '1754042775789_dbAj', '1754042775777_0Da6', 'EVS', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (459, '1754042775792_Yz5G', '1754042775792_5NWx', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (460, '1754042775793_cFKN', '1754042775792_5NWx', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (461, '1754042775794_5u7Y', '1754042775792_5NWx', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (462, '1754042775795_iMlI', '1754042775792_5NWx', '1754042775777_0Da6', 'EVS', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (463, '1754042775796_mFvi', '1754042775795_UtI5', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (464, '1754042775797_MBs4', '1754042775795_UtI5', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (465, '1754042775798_ykCL', '1754042775795_UtI5', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (466, '1754042775799_vEU5', '1754042775795_UtI5', '1754042775777_0Da6', 'Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (467, '1754042775802_FIYG', '1754042775795_UtI5', '1754042775777_0Da6', 'Social Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (468, '1754042775803_V3Pi', '1754042775795_UtI5', '1754042775777_0Da6', 'Sanskrit', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (469, '1754042775804_p66F', '1754042775803_45rS', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (470, '1754042775804_YTGl', '1754042775803_45rS', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (471, '1754042775805_ANBP', '1754042775803_45rS', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (472, '1754042775805_7j5P', '1754042775803_45rS', '1754042775777_0Da6', 'Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (473, '1754042775807_yRlN', '1754042775803_45rS', '1754042775777_0Da6', 'Social Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (474, '1754042775808_RMP4', '1754042775803_45rS', '1754042775777_0Da6', 'Sanskrit', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (475, '1754042775809_j0eU', '1754042775808_lZcM', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (476, '1754042775810_KGu7', '1754042775808_lZcM', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (477, '1754042775810_oEri', '1754042775808_lZcM', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (478, '1754042775811_RGaw', '1754042775808_lZcM', '1754042775777_0Da6', 'Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (479, '1754042775814_LKoC', '1754042775808_lZcM', '1754042775777_0Da6', 'Social Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (480, '1754042775814_67n0', '1754042775808_lZcM', '1754042775777_0Da6', 'Sanskrit', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (481, '1754042775815_OPP5', '1754042775815_Yhgx', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (482, '1754042775816_Dafm', '1754042775815_Yhgx', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (483, '1754042775816_Ct0O', '1754042775815_Yhgx', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (484, '1754042775817_a3kZ', '1754042775815_Yhgx', '1754042775777_0Da6', 'Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (485, '1754042775819_JNF0', '1754042775815_Yhgx', '1754042775777_0Da6', 'Social Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (486, '1754042775819_P3gb', '1754042775815_Yhgx', '1754042775777_0Da6', 'Sanskrit', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (487, '1754042775820_mUeb', '1754042775820_eYhV', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (488, '1754042775821_gcCE', '1754042775820_eYhV', '1754042775777_0Da6', 'Hindi', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (489, '1754042775821_APwy', '1754042775820_eYhV', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (491, '1754042775824_M2PN', '1754042775820_eYhV', '1754042775777_0Da6', 'Social Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (492, '1754042775825_v0vX', '1754042775820_eYhV', '1754042775777_0Da6', 'Sanskrit', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (493, '1754042775826_Kspt', '1754042775826_OZRp', '1754042775777_0Da6', 'History', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (494, '1754042775827_j2NA', '1754042775826_OZRp', '1754042775777_0Da6', 'Political Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (495, '1754042775828_hBi7', '1754042775826_OZRp', '1754042775777_0Da6', 'Psychology', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (496, '1754042775829_t3FM', '1754042775826_OZRp', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (497, '1754042775830_Ghyk', '1754042775826_OZRp', '1754042775777_0Da6', 'Business Studies', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (498, '1754042775830_KPw8', '1754042775826_OZRp', '1754042775777_0Da6', 'Chemistry', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (499, '1754042775831_vdwV', '1754042775826_OZRp', '1754042775777_0Da6', 'Geography', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (500, '1754042775831_NZV6', '1754042775826_OZRp', '1754042775777_0Da6', 'Sociology', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (501, '1754042775832_VAsk', '1754042775826_OZRp', '1754042775777_0Da6', 'Physics', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (502, '1754042775832_JJUt', '1754042775826_OZRp', '1754042775777_0Da6', 'Computer Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (503, '1754042775833_Tj65', '1754042775826_OZRp', '1754042775777_0Da6', 'Economics', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (504, '1754042775833_Eaub', '1754042775826_OZRp', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (505, '1754042775834_wOAS', '1754042775826_OZRp', '1754042775777_0Da6', 'Accountancy', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (506, '1754042775834_SKyd', '1754042775826_OZRp', '1754042775777_0Da6', 'Biology', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (507, '1754042775836_Wus1', '1754042775835_QJpF', '1754042775777_0Da6', 'History', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (508, '1754042775836_Fhta', '1754042775835_QJpF', '1754042775777_0Da6', 'Political Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (509, '1754042775837_lWrl', '1754042775835_QJpF', '1754042775777_0Da6', 'Psychology', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (510, '1754042775837_44MC', '1754042775835_QJpF', '1754042775777_0Da6', 'Maths', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (511, '1754042775838_X8tT', '1754042775835_QJpF', '1754042775777_0Da6', 'Business Studies', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (512, '1754042775838_aTSp', '1754042775835_QJpF', '1754042775777_0Da6', 'Chemistry', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (513, '1754042775839_jA5G', '1754042775835_QJpF', '1754042775777_0Da6', 'Geography', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (514, '1754042775839_ocWQ', '1754042775835_QJpF', '1754042775777_0Da6', 'Sociology', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (515, '1754042775840_9KZh', '1754042775835_QJpF', '1754042775777_0Da6', 'Physics', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (516, '1754042775840_O3gR', '1754042775835_QJpF', '1754042775777_0Da6', 'Computer Science', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (517, '1754042775841_Ewdn', '1754042775835_QJpF', '1754042775777_0Da6', 'Economics', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (518, '1754042775841_zRvw', '1754042775835_QJpF', '1754042775777_0Da6', 'English', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (519, '1754042775842_pEOe', '1754042775835_QJpF', '1754042775777_0Da6', 'Accountancy', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (520, '1754042775842_BvCp', '1754042775835_QJpF', '1754042775777_0Da6', 'Biology', '', '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (521, '1754043479595_Hxco', '1754043461139_JyB0', '1754042723385_ngYv', 'subject_test_1', NULL, '2025-08-01 03:17:59.596307', '2025-08-01 03:18:07.635418', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (130, '1753766673922_q2ZY', '1753766673918_9SA7', '1753766673916_pY0v', 'Maths', '', '2025-07-28 22:24:33.916813', '2025-08-05 21:36:46.677684', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (132, '1753766673924_ZNuQ', '1753766673923_Y0Xc', '1753766673916_pY0v', 'English', '', '2025-07-28 22:24:33.916813', '2025-08-05 21:42:11.211151', '1753960965414_L2yD') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (490, '1754042775822_IPCd', '1754042775820_eYhV', '1754042775777_0Da6', 'Science', '', '2025-08-01 03:06:15.790871', '2025-08-07 00:43:22.473676', '1754552518485_8Uy3') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.subjects (id, row_id, class_id, school_id, name, description, cr_on, up_on, teacher_id) VALUES (522, '1754650370800_SiNF', '1753766673932_85sJ', '1753766673916_pY0v', 'test1', NULL, '2025-08-08 03:52:50.801229', '2025-08-08 04:00:11.48782', '1753785501716_cgnc') ON CONFLICT DO NOTHING;


--
-- TOC entry 5016 (class 0 OID 590421)
-- Dependencies: 238
-- Data for Name: super_admin; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.super_admin (id, row_id, name, email, password, user_type, cr_on, up_on) VALUES (1, '1729832842723_A9f6', 'Fintech', 'fintech@admin.com', '1234', 1, '2025-07-21 20:43:35.971272', '2025-07-21 20:43:35.971272') ON CONFLICT DO NOTHING;


--
-- TOC entry 5018 (class 0 OID 590429)
-- Dependencies: 240
-- Data for Name: teachers; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (1, '1753442597366_xwA7', 'hj', 'hj@gfsfdg', '52345234', '2344', 'sdfg', '1753333918205_mAXT', 3, '2025-07-25 04:23:17.366647', '2025-07-25 04:23:17.366647', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (2, '1753691689744_h9gk', 'deepak', 'deepak@gmail.com', '9045781234', '1234', 'MCA ', '1753333918205_mAXT', 3, '2025-07-28 01:34:49.744892', '2025-07-28 01:34:49.744892', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (6, '1753699663783_BAJo', 'testTeacher1', 'test12@gmail.com', '561238904', '1234', 'bca', '1753333918205_mAXT', 2, '2025-07-28 03:47:43.79531', '2025-07-28 03:47:43.79531', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (7, '1753699787677_7qEq', 'test56', 'test56@gmail.com', '9012344442', '1234', 'bca', '1753333918205_mAXT', 3, '2025-07-28 03:49:47.677433', '2025-07-28 03:49:47.677433', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (8, '1753699910050_sfiz', 'test57', 'test57@gmail.com', '89123456', '1234', 'bca', '1753333918205_mAXT', 2, '2025-07-28 03:51:50.0512', '2025-07-28 03:51:50.0512', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (9, '1753700666050_ad5B', 'test58', 'test58@gmail.com', '90123445', '1234', 'mca', '1753333918205_mAXT', 2, '2025-07-28 04:04:26.051839', '2025-07-28 04:04:26.051839', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (10, '1753702167702_hg5j', 'test59', 'test59@gmail.com', '8912345781', '1234', 'bca', '1753333918205_mAXT', 3, '2025-07-28 04:29:27.7025', '2025-07-28 04:29:27.7025', NULL) ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (11, '1753703146073_uQOt', 'test601', 'test60@gmail.com', '7890123456', '1234', 'bca', '1753333918205_mAXT', NULL, '2025-07-28 04:45:46.074393', '2025-07-28 04:50:16.040564', '1753703146073_qdjf') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (12, '1753703475972_j9C4', 'test604', 'test604@gmail.com', '891234567', '1234', 'bca', '1753333918205_mAXT', 4, '2025-07-28 04:51:15.973184', '2025-07-28 04:57:20.142425', '1753703475972_qqxF') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (13, '1753704161226_qGiN', 'test701', 'test70@gmail.com', '191234567', '1234', 'nm', '1753333918205_mAXT', 2, '2025-07-28 05:02:41.22744', '2025-07-28 05:03:07.419075', '1753704161226_9dSb') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (14, '1753785501716_rlEJ', 'teacher_test1', 'teacher_test2@gmail.com', '9012353545', '1234', 'mca', '1753766673916_pY0v', 3, '2025-07-29 03:38:21.717065', '2025-07-29 03:38:21.717065', '1753785501716_cgnc') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (15, '1753960965414_GPix', 'test_1', 'test_1@gmail.com', '78912345234', '1234', 'mca', '1753766673916_pY0v', 4, '2025-07-31 04:22:45.414587', '2025-07-31 04:22:45.414587', '1753960965414_L2yD') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (16, '1754043564909_bhgE', 'surab', 'surab@gmail.com', '903477234', '1234', 'mca', '1754042723385_ngYv', 4, '2025-08-01 03:19:24.909827', '2025-08-01 03:19:24.909827', '1754043564909_Qv4B') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (17, '1754043609537_VR42', 'deepak', 'deepak1@gmail.com', '8912367892', '1234', 'bca', '1754042723385_ngYv', 3, '2025-08-01 03:20:09.537794', '2025-08-01 03:20:09.537794', '1754043609537_RiME') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (18, '1754552518485_oLph', 'ankit', 'ankit@gmail.com', '67163456234', '1234', 'bca', '1754042775777_0Da6', 2, '2025-08-07 00:41:58.486397', '2025-08-07 00:41:58.486397', '1754552518485_8Uy3') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.teachers (id, row_id, name, email, phone, password, qualification, school_id, experience_years, cr_on, up_on, user_row_id) VALUES (19, '1754552554284_qviJ', 'rahul123', 'rahul12@gmail.com', '4656212345', '1234', 'mca', '1754042775777_0Da6', 3, '2025-08-07 00:42:34.285378', '2025-08-07 00:42:34.285378', '1754552554284_7uYr') ON CONFLICT DO NOTHING;


--
-- TOC entry 5020 (class 0 OID 590437)
-- Dependencies: 242
-- Data for Name: users; Type: TABLE DATA; Schema: school_schema; Owner: postgres
--

INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (51, '1753959582034_4xHZ', '1753766673916_pY0v', 'test92', 'test92@gmail.com', '1234', 4, true, '2025-07-31 03:59:42.034405', '2025-07-31 03:59:42.034405') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (52, '1753959674386_szJk', '1753766673916_pY0v', 'test93', 'test93@gmail.com', '1234', 4, true, '2025-07-31 04:01:14.387505', '2025-07-31 04:01:14.387505') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (53, '1753959717716_VAbp', '1753766673916_pY0v', 'test94', 'test94@gmail.com', '1234', 4, true, '2025-07-31 04:01:57.717316', '2025-07-31 04:01:57.717316') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (54, '1753960134191_k4Wo', '1753766673916_pY0v', 'test78', 'test78@gmail.com', '1234', 4, true, '2025-07-31 04:08:54.191969', '2025-07-31 04:08:54.191969') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (55, '1753960965414_L2yD', '1753766673916_pY0v', 'test_1', 'test_1@gmail.com', '1234', 3, true, '2025-07-31 04:22:45.414587', '2025-07-31 04:22:45.414587') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (57, '1754034979139_aMJ7', '1753766673916_pY0v', 'himansu', 'himansu@gmail.com', '1234', 4, true, '2025-08-01 00:56:19.140554', '2025-08-01 00:56:19.140554') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (58, '1754035245741_b9WQ', '1753766673916_pY0v', 'lokendra', 'lokendra@gamli.com', '1234', 4, true, '2025-08-01 01:00:45.742643', '2025-08-01 01:00:45.742643') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (39, '1753766673916_v9gE', '1753766673916_pY0v', 'Lucky International School', 'lucky@gmail.com', '1234', 2, true, '2025-07-28 22:24:33.916813', '2025-07-28 22:24:33.916813') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (44, '1753785501716_cgnc', '1753766673916_pY0v', 'teacher_test1', 'teacher_test2@gmail.com', '1234', 3, true, '2025-07-29 03:38:21.717065', '2025-07-29 03:38:21.717065') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (48, '1753957002395_6lmy', '1753766673916_pY0v', 'test1', 'test1@gmail.com', '1234', 4, true, '2025-07-31 03:16:42.396737', '2025-07-31 03:16:42.396737') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (49, '1753959426590_PFIX', '1753766673916_pY0v', 'test90', 'test90@gmail.com', '1234', 4, true, '2025-07-31 03:57:06.591262', '2025-07-31 03:57:06.591262') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (50, '1753959522569_xVtL', '1753766673916_pY0v', 'test91', 'test91@gmail.com', '1234', 4, true, '2025-07-31 03:58:42.569389', '2025-07-31 03:58:42.569389') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (59, '1754042723385_iI8d', '1754042723385_ngYv', 'Adarsh Children Academy', 'adarsg@gmail.com', '1234', 2, true, '2025-08-01 03:05:23.399578', '2025-08-01 03:05:23.399578') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (60, '1754042775777_pvar', '1754042775777_0Da6', 'Cambridge Public School', 'cambridge@gmail.com', '1234', 2, true, '2025-08-01 03:06:15.790871', '2025-08-01 03:06:15.790871') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (61, '1754043564909_Qv4B', '1754042723385_ngYv', 'surab', 'surab@gmail.com', '1234', 3, true, '2025-08-01 03:19:24.909827', '2025-08-01 03:19:24.909827') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (62, '1754043609537_RiME', '1754042723385_ngYv', 'deepak', 'deepak1@gmail.com', '1234', 3, true, '2025-08-01 03:20:09.537794', '2025-08-01 03:20:09.537794') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (63, '1754043651285_tGAQ', '1754042723385_ngYv', 'jay', 'jay123@gmail.com', '1234', 4, true, '2025-08-01 03:20:51.285802', '2025-08-01 03:20:51.285802') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (64, '1754044006521_RYkj', '1754042723385_ngYv', 'test1552', 'test1552@gmail.com', '1234', 4, true, '2025-08-01 03:26:46.521809', '2025-08-01 03:26:46.521809') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (65, '1754395427657_kKzq', '1754042775777_0Da6', 'gtg', 'dyg', 'gyb', 4, true, '2025-08-05 05:03:47.663851', '2025-08-05 05:03:47.663851') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (66, '1754395731195_KYh0', '1754042775777_0Da6', 'riya', 'rt', '1234567098', 4, true, '2025-08-05 05:08:51.200686', '2025-08-05 05:08:51.200686') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (67, '1754457341376_xwrp', '1753766673916_pY0v', 'xyz1', 'xyz1@gmail.com', '1234', 4, true, '2025-08-05 22:15:41.378085', '2025-08-05 22:15:41.378085') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (70, '1754460652622_2giC', '1754042775777_0Da6', 'abhi', 'abhi12_@gmail.com', '1234', 4, true, '2025-08-05 23:10:52.623008', '2025-08-05 23:10:52.623008') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (71, '1754463793921_4VLN', '1754042775777_0Da6', 'test1', 'test100@gmail.com', '1234', 4, true, '2025-08-06 00:03:13.930319', '2025-08-06 00:03:13.930319') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (72, '1754551900466_DT40', '1753766673916_pY0v', 'test200', 'test200@gmail.com', '1234', 4, true, '2025-08-07 00:31:40.467228', '2025-08-07 00:31:40.467228') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (73, '1754552518485_8Uy3', '1754042775777_0Da6', 'ankit', 'ankit@gmail.com', '1234', 3, true, '2025-08-07 00:41:58.486397', '2025-08-07 00:41:58.486397') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (74, '1754552554284_7uYr', '1754042775777_0Da6', 'rahul123', 'rahul12@gmail.com', '1234', 3, true, '2025-08-07 00:42:34.285378', '2025-08-07 00:42:34.285378') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (75, '1754553086663_BdvM', '1754042775777_0Da6', 'test201', 'test201@gmail.com', '1234', 4, true, '2025-08-07 00:51:26.664672', '2025-08-07 00:51:26.664672') ON CONFLICT DO NOTHING;
INSERT INTO school_schema.users (id, row_id, school_id, name, email, password, role, is_active, cr_on, up_on) VALUES (76, '1754566526757_j7R3', '1754042775777_0Da6', 'test1704', 'test1704_@gmail.com', '9876', 4, true, '2025-08-07 04:35:26.757679', '2025-08-07 04:35:26.757679') ON CONFLICT DO NOTHING;


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 217
-- Name: master_board_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_board_id_seq', 87, true);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 219
-- Name: master_chapters_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_chapters_id_seq', 537, true);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 221
-- Name: master_classes_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_classes_id_seq', 133, true);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 223
-- Name: master_subjects_id_seq; Type: SEQUENCE SET; Schema: master_schema; Owner: postgres
--

SELECT pg_catalog.setval('master_schema.master_subjects_id_seq', 566, true);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 225
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.chapters_id_seq', 375, true);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 227
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.class_id_seq', 191, true);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 244
-- Name: exam_submissions_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.exam_submissions_id_seq', 14, true);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 229
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.exams_id_seq', 20, true);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 231
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.questions_id_seq', 12, true);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 233
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.schools_id_seq', 31, true);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 235
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.students_id_seq', 26, true);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 237
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.subjects_id_seq', 522, true);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 239
-- Name: super_admin_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.super_admin_id_seq', 1, true);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 241
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.teachers_id_seq', 19, true);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 243
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: school_schema; Owner: postgres
--

SELECT pg_catalog.setval('school_schema.users_id_seq', 76, true);


--
-- TOC entry 4808 (class 2606 OID 590461)
-- Name: master_board master_board_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_board
    ADD CONSTRAINT master_board_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4810 (class 2606 OID 590463)
-- Name: master_chapters master_chapters_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters
    ADD CONSTRAINT master_chapters_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4812 (class 2606 OID 590465)
-- Name: master_classes master_classes_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes
    ADD CONSTRAINT master_classes_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4814 (class 2606 OID 590467)
-- Name: master_subjects master_subjects_pkey; Type: CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects
    ADD CONSTRAINT master_subjects_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4816 (class 2606 OID 590469)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4818 (class 2606 OID 590471)
-- Name: class class_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4842 (class 2606 OID 598530)
-- Name: exam_submissions exam_submissions_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.exam_submissions
    ADD CONSTRAINT exam_submissions_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4820 (class 2606 OID 590473)
-- Name: exams exams_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4822 (class 2606 OID 590475)
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4824 (class 2606 OID 590477)
-- Name: schools schools_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools
    ADD CONSTRAINT schools_email_key UNIQUE (email);


--
-- TOC entry 4826 (class 2606 OID 590479)
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4828 (class 2606 OID 590481)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4830 (class 2606 OID 590483)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4832 (class 2606 OID 590485)
-- Name: super_admin super_admin_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin
    ADD CONSTRAINT super_admin_email_key UNIQUE (email);


--
-- TOC entry 4834 (class 2606 OID 590487)
-- Name: super_admin super_admin_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.super_admin
    ADD CONSTRAINT super_admin_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4836 (class 2606 OID 590489)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4838 (class 2606 OID 590491)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4840 (class 2606 OID 590493)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (row_id);


--
-- TOC entry 4843 (class 2606 OID 590494)
-- Name: master_chapters master_chapters_subject_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_chapters
    ADD CONSTRAINT master_chapters_subject_row_id_fkey FOREIGN KEY (subject_row_id) REFERENCES master_schema.master_subjects(row_id);


--
-- TOC entry 4844 (class 2606 OID 590499)
-- Name: master_classes master_classes_board_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_classes
    ADD CONSTRAINT master_classes_board_row_id_fkey FOREIGN KEY (board_row_id) REFERENCES master_schema.master_board(row_id);


--
-- TOC entry 4845 (class 2606 OID 590504)
-- Name: master_subjects master_subjects_class_row_id_fkey; Type: FK CONSTRAINT; Schema: master_schema; Owner: postgres
--

ALTER TABLE ONLY master_schema.master_subjects
    ADD CONSTRAINT master_subjects_class_row_id_fkey FOREIGN KEY (class_row_id) REFERENCES master_schema.master_classes(row_id);


--
-- TOC entry 4846 (class 2606 OID 590509)
-- Name: chapters chapters_subject_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.chapters
    ADD CONSTRAINT chapters_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES school_schema.subjects(row_id);


--
-- TOC entry 4847 (class 2606 OID 590514)
-- Name: class class_school_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.class
    ADD CONSTRAINT class_school_id_fkey FOREIGN KEY (school_id) REFERENCES school_schema.schools(row_id);


--
-- TOC entry 4848 (class 2606 OID 590519)
-- Name: questions questions_chapter_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.questions
    ADD CONSTRAINT questions_chapter_id_fkey FOREIGN KEY (chapter_id) REFERENCES school_schema.chapters(row_id);


--
-- TOC entry 4849 (class 2606 OID 590524)
-- Name: subjects subjects_class_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.subjects
    ADD CONSTRAINT subjects_class_id_fkey FOREIGN KEY (class_id) REFERENCES school_schema.class(row_id);


--
-- TOC entry 4850 (class 2606 OID 590529)
-- Name: users users_school_id_fkey; Type: FK CONSTRAINT; Schema: school_schema; Owner: postgres
--

ALTER TABLE ONLY school_schema.users
    ADD CONSTRAINT users_school_id_fkey FOREIGN KEY (school_id) REFERENCES school_schema.schools(row_id);


-- Completed on 2025-08-10 14:20:52

--
-- PostgreSQL database dump complete
--

