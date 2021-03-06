toc.dat                                                                                             0000600 0004000 0002000 00000036173 14240727055 0014457 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           z            imtihon    14.2    14.2 5    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         /           1262    17257    imtihon    DATABASE     d   CREATE DATABASE imtihon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE imtihon;
                postgres    false         ?            1255    17349    uppdate_menu_ingdrents()    FUNCTION     !  CREATE FUNCTION public.uppdate_menu_ingdrents() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
product_title varchar(100) := ' ';
ingdrents_title varchar(100) := ' ';


begin

select title into product_title from menu where menu_id = new.menu_id;
select title into ingdrents_title from ingdrents where in_id = new.ingdrents_id;

insert into log(product_id, product_title, ingdrent_id, ingdrent_title, old_size, new_size) values
(new.menu_id, product_title, new.ingdrents_id, ingdrents_title, old.size, new.size);  

return new;
end;
$$;
 /   DROP FUNCTION public.uppdate_menu_ingdrents();
       public          postgres    false         ?            1259    17272    filials    TABLE     c   CREATE TABLE public.filials (
    filials_id integer NOT NULL,
    name character(100) NOT NULL
);
    DROP TABLE public.filials;
       public         heap    postgres    false         ?            1259    17271    filials_filials_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.filials_filials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.filials_filials_id_seq;
       public          postgres    false    210         0           0    0    filials_filials_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.filials_filials_id_seq OWNED BY public.filials.filials_id;
          public          postgres    false    209         ?            1259    17295    menu_ingdrents    TABLE     ?   CREATE TABLE public.menu_ingdrents (
    id integer NOT NULL,
    menu_id bigint,
    ingdrents_id bigint,
    size double precision
);
 "   DROP TABLE public.menu_ingdrents;
       public         heap    postgres    false         ?            1259    17319    orders    TABLE     i   CREATE TABLE public.orders (
    orders_id integer NOT NULL,
    filial_id bigint,
    menu_id bigint
);
    DROP TABLE public.orders;
       public         heap    postgres    false         ?            1259    17335    for_filial_gosht    VIEW       CREATE VIEW public.for_filial_gosht AS
 SELECT orders.filial_id,
    sum(menu_ingdrents.size) AS gosht_kg
   FROM (public.menu_ingdrents
     JOIN public.orders ON ((orders.menu_id = menu_ingdrents.menu_id)))
  WHERE (menu_ingdrents.ingdrents_id = 1)
  GROUP BY orders.filial_id;
 #   DROP VIEW public.for_filial_gosht;
       public          postgres    false    216    218    216    218    216         ?            1259    17288 	   ingdrents    TABLE     ?   CREATE TABLE public.ingdrents (
    in_id integer NOT NULL,
    title character(100) NOT NULL,
    qauntity integer,
    price double precision
);
    DROP TABLE public.ingdrents;
       public         heap    postgres    false         ?            1259    17287    ingdrents_in_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.ingdrents_in_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ingdrents_in_id_seq;
       public          postgres    false    214         1           0    0    ingdrents_in_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.ingdrents_in_id_seq OWNED BY public.ingdrents.in_id;
          public          postgres    false    213         ?            1259    17353    log    TABLE     #  CREATE TABLE public.log (
    id integer NOT NULL,
    product_id integer,
    product_title character(100) NOT NULL,
    ingdrent_id integer,
    ingdrent_title character(100),
    old_size double precision,
    new_size double precision,
    date_update date DEFAULT '2022-05-17'::date
);
    DROP TABLE public.log;
       public         heap    postgres    false         ?            1259    17352 
   log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.log_id_seq;
       public          postgres    false    221         2           0    0 
   log_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;
          public          postgres    false    220         ?            1259    17279    menu    TABLE     ?   CREATE TABLE public.menu (
    menu_id integer NOT NULL,
    title character(1000) NOT NULL,
    unit integer NOT NULL,
    price double precision
);
    DROP TABLE public.menu;
       public         heap    postgres    false         ?            1259    17294    menu_ingdrenys_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.menu_ingdrenys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.menu_ingdrenys_id_seq;
       public          postgres    false    216         3           0    0    menu_ingdrenys_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.menu_ingdrenys_id_seq OWNED BY public.menu_ingdrents.id;
          public          postgres    false    215         ?            1259    17278    menu_menu_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.menu_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.menu_menu_id_seq;
       public          postgres    false    212         4           0    0    menu_menu_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.menu_menu_id_seq OWNED BY public.menu.menu_id;
          public          postgres    false    211         ?            1259    17318    orders_orders_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.orders_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.orders_orders_id_seq;
       public          postgres    false    218         5           0    0    orders_orders_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.orders_orders_id_seq OWNED BY public.orders.orders_id;
          public          postgres    false    217         z           2604    17275    filials filials_id    DEFAULT     x   ALTER TABLE ONLY public.filials ALTER COLUMN filials_id SET DEFAULT nextval('public.filials_filials_id_seq'::regclass);
 A   ALTER TABLE public.filials ALTER COLUMN filials_id DROP DEFAULT;
       public          postgres    false    209    210    210         |           2604    17291    ingdrents in_id    DEFAULT     r   ALTER TABLE ONLY public.ingdrents ALTER COLUMN in_id SET DEFAULT nextval('public.ingdrents_in_id_seq'::regclass);
 >   ALTER TABLE public.ingdrents ALTER COLUMN in_id DROP DEFAULT;
       public          postgres    false    213    214    214                    2604    17356    log id    DEFAULT     `   ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);
 5   ALTER TABLE public.log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221         {           2604    17282    menu menu_id    DEFAULT     l   ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);
 ;   ALTER TABLE public.menu ALTER COLUMN menu_id DROP DEFAULT;
       public          postgres    false    212    211    212         }           2604    17298    menu_ingdrents id    DEFAULT     v   ALTER TABLE ONLY public.menu_ingdrents ALTER COLUMN id SET DEFAULT nextval('public.menu_ingdrenys_id_seq'::regclass);
 @   ALTER TABLE public.menu_ingdrents ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216         ~           2604    17322    orders orders_id    DEFAULT     t   ALTER TABLE ONLY public.orders ALTER COLUMN orders_id SET DEFAULT nextval('public.orders_orders_id_seq'::regclass);
 ?   ALTER TABLE public.orders ALTER COLUMN orders_id DROP DEFAULT;
       public          postgres    false    218    217    218                   0    17272    filials 
   TABLE DATA           3   COPY public.filials (filials_id, name) FROM stdin;
    public          postgres    false    210       3359.dat #          0    17288 	   ingdrents 
   TABLE DATA           B   COPY public.ingdrents (in_id, title, qauntity, price) FROM stdin;
    public          postgres    false    214       3363.dat )          0    17353    log 
   TABLE DATA           z   COPY public.log (id, product_id, product_title, ingdrent_id, ingdrent_title, old_size, new_size, date_update) FROM stdin;
    public          postgres    false    221       3369.dat !          0    17279    menu 
   TABLE DATA           ;   COPY public.menu (menu_id, title, unit, price) FROM stdin;
    public          postgres    false    212       3361.dat %          0    17295    menu_ingdrents 
   TABLE DATA           I   COPY public.menu_ingdrents (id, menu_id, ingdrents_id, size) FROM stdin;
    public          postgres    false    216       3365.dat '          0    17319    orders 
   TABLE DATA           ?   COPY public.orders (orders_id, filial_id, menu_id) FROM stdin;
    public          postgres    false    218       3367.dat 6           0    0    filials_filials_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.filials_filials_id_seq', 4, true);
          public          postgres    false    209         7           0    0    ingdrents_in_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ingdrents_in_id_seq', 9, true);
          public          postgres    false    213         8           0    0 
   log_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.log_id_seq', 1, true);
          public          postgres    false    220         9           0    0    menu_ingdrenys_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.menu_ingdrenys_id_seq', 19, true);
          public          postgres    false    215         :           0    0    menu_menu_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.menu_menu_id_seq', 4, true);
          public          postgres    false    211         ;           0    0    orders_orders_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orders_orders_id_seq', 10, true);
          public          postgres    false    217         ?           2606    17277    filials filials_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.filials
    ADD CONSTRAINT filials_pkey PRIMARY KEY (filials_id);
 >   ALTER TABLE ONLY public.filials DROP CONSTRAINT filials_pkey;
       public            postgres    false    210         ?           2606    17293    ingdrents ingdrents_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ingdrents
    ADD CONSTRAINT ingdrents_pkey PRIMARY KEY (in_id);
 B   ALTER TABLE ONLY public.ingdrents DROP CONSTRAINT ingdrents_pkey;
       public            postgres    false    214         ?           2606    17359    log log_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.log DROP CONSTRAINT log_pkey;
       public            postgres    false    221         ?           2606    17300 "   menu_ingdrents menu_ingdrenys_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.menu_ingdrents
    ADD CONSTRAINT menu_ingdrenys_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.menu_ingdrents DROP CONSTRAINT menu_ingdrenys_pkey;
       public            postgres    false    216         ?           2606    17286    menu menu_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_id);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public            postgres    false    212         ?           2606    17324    orders orders_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orders_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    218         ?           2620    17350 %   menu_ingdrents uppdate_menu_ingdrents    TRIGGER     ?   CREATE TRIGGER uppdate_menu_ingdrents AFTER UPDATE ON public.menu_ingdrents FOR EACH ROW EXECUTE FUNCTION public.uppdate_menu_ingdrents();
 >   DROP TRIGGER uppdate_menu_ingdrents ON public.menu_ingdrents;
       public          postgres    false    225    216         ?           2606    17306 /   menu_ingdrents menu_ingdrenys_ingdrents_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.menu_ingdrents
    ADD CONSTRAINT menu_ingdrenys_ingdrents_id_fkey FOREIGN KEY (ingdrents_id) REFERENCES public.ingdrents(in_id);
 Y   ALTER TABLE ONLY public.menu_ingdrents DROP CONSTRAINT menu_ingdrenys_ingdrents_id_fkey;
       public          postgres    false    214    3206    216         ?           2606    17301 *   menu_ingdrents menu_ingdrenys_menu_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.menu_ingdrents
    ADD CONSTRAINT menu_ingdrenys_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menu(menu_id);
 T   ALTER TABLE ONLY public.menu_ingdrents DROP CONSTRAINT menu_ingdrenys_menu_id_fkey;
       public          postgres    false    3204    216    212         ?           2606    17325    orders orders_filial_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_filial_id_fkey FOREIGN KEY (filial_id) REFERENCES public.filials(filials_id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_filial_id_fkey;
       public          postgres    false    218    3202    210         ?           2606    17330    orders orders_menu_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menu(menu_id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_menu_id_fkey;
       public          postgres    false    212    218    3204                                                                                                                                                                                                                                                                                                                                                                                                             3359.dat                                                                                            0000600 0004000 0002000 00000000323 14240727055 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	filial_1                                                                                            
2	filial_2                                                                                            
\.


                                                                                                                                                                                                                                                                                                             3363.dat                                                                                            0000600 0004000 0002000 00000001752 14240727055 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	mol goshti                                                                                          	1	70000
2	chips                                                                                               	1	10000
3	mayanez                                                                                             	1	20000
4	ketchup                                                                                             	1	25000
5	lavash_non                                                                                          	1	1500
6	hot-dog non                                                                                         	1	1500
7	pepsi                                                                                               	2	15000
8	pepsi                                                                                               	1	10000
9	fri                                                                                                 	1	10000
\.


                      3369.dat                                                                                            0000600 0004000 0002000 00000000350 14240727055 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	lavash                                                                                              	3	mayanez                                                                                             	0.2	0.3	2022-05-17
\.


                                                                                                                                                                                                                                                                                        3361.dat                                                                                            0000600 0004000 0002000 00000007721 14240727055 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	lavash                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  	1	23000
2	xot-dog                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 	1	11000
3	combo_1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 	1	45000
4	combo_2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 	1	35000
\.


                                               3365.dat                                                                                            0000600 0004000 0002000 00000000277 14240727055 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	1	5	1
4	1	4	0.2
5	1	2	0.1
6	3	1	0.3
7	3	5	1
8	3	3	0.2
9	3	4	0.2
10	3	2	0.1
11	3	9	1
12	3	8	1
1	1	1	0.3
13	4	1	0.3
14	4	5	1
15	4	3	0.2
16	4	4	0.2
17	4	2	0.1
18	4	9	1
19	4	7	1
3	1	3	0.3
\.


                                                                                                                                                                                                                                                                                                                                 3367.dat                                                                                            0000600 0004000 0002000 00000000102 14240727055 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
2	1	3
3	1	1
4	1	3
5	1	4
6	1	1
7	2	4
8	2	3
9	2	4
10	2	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                              restore.sql                                                                                         0000600 0004000 0002000 00000030531 14240727055 0015374 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

DROP DATABASE imtihon;
--
-- Name: imtihon; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE imtihon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE imtihon OWNER TO postgres;

\connect imtihon

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
-- Name: uppdate_menu_ingdrents(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.uppdate_menu_ingdrents() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
product_title varchar(100) := ' ';
ingdrents_title varchar(100) := ' ';


begin

select title into product_title from menu where menu_id = new.menu_id;
select title into ingdrents_title from ingdrents where in_id = new.ingdrents_id;

insert into log(product_id, product_title, ingdrent_id, ingdrent_title, old_size, new_size) values
(new.menu_id, product_title, new.ingdrents_id, ingdrents_title, old.size, new.size);  

return new;
end;
$$;


ALTER FUNCTION public.uppdate_menu_ingdrents() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: filials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filials (
    filials_id integer NOT NULL,
    name character(100) NOT NULL
);


ALTER TABLE public.filials OWNER TO postgres;

--
-- Name: filials_filials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filials_filials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filials_filials_id_seq OWNER TO postgres;

--
-- Name: filials_filials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filials_filials_id_seq OWNED BY public.filials.filials_id;


--
-- Name: menu_ingdrents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_ingdrents (
    id integer NOT NULL,
    menu_id bigint,
    ingdrents_id bigint,
    size double precision
);


ALTER TABLE public.menu_ingdrents OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orders_id integer NOT NULL,
    filial_id bigint,
    menu_id bigint
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: for_filial_gosht; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.for_filial_gosht AS
 SELECT orders.filial_id,
    sum(menu_ingdrents.size) AS gosht_kg
   FROM (public.menu_ingdrents
     JOIN public.orders ON ((orders.menu_id = menu_ingdrents.menu_id)))
  WHERE (menu_ingdrents.ingdrents_id = 1)
  GROUP BY orders.filial_id;


ALTER TABLE public.for_filial_gosht OWNER TO postgres;

--
-- Name: ingdrents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingdrents (
    in_id integer NOT NULL,
    title character(100) NOT NULL,
    qauntity integer,
    price double precision
);


ALTER TABLE public.ingdrents OWNER TO postgres;

--
-- Name: ingdrents_in_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingdrents_in_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingdrents_in_id_seq OWNER TO postgres;

--
-- Name: ingdrents_in_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingdrents_in_id_seq OWNED BY public.ingdrents.in_id;


--
-- Name: log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log (
    id integer NOT NULL,
    product_id integer,
    product_title character(100) NOT NULL,
    ingdrent_id integer,
    ingdrent_title character(100),
    old_size double precision,
    new_size double precision,
    date_update date DEFAULT '2022-05-17'::date
);


ALTER TABLE public.log OWNER TO postgres;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_seq OWNER TO postgres;

--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    menu_id integer NOT NULL,
    title character(1000) NOT NULL,
    unit integer NOT NULL,
    price double precision
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_ingdrenys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_ingdrenys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_ingdrenys_id_seq OWNER TO postgres;

--
-- Name: menu_ingdrenys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_ingdrenys_id_seq OWNED BY public.menu_ingdrents.id;


--
-- Name: menu_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menu_id_seq OWNER TO postgres;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_menu_id_seq OWNED BY public.menu.menu_id;


--
-- Name: orders_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orders_id_seq OWNER TO postgres;

--
-- Name: orders_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orders_id_seq OWNED BY public.orders.orders_id;


--
-- Name: filials filials_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filials ALTER COLUMN filials_id SET DEFAULT nextval('public.filials_filials_id_seq'::regclass);


--
-- Name: ingdrents in_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingdrents ALTER COLUMN in_id SET DEFAULT nextval('public.ingdrents_in_id_seq'::regclass);


--
-- Name: log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);


--
-- Name: menu menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);


--
-- Name: menu_ingdrents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_ingdrents ALTER COLUMN id SET DEFAULT nextval('public.menu_ingdrenys_id_seq'::regclass);


--
-- Name: orders orders_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN orders_id SET DEFAULT nextval('public.orders_orders_id_seq'::regclass);


--
-- Data for Name: filials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filials (filials_id, name) FROM stdin;
\.
COPY public.filials (filials_id, name) FROM '$$PATH$$/3359.dat';

--
-- Data for Name: ingdrents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingdrents (in_id, title, qauntity, price) FROM stdin;
\.
COPY public.ingdrents (in_id, title, qauntity, price) FROM '$$PATH$$/3363.dat';

--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log (id, product_id, product_title, ingdrent_id, ingdrent_title, old_size, new_size, date_update) FROM stdin;
\.
COPY public.log (id, product_id, product_title, ingdrent_id, ingdrent_title, old_size, new_size, date_update) FROM '$$PATH$$/3369.dat';

--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (menu_id, title, unit, price) FROM stdin;
\.
COPY public.menu (menu_id, title, unit, price) FROM '$$PATH$$/3361.dat';

--
-- Data for Name: menu_ingdrents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_ingdrents (id, menu_id, ingdrents_id, size) FROM stdin;
\.
COPY public.menu_ingdrents (id, menu_id, ingdrents_id, size) FROM '$$PATH$$/3365.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (orders_id, filial_id, menu_id) FROM stdin;
\.
COPY public.orders (orders_id, filial_id, menu_id) FROM '$$PATH$$/3367.dat';

--
-- Name: filials_filials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filials_filials_id_seq', 4, true);


--
-- Name: ingdrents_in_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingdrents_in_id_seq', 9, true);


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_id_seq', 1, true);


--
-- Name: menu_ingdrenys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_ingdrenys_id_seq', 19, true);


--
-- Name: menu_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_menu_id_seq', 4, true);


--
-- Name: orders_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orders_id_seq', 10, true);


--
-- Name: filials filials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filials
    ADD CONSTRAINT filials_pkey PRIMARY KEY (filials_id);


--
-- Name: ingdrents ingdrents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingdrents
    ADD CONSTRAINT ingdrents_pkey PRIMARY KEY (in_id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: menu_ingdrents menu_ingdrenys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_ingdrents
    ADD CONSTRAINT menu_ingdrenys_pkey PRIMARY KEY (id);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orders_id);


--
-- Name: menu_ingdrents uppdate_menu_ingdrents; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER uppdate_menu_ingdrents AFTER UPDATE ON public.menu_ingdrents FOR EACH ROW EXECUTE FUNCTION public.uppdate_menu_ingdrents();


--
-- Name: menu_ingdrents menu_ingdrenys_ingdrents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_ingdrents
    ADD CONSTRAINT menu_ingdrenys_ingdrents_id_fkey FOREIGN KEY (ingdrents_id) REFERENCES public.ingdrents(in_id);


--
-- Name: menu_ingdrents menu_ingdrenys_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_ingdrents
    ADD CONSTRAINT menu_ingdrenys_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menu(menu_id);


--
-- Name: orders orders_filial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_filial_id_fkey FOREIGN KEY (filial_id) REFERENCES public.filials(filials_id);


--
-- Name: orders orders_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menu(menu_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       