--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-12-03 04:32:53

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
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16520)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id integer NOT NULL,
    title character varying(128) DEFAULT NULL::character varying,
    instructor_id integer
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16518)
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_id_seq OWNER TO postgres;

--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 211
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


--
-- TOC entry 215 (class 1259 OID 16548)
-- Name: course_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_student (
    course_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.course_student OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16565)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    first_name character varying(45) DEFAULT NULL::character varying,
    last_name character varying(45) DEFAULT NULL::character varying,
    email character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16563)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 216
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 205 (class 1259 OID 16417)
-- Name: gnr_hrchy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gnr_hrchy (
    hrchy_code character varying(30) NOT NULL,
    hrchy_l_nm text NOT NULL,
    hrchy_f_nm text,
    hrchy_code_parnt character varying(30),
    hrchy_typ numeric(5,0),
    lvl_no smallint NOT NULL,
    inactv_flg smallint DEFAULT 0 NOT NULL,
    inactv_usr_no numeric(10,0),
    inactv_date date,
    inactv_dsc text,
    CONSTRAINT chk_inactvflg CHECK ((inactv_flg = ANY (ARRAY[0, 1]))),
    CONSTRAINT chk_lvlno CHECK (((lvl_no >= 1) AND (lvl_no <= 20)))
);


ALTER TABLE public.gnr_hrchy OWNER TO postgres;

--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE gnr_hrchy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.gnr_hrchy IS 'organizational chart - adm_inistrative structure';


--
-- TOC entry 206 (class 1259 OID 16433)
-- Name: gnr_usr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gnr_usr (
    usr_no numeric(10,0) NOT NULL,
    usr_code character varying(30) NOT NULL,
    usr_l_nm character varying(100) NOT NULL,
    usr_f_nm character varying(100),
    usr_no_mngr numeric(10,0),
    hrchy_code character varying(30) NOT NULL,
    usr_pswrd text NOT NULL,
    img_nm character varying(250),
    f_date_effct date,
    t_date_effct date,
    f_time_effct date,
    t_time_effct date,
    e_mail character varying(250),
    mobile_no character varying(30),
    inactv_flg smallint DEFAULT 0 NOT NULL,
    inactv_usr_no numeric(10,0),
    inactv_date date,
    inactv_dsc text,
    CONSTRAINT chk_inactvflg CHECK ((inactv_flg = ANY (ARRAY[0, 1]))),
    CONSTRAINT chk_usrno CHECK ((usr_no > (0)::numeric))
);


ALTER TABLE public.gnr_usr OWNER TO postgres;

--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE gnr_usr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.gnr_usr IS 'users of system';


--
-- TOC entry 210 (class 1259 OID 16503)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    id integer NOT NULL,
    first_name character varying(45) DEFAULT NULL::character varying,
    last_name character varying(45) DEFAULT NULL::character varying,
    email character varying(45) DEFAULT NULL::character varying,
    instructor_detail_id integer
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16493)
-- Name: instructor_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_detail (
    id integer NOT NULL,
    youtube_channel character varying(128) DEFAULT NULL::character varying,
    hobby character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public.instructor_detail OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16491)
-- Name: instructor_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructor_detail_id_seq OWNER TO postgres;

--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 207
-- Name: instructor_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_detail_id_seq OWNED BY public.instructor_detail.id;


--
-- TOC entry 209 (class 1259 OID 16501)
-- Name: instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructor_id_seq OWNER TO postgres;

--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 209
-- Name: instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_id_seq OWNED BY public.instructor.id;


--
-- TOC entry 214 (class 1259 OID 16536)
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    id integer NOT NULL,
    comment character varying(256) DEFAULT NULL::character varying,
    course_id integer
);


ALTER TABLE public.review OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16534)
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_id_seq OWNER TO postgres;

--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 213
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- TOC entry 203 (class 1259 OID 16395)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    first_name character varying(45) DEFAULT NULL::character varying,
    last_name character varying(45) DEFAULT NULL::character varying,
    email character varying(45) DEFAULT NULL::character varying,
    id integer NOT NULL,
    date_of_birth date
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16409)
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.student ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2748 (class 2604 OID 16523)
-- Name: course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);


--
-- TOC entry 2752 (class 2604 OID 16568)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 2744 (class 2604 OID 16506)
-- Name: instructor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor ALTER COLUMN id SET DEFAULT nextval('public.instructor_id_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 16496)
-- Name: instructor_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_detail ALTER COLUMN id SET DEFAULT nextval('public.instructor_detail_id_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 16539)
-- Name: review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- TOC entry 2769 (class 2606 OID 16526)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 16552)
-- Name: course_student course_student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_student
    ADD CONSTRAINT course_student_pkey PRIMARY KEY (course_id, student_id);


--
-- TOC entry 2771 (class 2606 OID 16528)
-- Name: course course_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_title_key UNIQUE (title);


--
-- TOC entry 2777 (class 2606 OID 16573)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 16500)
-- Name: instructor_detail instructor_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_detail
    ADD CONSTRAINT instructor_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 16511)
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 16427)
-- Name: gnr_hrchy pk_gnr_hrchy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gnr_hrchy
    ADD CONSTRAINT pk_gnr_hrchy PRIMARY KEY (hrchy_code);


--
-- TOC entry 2761 (class 2606 OID 16443)
-- Name: gnr_usr pk_gnr_usr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gnr_usr
    ADD CONSTRAINT pk_gnr_usr PRIMARY KEY (usr_no);


--
-- TOC entry 2773 (class 2606 OID 16542)
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 16412)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 16445)
-- Name: gnr_usr uq_gnr_usr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gnr_usr
    ADD CONSTRAINT uq_gnr_usr UNIQUE (usr_code);


--
-- TOC entry 2783 (class 2606 OID 16543)
-- Name: review fk_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- TOC entry 2784 (class 2606 OID 16553)
-- Name: course_student fk_course_05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_student
    ADD CONSTRAINT fk_course_05 FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- TOC entry 2781 (class 2606 OID 16512)
-- Name: instructor fk_detail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT fk_detail FOREIGN KEY (instructor_detail_id) REFERENCES public.instructor_detail(id);


--
-- TOC entry 2779 (class 2606 OID 16446)
-- Name: gnr_usr fk_hrchycode_gnr_usr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gnr_usr
    ADD CONSTRAINT fk_hrchycode_gnr_usr FOREIGN KEY (hrchy_code) REFERENCES public.gnr_hrchy(hrchy_code);


--
-- TOC entry 2778 (class 2606 OID 16428)
-- Name: gnr_hrchy fk_hrchycodeparnt_gnr_hrchy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gnr_hrchy
    ADD CONSTRAINT fk_hrchycodeparnt_gnr_hrchy FOREIGN KEY (hrchy_code_parnt) REFERENCES public.gnr_hrchy(hrchy_code);


--
-- TOC entry 2782 (class 2606 OID 16529)
-- Name: course fk_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- TOC entry 2785 (class 2606 OID 16558)
-- Name: course_student fk_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_student
    ADD CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- TOC entry 2780 (class 2606 OID 16451)
-- Name: gnr_usr fk_usrnomngr_gnr_usr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gnr_usr
    ADD CONSTRAINT fk_usrnomngr_gnr_usr FOREIGN KEY (usr_no_mngr) REFERENCES public.gnr_usr(usr_no);


-- Completed on 2020-12-03 04:32:56

--
-- PostgreSQL database dump complete
--

