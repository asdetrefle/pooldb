--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administration_group; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE administration_group (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    size integer NOT NULL,
    create_date timestamp with time zone NOT NULL,
    close_date timestamp with time zone
);


ALTER TABLE administration_group OWNER TO qijiec;

--
-- Name: administration_group_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE administration_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administration_group_id_seq OWNER TO qijiec;

--
-- Name: administration_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE administration_group_id_seq OWNED BY administration_group.id;


--
-- Name: administration_league; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE administration_league (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    create_date timestamp with time zone NOT NULL,
    level integer,
    size integer NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE administration_league OWNER TO qijiec;

--
-- Name: administration_league_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE administration_league_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administration_league_id_seq OWNER TO qijiec;

--
-- Name: administration_league_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE administration_league_id_seq OWNED BY administration_league.id;


--
-- Name: administration_member; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE administration_member (
    id integer NOT NULL,
    create_date timestamp with time zone NOT NULL,
    cancel_date timestamp with time zone,
    points double precision NOT NULL,
    ranking integer NOT NULL,
    _point_adj double precision NOT NULL,
    total_matches_played integer NOT NULL,
    total_matches_won integer NOT NULL,
    total_clearance integer NOT NULL,
    season_matches_played integer NOT NULL,
    season_matches_won integer NOT NULL,
    season_clearance integer NOT NULL,
    group_id integer,
    player_id integer NOT NULL,
    raw_points integer NOT NULL,
    handicap double precision NOT NULL
);


ALTER TABLE administration_member OWNER TO qijiec;

--
-- Name: administration_member_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE administration_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administration_member_id_seq OWNER TO qijiec;

--
-- Name: administration_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE administration_member_id_seq OWNED BY administration_member.id;


--
-- Name: administration_player; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE administration_player (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    username character varying(200) NOT NULL,
    sex character varying(1) NOT NULL,
    phone character varying(16),
    email character varying(200),
    nb_groups integer NOT NULL
);


ALTER TABLE administration_player OWNER TO qijiec;

--
-- Name: administration_player_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE administration_player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administration_player_id_seq OWNER TO qijiec;

--
-- Name: administration_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE administration_player_id_seq OWNED BY administration_player.id;


--
-- Name: administration_team; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE administration_team (
    group_ptr_id integer NOT NULL,
    ranking integer NOT NULL,
    total_legs_played integer NOT NULL,
    total_legs_won integer NOT NULL,
    season_legs_played integer NOT NULL,
    season_legs_won integer NOT NULL,
    league_id integer NOT NULL,
    capitain_id integer,
    team_number integer NOT NULL,
    total_matches_played integer NOT NULL,
    total_matches_won integer NOT NULL,
    season_matches_played integer NOT NULL,
    season_matches_won integer NOT NULL
);


ALTER TABLE administration_team OWNER TO qijiec;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO qijiec;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO qijiec;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO qijiec;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO qijiec;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO qijiec;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO qijiec;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO qijiec;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO qijiec;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO qijiec;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO qijiec;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO qijiec;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO qijiec;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO qijiec;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO qijiec;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(64) NOT NULL,
    hour character varying(64) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(64) NOT NULL,
    month_of_year character varying(64) NOT NULL
);


ALTER TABLE django_celery_beat_crontabschedule OWNER TO qijiec;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE django_celery_beat_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_celery_beat_crontabschedule_id_seq OWNER TO qijiec;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE django_celery_beat_crontabschedule_id_seq OWNED BY django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE django_celery_beat_intervalschedule OWNER TO qijiec;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE django_celery_beat_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_celery_beat_intervalschedule_id_seq OWNER TO qijiec;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE django_celery_beat_intervalschedule_id_seq OWNED BY django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE django_celery_beat_periodictask OWNER TO qijiec;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE django_celery_beat_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_celery_beat_periodictask_id_seq OWNER TO qijiec;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE django_celery_beat_periodictask_id_seq OWNED BY django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE django_celery_beat_periodictasks OWNER TO qijiec;

--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO qijiec;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO qijiec;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO qijiec;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO qijiec;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO qijiec;

--
-- Name: recording_frame; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE recording_frame (
    id integer NOT NULL,
    frame_number integer NOT NULL,
    home_score integer,
    away_score integer,
    is_clearance boolean NOT NULL,
    break_player_id integer NOT NULL,
    cleared_by_id integer,
    match_id integer
);


ALTER TABLE recording_frame OWNER TO qijiec;

--
-- Name: recording_frame_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE recording_frame_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recording_frame_id_seq OWNER TO qijiec;

--
-- Name: recording_frame_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE recording_frame_id_seq OWNED BY recording_frame.id;


--
-- Name: recording_leagueframe; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE recording_leagueframe (
    frame_ptr_id integer NOT NULL,
    leg_number integer NOT NULL,
    away_player_id integer NOT NULL,
    home_player_id integer NOT NULL,
    league_match_id integer NOT NULL
);


ALTER TABLE recording_leagueframe OWNER TO qijiec;

--
-- Name: recording_leaguematch; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE recording_leaguematch (
    id integer NOT NULL,
    venue character varying(200),
    match_date timestamp with time zone NOT NULL,
    number_frames integer NOT NULL,
    table_size integer NOT NULL,
    is_completed boolean NOT NULL,
    is_submitted boolean NOT NULL,
    pool_type character varying(10) NOT NULL,
    score_type character varying(1) NOT NULL,
    home_score integer NOT NULL,
    away_score integer NOT NULL,
    home_points_raw integer NOT NULL,
    away_points_raw integer NOT NULL,
    legs integer NOT NULL,
    handicap integer NOT NULL,
    away_id integer NOT NULL,
    home_id integer NOT NULL,
    week_id integer,
    winner_id integer,
    is_initialized boolean NOT NULL,
    _away_ordered_players character varying(200),
    _home_ordered_players character varying(200),
    break_type character varying(1) NOT NULL,
    season_id integer,
    league_id integer
);


ALTER TABLE recording_leaguematch OWNER TO qijiec;

--
-- Name: recording_leaguematch_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE recording_leaguematch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recording_leaguematch_id_seq OWNER TO qijiec;

--
-- Name: recording_leaguematch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE recording_leaguematch_id_seq OWNED BY recording_leaguematch.id;


--
-- Name: recording_match; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE recording_match (
    id integer NOT NULL,
    venue character varying(200),
    match_date timestamp with time zone NOT NULL,
    number_frames integer NOT NULL,
    table_size integer NOT NULL,
    is_completed boolean NOT NULL,
    is_submitted boolean NOT NULL,
    pool_type character varying(10) NOT NULL,
    score_type character varying(1) NOT NULL,
    home_score integer NOT NULL,
    away_score integer NOT NULL,
    race_to integer NOT NULL,
    match_type character varying(1) NOT NULL,
    away_id integer NOT NULL,
    home_id integer NOT NULL,
    week_id integer,
    winner_id integer,
    is_initialized boolean NOT NULL,
    break_type character varying(1) NOT NULL,
    season_id integer
);


ALTER TABLE recording_match OWNER TO qijiec;

--
-- Name: recording_match_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE recording_match_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recording_match_id_seq OWNER TO qijiec;

--
-- Name: recording_match_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE recording_match_id_seq OWNED BY recording_match.id;


--
-- Name: schedule_matchweek; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE schedule_matchweek (
    id integer NOT NULL,
    week_number integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    season_id integer NOT NULL
);


ALTER TABLE schedule_matchweek OWNER TO qijiec;

--
-- Name: schedule_matchweek_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE schedule_matchweek_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_matchweek_id_seq OWNER TO qijiec;

--
-- Name: schedule_matchweek_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE schedule_matchweek_id_seq OWNED BY schedule_matchweek.id;


--
-- Name: schedule_season; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE schedule_season (
    id integer NOT NULL,
    season integer NOT NULL
);


ALTER TABLE schedule_season OWNER TO qijiec;

--
-- Name: schedule_season_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE schedule_season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_season_id_seq OWNER TO qijiec;

--
-- Name: schedule_season_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE schedule_season_id_seq OWNED BY schedule_season.id;


--
-- Name: administration_group id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_group ALTER COLUMN id SET DEFAULT nextval('administration_group_id_seq'::regclass);


--
-- Name: administration_league id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_league ALTER COLUMN id SET DEFAULT nextval('administration_league_id_seq'::regclass);


--
-- Name: administration_member id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_member ALTER COLUMN id SET DEFAULT nextval('administration_member_id_seq'::regclass);


