--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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
-- Name: contacts; Type: TABLE; Schema: public; Owner: black
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    firstname character varying(100),
    lastname character varying(100),
    email character varying(100),
    userid character varying(100),
    phonenumber character varying(100) NOT NULL,
    group_address integer[],
    address character varying,
    city character varying(100),
    county character varying(100),
    company_name character varying(100)
);


ALTER TABLE public.contacts OWNER TO black;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: black
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO black;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: black
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: group_address; Type: TABLE; Schema: public; Owner: black
--

CREATE TABLE public.group_address (
    id integer NOT NULL,
    group_name character varying(100),
    user_id character varying(100)
);


ALTER TABLE public.group_address OWNER TO black;

--
-- Name: group_address_id_seq; Type: SEQUENCE; Schema: public; Owner: black
--

CREATE SEQUENCE public.group_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_address_id_seq OWNER TO black;

--
-- Name: group_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: black
--

ALTER SEQUENCE public.group_address_id_seq OWNED BY public.group_address.id;


--
-- Name: sentmessages; Type: TABLE; Schema: public; Owner: black
--

CREATE TABLE public.sentmessages (
    msgid text NOT NULL,
    receiver text,
    message character varying(255),
    sender text,
    status text,
    timesent timestamp without time zone
);


ALTER TABLE public.sentmessages OWNER TO black;

--
-- Name: unsentmessages; Type: TABLE; Schema: public; Owner: black
--

CREATE TABLE public.unsentmessages (
    msgid integer NOT NULL,
    receiver text,
    message character varying(255),
    sender text,
    status text,
    timesent timestamp without time zone
);


ALTER TABLE public.unsentmessages OWNER TO black;

--
-- Name: unsentmessages_msgid_seq; Type: SEQUENCE; Schema: public; Owner: black
--

CREATE SEQUENCE public.unsentmessages_msgid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.unsentmessages_msgid_seq OWNER TO black;

--
-- Name: unsentmessages_msgid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: black
--

ALTER SEQUENCE public.unsentmessages_msgid_seq OWNED BY public.unsentmessages.msgid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: black
--

CREATE TABLE public.users (
    userid text NOT NULL,
    username character varying(100)
);


ALTER TABLE public.users OWNER TO black;

--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: black
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: group_address id; Type: DEFAULT; Schema: public; Owner: black
--

ALTER TABLE ONLY public.group_address ALTER COLUMN id SET DEFAULT nextval('public.group_address_id_seq'::regclass);


--
-- Name: unsentmessages msgid; Type: DEFAULT; Schema: public; Owner: black
--