--
-- Name: administration_player id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_player ALTER COLUMN id SET DEFAULT nextval('administration_player_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: recording_frame id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_frame ALTER COLUMN id SET DEFAULT nextval('recording_frame_id_seq'::regclass);


--
-- Name: recording_leaguematch id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leaguematch ALTER COLUMN id SET DEFAULT nextval('recording_leaguematch_id_seq'::regclass);


--
-- Name: recording_match id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_match ALTER COLUMN id SET DEFAULT nextval('recording_match_id_seq'::regclass);


--
-- Name: schedule_matchweek id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY schedule_matchweek ALTER COLUMN id SET DEFAULT nextval('schedule_matchweek_id_seq'::regclass);


--
-- Name: schedule_season id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY schedule_season ALTER COLUMN id SET DEFAULT nextval('schedule_season_id_seq'::regclass);


--
-- Data for Name: administration_group; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_group (id, name, size, create_date, close_date) FROM stdin;
9	Les Trois Mousquetaires	0	2017-03-12 12:11:01+08	\N
7	Holy Strokes	0	2017-02-08 22:38:40+08	\N
1	That's a Beautiful Rack	0	2017-02-07 21:31:15+08	\N
4	Pink Platypuses	0	2017-02-08 22:32:23+08	\N
2	Just the Tip	0	2017-02-07 21:32:04+08	\N
5	The Abangers	0	2017-02-08 22:36:19+08	\N
6	Dram Good Shots	0	2017-02-08 22:38:27+08	\N
8	The Meanions	0	2017-02-08 22:39:07+08	\N
3	Anything is Fine	0	2017-02-07 21:32:25+08	\N
\.


--
-- Name: administration_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('administration_group_id_seq', 9, true);


--
-- Data for Name: administration_league; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_league (id, name, create_date, level, size, last_update) FROM stdin;
1	Poke n Hope HK 8-Ball	2017-02-07 21:26:20+08	1	0	2017-05-27 12:41:20.58034+08
\.


--
-- Name: administration_league_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('administration_league_id_seq', 1, true);


--
-- Data for Name: administration_member; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_member (id, create_date, cancel_date, points, ranking, _point_adj, total_matches_played, total_matches_won, total_clearance, season_matches_played, season_matches_won, season_clearance, group_id, player_id, raw_points, handicap) FROM stdin;
101	2017-03-12 00:19:56+08	\N	198.769230769230944	0	0	3	1	0	3	1	0	9	7	19	3.25
102	2017-03-12 00:20:39+08	\N	201.230769230769965	0	0	3	2	1	3	2	1	9	58	20	3.25
98	2017-03-05 10:22:51.867+08	\N	200	0	0	0	0	0	0	0	0	1	66	0	-1
79	2017-03-05 10:22:51.608+08	\N	167.579825106756999	61	0	33	7	0	33	7	0	1	47	421	6.37878787878787978
83	2017-03-05 10:22:51.679+08	\N	156.561188133985013	65	0	18	4	0	18	4	0	1	51	217	6.02777777777778034
99	2017-03-05 10:22:51.877+08	\N	200	0	0	0	0	0	0	0	0	1	67	0	-1
86	2017-03-05 10:22:51.721+08	\N	200	0	0	0	0	0	0	0	0	6	54	0	-1
40	2017-02-26 22:05:05.559+08	\N	265.974422849967993	1	0	30	24	7	30	24	7	3	10	538	8.96666666666667034
70	2017-03-01 21:45:00+08	\N	241.499065794073005	7	0	30	17	4	30	17	4	4	37	503	8.38333333333332931
48	2017-02-26 22:05:05.645+08	\N	181.056917883984994	49	0	12	3	0	12	3	0	4	18	163	6.79166666666666963
110	2017-04-29 19:12:58+08	\N	169.828091717559005	55	0	18	5	1	18	5	1	4	76	231	6.41666666666666963
78	2017-03-05 10:22:51+08	\N	153.339681803600996	66	0	33	7	0	33	7	0	5	46	424	6.42424242424242031
111	2017-04-30 12:27:39+08	\N	191.85998403855001	43	0	3	1	0	3	1	0	7	77	34	5.66666666666666963
50	2017-02-26 22:05:05.663+08	\N	200	0	0	0	0	0	0	0	0	4	20	0	-1
51	2017-02-26 22:05:05.669+08	\N	200	0	0	0	0	0	0	0	0	4	21	0	-1
112	2017-05-13 01:44:45+08	\N	201.47926961475099	35	0	3	3	0	3	3	0	7	78	50	8.33333333333333037
95	2017-03-05 10:22:51.826+08	\N	200	0	0	0	0	0	0	0	0	2	63	0	-1
90	2017-03-05 10:22:51.766+08	\N	201.175027003291007	37	0	33	14	0	33	14	0	7	58	483	7.31818181818182012
113	2017-05-13 16:07:55+08	\N	201.289365747165988	36	0	6	3	0	6	3	0	8	79	87	7.25
71	2017-03-05 10:22:51.489+08	\N	230.613581445304987	14	0	33	22	6	33	22	6	5	39	532	8.06060606060606055
82	2017-03-05 10:22:51.668+08	\N	203.987771667778986	30	0	9	4	0	9	4	0	5	50	141	7.83333333333333037
66	2017-02-26 22:05:05.779+08	\N	168.584064270858988	59	0	15	2	0	15	2	0	8	33	187	6.23333333333332984
68	2017-02-26 22:05:05.791+08	\N	200	0	0	0	0	0	0	0	0	8	35	0	-1
77	2017-03-05 10:22:51.584+08	\N	222.089479123329994	20	0	21	12	0	21	12	0	5	45	346	8.2380952380952408
56	2017-02-26 22:05:05+08	\N	194.728281835911986	41	0	12	5	1	12	5	1	6	25	179	7.45833333333333037
97	2017-03-05 10:22:51.852+08	\N	173.313492446954001	53	0	15	3	0	15	3	0	1	65	192	6.40000000000000036
106	2017-03-23 23:50:17+08	\N	168.257256379800992	60	0	3	0	0	3	0	0	6	72	12	2
57	2017-02-26 22:05:05+08	\N	231.29207732568301	13	0	21	13	2	21	13	2	6	38	337	8.02380952380952017
87	2017-03-05 10:22:51.734+08	\N	179.956119090590988	50	0	12	5	0	12	5	0	1	55	155	6.45833333333333037
94	2017-03-05 10:22:51.809+08	\N	200	0	0	0	0	0	0	0	0	5	62	0	-1
1	2017-02-07 21:32:51+08	\N	236.203150629031995	11	0	30	18	3	30	18	3	1	5	487	8.11666666666667069
80	2017-03-05 10:22:51.621+08	\N	182.319427883618999	48	0	30	12	0	30	12	0	1	48	429	7.15000000000000036
3	2017-02-07 21:33:36+08	\N	200.462088139360986	38	0	18	7	0	18	7	0	3	2	270	7.5
46	2017-02-26 22:05:05.62+08	\N	228.331406832959999	15	0	33	20	6	33	20	6	4	16	522	7.90909090909091006
47	2017-02-26 22:05:05.628+08	\N	166.754529003892998	62	0	33	8	0	33	8	0	4	17	434	6.57575757575757969
49	2017-02-26 22:05:05.653+08	\N	169.275641144410997	57	0	30	8	0	30	8	0	4	19	397	6.6166666666666698
4	2017-01-07 07:07:07+08	\N	214.870328025585991	25	0	21	14	0	21	14	0	4	4	328	7.8095238095238102
92	2017-03-05 10:22:51.785+08	\N	208.758313729315006	28	0	12	7	2	12	7	2	5	60	190	7.91666666666666963
103	2017-03-14 23:44:26+08	\N	187.202829948345993	45	0	3	0	0	3	0	0	5	69	35	5.83333333333333037
58	2017-02-26 22:05:05.72+08	\N	219.93380515547301	22	0	18	11	2	18	11	2	6	26	286	7.9444444444444402
60	2017-02-26 22:05:05.735+08	\N	201.715960059383008	34	0	3	1	0	3	1	0	6	28	51	8.5
55	2017-02-26 22:05:05.695+08	\N	175.63856237347801	52	0	33	8	0	33	8	0	6	24	443	6.71212121212121016
54	2017-02-26 22:05:05.689+08	\N	103.667676943708003	70	0	30	1	0	30	1	0	6	23	279	4.65000000000000036
100	2017-03-11 23:24:10+08	\N	189.098847619715997	44	0	6	2	0	6	2	0	6	68	81	6.75
52	2017-02-26 22:05:05.676+08	\N	221.494075755915986	21	0	12	9	2	12	9	2	6	8	193	8.04166666666666963
53	2017-02-26 22:05:05.683+08	\N	200.062425409087012	39	0	30	14	0	30	14	0	6	22	451	7.51666666666667016
59	2017-02-26 22:05:05.729+08	\N	222.645349614552998	19	0	12	8	2	12	8	2	6	27	191	7.95833333333333037
89	2017-03-05 10:22:51.754+08	\N	237.857401322647007	9	0	24	15	2	24	15	2	7	57	391	8.14583333333333037
6	2017-02-08 22:39:35+08	\N	204.789792344386996	29	0	33	18	2	33	18	2	7	3	511	7.74242424242424043
81	2017-03-05 10:22:51.653+08	\N	169.522405409153009	56	0	36	10	1	36	10	1	7	49	463	6.4305555555555598
7	2017-01-07 07:07:07+08	\N	247.979387090056008	6	0	33	20	4	33	20	4	7	7	542	8.21212121212120927
93	2017-03-05 10:22:51.795+08	\N	202.16302672744601	33	0	15	4	1	15	4	1	7	61	210	7
64	2017-02-26 22:05:05.76+08	\N	178.918474579204002	51	0	9	2	0	9	2	0	8	31	114	6.33333333333333037
91	2017-03-05 10:22:51.775+08	\N	162.298522116638992	63	0	12	1	0	12	1	0	1	59	156	6.5
96	2017-03-05 10:22:51.838+08	\N	158.628627282320991	64	0	6	0	0	6	0	0	1	64	38	3.16666666666667007
109	2017-03-30 22:47:14+08	\N	172.412810678546009	54	0	12	0	0	12	0	0	1	75	140	5.83333333333333037
69	2017-02-26 22:05:05+08	\N	197.513003249120999	40	4.39931892617839093	39	17	1	39	17	1	8	36	607	7.72222222222221966
45	2017-02-26 22:05:05.609+08	\N	209.617622016029998	27	10.7068954512541623	21	8	3	21	8	3	3	15	313	7.11111111111110983
61	2017-02-26 22:05:05+08	\N	147.14344982723	67	-3.5856799586481749	27	4	0	27	4	0	8	9	327	6.125
41	2017-02-26 22:05:05+08	\N	257.397032729038983	2	-10.9672196235272175	39	27	6	39	27	6	3	11	668	8.58333333333333037
62	2017-02-26 22:05:05.747+08	\N	202.602192546567011	32	-7.30474195818663041	15	5	1	15	5	1	8	29	216	7.5
105	2017-03-18 16:59:27+08	\N	142.593583947093009	69	-4.0926800994921182	24	3	1	24	3	1	8	71	258	5.45238095238094989
43	2017-02-26 22:05:05.587+08	\N	184.865107196092993	46	0.232733504175723471	39	17	1	39	17	1	3	13	572	7.26388888888889017
44	2017-02-26 22:05:05+08	\N	254.515386314283006	5	2.05543105497402578	21	17	4	21	17	4	3	14	369	8.86111111111111072
108	2017-03-30 22:44:28+08	\N	183.698842011192994	47	0	12	3	0	12	3	0	1	74	160	6.66666666666666963
67	2017-02-26 22:05:05.785+08	\N	144.198255338578008	68	0	18	5	0	18	5	0	8	34	202	5.61111111111110983
65	2017-02-26 22:05:05.771+08	\N	194.624604591753013	42	0	12	4	1	12	4	1	8	32	180	7.5
107	2017-03-30 22:38:33+08	\N	168.989671164078999	58	0	12	4	0	12	4	0	8	73	143	5.95833333333333037
74	2017-03-05 10:22:51.536+08	\N	224.503545498699992	18	0	27	17	1	27	17	1	2	42	441	8.16666666666666963
104	2017-03-17 22:39:33+08	\N	241.233026601797008	8	0	15	11	0	15	11	0	2	70	276	9.19999999999999929
2	2017-02-07 21:33:26+08	\N	215.040049351315986	24	0	36	21	0	36	21	0	2	1	594	8.25
73	2017-03-05 10:22:51.514+08	\N	231.560007179867	12	0	30	16	3	30	16	3	2	41	473	7.8833333333333302
84	2017-03-05 10:22:51.689+08	\N	217.147590785879004	23	0	33	24	0	33	24	0	2	52	526	7.96969696969696972
72	2017-03-05 10:22:51.503+08	\N	225.218562854525999	16	0	24	15	2	24	15	2	2	40	394	8.20833333333333037
75	2017-03-05 10:22:51.555+08	\N	237.730941560664007	10	0	15	10	4	15	10	4	2	43	257	8.56666666666666998
76	2017-03-05 10:22:51.568+08	\N	256.823319073406992	3	0	33	23	3	33	23	3	5	44	565	8.56060606060606055
5	2017-02-08 22:37:14+08	\N	254.545387293327991	4	0	30	23	9	30	23	9	5	6	514	8.56666666666666998
88	2017-03-05 10:22:51.745+08	\N	212.503100225878001	26	0	6	3	0	6	3	0	5	56	97	8.08333333333333037
63	2017-02-26 22:05:05+08	\N	203.661390278115988	31	4.412412923620046	18	11	0	18	11	0	8	30	284	7.8666666666666698
42	2017-02-26 22:05:05.577+08	\N	224.804499267338002	17	4.14352977965177338	27	16	2	27	16	2	3	12	438	8
\.


--
-- Name: administration_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('administration_member_id_seq', 113, true);


--
-- Data for Name: administration_player; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_player (id, name, username, sex, phone, email, nb_groups) FROM stdin;
1	Mancy Howe	mancyh	F			0
2	Brad Tsui	bradt	M			0
3	Deep Vaswani	deepv	M			0
4	Jay Gonzalez	jayg	M			0
5	Henrik Pedersen	henrikp	M			0
6	Lito Labra	litol	M			0
7	Qijie Chu	qijiec	M			0
8	Jhun Jimeno	jhunj	M			0
9	Clara Szeto	claras	F			0
10	Alvaro Monteiro	alvarom	M	\N	\N	0
11	Yuri Aguilar	yuria	M	\N	\N	0
12	Edward Chu	edwardc	M	\N	\N	0
13	Lily Wong	lilyw	F			0
14	Stephane Meister	stephanem	M	\N	\N	0
15	John Lo	johnl	M	\N	\N	0
16	Alex Wang	alexw	M	\N	\N	0
17	Fiona Chow	fionac	F			0
18	Jon Sze	jons	M	\N	\N	0
19	Coleman Yip	colemany	M	\N	\N	0
20	Julian Tung	juliant	M	\N	\N	0
21	Ricky Ying	rickyy	M	\N	\N	0
22	Kuro Kawamura	kurok	M	\N	\N	0
23	Joyce Lai	joycel	F			0
24	Billy McCarthy	billym	M	\N	\N	0
25	Kam Daswani	kamd	M	\N	\N	0
26	Barney Cox	barneyc	M	\N	\N	0
27	James Law	jamesl	M	\N	\N	0
28	Katrina Leung	katrinal	F			0
29	Ankit Jain	ankitj	M	\N	\N	0
30	Nick Fong	nickf	M	\N	\N	0
31	Simon Yeung	simony	M	\N	\N	0
33	Louis Poon	louisp	M	\N	\N	0
34	Olive Lai	olivel	F			0
35	Tim Newton	timn	M	\N	\N	0
37	Clarence Yung	clarencey	M			0
38	Jon Somers	jonso	M			0
39	Levis Santos	leviss	M	\N	\N	0
40	Safee Shah	safees	M	\N	\N	0
41	Parsad Tamang	parsadt	M	\N	\N	0
42	Ryan McCarthy	ryanm	M	\N	\N	0
43	Albert Yu	alberty	M	\N	\N	0
44	Elton Zablan	eltonz	M	\N	\N	0
45	Mark Morillo	markm	M	\N	\N	0
46	Bertha Yeung	berthay	F	\N	\N	0
47	Wilson Kong	wilsonk	M	\N	\N	0
48	Catherine Fu	catherinef	F			0
49	Annie Hsieh	annieh	F	\N	\N	0
50	Michael Dabao	michaeld	M	\N	\N	0
51	David Tse	davidt	M	\N	\N	0
52	Nick Lok	nickl	M	\N	\N	0
54	Rosario Armstrong	rosarioa	M	\N	\N	0
55	Dean Chiu	deanc	M	\N	\N	0
56	Milan Putik	milanp	M	\N	\N	0
57	Samson Cheung	samsonc	M	\N	\N	0
58	Ka Wang Lau	ka wangl	M	\N	\N	0
59	Jaden Law	jadenl	M	\N	\N	0
60	Joel Buenafe	joelb	M	\N	\N	0
61	Cyrus Wu	cyrusw	M	\N	\N	0
62	Carol Navea	caroln	F	\N	\N	0
63	Damon Howe	damonh	M	\N	\N	0
64	Carmelo Lopez	carmelol	M	\N	\N	0
65	Will Zhang	willz	M	\N	\N	0
66	Rita Lim	rital	F	\N	\N	0
67	Bernie Nissen	bernien	M	\N	\N	0
68	Seungrae Kim	seungraek	M			0
69	Nancy Tsao	nancyt	F			0
70	Simpson Wong	simponw	M			0
71	James Dwyer	jamesd	M			0
72	Fon Sarndok	fons	F			0
73	Keir Oakes	keiro	M			0
74	Yolanda Leung	yolandal	F			0
75	Hayat Saleh	hayats	M			0
76	James K	jamesk	M			0
77	Ryan Leung	ryanl	M			0
78	Michael Chang	michaelc	M			0
79	Stanley Wong	stanleyw	M			0
36	Andrew H	andrewh	M			0
32	Don Kripalani	donk	M			0
\.


--
-- Name: administration_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('administration_player_id_seq', 79, true);


--
-- Data for Name: administration_team; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_team (group_ptr_id, ranking, total_legs_played, total_legs_won, season_legs_played, season_legs_won, league_id, capitain_id, team_number, total_matches_played, total_matches_won, season_matches_played, season_matches_won) FROM stdin;
7	4	84	47	84	47	1	3	3	12	7	12	7
1	8	84	23	84	23	1	48	7	12	2	12	2
4	5	84	39	84	39	1	4	1	12	6	12	6
2	2	84	54	84	54	1	1	4	12	8	12	8
5	3	84	47	84	47	1	6	6	12	6	12	6
6	6	84	38	84	38	1	8	5	12	4	12	4
8	7	91	28	91	28	1	36	2	13	4	13	4
3	1	91	67	91	67	1	2	8	13	12	13	12
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
4	Can add league	2	add_league
5	Can change league	2	change_league
6	Can delete league	2	delete_league
7	Can add player	3	add_player
8	Can change player	3	change_player
9	Can delete player	3	delete_player
13	Can add member	5	add_member
14	Can change member	5	change_member
15	Can delete member	5	delete_member
1	Can add group	1	add_group
2	Can change group	1	change_group
3	Can delete group	1	delete_group
10	Can add team	4	add_team
11	Can change team	4	change_team
12	Can delete team	4	delete_team
22	Can add frame	8	add_frame
23	Can change frame	8	change_frame
24	Can delete frame	8	delete_frame
25	Can add league frame	9	add_leagueframe
26	Can change league frame	9	change_leagueframe
27	Can delete league frame	9	delete_leagueframe
16	Can add match	6	add_match
17	Can change match	6	change_match
18	Can delete match	6	delete_match
19	Can add league match	7	add_leaguematch
20	Can change league match	7	change_leaguematch
21	Can delete league match	7	delete_leaguematch
28	Can add season	10	add_season
29	Can change season	10	change_season
30	Can delete season	10	delete_season
31	Can add match week	11	add_matchweek
32	Can change match week	11	change_matchweek
33	Can delete match week	11	delete_matchweek
34	Can add log entry	12	add_logentry
35	Can change log entry	12	change_logentry
36	Can delete log entry	12	delete_logentry
37	Can add permission	13	add_permission
38	Can change permission	13	change_permission
39	Can delete permission	13	delete_permission
43	Can add user	15	add_user
44	Can change user	15	change_user
45	Can delete user	15	delete_user
40	Can add group	14	add_group
41	Can change group	14	change_group
42	Can delete group	14	delete_group
46	Can add content type	16	add_contenttype
47	Can change content type	16	change_contenttype
48	Can delete content type	16	delete_contenttype
49	Can add session	17	add_session
50	Can change session	17	change_session
51	Can delete session	17	delete_session
61	Can add periodic task	21	add_periodictask
62	Can change periodic task	21	change_periodictask
63	Can delete periodic task	21	delete_periodictask
52	Can add interval	18	add_intervalschedule
53	Can change interval	18	change_intervalschedule
54	Can delete interval	18	delete_intervalschedule
55	Can add crontab	19	add_crontabschedule
56	Can change crontab	19	change_crontabschedule
57	Can delete crontab	19	delete_crontabschedule
58	Can add periodic tasks	20	add_periodictasks
59	Can change periodic tasks	20	change_periodictasks
60	Can delete periodic tasks	20	delete_periodictasks
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('auth_permission_id_seq', 63, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$30000$qqNZ3YwKlCB1$usTEYFKh0glaZuPPpVgBbnr4Hwfnw3NpjVuqAcorn5w=	2017-05-30 10:59:15.578604+08	f	scorer				f	t	2017-05-30 10:56:11+08
1	pbkdf2_sha256$30000$PnLVA3JIFomi$8QoE7EwYwYcADnNh9fSScFbBSCQOv2PNV7yHvRVRUzI=	2017-05-31 22:02:33.797696+08	t	admin			admin@hkpl.com	t	t	2017-02-07 21:18:36.653+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	16
2	2	20
3	2	22
4	2	23
5	2	25
6	2	26
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 6, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-02-07 21:26:56.858+08	1	Poke n Hope HK 8-Ball	1	[{"added": {}}]	2	1
2	2017-02-07 21:28:12.082+08	1	Mancy Howe	1	[{"added": {}}]	3	1
3	2017-02-07 21:28:40.523+08	2	Brad Tsui	1	[{"added": {}}]	3	1
4	2017-02-07 21:29:17.628+08	3	Deep	1	[{"added": {}}]	3	1
5	2017-02-07 21:30:00.339+08	1	mancyh	2	[{"changed": {"fields": ["name", "username"]}}]	3	1
6	2017-02-07 21:30:10.468+08	2	bradt	2	[{"changed": {"fields": ["name", "username"]}}]	3	1
7	2017-02-07 21:30:22.295+08	3	deepv	2	[{"changed": {"fields": ["name", "username"]}}]	3	1
8	2017-02-07 21:32:01.921+08	1	Holy Strokes	1	[{"added": {}}]	4	1
9	2017-02-07 21:32:23.214+08	2	Just the Tip	1	[{"added": {}}]	4	1
10	2017-02-07 21:32:37.598+08	3	Anything is Fine	1	[{"added": {}}]	4	1
11	2017-02-07 21:33:14.122+08	1	Deep (Holy Strokes)	1	[{"added": {}}]	5	1
12	2017-02-07 21:33:34.721+08	2	Mancy Howe (Just the Tip)	1	[{"added": {}}]	5	1
13	2017-02-07 21:33:47.92+08	3	Brad Tsui (Anything is Fine)	1	[{"added": {}}]	5	1
14	2017-02-07 21:34:23.361+08	4	Arthur	1	[{"added": {}}]	3	1
15	2017-02-07 21:35:40.638+08	4	Arthur (Holy Strokes)	1	[{"added": {}}]	5	1
16	2017-02-07 23:57:21.841+08	1	2017-2018 Season 3	1	[{"added": {}}]	10	1
17	2017-02-07 23:59:10.886+08	1	Week 1 Feb 26, 2017-Mar 04, 2017	1	[{"added": {}}]	11	1
18	2017-02-08 22:28:19.584+08	4	Alex Wang	2	[{"changed": {"fields": ["name", "username"]}}]	3	1
19	2017-02-08 22:29:00.34+08	4	Jay Gonzalez	2	[{"changed": {"fields": ["name", "username"]}}]	3	1
20	2017-02-08 22:29:39.43+08	5	Henrik	1	[{"added": {}}]	3	1
21	2017-02-08 22:30:07.282+08	6	Lito Labra	1	[{"added": {}}]	3	1
22	2017-02-08 22:30:19.245+08	7	Arthur	1	[{"added": {}}]	3	1
23	2017-02-08 22:32:14.541+08	1	That's a Beautiful Rack	2	[{"changed": {"fields": ["name", "capitain"]}}]	4	1
24	2017-02-08 22:32:49.478+08	4	Beavers Roster	1	[{"added": {}}]	4	1
25	2017-02-08 22:35:29.247+08	1	Henrik (That's a Beautiful Rack)	2	[{"changed": {"fields": ["player"]}}]	5	1
26	2017-02-08 22:36:41.892+08	5	The Abangers	1	[{"added": {}}]	4	1
27	2017-02-08 22:37:07.543+08	4	Jay Gonzalez (Beavers Roster)	2	[{"changed": {"fields": ["group"]}}]	5	1
28	2017-02-08 22:37:27.374+08	5	Lito Labra (The Abangers)	1	[{"added": {}}]	5	1
29	2017-02-08 22:38:36.664+08	6	Team 6	1	[{"added": {}}]	4	1
30	2017-02-08 22:39:01.008+08	7	Holy Strokes	1	[{"added": {}}]	4	1
31	2017-02-08 22:39:17.283+08	8	Team 8	1	[{"added": {}}]	4	1
32	2017-02-08 22:39:49.695+08	6	Deep (Holy Strokes)	1	[{"added": {}}]	5	1
33	2017-02-08 22:39:54.474+08	6	Deep (Holy Strokes)	2	[]	5	1
34	2017-02-08 22:40:38.7+08	7	Arthur (Holy Strokes)	1	[{"added": {}}]	5	1
35	2017-02-09 20:02:45.967+08	8	Jhun Jimeno	1	[{"added": {}}]	3	1
36	2017-02-09 20:03:22.751+08	9	Clara Szeto	1	[{"added": {}}]	3	1
37	2017-02-09 20:04:30.037+08	6	Dram Good Shots	2	[{"changed": {"fields": ["name", "capitain"]}}]	4	1
38	2017-02-09 20:04:54.026+08	8	The Meanions	2	[{"changed": {"fields": ["name", "capitain"]}}]	4	1
39	2017-02-09 20:58:41.179+08	1	Week 1 0-0	2	[{"changed": {"fields": ["start_date", "end_date"]}}]	11	1
40	2017-02-22 23:03:12.424+08	8	The Minions	2	[{"changed": {"fields": ["name", "team_number"]}}]	4	1
41	2017-02-22 23:03:37.423+08	7	Holy Strokes	2	[{"changed": {"fields": ["team_number"]}}]	4	1
42	2017-02-22 23:04:04.055+08	6	Dram Good Shots	2	[{"changed": {"fields": ["team_number"]}}]	4	1
43	2017-02-22 23:04:11.337+08	5	The Abangers	2	[{"changed": {"fields": ["team_number"]}}]	4	1
44	2017-02-22 23:04:27.093+08	3	Anything is Fine	2	[{"changed": {"fields": ["team_number"]}}]	4	1
45	2017-02-22 23:04:36.622+08	2	Just the Tip	2	[{"changed": {"fields": ["team_number"]}}]	4	1
46	2017-02-22 23:04:43.345+08	1	That's a Beautiful Rack	2	[{"changed": {"fields": ["team_number"]}}]	4	1
47	2017-02-22 23:05:15.849+08	4	Pink Platypuses	2	[{"changed": {"fields": ["name", "team_number"]}}]	4	1
48	2017-02-22 23:05:54.153+08	56	2017-05-31 Dram Good Shots vs. Pink Platypuses	3		7	1
49	2017-02-22 23:05:54.157+08	55	2017-05-31 Just the Tip vs. Holy Strokes	3		7	1
50	2017-02-22 23:05:54.159+08	54	2017-05-30 Anything is Fine vs. The Abangers	3		7	1
51	2017-02-22 23:05:54.161+08	53	2017-05-31 That's a Beautiful Rack vs. The Minions	3		7	1
52	2017-02-22 23:05:54.163+08	52	2017-05-24 That's a Beautiful Rack vs. Dram Good Shots	3		7	1
53	2017-02-22 23:05:54.165+08	51	2017-05-24 Anything is Fine vs. Holy Strokes	3		7	1
54	2017-02-22 23:05:54.166+08	50	2017-05-24 The Abangers vs. Pink Platypuses	3		7	1
55	2017-02-22 23:05:54.167+08	49	2017-05-23 The Minions vs. Just the Tip	3		7	1
56	2017-02-22 23:05:54.169+08	48	2017-05-17 The Minions vs. Holy Strokes	3		7	1
57	2017-02-22 23:05:54.171+08	47	2017-05-17 The Abangers vs. Dram Good Shots	3		7	1
58	2017-02-22 23:05:54.172+08	46	2017-05-17 Just the Tip vs. Anything is Fine	3		7	1
59	2017-02-22 23:05:54.175+08	45	2017-05-16 That's a Beautiful Rack vs. Pink Platypuses	3		7	1
60	2017-02-22 23:05:54.176+08	44	2017-05-10 The Abangers vs. Holy Strokes	3		7	1
61	2017-02-22 23:05:54.177+08	43	2017-05-10 Anything is Fine vs. Pink Platypuses	3		7	1
62	2017-02-22 23:05:54.179+08	42	2017-05-10 That's a Beautiful Rack vs. Just the Tip	3		7	1
63	2017-02-22 23:05:54.18+08	41	2017-05-09 Dram Good Shots vs. The Minions	3		7	1
64	2017-02-22 23:05:54.181+08	40	2017-05-03 Dram Good Shots vs. Holy Strokes	3		7	1
65	2017-02-22 23:05:54.182+08	39	2017-05-03 Pink Platypuses vs. The Minions	3		7	1
66	2017-02-22 23:05:54.183+08	38	2017-05-03 The Abangers vs. Just the Tip	3		7	1
67	2017-02-22 23:05:54.184+08	37	2017-05-02 Anything is Fine vs. That's a Beautiful Rack	3		7	1
68	2017-02-22 23:05:54.185+08	36	2017-04-26 Dram Good Shots vs. Just the Tip	3		7	1
69	2017-02-22 23:05:54.187+08	35	2017-04-25 Holy Strokes vs. Pink Platypuses	3		7	1
70	2017-02-22 23:05:54.188+08	34	2017-04-26 The Abangers vs. That's a Beautiful Rack	3		7	1
71	2017-02-22 23:05:54.189+08	33	2017-04-26 The Minions vs. Anything is Fine	3		7	1
72	2017-02-22 23:05:54.19+08	32	2017-04-19 The Abangers vs. The Minions	3		7	1
73	2017-02-22 23:05:54.192+08	31	2017-04-19 Just the Tip vs. Pink Platypuses	3		7	1
74	2017-02-22 23:05:54.193+08	30	2017-04-19 Dram Good Shots vs. Anything is Fine	3		7	1
75	2017-02-22 23:05:54.194+08	29	2017-04-18 Holy Strokes vs. That's a Beautiful Rack	3		7	1
76	2017-02-22 23:05:54.195+08	28	2017-04-12 Holy Strokes vs. The Abangers	3		7	1
77	2017-02-22 23:05:54.196+08	27	2017-04-12 Pink Platypuses vs. Anything is Fine	3		7	1
78	2017-02-22 23:05:54.198+08	26	2017-04-11 Just the Tip vs. That's a Beautiful Rack	3		7	1
79	2017-02-22 23:05:54.199+08	25	2017-04-12 The Minions vs. Dram Good Shots	3		7	1
80	2017-02-22 23:05:54.201+08	24	2017-04-05 Holy Strokes vs. The Minions	3		7	1
81	2017-02-22 23:05:54.203+08	23	2017-04-05 Pink Platypuses vs. Dram Good Shots	3		7	1
82	2017-02-22 23:05:54.205+08	22	2017-04-04 Just the Tip vs. The Abangers	3		7	1
83	2017-02-22 23:05:54.207+08	21	2017-04-05 That's a Beautiful Rack vs. Anything is Fine	3		7	1
84	2017-02-22 23:05:54.209+08	20	2017-03-29 Holy Strokes vs. Dram Good Shots	3		7	1
85	2017-02-22 23:05:54.21+08	19	2017-03-29 Pink Platypuses vs. That's a Beautiful Rack	3		7	1
86	2017-02-22 23:05:54.211+08	18	2017-03-28 Anything is Fine vs. Just the Tip	3		7	1
87	2017-02-22 23:05:54.212+08	17	2017-03-29 The Minions vs. The Abangers	3		7	1
88	2017-02-22 23:05:54.213+08	16	2017-03-22 Pink Platypuses vs. Holy Strokes	3		7	1
89	2017-02-22 23:05:54.215+08	15	2017-03-22 Just the Tip vs. Dram Good Shots	3		7	1
90	2017-02-22 23:05:54.216+08	14	2017-03-22 Anything is Fine vs. The Minions	3		7	1
91	2017-02-22 23:05:54.217+08	13	2017-03-21 That's a Beautiful Rack vs. The Abangers	3		7	1
92	2017-02-22 23:05:54.218+08	12	2017-03-15 Dram Good Shots vs. That's a Beautiful Rack	3		7	1
93	2017-02-22 23:05:54.22+08	11	2017-03-14 Holy Strokes vs. Just the Tip	3		7	1
94	2017-02-22 23:05:54.221+08	10	2017-03-15 The Abangers vs. Anything is Fine	3		7	1
95	2017-02-22 23:05:54.222+08	9	2017-03-15 The Minions vs. Pink Platypuses	3		7	1
96	2017-02-22 23:05:54.224+08	8	2017-03-08 Pink Platypuses vs. The Abangers	3		7	1
97	2017-02-22 23:05:54.225+08	7	2017-03-08 Just the Tip vs. The Minions	3		7	1
98	2017-02-22 23:05:54.227+08	6	2017-03-07 Anything is Fine vs. Dram Good Shots	3		7	1
99	2017-02-22 23:05:54.228+08	5	2017-03-08 That's a Beautiful Rack vs. Holy Strokes	3		7	1
100	2017-02-22 23:05:54.229+08	4	2017-03-01 Dram Good Shots vs. The Abangers	3		7	1
101	2017-02-22 23:05:54.23+08	3	2017-03-01 Holy Strokes vs. Anything is Fine	3		7	1
102	2017-02-22 23:05:54.231+08	2	2017-03-01 Pink Platypuses vs. Just the Tip	3		7	1
103	2017-02-22 23:05:54.233+08	1	2017-02-28 The Minions vs. That's a Beautiful Rack	3		7	1
104	2017-02-25 16:35:52.836+08	8	The Meanions	2	[{"changed": {"fields": ["name"]}}]	4	1
105	2017-02-26 22:04:45.946+08	39	Andrew Hollingshead (Just the Tip)	3		5	1
106	2017-02-26 22:04:45.95+08	38	Tim Newton (Just the Tip)	3		5	1
107	2017-02-26 22:04:45.951+08	37	Olive Lai (Just the Tip)	3		5	1
108	2017-02-26 22:04:45.952+08	36	Louis Poon (Just the Tip)	3		5	1
109	2017-02-26 22:04:45.953+08	35	Dinesh kripalani (Just the Tip)	3		5	1
110	2017-02-26 22:04:45.954+08	34	Simon Yeung (Just the Tip)	3		5	1
111	2017-02-26 22:04:45.956+08	33	Nick Fong (Just the Tip)	3		5	1
112	2017-02-26 22:04:45.957+08	32	Ankit Jain (Just the Tip)	3		5	1
113	2017-02-26 22:04:45.959+08	31	Clara Szeto (Just the Tip)	3		5	1
114	2017-02-26 22:04:45.96+08	30	Katrina Leung (The Abangers)	3		5	1
115	2017-02-26 22:04:45.961+08	29	James Law (The Abangers)	3		5	1
116	2017-02-26 22:04:45.962+08	28	Barney Cox (The Abangers)	3		5	1
117	2017-02-26 22:04:45.964+08	27	Jon Sze (The Abangers)	3		5	1
118	2017-02-26 22:04:45.967+08	26	Kam Daswani (The Abangers)	3		5	1
119	2017-02-26 22:04:45.969+08	25	Billy McCarthy (The Abangers)	3		5	1
120	2017-02-26 22:04:45.971+08	24	Joyce Lai (The Abangers)	3		5	1
121	2017-02-26 22:04:45.973+08	23	Kuro Kawamura (The Abangers)	3		5	1
122	2017-02-26 22:04:45.975+08	22	Jhun Jimeno (The Abangers)	3		5	1
123	2017-02-26 22:04:45.977+08	21	Ricky Ying (That's a Beautiful Rack)	3		5	1
124	2017-02-26 22:04:45.978+08	20	Julian Tung (That's a Beautiful Rack)	3		5	1
125	2017-02-26 22:04:45.98+08	19	Coleman Yip (That's a Beautiful Rack)	3		5	1
126	2017-02-26 22:04:45.981+08	18	Jon Sze (That's a Beautiful Rack)	3		5	1
127	2017-02-26 22:04:45.99+08	17	Jay Gonzalez (That's a Beautiful Rack)	3		5	1
128	2017-02-26 22:04:45.997+08	16	Fiona Chow (That's a Beautiful Rack)	3		5	1
129	2017-02-26 22:04:46.006+08	15	Alex Wang (That's a Beautiful Rack)	3		5	1
130	2017-02-26 22:04:46.014+08	14	Brad Tsui (The Meanions)	3		5	1
131	2017-02-26 22:04:46.017+08	13	John Lo (The Meanions)	3		5	1
132	2017-02-26 22:04:46.02+08	12	Stephane Meister (The Meanions)	3		5	1
133	2017-02-26 22:04:46.022+08	11	Lily Wong (The Meanions)	3		5	1
134	2017-02-26 22:04:46.025+08	10	Edward Chu (The Meanions)	3		5	1
135	2017-02-26 22:04:46.027+08	9	Yuri Aguilar (The Meanions)	3		5	1
136	2017-02-26 22:04:46.029+08	8	Alvaro Monteiro (The Meanions)	3		5	1
137	2017-02-26 22:29:50.493+08	32	Dinesh Kripalani	2	[{"changed": {"fields": ["name"]}}]	3	1
138	2017-02-26 22:29:56.58+08	28	Katrina Leung	2	[{"changed": {"fields": ["sex"]}}]	3	1
139	2017-02-26 22:30:08.981+08	17	Fiona Chow	2	[{"changed": {"fields": ["sex"]}}]	3	1
140	2017-02-26 22:30:30.311+08	13	Lily Wong	2	[{"changed": {"fields": ["sex"]}}]	3	1
141	2017-03-01 21:44:54.069+08	37	Clarence Yung	1	[{"added": {}}]	3	1
142	2017-03-01 21:45:28.717+08	70	Clarence Yung (Pink Platypuses)	1	[{"added": {}}]	5	1
143	2017-03-02 19:52:11.962+08	30	2017-02-28 Brad Tsui (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 6	3		9	1
144	2017-03-02 19:52:11.967+08	29	2017-02-28 Brad Tsui (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 5	3		9	1
145	2017-03-02 19:52:11.969+08	28	2017-02-28 Lily Wong (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 6	3		9	1
146	2017-03-02 19:52:11.971+08	27	2017-02-28 Lily Wong (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 5	3		9	1
147	2017-03-02 19:52:11.973+08	26	2017-02-28 Edward Chu (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 6	3		9	1
148	2017-03-02 19:52:11.975+08	25	2017-02-28 Edward Chu (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 5	3		9	1
149	2017-03-02 19:52:11.977+08	24	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 6	3		9	1
150	2017-03-02 19:52:11.978+08	23	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 5	3		9	1
151	2017-03-02 19:52:11.981+08	22	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 6	3		9	1
152	2017-03-02 19:52:11.983+08	21	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 5	3		9	1
153	2017-03-02 19:52:11.985+08	20	2017-02-28 Lily Wong (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 4	3		9	1
154	2017-03-02 19:52:11.986+08	19	2017-02-28 Lily Wong (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 3	3		9	1
155	2017-03-02 19:52:11.988+08	18	2017-02-28 Edward Chu (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 4	3		9	1
156	2017-03-02 19:52:11.989+08	17	2017-02-28 Edward Chu (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 3	3		9	1
157	2017-03-02 19:52:11.992+08	16	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 4	3		9	1
158	2017-03-02 19:52:11.994+08	15	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 3	3		9	1
159	2017-03-02 19:52:11.996+08	14	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 4	3		9	1
160	2017-03-02 19:52:11.998+08	13	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 3	3		9	1
161	2017-03-02 19:52:12+08	12	2017-02-28 Brad Tsui (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 4	3		9	1
162	2017-03-02 19:52:12.002+08	11	2017-02-28 Brad Tsui (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 3	3		9	1
163	2017-03-02 19:52:12.004+08	10	2017-02-28 Edward Chu (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 2	3		9	1
164	2017-03-02 19:52:12.006+08	9	2017-02-28 Edward Chu (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 1	3		9	1
165	2017-03-02 19:52:12.008+08	8	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 2	3		9	1
166	2017-03-02 19:52:12.01+08	7	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 1	3		9	1
167	2017-03-02 19:52:12.013+08	6	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 2	3		9	1
168	2017-03-02 19:52:12.015+08	5	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 1	3		9	1
169	2017-03-02 19:52:12.017+08	4	2017-02-28 Brad Tsui (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 2	3		9	1
170	2017-03-02 19:52:12.019+08	3	2017-02-28 Brad Tsui (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 1	3		9	1
171	2017-03-02 19:52:12.021+08	2	2017-02-28 Lily Wong (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 2	3		9	1
172	2017-03-02 19:52:12.023+08	1	2017-02-28 Lily Wong (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 1	3		9	1
173	2017-03-02 19:52:43.559+08	15	2017-02-28 Brad Tsui (Anything is Fine) vs. Alex Wang (Pink Platypuses) 	3		6	1
174	2017-03-02 19:52:43.562+08	14	2017-02-28 Lily Wong (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) 	3		6	1
175	2017-03-02 19:52:43.564+08	13	2017-02-28 Edward Chu (Anything is Fine) vs. Fiona Chow (Pink Platypuses) 	3		6	1
176	2017-03-02 19:52:43.566+08	12	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Coleman Yip (Pink Platypuses) 	3		6	1
177	2017-03-02 19:52:43.568+08	11	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Clarence Yung (Pink Platypuses) 	3		6	1
178	2017-03-02 19:52:43.569+08	10	2017-02-28 Lily Wong (Anything is Fine) vs. Alex Wang (Pink Platypuses) 	3		6	1
179	2017-03-02 19:52:43.572+08	9	2017-02-28 Edward Chu (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) 	3		6	1
180	2017-03-02 19:52:43.574+08	8	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) 	3		6	1
181	2017-03-02 19:52:43.576+08	7	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Coleman Yip (Pink Platypuses) 	3		6	1
182	2017-03-02 19:52:43.578+08	6	2017-02-28 Brad Tsui (Anything is Fine) vs. Clarence Yung (Pink Platypuses) 	3		6	1
183	2017-03-02 19:52:43.58+08	5	2017-02-28 Edward Chu (Anything is Fine) vs. Alex Wang (Pink Platypuses) 	3		6	1
184	2017-03-02 19:52:43.581+08	4	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) 	3		6	1
185	2017-03-02 19:52:43.583+08	3	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Fiona Chow (Pink Platypuses) 	3		6	1
186	2017-03-02 19:52:43.584+08	2	2017-02-28 Brad Tsui (Anything is Fine) vs. Coleman Yip (Pink Platypuses) 	3		6	1
187	2017-03-02 19:52:43.586+08	1	2017-02-28 Lily Wong (Anything is Fine) vs. Clarence Yung (Pink Platypuses) 	3		6	1
188	2017-03-02 19:55:35.184+08	60	2017-02-28 Edward Chu (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 6	3		9	1
189	2017-03-02 19:55:35.189+08	59	2017-02-28 Edward Chu (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 5	3		9	1
190	2017-03-02 19:55:35.191+08	58	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 6	3		9	1
191	2017-03-02 19:55:35.193+08	57	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 5	3		9	1
192	2017-03-02 19:55:35.195+08	56	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 6	3		9	1
193	2017-03-02 19:55:35.196+08	55	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 5	3		9	1
194	2017-03-02 19:55:35.199+08	54	2017-02-28 Lily Wong (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 6	3		9	1
195	2017-03-02 19:55:35.201+08	53	2017-02-28 Lily Wong (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 5	3		9	1
196	2017-03-02 19:55:35.203+08	52	2017-02-28 Brad Tsui (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 6	3		9	1
197	2017-03-02 19:55:35.205+08	51	2017-02-28 Brad Tsui (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 5	3		9	1
198	2017-03-02 19:55:35.207+08	50	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 4	3		9	1
199	2017-03-02 19:55:35.209+08	49	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 3	3		9	1
200	2017-03-02 19:55:35.211+08	48	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 4	3		9	1
201	2017-03-02 19:55:35.213+08	47	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 3	3		9	1
202	2017-03-02 19:55:35.215+08	46	2017-02-28 Lily Wong (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 4	3		9	1
203	2017-03-02 19:55:35.217+08	45	2017-02-28 Lily Wong (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 3	3		9	1
204	2017-03-02 19:55:35.219+08	44	2017-02-28 Brad Tsui (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 4	3		9	1
205	2017-03-02 19:55:35.221+08	43	2017-02-28 Brad Tsui (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 3	3		9	1
206	2017-03-02 19:55:35.223+08	42	2017-02-28 Edward Chu (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 4	3		9	1
207	2017-03-02 19:55:35.225+08	41	2017-02-28 Edward Chu (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 3	3		9	1
208	2017-03-02 19:55:35.228+08	40	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 2	3		9	1
209	2017-03-02 19:55:35.23+08	39	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 1	3		9	1
210	2017-03-02 19:55:35.231+08	38	2017-02-28 Lily Wong (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 2	3		9	1
211	2017-03-02 19:55:35.233+08	37	2017-02-28 Lily Wong (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 1	3		9	1
212	2017-03-02 19:55:35.236+08	36	2017-02-28 Brad Tsui (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 2	3		9	1
213	2017-03-02 19:55:35.238+08	35	2017-02-28 Brad Tsui (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 1	3		9	1
214	2017-03-02 19:55:35.241+08	34	2017-02-28 Edward Chu (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 2	3		9	1
215	2017-03-02 19:55:35.243+08	33	2017-02-28 Edward Chu (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 1	3		9	1
216	2017-03-02 19:55:35.245+08	32	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 2	3		9	1
217	2017-03-02 19:55:35.246+08	31	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 1	3		9	1
218	2017-03-02 19:55:43.437+08	30	2017-02-28 Edward Chu (Anything is Fine) vs. Alex Wang (Pink Platypuses) 	3		6	1
219	2017-03-02 19:55:43.441+08	29	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) 	3		6	1
220	2017-03-02 19:55:43.443+08	28	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) 	3		6	1
221	2017-03-02 19:55:43.445+08	27	2017-02-28 Lily Wong (Anything is Fine) vs. Coleman Yip (Pink Platypuses) 	3		6	1
222	2017-03-02 19:55:43.447+08	26	2017-02-28 Brad Tsui (Anything is Fine) vs. Clarence Yung (Pink Platypuses) 	3		6	1
223	2017-03-02 19:55:43.449+08	25	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Alex Wang (Pink Platypuses) 	3		6	1
224	2017-03-02 19:55:43.451+08	24	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) 	3		6	1
225	2017-03-02 19:55:43.453+08	23	2017-02-28 Lily Wong (Anything is Fine) vs. Fiona Chow (Pink Platypuses) 	3		6	1
226	2017-03-02 19:55:43.454+08	22	2017-02-28 Brad Tsui (Anything is Fine) vs. Coleman Yip (Pink Platypuses) 	3		6	1
227	2017-03-02 19:55:43.456+08	21	2017-02-28 Edward Chu (Anything is Fine) vs. Clarence Yung (Pink Platypuses) 	3		6	1
228	2017-03-02 19:55:43.458+08	20	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Alex Wang (Pink Platypuses) 	3		6	1
229	2017-03-02 19:55:43.46+08	19	2017-02-28 Lily Wong (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) 	3		6	1
230	2017-03-02 19:55:43.462+08	18	2017-02-28 Brad Tsui (Anything is Fine) vs. Fiona Chow (Pink Platypuses) 	3		6	1
231	2017-03-02 19:55:43.464+08	17	2017-02-28 Edward Chu (Anything is Fine) vs. Coleman Yip (Pink Platypuses) 	3		6	1
232	2017-03-02 19:55:43.467+08	16	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Clarence Yung (Pink Platypuses) 	3		6	1
233	2017-03-02 20:03:55.337+08	57	2017-02-28 Anything is Fine vs. Pink Platypuses	2	[{"changed": {"fields": ["is_initialized"]}}]	7	1
234	2017-03-05 00:52:11.421+08	7	Qijie Chu	2	[{"changed": {"fields": ["name"]}}]	3	1
235	2017-03-05 00:53:16.06+08	5	Henrik Pedersen	2	[{"changed": {"fields": ["name", "username"]}}]	3	1
236	2017-03-05 00:53:43.57+08	3	Deep Vaswani	2	[{"changed": {"fields": ["name"]}}]	3	1
237	2017-03-05 09:17:22.298+08	38	Jon Somers	1	[{"added": {}}]	3	1
238	2017-03-05 09:17:41.611+08	57	Jon Somers (Dram Good Shots)	2	[{"changed": {"fields": ["player"]}}]	5	1
239	2017-03-05 10:28:56.619+08	1	That's a Beautiful Rack	2	[{"changed": {"fields": ["capitain"]}}]	4	1
240	2017-03-05 10:29:17.295+08	48	Catherine Fu	2	[{"changed": {"fields": ["name"]}}]	3	1
241	2017-03-05 10:30:56.876+08	8	The Meanions	2	[{"changed": {"fields": ["capitain"]}}]	4	1
242	2017-03-05 10:37:00.477+08	34	Olive Lai	2	[{"changed": {"fields": ["sex"]}}]	3	1
243	2017-03-05 10:37:11.133+08	23	Joyce Lai	2	[{"changed": {"fields": ["sex"]}}]	3	1
244	2017-03-05 19:36:18.256+08	61	2017-02-28 Edward Chu (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
245	2017-03-05 19:36:59.869+08	62	2017-02-28 Edward Chu (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score", "is_clearance", "cleared_by"]}}]	9	1
246	2017-03-05 19:40:58.068+08	63	2017-02-28 Brad Tsui (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
247	2017-03-05 19:41:10.83+08	64	2017-02-28 Brad Tsui (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
248	2017-03-05 19:41:35.379+08	65	2017-02-28 Lily Wong (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
249	2017-03-05 19:41:47.939+08	66	2017-02-28 Lily Wong (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
250	2017-03-05 19:42:13.968+08	67	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
251	2017-03-05 19:42:26.507+08	76	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
252	2017-03-05 19:42:53.351+08	69	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
253	2017-03-05 19:43:07.184+08	70	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
254	2017-03-05 19:43:38.561+08	71	2017-02-28 Brad Tsui (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
255	2017-03-05 19:44:06.476+08	72	2017-02-28 Brad Tsui (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
256	2017-03-05 19:44:34.249+08	73	2017-02-28 Lily Wong (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
257	2017-03-05 19:44:47.113+08	74	2017-02-28 Lily Wong (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
258	2017-03-05 19:45:04.151+08	75	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 3	2	[{"changed": {"fields": ["away_score"]}}]	9	1
259	2017-03-05 19:46:25.286+08	68	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
260	2017-03-05 19:46:49.439+08	76	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 4	2	[{"changed": {"fields": ["home_score"]}}]	9	1
261	2017-03-05 19:47:02.471+08	75	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 3	2	[{"changed": {"fields": ["is_clearance", "cleared_by"]}}]	9	1
262	2017-03-05 19:47:21.775+08	77	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
263	2017-03-05 19:47:41.472+08	78	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 4	2	[{"changed": {"fields": ["away_score", "is_clearance", "cleared_by"]}}]	9	1
264	2017-03-05 19:47:59.138+08	79	2017-02-28 Edward Chu (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
265	2017-03-05 19:48:09.693+08	80	2017-02-28 Edward Chu (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
266	2017-03-05 19:48:29.661+08	81	2017-02-28 Lily Wong (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
267	2017-03-05 19:48:40.348+08	82	2017-02-28 Lily Wong (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
268	2017-03-05 19:49:15.271+08	83	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
269	2017-03-05 19:49:42.654+08	84	2017-02-28 Yuri Aguilar (Anything is Fine) vs. Coleman Yip (Pink Platypuses) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score", "is_clearance", "cleared_by"]}}]	9	1
270	2017-03-05 19:50:19.116+08	85	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
271	2017-03-05 19:50:27.522+08	86	2017-02-28 Alvaro Monteiro (Anything is Fine) vs. Fiona Chow (Pink Platypuses) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
272	2017-03-05 19:50:41.244+08	87	2017-02-28 Edward Chu (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
273	2017-03-05 19:50:50.44+08	88	2017-02-28 Edward Chu (Anything is Fine) vs. Jay Gonzalez (Pink Platypuses) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
274	2017-03-05 19:51:21.366+08	89	2017-02-28 Brad Tsui (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
275	2017-03-05 19:51:33.657+08	90	2017-02-28 Brad Tsui (Anything is Fine) vs. Alex Wang (Pink Platypuses) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
276	2017-03-05 20:32:26.299+08	46	2017-03-01 Ryan McCarthy (Just the Tip) vs. Simon Yeung (The Meanions) 	3		6	1
277	2017-03-05 22:14:58.176+08	120	2017-03-01 Safee Shah (Just the Tip) vs. Andrew Hollingshead (The Meanions) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
278	2017-03-05 22:23:51.284+08	91	2017-03-01 Ryan McCarthy (Just the Tip) vs. Simon Yeung (The Meanions) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
279	2017-03-05 22:24:08.392+08	92	2017-03-01 Ryan McCarthy (Just the Tip) vs. Simon Yeung (The Meanions) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
280	2017-03-05 22:24:24.973+08	93	2017-03-01 Safee Shah (Just the Tip) vs. Nick Fong (The Meanions) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
281	2017-03-11 23:04:26.965+08	93	2017-03-01 Safee Shah (Just the Tip) vs. Nick Fong (The Meanions) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
282	2017-03-11 23:04:30.327+08	93	2017-03-01 Safee Shah (Just the Tip) vs. Nick Fong (The Meanions) Leg 1	2	[]	9	1
283	2017-03-11 23:04:51.193+08	94	2017-03-01 Safee Shah (Just the Tip) vs. Nick Fong (The Meanions) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
284	2017-03-11 23:05:12.878+08	103	2017-03-01 Mancy Howe (Just the Tip) vs. Nick Fong (The Meanions) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
285	2017-03-11 23:05:27.979+08	96	2017-03-01 Mancy Howe (Just the Tip) vs. Olive Lai (The Meanions) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
286	2017-03-11 23:06:06.806+08	97	2017-03-01 Parsad Tamang (Just the Tip) vs. Clara Szeto (The Meanions) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
287	2017-03-11 23:06:31.035+08	98	2017-03-01 Parsad Tamang (Just the Tip) vs. Clara Szeto (The Meanions) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
288	2017-03-11 23:06:51.904+08	99	2017-03-01 Nick Lok (Just the Tip) vs. Andrew Hollingshead (The Meanions) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
289	2017-03-11 23:07:08.892+08	100	2017-03-01 Nick Lok (Just the Tip) vs. Andrew Hollingshead (The Meanions) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
290	2017-03-11 23:07:55.63+08	101	2017-03-01 Safee Shah (Just the Tip) vs. Simon Yeung (The Meanions) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
291	2017-03-11 23:08:06.733+08	102	2017-03-01 Safee Shah (Just the Tip) vs. Simon Yeung (The Meanions) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
292	2017-03-11 23:08:47.969+08	95	2017-03-01 Mancy Howe (Just the Tip) vs. Olive Lai (The Meanions) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
293	2017-03-11 23:09:05.856+08	103	2017-03-01 Mancy Howe (Just the Tip) vs. Nick Fong (The Meanions) Leg 3	2	[{"changed": {"fields": ["home_score"]}}]	9	1
294	2017-03-11 23:09:58.979+08	104	2017-03-01 Mancy Howe (Just the Tip) vs. Nick Fong (The Meanions) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
295	2017-03-11 23:10:21.857+08	105	2017-03-01 Parsad Tamang (Just the Tip) vs. Olive Lai (The Meanions) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
296	2017-03-11 23:10:37.208+08	106	2017-03-01 Parsad Tamang (Just the Tip) vs. Olive Lai (The Meanions) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
297	2017-03-11 23:10:56.543+08	107	2017-03-01 Nick Lok (Just the Tip) vs. Clara Szeto (The Meanions) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
298	2017-03-11 23:11:04.382+08	108	2017-03-01 Nick Lok (Just the Tip) vs. Clara Szeto (The Meanions) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
299	2017-03-11 23:11:24.184+08	109	2017-03-01 Ryan McCarthy (Just the Tip) vs. Andrew Hollingshead (The Meanions) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
300	2017-03-11 23:11:35.797+08	110	2017-03-01 Ryan McCarthy (Just the Tip) vs. Andrew Hollingshead (The Meanions) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
301	2017-03-11 23:12:53.503+08	111	2017-03-01 Mancy Howe (Just the Tip) vs. Simon Yeung (The Meanions) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
302	2017-03-11 23:13:10.009+08	112	2017-03-01 Mancy Howe (Just the Tip) vs. Simon Yeung (The Meanions) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
303	2017-03-11 23:13:30.745+08	113	2017-03-01 Parsad Tamang (Just the Tip) vs. Nick Fong (The Meanions) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
304	2017-03-11 23:13:43.904+08	114	2017-03-01 Parsad Tamang (Just the Tip) vs. Nick Fong (The Meanions) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
305	2017-03-11 23:14:14.099+08	115	2017-03-01 Nick Lok (Just the Tip) vs. Olive Lai (The Meanions) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
306	2017-03-11 23:14:23.896+08	116	2017-03-01 Nick Lok (Just the Tip) vs. Olive Lai (The Meanions) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
307	2017-03-11 23:14:35.619+08	117	2017-03-01 Ryan McCarthy (Just the Tip) vs. Clara Szeto (The Meanions) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
308	2017-03-11 23:15:20.401+08	119	2017-03-01 Safee Shah (Just the Tip) vs. Andrew Hollingshead (The Meanions) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
309	2017-03-11 23:15:30.413+08	120	2017-03-01 Safee Shah (Just the Tip) vs. Andrew Hollingshead (The Meanions) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
310	2017-03-11 23:17:20.919+08	118	2017-03-01 Ryan McCarthy (Just the Tip) vs. Clara Szeto (The Meanions) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
311	2017-03-11 23:24:04.618+08	68	Seungrae Kim	1	[{"added": {}}]	3	1
312	2017-03-11 23:24:27.673+08	100	Seungrae Kim (Dram Good Shots)	1	[{"added": {}}]	5	1
313	2017-03-11 23:41:45.773+08	121	2017-03-01 Joel Buenafe (The Abangers) vs. Kuro Kawamura (Dram Good Shots) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
314	2017-03-11 23:42:04.175+08	122	2017-03-01 Joel Buenafe (The Abangers) vs. Kuro Kawamura (Dram Good Shots) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
315	2017-03-11 23:42:24.942+08	123	2017-03-01 Elton Zablan (The Abangers) vs. Seungrae Kim (Dram Good Shots) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
316	2017-03-11 23:42:37.452+08	124	2017-03-01 Elton Zablan (The Abangers) vs. Seungrae Kim (Dram Good Shots) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
317	2017-03-11 23:42:56.215+08	125	2017-03-01 Bertha Yeung (The Abangers) vs. Joyce Lai (Dram Good Shots) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
318	2017-03-11 23:43:14.149+08	126	2017-03-01 Bertha Yeung (The Abangers) vs. Joyce Lai (Dram Good Shots) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
319	2017-03-11 23:43:40.038+08	127	2017-03-01 Milan Putik (The Abangers) vs. Billy McCarthy (Dram Good Shots) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
320	2017-03-11 23:43:50.628+08	128	2017-03-01 Milan Putik (The Abangers) vs. Billy McCarthy (Dram Good Shots) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
321	2017-03-11 23:44:06.079+08	129	2017-03-01 Levis Santos (The Abangers) vs. Barney Cox (Dram Good Shots) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
322	2017-03-11 23:44:20.536+08	130	2017-03-01 Levis Santos (The Abangers) vs. Barney Cox (Dram Good Shots) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
323	2017-03-11 23:45:13.166+08	130	2017-03-01 Levis Santos (The Abangers) vs. Barney Cox (Dram Good Shots) Leg 2	2	[]	9	1
324	2017-03-11 23:45:28.503+08	131	2017-03-01 Elton Zablan (The Abangers) vs. Kuro Kawamura (Dram Good Shots) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
325	2017-03-11 23:45:46.056+08	132	2017-03-01 Elton Zablan (The Abangers) vs. Kuro Kawamura (Dram Good Shots) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
326	2017-03-11 23:46:02.267+08	133	2017-03-01 Bertha Yeung (The Abangers) vs. Seungrae Kim (Dram Good Shots) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
327	2017-03-11 23:46:14.139+08	134	2017-03-01 Bertha Yeung (The Abangers) vs. Seungrae Kim (Dram Good Shots) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
328	2017-03-11 23:46:46.549+08	135	2017-03-01 Milan Putik (The Abangers) vs. Joyce Lai (Dram Good Shots) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
329	2017-03-11 23:46:59.091+08	136	2017-03-01 Milan Putik (The Abangers) vs. Joyce Lai (Dram Good Shots) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
330	2017-03-11 23:47:10.95+08	137	2017-03-01 Levis Santos (The Abangers) vs. Billy McCarthy (Dram Good Shots) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
331	2017-03-11 23:47:23.403+08	138	2017-03-01 Levis Santos (The Abangers) vs. Billy McCarthy (Dram Good Shots) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
332	2017-03-11 23:47:49.375+08	139	2017-03-01 Joel Buenafe (The Abangers) vs. Barney Cox (Dram Good Shots) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
333	2017-03-11 23:48:02.609+08	140	2017-03-01 Joel Buenafe (The Abangers) vs. Barney Cox (Dram Good Shots) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
334	2017-03-11 23:49:23.878+08	141	2017-03-01 Bertha Yeung (The Abangers) vs. Kuro Kawamura (Dram Good Shots) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
335	2017-03-11 23:49:32.018+08	142	2017-03-01 Bertha Yeung (The Abangers) vs. Kuro Kawamura (Dram Good Shots) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
336	2017-03-11 23:49:43.501+08	143	2017-03-01 Milan Putik (The Abangers) vs. Seungrae Kim (Dram Good Shots) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
337	2017-03-11 23:49:55.344+08	144	2017-03-01 Milan Putik (The Abangers) vs. Seungrae Kim (Dram Good Shots) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
338	2017-03-11 23:50:14.014+08	145	2017-03-01 Levis Santos (The Abangers) vs. Joyce Lai (Dram Good Shots) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
339	2017-03-11 23:50:56.347+08	146	2017-03-01 Levis Santos (The Abangers) vs. Joyce Lai (Dram Good Shots) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
340	2017-03-11 23:51:04.697+08	147	2017-03-01 Joel Buenafe (The Abangers) vs. Billy McCarthy (Dram Good Shots) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
341	2017-03-11 23:51:15.825+08	148	2017-03-01 Joel Buenafe (The Abangers) vs. Billy McCarthy (Dram Good Shots) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
342	2017-03-11 23:51:26.894+08	149	2017-03-01 Elton Zablan (The Abangers) vs. Barney Cox (Dram Good Shots) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
343	2017-03-11 23:51:34.792+08	150	2017-03-01 Elton Zablan (The Abangers) vs. Barney Cox (Dram Good Shots) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
344	2017-03-12 00:07:01.306+08	151	2017-03-01 Henrik Pedersen (That's a Beautiful Rack) vs. Deep Vaswani (Holy Strokes) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
345	2017-03-12 00:07:13.341+08	152	2017-03-01 Henrik Pedersen (That's a Beautiful Rack) vs. Deep Vaswani (Holy Strokes) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
346	2017-03-12 00:07:41.157+08	153	2017-03-01 Wilson Kong (That's a Beautiful Rack) vs. Samson Cheung (Holy Strokes) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
347	2017-03-12 00:08:24.025+08	154	2017-03-01 Wilson Kong (That's a Beautiful Rack) vs. Samson Cheung (Holy Strokes) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
348	2017-03-12 00:08:37.655+08	155	2017-03-01 Catherine Fu (That's a Beautiful Rack) vs. Annie Hsieh (Holy Strokes) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
349	2017-03-12 00:09:12.743+08	156	2017-03-01 Catherine Fu (That's a Beautiful Rack) vs. Annie Hsieh (Holy Strokes) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
350	2017-03-12 00:09:23.489+08	155	2017-03-01 Catherine Fu (That's a Beautiful Rack) vs. Annie Hsieh (Holy Strokes) Leg 1	2	[]	9	1
351	2017-03-12 00:09:37.279+08	157	2017-03-01 Jaden Law (That's a Beautiful Rack) vs. Qijie Chu (Holy Strokes) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
352	2017-03-12 00:09:52.597+08	158	2017-03-01 Jaden Law (That's a Beautiful Rack) vs. Qijie Chu (Holy Strokes) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
353	2017-03-12 00:10:12.255+08	159	2017-03-01 Dean Chiu (That's a Beautiful Rack) vs. Ka Wang Lau (Holy Strokes) Leg 1	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
354	2017-03-12 00:10:22.639+08	160	2017-03-01 Dean Chiu (That's a Beautiful Rack) vs. Ka Wang Lau (Holy Strokes) Leg 2	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
355	2017-03-12 00:10:48.047+08	161	2017-03-01 Wilson Kong (That's a Beautiful Rack) vs. Deep Vaswani (Holy Strokes) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
356	2017-03-12 00:11:07.06+08	162	2017-03-01 Wilson Kong (That's a Beautiful Rack) vs. Deep Vaswani (Holy Strokes) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
357	2017-03-12 00:11:23.691+08	163	2017-03-01 Catherine Fu (That's a Beautiful Rack) vs. Samson Cheung (Holy Strokes) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
358	2017-03-12 00:12:43.961+08	164	2017-03-01 Catherine Fu (That's a Beautiful Rack) vs. Samson Cheung (Holy Strokes) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
359	2017-03-12 00:13:02.803+08	165	2017-03-01 Jaden Law (That's a Beautiful Rack) vs. Annie Hsieh (Holy Strokes) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
360	2017-03-12 00:13:14.754+08	166	2017-03-01 Jaden Law (That's a Beautiful Rack) vs. Annie Hsieh (Holy Strokes) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
361	2017-03-12 00:14:05.485+08	167	2017-03-01 Dean Chiu (That's a Beautiful Rack) vs. Qijie Chu (Holy Strokes) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
362	2017-03-12 00:14:15.167+08	168	2017-03-01 Dean Chiu (That's a Beautiful Rack) vs. Qijie Chu (Holy Strokes) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
363	2017-03-12 00:14:27.53+08	169	2017-03-01 Henrik Pedersen (That's a Beautiful Rack) vs. Ka Wang Lau (Holy Strokes) Leg 3	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
364	2017-03-12 00:14:43.658+08	170	2017-03-01 Henrik Pedersen (That's a Beautiful Rack) vs. Ka Wang Lau (Holy Strokes) Leg 4	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
365	2017-03-12 00:14:57.922+08	171	2017-03-01 Catherine Fu (That's a Beautiful Rack) vs. Deep Vaswani (Holy Strokes) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
366	2017-03-12 00:15:08.415+08	172	2017-03-01 Catherine Fu (That's a Beautiful Rack) vs. Deep Vaswani (Holy Strokes) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
367	2017-03-12 00:15:23.326+08	173	2017-03-01 Jaden Law (That's a Beautiful Rack) vs. Samson Cheung (Holy Strokes) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
368	2017-03-12 00:15:33.303+08	174	2017-03-01 Jaden Law (That's a Beautiful Rack) vs. Samson Cheung (Holy Strokes) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
369	2017-03-12 00:15:53.953+08	175	2017-03-01 Dean Chiu (That's a Beautiful Rack) vs. Annie Hsieh (Holy Strokes) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
370	2017-03-12 00:16:03.525+08	176	2017-03-01 Dean Chiu (That's a Beautiful Rack) vs. Annie Hsieh (Holy Strokes) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
371	2017-03-12 00:16:18.452+08	177	2017-03-01 Henrik Pedersen (That's a Beautiful Rack) vs. Qijie Chu (Holy Strokes) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
372	2017-03-12 00:16:34.527+08	178	2017-03-01 Henrik Pedersen (That's a Beautiful Rack) vs. Qijie Chu (Holy Strokes) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
373	2017-03-12 00:16:47.527+08	179	2017-03-01 Wilson Kong (That's a Beautiful Rack) vs. Ka Wang Lau (Holy Strokes) Leg 5	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
374	2017-03-12 00:16:58.37+08	180	2017-03-01 Wilson Kong (That's a Beautiful Rack) vs. Ka Wang Lau (Holy Strokes) Leg 6	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	9	1
375	2017-03-12 00:20:27.08+08	101	Qijie Chu (None)	1	[{"added": {}}]	5	1
376	2017-03-12 00:20:52.467+08	102	Kuro Kawamura (None)	1	[{"added": {}}]	5	1
377	2017-03-12 00:21:10.643+08	102	Ka Wang Lau (None)	2	[{"changed": {"fields": ["player"]}}]	5	1
378	2017-03-12 12:10:52.282+08	92	2017-03-12 Ka Wang Lau (None) vs. Qijie Chu (None) 	1	[{"added": {}}]	6	1
379	2017-03-12 12:16:03.264+08	9	Les Trois Mousquetaires	1	[{"added": {}}]	1	1
380	2017-03-12 12:16:14.854+08	102	Ka Wang Lau (Les Trois Mousquetaires)	2	[{"changed": {"fields": ["group"]}}]	5	1
381	2017-03-12 12:16:21.49+08	101	Qijie Chu (Les Trois Mousquetaires)	2	[{"changed": {"fields": ["group"]}}]	5	1
382	2017-03-12 12:19:28.933+08	92	2017-03-12 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires) 	2	[{"changed": {"fields": ["match_type"]}}]	6	1
383	2017-03-12 13:19:45.599+08	71	2017-02-28 Brad Tsui (Anything is Fine) vs. Clarence Yung (Pink Platypuses) Leg 3	2	[{"changed": {"fields": ["away_score"]}}]	9	1
384	2017-03-12 17:18:57.836+08	181	2017-03-12 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires)  - Frame 1	2	[{"changed": {"fields": ["away_score"]}}]	8	1
385	2017-03-12 19:13:42.58+08	190	2017-03-12 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires)  - Frame 10	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	8	1
386	2017-03-12 19:17:20.204+08	192	2017-03-12 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires)  - Frame 12	2	[{"changed": {"fields": ["break_player"]}}]	8	1
387	2017-03-12 19:20:19.381+08	93	2017-03-12 Qijie Chu (Les Trois Mousquetaires) vs. Ka Wang Lau (Les Trois Mousquetaires) 	1	[{"added": {}}]	6	1
388	2017-03-12 19:49:52.849+08	197	2017-03-12 Qijie Chu (Les Trois Mousquetaires) vs. Ka Wang Lau (Les Trois Mousquetaires)  - Frame 4	2	[{"changed": {"fields": ["break_player"]}}]	8	1
389	2017-03-12 20:54:07.945+08	205	2017-03-12 Qijie Chu (Les Trois Mousquetaires) vs. Ka Wang Lau (Les Trois Mousquetaires)  - Frame 12	2	[{"changed": {"fields": ["home_score", "away_score"]}}]	8	1
390	2017-03-12 20:55:11.622+08	94	2017-03-12 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires) 	1	[{"added": {}}]	6	1
391	2017-03-12 23:02:08.63+08	94	2017-03-12 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires) 	3		6	1
392	2017-03-12 23:40:23.54+08	112	2017-05-31 The Abangers vs. Just the Tip	2	[{"changed": {"fields": ["score_type"]}}]	7	1
393	2017-03-12 23:40:45.465+08	60	2017-03-01 The Abangers vs. Dram Good Shots	2	[{"changed": {"fields": ["score_type"]}}]	7	1
394	2017-03-13 00:14:57.787+08	93	2017-03-12 Qijie Chu (Les Trois Mousquetaires) vs. Ka Wang Lau (Les Trois Mousquetaires) 	2	[{"changed": {"fields": ["winner"]}}]	6	1
395	2017-03-13 00:18:58.288+08	92	2017-03-12 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires) 	2	[{"changed": {"fields": ["winner"]}}]	6	1
396	2017-03-13 00:21:01.041+08	57	2017-02-28 Anything is Fine vs. Pink Platypuses	2	[{"changed": {"fields": ["is_completed", "winner"]}}]	7	1
397	2017-03-13 00:21:23.244+08	58	2017-03-01 Just the Tip vs. The Meanions	2	[{"changed": {"fields": ["is_completed", "winner"]}}]	7	1
398	2017-03-13 00:21:38.851+08	59	2017-03-01 That's a Beautiful Rack vs. Holy Strokes	2	[{"changed": {"fields": ["is_completed", "winner"]}}]	7	1
399	2017-03-13 00:21:59.181+08	60	2017-03-01 The Abangers vs. Dram Good Shots	2	[{"changed": {"fields": ["is_completed", "winner"]}}]	7	1
400	2017-03-14 23:44:15.049+08	69	Nancy Tsao	1	[{"added": {}}]	3	1
401	2017-03-14 23:44:37.151+08	103	Nancy Tsao (The Abangers)	1	[{"added": {}}]	5	1
402	2017-03-14 23:57:27.73+08	213	2017-03-07 Samson Cheung (Holy Strokes) vs. Levis Santos (The Abangers) Leg 1	2	[{"changed": {"fields": ["cleared_by"]}}]	9	1
403	2017-03-14 23:58:07.618+08	207	2017-03-07 Deep Vaswani (Holy Strokes) vs. Milan Putik (The Abangers) Leg 1	2	[{"changed": {"fields": ["cleared_by"]}}]	9	1
404	2017-03-14 23:58:51.11+08	225	2017-03-07 Deep Vaswani (Holy Strokes) vs. Joel Buenafe (The Abangers) Leg 3	2	[{"changed": {"fields": ["cleared_by"]}}]	9	1
405	2017-03-14 23:59:32.654+08	233	2017-03-07 Deep Vaswani (Holy Strokes) vs. Levis Santos (The Abangers) Leg 5	2	[{"changed": {"fields": ["cleared_by"]}}]	9	1
406	2017-03-14 23:59:54.496+08	235	2017-03-07 Cyrus Wu (Holy Strokes) vs. Joel Buenafe (The Abangers) Leg 5	2	[{"changed": {"fields": ["cleared_by"]}}]	9	1
407	2017-03-15 00:02:43.314+08	235	2017-03-07 Cyrus Wu (Holy Strokes) vs. Joel Buenafe (The Abangers) Leg 5	2	[{"changed": {"fields": ["is_clearance"]}}]	9	1
408	2017-03-15 00:02:51.639+08	233	2017-03-07 Deep Vaswani (Holy Strokes) vs. Levis Santos (The Abangers) Leg 5	2	[{"changed": {"fields": ["is_clearance"]}}]	9	1
409	2017-03-15 00:03:16.802+08	225	2017-03-07 Deep Vaswani (Holy Strokes) vs. Joel Buenafe (The Abangers) Leg 3	2	[{"changed": {"fields": ["is_clearance"]}}]	9	1
410	2017-03-15 00:03:25.17+08	207	2017-03-07 Deep Vaswani (Holy Strokes) vs. Milan Putik (The Abangers) Leg 1	2	[{"changed": {"fields": ["is_clearance"]}}]	9	1
411	2017-03-15 00:03:34.454+08	213	2017-03-07 Samson Cheung (Holy Strokes) vs. Levis Santos (The Abangers) Leg 1	2	[{"changed": {"fields": ["is_clearance"]}}]	9	1
412	2017-03-15 23:15:46.886+08	2	Week 2 Mar 12, 2017-Mar 19, 2017	2	[{"changed": {"fields": ["start_date", "end_date"]}}]	11	1
413	2017-03-17 20:09:20.8+08	64	2017-03-15 4 vs. 5 @ Racks	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
414	2017-03-17 20:09:35.518+08	106	2017-05-31 5 vs. 4 @ Billidart	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
415	2017-03-17 20:10:37.215+08	64	2017-03-16 4 vs. 5 @ Racks	2	[{"changed": {"fields": ["match_date"]}}]	7	1
416	2017-03-17 20:11:45.937+08	68	2017-03-21 1 vs. 6 @ Racks	2	[{"changed": {"fields": ["match_date"]}}]	7	1
417	2017-03-17 20:11:56.145+08	67	2017-03-22 2 vs. 7 @ Racks	2	[{"changed": {"fields": ["match_date"]}}]	7	1
418	2017-03-17 20:13:05.336+08	75	2017-04-01 4 vs. 1 @ Billidart	2	[{"changed": {"fields": ["match_date", "home", "away"]}}]	7	1
419	2017-03-17 20:13:24.641+08	75	2017-04-04 4 vs. 1 @ Billidart	2	[{"changed": {"fields": ["match_date"]}}]	7	1
420	2017-03-17 20:13:48.856+08	74	2017-04-04 4 vs. 1 @ Racks	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
421	2017-03-17 20:14:12.712+08	76	2017-04-05 7 vs. 6 @ Racks	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
422	2017-03-17 20:14:33.727+08	75	2017-04-04 2 vs. 3 @ Billidart	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
423	2017-03-17 20:14:55.662+08	75	2017-04-05 2 vs. 3 @ Billidart	2	[{"changed": {"fields": ["match_date"]}}]	7	1
424	2017-03-17 20:15:37.328+08	83	2017-04-19 4 vs. 3 @ Racks	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
425	2017-03-17 20:16:20.869+08	84	2017-04-19 7 vs. 5 @ Billidart	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
426	2017-03-17 20:18:40.544+08	96	2017-05-10 6 vs. 7 @ Billidart	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
427	2017-03-17 20:19:00.536+08	100	2017-05-17 5 vs. 7 @ Racks	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
428	2017-03-17 20:19:20.088+08	99	2017-05-17 3 vs. 4 @ Billidart	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
429	2017-03-17 20:20:05.836+08	101	2017-05-23 3 vs. 2 @ Racks	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
430	2017-03-17 20:20:26.083+08	102	2017-05-24 1 vs. 4 @ Billidart	2	[{"changed": {"fields": ["home", "away"]}}]	7	1
431	2017-03-17 20:24:12.494+08	59	2017-03-08 3 vs. 7 @ Billidart	2	[{"changed": {"fields": ["match_date"]}}]	7	1
432	2017-03-17 22:39:13.334+08	70	Simpson	1	[{"added": {}}]	3	1
433	2017-03-17 22:39:58.957+08	104	Simpson (Just the Tip)	1	[{"added": {}}]	5	1
434	2017-03-18 16:58:44.689+08	70	Simpson Wong	2	[{"changed": {"fields": ["name", "username"]}}]	3	1
435	2017-03-18 16:59:15.755+08	71	James Dwyer	1	[{"added": {}}]	3	1
436	2017-03-18 16:59:44.218+08	105	James Dwyer (The Meanions)	1	[{"added": {}}]	5	1
437	2017-03-19 00:40:51.378+08	320	2017-03-15 Andrew Hollingshead (The Meanions) vs. Stephane Meister (Anything is Fine) Leg 6	2	[{"changed": {"fields": ["is_clearance"]}}]	9	1
438	2017-03-19 00:41:22.801+08	293	2017-03-16 Kam Daswani (Dram Good Shots) vs. Parsad Tamang (Just the Tip) Leg 5	2	[{"changed": {"fields": ["is_clearance"]}}]	9	1
439	2017-03-19 00:42:15.71+08	44	Stephane Meister (Anything is Fine)	2	[{"changed": {"fields": ["points", "total_clearance", "season_clearance"]}}]	5	1
440	2017-03-19 00:42:34.193+08	56	Kam Daswani (Dram Good Shots)	2	[{"changed": {"fields": ["points", "total_clearance", "season_clearance"]}}]	5	1
441	2017-03-19 10:54:14.088+08	1	Week 1 Feb 26, 2017-Mar 12, 2017	2	[{"changed": {"fields": ["end_date"]}}]	11	1
442	2017-03-19 15:29:02.873+08	92	2017-03-12 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires) 	2	[{"changed": {"fields": ["break_type"]}}]	6	1
443	2017-03-19 15:29:20.558+08	93	2017-03-12 Qijie Chu (Les Trois Mousquetaires) vs. Ka Wang Lau (Les Trois Mousquetaires) 	2	[{"changed": {"fields": ["break_type"]}}]	6	1
444	2017-03-19 15:53:14.518+08	155	2017-03-19 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires) 	1	[{"added": {}}]	6	1
445	2017-03-19 16:15:28.137+08	327	2017-03-19 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires)  - Frame 1	3		8	1
446	2017-03-19 17:16:33.658+08	155	2017-03-19 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires) 	2	[{"changed": {"fields": ["number_frames"]}}]	6	1
447	2017-03-19 17:17:21.534+08	328	2017-03-19 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires)  - Frame 2	3		8	1
448	2017-03-19 21:47:37.081+08	155	2017-03-19 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires) 	2	[{"changed": {"fields": ["is_completed", "winner"]}}]	6	1
449	2017-03-19 21:48:39.192+08	333	2017-03-19 Ka Wang Lau (Les Trois Mousquetaires) vs. Qijie Chu (Les Trois Mousquetaires)  - Frame 5	2	[{"changed": {"fields": ["home_score"]}}]	8	1
450	2017-03-23 23:49:21.969+08	72	Fon Sarndok	1	[{"added": {}}]	3	1
451	2017-03-23 23:50:30.418+08	106	Fon Sarndok (Dram Good Shots)	1	[{"added": {}}]	5	1
452	2017-03-26 11:41:07.78+08	4	Pink Platypuses (1)	2	[{"changed": {"fields": ["total_legs_won", "season_legs_won"]}}]	4	1
453	2017-03-30 22:38:27.336+08	73	Keir Oakes	1	[{"added": {}}]	3	1
454	2017-03-30 22:38:53.504+08	107	Keir Oakes (The Meanions)	1	[{"added": {}}]	5	1
455	2017-03-30 22:44:23.307+08	74	Yolanda Leung	1	[{"added": {}}]	3	1
456	2017-03-30 22:44:39.238+08	108	Yolanda Leung (That's a Beautiful Rack)	1	[{"added": {}}]	5	1
457	2017-03-30 22:47:07.988+08	75	Hayat Saleh	1	[{"added": {}}]	3	1
458	2017-03-30 22:47:22.423+08	109	Hayat Saleh (That's a Beautiful Rack)	1	[{"added": {}}]	5	1
459	2017-04-29 19:12:53.206+08	76	James K	1	[{"added": {}}]	3	1
460	2017-04-29 19:13:13.229+08	110	James K (Pink Platypuses)	1	[{"added": {}}]	5	1
461	2017-04-30 10:50:39.216+08	395	2017-04-12 Alvaro Monteiro (Anything is Fine) vs. Carmelo Lopez (That's a Beautiful Rack) 	3		6	1
462	2017-04-30 10:50:39.22+08	394	2017-04-12 Yuri Aguilar (Anything is Fine) vs. Hayat Saleh (That's a Beautiful Rack) 	3		6	1
463	2017-04-30 10:50:39.222+08	393	2017-04-12 Lily Wong (Anything is Fine) vs. Wilson Kong (That's a Beautiful Rack) 	3		6	1
464	2017-04-30 10:50:39.224+08	392	2017-04-12 Stephane Meister (Anything is Fine) vs. Henrik Pedersen (That's a Beautiful Rack) 	3		6	1
465	2017-04-30 10:50:39.226+08	391	2017-04-12 Edward Chu (Anything is Fine) vs. Catherine Fu (That's a Beautiful Rack) 	3		6	1
466	2017-04-30 10:50:39.228+08	390	2017-04-12 Alvaro Monteiro (Anything is Fine) vs. Hayat Saleh (That's a Beautiful Rack) 	3		6	1
467	2017-04-30 10:50:39.229+08	389	2017-04-12 Yuri Aguilar (Anything is Fine) vs. Wilson Kong (That's a Beautiful Rack) 	3		6	1
468	2017-04-30 10:50:39.231+08	388	2017-04-12 Lily Wong (Anything is Fine) vs. Henrik Pedersen (That's a Beautiful Rack) 	3		6	1
469	2017-04-30 10:50:39.232+08	387	2017-04-12 Stephane Meister (Anything is Fine) vs. Catherine Fu (That's a Beautiful Rack) 	3		6	1
470	2017-04-30 10:50:39.234+08	386	2017-04-12 Edward Chu (Anything is Fine) vs. Carmelo Lopez (That's a Beautiful Rack) 	3		6	1
471	2017-04-30 10:50:39.236+08	385	2017-04-12 Alvaro Monteiro (Anything is Fine) vs. Wilson Kong (That's a Beautiful Rack) 	3		6	1
472	2017-04-30 10:50:39.237+08	384	2017-04-12 Yuri Aguilar (Anything is Fine) vs. Henrik Pedersen (That's a Beautiful Rack) 	3		6	1
473	2017-04-30 10:50:39.239+08	383	2017-04-12 Lily Wong (Anything is Fine) vs. Catherine Fu (That's a Beautiful Rack) 	3		6	1
474	2017-04-30 10:50:39.24+08	382	2017-04-12 Stephane Meister (Anything is Fine) vs. Carmelo Lopez (That's a Beautiful Rack) 	3		6	1
475	2017-04-30 10:50:39.242+08	381	2017-04-12 Edward Chu (Anything is Fine) vs. Hayat Saleh (That's a Beautiful Rack) 	3		6	1
476	2017-04-30 10:52:10.701+08	80	2017-04-12 Anything is Fine (8) vs. That's a Beautiful Rack (7)	2	[{"changed": {"fields": ["is_initialized", "home_points_raw", "away_points_raw", "_home_ordered_players", "_away_ordered_players"]}}]	7	1
477	2017-04-30 10:53:37.685+08	85	Hayat Saleh (That's a Beautiful Rack)	3		5	1
478	2017-04-30 10:54:31.053+08	53	Hayat Saleh	3		3	1
479	2017-04-30 12:27:33.297+08	77	Ryan Leung	1	[{"added": {}}]	3	1
480	2017-04-30 12:28:11.669+08	111	Ryan Leung (Holy Strokes)	1	[{"added": {}}]	5	1
481	2017-04-30 17:52:53.187+08	84	2017-04-19 That's a Beautiful Rack (7) vs. Dram Good Shots (5)	2	[{"changed": {"fields": ["handicap"]}}]	7	1
482	2017-05-13 01:44:37.684+08	78	Michael Chang	1	[{"added": {}}]	3	1
483	2017-05-13 01:44:54.826+08	112	Michael Chang (Holy Strokes)	1	[{"added": {}}]	5	1
484	2017-05-13 16:07:50.146+08	79	Stanley Wong	1	[{"added": {}}]	3	1
485	2017-05-13 16:08:05.279+08	113	Stanley Wong (The Meanions)	1	[{"added": {}}]	5	1
486	2017-05-14 22:14:44.604+08	1202	2017-05-03 Bertha Yeung (The Abangers) vs. Andrew Hollingshead (The Meanions) Leg 5	2	[{"changed": {"fields": ["away_score"]}}]	9	1
487	2017-05-14 22:15:26.017+08	78	Bertha Yeung (The Abangers)	2	[{"changed": {"fields": ["points", "raw_points", "handicap"]}}]	5	1
488	2017-05-20 12:33:23.663558+08	706	2017-05-17 Andrew Hollingshead (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_completed", "is_submitted"]}}]	6	1
489	2017-05-20 12:34:00.482899+08	702	2017-05-17 Nick Fong (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_completed", "is_submitted"]}}]	6	1
490	2017-05-20 12:34:37.588949+08	698	2017-05-17 Clara Szeto (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_completed", "is_submitted"]}}]	6	1
491	2017-05-22 23:38:49.194598+08	36	Andrew H	2	[{"changed": {"fields": ["name"]}}]	3	1
492	2017-05-22 23:40:15.749538+08	32	Don Kripalani	2	[{"changed": {"fields": ["name", "username"]}}]	3	1
493	2017-05-23 22:18:41.822722+08	101	2017-05-23 Holy Strokes (3) vs. The Meanions (2)	2	[{"changed": {"fields": ["handicap"]}}]	7	1
494	2017-05-24 23:42:45.895762+08	69	Andrew H (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
495	2017-05-24 23:45:38.813726+08	63	Nick Fong (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "handicap", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
496	2017-05-24 23:56:41.243507+08	61	Clara Szeto (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "handicap", "total_matches_played", "season_matches_played", "season_matches_won"]}}]	5	1
497	2017-05-25 00:28:00.786499+08	101	2017-05-23 Holy Strokes (3) vs. The Meanions (2)	2	[{"changed": {"fields": ["away_points_raw"]}}]	7	1
498	2017-05-25 21:21:59.016397+08	96	2017-05-10 The Abangers (6) vs. That's a Beautiful Rack (7)	2	[{"changed": {"fields": ["_away_ordered_players"]}}]	7	1
499	2017-05-25 21:22:57.820821+08	647	2017-05-10 Levis Santos (The Abangers) vs. Will Zhang (That's a Beautiful Rack) 	2	[{"changed": {"fields": ["away"]}}]	6	1
500	2017-05-25 21:23:20.10606+08	643	2017-05-10 Bertha Yeung (The Abangers) vs. Will Zhang (That's a Beautiful Rack) 	2	[{"changed": {"fields": ["away", "winner"]}}]	6	1
501	2017-05-25 21:23:43.417493+08	639	2017-05-10 Mark Morillo (The Abangers) vs. Will Zhang (That's a Beautiful Rack) 	2	[{"changed": {"fields": ["away", "winner"]}}]	6	1
502	2017-05-25 21:24:20.306348+08	1325	2017-05-10 Will Zhang (That's a Beautiful Rack) vs. Levis Santos (The Abangers) Leg 6	2	[{"changed": {"fields": ["away_player"]}}]	9	1
503	2017-05-25 21:24:48.8739+08	1324	2017-05-10 Will Zhang (That's a Beautiful Rack) vs. Levis Santos (The Abangers) Leg 5	2	[{"changed": {"fields": ["away_player"]}}]	9	1
504	2017-05-25 21:25:13.213136+08	1317	2017-05-10 Will Zhang (That's a Beautiful Rack) vs. Bertha Yeung (The Abangers) Leg 4	2	[{"changed": {"fields": ["away_player"]}}]	9	1
505	2017-05-25 21:25:30.416318+08	1316	2017-05-10 Will Zhang (That's a Beautiful Rack) vs. Bertha Yeung (The Abangers) Leg 3	2	[{"changed": {"fields": ["away_player"]}}]	9	1
506	2017-05-25 21:25:51.41149+08	1309	2017-05-10 Will Zhang (That's a Beautiful Rack) vs. Mark Morillo (The Abangers) Leg 2	2	[{"changed": {"fields": ["away_player"]}}]	9	1
507	2017-05-25 21:26:09.994562+08	1308	2017-05-10 Will Zhang (That's a Beautiful Rack) vs. Mark Morillo (The Abangers) Leg 1	2	[{"changed": {"fields": ["away_player"]}}]	9	1
508	2017-05-25 21:36:14.566617+08	706	2017-05-17 Andrew H (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted", "home_score"]}}]	6	1
509	2017-05-25 21:36:40.163589+08	702	2017-05-17 Nick Fong (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted", "home_score"]}}]	6	1
510	2017-05-25 21:37:10.232096+08	698	2017-05-17 Clara Szeto (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted", "home_score"]}}]	6	1
511	2017-05-25 21:37:24.220872+08	706	2017-05-17 Andrew H (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["home_score"]}}]	6	1
512	2017-05-25 21:37:36.919416+08	702	2017-05-17 Nick Fong (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["home_score"]}}]	6	1
513	2017-05-25 22:35:51.710978+08	69	Andrew H (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "handicap", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
514	2017-05-25 22:36:10.478972+08	61	Clara Szeto (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "handicap", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
515	2017-05-25 22:36:59.297113+08	63	Nick Fong (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "handicap", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
516	2017-05-25 22:47:21.125549+08	78	Bertha Yeung (The Abangers)	2	[{"changed": {"fields": ["points", "raw_points", "handicap"]}}]	5	1
517	2017-05-25 22:47:32.080553+08	61	Clara Szeto (The Meanions)	2	[{"changed": {"fields": ["raw_points"]}}]	5	1
518	2017-05-25 23:25:21.997645+08	1548	2017-05-24 Yuri Aguilar (Anything is Fine) vs. Henrik Pedersen (That's a Beautiful Rack) Leg 1	2	[{"changed": {"fields": ["is_clearance", "cleared_by"]}}]	9	1
519	2017-05-25 23:25:49.651114+08	41	Yuri Aguilar (Anything is Fine)	2	[{"changed": {"fields": ["points", "handicap", "total_clearance", "season_clearance"]}}]	5	1
520	2017-05-25 23:27:35.958766+08	103	2017-05-24 The Abangers (6) vs. Dram Good Shots (5)	2	[{"changed": {"fields": ["is_completed"]}}]	7	1
521	2017-05-25 23:37:55.185375+08	103	2017-05-24 The Abangers (6) vs. Dram Good Shots (5)	2	[{"changed": {"fields": ["is_completed"]}}]	7	1
522	2017-05-25 23:43:53.818557+08	705	2017-04-12 Clarence Yung (Pink Platypuses) vs. Samson Cheung (Holy Strokes) Leg 2	2	[{"changed": {"fields": ["is_clearance", "cleared_by"]}}]	9	1
523	2017-05-25 23:44:10.706829+08	70	Clarence Yung (Pink Platypuses)	2	[{"changed": {"fields": ["points", "handicap", "total_clearance", "season_clearance"]}}]	5	1
524	2017-05-27 12:15:13.605829+08	606	2017-04-05 Ka Wang Lau (Holy Strokes) vs. Clara Szeto (The Meanions) Leg 5	2	[{"changed": {"fields": ["home_score"]}}]	9	1
525	2017-05-27 12:16:11.782168+08	288	2017-04-05 Clara Szeto (The Meanions) vs. Ka Wang Lau (Holy Strokes) 	2	[{"changed": {"fields": ["home_score"]}}]	6	1
526	2017-05-27 12:16:37.538754+08	75	2017-04-05 The Meanions (2) vs. Holy Strokes (3)	2	[{"changed": {"fields": ["home_points_raw"]}}]	7	1
527	2017-05-27 12:21:15.075231+08	586	2017-05-03 Andrew H (The Meanions) vs. Bertha Yeung (The Abangers) 	2	[{"changed": {"fields": ["away_score"]}}]	6	1
528	2017-05-27 12:37:47.320652+08	706	2017-05-17 Andrew H (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
529	2017-05-27 12:38:11.866183+08	702	2017-05-17 Nick Fong (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
530	2017-05-27 12:38:40.667627+08	698	2017-05-17 Clara Szeto (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
531	2017-05-27 12:39:37.480229+08	69	Andrew H (The Meanions)	2	[{"changed": {"fields": ["raw_points", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
532	2017-05-27 12:39:57.241157+08	61	Clara Szeto (The Meanions)	2	[{"changed": {"fields": ["raw_points", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
533	2017-05-27 12:40:19.200576+08	63	Nick Fong (The Meanions)	2	[{"changed": {"fields": ["raw_points", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
534	2017-05-29 21:21:48.559429+08	92	2017-05-03 The Meanions (2) vs. The Abangers (6)	2	[{"changed": {"fields": ["away_points_raw"]}}]	7	1
535	2017-05-30 10:56:11.535633+08	2	score	1	[{"added": {}}]	15	1
536	2017-05-30 10:58:50.653902+08	2	scorer	2	[{"changed": {"fields": ["username"]}}]	15	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 536, true);


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year) FROM stdin;
\.


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id) FROM stdin;
\.


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('django_celery_beat_periodictask_id_seq', 1, false);


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY django_content_type (id, app_label, model) FROM stdin;
2	administration	league
3	administration	player
5	administration	member
1	administration	group
4	administration	team
8	recording	frame
9	recording	leagueframe
6	recording	match
7	recording	leaguematch
10	schedule	season
11	schedule	matchweek
12	admin	logentry
13	auth	permission
15	auth	user
14	auth	group
16	contenttypes	contenttype
17	sessions	session
21	django_celery_beat	periodictask
18	django_celery_beat	intervalschedule
19	django_celery_beat	crontabschedule
20	django_celery_beat	periodictasks
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('django_content_type_id_seq', 21, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-05-18 23:23:30.913437+08
2	auth	0001_initial	2017-05-18 23:23:30.97185+08
3	admin	0001_initial	2017-05-18 23:23:31.003287+08
4	admin	0002_logentry_remove_auto_add	2017-05-18 23:23:31.018014+08
5	administration	0001_initial	2017-05-18 23:23:31.073501+08
6	administration	0002_member_raw_points	2017-05-18 23:23:31.091477+08
7	administration	0003_team_capitain	2017-05-18 23:23:31.105571+08
8	administration	0004_member__handicap	2017-05-18 23:23:31.122146+08
9	administration	0005_auto_20170222_2301	2017-05-18 23:23:31.152408+08
10	administration	0006_auto_20170313_2038	2017-05-18 23:23:31.172603+08
11	administration	0007_auto_20170313_2046	2017-05-18 23:23:31.186641+08
12	administration	0008_auto_20170318_2304	2017-05-18 23:23:31.200222+08
13	administration	0009_league_last_update	2017-05-18 23:23:31.216202+08
14	administration	0010_auto_20170319_2314	2017-05-18 23:23:31.254139+08
15	administration	0011_auto_20170319_2317	2017-05-18 23:23:31.288452+08
16	contenttypes	0002_remove_content_type_name	2017-05-18 23:23:31.323541+08
17	auth	0002_alter_permission_name_max_length	2017-05-18 23:23:31.337845+08
18	auth	0003_alter_user_email_max_length	2017-05-18 23:23:31.350854+08
19	auth	0004_alter_user_username_opts	2017-05-18 23:23:31.367013+08
20	auth	0005_alter_user_last_login_null	2017-05-18 23:23:31.380284+08
21	auth	0006_require_contenttypes_0002	2017-05-18 23:23:31.381863+08
22	auth	0007_alter_validators_add_error_messages	2017-05-18 23:23:31.396505+08
23	auth	0008_alter_user_username_max_length	2017-05-18 23:23:31.41046+08
24	django_celery_beat	0001_initial	2017-05-18 23:23:31.442521+08
25	schedule	0001_initial	2017-05-18 23:23:31.460353+08
26	schedule	0002_auto_20170208_2226	2017-05-18 23:23:31.494112+08
27	schedule	0003_auto_20170209_2050	2017-05-18 23:23:31.510983+08
28	recording	0001_initial	2017-05-18 23:23:31.664397+08
29	recording	0002_auto_20170207_2125	2017-05-18 23:23:31.694587+08
30	recording	0003_auto_20170211_1504	2017-05-18 23:23:31.838031+08
31	recording	0004_leagueframe_league_match	2017-05-18 23:23:31.862673+08
32	recording	0005_auto_20170302_1944	2017-05-18 23:23:31.937824+08
33	recording	0006_auto_20170305_1902	2017-05-18 23:23:31.988246+08
34	recording	0007_auto_20170305_2209	2017-05-18 23:23:32.032403+08
35	recording	0008_auto_20170319_1527	2017-05-18 23:23:32.095008+08
36	recording	0009_auto_20170319_1529	2017-05-18 23:23:32.145524+08
37	recording	0010_auto_20170326_1333	2017-05-18 23:23:32.210516+08
38	recording	0011_auto_20170326_1334	2017-05-18 23:23:32.247957+08
39	recording	0012_auto_20170326_2355	2017-05-18 23:23:32.291257+08
40	sessions	0001_initial	2017-05-18 23:23:32.301533+08
41	administration	0012_auto_20170521_0052	2017-05-21 00:52:46.200618+08
42	recording	0013_leaguematch_league	2017-05-27 22:35:22.314727+08
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('django_migrations_id_seq', 42, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
2rahcgh5m29l7ov1z1mpeztpv71xw06i	MmMxNDMyYjg1OWU5ZjQ5M2FhNWJkYzEyMjlhM2Y5ODEyYTFiZDAyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjllNjdkM2E2ZjVhODkzZWUyNmI1YzM3NmFlMzNkOGEyYjQwMjUzNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-03-12 21:33:27.643+08
8kngnbhxj55pio5no0no1elhha0qy2tm	MmMxNDMyYjg1OWU5ZjQ5M2FhNWJkYzEyMjlhM2Y5ODEyYTFiZDAyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjllNjdkM2E2ZjVhODkzZWUyNmI1YzM3NmFlMzNkOGEyYjQwMjUzNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-03-08 23:02:08.364+08
91vn8ig9fkcyai1n6sv6wrmjyejkat6j	MmMxNDMyYjg1OWU5ZjQ5M2FhNWJkYzEyMjlhM2Y5ODEyYTFiZDAyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjllNjdkM2E2ZjVhODkzZWUyNmI1YzM3NmFlMzNkOGEyYjQwMjUzNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-04-12 23:12:02.286+08
dpc6sj7iseljw3ptw8osizh21c51q6bb	MmMxNDMyYjg1OWU5ZjQ5M2FhNWJkYzEyMjlhM2Y5ODEyYTFiZDAyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjllNjdkM2E2ZjVhODkzZWUyNmI1YzM3NmFlMzNkOGEyYjQwMjUzNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-02-21 21:19:15.065+08
hc9wgpojo749s30iyib6wevoyxqq3u0j	YzdiMTEwN2UzNDZlNTYwZDlkZTU1OTRjNmZjODU2YTgzNjY0ZDE2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk4NjFhMTI4MmQxYmIyZjg5YjFhM2FiMWY0MTNiZmFjZjU4OTIwZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-28 23:07:30.495+08
u9rqsanj3lqrmq3v5id3f9woax5trf3z	MmMxNDMyYjg1OWU5ZjQ5M2FhNWJkYzEyMjlhM2Y5ODEyYTFiZDAyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjllNjdkM2E2ZjVhODkzZWUyNmI1YzM3NmFlMzNkOGEyYjQwMjUzNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-03-26 23:01:53.115+08
auxbtpf4tytrq8rk2na6yh7njeou8eaz	OGE1NzhlMjFjNzVmMmEzZTdjOGVmNWI4MjlkOTBiMWE3OTdhZTBmNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTg2MWExMjgyZDFiYjJmODliMWEzYWIxZjQxM2JmYWNmNTg5MjBkZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-02 23:29:26.966325+08
ry89ikpdkmujcfkipgclx6eaoj8j6nmr	YmVmNzQyNmRjYzA1YmM5OGJlZGMwNjA1YjRhZGFiOWE5NmZjMzI5Njp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk4NjFhMTI4MmQxYmIyZjg5YjFhM2FiMWY0MTNiZmFjZjU4OTIwZGQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-06-03 12:31:05.129475+08
4f9uk6c3s0fl20e59q823rx39jxx86ee	OGE1NzhlMjFjNzVmMmEzZTdjOGVmNWI4MjlkOTBiMWE3OTdhZTBmNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTg2MWExMjgyZDFiYjJmODliMWEzYWIxZjQxM2JmYWNmNTg5MjBkZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-06 19:52:03.552191+08
5lhbewzsf3ksi9u0ub9g1kqx8k8rc0c5	YzdiMTEwN2UzNDZlNTYwZDlkZTU1OTRjNmZjODU2YTgzNjY0ZDE2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk4NjFhMTI4MmQxYmIyZjg5YjFhM2FiMWY0MTNiZmFjZjU4OTIwZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-07 07:53:59.115724+08
wu5ihz1j4djg6idw8nvvfnfhx8x3ccpz	ZmRiMWI1Yzk0ZDQwMWZhYjZhNDA2MmI2NzY5MDJiODY3MzE1ZmNmZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODYxYTEyODJkMWJiMmY4OWIxYTNhYjFmNDEzYmZhY2Y1ODkyMGRkIn0=	2017-06-07 18:35:08.961945+08
wt7epwt3bk6uttbrehbkt9q5svexhef2	ODMzYTQ1M2JiNDg2NWJhZWZlZGUxNDAyNmFiODFhMWM2NDQzODgzNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTg2MWExMjgyZDFiYjJmODliMWEzYWIxZjQxM2JmYWNmNTg5MjBkZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-06-07 23:34:50.107977+08
2n5eyqa6g6c8fjuxgjilo2fgz3foownd	OGE1NzhlMjFjNzVmMmEzZTdjOGVmNWI4MjlkOTBiMWE3OTdhZTBmNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTg2MWExMjgyZDFiYjJmODliMWEzYWIxZjQxM2JmYWNmNTg5MjBkZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-08 00:34:07.284264+08
tss0pmrxj324out5zp4t1yll2s7btzua	OGE1NzhlMjFjNzVmMmEzZTdjOGVmNWI4MjlkOTBiMWE3OTdhZTBmNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTg2MWExMjgyZDFiYjJmODliMWEzYWIxZjQxM2JmYWNmNTg5MjBkZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-13 19:06:45.224345+08
7tdt303h6nz1jeku6le2346k0kqecpqo	YzdiMTEwN2UzNDZlNTYwZDlkZTU1OTRjNmZjODU2YTgzNjY0ZDE2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk4NjFhMTI4MmQxYmIyZjg5YjFhM2FiMWY0MTNiZmFjZjU4OTIwZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 22:02:33.80077+08
\.


--
-- Data for Name: recording_frame; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY recording_frame (id, frame_number, home_score, away_score, is_clearance, break_player_id, cleared_by_id, match_id) FROM stdin;
61	1	10	6	f	70	\N	31
62	2	10	7	t	42	70	31
63	1	10	4	f	49	\N	32
64	2	4	10	f	3	\N	32
65	1	10	5	f	47	\N	33
66	2	7	10	f	43	\N	33
67	1	4	10	f	4	\N	34
68	2	6	10	f	41	\N	34
69	1	6	10	f	46	\N	35
70	2	10	6	f	40	\N	35
71	1	10	6	f	70	\N	36
72	2	5	10	f	3	\N	36
73	1	7	10	f	49	\N	37
74	2	1	10	f	43	\N	37
75	1	0	10	t	47	41	38
76	2	3	10	f	41	\N	38
77	1	6	10	f	4	\N	39
78	2	0	10	t	40	40	39
79	1	3	10	f	46	\N	40
80	2	10	6	f	42	\N	40
81	1	10	4	f	70	\N	41
82	2	10	6	f	43	\N	41
83	1	7	10	f	49	\N	42
84	2	1	10	t	41	41	42
85	1	4	10	f	47	\N	43
86	2	5	10	f	40	\N	43
87	1	10	2	f	4	\N	44
88	2	7	10	f	42	\N	44
89	1	10	4	f	46	\N	45
90	2	5	10	f	3	\N	45
91	1	1	10	f	64	\N	47
92	2	6	10	f	74	\N	47
93	1	10	2	f	63	\N	48
94	2	10	6	f	72	\N	48
95	1	3	10	f	67	\N	49
96	2	4	10	f	2	\N	49
97	1	4	10	f	61	\N	50
98	2	0	10	f	73	\N	50
99	1	5	10	f	69	\N	51
100	2	10	6	f	84	\N	51
101	1	6	10	f	64	\N	52
102	2	10	6	f	72	\N	52
103	1	7	10	f	63	\N	53
104	2	10	6	f	2	\N	53
105	1	6	10	f	67	\N	54
106	2	10	6	f	73	\N	54
107	1	4	10	f	61	\N	55
108	2	6	10	f	84	\N	55
109	1	10	6	f	69	\N	56
110	2	6	10	f	74	\N	56
111	1	6	10	f	64	\N	57
112	2	5	10	f	2	\N	57
113	1	10	6	f	63	\N	58
114	2	3	10	f	73	\N	58
115	1	3	10	f	67	\N	59
116	2	7	10	f	84	\N	59
117	1	4	10	f	61	\N	60
118	2	3	10	f	74	\N	60
119	1	1	10	f	69	\N	61
120	2	10	5	f	72	\N	61
121	1	10	4	f	53	\N	62
122	2	6	10	f	92	\N	62
123	1	7	10	f	100	\N	63
124	2	5	10	f	76	\N	63
125	1	1	10	f	54	\N	64
126	2	3	10	f	78	\N	64
127	1	7	10	f	55	\N	65
128	2	10	7	f	88	\N	65
129	1	5	10	f	58	\N	66
130	2	10	6	f	71	\N	66
131	1	1	10	f	53	\N	67
132	2	6	10	f	76	\N	67
133	1	10	5	f	100	\N	68
134	2	10	7	f	78	\N	68
135	1	0	10	f	54	\N	69
136	2	1	10	f	88	\N	69
137	1	5	10	f	55	\N	70
138	2	5	10	f	71	\N	70
139	1	4	10	f	58	\N	71
140	2	10	2	f	92	\N	71
141	1	10	7	f	53	\N	72
142	2	10	4	f	78	\N	72
143	1	3	10	f	100	\N	73
144	2	7	10	f	88	\N	73
145	1	2	10	f	54	\N	74
146	2	1	10	f	71	\N	74
147	1	2	10	f	55	\N	75
148	2	6	10	f	92	\N	75
149	1	2	10	f	58	\N	76
150	2	5	10	f	76	\N	76
151	1	10	2	f	6	\N	77
152	2	7	10	f	1	\N	77
153	1	10	5	f	89	\N	78
154	2	6	10	f	79	\N	78
155	1	10	7	f	81	\N	79
156	2	6	10	f	80	\N	79
157	1	7	10	f	7	\N	80
158	2	10	7	f	91	\N	80
159	1	10	6	f	90	\N	81
160	2	2	10	f	87	\N	81
161	1	10	6	f	6	\N	82
162	2	7	10	f	79	\N	82
163	1	6	10	f	89	\N	83
164	2	10	6	f	80	\N	83
165	1	7	10	f	81	\N	84
166	2	6	10	f	91	\N	84
167	1	7	10	f	7	\N	85
168	2	10	2	f	87	\N	85
169	1	6	10	f	90	\N	86
170	2	6	10	f	1	\N	86
171	1	5	10	f	6	\N	87
172	2	10	6	f	80	\N	87
173	1	10	7	f	89	\N	88
174	2	10	4	f	91	\N	88
175	1	6	10	f	81	\N	89
176	2	10	7	f	87	\N	89
177	1	2	10	f	7	\N	90
178	2	6	10	f	1	\N	90
179	1	10	7	f	90	\N	91
180	2	7	10	f	79	\N	91
181	1	10	2	f	102	\N	92
182	2	6	10	f	101	\N	92
183	3	3	10	f	102	\N	92
184	4	10	2	f	102	\N	92
185	5	5	10	f	101	\N	92
186	6	10	5	f	102	\N	92
187	7	10	6	f	101	\N	92
188	8	5	10	f	101	\N	92
189	9	10	5	f	102	\N	92
190	10	10	5	f	101	\N	92
191	11	4	10	f	101	\N	92
192	12	7	10	f	102	\N	92
193	13	7	10	t	102	102	92
194	1	5	10	f	101	\N	93
195	2	10	6	f	101	\N	93
196	3	7	10	f	102	\N	93
197	4	10	7	f	101	\N	93
198	5	6	10	f	102	\N	93
199	6	6	10	f	101	\N	93
200	7	10	7	f	101	\N	93
201	8	10	7	f	102	\N	93
202	9	6	10	f	102	\N	93
203	10	6	10	f	101	\N	93
204	11	10	3	f	101	\N	93
205	12	10	6	f	102	\N	93
206	13	6	10	f	102	\N	93
207	1	2	10	t	88	6	95
208	2	10	6	f	6	\N	95
209	1	7	10	f	76	\N	96
210	2	5	10	f	93	\N	96
211	1	7	10	f	103	\N	97
212	2	5	10	f	81	\N	97
213	1	10	0	t	71	71	98
214	2	10	3	f	89	\N	98
215	1	10	3	f	92	\N	99
216	2	6	10	f	7	\N	99
217	1	3	10	f	88	\N	100
218	2	5	10	f	93	\N	100
219	1	10	2	f	76	\N	101
220	2	10	5	f	81	\N	101
221	1	5	10	f	103	\N	102
222	2	7	10	f	89	\N	102
223	1	1	10	f	71	\N	103
224	2	7	10	f	7	\N	103
225	1	5	10	t	92	6	104
226	2	7	10	f	6	\N	104
227	1	10	7	f	88	\N	105
228	2	10	4	f	81	\N	105
229	1	7	10	f	76	\N	106
230	2	10	6	f	89	\N	106
231	1	4	10	f	103	\N	107
232	2	7	10	f	7	\N	107
233	1	10	4	t	71	71	108
234	2	4	10	f	6	\N	108
235	1	10	2	t	92	92	109
236	2	6	10	f	93	\N	109
237	1	6	10	f	1	\N	110
238	2	10	6	f	70	\N	110
239	1	3	10	f	83	\N	111
240	2	3	10	f	46	\N	111
241	1	10	6	f	80	\N	112
242	2	7	10	f	47	\N	112
243	1	7	10	f	97	\N	113
244	2	3	10	f	4	\N	113
245	1	10	5	f	79	\N	114
246	2	5	10	f	48	\N	114
247	1	10	6	f	1	\N	115
248	2	6	10	f	46	\N	115
249	1	7	10	f	83	\N	116
250	2	10	6	f	47	\N	116
251	1	4	10	f	80	\N	117
252	2	7	10	f	4	\N	117
253	1	6	10	f	97	\N	118
254	2	5	10	f	48	\N	118
255	1	10	7	f	79	\N	119
256	2	7	10	f	70	\N	119
257	1	10	5	f	1	\N	120
258	2	10	5	f	47	\N	120
259	1	10	6	f	83	\N	121
260	2	2	10	f	4	\N	121
261	1	10	6	f	80	\N	122
262	2	6	10	f	48	\N	122
263	1	6	10	f	97	\N	123
264	2	7	10	f	70	\N	123
265	1	7	10	f	79	\N	124
266	2	4	10	f	46	\N	124
267	1	3	10	f	74	\N	125
268	2	6	10	f	56	\N	125
269	1	10	6	f	104	\N	126
270	2	10	5	f	53	\N	126
271	1	10	7	f	2	\N	127
272	2	10	5	f	54	\N	127
273	1	10	0	f	73	\N	128
274	2	4	10	f	55	\N	128
275	1	7	10	f	84	\N	129
276	2	10	2	f	58	\N	129
277	1	7	10	f	74	\N	130
278	2	10	6	f	53	\N	130
279	1	10	2	f	104	\N	131
280	2	10	4	f	54	\N	131
281	1	7	10	f	2	\N	132
282	2	10	6	f	55	\N	132
283	1	5	10	f	73	\N	133
284	2	10	6	f	58	\N	133
285	1	10	5	f	84	\N	134
286	2	6	10	f	56	\N	134
287	1	10	7	f	74	\N	135
288	2	10	3	f	54	\N	135
289	1	10	5	f	104	\N	136
290	2	10	3	f	55	\N	136
291	1	10	7	f	2	\N	137
292	2	1	10	f	58	\N	137
293	1	0	10	t	73	56	138
294	2	10	7	f	56	\N	138
295	1	10	6	f	84	\N	139
296	2	10	4	f	53	\N	139
297	1	10	7	f	42	\N	140
298	2	6	10	f	62	\N	140
299	1	10	4	f	44	\N	141
300	2	10	3	f	105	\N	141
301	1	7	10	f	43	\N	142
302	2	5	10	f	61	\N	142
303	1	5	10	f	41	\N	143
304	2	10	7	f	69	\N	143
305	1	6	10	f	40	\N	144
306	2	10	5	f	63	\N	144
307	1	4	10	f	42	\N	145
308	2	10	4	f	105	\N	145
309	1	10	6	f	44	\N	146
310	2	10	3	f	61	\N	146
311	1	10	5	f	43	\N	147
312	2	1	10	f	69	\N	147
313	1	10	3	f	41	\N	148
314	2	10	7	f	63	\N	148
315	1	10	6	f	40	\N	149
316	2	10	2	f	62	\N	149
317	1	10	2	f	42	\N	150
318	2	10	5	f	61	\N	150
319	1	10	4	f	44	\N	151
320	2	10	0	t	69	44	151
321	1	10	7	f	43	\N	152
322	2	10	6	f	63	\N	152
323	1	7	10	f	41	\N	153
324	2	10	7	f	62	\N	153
325	1	10	1	f	40	\N	154
326	2	5	10	f	105	\N	154
329	1	10	2	f	101	\N	155
330	2	6	10	f	101	\N	155
331	3	2	10	f	102	\N	155
332	4	10	6	f	102	\N	155
333	5	10	7	f	101	\N	155
334	6	10	6	f	101	\N	155
335	7	7	10	f	101	\N	155
336	8	5	10	f	102	\N	155
337	9	10	6	f	102	\N	155
338	10	5	10	f	101	\N	155
339	11	10	7	f	102	\N	155
340	12	7	10	f	101	\N	155
341	13	7	10	f	102	\N	155
342	1	10	7	f	49	\N	156
343	2	7	10	f	82	\N	156
344	1	10	4	f	4	\N	157
345	2	7	10	f	77	\N	157
346	1	10	3	f	47	\N	158
347	2	10	4	f	78	\N	158
348	1	7	10	f	46	\N	159
349	2	10	5	t	76	46	159
350	1	2	10	t	70	5	160
351	2	10	4	f	5	\N	160
352	1	5	10	f	49	\N	161
353	2	4	10	f	77	\N	161
354	1	10	5	f	4	\N	162
355	2	10	7	f	78	\N	162
356	1	6	10	f	47	\N	163
357	2	6	10	f	76	\N	163
358	1	10	5	f	46	\N	164
359	2	10	6	f	5	\N	164
360	1	4	10	f	70	\N	165
361	2	10	3	f	82	\N	165
362	1	10	6	f	49	\N	166
363	2	6	10	f	78	\N	166
364	1	10	5	f	4	\N	167
365	2	10	6	f	76	\N	167
366	1	4	10	f	47	\N	168
367	2	6	10	f	5	\N	168
368	1	2	10	f	46	\N	169
369	2	10	7	f	82	\N	169
370	1	10	7	f	70	\N	170
371	2	2	10	f	77	\N	170
372	1	10	4	f	104	\N	171
373	2	10	7	f	41	\N	171
374	1	4	10	f	75	\N	172
375	2	5	10	f	44	\N	172
376	1	10	4	f	2	\N	173
377	2	3	10	f	43	\N	173
378	1	6	10	f	84	\N	174
379	2	1	10	f	40	\N	174
380	1	3	10	f	73	\N	175
381	2	10	3	f	45	\N	175
382	1	5	10	f	104	\N	176
383	2	4	10	f	44	\N	176
384	1	10	6	f	75	\N	177
385	2	10	7	f	43	\N	177
386	1	6	10	f	2	\N	178
387	2	10	6	f	40	\N	178
388	1	10	3	f	84	\N	179
389	2	10	7	f	45	\N	179
390	1	10	4	f	73	\N	180
391	2	6	10	f	41	\N	180
392	1	10	6	f	104	\N	181
393	2	10	7	f	43	\N	181
394	1	5	10	f	75	\N	182
395	2	10	7	f	40	\N	182
396	1	6	10	f	2	\N	183
397	2	10	5	f	45	\N	183
398	1	3	10	f	84	\N	184
399	2	1	10	f	41	\N	184
400	1	0	10	t	73	44	185
401	2	6	10	f	44	\N	185
402	1	6	10	f	6	\N	186
403	2	6	10	f	53	\N	186
404	1	10	5	f	7	\N	187
405	2	10	7	f	56	\N	187
406	1	10	1	f	81	\N	188
407	2	10	4	f	106	\N	188
408	1	7	10	f	89	\N	189
409	2	7	10	f	55	\N	189
410	1	5	10	f	90	\N	190
411	2	4	10	f	52	\N	190
412	1	0	10	f	6	\N	191
413	2	10	5	f	56	\N	191
414	1	10	1	f	7	\N	192
415	2	10	2	f	106	\N	192
416	1	3	10	f	81	\N	193
417	2	4	10	f	55	\N	193
418	1	10	7	f	89	\N	194
419	2	0	10	t	52	52	194
420	1	10	6	f	90	\N	195
421	2	10	7	f	53	\N	195
422	1	10	1	f	6	\N	196
423	2	10	3	f	106	\N	196
424	1	10	6	f	7	\N	197
425	2	10	6	f	55	\N	197
426	1	6	10	f	81	\N	198
427	2	5	10	f	52	\N	198
428	1	10	7	f	89	\N	199
429	2	10	4	f	53	\N	199
430	1	5	10	f	90	\N	200
431	2	7	10	f	56	\N	200
432	1	10	5	f	69	\N	201
433	2	10	6	f	79	\N	201
434	1	7	10	f	62	\N	202
435	2	10	7	f	91	\N	202
436	1	10	7	f	61	\N	203
437	2	7	10	f	80	\N	203
438	1	10	7	f	66	\N	204
439	2	5	10	f	1	\N	204
440	1	10	7	f	64	\N	205
441	2	3	10	f	83	\N	205
442	1	6	10	f	69	\N	206
443	2	10	6	f	91	\N	206
444	1	10	4	f	62	\N	207
445	2	10	6	f	80	\N	207
446	1	6	10	f	61	\N	208
447	2	5	10	f	1	\N	208
448	1	6	10	f	66	\N	209
449	2	10	7	f	83	\N	209
450	1	10	7	f	64	\N	210
451	2	10	4	f	79	\N	210
452	1	10	4	f	69	\N	211
453	2	10	1	f	80	\N	211
454	1	4	10	f	62	\N	212
455	2	10	7	f	1	\N	212
456	1	6	10	f	61	\N	213
457	2	6	10	f	83	\N	213
458	1	5	10	f	66	\N	214
459	2	7	10	f	79	\N	214
460	1	10	7	f	64	\N	215
461	2	7	10	f	91	\N	215
462	1	4	10	f	42	\N	216
463	2	6	10	f	7	\N	216
464	1	10	6	f	41	\N	217
465	2	10	5	f	93	\N	217
466	1	10	2	f	43	\N	218
467	2	10	4	f	81	\N	218
468	1	10	5	f	40	\N	219
469	2	10	0	t	6	40	219
470	1	10	7	t	45	45	220
471	2	6	10	f	90	\N	220
472	1	10	5	f	42	\N	221
473	2	6	10	f	93	\N	221
474	1	10	6	t	41	41	222
475	2	10	3	f	81	\N	222
476	1	6	10	f	43	\N	223
477	2	7	10	f	6	\N	223
478	1	10	5	f	40	\N	224
479	2	10	5	f	90	\N	224
480	1	10	5	f	45	\N	225
481	2	3	10	t	7	7	225
482	1	6	10	f	42	\N	226
483	2	10	7	f	81	\N	226
484	1	10	4	f	41	\N	227
485	2	6	10	f	6	\N	227
486	1	10	7	f	43	\N	228
487	2	5	10	f	90	\N	228
488	1	10	5	t	40	40	229
489	2	10	5	f	7	\N	229
490	1	10	3	f	45	\N	230
491	2	10	4	f	93	\N	230
492	1	10	6	f	76	\N	231
493	2	10	7	f	66	\N	231
494	1	10	5	f	71	\N	232
495	2	10	4	f	105	\N	232
496	1	10	7	f	78	\N	233
497	2	5	10	f	67	\N	233
498	1	5	10	f	5	\N	234
499	2	10	6	f	107	\N	234
500	1	10	6	f	77	\N	235
501	2	6	10	f	69	\N	235
502	1	10	3	f	76	\N	236
503	2	10	4	f	105	\N	236
504	1	10	2	f	71	\N	237
505	2	10	1	f	67	\N	237
506	1	6	10	f	78	\N	238
507	2	3	10	f	107	\N	238
508	1	10	6	f	5	\N	239
509	2	10	6	f	69	\N	239
510	1	10	1	f	77	\N	240
511	2	10	6	f	66	\N	240
512	1	10	2	f	76	\N	241
513	2	10	1	f	67	\N	241
514	1	10	5	f	71	\N	242
515	2	10	7	f	107	\N	242
516	1	1	10	f	78	\N	243
517	2	6	10	f	69	\N	243
518	1	10	3	t	5	5	244
519	2	10	6	f	66	\N	244
520	1	4	10	f	77	\N	245
521	2	10	6	f	105	\N	245
522	1	10	7	f	83	\N	246
523	2	7	10	f	73	\N	246
524	1	3	10	f	109	\N	247
525	2	7	10	f	72	\N	247
526	1	7	10	f	108	\N	248
527	2	10	4	f	2	\N	248
528	1	6	10	f	79	\N	249
529	2	1	10	f	104	\N	249
530	1	0	10	t	1	74	250
531	2	3	10	f	74	\N	250
532	1	3	10	f	83	\N	251
533	2	4	10	f	72	\N	251
534	1	7	10	f	109	\N	252
535	2	6	10	f	2	\N	252
536	1	7	10	f	108	\N	253
537	2	2	10	f	104	\N	253
538	1	5	10	f	79	\N	254
539	2	2	10	f	74	\N	254
540	1	10	0	f	1	\N	255
541	2	10	5	f	73	\N	255
542	1	4	10	f	83	\N	256
543	2	7	10	f	2	\N	256
544	1	10	6	f	109	\N	257
545	2	6	10	f	104	\N	257
546	1	3	10	f	108	\N	258
547	2	6	10	f	74	\N	258
548	1	1	10	f	79	\N	259
549	2	5	10	f	73	\N	259
550	1	6	10	f	1	\N	260
551	2	10	4	f	72	\N	260
552	1	7	10	f	52	\N	261
553	2	5	10	f	70	\N	261
554	1	4	10	f	58	\N	262
555	2	10	6	f	46	\N	262
556	1	6	10	f	54	\N	263
557	2	3	10	f	47	\N	263
558	1	3	10	f	55	\N	264
559	2	4	10	f	4	\N	264
560	1	10	2	f	57	\N	265
561	2	6	10	f	49	\N	265
562	1	10	2	f	52	\N	266
563	2	5	10	f	46	\N	266
564	1	10	6	t	58	58	267
565	2	10	2	f	47	\N	267
566	1	3	10	f	54	\N	268
567	2	5	10	f	4	\N	268
568	1	10	5	f	55	\N	269
569	2	4	10	f	49	\N	269
570	1	10	7	f	57	\N	270
571	2	0	10	t	70	70	270
572	1	7	10	f	52	\N	271
573	2	10	5	f	47	\N	271
574	1	6	10	f	58	\N	272
575	2	10	7	f	4	\N	272
576	1	4	10	f	54	\N	273
577	2	6	10	f	49	\N	273
578	1	6	10	f	55	\N	274
579	2	7	10	f	70	\N	274
580	1	7	10	f	57	\N	275
581	2	10	7	f	46	\N	275
582	1	10	5	f	69	\N	276
583	2	7	10	f	7	\N	276
584	1	7	10	f	66	\N	277
585	2	6	10	f	6	\N	277
586	1	5	10	f	61	\N	278
587	2	5	10	f	81	\N	278
588	1	1	10	f	107	\N	279
589	2	5	10	f	89	\N	279
590	1	5	10	f	64	\N	280
591	2	4	10	f	90	\N	280
592	1	5	10	f	69	\N	281
593	2	10	7	f	6	\N	281
594	1	10	6	f	66	\N	282
595	2	10	4	f	81	\N	282
596	1	10	7	f	61	\N	283
597	2	5	10	f	89	\N	283
598	1	10	0	f	107	\N	284
599	2	7	10	f	90	\N	284
600	1	5	10	f	64	\N	285
601	2	1	10	f	7	\N	285
602	1	10	6	f	69	\N	286
603	2	10	1	f	81	\N	286
604	1	1	10	f	66	\N	287
605	2	7	10	f	89	\N	287
607	2	7	10	f	90	\N	288
608	1	10	4	f	107	\N	289
609	2	6	10	f	7	\N	289
610	1	5	10	f	64	\N	290
611	2	10	4	f	6	\N	290
612	1	10	1	f	84	\N	291
613	2	10	2	f	110	\N	291
614	1	10	3	f	73	\N	292
615	2	7	10	f	49	\N	292
616	1	7	10	f	2	\N	293
617	2	10	6	f	47	\N	293
618	1	0	10	t	74	46	294
619	2	10	2	f	46	\N	294
620	1	10	2	f	72	\N	295
621	2	10	7	f	4	\N	295
622	1	10	6	f	84	\N	296
623	2	10	5	f	49	\N	296
624	1	10	5	f	73	\N	297
625	2	10	4	f	47	\N	297
626	1	0	10	t	2	46	298
627	2	10	2	f	46	\N	298
628	1	10	6	f	74	\N	299
629	2	10	6	f	4	\N	299
630	1	10	1	t	72	72	300
631	2	10	2	f	110	\N	300
632	1	10	4	f	84	\N	301
633	2	10	5	f	47	\N	301
634	1	7	10	t	73	46	302
635	2	0	10	t	46	46	302
636	1	10	6	f	2	\N	303
637	2	10	3	f	4	\N	303
638	1	10	7	f	74	\N	304
639	2	10	4	f	110	\N	304
640	1	10	7	f	72	\N	305
641	2	10	2	f	49	\N	305
642	1	10	6	f	53	\N	306
643	2	10	5	f	3	\N	306
644	1	5	10	f	59	\N	307
645	2	4	10	f	41	\N	307
646	1	10	7	f	54	\N	308
647	2	4	10	f	43	\N	308
648	1	4	10	f	57	\N	309
649	2	10	4	f	45	\N	309
650	1	2	10	f	55	\N	310
651	2	7	10	f	40	\N	310
652	1	5	10	f	53	\N	311
653	2	10	7	f	41	\N	311
654	1	7	10	f	59	\N	312
655	2	10	4	f	43	\N	312
656	1	3	10	f	54	\N	313
657	2	4	10	f	45	\N	313
658	1	6	10	f	57	\N	314
659	2	5	10	f	40	\N	314
660	1	7	10	f	55	\N	315
661	2	7	10	f	3	\N	315
662	1	7	10	f	53	\N	316
663	2	7	10	f	43	\N	316
664	1	6	10	f	59	\N	317
665	2	10	2	f	45	\N	317
666	1	1	10	f	54	\N	318
667	2	0	10	t	40	40	318
668	1	7	10	f	57	\N	319
669	2	5	10	f	3	\N	319
670	1	1	10	f	55	\N	320
671	2	3	10	f	41	\N	320
672	1	3	10	f	79	\N	321
673	2	10	3	f	77	\N	321
674	1	7	10	f	97	\N	322
675	2	5	10	f	76	\N	322
676	1	10	3	f	80	\N	323
677	2	7	10	f	78	\N	323
678	1	2	10	f	87	\N	324
679	2	4	10	f	71	\N	324
680	1	0	10	t	1	5	325
681	2	10	3	f	5	\N	325
682	1	7	10	f	79	\N	326
683	2	3	10	f	76	\N	326
684	1	10	7	f	97	\N	327
685	2	6	10	f	78	\N	327
686	1	7	10	f	80	\N	328
687	2	10	0	f	71	\N	328
688	1	4	10	f	87	\N	329
689	2	0	10	t	5	5	329
690	1	10	6	f	1	\N	330
691	2	10	7	f	77	\N	330
692	1	7	10	f	79	\N	331
693	2	10	2	f	78	\N	331
694	1	10	6	f	97	\N	332
695	2	2	10	t	71	71	332
696	1	6	10	f	80	\N	333
697	2	6	10	f	5	\N	333
698	1	10	5	f	87	\N	334
699	2	7	10	f	77	\N	334
700	1	5	10	f	1	\N	335
701	2	10	3	f	76	\N	335
702	1	10	6	f	7	\N	336
703	2	10	0	f	48	\N	336
704	1	6	10	f	89	\N	337
706	1	2	10	f	81	\N	338
707	2	7	10	f	47	\N	338
708	1	10	6	f	6	\N	339
709	2	7	10	f	46	\N	339
710	1	10	6	f	90	\N	340
711	2	10	7	f	4	\N	340
712	1	3	10	f	7	\N	341
713	2	10	7	f	70	\N	341
714	1	10	2	t	89	89	342
715	2	10	1	f	47	\N	342
716	1	10	3	f	81	\N	343
717	2	1	10	f	46	\N	343
718	1	6	10	f	6	\N	344
719	2	5	10	f	4	\N	344
720	1	10	6	f	90	\N	345
721	2	10	6	f	48	\N	345
722	1	10	0	t	7	7	346
723	2	4	10	f	47	\N	346
724	1	10	1	f	89	\N	347
725	2	7	10	f	46	\N	347
726	1	3	10	f	81	\N	348
727	2	10	7	f	4	\N	348
728	1	10	4	f	6	\N	349
729	2	10	3	f	48	\N	349
730	1	10	6	f	90	\N	350
731	2	10	4	f	70	\N	350
732	1	10	5	f	58	\N	351
733	2	10	7	f	66	\N	351
734	1	6	10	f	56	\N	352
735	2	10	6	f	61	\N	352
736	1	4	10	f	54	\N	353
737	2	7	10	f	67	\N	353
738	1	10	7	f	55	\N	354
739	2	1	10	f	69	\N	354
740	1	10	3	f	53	\N	355
741	2	10	7	f	105	\N	355
742	1	10	4	f	58	\N	356
743	2	10	5	f	61	\N	356
744	1	5	10	f	56	\N	357
745	2	7	10	f	67	\N	357
746	1	7	10	f	54	\N	358
747	2	5	10	f	69	\N	358
748	1	7	10	f	55	\N	359
749	2	7	10	f	105	\N	359
750	1	10	2	f	53	\N	360
751	2	5	10	f	66	\N	360
752	1	10	4	f	58	\N	361
753	2	10	3	f	67	\N	361
754	1	10	7	f	56	\N	362
755	2	0	10	t	69	69	362
756	1	10	7	f	54	\N	363
757	2	7	10	f	105	\N	363
758	1	7	10	f	55	\N	364
759	2	2	10	f	66	\N	364
760	1	10	6	f	53	\N	365
761	2	10	7	f	61	\N	365
762	1	10	3	f	77	\N	366
763	2	10	6	f	73	\N	366
764	1	5	10	f	76	\N	367
765	2	10	6	f	72	\N	367
766	1	6	10	f	78	\N	368
767	2	7	10	f	2	\N	368
768	1	10	6	f	71	\N	369
769	2	7	10	f	84	\N	369
770	1	10	5	f	5	\N	370
771	2	10	3	f	74	\N	370
772	1	7	10	f	77	\N	371
773	2	10	5	f	72	\N	371
774	1	10	7	f	76	\N	372
775	2	3	10	f	2	\N	372
776	1	7	10	f	78	\N	373
777	2	6	10	f	84	\N	373
778	1	2	10	f	71	\N	374
779	2	6	10	f	74	\N	374
780	1	10	6	f	5	\N	375
781	2	6	10	f	73	\N	375
782	1	7	10	f	77	\N	376
783	2	10	6	f	2	\N	376
784	1	10	5	f	76	\N	377
785	2	0	10	f	84	\N	377
786	1	2	10	f	78	\N	378
787	2	6	10	f	74	\N	378
788	1	6	10	f	71	\N	379
789	2	10	6	f	73	\N	379
790	1	4	10	f	5	\N	380
791	2	10	7	f	72	\N	380
822	1	10	6	f	42	\N	396
823	2	7	10	f	109	\N	396
824	1	10	0	f	44	\N	397
825	2	10	5	f	96	\N	397
826	1	6	10	f	43	\N	398
827	2	6	10	f	80	\N	398
828	1	10	6	f	41	\N	399
829	2	10	7	f	1	\N	399
830	1	10	5	f	40	\N	400
831	2	10	7	f	79	\N	400
832	1	10	1	t	42	42	401
833	2	6	10	f	96	\N	401
834	1	10	0	t	44	44	402
835	2	10	6	f	80	\N	402
836	1	10	6	f	43	\N	403
837	2	3	10	f	1	\N	403
838	1	10	1	f	41	\N	404
839	2	10	2	t	79	41	404
840	1	10	6	f	40	\N	405
841	2	10	0	t	109	40	405
842	1	10	7	f	42	\N	406
843	2	10	4	f	80	\N	406
844	1	2	10	t	44	1	407
845	2	1	10	t	1	1	407
846	1	10	6	f	43	\N	408
847	2	7	10	f	79	\N	408
848	1	10	7	f	41	\N	409
849	2	10	3	f	109	\N	409
850	1	10	3	f	40	\N	410
851	2	10	4	f	96	\N	410
852	1	5	10	f	48	\N	411
853	2	3	10	t	62	62	411
854	1	10	4	f	46	\N	412
855	2	10	7	f	65	\N	412
856	1	10	6	f	47	\N	413
857	2	10	0	f	67	\N	413
858	1	4	10	f	4	\N	414
859	2	7	10	f	69	\N	414
860	1	6	10	f	49	\N	415
861	2	10	1	f	107	\N	415
862	1	7	10	f	48	\N	416
863	2	10	7	f	65	\N	416
864	1	10	5	f	46	\N	417
865	2	10	1	f	67	\N	417
866	1	10	4	f	47	\N	418
867	2	2	10	f	69	\N	418
868	1	10	2	f	4	\N	419
869	2	10	3	f	107	\N	419
870	1	10	6	f	49	\N	420
871	2	10	7	f	62	\N	420
872	1	10	7	f	48	\N	421
873	2	10	4	f	67	\N	421
874	1	10	0	t	46	46	422
875	2	5	10	f	69	\N	422
876	1	10	6	f	47	\N	423
877	2	10	6	f	107	\N	423
878	1	10	1	f	4	\N	424
879	2	4	10	f	62	\N	424
880	1	3	10	f	49	\N	425
881	2	0	10	t	65	65	425
882	1	10	7	f	77	\N	426
883	2	10	5	f	3	\N	426
884	1	1	10	f	76	\N	427
885	2	4	10	f	41	\N	427
886	1	10	6	f	78	\N	428
887	2	5	10	f	43	\N	428
888	1	3	10	f	71	\N	429
889	2	6	10	f	40	\N	429
890	1	10	4	t	5	5	430
891	2	6	10	f	45	\N	430
892	1	6	10	f	77	\N	431
893	2	3	10	f	41	\N	431
894	1	10	4	f	76	\N	432
895	2	10	5	f	43	\N	432
896	1	6	10	f	78	\N	433
897	2	4	10	f	40	\N	433
898	1	10	4	f	71	\N	434
899	2	5	10	f	45	\N	434
900	1	6	10	f	5	\N	435
901	2	10	6	f	3	\N	435
902	1	10	7	f	77	\N	436
903	2	4	10	t	43	43	436
904	1	1	10	f	76	\N	437
905	2	4	10	f	40	\N	437
906	1	6	10	f	78	\N	438
907	2	6	10	f	45	\N	438
908	1	10	6	t	71	71	439
909	2	0	10	f	3	\N	439
910	1	6	10	f	5	\N	440
911	2	10	3	f	41	\N	440
912	1	10	6	f	74	\N	441
913	2	4	10	f	6	\N	441
914	1	10	4	f	104	\N	442
915	2	4	10	f	93	\N	442
916	1	10	5	f	2	\N	443
917	2	10	6	f	81	\N	443
918	1	10	5	f	72	\N	444
919	2	10	4	f	111	\N	444
920	1	6	10	f	84	\N	445
921	2	10	3	f	90	\N	445
922	1	10	0	f	74	\N	446
923	2	5	10	f	93	\N	446
924	1	10	7	f	104	\N	447
925	2	10	6	f	81	\N	447
926	1	5	10	f	2	\N	448
927	2	10	7	f	111	\N	448
928	1	10	6	f	72	\N	449
929	2	6	10	f	90	\N	449
930	1	6	10	f	84	\N	450
931	2	7	10	f	6	\N	450
932	1	10	6	f	74	\N	451
933	2	10	6	f	81	\N	451
934	1	10	2	f	104	\N	452
935	2	10	6	f	111	\N	452
936	1	6	10	f	2	\N	453
937	2	10	4	f	90	\N	453
938	1	10	5	t	72	72	454
939	2	7	10	f	6	\N	454
940	1	0	10	t	84	93	455
941	2	7	10	f	93	\N	455
942	1	6	10	f	83	\N	456
943	2	3	10	f	57	\N	456
944	1	5	10	f	91	\N	457
945	2	2	10	f	53	\N	457
946	1	10	5	f	108	\N	458
947	2	7	10	f	60	\N	458
948	1	6	10	f	79	\N	459
949	2	3	10	f	58	\N	459
950	1	10	7	f	1	\N	460
951	2	10	5	f	59	\N	460
952	1	4	10	f	83	\N	461
953	2	10	4	f	53	\N	461
954	1	7	10	f	91	\N	462
955	2	5	10	f	60	\N	462
956	1	10	7	f	108	\N	463
957	2	6	10	f	58	\N	463
958	1	0	10	t	79	59	464
959	2	4	10	f	59	\N	464
960	1	10	2	f	1	\N	465
961	2	7	10	f	57	\N	465
962	1	6	10	f	83	\N	466
963	2	10	6	f	60	\N	466
964	1	6	10	f	91	\N	467
965	2	3	10	f	58	\N	467
966	1	5	10	f	108	\N	468
967	2	7	10	f	59	\N	468
968	1	5	10	f	79	\N	469
969	2	4	10	f	57	\N	469
970	1	5	10	f	1	\N	470
971	2	10	7	f	53	\N	470
972	1	7	10	f	46	\N	471
973	2	10	2	f	109	\N	471
974	1	1	10	f	49	\N	472
975	2	5	10	f	1	\N	472
976	1	2	10	f	47	\N	473
977	2	7	10	f	80	\N	473
978	1	10	6	f	70	\N	474
979	2	10	3	f	79	\N	474
980	1	10	7	f	110	\N	475
981	2	10	7	f	87	\N	475
982	1	5	10	f	46	\N	476
983	2	3	10	t	1	1	476
984	1	10	6	f	49	\N	477
985	2	10	5	f	80	\N	477
986	1	5	10	f	47	\N	478
987	2	10	7	f	79	\N	478
988	1	10	3	f	70	\N	479
989	2	10	6	f	87	\N	479
990	1	10	6	t	110	110	480
991	2	10	6	f	109	\N	480
992	1	10	7	f	46	\N	481
993	2	4	10	f	80	\N	481
994	1	4	10	f	49	\N	482
995	2	10	6	f	79	\N	482
996	1	10	7	f	47	\N	483
997	2	6	10	f	87	\N	483
998	1	10	4	f	70	\N	484
999	2	10	6	f	109	\N	484
1000	1	2	10	f	110	\N	485
1001	2	7	10	f	1	\N	485
1002	1	5	10	f	42	\N	486
1003	2	7	10	f	55	\N	486
1004	1	7	10	f	41	\N	487
1005	2	10	1	f	58	\N	487
1006	1	10	6	f	43	\N	488
1007	2	10	4	f	54	\N	488
1008	1	4	10	f	40	\N	489
1009	2	7	10	f	59	\N	489
1010	1	1	10	f	45	\N	490
1011	2	10	5	f	57	\N	490
1012	1	10	4	f	42	\N	491
1013	2	10	6	f	58	\N	491
1014	1	10	0	f	41	\N	492
1015	2	10	5	f	54	\N	492
1016	1	2	10	f	43	\N	493
1017	2	3	10	f	59	\N	493
1018	1	10	1	t	40	40	494
1019	2	1	10	f	57	\N	494
1020	1	4	10	f	45	\N	495
1021	2	2	10	f	55	\N	495
1022	1	10	4	f	42	\N	496
1023	2	10	5	f	54	\N	496
1024	1	1	10	t	41	59	497
1025	2	10	3	f	59	\N	497
1026	1	4	10	f	43	\N	498
1027	2	6	10	f	57	\N	498
1028	1	10	4	t	40	40	499
1029	2	2	10	f	55	\N	499
1030	1	0	10	t	45	58	500
1031	2	10	7	f	58	\N	500
1032	1	7	10	f	6	\N	501
1033	2	6	10	f	76	\N	501
1034	1	10	7	f	7	\N	502
1035	2	5	10	f	77	\N	502
1036	1	7	10	f	81	\N	503
1037	2	4	10	f	78	\N	503
1038	1	7	10	f	93	\N	504
1039	2	10	7	f	71	\N	504
1040	1	7	10	f	90	\N	505
1041	2	6	10	f	5	\N	505
1042	1	6	10	f	6	\N	506
1043	2	6	10	f	77	\N	506
1044	1	6	10	f	7	\N	507
1045	2	10	5	f	78	\N	507
1046	1	1	10	f	81	\N	508
1047	2	5	10	f	71	\N	508
1048	1	2	10	f	93	\N	509
1049	2	10	6	f	5	\N	509
1050	1	6	10	f	90	\N	510
1051	2	7	10	f	76	\N	510
1052	1	10	5	f	6	\N	511
1053	2	7	10	f	78	\N	511
1054	1	0	10	t	7	71	512
1055	2	10	7	f	71	\N	512
1056	1	1	10	f	81	\N	513
1057	2	3	10	f	5	\N	513
1058	1	10	6	f	93	\N	514
1059	2	7	10	f	76	\N	514
1060	1	6	10	f	90	\N	515
1061	2	6	10	f	77	\N	515
1062	1	10	2	f	84	\N	516
1063	2	6	10	f	66	\N	516
1064	1	7	10	f	72	\N	517
1065	2	10	2	f	105	\N	517
1066	1	7	10	f	2	\N	518
1067	2	7	10	f	61	\N	518
1068	1	10	4	f	104	\N	519
1069	2	10	6	f	69	\N	519
1070	1	10	6	f	73	\N	520
1071	2	10	7	f	65	\N	520
1072	1	10	4	f	84	\N	521
1073	2	10	5	f	105	\N	521
1074	1	7	10	f	72	\N	522
1075	2	10	3	f	61	\N	522
1076	1	10	7	f	2	\N	523
1077	2	7	10	f	69	\N	523
1078	1	7	10	f	104	\N	524
1079	2	10	7	f	65	\N	524
1080	1	10	4	f	73	\N	525
1081	2	10	5	f	66	\N	525
1082	1	10	7	f	84	\N	526
1083	2	6	10	f	61	\N	526
1084	1	7	10	f	72	\N	527
1085	2	10	2	f	69	\N	527
1086	1	10	4	f	2	\N	528
1087	2	10	5	f	65	\N	528
1088	1	10	2	f	104	\N	529
1089	2	10	7	f	66	\N	529
1090	1	10	2	t	73	73	530
1091	2	10	6	f	105	\N	530
1092	1	10	5	f	84	\N	531
1093	2	10	3	f	96	\N	531
1094	1	4	10	f	73	\N	532
1095	2	10	6	f	1	\N	532
1096	1	10	4	f	2	\N	533
1097	2	10	6	f	80	\N	533
1098	1	10	5	f	75	\N	534
1099	2	10	7	f	97	\N	534
1100	1	10	7	f	74	\N	535
1101	2	6	10	f	79	\N	535
1102	1	10	6	f	84	\N	536
1103	2	10	7	f	1	\N	536
1104	1	10	5	f	73	\N	537
1105	2	6	10	f	80	\N	537
1106	1	10	7	f	2	\N	538
1107	2	10	6	f	97	\N	538
1108	1	10	6	f	75	\N	539
1109	2	7	10	f	79	\N	539
1110	1	10	4	f	74	\N	540
1111	2	10	3	f	96	\N	540
1112	1	10	7	f	84	\N	541
1113	2	10	6	f	80	\N	541
1114	1	10	3	t	73	73	542
1115	2	10	5	f	97	\N	542
1116	1	10	6	f	2	\N	543
1117	2	10	6	f	79	\N	543
1118	1	10	0	t	75	75	544
1119	2	10	0	t	96	75	544
1120	1	10	5	f	74	\N	545
1121	2	6	10	f	1	\N	545
1122	1	10	5	f	112	\N	546
1123	2	6	10	f	42	\N	546
1124	1	10	2	f	90	\N	547
1125	2	3	10	f	3	\N	547
1126	1	10	7	f	81	\N	548
1127	2	10	5	f	43	\N	548
1128	1	10	7	f	93	\N	549
1129	2	4	10	f	44	\N	549
1130	1	6	10	f	7	\N	550
1131	2	5	10	f	41	\N	550
1132	1	10	5	f	112	\N	551
1133	2	7	10	f	3	\N	551
1134	1	5	10	f	90	\N	552
1135	2	10	3	f	43	\N	552
1136	1	4	10	f	81	\N	553
1137	2	10	0	t	44	81	553
1138	1	4	10	f	93	\N	554
1139	2	6	10	f	41	\N	554
1140	1	6	10	f	7	\N	555
1141	2	5	10	f	42	\N	555
1142	1	10	6	f	112	\N	556
1143	2	7	10	f	43	\N	556
1144	1	0	10	f	90	\N	557
1145	2	2	10	t	44	44	557
1146	1	4	10	f	81	\N	558
1147	2	3	10	f	41	\N	558
1148	1	1	10	f	93	\N	559
1149	2	10	6	f	42	\N	559
1150	1	7	10	f	7	\N	560
1151	2	10	1	f	3	\N	560
1152	1	10	5	f	46	\N	561
1153	2	7	10	f	53	\N	561
1154	1	7	10	f	110	\N	562
1155	2	10	7	f	55	\N	562
1156	1	10	6	f	47	\N	563
1157	2	10	6	f	54	\N	563
1158	1	10	5	f	70	\N	564
1159	2	10	3	f	52	\N	564
1160	1	10	7	f	49	\N	565
1161	2	3	10	f	57	\N	565
1162	1	10	5	f	46	\N	566
1163	2	10	5	f	55	\N	566
1164	1	10	5	f	110	\N	567
1165	2	10	5	f	54	\N	567
1166	1	5	10	f	47	\N	568
1167	2	5	10	f	52	\N	568
1168	1	6	10	f	70	\N	569
1169	2	7	10	f	57	\N	569
1170	1	4	10	f	49	\N	570
1171	2	4	10	f	53	\N	570
1172	1	10	4	f	46	\N	571
1173	2	10	1	f	54	\N	571
1174	1	1	10	f	110	\N	572
1175	2	10	7	f	52	\N	572
1176	1	6	10	f	47	\N	573
1177	2	2	10	f	57	\N	573
1178	1	4	10	f	70	\N	574
1179	2	10	5	f	53	\N	574
1180	1	10	7	f	49	\N	575
1181	2	10	7	f	55	\N	575
1182	1	5	10	f	69	\N	576
1183	2	5	10	f	71	\N	576
1184	1	4	10	f	62	\N	577
1185	2	10	5	f	82	\N	577
1186	1	6	10	f	61	\N	578
1187	2	10	7	f	78	\N	578
1188	1	6	10	f	107	\N	579
1189	2	6	10	f	92	\N	579
1190	1	5	10	f	105	\N	580
1191	2	4	10	f	5	\N	580
1192	1	7	10	f	69	\N	581
1193	2	7	10	f	82	\N	581
1194	1	7	10	f	62	\N	582
1195	2	10	1	f	78	\N	582
1196	1	5	10	f	61	\N	583
1197	2	10	6	f	92	\N	583
1198	1	4	10	f	107	\N	584
1199	2	6	10	f	5	\N	584
1200	1	5	10	f	105	\N	585
1201	2	4	10	f	71	\N	585
1202	1	10	6	f	69	\N	586
1203	2	6	10	f	78	\N	586
1204	1	2	10	t	62	92	587
1205	2	10	1	f	92	\N	587
1206	1	7	10	f	61	\N	588
1207	2	6	10	f	5	\N	588
1208	1	3	10	f	107	\N	589
1209	2	3	10	t	71	71	589
1210	1	10	6	t	105	105	590
1211	2	7	10	f	82	\N	590
1212	1	6	10	f	110	\N	591
1213	2	4	10	f	7	\N	591
1214	1	5	10	f	49	\N	592
1215	2	7	10	f	89	\N	592
1216	1	6	10	f	47	\N	593
1217	2	10	6	f	81	\N	593
1218	1	6	10	f	46	\N	594
1219	2	7	10	f	6	\N	594
1220	1	4	10	f	70	\N	595
1221	2	7	10	f	90	\N	595
1222	1	10	5	f	110	\N	596
1223	2	10	7	f	89	\N	596
1224	1	7	10	f	49	\N	597
1225	2	7	10	f	81	\N	597
1226	1	3	10	f	47	\N	598
1227	2	5	10	f	6	\N	598
1228	1	5	10	f	46	\N	599
1229	2	10	6	f	90	\N	599
1230	1	3	10	f	70	\N	600
1231	2	4	10	f	7	\N	600
1232	1	10	4	f	110	\N	601
1233	2	10	3	f	81	\N	601
1234	1	10	6	f	49	\N	602
1235	2	10	6	f	6	\N	602
1236	1	10	6	f	47	\N	603
1237	2	10	2	f	90	\N	603
1238	1	7	10	f	46	\N	604
1239	2	10	6	f	7	\N	604
1240	1	4	10	f	70	\N	605
1241	2	10	4	f	89	\N	605
1242	1	5	10	f	69	\N	606
1243	2	10	7	f	59	\N	606
1244	1	1	10	f	65	\N	607
1245	2	6	10	f	53	\N	607
1246	1	6	10	f	67	\N	608
1247	2	10	5	f	54	\N	608
1248	1	6	10	f	63	\N	609
1249	2	4	10	t	57	57	609
1250	1	10	7	f	113	\N	610
1251	2	5	10	f	55	\N	610
1252	1	10	6	f	69	\N	611
1253	2	6	10	f	53	\N	611
1254	1	10	6	f	65	\N	612
1255	2	10	4	f	54	\N	612
1256	1	2	10	f	67	\N	613
1257	2	10	6	f	57	\N	613
1258	1	6	10	f	63	\N	614
1259	2	10	2	f	55	\N	614
1260	1	6	10	f	113	\N	615
1261	2	10	4	f	59	\N	615
1262	1	10	5	f	69	\N	616
1263	2	10	6	f	54	\N	616
1264	1	10	5	f	65	\N	617
1265	2	10	7	f	57	\N	617
1266	1	5	10	f	67	\N	618
1267	2	10	3	f	55	\N	618
1268	1	10	6	f	63	\N	619
1269	2	10	7	f	59	\N	619
1270	1	10	7	f	113	\N	620
1271	2	10	3	f	53	\N	620
1272	1	0	10	t	41	75	621
1273	2	5	10	f	75	\N	621
1274	1	2	10	f	42	\N	622
1275	2	7	10	f	84	\N	622
1276	1	10	6	f	43	\N	623
1277	2	10	7	f	2	\N	623
1278	1	10	2	f	44	\N	624
1279	2	10	7	f	72	\N	624
1280	1	10	6	f	40	\N	625
1281	2	10	7	f	74	\N	625
1282	1	10	6	t	41	41	626
1283	2	5	10	f	84	\N	626
1284	1	10	6	f	42	\N	627
1285	2	10	7	f	2	\N	627
1286	1	10	3	f	43	\N	628
1287	2	5	10	f	72	\N	628
1288	1	10	2	f	44	\N	629
1289	2	6	10	f	74	\N	629
1290	1	5	10	f	40	\N	630
1291	2	6	10	f	75	\N	630
1292	1	10	6	f	41	\N	631
1293	2	10	6	f	2	\N	631
1294	1	5	10	f	42	\N	632
1295	2	6	10	f	72	\N	632
1296	1	5	10	f	43	\N	633
1297	2	5	10	f	74	\N	633
1298	1	10	5	f	44	\N	634
1299	2	10	5	f	75	\N	634
1300	1	10	2	f	40	\N	635
1301	2	10	6	f	84	\N	635
1302	1	10	6	t	5	5	636
1303	2	10	4	f	109	\N	636
1304	1	10	4	f	71	\N	637
1305	2	10	4	f	83	\N	637
1306	1	3	10	f	78	\N	638
1307	2	6	10	f	80	\N	638
1310	1	10	7	f	76	\N	640
1311	2	10	6	f	87	\N	640
1312	1	10	1	t	5	5	641
1313	2	10	1	f	83	\N	641
1314	1	7	10	f	71	\N	642
1315	2	7	10	f	80	\N	642
1309	2	10	5	f	79	\N	639
1308	1	3	10	f	77	\N	639
1318	1	10	3	f	77	\N	644
1319	2	10	7	f	87	\N	644
1320	1	7	10	f	76	\N	645
1321	2	10	3	f	109	\N	645
1322	1	10	4	f	5	\N	646
1323	2	10	3	f	80	\N	646
1326	1	3	10	f	78	\N	648
1327	2	4	10	f	87	\N	648
1328	1	10	2	f	77	\N	649
1329	2	7	10	f	109	\N	649
1330	1	10	2	f	76	\N	650
1331	2	10	6	f	83	\N	650
1332	1	10	6	f	42	\N	651
1333	2	10	7	f	82	\N	651
1334	1	10	7	f	3	\N	652
1335	2	4	10	f	71	\N	652
1336	1	2	10	f	43	\N	653
1337	2	10	4	f	78	\N	653
1338	1	6	10	f	41	\N	654
1339	2	0	10	t	76	76	654
1340	1	10	7	f	45	\N	655
1341	2	1	10	t	5	5	655
1342	1	5	10	f	42	\N	656
1343	2	10	0	t	71	42	656
1344	1	5	10	f	3	\N	657
1345	2	10	6	f	78	\N	657
1346	1	4	10	f	43	\N	658
1347	2	7	10	f	76	\N	658
1348	1	3	10	t	41	5	659
1349	2	10	3	f	5	\N	659
1350	1	7	10	f	45	\N	660
1351	2	10	5	f	82	\N	660
1352	1	10	3	f	42	\N	661
1353	2	10	2	f	78	\N	661
1354	1	6	10	f	3	\N	662
1355	2	4	10	f	76	\N	662
1356	1	7	10	f	43	\N	663
1357	2	4	10	f	5	\N	663
1358	1	2	10	f	41	\N	664
1359	2	10	5	f	82	\N	664
1360	1	10	1	t	45	45	665
1361	2	10	0	t	71	45	665
1362	1	10	6	f	7	\N	666
1363	2	10	7	f	73	\N	666
1364	1	6	10	f	89	\N	667
1365	2	10	1	f	84	\N	667
1366	1	10	7	f	81	\N	668
1367	2	6	10	f	2	\N	668
1368	1	6	10	f	6	\N	669
1369	2	1	10	f	75	\N	669
1370	1	10	6	f	90	\N	670
1371	2	10	2	f	74	\N	670
1372	1	10	5	f	7	\N	671
1373	2	10	0	f	84	\N	671
1374	1	2	10	f	89	\N	672
1375	2	10	1	f	2	\N	672
1376	1	7	10	f	81	\N	673
1377	2	5	10	f	75	\N	673
1378	1	10	6	f	6	\N	674
1379	2	10	6	f	74	\N	674
1380	1	5	10	f	90	\N	675
1381	2	4	10	f	73	\N	675
1382	1	0	10	f	7	\N	676
1383	2	10	7	f	2	\N	676
1384	1	5	10	f	89	\N	677
1385	2	10	6	f	75	\N	677
1386	1	10	5	f	81	\N	678
1387	2	1	10	f	74	\N	678
1388	1	5	10	f	6	\N	679
1389	2	5	10	f	73	\N	679
1390	1	10	6	f	90	\N	680
1391	2	5	10	f	84	\N	680
1396	1	5	10	f	54	\N	683
1408	1	10	3	f	57	\N	689
1401	2	10	3	f	97	\N	685
1399	2	10	2	f	91	\N	684
1414	1	10	4	f	55	\N	692
1407	2	10	7	f	91	\N	688
1410	1	6	10	f	56	\N	690
1412	1	10	6	f	53	\N	691
1394	1	7	10	f	55	\N	682
1393	2	10	7	f	108	\N	681
1403	2	6	10	f	79	\N	686
1392	1	6	10	f	53	\N	681
1405	2	6	10	f	80	\N	687
1421	2	4	10	f	79	\N	695
1398	1	10	1	t	57	57	684
1411	2	10	6	f	108	\N	690
1419	2	7	10	f	108	\N	694
1404	1	7	10	f	55	\N	687
1415	2	7	10	f	91	\N	692
1402	1	10	4	f	53	\N	686
1420	1	2	10	f	56	\N	695
1400	1	10	6	f	56	\N	685
1409	2	7	10	f	97	\N	689
1416	1	5	10	f	54	\N	693
1395	2	6	10	f	79	\N	682
1417	2	10	7	f	97	\N	693
1397	2	4	10	f	80	\N	683
1406	1	10	6	f	54	\N	688
1418	1	10	3	f	57	\N	694
1413	2	10	1	f	80	\N	691
1423	2	10	5	f	110	\N	696
1426	1	10	\N	f	61	\N	698
1425	2	10	1	f	48	\N	697
1430	1	1	10	t	113	70	700
1428	1	10	0	f	105	\N	699
1427	2	10	\N	f	47	\N	698
1431	2	2	10	f	70	\N	700
1437	2	6	10	f	49	\N	703
1429	2	0	10	f	49	\N	699
1435	2	10	\N	f	47	\N	702
1433	2	10	6	f	48	\N	701
1441	2	10	2	f	110	\N	705
1432	1	6	10	f	69	\N	701
1450	1	7	10	f	113	\N	710
1438	1	3	10	f	105	\N	704
1436	1	3	10	f	61	\N	703
1440	1	10	1	f	113	\N	705
1439	2	6	10	f	70	\N	704
1434	1	10	\N	f	63	\N	702
1444	1	10	5	f	63	\N	707
1443	2	10	\N	f	47	\N	706
1448	1	10	6	f	105	\N	709
1449	2	6	10	f	110	\N	709
1445	2	10	7	f	49	\N	707
1442	1	10	\N	f	69	\N	706
1447	2	1	10	f	70	\N	708
1424	1	10	5	f	63	\N	697
1422	1	10	5	f	69	\N	696
1451	2	6	10	f	48	\N	710
1446	1	0	10	f	61	\N	708
1491	2	10	2	f	52	\N	730
1324	1	10	4	f	71	\N	647
1317	2	2	10	f	79	\N	643
1478	1	10	7	f	7	\N	724
1476	1	10	7	f	81	\N	723
1472	1	10	2	f	89	\N	721
1493	2	6	10	f	55	\N	731
1473	2	10	3	f	67	\N	721
1477	2	10	7	f	65	\N	723
1475	2	7	10	f	69	\N	722
1495	2	10	4	f	54	\N	732
1497	2	6	10	f	100	\N	733
1480	1	10	7	f	90	\N	725
1479	2	10	0	t	105	7	724
1496	1	10	7	f	78	\N	733
1481	2	6	10	f	63	\N	725
1494	1	10	3	f	92	\N	732
1498	1	1	10	f	5	\N	734
1499	2	0	10	t	52	52	734
1500	1	10	5	f	71	\N	735
1501	2	10	7	f	53	\N	735
1507	2	5	10	f	52	\N	738
1456	1	10	7	f	81	\N	713
1452	1	10	4	f	89	\N	711
1454	1	6	10	f	6	\N	712
1458	1	10	3	t	7	7	714
1460	1	7	10	f	90	\N	715
1457	2	10	5	f	67	\N	713
1455	2	10	7	f	63	\N	712
1459	2	10	7	f	69	\N	714
1453	2	10	4	f	105	\N	711
1470	1	10	3	f	90	\N	720
1464	1	10	6	f	6	\N	717
1468	1	10	5	f	7	\N	719
1466	1	10	7	f	81	\N	718
1462	1	10	6	f	89	\N	716
1465	2	7	10	f	67	\N	717
1469	2	10	7	f	65	\N	719
1467	2	10	6	f	69	\N	718
1471	2	10	1	f	105	\N	720
1463	2	10	2	t	63	89	716
1509	2	10	2	f	53	\N	739
1474	1	10	5	f	6	\N	722
1504	1	10	5	f	92	\N	737
1483	2	10	6	f	53	\N	726
1506	1	7	10	f	78	\N	738
1484	1	6	10	f	92	\N	727
1482	1	10	1	t	76	76	726
1508	1	10	3	f	5	\N	739
1502	1	10	4	f	76	\N	736
1486	1	10	6	f	78	\N	728
1485	2	7	10	f	55	\N	727
1503	2	10	0	t	54	76	736
1505	2	10	4	f	100	\N	737
1510	1	7	10	f	71	\N	740
1487	2	10	6	f	54	\N	728
1488	1	10	3	f	5	\N	729
1490	1	10	5	f	71	\N	730
1489	2	6	10	f	100	\N	729
1511	2	10	6	f	55	\N	740
1492	1	10	1	f	76	\N	731
1461	2	5	10	f	65	\N	715
1524	1	10	7	f	70	\N	747
1522	1	10	7	f	46	\N	746
1513	2	10	1	f	72	\N	741
1525	2	10	7	f	2	\N	747
1515	2	7	10	f	75	\N	742
1529	2	10	5	f	84	\N	749
1516	1	10	7	f	47	\N	743
1523	2	10	6	f	75	\N	746
1518	1	7	10	f	110	\N	744
1512	1	5	10	f	46	\N	741
1521	2	7	10	f	84	\N	745
1517	2	6	10	f	2	\N	743
1534	1	7	10	t	70	73	752
1528	1	4	10	f	110	\N	749
1537	2	10	6	f	84	\N	753
1527	2	1	10	f	73	\N	748
1530	1	10	6	f	49	\N	750
1526	1	7	10	f	47	\N	748
1520	1	6	10	f	49	\N	745
1514	1	10	7	f	70	\N	742
1325	2	10	7	f	79	\N	647
1532	1	3	10	f	46	\N	751
1533	2	10	5	f	2	\N	751
1535	2	10	7	f	73	\N	752
1536	1	3	10	f	47	\N	753
1539	2	6	10	f	72	\N	754
1538	1	7	10	f	110	\N	754
1540	1	6	10	f	49	\N	755
1541	2	2	10	t	75	75	755
1553	2	2	10	f	3	\N	761
1519	2	4	10	f	73	\N	744
1316	1	7	10	f	78	\N	643
1571	2	10	7	f	3	\N	770
1546	1	3	10	f	108	\N	758
1542	1	10	7	f	83	\N	756
1547	2	7	10	f	43	\N	758
1549	2	6	10	f	41	\N	759
1557	2	6	10	f	41	\N	763
705	2	7	10	t	70	70	337
1558	1	10	6	f	1	\N	764
1554	1	5	10	f	80	\N	762
1561	2	7	10	f	44	\N	765
1552	1	5	10	f	83	\N	761
1556	1	2	10	f	108	\N	763
1555	2	7	10	f	43	\N	762
1564	1	3	10	f	80	\N	767
1560	1	6	10	f	79	\N	765
1569	2	6	10	f	44	\N	769
1531	2	6	10	f	72	\N	750
1570	1	3	10	f	79	\N	770
1567	2	6	10	f	40	\N	768
1548	1	4	10	t	1	41	759
1563	2	6	10	f	43	\N	766
1568	1	10	6	f	1	\N	769
1565	2	10	6	f	41	\N	767
606	1	3	10	f	61	\N	288
1562	1	10	7	f	83	\N	766
1566	1	10	7	f	108	\N	768
1544	1	10	7	f	80	\N	757
1559	2	4	10	f	40	\N	764
1551	2	6	10	f	40	\N	760
1550	1	2	10	f	79	\N	760
1543	2	3	10	f	44	\N	756
1545	2	6	10	f	3	\N	757
1572	1	7	10	f	63	\N	771
1582	1	1	10	f	63	\N	776
1575	2	10	7	f	44	\N	772
1576	1	6	10	f	61	\N	773
1577	2	7	10	f	43	\N	773
1578	1	7	10	f	62	\N	774
1579	2	3	10	f	45	\N	774
1580	1	7	10	f	105	\N	775
1583	2	10	6	f	44	\N	776
1573	2	10	4	f	42	\N	771
1588	1	10	7	f	62	\N	779
1584	1	5	10	f	69	\N	777
1586	1	4	10	f	61	\N	778
1587	2	2	10	f	45	\N	778
1574	1	10	7	f	69	\N	772
1581	2	10	7	f	41	\N	775
1589	2	6	10	f	41	\N	779
1590	1	3	10	f	105	\N	780
1592	1	10	7	f	63	\N	781
1591	2	6	10	f	42	\N	780
1597	2	4	10	f	41	\N	783
1593	2	10	6	f	43	\N	781
1595	2	10	7	f	45	\N	782
1596	1	10	6	f	61	\N	783
1594	1	6	10	f	69	\N	782
1598	1	5	10	f	62	\N	784
1585	2	10	6	f	43	\N	777
1599	2	5	10	f	42	\N	784
1600	1	2	10	f	105	\N	785
1601	2	1	10	f	44	\N	785
1651	2	6	10	f	7	\N	810
1647	2	1	10	t	6	6	808
1649	2	10	3	t	93	1	809
1636	1	10	4	f	80	\N	803
1640	1	5	10	f	83	\N	805
1632	1	10	7	f	109	\N	801
1646	1	5	10	f	80	\N	808
1624	1	\N	\N	f	55	\N	797
1625	2	\N	\N	f	75	\N	797
1626	1	\N	\N	f	54	\N	798
1627	2	\N	\N	f	73	\N	798
1628	1	\N	\N	f	57	\N	799
1629	2	\N	\N	f	84	\N	799
1630	1	\N	\N	f	52	\N	800
1631	2	\N	\N	f	72	\N	800
1614	1	7	10	f	55	\N	792
1617	2	1	10	f	75	\N	793
1619	2	10	5	f	73	\N	794
1620	1	2	10	f	52	\N	795
1609	2	10	3	t	75	57	789
1608	1	10	4	f	57	\N	789
1604	1	10	7	f	55	\N	787
1613	2	10	7	f	72	\N	791
1622	1	7	10	f	53	\N	796
1658	1	10	1	f	1	\N	814
1615	2	5	10	f	2	\N	792
1616	1	1	10	f	54	\N	793
1606	1	5	10	f	54	\N	788
1607	2	5	10	f	2	\N	788
1605	2	3	10	f	72	\N	787
1603	2	6	10	f	84	\N	786
1618	1	6	10	f	57	\N	794
1602	1	10	6	f	53	\N	786
1610	1	10	7	f	52	\N	790
1612	1	7	10	f	53	\N	791
1661	2	5	10	f	90	\N	815
1655	2	0	10	t	6	6	812
1660	1	6	10	f	83	\N	815
1654	1	4	10	f	79	\N	812
1656	1	6	10	f	80	\N	813
1659	2	3	10	t	7	7	814
1657	2	2	10	f	93	\N	813
1623	2	10	7	f	2	\N	796
1653	2	7	10	f	81	\N	811
1621	2	4	10	f	84	\N	795
1611	2	1	10	t	73	73	790
1650	1	3	10	f	83	\N	810
1639	2	10	3	f	6	\N	804
1635	2	4	10	f	90	\N	802
1637	2	10	6	f	81	\N	803
1645	2	10	6	f	81	\N	807
1644	1	10	7	f	79	\N	807
1648	1	6	10	f	1	\N	809
1642	1	10	5	f	109	\N	806
1652	1	10	7	f	109	\N	811
1633	2	6	10	f	7	\N	801
1638	1	6	10	f	1	\N	804
1641	2	0	10	t	93	93	805
1643	2	10	1	f	90	\N	806
1634	1	4	10	f	79	\N	802
\.


--
-- Name: recording_frame_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('recording_frame_id_seq', 1661, true);


--
-- Data for Name: recording_leagueframe; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY recording_leagueframe (frame_ptr_id, leg_number, away_player_id, home_player_id, league_match_id) FROM stdin;
61	1	42	70	57
62	2	42	70	57
63	1	3	49	57
64	2	3	49	57
65	1	43	47	57
66	2	43	47	57
67	1	41	4	57
68	2	41	4	57
69	1	40	46	57
70	2	40	46	57
71	3	3	70	57
72	4	3	70	57
73	3	43	49	57
74	4	43	49	57
75	3	41	47	57
76	4	41	47	57
77	3	40	4	57
78	4	40	4	57
79	3	42	46	57
80	4	42	46	57
81	5	43	70	57
82	6	43	70	57
83	5	41	49	57
84	6	41	49	57
85	5	40	47	57
86	6	40	47	57
87	5	42	4	57
88	6	42	4	57
89	5	3	46	57
90	6	3	46	57
91	1	74	64	58
92	2	74	64	58
93	1	72	63	58
94	2	72	63	58
95	1	2	67	58
96	2	2	67	58
97	1	73	61	58
98	2	73	61	58
99	1	84	69	58
100	2	84	69	58
101	3	72	64	58
102	4	72	64	58
103	3	2	63	58
104	4	2	63	58
105	3	73	67	58
106	4	73	67	58
107	3	84	61	58
108	4	84	61	58
109	3	74	69	58
110	4	74	69	58
111	5	2	64	58
112	6	2	64	58
113	5	73	63	58
114	6	73	63	58
115	5	84	67	58
116	6	84	67	58
117	5	74	61	58
118	6	74	61	58
119	5	72	69	58
120	6	72	69	58
121	1	92	53	60
122	2	92	53	60
123	1	76	100	60
124	2	76	100	60
125	1	78	54	60
126	2	78	54	60
127	1	88	55	60
128	2	88	55	60
129	1	71	58	60
130	2	71	58	60
131	3	76	53	60
132	4	76	53	60
133	3	78	100	60
134	4	78	100	60
135	3	88	54	60
136	4	88	54	60
137	3	71	55	60
138	4	71	55	60
139	3	92	58	60
140	4	92	58	60
141	5	78	53	60
142	6	78	53	60
143	5	88	100	60
144	6	88	100	60
145	5	71	54	60
146	6	71	54	60
147	5	92	55	60
148	6	92	55	60
149	5	76	58	60
150	6	76	58	60
151	1	1	6	59
152	2	1	6	59
153	1	79	89	59
154	2	79	89	59
155	1	80	81	59
156	2	80	81	59
157	1	91	7	59
158	2	91	7	59
159	1	87	90	59
160	2	87	90	59
161	3	79	6	59
162	4	79	6	59
163	3	80	89	59
164	4	80	89	59
165	3	91	81	59
166	4	91	81	59
167	3	87	7	59
168	4	87	7	59
169	3	1	90	59
170	4	1	90	59
171	5	80	6	59
172	6	80	6	59
173	5	91	89	59
174	6	91	89	59
175	5	87	81	59
176	6	87	81	59
177	5	1	7	59
178	6	1	7	59
179	5	79	90	59
180	6	79	90	59
207	1	6	88	62
208	2	6	88	62
209	1	93	76	62
210	2	93	76	62
211	1	81	103	62
212	2	81	103	62
213	1	89	71	62
214	2	89	71	62
215	1	7	92	62
216	2	7	92	62
217	3	93	88	62
218	4	93	88	62
219	3	81	76	62
220	4	81	76	62
221	3	89	103	62
222	4	89	103	62
223	3	7	71	62
224	4	7	71	62
225	3	6	92	62
226	4	6	92	62
227	5	81	88	62
228	6	81	88	62
229	5	89	76	62
230	6	89	76	62
231	5	7	103	62
232	6	7	103	62
233	5	6	71	62
234	6	6	71	62
235	5	93	92	62
236	6	93	92	62
237	1	70	1	61
238	2	70	1	61
239	1	46	83	61
240	2	46	83	61
241	1	47	80	61
242	2	47	80	61
243	1	4	97	61
244	2	4	97	61
245	1	48	79	61
246	2	48	79	61
247	3	46	1	61
248	4	46	1	61
249	3	47	83	61
250	4	47	83	61
251	3	4	80	61
252	4	4	80	61
253	3	48	97	61
254	4	48	97	61
255	3	70	79	61
256	4	70	79	61
257	5	47	1	61
258	6	47	1	61
259	5	4	83	61
260	6	4	83	61
261	5	48	80	61
262	6	48	80	61
263	5	70	97	61
264	6	70	97	61
265	5	46	79	61
266	6	46	79	61
267	1	56	74	64
268	2	56	74	64
269	1	53	104	64
270	2	53	104	64
271	1	54	2	64
272	2	54	2	64
273	1	55	73	64
274	2	55	73	64
275	1	58	84	64
276	2	58	84	64
277	3	53	74	64
278	4	53	74	64
279	3	54	104	64
280	4	54	104	64
281	3	55	2	64
282	4	55	2	64
283	3	58	73	64
284	4	58	73	64
285	3	56	84	64
286	4	56	84	64
287	5	54	74	64
288	6	54	74	64
289	5	55	104	64
290	6	55	104	64
291	5	58	2	64
292	6	58	2	64
293	5	56	73	64
294	6	56	73	64
295	5	53	84	64
296	6	53	84	64
297	1	62	42	63
298	2	62	42	63
299	1	105	44	63
300	2	105	44	63
301	1	61	43	63
302	2	61	43	63
303	1	69	41	63
304	2	69	41	63
305	1	63	40	63
306	2	63	40	63
307	3	105	42	63
308	4	105	42	63
309	3	61	44	63
310	4	61	44	63
311	3	69	43	63
312	4	69	43	63
313	3	63	41	63
314	4	63	41	63
315	3	62	40	63
316	4	62	40	63
317	5	61	42	63
318	6	61	42	63
319	5	69	44	63
320	6	69	44	63
321	5	63	43	63
322	6	63	43	63
323	5	62	41	63
324	6	62	41	63
325	5	105	40	63
326	6	105	40	63
342	1	82	49	68
343	2	82	49	68
344	1	77	4	68
345	2	77	4	68
346	1	78	47	68
347	2	78	47	68
348	1	76	46	68
349	2	76	46	68
350	1	5	70	68
351	2	5	70	68
352	3	77	49	68
353	4	77	49	68
354	3	78	4	68
355	4	78	4	68
356	3	76	47	68
357	4	76	47	68
358	3	5	46	68
359	4	5	46	68
360	3	82	70	68
361	4	82	70	68
362	5	78	49	68
363	6	78	49	68
364	5	76	4	68
365	6	76	4	68
366	5	5	47	68
367	6	5	47	68
368	5	82	46	68
369	6	82	46	68
370	5	77	70	68
371	6	77	70	68
372	1	41	104	65
373	2	41	104	65
374	1	44	75	65
375	2	44	75	65
376	1	43	2	65
377	2	43	2	65
378	1	40	84	65
379	2	40	84	65
380	1	45	73	65
381	2	45	73	65
382	3	44	104	65
383	4	44	104	65
384	3	43	75	65
385	4	43	75	65
386	3	40	2	65
387	4	40	2	65
388	3	45	84	65
389	4	45	84	65
390	3	41	73	65
391	4	41	73	65
392	5	43	104	65
393	6	43	104	65
394	5	40	75	65
395	6	40	75	65
396	5	45	2	65
397	6	45	2	65
398	5	41	84	65
399	6	41	84	65
400	5	44	73	65
401	6	44	73	65
402	1	53	6	66
403	2	53	6	66
404	1	56	7	66
405	2	56	7	66
406	1	106	81	66
407	2	106	81	66
408	1	55	89	66
409	2	55	89	66
410	1	52	90	66
411	2	52	90	66
412	3	56	6	66
413	4	56	6	66
414	3	106	7	66
415	4	106	7	66
416	3	55	81	66
417	4	55	81	66
418	3	52	89	66
419	4	52	89	66
420	3	53	90	66
421	4	53	90	66
422	5	106	6	66
423	6	106	6	66
424	5	55	7	66
425	6	55	7	66
426	5	52	81	66
427	6	52	81	66
428	5	53	89	66
429	6	53	89	66
430	5	56	90	66
431	6	56	90	66
432	1	79	69	67
433	2	79	69	67
434	1	91	62	67
435	2	91	62	67
436	1	80	61	67
437	2	80	61	67
438	1	1	66	67
439	2	1	66	67
440	1	83	64	67
441	2	83	64	67
442	3	91	69	67
443	4	91	69	67
444	3	80	62	67
445	4	80	62	67
446	3	1	61	67
447	4	1	61	67
448	3	83	66	67
449	4	83	66	67
450	3	79	64	67
451	4	79	64	67
452	5	80	69	67
453	6	80	69	67
454	5	1	62	67
455	6	1	62	67
456	5	83	61	67
457	6	83	61	67
458	5	79	66	67
459	6	79	66	67
460	5	91	64	67
461	6	91	64	67
462	1	7	42	70
463	2	7	42	70
464	1	93	41	70
465	2	93	41	70
466	1	81	43	70
467	2	81	43	70
468	1	6	40	70
469	2	6	40	70
470	1	90	45	70
471	2	90	45	70
472	3	93	42	70
473	4	93	42	70
474	3	81	41	70
475	4	81	41	70
476	3	6	43	70
477	4	6	43	70
478	3	90	40	70
479	4	90	40	70
480	3	7	45	70
481	4	7	45	70
482	5	81	42	70
483	6	81	42	70
484	5	6	41	70
485	6	6	41	70
486	5	90	43	70
487	6	90	43	70
488	5	7	40	70
489	6	7	40	70
490	5	93	45	70
491	6	93	45	70
492	1	66	76	71
493	2	66	76	71
494	1	105	71	71
495	2	105	71	71
496	1	67	78	71
497	2	67	78	71
498	1	107	5	71
499	2	107	5	71
500	1	69	77	71
501	2	69	77	71
502	3	105	76	71
503	4	105	76	71
504	3	67	71	71
505	4	67	71	71
506	3	107	78	71
507	4	107	78	71
508	3	69	5	71
509	4	69	5	71
510	3	66	77	71
511	4	66	77	71
512	5	67	76	71
513	6	67	76	71
514	5	107	71	71
515	6	107	71	71
516	5	69	78	71
517	6	69	78	71
518	5	66	5	71
519	6	66	5	71
520	5	105	77	71
521	6	105	77	71
522	1	73	83	72
523	2	73	83	72
524	1	72	109	72
525	2	72	109	72
526	1	2	108	72
527	2	2	108	72
528	1	104	79	72
529	2	104	79	72
530	1	74	1	72
531	2	74	1	72
532	3	72	83	72
533	4	72	83	72
534	3	2	109	72
535	4	2	109	72
536	3	104	108	72
537	4	104	108	72
538	3	74	79	72
539	4	74	79	72
540	3	73	1	72
541	4	73	1	72
542	5	2	83	72
543	6	2	83	72
544	5	104	109	72
545	6	104	109	72
546	5	74	108	72
547	6	74	108	72
548	5	73	79	72
549	6	73	79	72
550	5	72	1	72
551	6	72	1	72
552	1	70	52	69
553	2	70	52	69
554	1	46	58	69
555	2	46	58	69
556	1	47	54	69
557	2	47	54	69
558	1	4	55	69
559	2	4	55	69
560	1	49	57	69
561	2	49	57	69
562	3	46	52	69
563	4	46	52	69
564	3	47	58	69
565	4	47	58	69
566	3	4	54	69
567	4	4	54	69
568	3	49	55	69
569	4	49	55	69
570	3	70	57	69
571	4	70	57	69
572	5	47	52	69
573	6	47	52	69
574	5	4	58	69
575	6	4	58	69
576	5	49	54	69
577	6	49	54	69
578	5	70	55	69
579	6	70	55	69
580	5	46	57	69
581	6	46	57	69
582	1	7	69	75
583	2	7	69	75
584	1	6	66	75
585	2	6	66	75
586	1	81	61	75
587	2	81	61	75
588	1	89	107	75
589	2	89	107	75
590	1	90	64	75
591	2	90	64	75
592	3	6	69	75
593	4	6	69	75
594	3	81	66	75
595	4	81	66	75
596	3	89	61	75
597	4	89	61	75
598	3	90	107	75
599	4	90	107	75
600	3	7	64	75
601	4	7	64	75
602	5	81	69	75
603	6	81	69	75
604	5	89	66	75
605	6	89	66	75
607	6	90	61	75
608	5	7	107	75
609	6	7	107	75
610	5	6	64	75
611	6	6	64	75
612	1	110	84	74
613	2	110	84	74
614	1	49	73	74
615	2	49	73	74
616	1	47	2	74
617	2	47	2	74
618	1	46	74	74
619	2	46	74	74
620	1	4	72	74
621	2	4	72	74
622	3	49	84	74
623	4	49	84	74
624	3	47	73	74
625	4	47	73	74
626	3	46	2	74
627	4	46	2	74
628	3	4	74	74
629	4	4	74	74
630	3	110	72	74
631	4	110	72	74
632	5	47	84	74
633	6	47	84	74
634	5	46	73	74
635	6	46	73	74
636	5	4	2	74
637	6	4	2	74
638	5	110	74	74
639	6	110	74	74
640	5	49	72	74
641	6	49	72	74
642	1	3	53	73
643	2	3	53	73
644	1	41	59	73
645	2	41	59	73
646	1	43	54	73
647	2	43	54	73
648	1	45	57	73
649	2	45	57	73
650	1	40	55	73
651	2	40	55	73
652	3	41	53	73
653	4	41	53	73
654	3	43	59	73
655	4	43	59	73
656	3	45	54	73
657	4	45	54	73
658	3	40	57	73
659	4	40	57	73
660	3	3	55	73
661	4	3	55	73
662	5	43	53	73
663	6	43	53	73
664	5	45	59	73
665	6	45	59	73
666	5	40	54	73
667	6	40	54	73
668	5	3	57	73
669	6	3	57	73
670	5	41	55	73
671	6	41	55	73
672	1	77	79	76
673	2	77	79	76
674	1	76	97	76
675	2	76	97	76
676	1	78	80	76
677	2	78	80	76
678	1	71	87	76
679	2	71	87	76
680	1	5	1	76
681	2	5	1	76
682	3	76	79	76
683	4	76	79	76
684	3	78	97	76
685	4	78	97	76
686	3	71	80	76
687	4	71	80	76
688	3	5	87	76
689	4	5	87	76
690	3	77	1	76
691	4	77	1	76
692	5	78	79	76
693	6	78	79	76
694	5	71	97	76
695	6	71	97	76
696	5	5	80	76
697	6	5	80	76
698	5	77	87	76
699	6	77	87	76
700	5	76	1	76
701	6	76	1	76
702	1	48	7	77
703	2	48	7	77
704	1	70	89	77
706	1	47	81	77
707	2	47	81	77
708	1	46	6	77
709	2	46	6	77
710	1	4	90	77
711	2	4	90	77
712	3	70	7	77
713	4	70	7	77
714	3	47	89	77
715	4	47	89	77
716	3	46	81	77
717	4	46	81	77
718	3	4	6	77
719	4	4	6	77
720	3	48	90	77
721	4	48	90	77
722	5	47	7	77
723	6	47	7	77
724	5	46	89	77
725	6	46	89	77
726	5	4	81	77
727	6	4	81	77
728	5	48	6	77
729	6	48	6	77
606	5	90	61	75
730	5	70	90	77
731	6	70	90	77
732	1	66	58	78
733	2	66	58	78
734	1	61	56	78
735	2	61	56	78
736	1	67	54	78
737	2	67	54	78
738	1	69	55	78
739	2	69	55	78
740	1	105	53	78
741	2	105	53	78
742	3	61	58	78
743	4	61	58	78
744	3	67	56	78
745	4	67	56	78
746	3	69	54	78
747	4	69	54	78
748	3	105	55	78
749	4	105	55	78
750	3	66	53	78
751	4	66	53	78
752	5	67	58	78
753	6	67	58	78
754	5	69	56	78
755	6	69	56	78
756	5	105	54	78
757	6	105	54	78
758	5	66	55	78
759	6	66	55	78
760	5	61	53	78
761	6	61	53	78
762	1	73	77	79
763	2	73	77	79
764	1	72	76	79
765	2	72	76	79
766	1	2	78	79
767	2	2	78	79
768	1	84	71	79
769	2	84	71	79
770	1	74	5	79
771	2	74	5	79
772	3	72	77	79
773	4	72	77	79
774	3	2	76	79
775	4	2	76	79
776	3	84	78	79
777	4	84	78	79
778	3	74	71	79
779	4	74	71	79
780	3	73	5	79
781	4	73	5	79
782	5	2	77	79
783	6	2	77	79
784	5	84	76	79
785	6	84	76	79
786	5	74	78	79
787	6	74	78	79
788	5	73	71	79
789	6	73	71	79
790	5	72	5	79
791	6	72	5	79
822	1	109	42	80
823	2	109	42	80
824	1	96	44	80
825	2	96	44	80
826	1	80	43	80
827	2	80	43	80
828	1	1	41	80
829	2	1	41	80
830	1	79	40	80
831	2	79	40	80
832	3	96	42	80
833	4	96	42	80
834	3	80	44	80
835	4	80	44	80
836	3	1	43	80
837	4	1	43	80
838	3	79	41	80
839	4	79	41	80
840	3	109	40	80
841	4	109	40	80
842	5	80	42	80
843	6	80	42	80
844	5	1	44	80
845	6	1	44	80
846	5	79	43	80
847	6	79	43	80
848	5	109	41	80
849	6	109	41	80
850	5	96	40	80
851	6	96	40	80
852	1	62	48	82
853	2	62	48	82
854	1	65	46	82
855	2	65	46	82
856	1	67	47	82
857	2	67	47	82
858	1	69	4	82
859	2	69	4	82
860	1	107	49	82
861	2	107	49	82
862	3	65	48	82
863	4	65	48	82
864	3	67	46	82
865	4	67	46	82
866	3	69	47	82
867	4	69	47	82
868	3	107	4	82
869	4	107	4	82
870	3	62	49	82
871	4	62	49	82
872	5	67	48	82
873	6	67	48	82
874	5	69	46	82
875	6	69	46	82
876	5	107	47	82
877	6	107	47	82
878	5	62	4	82
879	6	62	4	82
880	5	65	49	82
881	6	65	49	82
882	1	3	77	81
883	2	3	77	81
884	1	41	76	81
885	2	41	76	81
886	1	43	78	81
887	2	43	78	81
888	1	40	71	81
889	2	40	71	81
890	1	45	5	81
891	2	45	5	81
892	3	41	77	81
893	4	41	77	81
894	3	43	76	81
895	4	43	76	81
896	3	40	78	81
897	4	40	78	81
898	3	45	71	81
899	4	45	71	81
900	3	3	5	81
901	4	3	5	81
902	5	43	77	81
903	6	43	77	81
904	5	40	76	81
905	6	40	76	81
906	5	45	78	81
907	6	45	78	81
908	5	3	71	81
909	6	3	71	81
910	5	41	5	81
911	6	41	5	81
912	1	6	74	83
913	2	6	74	83
914	1	93	104	83
915	2	93	104	83
916	1	81	2	83
917	2	81	2	83
918	1	111	72	83
919	2	111	72	83
920	1	90	84	83
921	2	90	84	83
922	3	93	74	83
923	4	93	74	83
924	3	81	104	83
925	4	81	104	83
926	3	111	2	83
927	4	111	2	83
928	3	90	72	83
929	4	90	72	83
930	3	6	84	83
931	4	6	84	83
932	5	81	74	83
933	6	81	74	83
934	5	111	104	83
935	6	111	104	83
936	5	90	2	83
937	6	90	2	83
938	5	6	72	83
939	6	6	72	83
940	5	93	84	83
941	6	93	84	83
942	1	57	83	84
943	2	57	83	84
944	1	53	91	84
945	2	53	91	84
946	1	60	108	84
947	2	60	108	84
948	1	58	79	84
949	2	58	79	84
950	1	59	1	84
951	2	59	1	84
952	3	53	83	84
953	4	53	83	84
954	3	60	91	84
955	4	60	91	84
956	3	58	108	84
957	4	58	108	84
958	3	59	79	84
959	4	59	79	84
960	3	57	1	84
961	4	57	1	84
962	5	60	83	84
963	6	60	83	84
964	5	58	91	84
965	6	58	91	84
966	5	59	108	84
967	6	59	108	84
968	5	57	79	84
969	6	57	79	84
970	5	53	1	84
971	6	53	1	84
972	1	109	46	85
973	2	109	46	85
974	1	1	49	85
975	2	1	49	85
976	1	80	47	85
977	2	80	47	85
978	1	79	70	85
979	2	79	70	85
980	1	87	110	85
981	2	87	110	85
982	3	1	46	85
983	4	1	46	85
984	3	80	49	85
985	4	80	49	85
986	3	79	47	85
987	4	79	47	85
988	3	87	70	85
989	4	87	70	85
990	3	109	110	85
991	4	109	110	85
992	5	80	46	85
993	6	80	46	85
994	5	79	49	85
995	6	79	49	85
996	5	87	47	85
997	6	87	47	85
998	5	109	70	85
999	6	109	70	85
1000	5	1	110	85
1001	6	1	110	85
1002	1	55	42	88
1003	2	55	42	88
1004	1	58	41	88
1005	2	58	41	88
1006	1	54	43	88
1007	2	54	43	88
1008	1	59	40	88
1009	2	59	40	88
1010	1	57	45	88
1011	2	57	45	88
1012	3	58	42	88
1013	4	58	42	88
1014	3	54	41	88
1015	4	54	41	88
1016	3	59	43	88
1017	4	59	43	88
1018	3	57	40	88
1019	4	57	40	88
1020	3	55	45	88
1021	4	55	45	88
1022	5	54	42	88
1023	6	54	42	88
1024	5	59	41	88
1025	6	59	41	88
1026	5	57	43	88
1027	6	57	43	88
1028	5	55	40	88
1029	6	55	40	88
1030	5	58	45	88
1031	6	58	45	88
1032	1	76	6	86
1033	2	76	6	86
1034	1	77	7	86
1035	2	77	7	86
1036	1	78	81	86
1037	2	78	81	86
1038	1	71	93	86
1039	2	71	93	86
1040	1	5	90	86
1041	2	5	90	86
1042	3	77	6	86
1043	4	77	6	86
1044	3	78	7	86
1045	4	78	7	86
1046	3	71	81	86
1047	4	71	81	86
1048	3	5	93	86
1049	4	5	93	86
1050	3	76	90	86
1051	4	76	90	86
1052	5	78	6	86
1053	6	78	6	86
1054	5	71	7	86
1055	6	71	7	86
1056	5	5	81	86
1057	6	5	81	86
1058	5	76	93	86
1059	6	76	93	86
1060	5	77	90	86
1061	6	77	90	86
1062	1	66	84	87
1063	2	66	84	87
1064	1	105	72	87
1065	2	105	72	87
1066	1	61	2	87
1067	2	61	2	87
1068	1	69	104	87
1069	2	69	104	87
1070	1	65	73	87
1071	2	65	73	87
1072	3	105	84	87
1073	4	105	84	87
1074	3	61	72	87
1075	4	61	72	87
1076	3	69	2	87
1077	4	69	2	87
1078	3	65	104	87
1079	4	65	104	87
1080	3	66	73	87
1081	4	66	73	87
1082	5	61	84	87
1083	6	61	84	87
1084	5	69	72	87
1085	6	69	72	87
1086	5	65	2	87
1087	6	65	2	87
1088	5	66	104	87
1089	6	66	104	87
1090	5	105	73	87
1091	6	105	73	87
1092	1	96	84	91
1093	2	96	84	91
1094	1	1	73	91
1095	2	1	73	91
1096	1	80	2	91
1097	2	80	2	91
1098	1	97	75	91
1099	2	97	75	91
1100	1	79	74	91
1101	2	79	74	91
1102	3	1	84	91
1103	4	1	84	91
1104	3	80	73	91
1105	4	80	73	91
1106	3	97	2	91
1107	4	97	2	91
1108	3	79	75	91
1109	4	79	75	91
1110	3	96	74	91
1111	4	96	74	91
1112	5	80	84	91
1113	6	80	84	91
1114	5	97	73	91
1115	6	97	73	91
1116	5	79	2	91
1117	6	79	2	91
1118	5	96	75	91
1119	6	96	75	91
1120	5	1	74	91
1121	6	1	74	91
1122	1	42	112	89
1123	2	42	112	89
1124	1	3	90	89
1125	2	3	90	89
1126	1	43	81	89
1127	2	43	81	89
1128	1	44	93	89
1129	2	44	93	89
1130	1	41	7	89
1131	2	41	7	89
1132	3	3	112	89
1133	4	3	112	89
1134	3	43	90	89
1135	4	43	90	89
1136	3	44	81	89
1137	4	44	81	89
1138	3	41	93	89
1139	4	41	93	89
1140	3	42	7	89
1141	4	42	7	89
1142	5	43	112	89
1143	6	43	112	89
1144	5	44	90	89
1145	6	44	90	89
1146	5	41	81	89
1147	6	41	81	89
1148	5	42	93	89
1149	6	42	93	89
1150	5	3	7	89
1151	6	3	7	89
1152	1	53	46	90
1153	2	53	46	90
1154	1	55	110	90
1155	2	55	110	90
1156	1	54	47	90
1157	2	54	47	90
1158	1	52	70	90
1159	2	52	70	90
1160	1	57	49	90
1161	2	57	49	90
1162	3	55	46	90
1163	4	55	46	90
1164	3	54	110	90
1165	4	54	110	90
1166	3	52	47	90
1167	4	52	47	90
1168	3	57	70	90
1169	4	57	70	90
1170	3	53	49	90
1171	4	53	49	90
1172	5	54	46	90
1173	6	54	46	90
1174	5	52	110	90
1175	6	52	110	90
1176	5	57	47	90
1177	6	57	47	90
1178	5	53	70	90
1179	6	53	70	90
1180	5	55	49	90
1181	6	55	49	90
1182	1	71	69	92
1183	2	71	69	92
1184	1	82	62	92
1185	2	82	62	92
1186	1	78	61	92
1187	2	78	61	92
1188	1	92	107	92
1189	2	92	107	92
1190	1	5	105	92
1191	2	5	105	92
1192	3	82	69	92
1193	4	82	69	92
1194	3	78	62	92
1195	4	78	62	92
1196	3	92	61	92
1197	4	92	61	92
1198	3	5	107	92
1199	4	5	107	92
1200	3	71	105	92
1201	4	71	105	92
1202	5	78	69	92
1203	6	78	69	92
1204	5	92	62	92
1205	6	92	62	92
1206	5	5	61	92
1207	6	5	61	92
1208	5	71	107	92
1209	6	71	107	92
1210	5	82	105	92
1211	6	82	105	92
1212	1	7	110	93
1213	2	7	110	93
1214	1	89	49	93
1215	2	89	49	93
1216	1	81	47	93
1217	2	81	47	93
1218	1	6	46	93
1219	2	6	46	93
1220	1	90	70	93
1221	2	90	70	93
1222	3	89	110	93
1223	4	89	110	93
1224	3	81	49	93
1225	4	81	49	93
1226	3	6	47	93
1227	4	6	47	93
1228	3	90	46	93
1229	4	90	46	93
1230	3	7	70	93
1231	4	7	70	93
1232	5	81	110	93
1233	6	81	110	93
1234	5	6	49	93
1235	6	6	49	93
1236	5	90	47	93
1237	6	90	47	93
1238	5	7	46	93
1239	6	7	46	93
1240	5	89	70	93
1241	6	89	70	93
1242	1	59	69	94
1243	2	59	69	94
1244	1	53	65	94
1245	2	53	65	94
1246	1	54	67	94
1247	2	54	67	94
1248	1	57	63	94
1249	2	57	63	94
1250	1	55	113	94
1251	2	55	113	94
1252	3	53	69	94
1253	4	53	69	94
1254	3	54	65	94
1255	4	54	65	94
1256	3	57	67	94
1257	4	57	67	94
1258	3	55	63	94
1259	4	55	63	94
1260	3	59	113	94
1261	4	59	113	94
1262	5	54	69	94
1263	6	54	69	94
1264	5	57	65	94
1265	6	57	65	94
1266	5	55	67	94
1267	6	55	67	94
1268	5	59	63	94
1269	6	59	63	94
1270	5	53	113	94
1271	6	53	113	94
1272	1	75	41	95
1273	2	75	41	95
1274	1	84	42	95
1275	2	84	42	95
1276	1	2	43	95
1277	2	2	43	95
1278	1	72	44	95
1279	2	72	44	95
1280	1	74	40	95
1281	2	74	40	95
1282	3	84	41	95
1283	4	84	41	95
1284	3	2	42	95
1285	4	2	42	95
1286	3	72	43	95
1287	4	72	43	95
1288	3	74	44	95
1289	4	74	44	95
1290	3	75	40	95
1291	4	75	40	95
1292	5	2	41	95
1293	6	2	41	95
1294	5	72	42	95
1295	6	72	42	95
1296	5	74	43	95
1297	6	74	43	95
1298	5	75	44	95
1299	6	75	44	95
1300	5	84	40	95
1301	6	84	40	95
1302	1	109	5	96
1303	2	109	5	96
1304	1	83	71	96
1305	2	83	71	96
1306	1	80	78	96
1307	2	80	78	96
1310	1	87	76	96
1311	2	87	76	96
1312	3	83	5	96
1313	4	83	5	96
1314	3	80	71	96
1315	4	80	71	96
1318	3	87	77	96
1319	4	87	77	96
1320	3	109	76	96
1321	4	109	76	96
1322	5	80	5	96
1323	6	80	5	96
1326	5	87	78	96
1327	6	87	78	96
1328	5	109	77	96
1329	6	109	77	96
1330	5	83	76	96
1331	6	83	76	96
1332	1	82	42	97
1333	2	82	42	97
1334	1	71	3	97
1335	2	71	3	97
1336	1	78	43	97
1337	2	78	43	97
1338	1	76	41	97
1339	2	76	41	97
1340	1	5	45	97
1341	2	5	45	97
1342	3	71	42	97
1343	4	71	42	97
1344	3	78	3	97
1345	4	78	3	97
1346	3	76	43	97
1347	4	76	43	97
1348	3	5	41	97
1349	4	5	41	97
1350	3	82	45	97
1351	4	82	45	97
1352	5	78	42	97
1353	6	78	42	97
1354	5	76	3	97
1355	6	76	3	97
1356	5	5	43	97
1357	6	5	43	97
1358	5	82	41	97
1359	6	82	41	97
1360	5	71	45	97
1361	6	71	45	97
1362	1	73	7	99
1363	2	73	7	99
1364	1	84	89	99
1365	2	84	89	99
1366	1	2	81	99
1367	2	2	81	99
1368	1	75	6	99
1369	2	75	6	99
1370	1	74	90	99
1371	2	74	90	99
1372	3	84	7	99
1373	4	84	7	99
1374	3	2	89	99
1375	4	2	89	99
1376	3	75	81	99
1377	4	75	81	99
1378	3	74	6	99
1379	4	74	6	99
1380	3	73	90	99
1381	4	73	90	99
1382	5	2	7	99
1383	6	2	7	99
1384	5	75	89	99
1385	6	75	89	99
1386	5	74	81	99
1387	6	74	81	99
1324	5	97	71	96
1316	3	97	78	96
1309	2	97	77	96
1308	1	97	77	96
1388	5	73	6	99
1389	6	73	6	99
1390	5	84	90	99
1391	6	84	90	99
1409	4	97	57	100
1395	2	79	55	100
1397	2	80	54	100
1406	3	91	54	100
1408	3	97	57	100
1401	2	97	56	100
1399	2	91	57	100
1407	4	91	54	100
1410	3	108	56	100
1394	1	79	55	100
1393	2	108	53	100
1403	4	79	53	100
1392	1	108	53	100
1405	4	80	55	100
1398	1	91	57	100
1411	4	108	56	100
1404	3	80	55	100
1402	3	79	53	100
1400	1	97	56	100
1396	1	80	54	100
1421	6	79	56	100
1419	6	108	57	100
1415	6	91	55	100
1420	5	79	56	100
1416	5	97	54	100
1417	6	97	54	100
1418	5	108	57	100
1413	6	80	53	100
1414	5	91	55	100
1412	5	80	53	100
1443	6	47	69	98
1444	5	49	63	98
1442	5	47	69	98
1449	6	110	105	98
1447	6	70	61	98
1446	5	70	61	98
1427	2	47	61	98
1428	1	49	105	98
1426	1	47	61	98
1431	2	70	113	98
1424	1	48	63	98
1422	1	110	69	98
1429	2	49	105	98
1430	1	70	113	98
1425	2	48	63	98
1423	2	110	69	98
1435	4	47	63	98
1432	3	48	69	98
1436	3	49	61	98
1437	4	49	61	98
1434	3	47	63	98
1441	4	110	113	98
1439	4	70	105	98
1438	3	70	105	98
1433	4	48	69	98
1440	3	110	113	98
1451	6	48	113	98
1448	5	110	105	98
1445	6	49	63	98
1450	5	48	113	98
1491	2	52	71	103
1463	4	63	89	101
1493	4	55	76	103
1509	6	53	5	103
1499	4	52	5	103
1511	6	55	71	103
1474	5	69	6	101
1500	3	53	71	103
1478	5	105	7	101
1476	5	65	81	101
1472	5	67	89	101
1501	4	53	71	103
1461	2	65	90	101
1504	5	100	92	103
1456	1	67	81	101
1473	6	67	89	101
1477	6	65	81	101
1452	1	105	89	101
1454	1	63	6	101
1475	6	69	6	101
1458	1	69	7	101
1460	1	65	90	101
1506	5	52	78	103
1480	5	63	90	101
1479	6	105	7	101
1481	6	63	90	101
1457	2	67	81	101
1455	2	63	6	101
1459	2	69	7	101
1453	2	105	89	101
1486	1	54	78	103
1485	2	55	92	103
1470	3	105	90	101
1495	4	54	92	103
1464	3	67	6	101
1468	3	65	7	101
1466	3	69	81	101
1462	3	63	89	101
1497	4	100	78	103
1465	4	67	6	101
1469	4	65	7	101
1467	4	69	81	101
1471	4	105	90	101
1508	5	53	5	103
1502	5	54	76	103
1503	6	54	76	103
1505	6	100	92	103
1510	5	55	71	103
1487	2	54	78	103
1496	3	100	78	103
1488	1	100	5	103
1483	2	53	76	103
1490	1	52	71	103
1484	1	55	92	103
1482	1	53	76	103
1494	3	54	92	103
1489	2	100	5	103
1498	3	52	5	103
1492	3	55	76	103
1507	6	52	78	103
1521	2	84	49	102
1534	5	73	70	102
1524	3	2	70	102
1527	4	73	47	102
1530	3	72	49	102
1522	3	75	46	102
1523	4	75	46	102
1528	3	84	110	102
1525	4	2	70	102
1529	4	84	110	102
1520	1	84	49	102
1526	3	73	47	102
1518	1	73	110	102
1512	1	72	46	102
1531	4	72	49	102
1515	2	75	70	102
1514	1	75	70	102
1517	2	2	47	102
1516	1	2	47	102
1519	2	73	110	102
1532	5	2	46	102
1537	6	84	47	102
1533	6	2	46	102
1535	6	73	70	102
1536	5	84	47	102
1539	6	72	110	102
1538	5	72	110	102
1540	5	75	49	102
1513	2	72	46	102
1551	2	40	79	104
1550	1	40	79	104
1543	2	44	83	104
1545	2	3	80	104
1546	1	43	108	104
1542	1	44	83	104
1547	2	43	108	104
1549	2	41	1	104
1544	1	3	80	104
1559	4	40	1	104
1561	4	44	79	104
1552	3	3	83	104
1556	3	41	108	104
1560	3	44	79	104
1553	4	3	83	104
1557	4	41	108	104
1558	3	40	1	104
1554	3	43	80	104
1555	4	43	80	104
1569	6	44	1	104
1570	5	3	79	104
1562	5	43	83	104
1567	6	40	108	104
1568	5	44	1	104
1566	5	40	108	104
1564	5	41	80	104
1563	6	43	83	104
1565	6	41	80	104
1571	6	3	79	104
1541	6	75	49	102
1325	6	97	71	96
1317	4	97	78	96
1548	1	41	1	104
705	2	70	89	77
1599	6	42	62	105
1600	5	44	105	105
1601	6	44	105	105
1578	1	45	62	105
1572	1	42	63	105
1574	1	44	69	105
1579	2	45	62	105
1575	2	44	69	105
1573	2	42	63	105
1586	3	45	61	105
1580	1	41	105	105
1587	4	45	61	105
1581	2	41	105	105
1582	3	44	63	105
1576	1	43	61	105
1583	4	44	63	105
1588	3	41	62	105
1577	2	43	61	105
1589	4	41	62	105
1590	3	42	105	105
1592	5	43	63	105
1591	4	42	105	105
1597	6	41	61	105
1593	6	43	63	105
1595	6	45	69	105
1596	5	41	61	105
1594	5	45	69	105
1598	5	42	62	105
1584	3	43	69	105
1585	4	43	69	105
1653	6	81	109	107
1613	4	72	53	106
1622	5	2	53	106
1648	3	93	1	107
1615	4	2	55	106
1616	3	75	54	106
1606	1	2	54	106
1607	2	2	54	106
1605	2	72	55	106
1603	2	84	53	106
1618	3	73	57	106
1602	1	84	53	106
1610	1	73	52	106
1642	3	90	109	107
1612	3	72	53	106
1624	5	75	55	106
1625	6	75	55	106
1626	5	73	54	106
1627	6	73	54	106
1628	5	84	57	106
1629	6	84	57	106
1630	5	72	52	106
1631	6	72	52	106
1652	5	81	109	107
1611	2	73	52	106
1658	5	7	1	107
1633	2	7	109	107
1614	3	2	55	106
1617	4	75	54	106
1619	4	73	57	106
1620	3	84	52	106
1609	2	75	57	106
1608	1	75	57	106
1604	1	72	55	106
1638	1	6	1	107
1641	2	93	83	107
1643	4	90	109	107
1634	1	90	79	107
1651	4	7	83	107
1647	4	6	80	107
1649	4	93	1	107
1636	1	81	80	107
1650	3	7	83	107
1639	2	6	1	107
1661	6	90	83	107
1655	6	6	79	107
1660	5	90	83	107
1640	1	93	83	107
1632	1	7	109	107
1654	5	6	79	107
1646	3	6	80	107
1656	5	93	80	107
1659	6	7	1	107
1657	6	93	80	107
1635	2	90	79	107
1623	6	2	53	106
1637	2	81	80	107
1621	4	84	52	106
1645	4	81	79	107
1644	3	81	79	107
\.


--
-- Data for Name: recording_leaguematch; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY recording_leaguematch (id, venue, match_date, number_frames, table_size, is_completed, is_submitted, pool_type, score_type, home_score, away_score, home_points_raw, away_points_raw, legs, handicap, away_id, home_id, week_id, winner_id, is_initialized, _away_ordered_players, _home_ordered_players, break_type, season_id, league_id) FROM stdin;
92	Racks	2017-05-03 20:00:00+08	0	9	t	t	8-Ball	P	1	6	220	262	6	5	5	8	9	5	t	71_82_78_92_5	69_62_61_107_105	A	1	1
59	Billidart	2017-03-08 20:00:00+08	30	9	t	t	8-Ball	P	3	4	229	242	6	0	1	7	1	1	t	1_79_80_91_87	6_89_81_7_90	A	1	1
64	Racks	2017-03-16 20:00:00+08	30	9	t	t	8-Ball	P	0	7	246	286	6	-15	6	2	2	6	t	56_53_54_55_58	74_104_2_73_84	A	1	1
61	Billidart	2017-03-15 20:00:00+08	30	9	t	t	8-Ball	P	0	7	208	300	6	-7	4	1	2	4	t	70_46_47_4_48	1_83_80_97_79	A	1	1
66	Billidart	2017-03-22 20:00:00+08	0	9	t	t	8-Ball	P	5	2	225	212	6	0	6	7	3	7	t	53_56_106_55_52	6_7_81_89_90	A	1	1
67	Racks	2017-03-22 20:00:00+08	0	9	t	t	8-Ball	P	5	2	270	232	6	5	1	8	3	8	t	79_91_80_1_83	69_62_61_66_64	A	1	1
68	Racks	2017-03-21 20:00:00+08	0	9	t	t	8-Ball	P	5	2	258	224	6	5	5	4	3	4	t	82_77_78_76_5	49_4_47_46_70	A	1	1
69	Racks	2017-03-28 20:00:00+08	0	9	t	t	8-Ball	P	2	5	216	249	6	3	4	6	4	4	t	70_46_47_4_49	52_58_54_55_57	A	1	1
70	Racks	2017-03-29 20:00:00+08	0	9	t	t	8-Ball	P	6	1	255	193	6	0	7	3	4	3	t	7_93_81_6_90	42_41_43_40_45	A	1	1
71	Billidart	2017-03-29 20:00:00+08	0	9	t	t	8-Ball	P	6	1	256	210	6	-5	8	5	4	5	t	66_105_67_107_69	76_71_78_5_77	A	1	1
72	Billidart	2017-03-29 20:00:00+08	0	9	t	t	8-Ball	P	0	7	168	278	6	-2	2	1	4	2	t	73_72_2_104_74	83_109_108_79_1	A	1	1
73	Billidart	2017-04-05 20:00:00+08	0	9	t	t	8-Ball	P	2	5	219	265	6	7	3	6	5	3	t	3_41_43_45_40	53_59_54_57_55	A	1	1
74	Racks	2017-04-04 20:00:00+08	0	9	t	t	8-Ball	P	7	0	261	164	6	-1	4	2	5	2	t	110_49_47_46_4	84_73_2_74_72	A	1	1
75	Billidart	2017-04-05 20:00:00+08	0	9	t	t	8-Ball	P	2	5	215	244	6	3	7	8	5	7	t	7_6_81_89_90	69_66_61_107_64	A	1	1
78	Racks	2017-04-11 20:00:00+08	0	9	t	t	8-Ball	P	2	5	227	248	6	-3	8	6	6	8	t	66_61_67_69_105	58_56_54_55_53	A	1	1
65	Billidart	2017-03-22 20:00:00+08	0	9	t	t	8-Ball	P	2	5	204	236	6	0	3	2	3	3	t	41_44_43_40_45	104_75_2_84_73	A	1	1
79	Billidart	2017-04-12 20:00:00+08	0	9	t	t	8-Ball	P	2	5	223	241	6	1	2	5	6	2	t	73_72_2_84_74	77_76_78_71_5	A	1	1
80	Racks	2017-04-12 20:00:00+08	0	9	t	t	8-Ball	P	6	1	258	202	6	-5	1	3	6	3	t	109_96_80_1_79	42_44_43_41_40	A	1	1
77	Billidart	2017-04-12 20:00:00+08	0	9	t	t	8-Ball	P	7	0	244	195	6	1	4	7	6	7	t	48_70_47_46_4	7_89_81_6_90	A	1	1
82	Racks	2017-04-18 20:00:00+08	0	9	t	t	8-Ball	P	5	2	248	187	6	2	8	4	7	4	t	62_65_67_69_107	48_46_47_4_49	A	1	1
83	Racks	2017-04-19 20:00:00+08	0	9	t	t	8-Ball	P	5	2	243	238	6	-5	7	2	7	2	t	6_93_81_111_90	74_104_2_72_84	A	1	1
84	Billidart	2017-04-19 20:00:00+08	0	9	t	t	8-Ball	P	0	7	204	263	6	3	6	1	7	6	t	57_53_60_58_59	83_91_108_79_1	A	1	1
85	Racks	2017-04-25 20:00:00+08	0	9	t	t	8-Ball	P	4	3	234	224	6	1	1	4	8	4	t	109_1_80_79_87	46_49_47_70_110	A	1	1
86	Billidart	2017-04-26 20:00:00+08	0	9	t	t	8-Ball	P	0	7	194	273	6	1	5	7	8	5	t	76_77_78_71_5	6_7_81_93_90	A	1	1
87	Billidart	2017-04-26 20:00:00+08	0	9	t	t	8-Ball	P	7	0	271	229	6	-7	8	2	8	2	t	66_105_61_69_65	84_72_2_104_73	A	1	1
88	Racks	2017-04-26 20:00:00+08	0	9	t	t	8-Ball	P	2	5	196	263	6	-8	6	3	8	6	t	55_58_54_59_57	42_41_43_40_45	A	1	1
89	Billidart	2017-05-03 20:00:00+08	0	9	t	t	8-Ball	P	2	5	213	237	6	3	3	7	9	3	t	42_3_43_44_41	112_90_81_93_7	A	1	1
90	Billidart	2017-05-03 20:00:00+08	0	9	t	t	8-Ball	P	4	3	231	226	6	-1	6	4	9	4	t	53_55_54_52_57	46_110_47_70_49	A	1	1
91	Racks	2017-05-02 20:00:00+08	0	9	t	t	8-Ball	P	6	1	279	223	6	-8	1	2	9	2	t	96_1_80_97_79	84_73_2_75_74	A	1	1
93	Racks	2017-05-09 20:00:00+08	0	9	t	t	8-Ball	P	2	5	223	241	6	1	7	4	10	7	t	7_89_81_6_90	110_49_47_46_70	A	1	1
94	Billidart	2017-05-10 20:00:00+08	0	9	t	t	8-Ball	P	4	3	238	222	6	-1	6	8	10	8	t	59_53_54_57_55	69_65_67_63_113	A	1	1
95	Racks	2017-05-10 20:00:00+08	0	9	t	t	8-Ball	P	5	2	232	219	6	0	2	3	10	3	t	75_84_2_72_74	41_42_43_44_40	A	1	1
100	Racks	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	4	3	235	222	6	-1	1	6	11	6	t	108_79_80_91_97	53_55_54_57_56	A	1	1
98	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	5	2	217	179	6	-1	4	8	11	8	t	110_48_47_49_70	69_63_61_105_113	A	1	1
97	Racks	2017-05-16 20:00:00+08	0	9	t	t	8-Ball	P	5	2	219	216	6	2	5	3	11	3	t	82_71_78_76_5	42_3_43_41_45	A	1	1
99	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	4	3	237	221	6	4	2	7	11	7	t	73_84_2_75_74	7_89_81_6_90	A	1	1
101	Racks	2017-05-23 20:00:00+08	0	9	t	t	8-Ball	P	7	0	278	190	6	-2	8	7	12	7	t	105_63_67_69_65	89_6_81_7_90	A	1	1
104	Billidart	2017-05-24 20:00:00+08	0	9	t	t	8-Ball	P	2	5	221	273	6	6	3	1	12	3	t	44_3_43_41_40	83_80_108_1_79	A	1	1
81	Billidart	2017-04-19 20:00:00+08	0	9	t	t	8-Ball	P	1	6	204	247	6	2	3	5	7	3	t	3_41_43_40_45	77_76_78_71_5	A	1	1
58	Racks	2017-03-01 20:00:00+08	30	9	t	t	8-Ball	P	1	6	180	259	6	0	2	8	1	2	t	74_72_2_73_84	64_63_67_61_69	A	1	1
62	Racks	2017-03-14 20:00:00+08	30	9	t	t	8-Ball	P	1	6	210	262	6	-5	7	5	2	7	t	6_93_81_89_7	88_76_103_71_92	A	1	1
60	Billidart	2017-03-01 20:00:00+08	30	9	t	t	8-Ball	P	0	7	164	262	6	0	5	6	1	5	t	92_76_78_88_71	53_100_54_55_58	A	1	1
108	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	4	5	13	\N	f	\N	\N	A	1	1
109	Billidart	2017-06-07 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	4	3	14	\N	f	\N	\N	A	1	1
110	Racks	2017-06-06 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	7	6	14	\N	f	\N	\N	A	1	1
111	Billidart	2017-06-07 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	8	1	14	\N	f	\N	\N	A	1	1
112	Racks	2017-06-07 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	5	2	14	\N	f			A	1	1
57	Racks	2017-02-28 20:00:00+08	30	9	t	t	8-Ball	P	2	5	191	246	6	0	3	4	1	3	t	42_3_43_41_40	70_49_47_4_46	A	1	1
76	Racks	2017-04-05 20:00:00+08	0	9	t	t	8-Ball	P	4	3	234	235	6	6	5	1	5	1	t	77_76_78_71_5	79_97_80_87_1	A	1	1
63	Billidart	2017-03-15 20:00:00+08	30	9	t	t	8-Ball	P	6	1	256	214	6	-5	8	3	2	3	t	62_105_61_69_63	42_44_43_41_40	A	1	1
96	Billidart	2017-05-10 20:00:00+08	0	9	t	t	8-Ball	P	4	3	246	237	6	-8	1	5	10	5	t	109_83_80_97_87	5_71_78_77_76	A	1	1
107	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	2	4	207	240	6	3	7	1	13	\N	t	7_90_81_6_93	109_79_80_1_83	A	1	1
102	Billidart	2017-05-24 20:00:00+08	0	9	t	t	8-Ball	P	3	4	244	251	6	5	2	4	12	2	t	72_75_2_73_84	46_70_47_110_49	A	1	1
103	Racks	2017-05-24 20:00:00+08	0	9	t	t	8-Ball	P	6	1	251	210	6	-5	6	5	12	5	t	53_55_54_100_52	76_92_78_5_71	A	1	1
105	Racks	2017-05-30 20:00:00+08	0	9	t	t	8-Ball	P	1	6	227	260	6	5	3	8	13	3	t	42_44_43_45_41	63_69_61_62_105	A	1	1
106	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	3	3	176	186	6	6	2	6	13	\N	t	84_72_2_75_73	53_55_54_57_52	A	1	1
\.


--
-- Name: recording_leaguematch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('recording_leaguematch_id_seq', 112, true);


--
-- Data for Name: recording_match; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY recording_match (id, venue, match_date, number_frames, table_size, is_completed, is_submitted, pool_type, score_type, home_score, away_score, race_to, match_type, away_id, home_id, week_id, winner_id, is_initialized, break_type, season_id) FROM stdin;
92	Sun Mong	2017-03-12 16:30:00+08	13	9	t	t	8-Ball	F	6	7	7	I	102	101	\N	102	f	W	\N
93		2017-03-12 19:19:58+08	13	9	t	t	8-Ball	F	6	7	7	I	101	102	\N	101	f	W	\N
38	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	41	47	\N	41	f	A	1
39	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	40	4	\N	40	f	A	1
40	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	42	46	\N	42	f	A	1
41	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	43	70	\N	70	f	A	1
42	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	41	49	\N	41	f	A	1
43	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	40	47	\N	40	f	A	1
44	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	42	4	\N	4	f	A	1
45	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	15	14	2	E	3	46	\N	46	f	A	1
31	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	42	70	\N	70	f	A	1
77	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	1	6	\N	6	f	A	1
97	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	81	103	\N	81	f	A	1
98	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	89	71	\N	71	f	A	1
51	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	84	69	\N	84	f	A	1
52	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	72	64	\N	\N	f	A	1
53	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	2	63	\N	63	f	A	1
54	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	73	67	\N	\N	f	A	1
55	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	84	61	\N	84	f	A	1
56	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	74	69	\N	\N	f	A	1
57	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	2	64	\N	2	f	A	1
58	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	73	63	\N	73	f	A	1
59	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	84	67	\N	84	f	A	1
60	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	74	61	\N	74	f	A	1
61	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	11	15	2	E	72	69	\N	72	f	A	1
96	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	93	76	\N	93	f	A	1
64	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	78	54	\N	78	f	A	1
79	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	80	81	\N	80	f	A	1
80	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	91	7	\N	\N	f	A	1
81	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	87	90	\N	87	f	A	1
82	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	79	6	\N	6	f	A	1
83	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	80	89	\N	\N	f	A	1
84	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	91	81	\N	91	f	A	1
85	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	87	7	\N	7	f	A	1
86	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	1	90	\N	1	f	A	1
87	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	80	6	\N	80	f	A	1
88	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	91	89	\N	89	f	A	1
89	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	87	81	\N	87	f	A	1
90	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	1	7	\N	1	f	A	1
48	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	72	63	\N	63	f	A	1
65	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	88	55	\N	\N	f	A	1
66	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	71	58	\N	71	f	A	1
67	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	76	53	\N	76	f	A	1
68	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	78	100	\N	100	f	A	1
69	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	1	20	2	E	88	54	\N	88	f	A	1
70	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	71	55	\N	71	f	A	1
71	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	14	12	2	E	92	58	\N	58	f	A	1
72	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	78	53	\N	53	f	A	1
73	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	88	100	\N	88	f	A	1
74	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	71	54	\N	71	f	A	1
75	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	92	55	\N	92	f	A	1
76	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	76	58	\N	76	f	A	1
62	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	92	53	\N	53	f	A	1
63	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	76	100	\N	76	f	A	1
33	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	43	47	\N	47	f	A	1
34	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	41	4	\N	41	f	A	1
35	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	40	46	\N	\N	f	A	1
99	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	7	92	\N	92	f	A	1
100	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	93	88	\N	93	f	A	1
101	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	81	76	\N	76	f	A	1
102	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	89	103	\N	89	f	A	1
95	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	6	88	\N	6	f	A	1
49	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	2	67	\N	2	f	A	1
78	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	79	89	\N	89	f	A	1
50	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	73	61	\N	73	f	A	1
36	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	3	70	\N	3	f	A	1
37	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	43	49	\N	43	f	A	1
155	Sun Mong	2017-03-19 15:52:34+08	13	9	t	t	8-Ball	F	6	7	7	I	102	101	\N	102	f	W	\N
116	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	47	83	\N	83	f	A	1
117	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	4	80	\N	4	f	A	1
118	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	48	97	\N	48	f	A	1
119	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	70	79	\N	\N	f	A	1
120	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	47	1	\N	1	f	A	1
121	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	4	83	\N	4	f	A	1
122	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	48	80	\N	\N	f	A	1
124	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	46	79	\N	46	f	A	1
140	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	62	42	\N	62	f	A	1
141	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	105	44	\N	44	f	A	1
105	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	81	88	\N	88	f	A	1
106	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	89	76	\N	76	f	A	1
107	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	7	103	\N	7	f	A	1
108	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	6	71	\N	\N	f	A	1
109	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	93	92	\N	92	f	A	1
128	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	14	10	2	E	55	73	\N	73	f	A	1
129	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	58	84	\N	84	f	A	1
130	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	53	74	\N	74	f	A	1
131	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	54	104	\N	104	f	A	1
132	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	55	2	\N	2	f	A	1
145	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	105	42	\N	\N	f	A	1
146	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	61	44	\N	44	f	A	1
147	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	11	15	2	E	69	43	\N	69	f	A	1
148	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	63	41	\N	41	f	A	1
149	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	62	40	\N	40	f	A	1
150	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	61	42	\N	42	f	A	1
151	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	69	44	\N	44	f	A	1
152	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	63	43	\N	43	f	A	1
153	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	62	41	\N	\N	f	A	1
154	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	15	11	2	E	105	40	\N	40	f	A	1
171	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	41	104	\N	104	f	A	1
103	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	7	71	\N	7	f	A	1
160	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	12	14	2	E	5	70	\N	5	f	A	1
113	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	4	97	\N	4	f	A	1
162	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	78	4	\N	4	f	A	1
134	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	56	84	\N	84	f	A	1
135	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	54	74	\N	74	f	A	1
136	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	55	104	\N	104	f	A	1
137	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	58	2	\N	58	f	A	1
138	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	56	73	\N	56	f	A	1
139	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	53	84	\N	84	f	A	1
125	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	56	74	\N	56	f	A	1
126	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	53	104	\N	104	f	A	1
127	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	54	2	\N	2	f	A	1
111	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	46	83	\N	46	f	A	1
172	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	44	75	\N	44	f	A	1
142	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	61	43	\N	61	f	A	1
161	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	77	49	\N	77	f	A	1
144	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	63	40	\N	40	f	A	1
163	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	76	47	\N	76	f	A	1
164	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	5	46	\N	46	f	A	1
165	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	14	13	2	E	82	70	\N	70	f	A	1
166	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	78	49	\N	\N	f	A	1
167	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	76	4	\N	4	f	A	1
168	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	5	47	\N	5	f	A	1
169	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	12	17	2	E	82	46	\N	82	f	A	1
170	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	12	17	2	E	77	70	\N	77	f	A	1
156	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	82	49	\N	\N	f	A	1
157	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	77	4	\N	4	f	A	1
158	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	78	47	\N	47	f	A	1
159	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	76	46	\N	46	f	A	1
112	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	47	80	\N	80	f	A	1
104	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	6	92	\N	6	f	A	1
143	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	69	41	\N	69	f	A	1
114	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	15	15	2	E	48	79	\N	\N	f	A	1
115	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	46	1	\N	\N	f	A	1
179	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	45	84	\N	84	f	A	1
180	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	41	73	\N	73	f	A	1
181	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	43	104	\N	104	f	A	1
182	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	40	75	\N	40	f	A	1
183	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	45	2	\N	2	f	A	1
184	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	41	84	\N	41	f	A	1
185	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	44	73	\N	44	f	A	1
192	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	106	7	\N	7	f	A	1
193	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	55	81	\N	55	f	A	1
195	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	53	90	\N	90	f	A	1
196	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	106	6	\N	6	f	A	1
197	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	55	7	\N	7	f	A	1
198	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	52	81	\N	52	f	A	1
199	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	53	89	\N	89	f	A	1
200	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	56	90	\N	56	f	A	1
186	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	53	6	\N	53	f	A	1
187	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	56	7	\N	7	f	A	1
188	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	106	81	\N	81	f	A	1
189	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	55	89	\N	55	f	A	1
190	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	52	90	\N	52	f	A	1
191	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	10	15	2	E	56	6	\N	56	f	A	1
201	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	79	69	\N	69	f	A	1
202	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	91	62	\N	\N	f	A	1
203	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	80	61	\N	\N	f	A	1
204	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	1	66	\N	1	f	A	1
205	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	83	64	\N	83	f	A	1
206	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	91	69	\N	\N	f	A	1
207	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	80	62	\N	62	f	A	1
208	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	1	61	\N	1	f	A	1
209	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	83	66	\N	83	f	A	1
210	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	79	64	\N	64	f	A	1
211	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	80	69	\N	69	f	A	1
212	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	1	62	\N	1	f	A	1
213	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	83	61	\N	83	f	A	1
214	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	79	66	\N	79	f	A	1
215	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	91	64	\N	\N	f	A	1
224	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	90	40	\N	40	f	A	\N
226	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	81	42	\N	81	f	A	\N
227	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	6	41	\N	41	f	A	\N
228	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	90	43	\N	90	f	A	\N
229	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	7	40	\N	40	f	A	\N
230	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	93	45	\N	45	f	A	\N
216	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	7	42	\N	7	f	A	\N
217	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	93	41	\N	41	f	A	\N
218	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	81	43	\N	43	f	A	\N
219	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	6	40	\N	40	f	A	\N
220	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	90	45	\N	90	f	A	\N
221	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	93	42	\N	42	f	A	\N
222	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	81	41	\N	41	f	A	\N
223	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	6	43	\N	6	f	A	\N
231	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	66	76	\N	76	f	A	\N
232	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	105	71	\N	71	f	A	\N
233	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	67	78	\N	67	f	A	\N
234	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	107	5	\N	107	f	A	\N
235	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	69	77	\N	\N	f	A	\N
236	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	105	76	\N	76	f	A	\N
237	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	67	71	\N	71	f	A	\N
238	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	107	78	\N	107	f	A	\N
239	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	69	5	\N	5	f	A	\N
240	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	66	77	\N	77	f	A	\N
241	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	67	76	\N	76	f	A	\N
242	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	107	71	\N	71	f	A	\N
174	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	40	84	\N	40	f	A	1
175	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	13	13	2	E	45	73	\N	\N	f	A	1
176	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	44	104	\N	44	f	A	1
177	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	43	75	\N	75	f	A	1
178	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	40	2	\N	\N	f	A	1
267	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	47	58	\N	58	f	A	\N
268	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	4	54	\N	4	f	A	\N
269	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	14	15	2	E	49	55	\N	49	f	A	\N
270	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	70	57	\N	70	f	A	\N
271	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	47	52	\N	52	f	A	\N
272	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	4	58	\N	4	f	A	\N
273	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	49	54	\N	49	f	A	\N
274	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	70	55	\N	70	f	A	\N
275	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	46	57	\N	\N	f	A	\N
243	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	69	78	\N	69	f	A	\N
244	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	66	5	\N	5	f	A	\N
245	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	105	77	\N	105	f	A	\N
256	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	2	83	\N	2	f	A	\N
257	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	104	109	\N	\N	f	A	\N
258	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	74	108	\N	74	f	A	\N
260	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	72	1	\N	1	f	A	\N
246	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	73	83	\N	\N	f	A	\N
247	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	72	109	\N	72	f	A	\N
248	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	2	108	\N	108	f	A	\N
249	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	104	79	\N	104	f	A	\N
250	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	74	1	\N	74	f	A	\N
251	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	72	83	\N	72	f	A	\N
252	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	2	109	\N	2	f	A	\N
253	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	104	108	\N	104	f	A	\N
254	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	74	79	\N	74	f	A	\N
255	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	73	1	\N	1	f	A	\N
306	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	3	53	\N	53	f	A	\N
307	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	41	59	\N	41	f	A	\N
308	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	43	54	\N	43	f	A	\N
309	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	45	57	\N	\N	f	A	\N
310	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	40	55	\N	40	f	A	\N
311	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	41	53	\N	41	f	A	\N
312	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	43	59	\N	59	f	A	\N
291	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	110	84	\N	84	f	A	\N
292	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	49	73	\N	73	f	A	\N
293	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	47	2	\N	2	f	A	\N
294	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	10	12	2	E	46	74	\N	46	f	A	\N
295	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	4	72	\N	72	f	A	\N
296	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	49	84	\N	84	f	A	\N
297	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	47	73	\N	73	f	A	\N
298	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	10	12	2	E	46	2	\N	46	f	A	\N
299	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	4	74	\N	74	f	A	\N
300	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	110	72	\N	72	f	A	\N
302	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	46	73	\N	46	f	A	\N
303	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	4	2	\N	2	f	A	\N
304	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	110	74	\N	74	f	A	\N
305	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	49	72	\N	72	f	A	\N
288	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	90	61	\N	90	f	A	\N
289	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	7	107	\N	107	f	A	\N
290	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	14	2	E	6	64	\N	64	f	A	\N
276	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	7	69	\N	69	f	A	\N
265	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	49	57	\N	57	f	A	\N
278	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	81	61	\N	81	f	A	\N
279	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	89	107	\N	89	f	A	\N
280	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	90	64	\N	90	f	A	\N
281	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	6	69	\N	6	f	A	\N
282	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	81	66	\N	66	f	A	\N
283	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	89	61	\N	89	f	A	\N
284	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	10	2	E	90	107	\N	107	f	A	\N
285	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	7	64	\N	7	f	A	\N
286	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	81	69	\N	69	f	A	\N
287	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	89	66	\N	89	f	A	\N
262	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	46	58	\N	46	f	A	\N
263	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	47	54	\N	47	f	A	\N
264	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	4	55	\N	4	f	A	\N
277	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	6	66	\N	6	f	A	\N
266	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	15	12	2	E	46	52	\N	52	f	A	\N
318	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	1	20	2	E	40	54	\N	40	f	A	\N
319	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	3	57	\N	3	f	A	\N
321	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	13	13	2	E	77	79	\N	\N	f	A	\N
322	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	76	97	\N	76	f	A	\N
323	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	78	80	\N	80	f	A	\N
324	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	71	87	\N	71	f	A	\N
325	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	10	13	2	E	5	1	\N	5	f	A	\N
326	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	76	79	\N	76	f	A	\N
327	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	78	97	\N	78	f	A	\N
328	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	10	2	E	71	80	\N	80	f	A	\N
329	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	5	87	\N	5	f	A	\N
330	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	77	1	\N	1	f	A	\N
331	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	78	79	\N	79	f	A	\N
332	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	71	97	\N	71	f	A	\N
333	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	5	80	\N	5	f	A	\N
334	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	77	87	\N	87	f	A	\N
335	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	13	2	E	76	1	\N	1	f	A	\N
352	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	61	56	\N	\N	f	A	\N
353	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	67	54	\N	67	f	A	\N
339	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	46	6	\N	6	f	A	\N
340	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	4	90	\N	90	f	A	\N
341	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	70	7	\N	70	f	A	\N
342	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	47	89	\N	89	f	A	\N
343	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	11	13	2	E	46	81	\N	46	f	A	\N
344	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	4	6	\N	4	f	A	\N
345	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	48	90	\N	90	f	A	\N
346	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	14	10	2	E	47	7	\N	7	f	A	\N
347	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	11	2	E	46	89	\N	89	f	A	\N
348	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	4	81	\N	4	f	A	\N
349	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	48	6	\N	6	f	A	\N
350	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	70	90	\N	90	f	A	\N
313	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	45	54	\N	45	f	A	\N
354	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	69	55	\N	69	f	A	\N
355	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	105	53	\N	53	f	A	\N
356	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	61	58	\N	58	f	A	\N
357	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	67	56	\N	67	f	A	\N
358	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	69	54	\N	69	f	A	\N
359	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	105	55	\N	105	f	A	\N
360	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	15	12	2	E	66	53	\N	53	f	A	\N
361	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	67	58	\N	58	f	A	\N
362	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	69	56	\N	69	f	A	\N
363	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	105	54	\N	\N	f	A	\N
364	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	66	55	\N	66	f	A	\N
365	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	61	53	\N	53	f	A	\N
366	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	73	77	\N	77	f	A	\N
367	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	72	76	\N	72	f	A	\N
368	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	2	78	\N	2	f	A	\N
369	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	84	71	\N	71	f	A	\N
370	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	74	5	\N	5	f	A	\N
371	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	72	77	\N	77	f	A	\N
372	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	2	76	\N	2	f	A	\N
373	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	84	78	\N	84	f	A	\N
374	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	74	71	\N	74	f	A	\N
375	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	73	5	\N	\N	f	A	\N
376	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	2	77	\N	77	f	A	\N
377	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	10	15	2	E	84	76	\N	84	f	A	\N
378	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	74	78	\N	74	f	A	\N
379	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	73	71	\N	\N	f	A	\N
380	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	72	5	\N	72	f	A	\N
396	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	109	42	\N	42	f	A	\N
397	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	96	44	\N	44	f	A	\N
337	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	70	89	\N	70	f	A	\N
338	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	47	81	\N	47	f	A	\N
314	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	40	57	\N	40	f	A	\N
315	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	3	55	\N	3	f	A	\N
316	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	43	53	\N	43	f	A	\N
317	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	45	59	\N	59	f	A	\N
404	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	79	41	\N	41	f	A	\N
405	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	109	40	\N	40	f	A	\N
406	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	80	42	\N	42	f	A	\N
407	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	1	44	\N	1	f	A	\N
408	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	79	43	\N	43	f	A	\N
409	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	109	41	\N	41	f	A	\N
410	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	96	40	\N	40	f	A	\N
426	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	3	77	\N	77	f	A	\N
427	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	41	76	\N	41	f	A	\N
428	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	43	78	\N	43	f	A	\N
429	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	40	71	\N	40	f	A	\N
430	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	45	5	\N	5	f	A	\N
431	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	41	77	\N	41	f	A	\N
432	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	43	76	\N	76	f	A	\N
433	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	40	78	\N	40	f	A	\N
434	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	15	14	2	E	45	71	\N	71	f	A	\N
435	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	3	5	\N	\N	f	A	\N
436	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	43	77	\N	43	f	A	\N
437	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	40	76	\N	40	f	A	\N
439	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	10	16	2	E	3	71	\N	3	f	A	\N
440	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	41	5	\N	5	f	A	\N
416	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	65	48	\N	\N	f	A	\N
417	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	67	46	\N	46	f	A	\N
418	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	12	14	2	E	69	47	\N	69	f	A	\N
419	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	107	4	\N	4	f	A	\N
420	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	62	49	\N	49	f	A	\N
421	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	67	48	\N	48	f	A	\N
422	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	15	10	2	E	69	46	\N	46	f	A	\N
423	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	107	47	\N	47	f	A	\N
424	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	14	11	2	E	62	4	\N	4	f	A	\N
425	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	65	49	\N	65	f	A	\N
411	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	62	48	\N	62	f	A	\N
412	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	65	46	\N	46	f	A	\N
413	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	67	47	\N	47	f	A	\N
414	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	69	4	\N	69	f	A	\N
415	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	16	11	2	E	107	49	\N	49	f	A	\N
448	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	111	2	\N	111	f	A	\N
449	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	90	72	\N	\N	f	A	\N
450	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	6	84	\N	6	f	A	\N
451	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	81	74	\N	74	f	A	\N
452	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	111	104	\N	104	f	A	\N
453	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	90	2	\N	2	f	A	\N
454	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	6	72	\N	72	f	A	\N
455	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	93	84	\N	93	f	A	\N
441	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	6	74	\N	6	f	A	\N
442	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	93	104	\N	\N	f	A	\N
443	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	81	2	\N	2	f	A	\N
445	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	90	84	\N	84	f	A	\N
446	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	15	10	2	E	93	74	\N	74	f	A	\N
447	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	81	104	\N	104	f	A	\N
456	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	57	83	\N	57	f	A	\N
457	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	53	91	\N	53	f	A	\N
458	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	60	108	\N	108	f	A	\N
459	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	58	79	\N	58	f	A	\N
460	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	59	1	\N	1	f	A	\N
461	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	53	83	\N	\N	f	A	\N
462	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	60	91	\N	60	f	A	\N
463	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	58	108	\N	58	f	A	\N
464	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	59	79	\N	59	f	A	\N
465	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	57	1	\N	1	f	A	\N
466	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	60	83	\N	\N	f	A	\N
467	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	58	91	\N	58	f	A	\N
399	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	1	41	\N	41	f	A	\N
400	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	79	40	\N	40	f	A	\N
401	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	16	11	2	E	96	42	\N	42	f	A	\N
402	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	80	44	\N	44	f	A	\N
403	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	1	43	\N	1	f	A	\N
483	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	87	47	\N	87	f	A	\N
484	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	109	70	\N	70	f	A	\N
485	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	1	110	\N	1	f	A	\N
471	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	109	46	\N	46	f	A	\N
472	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	1	49	\N	1	f	A	\N
473	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	80	47	\N	80	f	A	\N
474	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	79	70	\N	70	f	A	\N
475	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	87	110	\N	110	f	A	\N
476	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	1	46	\N	1	f	A	\N
477	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	80	49	\N	49	f	A	\N
478	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	79	47	\N	79	f	A	\N
479	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	87	70	\N	70	f	A	\N
512	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	71	7	\N	71	f	A	\N
513	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	5	81	\N	5	f	A	\N
514	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	76	93	\N	93	f	A	\N
501	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	76	6	\N	76	f	A	\N
502	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	77	7	\N	77	f	A	\N
503	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	78	81	\N	78	f	A	\N
504	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	71	93	\N	\N	f	A	\N
505	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	5	90	\N	5	f	A	\N
506	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	77	6	\N	77	f	A	\N
507	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	78	7	\N	7	f	A	\N
508	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	71	81	\N	71	f	A	\N
509	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	5	93	\N	5	f	A	\N
510	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	76	90	\N	76	f	A	\N
511	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	78	6	\N	6	f	A	\N
516	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	66	84	\N	84	f	A	\N
517	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	105	72	\N	72	f	A	\N
518	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	61	2	\N	61	f	A	\N
519	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	69	104	\N	104	f	A	\N
520	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	65	73	\N	73	f	A	\N
521	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	105	84	\N	84	f	A	\N
522	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	61	72	\N	72	f	A	\N
523	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	69	2	\N	\N	f	A	\N
524	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	65	104	\N	\N	f	A	\N
525	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	66	73	\N	73	f	A	\N
526	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	61	84	\N	61	f	A	\N
527	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	69	72	\N	72	f	A	\N
528	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	65	2	\N	2	f	A	\N
529	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	66	104	\N	104	f	A	\N
530	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	105	73	\N	73	f	A	\N
486	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	55	42	\N	55	f	A	\N
487	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	11	2	E	58	41	\N	41	f	A	\N
489	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	59	40	\N	59	f	A	\N
490	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	11	15	2	E	57	45	\N	57	f	A	\N
491	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	58	42	\N	42	f	A	\N
492	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	54	41	\N	41	f	A	\N
493	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	59	43	\N	59	f	A	\N
494	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	11	11	2	E	57	40	\N	\N	f	A	\N
495	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	55	45	\N	55	f	A	\N
496	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	54	42	\N	42	f	A	\N
497	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	11	13	2	E	59	41	\N	59	f	A	\N
498	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	57	43	\N	57	f	A	\N
499	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	12	14	2	E	55	40	\N	55	f	A	\N
500	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	58	45	\N	58	f	A	\N
531	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	96	84	\N	84	f	A	\N
532	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	1	73	\N	1	f	A	\N
533	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	80	2	\N	2	f	A	\N
534	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	97	75	\N	75	f	A	\N
535	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	79	74	\N	79	f	A	\N
536	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	1	84	\N	84	f	A	\N
537	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	80	73	\N	73	f	A	\N
469	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	57	79	\N	57	f	A	\N
470	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	53	1	\N	53	f	A	\N
480	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	109	110	\N	110	f	A	\N
481	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	80	46	\N	80	f	A	\N
482	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	79	49	\N	79	f	A	\N
552	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	15	13	2	E	43	90	\N	90	f	A	\N
553	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	14	10	2	E	44	81	\N	81	f	A	\N
554	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	41	93	\N	41	f	A	\N
555	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	42	7	\N	42	f	A	\N
556	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	43	112	\N	112	f	A	\N
557	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	2	20	2	E	44	90	\N	44	f	A	\N
558	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	41	81	\N	41	f	A	\N
559	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	11	16	2	E	42	93	\N	42	f	A	\N
560	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	11	2	E	3	7	\N	7	f	A	\N
561	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	53	46	\N	46	f	A	\N
562	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	55	110	\N	\N	f	A	\N
563	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	54	47	\N	47	f	A	\N
564	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	52	70	\N	70	f	A	\N
566	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	55	46	\N	46	f	A	\N
567	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	54	110	\N	110	f	A	\N
568	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	52	47	\N	52	f	A	\N
569	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	57	70	\N	57	f	A	\N
570	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	53	49	\N	53	f	A	\N
571	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	54	46	\N	46	f	A	\N
572	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	52	110	\N	52	f	A	\N
573	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	57	47	\N	57	f	A	\N
574	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	14	15	2	E	53	70	\N	53	f	A	\N
575	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	55	49	\N	49	f	A	\N
544	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	0	2	E	96	75	\N	75	f	A	\N
545	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	1	74	\N	74	f	A	\N
538	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	97	2	\N	2	f	A	\N
539	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	79	75	\N	75	f	A	\N
540	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	96	74	\N	74	f	A	\N
541	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	80	84	\N	84	f	A	\N
542	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	97	73	\N	73	f	A	\N
543	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	79	2	\N	2	f	A	\N
576	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	71	69	\N	71	f	A	\N
577	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	14	15	2	E	82	62	\N	82	f	A	\N
578	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	78	61	\N	78	f	A	\N
579	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	92	107	\N	92	f	A	\N
580	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	5	105	\N	5	f	A	\N
581	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	82	69	\N	82	f	A	\N
582	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	11	2	E	78	62	\N	62	f	A	\N
583	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	92	61	\N	92	f	A	\N
584	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	5	107	\N	5	f	A	\N
585	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	71	105	\N	71	f	A	\N
587	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	12	11	2	E	92	62	\N	62	f	A	\N
588	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	5	61	\N	5	f	A	\N
589	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	71	107	\N	71	f	A	\N
590	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	82	105	\N	105	f	A	\N
591	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	7	110	\N	7	f	A	\N
592	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	89	49	\N	89	f	A	\N
593	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	81	47	\N	\N	f	A	\N
594	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	6	46	\N	6	f	A	\N
595	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	90	70	\N	90	f	A	\N
596	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	89	110	\N	110	f	A	\N
597	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	81	49	\N	81	f	A	\N
598	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	6	47	\N	6	f	A	\N
599	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	90	46	\N	90	f	A	\N
600	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	7	70	\N	7	f	A	\N
601	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	81	110	\N	110	f	A	\N
602	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	6	49	\N	49	f	A	\N
603	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	90	47	\N	47	f	A	\N
604	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	7	46	\N	46	f	A	\N
605	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	89	70	\N	\N	f	A	\N
606	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	59	69	\N	59	f	A	\N
607	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	53	65	\N	53	f	A	\N
547	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	13	12	2	E	3	90	\N	90	f	A	\N
548	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	43	81	\N	81	f	A	\N
549	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	44	93	\N	44	f	A	\N
550	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	41	7	\N	41	f	A	\N
551	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	3	112	\N	112	f	A	\N
613	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	57	67	\N	57	f	A	\N
614	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	55	63	\N	63	f	A	\N
615	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	59	113	\N	113	f	A	\N
616	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	54	69	\N	69	f	A	\N
617	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	57	65	\N	65	f	A	\N
618	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	15	13	2	E	55	67	\N	67	f	A	\N
619	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	59	63	\N	63	f	A	\N
620	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	53	113	\N	113	f	A	\N
621	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	75	41	\N	75	f	A	\N
622	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	84	42	\N	84	f	A	\N
623	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	2	43	\N	43	f	A	\N
624	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	72	44	\N	44	f	A	\N
625	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	74	40	\N	40	f	A	\N
626	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	84	41	\N	84	f	A	\N
627	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	2	42	\N	42	f	A	\N
628	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	15	13	2	E	72	43	\N	43	f	A	\N
629	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	74	44	\N	44	f	A	\N
630	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	75	40	\N	75	f	A	\N
631	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	2	41	\N	41	f	A	\N
633	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	74	43	\N	74	f	A	\N
634	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	75	44	\N	44	f	A	\N
635	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	84	40	\N	40	f	A	\N
640	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	87	76	\N	76	f	A	\N
705	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	110	113	\N	113	f	A	\N
642	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	80	71	\N	80	f	A	\N
702	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	20	0	2	E	47	63	\N	\N	f	A	\N
644	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	87	77	\N	77	f	A	\N
709	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	110	105	\N	\N	f	A	\N
700	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	70	113	\N	70	f	A	\N
612	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	54	65	\N	65	f	A	\N
608	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	54	67	\N	67	f	A	\N
701	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	48	69	\N	\N	f	A	\N
703	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	49	61	\N	49	f	A	\N
651	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	82	42	\N	42	f	A	\N
710	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	48	113	\N	48	f	A	\N
652	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	71	3	\N	71	f	A	\N
654	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	76	41	\N	76	f	A	\N
698	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	20	0	2	E	47	61	\N	\N	f	A	\N
655	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	5	45	\N	5	f	A	\N
656	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	15	10	2	E	71	42	\N	42	f	A	\N
657	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	78	3	\N	78	f	A	\N
658	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	76	43	\N	76	f	A	\N
659	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	13	13	2	E	5	41	\N	\N	f	A	\N
660	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	82	45	\N	45	f	A	\N
661	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	78	42	\N	42	f	A	\N
662	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	76	3	\N	76	f	A	\N
663	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	5	43	\N	5	f	A	\N
665	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	20	1	2	E	71	45	\N	45	f	A	\N
641	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	2	2	E	83	5	\N	5	f	A	\N
609	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	57	63	\N	57	f	A	\N
643	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	97	78	\N	97	f	A	\N
611	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	53	69	\N	\N	f	A	\N
645	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	109	76	\N	76	f	A	\N
646	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	80	5	\N	5	f	A	\N
648	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	87	78	\N	87	f	A	\N
649	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	109	77	\N	77	f	A	\N
650	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	83	76	\N	76	f	A	\N
636	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	109	5	\N	5	f	A	\N
637	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	83	71	\N	71	f	A	\N
638	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	80	78	\N	80	f	A	\N
639	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	13	15	2	E	97	77	\N	97	f	A	\N
704	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	70	105	\N	70	f	A	\N
706	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	20	0	2	E	47	69	\N	\N	f	A	\N
707	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	49	63	\N	63	f	A	\N
610	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	55	113	\N	55	f	A	\N
708	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	1	20	2	E	70	61	\N	70	f	A	\N
653	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	12	14	2	E	78	43	\N	78	f	A	\N
737	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	100	92	\N	92	f	A	\N
738	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	52	78	\N	52	f	A	\N
739	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	53	5	\N	5	f	A	\N
684	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	91	57	\N	57	f	A	\N
685	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	97	56	\N	56	f	A	\N
686	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	79	53	\N	53	f	A	\N
688	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	91	54	\N	54	f	A	\N
689	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	97	57	\N	57	f	A	\N
690	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	108	56	\N	\N	f	A	\N
691	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	80	53	\N	53	f	A	\N
692	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	91	55	\N	55	f	A	\N
693	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	97	54	\N	97	f	A	\N
694	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	108	57	\N	57	f	A	\N
695	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	79	56	\N	79	f	A	\N
696	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	110	69	\N	69	f	A	\N
697	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	48	63	\N	63	f	A	\N
699	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	10	10	2	E	49	105	\N	\N	f	A	\N
672	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	12	11	2	E	2	89	\N	89	f	A	\N
673	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	75	81	\N	75	f	A	\N
674	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	74	6	\N	6	f	A	\N
675	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	73	90	\N	73	f	A	\N
676	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	2	7	\N	2	f	A	\N
677	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	75	89	\N	75	f	A	\N
678	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	11	15	2	E	74	81	\N	74	f	A	\N
679	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	73	6	\N	73	f	A	\N
680	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	84	90	\N	84	f	A	\N
666	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	73	7	\N	7	f	A	\N
667	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	11	2	E	84	89	\N	89	f	A	\N
668	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	2	81	\N	2	f	A	\N
669	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	75	6	\N	75	f	A	\N
670	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	74	90	\N	90	f	A	\N
671	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	84	7	\N	7	f	A	\N
711	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	105	89	\N	89	f	A	\N
712	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	63	6	\N	63	f	A	\N
714	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	69	7	\N	7	f	A	\N
715	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	65	90	\N	65	f	A	\N
716	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	63	89	\N	89	f	A	\N
717	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	67	6	\N	6	f	A	\N
718	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	69	81	\N	81	f	A	\N
719	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	65	7	\N	7	f	A	\N
720	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	105	90	\N	90	f	A	\N
721	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	67	89	\N	89	f	A	\N
722	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	69	6	\N	6	f	A	\N
723	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	65	81	\N	81	f	A	\N
724	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	105	7	\N	7	f	A	\N
725	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	63	90	\N	63	f	A	\N
742	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	75	70	\N	\N	f	A	\N
745	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	84	49	\N	84	f	A	\N
746	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	75	46	\N	46	f	A	\N
747	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	2	70	\N	70	f	A	\N
740	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	55	71	\N	71	f	A	\N
726	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	53	76	\N	76	f	A	\N
727	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	55	92	\N	55	f	A	\N
728	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	54	78	\N	78	f	A	\N
729	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	100	5	\N	5	f	A	\N
730	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	52	71	\N	71	f	A	\N
731	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	11	2	E	55	76	\N	76	f	A	\N
732	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	54	92	\N	92	f	A	\N
733	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	100	78	\N	100	f	A	\N
734	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	1	20	2	E	52	5	\N	52	f	A	\N
735	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	53	71	\N	71	f	A	\N
681	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	108	53	\N	108	f	A	\N
682	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	79	55	\N	79	f	A	\N
683	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	80	54	\N	80	f	A	\N
748	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	73	47	\N	73	f	A	\N
736	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	54	76	\N	76	f	A	\N
444	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	111	72	\N	72	f	A	\N
468	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	59	108	\N	59	f	A	\N
647	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	97	71	\N	71	f	A	\N
741	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	15	11	2	E	72	46	\N	46	f	A	\N
743	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	2	47	\N	2	f	A	\N
749	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	14	15	2	E	84	110	\N	84	f	A	\N
32	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	3	49	\N	\N	f	A	1
91	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	79	90	\N	\N	f	A	1
47	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	74	64	\N	74	f	A	1
133	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	58	73	\N	58	f	A	1
110	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	70	1	\N	\N	f	A	1
123	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	70	97	\N	70	f	A	1
768	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	40	108	\N	40	f	A	\N
769	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	44	1	\N	\N	f	A	\N
750	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	72	49	\N	\N	f	A	\N
173	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	13	14	2	E	43	2	\N	43	f	A	1
751	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	15	2	E	2	46	\N	2	f	A	\N
752	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	73	70	\N	\N	f	A	\N
753	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	84	47	\N	84	f	A	\N
770	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	3	79	\N	3	f	A	\N
756	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	44	83	\N	44	f	A	\N
754	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	72	110	\N	72	f	A	\N
194	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	52	89	\N	52	f	A	1
261	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	70	52	\N	70	f	A	\N
225	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	13	15	2	E	7	45	\N	7	f	A	\N
259	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	73	79	\N	73	f	A	\N
757	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	3	80	\N	3	f	A	\N
758	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	43	108	\N	43	f	A	\N
759	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	41	1	\N	41	f	A	\N
760	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	40	79	\N	40	f	A	\N
755	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	75	49	\N	75	f	A	\N
761	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	3	83	\N	3	f	A	\N
762	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	43	80	\N	43	f	A	\N
763	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	41	108	\N	41	f	A	\N
764	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	40	1	\N	40	f	A	\N
765	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	44	79	\N	44	f	A	\N
766	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	43	83	\N	43	f	A	\N
767	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	41	80	\N	41	f	A	\N
320	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	41	55	\N	41	f	A	\N
301	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	47	84	\N	84	f	A	\N
351	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	66	58	\N	58	f	A	\N
398	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	80	43	\N	80	f	A	\N
336	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	48	7	\N	7	f	A	\N
438	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	45	78	\N	45	f	A	\N
515	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	77	90	\N	77	f	A	\N
488	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	54	43	\N	43	f	A	\N
546	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	42	112	\N	112	f	A	\N
565	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	57	49	\N	57	f	A	\N
586	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	78	69	\N	69	f	A	\N
632	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	72	42	\N	72	f	A	\N
687	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	80	55	\N	80	f	A	\N
664	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	12	15	2	E	82	41	\N	82	f	A	\N
713	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	67	81	\N	81	f	A	\N
744	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	73	110	\N	73	f	A	\N
771	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	42	63	\N	63	f	A	\N
772	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	44	69	\N	69	f	A	\N
773	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	43	61	\N	43	f	A	\N
774	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	45	62	\N	45	f	A	\N
775	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	41	105	\N	\N	f	A	\N
776	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	11	16	2	E	44	63	\N	44	f	A	\N
777	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	43	69	\N	43	f	A	\N
778	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	45	61	\N	45	f	A	\N
779	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	41	62	\N	41	f	A	\N
780	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	42	105	\N	42	f	A	\N
781	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	43	63	\N	63	f	A	\N
782	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	45	69	\N	45	f	A	\N
783	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	41	61	\N	41	f	A	\N
784	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	42	62	\N	42	f	A	\N
785	Racks	2017-05-30 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	44	105	\N	44	f	A	\N
786	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	84	53	\N	\N	f	A	\N
787	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	72	55	\N	\N	f	A	\N
788	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	2	54	\N	\N	f	A	\N
789	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	75	57	\N	\N	f	A	\N
790	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	73	52	\N	\N	f	A	\N
791	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	72	53	\N	\N	f	A	\N
792	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	2	55	\N	\N	f	A	\N
793	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	75	54	\N	\N	f	A	\N
794	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	73	57	\N	\N	f	A	\N
795	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	84	52	\N	\N	f	A	\N
796	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	2	53	\N	\N	f	A	\N
797	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	75	55	\N	\N	f	A	\N
798	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	73	54	\N	\N	f	A	\N
799	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	84	57	\N	\N	f	A	\N
800	Billidart	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	72	52	\N	\N	f	A	\N
801	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	7	109	\N	\N	f	A	\N
802	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	90	79	\N	\N	f	A	\N
803	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	81	80	\N	\N	f	A	\N
804	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	6	1	\N	\N	f	A	\N
805	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	93	83	\N	\N	f	A	\N
806	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	90	109	\N	\N	f	A	\N
807	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	81	79	\N	\N	f	A	\N
808	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	6	80	\N	\N	f	A	\N
809	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	93	1	\N	\N	f	A	\N
810	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	7	83	\N	\N	f	A	\N
811	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	81	109	\N	\N	f	A	\N
812	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	6	79	\N	\N	f	A	\N
813	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	93	80	\N	\N	f	A	\N
814	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	7	1	\N	\N	f	A	\N
815	Racks	2017-05-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	90	83	\N	\N	f	A	\N
\.


--
-- Name: recording_match_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('recording_match_id_seq', 815, true);


--
-- Data for Name: schedule_matchweek; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY schedule_matchweek (id, week_number, start_date, end_date, season_id) FROM stdin;
1	1	2017-02-26 00:00:00+08	2017-03-12 00:00:00+08	1
2	2	2017-03-12 00:00:00+08	2017-03-19 00:00:00+08	1
3	3	2017-03-19 00:00:00+08	2017-03-26 00:00:00+08	1
4	4	2017-03-26 00:00:00+08	2017-04-02 00:00:00+08	1
5	5	2017-04-02 00:00:00+08	2017-04-09 00:00:00+08	1
6	6	2017-04-09 00:00:00+08	2017-04-16 00:00:00+08	1
7	7	2017-04-16 00:00:00+08	2017-04-23 00:00:00+08	1
8	8	2017-04-23 00:00:00+08	2017-04-30 00:00:00+08	1
9	9	2017-04-30 00:00:00+08	2017-05-07 00:00:00+08	1
10	10	2017-05-07 00:00:00+08	2017-05-14 00:00:00+08	1
11	11	2017-05-14 00:00:00+08	2017-05-21 00:00:00+08	1
12	12	2017-05-21 00:00:00+08	2017-05-28 00:00:00+08	1
13	13	2017-05-28 00:00:00+08	2017-06-04 00:00:00+08	1
14	14	2017-06-04 00:00:00+08	2017-06-11 00:00:00+08	1
\.


--
-- Name: schedule_matchweek_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('schedule_matchweek_id_seq', 14, true);


--
-- Data for Name: schedule_season; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY schedule_season (id, season) FROM stdin;
1	3
\.


--
-- Name: schedule_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('schedule_season_id_seq', 1, true);


--
-- Name: administration_group administration_group_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_group
    ADD CONSTRAINT administration_group_pkey PRIMARY KEY (id);


--
-- Name: administration_league administration_league_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_league
    ADD CONSTRAINT administration_league_pkey PRIMARY KEY (id);


--
-- Name: administration_member administration_member_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_member
    ADD CONSTRAINT administration_member_pkey PRIMARY KEY (id);


--
-- Name: administration_player administration_player_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_player
    ADD CONSTRAINT administration_player_pkey PRIMARY KEY (id);


--
-- Name: administration_team administration_team_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_team
    ADD CONSTRAINT administration_team_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: recording_frame recording_frame_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_frame
    ADD CONSTRAINT recording_frame_pkey PRIMARY KEY (id);


--
-- Name: recording_leagueframe recording_leagueframe_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leagueframe
    ADD CONSTRAINT recording_leagueframe_pkey PRIMARY KEY (frame_ptr_id);


--
-- Name: recording_leaguematch recording_leaguematch_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leaguematch
    ADD CONSTRAINT recording_leaguematch_pkey PRIMARY KEY (id);


--
-- Name: recording_match recording_match_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_match
    ADD CONSTRAINT recording_match_pkey PRIMARY KEY (id);


--
-- Name: schedule_matchweek schedule_matchweek_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY schedule_matchweek
    ADD CONSTRAINT schedule_matchweek_pkey PRIMARY KEY (id);


--
-- Name: schedule_season schedule_season_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY schedule_season
    ADD CONSTRAINT schedule_season_pkey PRIMARY KEY (id);


--
-- Name: administration_member_0e939a4f; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX administration_member_0e939a4f ON administration_member USING btree (group_id);


--
-- Name: administration_member_afe72417; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX administration_member_afe72417 ON administration_member USING btree (player_id);


--
-- Name: administration_team_a07ab3f8; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX administration_team_a07ab3f8 ON administration_team USING btree (league_id);


--
-- Name: administration_team_ef68adea; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX administration_team_ef68adea ON administration_team USING btree (capitain_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_1dcd7040; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX django_celery_beat_periodictask_1dcd7040 ON django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_f3f0d72a; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX django_celery_beat_periodictask_f3f0d72a ON django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: recording_frame_299556bf; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_frame_299556bf ON recording_frame USING btree (break_player_id);


--
-- Name: recording_frame_afdcbe7c; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_frame_afdcbe7c ON recording_frame USING btree (cleared_by_id);


--
-- Name: recording_frame_ff9c4e4a; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_frame_ff9c4e4a ON recording_frame USING btree (match_id);


--
-- Name: recording_leagueframe_27b0f3d2; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_leagueframe_27b0f3d2 ON recording_leagueframe USING btree (league_match_id);


--
-- Name: recording_leagueframe_b9b95ece; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_leagueframe_b9b95ece ON recording_leagueframe USING btree (home_player_id);


--
-- Name: recording_leagueframe_d03d6086; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_leagueframe_d03d6086 ON recording_leagueframe USING btree (away_player_id);


--
-- Name: recording_leaguematch_a07ab3f8; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_leaguematch_a07ab3f8 ON recording_leaguematch USING btree (league_id);


--
-- Name: recording_leaguematch_b11701f0; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_leaguematch_b11701f0 ON recording_leaguematch USING btree (season_id);


--
-- Name: recording_leaguematch_b9b95ece; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_leaguematch_b9b95ece ON recording_leaguematch USING btree (home_id);


--
-- Name: recording_leaguematch_c01e06f5; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_leaguematch_c01e06f5 ON recording_leaguematch USING btree (week_id);


--
-- Name: recording_leaguematch_c8ac5278; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_leaguematch_c8ac5278 ON recording_leaguematch USING btree (winner_id);


--
-- Name: recording_leaguematch_d03d6086; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_leaguematch_d03d6086 ON recording_leaguematch USING btree (away_id);


--
-- Name: recording_match_b11701f0; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_match_b11701f0 ON recording_match USING btree (season_id);


--
-- Name: recording_match_b9b95ece; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_match_b9b95ece ON recording_match USING btree (home_id);


--
-- Name: recording_match_c01e06f5; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_match_c01e06f5 ON recording_match USING btree (week_id);


--
-- Name: recording_match_c8ac5278; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_match_c8ac5278 ON recording_match USING btree (winner_id);


--
-- Name: recording_match_d03d6086; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX recording_match_d03d6086 ON recording_match USING btree (away_id);


--
-- Name: administration_team administration_capitain_id_b042477e_fk_administration_player_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_team
    ADD CONSTRAINT administration_capitain_id_b042477e_fk_administration_player_id FOREIGN KEY (capitain_id) REFERENCES administration_player(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: administration_team administration_group_ptr_id_e2167439_fk_administration_group_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_team
    ADD CONSTRAINT administration_group_ptr_id_e2167439_fk_administration_group_id FOREIGN KEY (group_ptr_id) REFERENCES administration_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: administration_member administration_m_player_id_bfc18735_fk_administration_player_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_member
    ADD CONSTRAINT administration_m_player_id_bfc18735_fk_administration_player_id FOREIGN KEY (player_id) REFERENCES administration_player(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: administration_member administration_mem_group_id_b91f06d0_fk_administration_group_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_member
    ADD CONSTRAINT administration_mem_group_id_b91f06d0_fk_administration_group_id FOREIGN KEY (group_id) REFERENCES administration_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: administration_team administration_t_league_id_7b6cb4c2_fk_administration_league_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_team
    ADD CONSTRAINT administration_t_league_id_7b6cb4c2_fk_administration_league_id FOREIGN KEY (league_id) REFERENCES administration_league(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask dj_crontab_id_d3cba168_fk_django_celery_beat_crontabschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_periodictask
    ADD CONSTRAINT dj_crontab_id_d3cba168_fk_django_celery_beat_crontabschedule_id FOREIGN KEY (crontab_id) REFERENCES django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask interval_id_a8ca27da_fk_django_celery_beat_intervalschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY django_celery_beat_periodictask
    ADD CONSTRAINT interval_id_a8ca27da_fk_django_celery_beat_intervalschedule_id FOREIGN KEY (interval_id) REFERENCES django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leaguematch recordin_winner_id_4f92492a_fk_administration_team_group_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leaguematch
    ADD CONSTRAINT recordin_winner_id_4f92492a_fk_administration_team_group_ptr_id FOREIGN KEY (winner_id) REFERENCES administration_team(group_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leaguematch recording__away_id_83fd89da_fk_administration_team_group_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leaguematch
    ADD CONSTRAINT recording__away_id_83fd89da_fk_administration_team_group_ptr_id FOREIGN KEY (away_id) REFERENCES administration_team(group_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_frame recording__break_player_id_08b533cf_fk_administration_member_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_frame
    ADD CONSTRAINT recording__break_player_id_08b533cf_fk_administration_member_id FOREIGN KEY (break_player_id) REFERENCES administration_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leaguematch recording__home_id_2f8f8541_fk_administration_team_group_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leaguematch
    ADD CONSTRAINT recording__home_id_2f8f8541_fk_administration_team_group_ptr_id FOREIGN KEY (home_id) REFERENCES administration_team(group_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leagueframe recording__league_match_id_494e32de_fk_recording_leaguematch_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leagueframe
    ADD CONSTRAINT recording__league_match_id_494e32de_fk_recording_leaguematch_id FOREIGN KEY (league_match_id) REFERENCES recording_leaguematch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_frame recording_fr_cleared_by_id_2188e55d_fk_administration_member_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_frame
    ADD CONSTRAINT recording_fr_cleared_by_id_2188e55d_fk_administration_member_id FOREIGN KEY (cleared_by_id) REFERENCES administration_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_frame recording_frame_match_id_c5259287_fk_recording_match_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_frame
    ADD CONSTRAINT recording_frame_match_id_c5259287_fk_recording_match_id FOREIGN KEY (match_id) REFERENCES recording_match(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leagueframe recording_l_away_player_id_e0a04ceb_fk_administration_member_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leagueframe
    ADD CONSTRAINT recording_l_away_player_id_e0a04ceb_fk_administration_member_id FOREIGN KEY (away_player_id) REFERENCES administration_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leagueframe recording_l_home_player_id_956424a1_fk_administration_member_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leagueframe
    ADD CONSTRAINT recording_l_home_player_id_956424a1_fk_administration_member_id FOREIGN KEY (home_player_id) REFERENCES administration_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leaguematch recording_league_league_id_f49c0152_fk_administration_league_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leaguematch
    ADD CONSTRAINT recording_league_league_id_f49c0152_fk_administration_league_id FOREIGN KEY (league_id) REFERENCES administration_league(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leagueframe recording_leaguefra_frame_ptr_id_be55a11d_fk_recording_frame_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leagueframe
    ADD CONSTRAINT recording_leaguefra_frame_ptr_id_be55a11d_fk_recording_frame_id FOREIGN KEY (frame_ptr_id) REFERENCES recording_frame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leaguematch recording_leaguematch_season_id_ff8bd255_fk_schedule_season_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leaguematch
    ADD CONSTRAINT recording_leaguematch_season_id_ff8bd255_fk_schedule_season_id FOREIGN KEY (season_id) REFERENCES schedule_season(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_leaguematch recording_leaguematch_week_id_b3072ae8_fk_schedule_matchweek_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_leaguematch
    ADD CONSTRAINT recording_leaguematch_week_id_b3072ae8_fk_schedule_matchweek_id FOREIGN KEY (week_id) REFERENCES schedule_matchweek(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_match recording_match_away_id_e7a3ca03_fk_administration_member_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_match
    ADD CONSTRAINT recording_match_away_id_e7a3ca03_fk_administration_member_id FOREIGN KEY (away_id) REFERENCES administration_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_match recording_match_home_id_e0cecce5_fk_administration_member_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_match
    ADD CONSTRAINT recording_match_home_id_e0cecce5_fk_administration_member_id FOREIGN KEY (home_id) REFERENCES administration_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_match recording_match_season_id_1f164f79_fk_schedule_season_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_match
    ADD CONSTRAINT recording_match_season_id_1f164f79_fk_schedule_season_id FOREIGN KEY (season_id) REFERENCES schedule_season(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_match recording_match_week_id_c47b6110_fk_schedule_matchweek_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_match
    ADD CONSTRAINT recording_match_week_id_c47b6110_fk_schedule_matchweek_id FOREIGN KEY (week_id) REFERENCES schedule_matchweek(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recording_match recording_match_winner_id_6a96f18f_fk_administration_member_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY recording_match
    ADD CONSTRAINT recording_match_winner_id_6a96f18f_fk_administration_member_id FOREIGN KEY (winner_id) REFERENCES administration_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule_matchweek schedule_matchweek_season_id_e01308a8_fk_schedule_season_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY schedule_matchweek
    ADD CONSTRAINT schedule_matchweek_season_id_e01308a8_fk_schedule_season_id FOREIGN KEY (season_id) REFERENCES schedule_season(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