ALTER TABLE ONLY public.unsentmessages ALTER COLUMN msgid SET DEFAULT nextval('public.unsentmessages_msgid_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: black
--

COPY public.contacts (id, firstname, lastname, email, userid, phonenumber, group_address, address, city, county, company_name) FROM stdin;
4	Nyingi	Levis	\N	\N	+254738897351	\N	\N	\N	\N	\N
5	Rose	Levis	\N	\N	+254738897351	\N	\N	\N	\N	\N
6	Nyingi	Rose	\N	\N	+254738897351	\N	\N	\N	\N	\N
7	Levis			\N	+254708088195	{6,5}	\N	\N	\N	\N
8	Levis			\N	+254708088196	{6,5}	\N	\N	\N	\N
9	Levis			\N	+254708088195	{6}	\N	\N	\N	\N
10	Nyingi			\N	+254708088197	{5}	\N	\N	\N	\N
11	Levis		\N	\N	+254708088195	{6,5}	\N	\N	\N	\N
12	Nyingi		\N	\N	+24356363537	{6,5}	\N	\N	\N	\N
13	Levis		\N	\N	+254708088195	{6,5}	\N	\N	\N	\N
14	Nyingi		\N	\N	+24356363537	{6,5}	\N	\N	\N	\N
15	Davis		\N	\N	Mkeche+254708088195	{6,5}	\N	\N	\N	\N
16	john	Doe	\N	\N	+2547xxxxxxxx	{}	\N	\N	\N	\N
17	Davis	Mkeche	\N	\N	+254708088195	{}	\N	\N	\N	\N
18	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
19	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
20	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
21	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
22	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
23	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
24	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
25	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
26	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
27	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
28	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
29	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
30	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
31	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
32	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
33	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
34	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
35	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
36	john	Doe	\N	\N	+2548xxxxxxxx	{}	\N	\N	\N	\N
37	john	Doe	\N	\N	+2549xxxxxxxx	{}	\N	\N	\N	\N
38	john	Doe	\N	\N	+2548xxxxxxxx	{6}	\N	\N	\N	\N
39	john	Doe	\N	\N	+2549xxxxxxxx	{6}	\N	\N	\N	\N
42	Lenna	Paprocki	lpaprocki@hotmail.com	\N	907-385-4412	{5}	639 Main St	Anchorage	Anchorage	Feltz Printing Service
40	Donette	Foller	donette.foller@cox.net	\N	513-570-1893	{5}	34 Center St	Hamilton	Butler	Printing Dimensions
41	Art	Venere	art@venere.org	\N	856-636-8749	{5}	8 W Cerritos Ave #54	Bridgeport	Gloucester	Chemel, James L Cpa
43	Simona	Morasca	simona@morasca.com	\N	419-503-2484	{5}	3 Mcauley Dr	Ashland	Ashland	Chapman, Ross E Esq
45	Mitsue	Tollner	mitsue_tollner@yahoo.com	\N	773-573-6914	{5}	7 Eads St	Chicago	Cook	Morlong Associates
46	Josephine	Darakjy	josephine_darakjy@darakjy.org	\N	810-292-9388	{5}	4 B Blue Ridge Blvd	Brighton	Livingston	Chanay, Jeffrey A Esq
47	Leota	Dilliard	leota@hotmail.com	\N	408-752-3500	{5}	7 W Jackson Blvd	San Jose	Santa Clara	Commercial Press
44	James	Butt	jbutt@gmail.com	\N	504-621-8927	{5}	6649 N Blue Gum St	New Orleans	Orleans	Benton, John B Jr
48	Kris	Marrier	kris@gmail.com	\N	410-655-8723	{5}	228 Runamuck Pl #2808	Baltimore	Baltimore City	King, Christopher A Esq
49	Minna	Amigon	minna_amigon@yahoo.com	\N	215-874-1229	{5}	2371 Jerrold Ave	Kulpsville	Montgomery	Dorl, James J Esq
50	Abel	Maclead	amaclead@gmail.com	\N	631-335-3414	{5}	37275 St  Rt 17m M	Middle Island	Suffolk	Rangoni Of Florence
51	Sage	Wieser	sage_wieser@cox.net	\N	605-414-2147	{5}	5 Boston Ave #88	Sioux Falls	Minnehaha	Truhlar And Truhlar Attys
52	Meaghan	Garufi	meaghan@hotmail.com	\N	931-313-9635	{5}	69734 E Carrillo St	Mc Minnville	Warren	Bolton, Wilbur Esq
54	Graciela	Ruta	gruta@cox.net	\N	440-780-8425	{5}	98 Connecticut Ave Nw	Chagrin Falls	Geauga	Buckley Miller & Wright
55	Mattie	Poquette	mattie@aol.com	\N	602-277-4385	{5}	73 State Road 434 E	Phoenix	Maricopa	Century Communications
56	Cammy	Albares	calbares@gmail.com	\N	956-537-6195	{5}	56 E Morehead St	Laredo	Webb	Rousseaux, Michael Esq
58	Gladys	Rim	gladys.rim@rim.org	\N	414-661-9598	{5}	322 New Horizon Blvd	Milwaukee	Milwaukee	T M Byxbee Company Pc
53	Yuki	Whobrey	yuki_whobrey@aol.com	\N	313-288-7937	{5}	1 State Route 27	Taylor	Wayne	Farmers Insurance Group
57	Kiley	Caldarera	kiley.caldarera@aol.com	\N	310-498-5651	{5}	25 E 75th St #69	Los Angeles	Los Angeles	Feiner Bros
59	Fletcher	Flosi	fletcher.flosi@yahoo.com	\N	815-828-2147	{5}	394 Manchester Blvd	Rockford	Winnebago	Post Box Services Plus
60	Bette	Nicka	bette_nicka@cox.net	\N	610-545-3615	{5}	6 S 33rd St	Aston	Delaware	Sport En Art
62	Willard	Kolmetz	willard@hotmail.com	\N	972-303-9197	{5}	618 W Yakima Ave	Irving	Dallas	Ingalls, Donald R Esq
63	Maryann	Royster	mroyster@royster.com	\N	518-966-7987	{5}	74 S Westgate St	Albany	Albany	Franklin, Peter L Esq
64	Alisha	Slusarski	alisha@slusarski.com	\N	732-658-3154	{5}	3273 State St	Middlesex	Middlesex	Wtlz Power 107 Fm
65	Allene	Iturbide	allene_iturbide@cox.net	\N	715-662-6764	{5}	1 Central Ave	Stevens Point	Portage	Ledecky, David Esq
67	Erick	Ferencz	erick.ferencz@aol.com	\N	907-741-1044	{5}	20 S Babcock St	Fairbanks	Fairbanks North Star	Cindy Turner Associates
61	Veronika	Inouye	vinouye@aol.com	\N	408-540-1785	{5}	6 Greenleaf Ave	San Jose	Santa Clara	C 4 Network Inc
66	Chanel	Caudy	chanel.caudy@caudy.org	\N	913-388-2079	{5}	86 Nw 66th St #8673	Shawnee	Johnson	Professional Image Inc
68	Delmy	Ahle	delmy.ahle@hotmail.com	\N	401-458-2547	{5}	65895 S 16th St	Providence	Providence	Wye Technologies Inc
69	Carma	Vanheusen	carma@cox.net	\N	510-503-7169	{5}	68556 Central Hwy	San Leandro	Alameda	Springfield Div Oh Edison Co
70	Deeanna	Juhas	deeanna_juhas@gmail.com	\N	215-211-9589	{5}	14302 Pennsylvania Ave	Huntingdon Valley	Montgomery	Healy, George W Iv
79	Malinda	Hochard	malinda.hochard@yahoo.com	\N	317-722-5066	{5}	55 Riverside Ave	Indianapolis	Marion	Logan Memorial Hospital
83	Stephen	Emigh	stephen_emigh@hotmail.com	\N	330-537-5358	{5}	3777 E Richmond St #900	Akron	Summit	Sharp, J Daniel Esq
91	Tammara	Wardrip	twardrip@cox.net	\N	650-803-1936	{5}	4800 Black Horse Pike	Burlingame	San Mateo	Jewel My Shop Inc
105	Delisa	Crupi	delisa.crupi@crupi.com	\N	973-354-2040	{5}	47565 W Grand Ave	Newark	Essex	Wood & Whitacre Contractors
110	Moon	Parlato	moon@yahoo.com	\N	585-866-8313	{5}	74989 Brandon St	Wellsville	Allegany	Ambelang, Jessica M Md
118	Lorrie	Nestle	lnestle@hotmail.com	\N	931-875-6644	{5}	39 S 7th St	Tullahoma	Coffee	Ballard Spahr Andrews
123	Tamar	Hoogland	tamar@hotmail.com	\N	740-343-8575	{5}	2737 Pistorio Rd #9230	London	Madison	A K Construction Co
127	Elly	Morocco	elly_morocco@gmail.com	\N	814-393-5571	{5}	7 W 32nd St	Erie	Erie	Killion Industries
128	Tonette	Wenner	twenner@aol.com	\N	516-968-6051	{5}	4545 Courthouse Rd	Westbury	Nassau	Northwest Publishing
133	Carmelina	Lindall	carmelina_lindall@lindall.com	\N	303-724-7371	{5}	2664 Lewis Rd	Littleton	Douglas	George Jessop Carter Jewelers
78	Ezekiel	Chui	ezekiel@chui.com	\N	410-669-1642	{5}	2 Cedar Ave #84	Easton	Talbot	Sider, Donald C Esq
76	Devorah	Chickering	devorah@hotmail.com	\N	505-975-8559	{5}	31 Douglas Blvd #950	Clovis	Curry	Garrison Ind
80	Solange	Shinko	solange@shinko.com	\N	504-979-9175	{5}	426 Wolf St	Metairie	Jefferson	Mosocco, Ronald A
84	Francine	Vocelka	francine_vocelka@vocelka.com	\N	505-977-3911	{5}	366 South Dr	Las Cruces	Dona Ana	Cascade Realty Advisors Inc
89	Cory	Gibes	cory.gibes@gmail.com	\N	626-572-1096	{5}	83649 W Belmont Ave	San Gabriel	Los Angeles	Chinese Translation Resources
94	Valentine	Gillian	valentine_gillian@gmail.com	\N	210-812-9597	{5}	775 W 17th St	San Antonio	Bexar	Fbs Business Finance
97	Arlette	Honeywell	ahoneywell@honeywell.com	\N	904-775-4480	{5}	11279 Loytan St	Jacksonville	Duval	Smc Inc
100	Alishia	Sergi	asergi@gmail.com	\N	212-860-1579	{5}	2742 Distribution Way	New York	New York	Milford Enterprises Inc
102	Jose	Stockham	jose@yahoo.com	\N	212-675-8570	{5}	128 Bransten Rd	New York	New York	Tri State Refueler Co
108	Laurel	Reitler	laurel_reitler@reitler.com	\N	410-520-4832	{5}	6 Kains Ave	Baltimore	Baltimore City	Q A Service
116	Micaela	Rhymes	micaela_rhymes@gmail.com	\N	925-647-3298	{5}	20932 Hedley St	Concord	Contra Costa	H Lee Leonard Attorney At Law
117	Bobbye	Rhym	brhym@rhym.com	\N	650-528-5783	{5}	30 W 80th St #1995	San Carlos	San Mateo	Smits, Patricia Garity
124	Emerson	Bowley	emerson.bowley@bowley.org	\N	608-336-7444	{5}	762 S Main St	Madison	Dane	Knights Inn
126	Karl	Klonowski	karl_klonowski@yahoo.com	\N	908-877-6135	{5}	76 Brooks St #9	Flemington	Hunterdon	Rossi, Michael M
129	Penney	Weight	penney_weight@aol.com	\N	907-797-9628	{5}	18 Fountain St	Anchorage	Anchorage	Hawaiian King Hotel
131	Tawna	Buvens	tawna@gmail.com	\N	212-674-9610	{5}	3305 Nabell Ave #679	New York	New York	H H H Enterprises Inc
132	Shenika	Seewald	shenika@gmail.com	\N	818-423-4007	{5}	4 Otis St	Van Nuys	Los Angeles	East Coast Marketing
139	James	Butt	jbutt@gmail.com	\N	504-621-8927	{5}	6649 N Blue Gum St	New Orleans	Orleans	Benton, John B Jr
140	Josephine	Darakjy	josephine_darakjy@darakjy.org	\N	810-292-9388	{5}	4 B Blue Ridge Blvd	Brighton	Livingston	Chanay, Jeffrey A Esq
144	Simona	Morasca	simona@morasca.com	\N	419-503-2484	{5}	3 Mcauley Dr	Ashland	Ashland	Chapman, Ross E Esq
145	Kris	Marrier	kris@gmail.com	\N	410-655-8723	{5}	228 Runamuck Pl #2808	Baltimore	Baltimore City	King, Christopher A Esq
148	Alisha	Slusarski	alisha@slusarski.com	\N	732-658-3154	{5}	3273 State St	Middlesex	Middlesex	Wtlz Power 107 Fm
149	Meaghan	Garufi	meaghan@hotmail.com	\N	931-313-9635	{5}	69734 E Carrillo St	Mc Minnville	Warren	Bolton, Wilbur Esq
172	Alishia	Sergi	asergi@gmail.com	\N	212-860-1579	{5}	2742 Distribution Way	New York	New York	Milford Enterprises Inc
174	Lisha	Centini	lisha@centini.org	\N	703-235-3937	{5}	64 5th Ave #1153	Mc Lean	Fairfax	Industrial Paper Shredders Inc
227	Karl	Klonowski	karl_klonowski@yahoo.com	\N	908-877-6135	{5}	76 Brooks St #9	Flemington	Hunterdon	Rossi, Michael M
233	Maurine	Yglesias	maurine_yglesias@yglesias.com	\N	414-748-1374	{5}	59 Shady Ln #53	Milwaukee	Milwaukee	Schultz, Thomas C Md
141	Art	Venere	art@venere.org	\N	856-636-8749	{5}	8 W Cerritos Ave #54	Bridgeport	Gloucester	Chemel, James L Cpa
142	Lenna	Paprocki	lpaprocki@hotmail.com	\N	907-385-4412	{5}	639 Main St	Anchorage	Anchorage	Feltz Printing Service
143	Donette	Foller	donette.foller@cox.net	\N	513-570-1893	{5}	34 Center St	Hamilton	Butler	Printing Dimensions
146	Minna	Amigon	minna_amigon@yahoo.com	\N	215-874-1229	{5}	2371 Jerrold Ave	Kulpsville	Montgomery	Dorl, James J Esq
147	Mattie	Poquette	mattie@aol.com	\N	602-277-4385	{5}	73 State Road 434 E	Phoenix	Maricopa	Century Communications
150	Maryann	Royster	mroyster@royster.com	\N	518-966-7987	{5}	74 S Westgate St	Albany	Albany	Franklin, Peter L Esq
153	Gladys	Rim	gladys.rim@rim.org	\N	414-661-9598	{5}	322 New Horizon Blvd	Milwaukee	Milwaukee	T M Byxbee Company Pc
156	Yuki	Whobrey	yuki_whobrey@aol.com	\N	313-288-7937	{5}	1 State Route 27	Taylor	Wayne	Farmers Insurance Group
171	Albina	Glick	albina@glick.com	\N	732-924-7882	{5}	4 Ralph Ct	Dunellen	Middlesex	Giampetro, Anthony D
176	Carma	Vanheusen	carma@cox.net	\N	510-503-7169	{5}	68556 Central Hwy	San Leandro	Alameda	Springfield Div Oh Edison Co
194	Stephaine	Barfield	stephaine@barfield.com	\N	310-774-7643	{5}	47154 Whipple Ave Nw	Gardena	Los Angeles	Beutelschies & Company
200	Myra	Munns	mmunns@cox.net	\N	817-914-7518	{5}	461 Prospect Pl #316	Euless	Tarrant	Anker Law Office
224	Johnetta	Abdallah	johnetta_abdallah@aol.com	\N	919-225-9345	{5}	1088 Pinehurst St	Chapel Hill	Orange	Forging Specialties
229	Cecily	Hollack	cecily@hollack.org	\N	512-486-3817	{5}	59 N Groesbeck Hwy	Austin	Travis	Arthur A Oliver & Son Inc
230	Ilene	Eroman	ilene.eroman@hotmail.com	\N	410-914-9018	{5}	2853 S Central Expy	Glen Burnie	Anne Arundel	Robinson, William J Esq
236	Penney	Weight	penney_weight@aol.com	\N	907-797-9628	{5}	18 Fountain St	Anchorage	Anchorage	Hawaiian King Hotel
151	Mitsue	Tollner	mitsue_tollner@yahoo.com	\N	773-573-6914	{5}	7 Eads St	Chicago	Cook	Morlong Associates
154	Willard	Kolmetz	willard@hotmail.com	\N	972-303-9197	{5}	618 W Yakima Ave	Irving	Dallas	Ingalls, Donald R Esq
159	Bette	Nicka	bette_nicka@cox.net	\N	610-545-3615	{5}	6 S 33rd St	Aston	Delaware	Sport En Art
168	Bernardo	Figeroa	bfigeroa@aol.com	\N	936-336-3951	{5}	386 9th Ave N	Conroe	Montgomery	Clark, Richard Cpa
178	Natalie	Fern	natalie.fern@hotmail.com	\N	307-704-8713	{5}	7140 University Ave	Rock Springs	Sweetwater	Kelly, Charles G Esq
188	Tyra	Shields	tshields@gmail.com	\N	215-255-1641	{5}	3 Fort Worth Ave	Philadelphia	Philadelphia	Assink, Anne H Esq
205	Lorrie	Nestle	lnestle@hotmail.com	\N	931-875-6644	{5}	39 S 7th St	Tullahoma	Coffee	Ballard Spahr Andrews
210	Lettie	Isenhower	lettie_isenhower@yahoo.com	\N	216-657-7668	{5}	70 W Main St	Beachwood	Cuyahoga	Conte, Christopher A Esq
214	Laurel	Reitler	laurel_reitler@reitler.com	\N	410-520-4832	{5}	6 Kains Ave	Baltimore	Baltimore City	Q A Service
218	Delisa	Crupi	delisa.crupi@crupi.com	\N	973-354-2040	{5}	47565 W Grand Ave	Newark	Essex	Wood & Whitacre Contractors
223	Blondell	Pugh	bpugh@aol.com	\N	401-960-8259	{5}	201 Hawk Ct	Providence	Providence	Alpenlite Inc
228	Tamar	Hoogland	tamar@hotmail.com	\N	740-343-8575	{5}	2737 Pistorio Rd #9230	London	Madison	A K Construction Co
231	Jamal	Vanausdal	jamal@vanausdal.org	\N	732-234-1546	{5}	53075 Sw 152nd Ter #615	Monroe Township	Middlesex	Hubbard, Bruce Esq
237	Tawna	Buvens	tawna@gmail.com	\N	212-674-9610	{5}	3305 Nabell Ave #679	New York	New York	H H H Enterprises Inc
152	Sage	Wieser	sage_wieser@cox.net	\N	605-414-2147	{5}	5 Boston Ave #88	Sioux Falls	Minnehaha	Truhlar And Truhlar Attys
157	Veronika	Inouye	vinouye@aol.com	\N	408-540-1785	{5}	6 Greenleaf Ave	San Jose	Santa Clara	C 4 Network Inc
170	Francine	Vocelka	francine_vocelka@vocelka.com	\N	505-977-3911	{5}	366 South Dr	Las Cruces	Dona Ana	Cascade Realty Advisors Inc
173	Jose	Stockham	jose@yahoo.com	\N	212-675-8570	{5}	128 Bransten Rd	New York	New York	Tri State Refueler Co
175	Ernie	Stenseth	ernie_stenseth@aol.com	\N	201-709-6245	{5}	45 E Liberty St	Ridgefield Park	Bergen	Knwz Newsradio
182	Elvera	Benimadho	elvera.benimadho@cox.net	\N	408-703-8505	{5}	99385 Charity St #840	San Jose	Santa Clara	Tree Musketeers
183	Valentine	Gillian	valentine_gillian@gmail.com	\N	210-812-9597	{5}	775 W 17th St	San Antonio	Bexar	Fbs Business Finance
191	Lavera	Perin	lperin@perin.org	\N	305-606-7291	{5}	678 3rd Ave	Miami	Miami-Dade	Abc Enterprises Inc
204	Devorah	Chickering	devorah@hotmail.com	\N	505-975-8559	{5}	31 Douglas Blvd #950	Clovis	Curry	Garrison Ind
209	Sabra	Uyetake	sabra@uyetake.org	\N	803-925-5213	{5}	98839 Hawthorne Blvd #6101	Columbia	Richland	Lowy Limousine Service
213	Tonette	Wenner	twenner@aol.com	\N	516-968-6051	{5}	4545 Courthouse Rd	Westbury	Nassau	Northwest Publishing
217	Deeanna	Juhas	deeanna_juhas@gmail.com	\N	215-211-9589	{5}	14302 Pennsylvania Ave	Huntingdon Valley	Montgomery	Healy, George W Iv
221	Delmy	Ahle	delmy.ahle@hotmail.com	\N	401-458-2547	{5}	65895 S 16th St	Providence	Providence	Wye Technologies Inc
225	Carmelina	Lindall	carmelina_lindall@lindall.com	\N	303-724-7371	{5}	2664 Lewis Rd	Littleton	Douglas	George Jessop Carter Jewelers
235	Elly	Morocco	elly_morocco@gmail.com	\N	814-393-5571	{5}	7 W 32nd St	Erie	Erie	Killion Industries
155	Leota	Dilliard	leota@hotmail.com	\N	408-752-3500	{5}	7 W Jackson Blvd	San Jose	Santa Clara	Commercial Press
158	Fletcher	Flosi	fletcher.flosi@yahoo.com	\N	815-828-2147	{5}	394 Manchester Blvd	Rockford	Winnebago	Post Box Services Plus
169	Ammie	Corrio	ammie@corrio.com	\N	614-801-9788	{5}	74874 Atlantic Ave	Columbus	Franklin	Moskowitz, Barry S
177	Kati	Rulapaugh	kati.rulapaugh@hotmail.com	\N	785-463-7829	{5}	6980 Dorsett Rd	Abilene	Dickinson	Eder Assocs Consltng Engrs Pc
187	Dyan	Oldroyd	doldroyd@aol.com	\N	913-413-4604	{5}	7219 Woodfield Rd	Overland Park	Johnson	International Eyelets Inc
193	Erick	Ferencz	erick.ferencz@aol.com	\N	907-741-1044	{5}	20 S Babcock St	Fairbanks	Fairbanks North Star	Cindy Turner Associates
198	Lai	Gato	lai.gato@gato.org	\N	847-728-7286	{5}	37 Alabama Ave	Evanston	Cook	Fligg, Kenneth I Jr
201	Blair	Malet	bmalet@yahoo.com	\N	215-907-9111	{5}	209 Decker Dr	Philadelphia	Philadelphia	Bollinger Mach Shp & Shipyard
207	Jina	Briddick	jina_briddick@briddick.com	\N	617-399-5124	{5}	38938 Park Blvd	Boston	Suffolk	Grace Pastries Inc
211	Marjory	Mastella	mmastella@mastella.com	\N	610-814-5533	{5}	71 San Mateo Ave	Wayne	Delaware	Vicon Corporation
216	Viva	Toelkes	viva.toelkes@gmail.com	\N	773-446-5569	{5}	4284 Dorigo Ln	Chicago	Cook	Mark Iv Press Ltd
222	Vallie	Mondella	vmondella@mondella.com	\N	208-862-5339	{5}	74 W College St	Boise	Ada	Private Properties
234	Kallie	Blackwood	kallie.blackwood@gmail.com	\N	415-315-2761	{5}	701 S Harrison Rd	San Francisco	San Francisco	Rowley Schlimgen Inc
160	Kiley	Caldarera	kiley.caldarera@aol.com	\N	310-498-5651	{5}	25 E 75th St #69	Los Angeles	Los Angeles	Feiner Bros
167	Willow	Kusko	wkusko@yahoo.com	\N	212-582-4976	{5}	90991 Thorburn Ave	New York	New York	U Pull It
179	Solange	Shinko	solange@shinko.com	\N	504-979-9175	{5}	426 Wolf St	Metairie	Jefferson	Mosocco, Ronald A
186	Danica	Bruschke	danica_bruschke@gmail.com	\N	254-782-8569	{5}	840 15th Ave	Waco	McLennan	Stevens, Charles T
192	Tammara	Wardrip	twardrip@cox.net	\N	650-803-1936	{5}	4800 Black Horse Pike	Burlingame	San Mateo	Jewel My Shop Inc
196	Stephen	Emigh	stephen_emigh@hotmail.com	\N	330-537-5358	{5}	3777 E Richmond St #900	Akron	Summit	Sharp, J Daniel Esq
199	Emerson	Bowley	emerson.bowley@bowley.org	\N	608-336-7444	{5}	762 S Main St	Madison	Dane	Knights Inn
206	Dominque	Dickerson	dominque.dickerson@dickerson.org	\N	510-993-3758	{5}	69 Marquette Ave	Hayward	Alameda	E A I Electronic Assocs Inc
208	Arlette	Honeywell	ahoneywell@honeywell.com	\N	904-775-4480	{5}	11279 Loytan St	Jacksonville	Duval	Smc Inc
215	Shenika	Seewald	shenika@gmail.com	\N	818-423-4007	{5}	4 Otis St	Van Nuys	Los Angeles	East Coast Marketing
220	Micaela	Rhymes	micaela_rhymes@gmail.com	\N	925-647-3298	{5}	20932 Hedley St	Concord	Contra Costa	H Lee Leonard Attorney At Law
161	Abel	Maclead	amaclead@gmail.com	\N	631-335-3414	{5}	37275 St  Rt 17m M	Middle Island	Suffolk	Rangoni Of Florence
166	Ezekiel	Chui	ezekiel@chui.com	\N	410-669-1642	{5}	2 Cedar Ave #84	Easton	Talbot	Sider, Donald C Esq
180	Malinda	Hochard	malinda.hochard@yahoo.com	\N	317-722-5066	{5}	55 Riverside Ave	Indianapolis	Marion	Logan Memorial Hospital
185	Youlanda	Schemmer	youlanda@aol.com	\N	541-548-8197	{5}	2881 Lewis Rd	Prineville	Crook	Tri M Tool Inc
190	Cory	Gibes	cory.gibes@gmail.com	\N	626-572-1096	{5}	83649 W Belmont Ave	San Gabriel	Los Angeles	Chinese Translation Resources
203	Brock	Bolognia	bbolognia@yahoo.com	\N	212-402-9216	{5}	4486 W O St #1	New York	New York	Orinda News
212	Elza	Lipke	elza@yahoo.com	\N	973-927-3447	{5}	6794 Lake Dr E	Newark	Essex	Museum Of Science & Industry
219	Amber	Monarrez	amber_monarrez@monarrez.org	\N	215-934-8655	{5}	14288 Foster Ave #4121	Jenkintown	Montgomery	Branford Wire & Mfg Co
73	Wilda	Giguere	wilda@cox.net	\N	907-870-5536	{5}	1747 Calle Amanecer #2	Anchorage	Anchorage	Mclaughlin, Luther W Cpa
86	Ernie	Stenseth	ernie_stenseth@aol.com	\N	201-709-6245	{5}	45 E Liberty St	Ridgefield Park	Bergen	Knwz Newsradio
92	Rozella	Ostrosky	rozella.ostrosky@ostrosky.com	\N	805-832-6163	{5}	17 Morena Blvd	Camarillo	Ventura	Parkway Company
104	Roxane	Campain	roxane@hotmail.com	\N	907-231-4722	{5}	1048 Main St	Fairbanks	Fairbanks North Star	Rapid Trading Intl
111	Dyan	Oldroyd	doldroyd@aol.com	\N	913-413-4604	{5}	7219 Woodfield Rd	Overland Park	Johnson	International Eyelets Inc
119	Kallie	Blackwood	kallie.blackwood@gmail.com	\N	415-315-2761	{5}	701 S Harrison Rd	San Francisco	San Francisco	Rowley Schlimgen Inc
135	Jamal	Vanausdal	jamal@vanausdal.org	\N	732-234-1546	{5}	53075 Sw 152nd Ter #615	Monroe Township	Middlesex	Hubbard, Bruce Esq
162	Graciela	Ruta	gruta@cox.net	\N	440-780-8425	{5}	98 Connecticut Ave Nw	Chagrin Falls	Geauga	Buckley Miller & Wright
165	Chanel	Caudy	chanel.caudy@caudy.org	\N	913-388-2079	{5}	86 Nw 66th St #8673	Shawnee	Johnson	Professional Image Inc
181	Rozella	Ostrosky	rozella.ostrosky@ostrosky.com	\N	805-832-6163	{5}	17 Morena Blvd	Camarillo	Ventura	Parkway Company
184	Wilda	Giguere	wilda@cox.net	\N	907-870-5536	{5}	1747 Calle Amanecer #2	Anchorage	Anchorage	Mclaughlin, Luther W Cpa
189	Roxane	Campain	roxane@hotmail.com	\N	907-231-4722	{5}	1048 Main St	Fairbanks	Fairbanks North Star	Rapid Trading Intl
195	Fatima	Saylors	fsaylors@saylors.org	\N	952-768-2416	{5}	2 Lighthouse Ave	Hopkins	Hennepin	Stanton, James D Esq
197	Kanisha	Waycott	kanisha_waycott@yahoo.com	\N	323-453-2780	{5}	5 Tomahawk Dr	Los Angeles	Los Angeles	Schroer, Gene E Esq
202	Timothy	Mulqueen	timothy_mulqueen@mulqueen.org	\N	718-332-6527	{5}	44 W 4th St	Staten Island	Richmond	Saronix Nymph Products
226	Moon	Parlato	moon@yahoo.com	\N	585-866-8313	{5}	74989 Brandon St	Wellsville	Allegany	Ambelang, Jessica M Md
232	Bobbye	Rhym	brhym@rhym.com	\N	650-528-5783	{5}	30 W 80th St #1995	San Carlos	San Mateo	Smits, Patricia Garity
163	Cammy	Albares	calbares@gmail.com	\N	956-537-6195	{5}	56 E Morehead St	Laredo	Webb	Rousseaux, Michael Esq
164	Allene	Iturbide	allene_iturbide@cox.net	\N	715-662-6764	{5}	1 Central Ave	Stevens Point	Portage	Ledecky, David Esq
238	Josephine	Darakjy	josephine_darakjy@darakjy.org	\N	810-292-9388	{6}	4 B Blue Ridge Blvd	Brighton	Livingston	Chanay, Jeffrey A Esq
246	Abel	Maclead	amaclead@gmail.com	\N	631-335-3414	{6}	37275 St  Rt 17m M	Middle Island	Suffolk	Rangoni Of Florence
259	Dominque	Dickerson	dominque.dickerson@dickerson.org	\N	510-993-3758	{6}	69 Marquette Ave	Hayward	Alameda	E A I Electronic Assocs Inc
264	Wilda	Giguere	wilda@cox.net	\N	907-870-5536	{6}	1747 Calle Amanecer #2	Anchorage	Anchorage	Mclaughlin, Luther W Cpa
276	Arlette	Honeywell	ahoneywell@honeywell.com	\N	904-775-4480	{6}	11279 Loytan St	Jacksonville	Duval	Smc Inc
290	Penney	Weight	penney_weight@aol.com	\N	907-797-9628	{6}	18 Fountain St	Anchorage	Anchorage	Hawaiian King Hotel
296	Ilene	Eroman	ilene.eroman@hotmail.com	\N	410-914-9018	{6}	2853 S Central Expy	Glen Burnie	Anne Arundel	Robinson, William J Esq
306	Carmelina	Lindall	carmelina_lindall@lindall.com	\N	303-724-7371	{6}	2664 Lewis Rd	Littleton	Douglas	George Jessop Carter Jewelers
321	Kati	Rulapaugh	kati.rulapaugh@hotmail.com	\N	785-463-7829	{6}	6980 Dorsett Rd	Abilene	Dickinson	Eder Assocs Consltng Engrs Pc
331	Sabra	Uyetake	sabra@uyetake.org	\N	803-925-5213	{6}	98839 Hawthorne Blvd #6101	Columbia	Richland	Lowy Limousine Service
333	Blair	Malet	bmalet@yahoo.com	\N	215-907-9111	{6}	209 Decker Dr	Philadelphia	Philadelphia	Bollinger Mach Shp & Shipyard
239	James	Butt	jbutt@gmail.com	\N	504-621-8927	{6}	6649 N Blue Gum St	New Orleans	Orleans	Benton, John B Jr
269	Minna	Amigon	minna_amigon@yahoo.com	\N	215-874-1229	{6}	2371 Jerrold Ave	Kulpsville	Montgomery	Dorl, James J Esq
278	Delisa	Crupi	delisa.crupi@crupi.com	\N	973-354-2040	{6}	47565 W Grand Ave	Newark	Essex	Wood & Whitacre Contractors
280	Johnetta	Abdallah	johnetta_abdallah@aol.com	\N	919-225-9345	{6}	1088 Pinehurst St	Chapel Hill	Orange	Forging Specialties
283	Bette	Nicka	bette_nicka@cox.net	\N	610-545-3615	{6}	6 S 33rd St	Aston	Delaware	Sport En Art
291	Alisha	Slusarski	alisha@slusarski.com	\N	732-658-3154	{6}	3273 State St	Middlesex	Middlesex	Wtlz Power 107 Fm
297	Ezekiel	Chui	ezekiel@chui.com	\N	410-669-1642	{6}	2 Cedar Ave #84	Easton	Talbot	Sider, Donald C Esq
308	Cecily	Hollack	cecily@hollack.org	\N	512-486-3817	{6}	59 N Groesbeck Hwy	Austin	Travis	Arthur A Oliver & Son Inc
318	Amber	Monarrez	amber_monarrez@monarrez.org	\N	215-934-8655	{6}	14288 Foster Ave #4121	Jenkintown	Montgomery	Branford Wire & Mfg Co
329	Marjory	Mastella	mmastella@mastella.com	\N	610-814-5533	{6}	71 San Mateo Ave	Wayne	Delaware	Vicon Corporation
240	Leota	Dilliard	leota@hotmail.com	\N	408-752-3500	{6}	7 W Jackson Blvd	San Jose	Santa Clara	Commercial Press
248	Lettie	Isenhower	lettie_isenhower@yahoo.com	\N	216-657-7668	{6}	70 W Main St	Beachwood	Cuyahoga	Conte, Christopher A Esq
257	Tyra	Shields	tshields@gmail.com	\N	215-255-1641	{6}	3 Fort Worth Ave	Philadelphia	Philadelphia	Assink, Anne H Esq
266	Danica	Bruschke	danica_bruschke@gmail.com	\N	254-782-8569	{6}	840 15th Ave	Waco	McLennan	Stevens, Charles T
273	Mattie	Poquette	mattie@aol.com	\N	602-277-4385	{6}	73 State Road 434 E	Phoenix	Maricopa	Century Communications
287	Willard	Kolmetz	willard@hotmail.com	\N	972-303-9197	{6}	618 W Yakima Ave	Irving	Dallas	Ingalls, Donald R Esq
292	Kallie	Blackwood	kallie.blackwood@gmail.com	\N	415-315-2761	{6}	701 S Harrison Rd	San Francisco	San Francisco	Rowley Schlimgen Inc
295	Chanel	Caudy	chanel.caudy@caudy.org	\N	913-388-2079	{6}	86 Nw 66th St #8673	Shawnee	Johnson	Professional Image Inc
309	Albina	Glick	albina@glick.com	\N	732-924-7882	{6}	4 Ralph Ct	Dunellen	Middlesex	Giampetro, Anthony D
320	Lorrie	Nestle	lnestle@hotmail.com	\N	931-875-6644	{6}	39 S 7th St	Tullahoma	Coffee	Ballard Spahr Andrews
328	Roxane	Campain	roxane@hotmail.com	\N	907-231-4722	{6}	1048 Main St	Fairbanks	Fairbanks North Star	Rapid Trading Intl
241	Donette	Foller	donette.foller@cox.net	\N	513-570-1893	{6}	34 Center St	Hamilton	Butler	Printing Dimensions
250	Myra	Munns	mmunns@cox.net	\N	817-914-7518	{6}	461 Prospect Pl #316	Euless	Tarrant	Anker Law Office
255	Stephen	Emigh	stephen_emigh@hotmail.com	\N	330-537-5358	{6}	3777 E Richmond St #900	Akron	Summit	Sharp, J Daniel Esq
267	Graciela	Ruta	gruta@cox.net	\N	440-780-8425	{6}	98 Connecticut Ave Nw	Chagrin Falls	Geauga	Buckley Miller & Wright
272	Elza	Lipke	elza@yahoo.com	\N	973-927-3447	{6}	6794 Lake Dr E	Newark	Essex	Museum Of Science & Industry
285	Micaela	Rhymes	micaela_rhymes@gmail.com	\N	925-647-3298	{6}	20932 Hedley St	Concord	Contra Costa	H Lee Leonard Attorney At Law
294	Vallie	Mondella	vmondella@mondella.com	\N	208-862-5339	{6}	74 W College St	Boise	Ada	Private Properties
302	Tawna	Buvens	tawna@gmail.com	\N	212-674-9610	{6}	3305 Nabell Ave #679	New York	New York	H H H Enterprises Inc
311	Alishia	Sergi	asergi@gmail.com	\N	212-860-1579	{6}	2742 Distribution Way	New York	New York	Milford Enterprises Inc
317	Valentine	Gillian	valentine_gillian@gmail.com	\N	210-812-9597	{6}	775 W 17th St	San Antonio	Bexar	Fbs Business Finance
327	Karl	Klonowski	karl_klonowski@yahoo.com	\N	908-877-6135	{6}	76 Brooks St #9	Flemington	Hunterdon	Rossi, Michael M
336	Kanisha	Waycott	kanisha_waycott@yahoo.com	\N	323-453-2780	{6}	5 Tomahawk Dr	Los Angeles	Los Angeles	Schroer, Gene E Esq
242	Art	Venere	art@venere.org	\N	856-636-8749	{6}	8 W Cerritos Ave #54	Bridgeport	Gloucester	Chemel, James L Cpa
249	Devorah	Chickering	devorah@hotmail.com	\N	505-975-8559	{6}	31 Douglas Blvd #950	Clovis	Curry	Garrison Ind
256	Lisha	Centini	lisha@centini.org	\N	703-235-3937	{6}	64 5th Ave #1153	Mc Lean	Fairfax	Industrial Paper Shredders Inc
262	Elvera	Benimadho	elvera.benimadho@cox.net	\N	408-703-8505	{6}	99385 Charity St #840	San Jose	Santa Clara	Tree Musketeers
274	Viva	Toelkes	viva.toelkes@gmail.com	\N	773-446-5569	{6}	4284 Dorigo Ln	Chicago	Cook	Mark Iv Press Ltd
288	Bobbye	Rhym	brhym@rhym.com	\N	650-528-5783	{6}	30 W 80th St #1995	San Carlos	San Mateo	Smits, Patricia Garity
299	Willow	Kusko	wkusko@yahoo.com	\N	212-582-4976	{6}	90991 Thorburn Ave	New York	New York	U Pull It
304	Maurine	Yglesias	maurine_yglesias@yglesias.com	\N	414-748-1374	{6}	59 Shady Ln #53	Milwaukee	Milwaukee	Schultz, Thomas C Md
313	Solange	Shinko	solange@shinko.com	\N	504-979-9175	{6}	426 Wolf St	Metairie	Jefferson	Mosocco, Ronald A
322	Fatima	Saylors	fsaylors@saylors.org	\N	952-768-2416	{6}	2 Lighthouse Ave	Hopkins	Hennepin	Stanton, James D Esq
324	Youlanda	Schemmer	youlanda@aol.com	\N	541-548-8197	{6}	2881 Lewis Rd	Prineville	Crook	Tri M Tool Inc
72	Maurine	Yglesias	maurine_yglesias@yglesias.com	\N	414-748-1374	{5}	59 Shady Ln #53	Milwaukee	Milwaukee	Schultz, Thomas C Md
85	Lai	Gato	lai.gato@gato.org	\N	847-728-7286	{5}	37 Alabama Ave	Evanston	Cook	Fligg, Kenneth I Jr
98	Albina	Glick	albina@glick.com	\N	732-924-7882	{5}	4 Ralph Ct	Dunellen	Middlesex	Giampetro, Anthony D
107	Fatima	Saylors	fsaylors@saylors.org	\N	952-768-2416	{5}	2 Lighthouse Ave	Hopkins	Hennepin	Stanton, James D Esq
109	Youlanda	Schemmer	youlanda@aol.com	\N	541-548-8197	{5}	2881 Lewis Rd	Prineville	Crook	Tri M Tool Inc
121	Vallie	Mondella	vmondella@mondella.com	\N	208-862-5339	{5}	74 W College St	Boise	Ada	Private Properties
138	Blondell	Pugh	bpugh@aol.com	\N	401-960-8259	{5}	201 Hawk Ct	Providence	Providence	Alpenlite Inc
243	Mitsue	Tollner	mitsue_tollner@yahoo.com	\N	773-573-6914	{6}	7 Eads St	Chicago	Cook	Morlong Associates
247	Laurel	Reitler	laurel_reitler@reitler.com	\N	410-520-4832	{6}	6 Kains Ave	Baltimore	Baltimore City	Q A Service
252	Lai	Gato	lai.gato@gato.org	\N	847-728-7286	{6}	37 Alabama Ave	Evanston	Cook	Fligg, Kenneth I Jr
254	Carma	Vanheusen	carma@cox.net	\N	510-503-7169	{6}	68556 Central Hwy	San Leandro	Alameda	Springfield Div Oh Edison Co
268	Cory	Gibes	cory.gibes@gmail.com	\N	626-572-1096	{6}	83649 W Belmont Ave	San Gabriel	Los Angeles	Chinese Translation Resources
271	Kris	Marrier	kris@gmail.com	\N	410-655-8723	{6}	228 Runamuck Pl #2808	Baltimore	Baltimore City	King, Christopher A Esq
281	Fletcher	Flosi	fletcher.flosi@yahoo.com	\N	815-828-2147	{6}	394 Manchester Blvd	Rockford	Winnebago	Post Box Services Plus
282	Moon	Parlato	moon@yahoo.com	\N	585-866-8313	{6}	74989 Brandon St	Wellsville	Allegany	Ambelang, Jessica M Md
301	Bernardo	Figeroa	bfigeroa@aol.com	\N	936-336-3951	{6}	386 9th Ave N	Conroe	Montgomery	Clark, Richard Cpa
305	Francine	Vocelka	francine_vocelka@vocelka.com	\N	505-977-3911	{6}	366 South Dr	Las Cruces	Dona Ana	Cascade Realty Advisors Inc
315	Jose	Stockham	jose@yahoo.com	\N	212-675-8570	{6}	128 Bransten Rd	New York	New York	Tri State Refueler Co
325	Tonette	Wenner	twenner@aol.com	\N	516-968-6051	{6}	4545 Courthouse Rd	Westbury	Nassau	Northwest Publishing
334	Jina	Briddick	jina_briddick@briddick.com	\N	617-399-5124	{6}	38938 Park Blvd	Boston	Suffolk	Grace Pastries Inc
244	Simona	Morasca	simona@morasca.com	\N	419-503-2484	{6}	3 Mcauley Dr	Ashland	Ashland	Chapman, Ross E Esq
260	Malinda	Hochard	malinda.hochard@yahoo.com	\N	317-722-5066	{6}	55 Riverside Ave	Indianapolis	Marion	Logan Memorial Hospital
263	Kiley	Caldarera	kiley.caldarera@aol.com	\N	310-498-5651	{6}	25 E 75th St #69	Los Angeles	Los Angeles	Feiner Bros
275	Meaghan	Garufi	meaghan@hotmail.com	\N	931-313-9635	{6}	69734 E Carrillo St	Mc Minnville	Warren	Bolton, Wilbur Esq
289	Maryann	Royster	mroyster@royster.com	\N	518-966-7987	{6}	74 S Westgate St	Albany	Albany	Franklin, Peter L Esq
293	Allene	Iturbide	allene_iturbide@cox.net	\N	715-662-6764	{6}	1 Central Ave	Stevens Point	Portage	Ledecky, David Esq
303	Ammie	Corrio	ammie@corrio.com	\N	614-801-9788	{6}	74874 Atlantic Ave	Columbus	Franklin	Moskowitz, Barry S
312	Deeanna	Juhas	deeanna_juhas@gmail.com	\N	215-211-9589	{6}	14302 Pennsylvania Ave	Huntingdon Valley	Montgomery	Healy, George W Iv
319	Rozella	Ostrosky	rozella.ostrosky@ostrosky.com	\N	805-832-6163	{6}	17 Morena Blvd	Camarillo	Ventura	Parkway Company
330	Lavera	Perin	lperin@perin.org	\N	305-606-7291	{6}	678 3rd Ave	Miami	Miami-Dade	Abc Enterprises Inc
332	Erick	Ferencz	erick.ferencz@aol.com	\N	907-741-1044	{6}	20 S Babcock St	Fairbanks	Fairbanks North Star	Cindy Turner Associates
245	Lenna	Paprocki	lpaprocki@hotmail.com	\N	907-385-4412	{6}	639 Main St	Anchorage	Anchorage	Feltz Printing Service
258	Natalie	Fern	natalie.fern@hotmail.com	\N	307-704-8713	{6}	7140 University Ave	Rock Springs	Sweetwater	Kelly, Charles G Esq
265	Cammy	Albares	calbares@gmail.com	\N	956-537-6195	{6}	56 E Morehead St	Laredo	Webb	Rousseaux, Michael Esq
270	Stephaine	Barfield	stephaine@barfield.com	\N	310-774-7643	{6}	47154 Whipple Ave Nw	Gardena	Los Angeles	Beutelschies & Company
286	Veronika	Inouye	vinouye@aol.com	\N	408-540-1785	{6}	6 Greenleaf Ave	San Jose	Santa Clara	C 4 Network Inc
300	Jamal	Vanausdal	jamal@vanausdal.org	\N	732-234-1546	{6}	53075 Sw 152nd Ter #615	Monroe Township	Middlesex	Hubbard, Bruce Esq
307	Ernie	Stenseth	ernie_stenseth@aol.com	\N	201-709-6245	{6}	45 E Liberty St	Ridgefield Park	Bergen	Knwz Newsradio
316	Shenika	Seewald	shenika@gmail.com	\N	818-423-4007	{6}	4 Otis St	Van Nuys	Los Angeles	East Coast Marketing
326	Dyan	Oldroyd	doldroyd@aol.com	\N	913-413-4604	{6}	7219 Woodfield Rd	Overland Park	Johnson	International Eyelets Inc
335	Emerson	Bowley	emerson.bowley@bowley.org	\N	608-336-7444	{6}	762 S Main St	Madison	Dane	Knights Inn
251	Sage	Wieser	sage_wieser@cox.net	\N	605-414-2147	{6}	5 Boston Ave #88	Sioux Falls	Minnehaha	Truhlar And Truhlar Attys
253	Tammara	Wardrip	twardrip@cox.net	\N	650-803-1936	{6}	4800 Black Horse Pike	Burlingame	San Mateo	Jewel My Shop Inc
261	Timothy	Mulqueen	timothy_mulqueen@mulqueen.org	\N	718-332-6527	{6}	44 W 4th St	Staten Island	Richmond	Saronix Nymph Products
277	Gladys	Rim	gladys.rim@rim.org	\N	414-661-9598	{6}	322 New Horizon Blvd	Milwaukee	Milwaukee	T M Byxbee Company Pc
279	Yuki	Whobrey	yuki_whobrey@aol.com	\N	313-288-7937	{6}	1 State Route 27	Taylor	Wayne	Farmers Insurance Group
284	Tamar	Hoogland	tamar@hotmail.com	\N	740-343-8575	{6}	2737 Pistorio Rd #9230	London	Madison	A K Construction Co
298	Elly	Morocco	elly_morocco@gmail.com	\N	814-393-5571	{6}	7 W 32nd St	Erie	Erie	Killion Industries
310	Blondell	Pugh	bpugh@aol.com	\N	401-960-8259	{6}	201 Hawk Ct	Providence	Providence	Alpenlite Inc
314	Delmy	Ahle	delmy.ahle@hotmail.com	\N	401-458-2547	{6}	65895 S 16th St	Providence	Providence	Wye Technologies Inc
323	Brock	Bolognia	bbolognia@yahoo.com	\N	212-402-9216	{6}	4486 W O St #1	New York	New York	Orinda News
337	James	Butt	jbutt@gmail.com	\N	504-621-8927	{6}	6649 N Blue Gum St	New Orleans	Orleans	Benton, John B Jr
339	Kris	Marrier	kris@gmail.com	\N	410-655-8723	{6}	228 Runamuck Pl #2808	Baltimore	Baltimore City	King, Christopher A Esq
342	Abel	Maclead	amaclead@gmail.com	\N	631-335-3414	{6}	37275 St  Rt 17m M	Middle Island	Suffolk	Rangoni Of Florence
354	Gladys	Rim	gladys.rim@rim.org	\N	414-661-9598	{6}	322 New Horizon Blvd	Milwaukee	Milwaukee	T M Byxbee Company Pc
360	Maryann	Royster	mroyster@royster.com	\N	518-966-7987	{6}	74 S Westgate St	Albany	Albany	Franklin, Peter L Esq
411	Johnetta	Abdallah	johnetta_abdallah@aol.com	\N	919-225-9345	{6}	1088 Pinehurst St	Chapel Hill	Orange	Forging Specialties
338	Josephine	Darakjy	josephine_darakjy@darakjy.org	\N	810-292-9388	{6}	4 B Blue Ridge Blvd	Brighton	Livingston	Chanay, Jeffrey A Esq
343	Minna	Amigon	minna_amigon@yahoo.com	\N	215-874-1229	{6}	2371 Jerrold Ave	Kulpsville	Montgomery	Dorl, James J Esq
355	Yuki	Whobrey	yuki_whobrey@aol.com	\N	313-288-7937	{6}	1 State Route 27	Taylor	Wayne	Farmers Insurance Group
363	Bernardo	Figeroa	bfigeroa@aol.com	\N	936-336-3951	{6}	386 9th Ave N	Conroe	Montgomery	Clark, Richard Cpa
373	Jose	Stockham	jose@yahoo.com	\N	212-675-8570	{6}	128 Bransten Rd	New York	New York	Tri State Refueler Co
374	Rozella	Ostrosky	rozella.ostrosky@ostrosky.com	\N	805-832-6163	{6}	17 Morena Blvd	Camarillo	Ventura	Parkway Company
378	Dyan	Oldroyd	doldroyd@aol.com	\N	913-413-4604	{6}	7219 Woodfield Rd	Overland Park	Johnson	International Eyelets Inc
381	Erick	Ferencz	erick.ferencz@aol.com	\N	907-741-1044	{6}	20 S Babcock St	Fairbanks	Fairbanks North Star	Cindy Turner Associates
395	Elly	Morocco	elly_morocco@gmail.com	\N	814-393-5571	{6}	7 W 32nd St	Erie	Erie	Killion Industries
397	Tamar	Hoogland	tamar@hotmail.com	\N	740-343-8575	{6}	2737 Pistorio Rd #9230	London	Madison	A K Construction Co
399	Shenika	Seewald	shenika@gmail.com	\N	818-423-4007	{6}	4 Otis St	Van Nuys	Los Angeles	East Coast Marketing
402	Karl	Klonowski	karl_klonowski@yahoo.com	\N	908-877-6135	{6}	76 Brooks St #9	Flemington	Hunterdon	Rossi, Michael M
409	Penney	Weight	penney_weight@aol.com	\N	907-797-9628	{6}	18 Fountain St	Anchorage	Anchorage	Hawaiian King Hotel
415	Devorah	Chickering	devorah@hotmail.com	\N	505-975-8559	{6}	31 Douglas Blvd #950	Clovis	Curry	Garrison Ind
423	Lai	Gato	lai.gato@gato.org	\N	847-728-7286	{6}	37 Alabama Ave	Evanston	Cook	Fligg, Kenneth I Jr
429	Danica	Bruschke	danica_bruschke@gmail.com	\N	254-782-8569	{6}	840 15th Ave	Waco	McLennan	Stevens, Charles T
431	Elvera	Benimadho	elvera.benimadho@cox.net	\N	408-703-8505	{6}	99385 Charity St #840	San Jose	Santa Clara	Tree Musketeers
340	Art	Venere	art@venere.org	\N	856-636-8749	{6}	8 W Cerritos Ave #54	Bridgeport	Gloucester	Chemel, James L Cpa
413	Kallie	Blackwood	kallie.blackwood@gmail.com	\N	415-315-2761	{6}	701 S Harrison Rd	San Francisco	San Francisco	Rowley Schlimgen Inc
416	Myra	Munns	mmunns@cox.net	\N	817-914-7518	{6}	461 Prospect Pl #316	Euless	Tarrant	Anker Law Office
420	Delisa	Crupi	delisa.crupi@crupi.com	\N	973-354-2040	{6}	47565 W Grand Ave	Newark	Essex	Wood & Whitacre Contractors
74	Johnetta	Abdallah	johnetta_abdallah@aol.com	\N	919-225-9345	{5}	1088 Pinehurst St	Chapel Hill	Orange	Forging Specialties
88	Willow	Kusko	wkusko@yahoo.com	\N	212-582-4976	{5}	90991 Thorburn Ave	New York	New York	U Pull It
96	Kati	Rulapaugh	kati.rulapaugh@hotmail.com	\N	785-463-7829	{5}	6980 Dorsett Rd	Abilene	Dickinson	Eder Assocs Consltng Engrs Pc
101	Stephaine	Barfield	stephaine@barfield.com	\N	310-774-7643	{5}	47154 Whipple Ave Nw	Gardena	Los Angeles	Beutelschies & Company
114	Viva	Toelkes	viva.toelkes@gmail.com	\N	773-446-5569	{5}	4284 Dorigo Ln	Chicago	Cook	Mark Iv Press Ltd
341	Lenna	Paprocki	lpaprocki@hotmail.com	\N	907-385-4412	{6}	639 Main St	Anchorage	Anchorage	Feltz Printing Service
366	Willow	Kusko	wkusko@yahoo.com	\N	212-582-4976	{6}	90991 Thorburn Ave	New York	New York	U Pull It
369	Ernie	Stenseth	ernie_stenseth@aol.com	\N	201-709-6245	{6}	45 E Liberty St	Ridgefield Park	Bergen	Knwz Newsradio
408	Ilene	Eroman	ilene.eroman@hotmail.com	\N	410-914-9018	{6}	2853 S Central Expy	Glen Burnie	Anne Arundel	Robinson, William J Esq
422	Timothy	Mulqueen	timothy_mulqueen@mulqueen.org	\N	718-332-6527	{6}	44 W 4th St	Staten Island	Richmond	Saronix Nymph Products
344	Simona	Morasca	simona@morasca.com	\N	419-503-2484	{6}	3 Mcauley Dr	Ashland	Ashland	Chapman, Ross E Esq
353	Meaghan	Garufi	meaghan@hotmail.com	\N	931-313-9635	{6}	69734 E Carrillo St	Mc Minnville	Warren	Bolton, Wilbur Esq
359	Willard	Kolmetz	willard@hotmail.com	\N	972-303-9197	{6}	618 W Yakima Ave	Irving	Dallas	Ingalls, Donald R Esq
412	Maurine	Yglesias	maurine_yglesias@yglesias.com	\N	414-748-1374	{6}	59 Shady Ln #53	Milwaukee	Milwaukee	Schultz, Thomas C Md
345	Donette	Foller	donette.foller@cox.net	\N	513-570-1893	{6}	34 Center St	Hamilton	Butler	Printing Dimensions
351	Mattie	Poquette	mattie@aol.com	\N	602-277-4385	{6}	73 State Road 434 E	Phoenix	Maricopa	Century Communications
356	Fletcher	Flosi	fletcher.flosi@yahoo.com	\N	815-828-2147	{6}	394 Manchester Blvd	Rockford	Winnebago	Post Box Services Plus
357	Bette	Nicka	bette_nicka@cox.net	\N	610-545-3615	{6}	6 S 33rd St	Aston	Delaware	Sport En Art
358	Veronika	Inouye	vinouye@aol.com	\N	408-540-1785	{6}	6 Greenleaf Ave	San Jose	Santa Clara	C 4 Network Inc
362	Alisha	Slusarski	alisha@slusarski.com	\N	732-658-3154	{6}	3273 State St	Middlesex	Middlesex	Wtlz Power 107 Fm
370	Albina	Glick	albina@glick.com	\N	732-924-7882	{6}	4 Ralph Ct	Dunellen	Middlesex	Giampetro, Anthony D
377	Youlanda	Schemmer	youlanda@aol.com	\N	541-548-8197	{6}	2881 Lewis Rd	Prineville	Crook	Tri M Tool Inc
379	Roxane	Campain	roxane@hotmail.com	\N	907-231-4722	{6}	1048 Main St	Fairbanks	Fairbanks North Star	Rapid Trading Intl
380	Lavera	Perin	lperin@perin.org	\N	305-606-7291	{6}	678 3rd Ave	Miami	Miami-Dade	Abc Enterprises Inc
382	Jina	Briddick	jina_briddick@briddick.com	\N	617-399-5124	{6}	38938 Park Blvd	Boston	Suffolk	Grace Pastries Inc
384	Kanisha	Waycott	kanisha_waycott@yahoo.com	\N	323-453-2780	{6}	5 Tomahawk Dr	Los Angeles	Los Angeles	Schroer, Gene E Esq
386	Emerson	Bowley	emerson.bowley@bowley.org	\N	608-336-7444	{6}	762 S Main St	Madison	Dane	Knights Inn
387	Blair	Malet	bmalet@yahoo.com	\N	215-907-9111	{6}	209 Decker Dr	Philadelphia	Philadelphia	Bollinger Mach Shp & Shipyard
390	Lorrie	Nestle	lnestle@hotmail.com	\N	931-875-6644	{6}	39 S 7th St	Tullahoma	Coffee	Ballard Spahr Andrews
392	Amber	Monarrez	amber_monarrez@monarrez.org	\N	215-934-8655	{6}	14288 Foster Ave #4121	Jenkintown	Montgomery	Branford Wire & Mfg Co
394	Tyra	Shields	tshields@gmail.com	\N	215-255-1641	{6}	3 Fort Worth Ave	Philadelphia	Philadelphia	Assink, Anne H Esq
396	Micaela	Rhymes	micaela_rhymes@gmail.com	\N	925-647-3298	{6}	20932 Hedley St	Concord	Contra Costa	H Lee Leonard Attorney At Law
398	Moon	Parlato	moon@yahoo.com	\N	585-866-8313	{6}	74989 Brandon St	Wellsville	Allegany	Ambelang, Jessica M Md
401	Marjory	Mastella	mmastella@mastella.com	\N	610-814-5533	{6}	71 San Mateo Ave	Wayne	Delaware	Vicon Corporation
404	Tawna	Buvens	tawna@gmail.com	\N	212-674-9610	{6}	3305 Nabell Ave #679	New York	New York	H H H Enterprises Inc
410	Vallie	Mondella	vmondella@mondella.com	\N	208-862-5339	{6}	74 W College St	Boise	Ada	Private Properties
417	Stephaine	Barfield	stephaine@barfield.com	\N	310-774-7643	{6}	47154 Whipple Ave Nw	Gardena	Los Angeles	Beutelschies & Company
346	Sage	Wieser	sage_wieser@cox.net	\N	605-414-2147	{6}	5 Boston Ave #88	Sioux Falls	Minnehaha	Truhlar And Truhlar Attys
352	Cammy	Albares	calbares@gmail.com	\N	956-537-6195	{6}	56 E Morehead St	Laredo	Webb	Rousseaux, Michael Esq
361	Allene	Iturbide	allene_iturbide@cox.net	\N	715-662-6764	{6}	1 Central Ave	Stevens Point	Portage	Ledecky, David Esq
371	Alishia	Sergi	asergi@gmail.com	\N	212-860-1579	{6}	2742 Distribution Way	New York	New York	Milford Enterprises Inc
407	Carmelina	Lindall	carmelina_lindall@lindall.com	\N	303-724-7371	{6}	2664 Lewis Rd	Littleton	Douglas	George Jessop Carter Jewelers
421	Viva	Toelkes	viva.toelkes@gmail.com	\N	773-446-5569	{6}	4284 Dorigo Ln	Chicago	Cook	Mark Iv Press Ltd
430	Wilda	Giguere	wilda@cox.net	\N	907-870-5536	{6}	1747 Calle Amanecer #2	Anchorage	Anchorage	Mclaughlin, Luther W Cpa
433	Malinda	Hochard	malinda.hochard@yahoo.com	\N	317-722-5066	{6}	55 Riverside Ave	Indianapolis	Marion	Logan Memorial Hospital
347	Mitsue	Tollner	mitsue_tollner@yahoo.com	\N	773-573-6914	{6}	7 Eads St	Chicago	Cook	Morlong Associates
350	Graciela	Ruta	gruta@cox.net	\N	440-780-8425	{6}	98 Connecticut Ave Nw	Chagrin Falls	Geauga	Buckley Miller & Wright
365	Ezekiel	Chui	ezekiel@chui.com	\N	410-669-1642	{6}	2 Cedar Ave #84	Easton	Talbot	Sider, Donald C Esq
368	Francine	Vocelka	francine_vocelka@vocelka.com	\N	505-977-3911	{6}	366 South Dr	Las Cruces	Dona Ana	Cascade Realty Advisors Inc
376	Kati	Rulapaugh	kati.rulapaugh@hotmail.com	\N	785-463-7829	{6}	6980 Dorsett Rd	Abilene	Dickinson	Eder Assocs Consltng Engrs Pc
406	Cecily	Hollack	cecily@hollack.org	\N	512-486-3817	{6}	59 N Groesbeck Hwy	Austin	Travis	Arthur A Oliver & Son Inc
418	Laurel	Reitler	laurel_reitler@reitler.com	\N	410-520-4832	{6}	6 Kains Ave	Baltimore	Baltimore City	Q A Service
424	Dominque	Dickerson	dominque.dickerson@dickerson.org	\N	510-993-3758	{6}	69 Marquette Ave	Hayward	Alameda	E A I Electronic Assocs Inc
426	Lettie	Isenhower	lettie_isenhower@yahoo.com	\N	216-657-7668	{6}	70 W Main St	Beachwood	Cuyahoga	Conte, Christopher A Esq
428	Tammara	Wardrip	twardrip@cox.net	\N	650-803-1936	{6}	4800 Black Horse Pike	Burlingame	San Mateo	Jewel My Shop Inc
432	Carma	Vanheusen	carma@cox.net	\N	510-503-7169	{6}	68556 Central Hwy	San Leandro	Alameda	Springfield Div Oh Edison Co
435	Lisha	Centini	lisha@centini.org	\N	703-235-3937	{6}	64 5th Ave #1153	Mc Lean	Fairfax	Industrial Paper Shredders Inc
348	Leota	Dilliard	leota@hotmail.com	\N	408-752-3500	{6}	7 W Jackson Blvd	San Jose	Santa Clara	Commercial Press
349	Kiley	Caldarera	kiley.caldarera@aol.com	\N	310-498-5651	{6}	25 E 75th St #69	Los Angeles	Los Angeles	Feiner Bros
364	Chanel	Caudy	chanel.caudy@caudy.org	\N	913-388-2079	{6}	86 Nw 66th St #8673	Shawnee	Johnson	Professional Image Inc
367	Ammie	Corrio	ammie@corrio.com	\N	614-801-9788	{6}	74874 Atlantic Ave	Columbus	Franklin	Moskowitz, Barry S
372	Solange	Shinko	solange@shinko.com	\N	504-979-9175	{6}	426 Wolf St	Metairie	Jefferson	Mosocco, Ronald A
375	Valentine	Gillian	valentine_gillian@gmail.com	\N	210-812-9597	{6}	775 W 17th St	San Antonio	Bexar	Fbs Business Finance
383	Fatima	Saylors	fsaylors@saylors.org	\N	952-768-2416	{6}	2 Lighthouse Ave	Hopkins	Hennepin	Stanton, James D Esq
385	Brock	Bolognia	bbolognia@yahoo.com	\N	212-402-9216	{6}	4486 W O St #1	New York	New York	Orinda News
388	Jamal	Vanausdal	jamal@vanausdal.org	\N	732-234-1546	{6}	53075 Sw 152nd Ter #615	Monroe Township	Middlesex	Hubbard, Bruce Esq
389	Blondell	Pugh	bpugh@aol.com	\N	401-960-8259	{6}	201 Hawk Ct	Providence	Providence	Alpenlite Inc
391	Sabra	Uyetake	sabra@uyetake.org	\N	803-925-5213	{6}	98839 Hawthorne Blvd #6101	Columbia	Richland	Lowy Limousine Service
393	Arlette	Honeywell	ahoneywell@honeywell.com	\N	904-775-4480	{6}	11279 Loytan St	Jacksonville	Duval	Smc Inc
400	Delmy	Ahle	delmy.ahle@hotmail.com	\N	401-458-2547	{6}	65895 S 16th St	Providence	Providence	Wye Technologies Inc
403	Tonette	Wenner	twenner@aol.com	\N	516-968-6051	{6}	4545 Courthouse Rd	Westbury	Nassau	Northwest Publishing
405	Deeanna	Juhas	deeanna_juhas@gmail.com	\N	215-211-9589	{6}	14302 Pennsylvania Ave	Huntingdon Valley	Montgomery	Healy, George W Iv
414	Bobbye	Rhym	brhym@rhym.com	\N	650-528-5783	{6}	30 W 80th St #1995	San Carlos	San Mateo	Smits, Patricia Garity
419	Elza	Lipke	elza@yahoo.com	\N	973-927-3447	{6}	6794 Lake Dr E	Newark	Essex	Museum Of Science & Industry
425	Stephen	Emigh	stephen_emigh@hotmail.com	\N	330-537-5358	{6}	3777 E Richmond St #900	Akron	Summit	Sharp, J Daniel Esq
427	Cory	Gibes	cory.gibes@gmail.com	\N	626-572-1096	{6}	83649 W Belmont Ave	San Gabriel	Los Angeles	Chinese Translation Resources
434	Natalie	Fern	natalie.fern@hotmail.com	\N	307-704-8713	{6}	7140 University Ave	Rock Springs	Sweetwater	Kelly, Charles G Esq
436	Art	Venere	art@venere.org	\N	856-636-8749	{6}	8 W Cerritos Ave #54	Bridgeport	Gloucester	Chemel, James L Cpa
444	Kris	Marrier	kris@gmail.com	\N	410-655-8723	{6}	228 Runamuck Pl #2808	Baltimore	Baltimore City	King, Christopher A Esq
447	Abel	Maclead	amaclead@gmail.com	\N	631-335-3414	{6}	37275 St  Rt 17m M	Middle Island	Suffolk	Rangoni Of Florence
468	Ernie	Stenseth	ernie_stenseth@aol.com	\N	201-709-6245	{6}	45 E Liberty St	Ridgefield Park	Bergen	Knwz Newsradio
478	Dyan	Oldroyd	doldroyd@aol.com	\N	913-413-4604	{6}	7219 Woodfield Rd	Overland Park	Johnson	International Eyelets Inc
479	Lavera	Perin	lperin@perin.org	\N	305-606-7291	{6}	678 3rd Ave	Miami	Miami-Dade	Abc Enterprises Inc
482	Kanisha	Waycott	kanisha_waycott@yahoo.com	\N	323-453-2780	{6}	5 Tomahawk Dr	Los Angeles	Los Angeles	Schroer, Gene E Esq
486	Jina	Briddick	jina_briddick@briddick.com	\N	617-399-5124	{6}	38938 Park Blvd	Boston	Suffolk	Grace Pastries Inc
489	Karl	Klonowski	karl_klonowski@yahoo.com	\N	908-877-6135	{6}	76 Brooks St #9	Flemington	Hunterdon	Rossi, Michael M
494	Delmy	Ahle	delmy.ahle@hotmail.com	\N	401-458-2547	{6}	65895 S 16th St	Providence	Providence	Wye Technologies Inc
75	Lisha	Centini	lisha@centini.org	\N	703-235-3937	{5}	64 5th Ave #1153	Mc Lean	Fairfax	Industrial Paper Shredders Inc
82	Ammie	Corrio	ammie@corrio.com	\N	614-801-9788	{5}	74874 Atlantic Ave	Columbus	Franklin	Moskowitz, Barry S
95	Dominque	Dickerson	dominque.dickerson@dickerson.org	\N	510-993-3758	{5}	69 Marquette Ave	Hayward	Alameda	E A I Electronic Assocs Inc
103	Myra	Munns	mmunns@cox.net	\N	817-914-7518	{5}	461 Prospect Pl #316	Euless	Tarrant	Anker Law Office
112	Elza	Lipke	elza@yahoo.com	\N	973-927-3447	{5}	6794 Lake Dr E	Newark	Essex	Museum Of Science & Industry
122	Kanisha	Waycott	kanisha_waycott@yahoo.com	\N	323-453-2780	{5}	5 Tomahawk Dr	Los Angeles	Los Angeles	Schroer, Gene E Esq
134	Sabra	Uyetake	sabra@uyetake.org	\N	803-925-5213	{5}	98839 Hawthorne Blvd #6101	Columbia	Richland	Lowy Limousine Service
437	Josephine	Darakjy	josephine_darakjy@darakjy.org	\N	810-292-9388	{6}	4 B Blue Ridge Blvd	Brighton	Livingston	Chanay, Jeffrey A Esq
453	Bette	Nicka	bette_nicka@cox.net	\N	610-545-3615	{6}	6 S 33rd St	Aston	Delaware	Sport En Art
466	Ammie	Corrio	ammie@corrio.com	\N	614-801-9788	{6}	74874 Atlantic Ave	Columbus	Franklin	Moskowitz, Barry S
474	Rozella	Ostrosky	rozella.ostrosky@ostrosky.com	\N	805-832-6163	{6}	17 Morena Blvd	Camarillo	Ventura	Parkway Company
483	Emerson	Bowley	emerson.bowley@bowley.org	\N	608-336-7444	{6}	762 S Main St	Madison	Dane	Knights Inn
487	Sabra	Uyetake	sabra@uyetake.org	\N	803-925-5213	{6}	98839 Hawthorne Blvd #6101	Columbia	Richland	Lowy Limousine Service
491	Amber	Monarrez	amber_monarrez@monarrez.org	\N	215-934-8655	{6}	14288 Foster Ave #4121	Jenkintown	Montgomery	Branford Wire & Mfg Co
492	Lorrie	Nestle	lnestle@hotmail.com	\N	931-875-6644	{6}	39 S 7th St	Tullahoma	Coffee	Ballard Spahr Andrews
438	Lenna	Paprocki	lpaprocki@hotmail.com	\N	907-385-4412	{6}	639 Main St	Anchorage	Anchorage	Feltz Printing Service
454	Veronika	Inouye	vinouye@aol.com	\N	408-540-1785	{6}	6 Greenleaf Ave	San Jose	Santa Clara	C 4 Network Inc
467	Francine	Vocelka	francine_vocelka@vocelka.com	\N	505-977-3911	{6}	366 South Dr	Las Cruces	Dona Ana	Cascade Realty Advisors Inc
476	Kati	Rulapaugh	kati.rulapaugh@hotmail.com	\N	785-463-7829	{6}	6980 Dorsett Rd	Abilene	Dickinson	Eder Assocs Consltng Engrs Pc
496	Blondell	Pugh	bpugh@aol.com	\N	401-960-8259	{6}	201 Hawk Ct	Providence	Providence	Alpenlite Inc
439	Donette	Foller	donette.foller@cox.net	\N	513-570-1893	{6}	34 Center St	Hamilton	Butler	Printing Dimensions
452	Fletcher	Flosi	fletcher.flosi@yahoo.com	\N	815-828-2147	{6}	394 Manchester Blvd	Rockford	Winnebago	Post Box Services Plus
457	Meaghan	Garufi	meaghan@hotmail.com	\N	931-313-9635	{6}	69734 E Carrillo St	Mc Minnville	Warren	Bolton, Wilbur Esq
464	Ezekiel	Chui	ezekiel@chui.com	\N	410-669-1642	{6}	2 Cedar Ave #84	Easton	Talbot	Sider, Donald C Esq
477	Roxane	Campain	roxane@hotmail.com	\N	907-231-4722	{6}	1048 Main St	Fairbanks	Fairbanks North Star	Rapid Trading Intl
480	Erick	Ferencz	erick.ferencz@aol.com	\N	907-741-1044	{6}	20 S Babcock St	Fairbanks	Fairbanks North Star	Cindy Turner Associates
484	Blair	Malet	bmalet@yahoo.com	\N	215-907-9111	{6}	209 Decker Dr	Philadelphia	Philadelphia	Bollinger Mach Shp & Shipyard
495	Deeanna	Juhas	deeanna_juhas@gmail.com	\N	215-211-9589	{6}	14302 Pennsylvania Ave	Huntingdon Valley	Montgomery	Healy, George W Iv
440	Mitsue	Tollner	mitsue_tollner@yahoo.com	\N	773-573-6914	{6}	7 Eads St	Chicago	Cook	Morlong Associates
450	Mattie	Poquette	mattie@aol.com	\N	602-277-4385	{6}	73 State Road 434 E	Phoenix	Maricopa	Century Communications
459	Gladys	Rim	gladys.rim@rim.org	\N	414-661-9598	{6}	322 New Horizon Blvd	Milwaukee	Milwaukee	T M Byxbee Company Pc
462	Chanel	Caudy	chanel.caudy@caudy.org	\N	913-388-2079	{6}	86 Nw 66th St #8673	Shawnee	Johnson	Professional Image Inc
469	Albina	Glick	albina@glick.com	\N	732-924-7882	{6}	4 Ralph Ct	Dunellen	Middlesex	Giampetro, Anthony D
470	Alishia	Sergi	asergi@gmail.com	\N	212-860-1579	{6}	2742 Distribution Way	New York	New York	Milford Enterprises Inc
472	Youlanda	Schemmer	youlanda@aol.com	\N	541-548-8197	{6}	2881 Lewis Rd	Prineville	Crook	Tri M Tool Inc
475	Valentine	Gillian	valentine_gillian@gmail.com	\N	210-812-9597	{6}	775 W 17th St	San Antonio	Bexar	Fbs Business Finance
481	Fatima	Saylors	fsaylors@saylors.org	\N	952-768-2416	{6}	2 Lighthouse Ave	Hopkins	Hennepin	Stanton, James D Esq
485	Brock	Bolognia	bbolognia@yahoo.com	\N	212-402-9216	{6}	4486 W O St #1	New York	New York	Orinda News
488	Marjory	Mastella	mmastella@mastella.com	\N	610-814-5533	{6}	71 San Mateo Ave	Wayne	Delaware	Vicon Corporation
490	Tonette	Wenner	twenner@aol.com	\N	516-968-6051	{6}	4545 Courthouse Rd	Westbury	Nassau	Northwest Publishing
493	Shenika	Seewald	shenika@gmail.com	\N	818-423-4007	{6}	4 Otis St	Van Nuys	Los Angeles	East Coast Marketing
499	Carmelina	Lindall	carmelina_lindall@lindall.com	\N	303-724-7371	{6}	2664 Lewis Rd	Littleton	Douglas	George Jessop Carter Jewelers
500	Maurine	Yglesias	maurine_yglesias@yglesias.com	\N	414-748-1374	{6}	59 Shady Ln #53	Milwaukee	Milwaukee	Schultz, Thomas C Md
441	Simona	Morasca	simona@morasca.com	\N	419-503-2484	{6}	3 Mcauley Dr	Ashland	Ashland	Chapman, Ross E Esq
451	Graciela	Ruta	gruta@cox.net	\N	440-780-8425	{6}	98 Connecticut Ave Nw	Chagrin Falls	Geauga	Buckley Miller & Wright
442	James	Butt	jbutt@gmail.com	\N	504-621-8927	{6}	6649 N Blue Gum St	New Orleans	Orleans	Benton, John B Jr
448	Kiley	Caldarera	kiley.caldarera@aol.com	\N	310-498-5651	{6}	25 E 75th St #69	Los Angeles	Los Angeles	Feiner Bros
460	Willard	Kolmetz	willard@hotmail.com	\N	972-303-9197	{6}	618 W Yakima Ave	Irving	Dallas	Ingalls, Donald R Esq
463	Willow	Kusko	wkusko@yahoo.com	\N	212-582-4976	{6}	90991 Thorburn Ave	New York	New York	U Pull It
471	Solange	Shinko	solange@shinko.com	\N	504-979-9175	{6}	426 Wolf St	Metairie	Jefferson	Mosocco, Ronald A
473	Jose	Stockham	jose@yahoo.com	\N	212-675-8570	{6}	128 Bransten Rd	New York	New York	Tri State Refueler Co
497	Jamal	Vanausdal	jamal@vanausdal.org	\N	732-234-1546	{6}	53075 Sw 152nd Ter #615	Monroe Township	Middlesex	Hubbard, Bruce Esq
502	Penney	Weight	penney_weight@aol.com	\N	907-797-9628	{6}	18 Fountain St	Anchorage	Anchorage	Hawaiian King Hotel
443	Sage	Wieser	sage_wieser@cox.net	\N	605-414-2147	{6}	5 Boston Ave #88	Sioux Falls	Minnehaha	Truhlar And Truhlar Attys
449	Cammy	Albares	calbares@gmail.com	\N	956-537-6195	{6}	56 E Morehead St	Laredo	Webb	Rousseaux, Michael Esq
456	Alisha	Slusarski	alisha@slusarski.com	\N	732-658-3154	{6}	3273 State St	Middlesex	Middlesex	Wtlz Power 107 Fm
465	Bernardo	Figeroa	bfigeroa@aol.com	\N	936-336-3951	{6}	386 9th Ave N	Conroe	Montgomery	Clark, Richard Cpa
498	Cecily	Hollack	cecily@hollack.org	\N	512-486-3817	{6}	59 N Groesbeck Hwy	Austin	Travis	Arthur A Oliver & Son Inc
501	Tawna	Buvens	tawna@gmail.com	\N	212-674-9610	{6}	3305 Nabell Ave #679	New York	New York	H H H Enterprises Inc
77	Natalie	Fern	natalie.fern@hotmail.com	\N	307-704-8713	{5}	7140 University Ave	Rock Springs	Sweetwater	Kelly, Charles G Esq
87	Danica	Bruschke	danica_bruschke@gmail.com	\N	254-782-8569	{5}	840 15th Ave	Waco	McLennan	Stevens, Charles T
106	Lavera	Perin	lperin@perin.org	\N	305-606-7291	{5}	678 3rd Ave	Miami	Miami-Dade	Abc Enterprises Inc
115	Brock	Bolognia	bbolognia@yahoo.com	\N	212-402-9216	{5}	4486 W O St #1	New York	New York	Orinda News
125	Ilene	Eroman	ilene.eroman@hotmail.com	\N	410-914-9018	{5}	2853 S Central Expy	Glen Burnie	Anne Arundel	Robinson, William J Esq
130	Amber	Monarrez	amber_monarrez@monarrez.org	\N	215-934-8655	{5}	14288 Foster Ave #4121	Jenkintown	Montgomery	Branford Wire & Mfg Co
137	Cecily	Hollack	cecily@hollack.org	\N	512-486-3817	{5}	59 N Groesbeck Hwy	Austin	Travis	Arthur A Oliver & Son Inc
445	Leota	Dilliard	leota@hotmail.com	\N	408-752-3500	{6}	7 W Jackson Blvd	San Jose	Santa Clara	Commercial Press
446	Minna	Amigon	minna_amigon@yahoo.com	\N	215-874-1229	{6}	2371 Jerrold Ave	Kulpsville	Montgomery	Dorl, James J Esq
455	Yuki	Whobrey	yuki_whobrey@aol.com	\N	313-288-7937	{6}	1 State Route 27	Taylor	Wayne	Farmers Insurance Group
458	Maryann	Royster	mroyster@royster.com	\N	518-966-7987	{6}	74 S Westgate St	Albany	Albany	Franklin, Peter L Esq
461	Allene	Iturbide	allene_iturbide@cox.net	\N	715-662-6764	{6}	1 Central Ave	Stevens Point	Portage	Ledecky, David Esq
71	Elvera	Benimadho	elvera.benimadho@cox.net	\N	408-703-8505	{5}	99385 Charity St #840	San Jose	Santa Clara	Tree Musketeers
81	Tyra	Shields	tshields@gmail.com	\N	215-255-1641	{5}	3 Fort Worth Ave	Philadelphia	Philadelphia	Assink, Anne H Esq
90	Bernardo	Figeroa	bfigeroa@aol.com	\N	936-336-3951	{5}	386 9th Ave N	Conroe	Montgomery	Clark, Richard Cpa
93	Lettie	Isenhower	lettie_isenhower@yahoo.com	\N	216-657-7668	{5}	70 W Main St	Beachwood	Cuyahoga	Conte, Christopher A Esq
99	Timothy	Mulqueen	timothy_mulqueen@mulqueen.org	\N	718-332-6527	{5}	44 W 4th St	Staten Island	Richmond	Saronix Nymph Products
113	Blair	Malet	bmalet@yahoo.com	\N	215-907-9111	{5}	209 Decker Dr	Philadelphia	Philadelphia	Bollinger Mach Shp & Shipyard
120	Jina	Briddick	jina_briddick@briddick.com	\N	617-399-5124	{5}	38938 Park Blvd	Boston	Suffolk	Grace Pastries Inc
136	Marjory	Mastella	mmastella@mastella.com	\N	610-814-5533	{5}	71 San Mateo Ave	Wayne	Delaware	Vicon Corporation
\.


--
-- Data for Name: group_address; Type: TABLE DATA; Schema: public; Owner: black
--

COPY public.group_address (id, group_name, user_id) FROM stdin;
6	 All Staff	\N
5	Students edit	\N
13	Another new	\N
\.


--
-- Data for Name: sentmessages; Type: TABLE DATA; Schema: public; Owner: black
--

COPY public.sentmessages (msgid, receiver, message, sender, status, timesent) FROM stdin;
ATXid_cba2c25767f1ada535d0d4d380218e99	+254708088195	\N	\N	Success	\N
ATXid_a57a614b68b5e0a061a921d546f2dd94	+254738897351	\N	\N	Success	\N
ATXid_74b414ec6939f88e6120c0b9b5587463	+254708088195	this should be my last message	\N	Success	\N
ATXid_ca59e6295ff33daafea0007114dec2b3	+254738897351	this should be my last message	\N	Success	\N
ATXid_52a4c23563859ed711c6e35868c7b403	+254708088195	this is my final one	\N	Success	\N
ATXid_331f5b5b0e44bf2906f30639755eae98	+254738897351	this is my final one	\N	Success	\N
ATXid_4a4be418285289f5e6fd4b65d88b9bc7	+254708088195	another final one then i sleep	\N	Success	\N
ATXid_4fe4f37a38c3ad7b8c9765500b29760d	+254738897351	another final one then i sleep	\N	Success	\N
ATXid_efa11d61e13116e613bd842c6171639c	+254708088195	another final one then i sleep for real	\N	Success	\N
ATXid_25525a932c95bf0565b921a7ada25be3	+254738897351	another final one then i sleep for real	\N	Success	\N
ATXid_4d72faedcc4dac658144e6854d0f5d93	+254708088195	good nigght	\N	Success	\N
ATXid_84314fe0d018a7d602ed421a1eccd36a	+254738897351	good nigght	\N	Success	\N
ATXid_7c449dc9bfd8bce7b298338bf1827630	+254708088195	fsfsfsdfsfdg	companyId	Success	\N
ATXid_c663a107d61b3734cb3f56d7bf215c95	+254708088195	fsfsfsdfsfdg	companyId	Success	\N
ATXid_9b991b4ff4319d8a40b03b3f7cdf634a	+254708088195	ribriabriabriarga	companyId	Success	\N
ATXid_0908ba22edbc463b5bdb1ef789a830c3	+254708088195	ribriabriabriarga	companyId	Success	\N
ATXid_2c202ad316861de7a5420262410e3d7f	+254708088195	ribriabriabriarga	companyId	Success	\N
ATXid_86a3b7db0a39a1baff12ba50c2d73093	+254708088195	my final message	companyId	Success	\N
ATXid_000cf9bb35c085a852e5007485fd8d57	+254708088195	I am going home to sleep	companyId	Success	\N
ATXid_84816838e3df50db8939b3915bdfb4e7	+254708088195	roihroartarar	companyId	Success	\N
ATXid_66388f4a798a9db9ab281ae56ff0e295	+254708088195	one last one	companyId	Success	\N
ATXid_ed17fc51708342c46275fd179b0b25c1	+254708088195	I am Gone bye bye	companyId	Success	\N
ATXid_9df7a14ead34941a13b8f01782726973	+254708088195	I am back	\N	Success	\N
\.


--
-- Data for Name: unsentmessages; Type: TABLE DATA; Schema: public; Owner: black
--

COPY public.unsentmessages (msgid, receiver, message, sender, status, timesent) FROM stdin;
1	+254708088195	\N	\N	\N	\N
2	+254708088195	\N	\N	\N	\N
3	+254708088195	This is timestamp testing	\N	\N	\N
4	+254708088195	This is timestamp testing		\N	\N
5	+254708088195	This is timestamp testing	\N	\N	\N
6	+254708088195	This is timestamp testing 1		\N	\N
7	+254708088195	This is timestamp testing 2		InsufficientBalance	\N
8	+254708088195	This is timestamp testing 3		InsufficientBalance	\N
9	+254708088195	This is timestamp testing 3		InsufficientBalance	2023-12-08 00:46:38
10	+254708088195	This is timestamp testing 3		InsufficientBalance	2023-12-08 00:49:23
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: black
--

COPY public.users (userid, username) FROM stdin;
something	something
something2	something2
something3	something3
something1	something3
1b53691d-a4aa-4a7a-a197-da616d2d8a7b	something new
dfe88dad-36ce-41e9-906d-f75569636cd4	something new 1
9b98b925-d4ff-4c69-bce1-b3a0993fd67f	something new 2
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: black
--

SELECT pg_catalog.setval('public.contacts_id_seq', 502, true);


--
-- Name: group_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: black
--

SELECT pg_catalog.setval('public.group_address_id_seq', 13, true);


--
-- Name: unsentmessages_msgid_seq; Type: SEQUENCE SET; Schema: public; Owner: black
--

SELECT pg_catalog.setval('public.unsentmessages_msgid_seq', 10, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: black
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: group_address group_address_pkey; Type: CONSTRAINT; Schema: public; Owner: black
--

ALTER TABLE ONLY public.group_address
    ADD CONSTRAINT group_address_pkey PRIMARY KEY (id);


--
-- Name: sentmessages sentmessages_pkey; Type: CONSTRAINT; Schema: public; Owner: black
--

ALTER TABLE ONLY public.sentmessages
    ADD CONSTRAINT sentmessages_pkey PRIMARY KEY (msgid);


--
-- Name: unsentmessages unsentmessages_pkey; Type: CONSTRAINT; Schema: public; Owner: black
--

ALTER TABLE ONLY public.unsentmessages
    ADD CONSTRAINT unsentmessages_pkey PRIMARY KEY (msgid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: black
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- PostgreSQL database dump complete
--

