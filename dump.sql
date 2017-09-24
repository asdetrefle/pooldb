--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

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
    close_date timestamp with time zone,
    logo character varying(100)
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
    total_clearances integer NOT NULL,
    season_matches_played integer NOT NULL,
    season_matches_won integer NOT NULL,
    season_clearances integer NOT NULL,
    group_id integer,
    player_id integer NOT NULL,
    season_points integer NOT NULL,
    handicap double precision NOT NULL,
    total_points integer NOT NULL
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
    nb_groups integer NOT NULL,
    user_id integer
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
    team_number integer NOT NULL,
    total_matches_played integer NOT NULL,
    total_matches_won integer NOT NULL,
    season_matches_played integer NOT NULL,
    season_matches_won integer NOT NULL,
    season_clearances integer NOT NULL,
    season_points integer NOT NULL,
    captain_id integer,
    season_leg_average double precision NOT NULL,
    season_median double precision NOT NULL,
    total_clearances integer NOT NULL,
    total_points integer NOT NULL
);


ALTER TABLE administration_team OWNER TO qijiec;

--
-- Name: administration_teamseasonal; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE administration_teamseasonal (
    id integer NOT NULL,
    team_number integer NOT NULL,
    ranking integer NOT NULL,
    points integer NOT NULL,
    clearances integer NOT NULL,
    matches_played integer NOT NULL,
    matches_won integer NOT NULL,
    legs_played integer NOT NULL,
    legs_won integer NOT NULL,
    season_id integer NOT NULL,
    team_id integer NOT NULL,
    leg_average double precision NOT NULL,
    median double precision NOT NULL
);


ALTER TABLE administration_teamseasonal OWNER TO qijiec;

--
-- Name: administration_teamseasonal_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE administration_teamseasonal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administration_teamseasonal_id_seq OWNER TO qijiec;

--
-- Name: administration_teamseasonal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE administration_teamseasonal_id_seq OWNED BY administration_teamseasonal.id;


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
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE guardian_groupobjectpermission OWNER TO qijiec;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_groupobjectpermission_id_seq OWNER TO qijiec;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE guardian_groupobjectpermission_id_seq OWNED BY guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE guardian_userobjectpermission OWNER TO qijiec;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_userobjectpermission_id_seq OWNER TO qijiec;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE guardian_userobjectpermission_id_seq OWNED BY guardian_userobjectpermission.id;


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
    league_id integer,
    away_approved timestamp with time zone,
    home_approved timestamp with time zone
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
    season_id integer NOT NULL,
    serial_id integer NOT NULL
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
    season integer NOT NULL,
    league_id integer NOT NULL,
    name character varying(200)
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
-- Name: stats_playerranking; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE stats_playerranking (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    serial_id integer NOT NULL,
    ranking integer NOT NULL,
    elo_points double precision,
    total_points integer,
    handicap double precision,
    season_matches_played integer NOT NULL,
    season_matches_won integer NOT NULL,
    season_clearances integer NOT NULL,
    player_id integer NOT NULL,
    league_id integer NOT NULL,
    week_id integer NOT NULL,
    season_id integer NOT NULL,
    season_points integer,
    total_clearances integer NOT NULL,
    total_matches_played integer NOT NULL,
    total_matches_won integer NOT NULL
);


ALTER TABLE stats_playerranking OWNER TO qijiec;

--
-- Name: stats_playerranking_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE stats_playerranking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stats_playerranking_id_seq OWNER TO qijiec;

--
-- Name: stats_playerranking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE stats_playerranking_id_seq OWNED BY stats_playerranking.id;


--
-- Name: stats_teamranking; Type: TABLE; Schema: public; Owner: qijiec
--

CREATE TABLE stats_teamranking (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    serial_id integer NOT NULL,
    ranking integer NOT NULL,
    elo_points double precision,
    total_points integer,
    handicap double precision,
    season_clearances integer NOT NULL,
    season_matches_played integer NOT NULL,
    season_matches_won integer NOT NULL,
    season_legs_played integer NOT NULL,
    season_legs_won integer NOT NULL,
    league_id integer NOT NULL,
    season_id integer NOT NULL,
    team_id integer NOT NULL,
    week_id integer NOT NULL,
    season_points integer,
    total_clearances integer NOT NULL,
    total_legs_played integer NOT NULL,
    total_legs_won integer NOT NULL,
    total_matches_played integer NOT NULL,
    total_matches_won integer NOT NULL
);


ALTER TABLE stats_teamranking OWNER TO qijiec;

--
-- Name: stats_teamranking_id_seq; Type: SEQUENCE; Schema: public; Owner: qijiec
--

CREATE SEQUENCE stats_teamranking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stats_teamranking_id_seq OWNER TO qijiec;

--
-- Name: stats_teamranking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: qijiec
--

ALTER SEQUENCE stats_teamranking_id_seq OWNED BY stats_teamranking.id;


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
-- Name: administration_teamseasonal id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_teamseasonal ALTER COLUMN id SET DEFAULT nextval('administration_teamseasonal_id_seq'::regclass);


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
-- Name: guardian_groupobjectpermission id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: guardian_userobjectpermission id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_userobjectpermission_id_seq'::regclass);


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
-- Name: stats_playerranking id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_playerranking ALTER COLUMN id SET DEFAULT nextval('stats_playerranking_id_seq'::regclass);


--
-- Name: stats_teamranking id; Type: DEFAULT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_teamranking ALTER COLUMN id SET DEFAULT nextval('stats_teamranking_id_seq'::regclass);


--
-- Data for Name: administration_group; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_group (id, name, size, create_date, close_date, logo) FROM stdin;
9	Les Trois Mousquetaires	0	2017-03-12 12:11:01+08	\N	\N
4	Pink Platypuses	0	2017-02-08 22:32:23+08	2017-08-22 23:59:59+08	male_YVlC1q2.png
6	Dram Good Shots	0	2017-02-08 22:38:27+08	\N	dram.png
8	The Meanions	0	2017-02-08 22:39:07+08	\N	male_aO7fFLn.png
7	Holy Strokes	0	2017-02-08 22:38:40+08	\N	hs_color.png
3	Anything is Fine	0	2017-02-07 21:32:25+08	\N	anything.png
2	Just the Tip	0	2017-02-07 21:32:04+08	\N	male_H6KLx5T.png
1	That's a Beautiful Rack	0	2017-02-07 21:31:15+08	\N	male_VZwTyJq.png
10	The Blazers	0	2017-08-23 00:00:00+08	\N	blazers.png
5	The Abangers	0	2017-02-08 22:36:19+08	\N	male.png
\.


--
-- Name: administration_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('administration_group_id_seq', 10, true);


--
-- Data for Name: administration_league; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_league (id, name, create_date, level, size, last_update) FROM stdin;
1	Poke n Hope HK 8-Ball	2017-02-07 21:26:20+08	1	0	2017-09-21 23:00:44.031599+08
\.


--
-- Name: administration_league_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('administration_league_id_seq', 1, true);


--
-- Data for Name: administration_member; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_member (id, create_date, cancel_date, points, ranking, _point_adj, total_matches_played, total_matches_won, total_clearances, season_matches_played, season_matches_won, season_clearances, group_id, player_id, season_points, handicap, total_points) FROM stdin;
46	2017-02-26 22:05:05.62+08	2017-08-22 23:59:59+08	227.890818715684986	18	0	39	24	7	39	24	7	4	16	612	7.84615384615385025	612
48	2017-02-26 22:05:05.645+08	2017-08-22 23:59:59+08	177.284844463995	50	0	18	5	0	18	5	0	4	18	246	6.83333333333333037	246
50	2017-02-26 22:05:05.663+08	2017-08-22 23:59:59+08	200	0	0	0	0	0	0	0	0	4	20	0	-1	0
70	2017-03-01 21:45:00+08	2017-08-22 23:59:59+08	240.715223885877009	9	0	36	20	5	36	20	5	4	37	587	8.15277777777778034	587
4	2017-01-07 07:07:07+08	2017-08-22 23:59:59+08	214.870328025585991	27	0	21	14	0	21	14	0	4	4	328	7.8095238095238102	328
47	2017-02-26 22:05:05.628+08	2017-08-22 23:59:59+08	158.255552712836987	60	0	39	10	0	39	10	0	4	17	501	6.4230769230769198	501
100	2017-03-11 23:24:10+08	2017-08-22 23:59:59+08	189.098847619999987	45	0	6	2	0	0	0	0	6	68	0	6.5	81
99	2017-03-05 10:22:51+08	2017-08-22 23:59:59+08	200	0	0	0	0	0	0	0	0	1	67	0	-1	0
86	2017-03-05 10:22:51+08	2017-08-22 23:59:59+08	200	0	0	0	0	0	0	0	0	6	54	0	-1	0
107	2017-03-30 22:38:33+08	2017-08-22 23:59:59+08	175.463588028000004	55	0	15	6	0	0	0	0	8	73	0	6.36666666666999959	191
94	2017-03-05 10:22:51+08	2017-08-22 23:59:59+08	200	0	0	0	0	0	0	0	0	5	62	0	-1	0
61	2017-02-26 22:05:05+08	2017-08-22 23:59:59+08	139.418706609999987	43	0	30	5	0	30	5	0	8	9	364	6.06666666666666998	364
102	2017-03-12 00:20:39+08	\N	201.230769230769994	0	0	3	2	1	3	2	1	9	58	20	7.10256410256410042	595
68	2017-02-26 22:05:05+08	2017-08-22 23:59:59+08	200	0	0	0	0	0	0	0	0	8	35	0	-1	0
59	2017-02-26 22:05:05+08	2017-08-22 23:59:59+08	222.645349614999986	14	0	12	8	2	12	8	2	6	27	191	7.95833333333333037	191
98	2017-03-05 10:22:51+08	2017-08-22 23:59:59+08	200	0	0	0	0	0	0	0	0	1	66	0	-1	0
65	2017-02-26 22:05:05+08	2017-08-22 23:59:59+08	194.624604591999997	40	0	12	4	1	0	0	0	8	32	0	7.5	180
53	2017-02-26 22:05:05+08	2017-08-22 23:59:59+08	192.328447971000003	29	0	36	15	0	36	15	0	6	22	533	7.40277777777778034	533
106	2017-03-23 23:50:17+08	2017-08-22 23:59:59+08	168.257256380000001	58	0	3	0	0	0	0	0	6	72	0	2	12
101	2017-03-12 00:19:56+08	\N	198.769230769231001	0	0	3	1	0	3	1	0	9	7	19	8	666
51	2017-02-26 22:05:05.669+08	2017-08-22 23:59:59+08	200	0	0	0	0	0	0	0	0	4	21	0	-1	0
88	2017-03-05 10:22:51+08	2017-08-22 23:59:59+08	212.503100225999987	29	0	6	3	0	0	0	0	5	56	0	6.6666666666700003	97
110	2017-04-29 19:12:58+08	2017-08-22 23:59:59+08	169.828091717569009	56	0	18	5	1	18	5	1	4	76	231	6.41666666666666963	231
49	2017-02-26 22:05:05.653+08	2017-08-22 23:59:59+08	156.606445045279997	62	0	36	8	0	36	8	0	4	19	464	6.4444444444444402	464
109	2017-03-30 22:47:14+08	\N	169.978694597236995	61	0	21	2	0	3	0	0	1	75	32	6.3095238095238102	265
73	2017-03-05 10:22:51.514+08	\N	250.179552695799998	6	0	42	26	5	9	7	1	2	41	161	8.48484848484848087	686
90	2017-03-05 10:22:51.766+08	\N	194.774953264662997	43	0	39	18	0	0	0	0	7	58	0	7.46969696969696972	575
76	2017-03-05 10:22:51.568+08	\N	218.455990725806004	23	0	45	25	3	6	1	0	5	44	77	7.90277777777778034	724
92	2017-03-05 10:22:51.785+08	\N	226.581074398558002	16	0	24	14	2	9	6	0	5	60	146	8.19444444444443931	385
71	2017-03-05 10:22:51.489+08	\N	254.149198092843989	4	0	45	32	9	9	8	1	5	39	176	8.4615384615384599	758
56	2017-02-26 22:05:05+08	\N	190.087761170384994	48	0	18	8	1	6	3	0	6	25	79	6.625	258
54	2017-02-26 22:05:05.689+08	\N	86.0465566208676051	75	0	39	2	0	3	0	0	6	23	13	4.68181818181817988	345
52	2017-02-26 22:05:05.676+08	\N	198.980802338724999	40	0	21	11	2	6	2	0	6	8	81	6.83333333333333037	303
78	2017-03-05 10:22:51+08	\N	133.515485368544006	73	0	48	9	0	9	1	0	5	46	100	6.27380952380952017	605
77	2017-03-05 10:22:51.584+08	\N	247.266452449844991	8	0	36	24	0	9	6	0	5	45	154	8.53030303030302939	614
74	2017-03-05 10:22:51.536+08	\N	220.33486986064699	22	0	30	17	1	0	0	0	2	42	0	7.9375	483
3	2017-02-07 21:33:36+08	\N	218.423623002838013	24	0	27	13	0	6	4	0	3	2	108	7.97916666666666963	427
2	2017-02-07 21:33:26+08	\N	190.630772816612989	47	0	51	27	0	9	3	0	2	1	129	7.89285714285713969	812
44	2017-02-26 22:05:05+08	\N	259.882315982412024	2	0	33	26	5	9	7	1	3	14	160	8.57407407407407085	583
62	2017-02-26 22:05:05.747+08	\N	184.337192475009005	54	0	21	6	1	6	1	0	8	29	81	6.79999999999999982	297
58	2017-02-26 22:05:05.72+08	\N	231.279909083250004	12	0	21	13	5	0	0	0	6	26	0	8.63333333333332931	340
6	2017-02-08 22:39:35+08	\N	216.808472154957997	26	0	48	27	5	9	6	1	7	3	141	7.76923076923077005	747
69	2017-02-26 22:05:05+08	\N	215.502783029314998	29	0	51	25	1	9	5	0	8	36	148	8.10714285714285943	815
45	2017-02-26 22:05:05.609+08	\N	215.586148613836997	28	0	24	10	3	3	2	0	3	15	45	7.6190476190476204	358
5	2017-02-08 22:37:14+08	\N	260.851084161866027	1	0	39	30	9	3	3	0	5	6	54	8.59722222222221966	664
55	2017-02-26 22:05:05.695+08	\N	194.472217548455006	44	0	42	12	0	3	2	0	6	24	56	7.06060606060605966	587
64	2017-02-26 22:05:05.76+08	\N	186.877596648234999	53	0	15	5	0	3	2	0	8	31	55	6.77777777777778034	206
112	2017-05-13 01:44:45+08	\N	217.252690595844996	25	0	6	5	0	3	2	0	7	78	53	8.58333333333333037	103
93	2017-03-05 10:22:51.795+08	\N	224.755399691705009	19	0	24	10	2	6	4	0	7	61	101	7.42857142857142971	364
66	2017-02-26 22:05:05.779+08	\N	154.638107745664001	67	0	21	3	0	3	0	0	8	33	36	5.77777777777778034	251
72	2017-03-05 10:22:51.503+08	\N	224.431435252265004	20	0	33	20	2	6	3	0	2	40	94	8.31666666666666998	538
96	2017-03-05 10:22:51.838+08	\N	158.628627282320991	66	0	6	0	0	0	0	0	1	64	0	3.16666666666667007	38
83	2017-03-05 10:22:51.679+08	\N	149.990773927396987	69	0	27	5	0	6	1	0	1	51	89	5.76190476190476009	331
60	2017-02-26 22:05:05.735+08	\N	201.715960059383008	38	0	3	1	0	0	0	0	6	28	0	8.5	51
104	2017-03-17 22:39:33+08	\N	236.82566247031599	9	0	18	13	0	0	0	0	2	70	0	8.79166666666666963	320
95	2017-03-05 10:22:51.826+08	\N	200	0	0	0	0	0	0	0	0	2	63	0	-1	0
43	2017-02-26 22:05:05.587+08	\N	188.949897792911997	50	0	51	22	1	9	4	0	3	13	137	7.47619047619047983	756
75	2017-03-05 10:22:51.555+08	\N	249.183101431545992	7	0	21	14	5	0	0	0	2	43	0	8.61111111111111072	354
103	2017-03-14 23:44:26+08	\N	187.202829948345993	52	0	3	0	0	0	0	0	5	69	0	-1	35
40	2017-02-26 22:05:05+08	2017-08-22 23:59:59+08	265.974422849999996	2	0	30	24	7	30	24	7	3	10	538	8.96666666666667034	538
1	2017-02-07 21:32:51+08	2017-08-22 23:59:59+08	252.20300897300001	4	0	36	24	5	36	24	5	1	5	592	8.22222222222221966	592
142	2017-09-11 23:53:11+08	\N	200	0	0	0	0	0	0	0	0	9	96	0	-1	0
137	2017-09-04 22:14:10+08	2017-09-04 23:59:00+08	200	0	0	0	0	0	0	0	0	6	92	0	-1	0
125	2017-08-23 00:00:00+08	\N	196.185577368596	42	0	42	17	0	6	2	0	2	22	91	7.57575757575757969	624
131	2017-08-23 00:00:00+08	\N	204.238172290367004	35	0	3	2	0	3	2	0	6	87	51	8.5	51
79	2017-03-05 10:22:51.608+08	\N	162.455206747614994	65	0	48	12	0	9	3	0	1	47	114	6.12820512820513041	611
134	2017-08-23 00:00:00+08	\N	189.101696853995008	49	0	3	0	0	3	0	0	6	90	34	5.66666666666666963	34
140	2017-08-23 00:00:00+08	\N	214.87032802600001	30	0	21	14	0	0	0	0	10	4	0	7.58333333333333037	328
108	2017-03-30 22:44:28+08	\N	183.698842011000011	55	0	12	3	0	0	0	0	1	74	0	6.66666666666666963	160
91	2017-03-05 10:22:51.775+08	\N	164.976551222499012	63	0	15	2	0	3	1	0	1	59	41	5.5	197
127	2017-09-03 16:39:18+08	\N	224.910820616203011	17	0	9	6	1	9	6	1	1	83	157	8.72222222222221966	157
130	2017-08-23 00:00:00+08	\N	200	0	0	0	0	0	0	0	0	8	86	0	-1	0
123	2017-08-23 00:00:00+08	\N	123.721591817973007	74	0	39	6	0	9	1	0	7	9	90	5.95000000000000018	454
135	2017-09-04 22:12:50+08	\N	200	0	0	0	0	0	0	0	0	6	91	0	-1	0
41	2017-02-26 22:05:05+08	\N	255.738995625768013	3	0	48	34	7	6	5	1	3	11	109	8.61538461538460965	829
63	2017-02-26 22:05:05+08	\N	216.207451097193001	27	0	21	14	0	3	3	0	8	30	53	8.30000000000000071	337
122	2017-08-23 00:00:00+08	\N	193.730588061095006	45	0	3	1	0	3	1	0	10	81	41	6.83333333333333037	41
145	2017-09-12 11:57:24+08	\N	200	0	0	0	0	0	0	0	0	6	99	0	-1	0
82	2017-03-05 10:22:51.668+08	\N	203.987771667778986	37	0	9	4	0	0	0	0	5	50	0	7.83333333333333037	141
105	2017-03-18 16:59:27+08	\N	139.250373957642012	71	0	30	5	1	6	2	0	8	71	80	5.66666666666666963	338
119	2017-08-23 00:00:00+08	\N	200	0	0	0	0	0	0	0	0	10	21	0	-1	0
67	2017-02-26 22:05:05.785+08	\N	136.528107447383007	72	0	24	6	0	6	1	0	8	34	74	5.78571428571429003	276
113	2017-05-13 16:07:55+08	\N	172.292049329701001	60	0	12	4	0	6	1	0	8	79	64	6.29166666666666963	151
120	2017-08-23 00:00:00+08	\N	214.579941470819989	31	0	9	6	0	9	6	0	10	20	142	7.88888888888889017	142
129	2017-08-23 00:00:00+08	\N	178.910579989763988	56	0	3	0	0	3	0	0	8	85	24	4	24
115	2017-08-23 00:00:00+08	\N	166.460875827355011	62	0	45	12	0	6	2	0	10	17	91	6.65277777777778034	592
81	2017-03-05 10:22:51.653+08	\N	153.723081092754001	68	0	51	12	1	9	2	0	7	49	107	6.22619047619047983	644
143	2017-09-12 11:56:09+08	\N	187.684215988272001	51	0	3	0	0	3	0	0	6	97	32	5.33333333333333037	32
111	2017-04-30 12:27:39+08	\N	191.85998403855001	46	0	3	1	0	0	0	0	7	77	0	5.66666666666666963	34
117	2017-08-23 00:00:00+08	\N	142.920434734165013	70	0	45	10	0	9	2	0	10	19	95	6.24358974358974006	559
121	2017-08-23 00:00:00+08	\N	200	0	0	0	0	0	0	0	0	10	80	0	-1	0
141	2017-08-23 00:00:00+08	\N	200	0	0	0	0	0	0	0	0	10	95	0	-1	0
128	2017-08-23 00:00:00+08	\N	200	0	0	0	0	0	0	0	0	8	84	0	-1	0
42	2017-02-26 22:05:05.577+08	\N	224.899297959722986	18	0	36	22	2	6	4	0	3	12	98	8.25	586
87	2017-03-05 10:22:51.734+08	\N	176.489582826663991	58	0	21	9	0	6	3	0	1	55	77	6.36111111111110983	274
114	2017-08-23 00:00:00+08	\N	231.997439372483001	11	0	45	24	5	9	4	0	10	37	125	7.86111111111110983	712
139	2017-09-06 12:30:06+08	\N	210.617776326885007	33	0	6	5	1	6	5	1	2	94	98	8.16666666666666963	98
126	2017-08-23 00:00:00+08	\N	204.07936771493101	36	0	6	3	1	6	3	1	3	82	96	8	96
80	2017-03-05 10:22:51.621+08	\N	164.817785773487003	64	0	45	17	0	9	3	0	1	48	116	6.91666666666666963	623
138	2017-09-05 13:22:34+08	\N	208.340208794352009	34	0	6	3	1	6	3	1	6	93	94	7.83333333333333037	94
132	2017-08-23 00:00:00+08	\N	196.371196635838999	41	0	3	0	0	3	0	0	6	88	47	7.83333333333333037	47
89	2017-03-05 10:22:51.754+08	\N	233.845327520599994	10	0	27	17	2	0	0	0	7	57	0	8.47222222222221966	440
124	2017-08-23 00:00:00+08	\N	227.044658063713001	15	0	18	12	2	6	4	0	2	27	99	8.05555555555556069	290
7	2017-01-07 07:07:07+08	\N	251.232599303651995	5	0	48	31	6	9	6	0	7	7	143	8.14102564102564052	790
97	2017-03-05 10:22:51.852+08	\N	173.313492446954001	59	0	15	3	0	0	0	0	1	65	0	6.58333333333333037	192
84	2017-03-05 10:22:51.689+08	\N	227.732679857369988	14	0	42	29	1	3	2	0	2	52	48	8.09090909090908994	674
116	2017-08-23 00:00:00+08	\N	228.297306163745986	13	0	48	28	7	9	4	0	10	16	136	7.67948717948717974	748
57	2017-02-26 22:05:05+08	\N	223.883154273858992	21	0	30	19	3	3	2	0	6	38	49	7.8833333333333302	473
144	2017-09-12 11:57:10+08	\N	199.726611369756995	39	0	3	1	0	3	1	0	6	98	53	8.83333333333333037	53
133	2017-08-23 00:00:00+08	\N	214.330512718368993	32	0	3	2	0	3	2	0	6	89	53	8.83333333333333037	53
118	2017-08-23 00:00:00+08	\N	177.284844463995	57	0	18	5	0	0	0	0	10	18	0	6.5	246
\.


--
-- Name: administration_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('administration_member_id_seq', 145, true);


--
-- Data for Name: administration_player; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_player (id, name, username, sex, phone, email, nb_groups, user_id) FROM stdin;
4	Jay Gonzalez	jayg	M			0	\N
5	Henrik Pedersen	henrikp	M			0	\N
9	Clara Szeto	claras	F			0	\N
10	Alvaro Monteiro	alvarom	M	\N	\N	0	\N
11	Yuri Aguilar	yuria	M	\N	\N	0	\N
12	Edward Chu	edwardc	M	\N	\N	0	\N
13	Lily Wong	lilyw	F			0	\N
14	Stephane Meister	stephanem	M	\N	\N	0	\N
15	John Lo	johnl	M	\N	\N	0	\N
16	Alex Wang	alexw	M	\N	\N	0	\N
17	Fiona Chow	fionac	F			0	\N
18	Jon Sze	jons	M	\N	\N	0	\N
19	Coleman Yip	colemany	M	\N	\N	0	\N
20	Julian Tung	juliant	M	\N	\N	0	\N
21	Ricky Ying	rickyy	M	\N	\N	0	\N
22	Kuro Kawamura	kurok	M	\N	\N	0	\N
23	Joyce Lai	joycel	F			0	\N
24	Billy McCarthy	billym	M	\N	\N	0	\N
25	Kam Daswani	kamd	M	\N	\N	0	\N
26	Barney Cox	barneyc	M	\N	\N	0	\N
27	James Law	jamesl	M	\N	\N	0	\N
28	Katrina Leung	katrinal	F			0	\N
29	Ankit Jain	ankitj	M	\N	\N	0	\N
31	Simon Yeung	simony	M	\N	\N	0	\N
33	Louis Poon	louisp	M	\N	\N	0	\N
34	Olive Lai	olivel	F			0	\N
35	Tim Newton	timn	M	\N	\N	0	\N
38	Jon Somers	jonso	M			0	\N
39	Levis Santos	leviss	M	\N	\N	0	\N
40	Safee Shah	safees	M	\N	\N	0	\N
41	Parsad Tamang	parsadt	M	\N	\N	0	\N
42	Ryan McCarthy	ryanm	M	\N	\N	0	\N
43	Albert Yu	alberty	M	\N	\N	0	\N
44	Elton Zablan	eltonz	M	\N	\N	0	\N
45	Mark Morillo	markm	M	\N	\N	0	\N
46	Bertha Yeung	berthay	F	\N	\N	0	\N
47	Wilson Kong	wilsonk	M	\N	\N	0	\N
49	Annie Hsieh	annieh	F	\N	\N	0	\N
50	Michael Dabao	michaeld	M	\N	\N	0	\N
51	David Tse	davidt	M	\N	\N	0	\N
52	Nick Lok	nickl	M	\N	\N	0	\N
54	Rosario Armstrong	rosarioa	M	\N	\N	0	\N
55	Dean Chiu	deanc	M	\N	\N	0	\N
56	Milan Putik	milanp	M	\N	\N	0	\N
57	Samson Cheung	samsonc	M	\N	\N	0	\N
59	Jaden Law	jadenl	M	\N	\N	0	\N
61	Cyrus Wu	cyrusw	M	\N	\N	0	\N
62	Carol Navea	caroln	F	\N	\N	0	\N
63	Damon Howe	damonh	M	\N	\N	0	\N
64	Carmelo Lopez	carmelol	M	\N	\N	0	\N
65	Will Zhang	willz	M	\N	\N	0	\N
66	Rita Lim	rital	F	\N	\N	0	\N
67	Bernie Nissen	bernien	M	\N	\N	0	\N
68	Seungrae Kim	seungraek	M			0	\N
69	Nancy Tsao	nancyt	F			0	\N
70	Simpson Wong	simponw	M			0	\N
71	James Dwyer	jamesd	M			0	\N
72	Fon Sarndok	fons	F			0	\N
73	Keir Oakes	keiro	M			0	\N
74	Yolanda Leung	yolandal	F			0	\N
75	Hayat Saleh	hayats	M			0	\N
76	James K	jamesk	M			0	\N
77	Ryan Leung	ryanl	M			0	\N
78	Michael Chang	michaelc	M			0	\N
79	Stanley Wong	stanleyw	M			0	\N
32	Don Kripalani	donk	M			0	\N
58	Kawang Lau	kawangl	M	\N	\N	0	\N
7	Arthur Chu	arthurc	M	\N	\N	0	3
3	Deep Vaswani	deepv	M	\N	\N	0	5
2	Brad Tsui	bradt	M	\N	\N	0	6
1	Mancy Howe	mancyh	F	\N	\N	0	8
6	Lito Labra	litol	M	\N	\N	0	10
8	Jhun Jimeno	jhunj	M	\N	\N	0	9
36	Andrew H	andrewh	M	\N	\N	0	12
37	Clarence Yung	clarencey	M	\N	\N	0	13
48	Catherine Fu	catherinef	F	\N	\N	0	11
80	Anthony Chu	anthonyc	M	\N	\N	0	\N
81	Jessica Wong	jessicaw	F	\N	\N	0	\N
82	Chris Win	chrisw	M	\N	\N	0	\N
30	Nick Fong	nickf	M	\N	\N	0	14
83	Patrick Ng	patrickn	M	\N	\N	0	\N
84	Ann Wang	annw	F	\N	\N	0	\N
85	Sharon Wong	sharonw	M	\N	\N	0	\N
86	Rinky H	rinkyh	F	\N	\N	0	\N
87	Jude Sequeira	judes	M	\N	\N	0	\N
88	Jeremy Lewis	jeremyl	M	\N	\N	0	\N
89	Graham Clark	grahamc	M	\N	\N	0	\N
90	Serin Yam	seriny	F	\N	\N	0	\N
60	Joel Buenafe	joelb	M	\N	\N	0	16
91	Gil Mandigma	gilm	M	\N	\N	0	\N
92	Lode Van Leuven	lodevl	M	\N	\N	0	\N
93	Do Kim	dok	M	\N	\N	0	\N
94	Ritchie Yoshikawa	ritchiey	M	\N	\N	0	\N
95	Ben Yiu	beny	M	\N	\N	0	\N
96	Trish	Trishio	F	\N	\N	0	\N
97	Arthur Chui	arthurch	M	\N	\N	0	\N
98	Nikki Yeung	nikkiy	F	\N	\N	0	\N
99	Ray Chia	rayc	M	\N	\N	0	\N
\.


--
-- Name: administration_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('administration_player_id_seq', 99, true);


--
-- Data for Name: administration_team; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_team (group_ptr_id, ranking, total_legs_played, total_legs_won, season_legs_played, season_legs_won, league_id, team_number, total_matches_played, total_matches_won, season_matches_played, season_matches_won, season_clearances, season_points, captain_id, season_leg_average, season_median, total_clearances, total_points) FROM stdin;
4	5	98	44	98	44	1	1	14	6	14	6	13	3155	4	0	0	13	3155
6	8	119	48	21	5	1	3	17	5	3	0	1	654	52	35.6666666666666998	7.83333333333333037	14	3850
8	7	119	38	21	7	1	7	17	5	3	1	0	699	69	34.1666666666666998	6.29166666666666963	4	3766
7	3	119	65	21	10	1	2	17	9	3	1	1	713	6	35.2777777777777999	7.46969696969696972	16	3979
3	1	119	88	21	16	1	8	17	16	3	3	3	753	3	41.8333333333333002	8	26	4185
2	2	119	78	21	16	1	4	17	12	3	3	2	750	2	40	8.12878787878788067	15	4197
1	5	119	39	21	10	1	5	17	4	3	1	1	692	80	34.7777777777777999	6.33531746031745957	6	3746
10	6	21	10	21	10	1	1	3	2	3	2	0	660	114	35	7.20833333333333037	0	660
5	4	119	66	21	10	1	6	17	9	3	1	1	707	5	39.2777777777777999	8.19444444444443931	23	4053
\.


--
-- Data for Name: administration_teamseasonal; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY administration_teamseasonal (id, team_number, ranking, points, clearances, matches_played, matches_won, legs_played, legs_won, season_id, team_id, leg_average, median) FROM stdin;
9	5	0	0	0	0	0	0	0	2	1	0	0
10	4	0	0	0	0	0	0	0	2	2	0	0
11	8	0	0	0	0	0	0	0	2	3	0	0
12	6	0	0	0	0	0	0	0	2	5	0	0
13	3	0	0	0	0	0	0	0	2	6	0	0
14	2	0	0	0	0	0	0	0	2	7	0	0
15	7	0	0	0	0	0	0	0	2	8	0	0
16	1	0	0	0	0	0	0	0	2	10	0	0
1	7	8	3054	5	14	3	98	29	1	1	33.5	6.48611111110999961
2	4	2	3447	13	14	9	98	62	1	2	40.8928571428999987	8.13095238094999928
3	8	1	3432	23	14	13	98	72	1	3	40.7142857142999972	8.13333333333000041
4	1	5	3155	13	14	6	98	44	1	4	35.3452380952000027	6.8333333333299997
5	6	3	3346	22	14	8	98	56	1	5	39.4761904762000029	8.0833333333299997
6	5	6	3196	13	14	5	98	43	1	6	34.4761904762000029	7.4027777777799999
7	3	4	3266	15	14	8	98	55	1	7	37.5238095237999971	7.5705128205100003
8	2	7	3067	4	14	4	98	31	1	8	33.5119047618999986	6.36666666666999959
\.


--
-- Name: administration_teamseasonal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('administration_teamseasonal_id_seq', 16, true);


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
64	Can view match	6	view_match
65	Can record match	6	record_match
66	Can approve match	6	approve_match
67	Can view leaguematch	7	view_leaguematch
68	Can record leaguematch	7	record_leaguematch
69	Can approve leaguematch	7	approve_leaguematch
70	Can add team seasonal	22	add_teamseasonal
71	Can change team seasonal	22	change_teamseasonal
72	Can delete team seasonal	22	delete_teamseasonal
73	Can add player ranking	23	add_playerranking
74	Can change player ranking	23	change_playerranking
75	Can delete player ranking	23	delete_playerranking
76	Can add team ranking	24	add_teamranking
77	Can change team ranking	24	change_teamranking
78	Can delete team ranking	24	delete_teamranking
79	Can init match	6	init_match
80	Can init leaguematch	7	init_leaguematch
81	Can add group object permission	25	add_groupobjectpermission
82	Can change group object permission	25	change_groupobjectpermission
83	Can delete group object permission	25	delete_groupobjectpermission
84	Can add user object permission	26	add_userobjectpermission
85	Can change user object permission	26	change_userobjectpermission
86	Can delete user object permission	26	delete_userobjectpermission
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('auth_permission_id_seq', 86, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$30000$qqNZ3YwKlCB1$usTEYFKh0glaZuPPpVgBbnr4Hwfnw3NpjVuqAcorn5w=	2017-05-30 10:59:15+08	f	scorer				f	t	2017-05-30 10:56:11+08
4	pbkdf2_sha256$36000$NSLSkC9BRwhz$GnNyafwV1TGgR+zkQc+x+jTksNqUNrTOsIfeRCNC2ZQ=	2017-06-17 16:52:21.10197+08	f	kawangl	Kawang	Lau		f	t	2017-06-17 16:44:44+08
7	!VktNRiQTeiJfXONLtVYQ3V27wWxmxy154sE3Es4L	\N	f	AnonymousUser				f	t	2017-08-23 11:48:01.348948+08
10	pbkdf2_sha256$36000$UH2fxxYDnFHG$Mfv331OpQtRQGAZNQISe0WKx4sNAtcSGFwUMHqC+L1E=	\N	f	litol	Lito	Labra	labrapro@yahoo.com	f	t	2017-08-26 23:49:49+08
3	pbkdf2_sha256$36000$AIbzVkiUaCaH$+wZU4FIo3JeTLwFuENP50jXTx+2Q48BrRzEolDG1aPk=	2017-06-17 16:41:08+08	t	asdetrefle	Qj	Chv	qjchv@protonmail.ch	t	t	2017-06-17 16:38:01+08
11	pbkdf2_sha256$36000$2sP2KnVYwp47$G//Rax+5d8PpusNVkZzGov2HHFgjgjiz4s4GZe/ESCg=	2017-09-03 16:08:04.555817+08	f	catherinef	Catherine	Fu	catherinefu217@hotmail.com	f	t	2017-08-26 23:50:53+08
12	pbkdf2_sha256$36000$OB6xg4DsAPRn$UDje2tinMOndRwBZs+EveG7i30kHdcLsni5f4B2GUpI=	2017-09-03 23:08:32.222498+08	f	andrewh	Andrew	H	eclipsehk@ymail.com	f	t	2017-08-26 23:52:14+08
14	pbkdf2_sha256$36000$qGrxUYcRVShz$bIQiBB4kW09sIupSPeRJFc5ii+Pv++ODu6VzPyUIIiE=	\N	f	nickf	Nick	Fong	nicholasafong@gmail.com	f	t	2017-09-03 12:21:08+08
16	pbkdf2_sha256$36000$VIyVLjEMqv22$YgIJ4PXw44tHKsbSaWEju7Hha+R3xdaCri6ET8ji+xo=	2017-09-05 20:53:17.896441+08	f	joelb	Joel	Buenafe	jngbuenafe@yahoo.com	f	t	2017-09-04 08:11:08+08
13	pbkdf2_sha256$36000$Twy803Kw1QrU$DciXrQB4WbAr05B755d/Spus1/27mw4CowER5DKzAyU=	2017-09-05 22:28:03.685156+08	f	clarencey	Clarence	Yung	clarencey32@gmail.com	f	t	2017-08-26 23:53:06+08
9	pbkdf2_sha256$36000$ZRTpA9l08qZ1$jrhJFqs3IDqOkHCFZmi7RhX3JZUuU8cG8/msV8oH+Hc=	2017-09-06 18:33:10.708275+08	f	jhunj	Jhun	Jimeno	emjimeno@gmail.com	f	t	2017-08-26 23:48:54+08
5	pbkdf2_sha256$36000$bWQNaAuVyAxm$xmWAjjmW437Vk93T+YU50zc561EtOVH4mQ+dTyf+D/g=	2017-09-11 23:37:44.701292+08	f	deepv	Deep	Vaswani	deepvaswani@gmail.com	f	t	2017-07-04 19:56:51+08
8	pbkdf2_sha256$36000$q9uhQP2ESgGb$Ex9hCtTFsemCNZiM/Oze6MwUmDgnVGLdmQP/DM8wvFc=	2017-09-04 11:02:30+08	f	mancyh	Mancy	Howe	poke.n.hope.hk@gmail.com	f	t	2017-08-26 23:46:37+08
6	pbkdf2_sha256$36000$9igWMFy6tWJB$ysgUYYSB+XNbHovCHfCk8QaftcHkJBSNPkQUpIhQFdA=	2017-09-12 12:49:26.974329+08	f	bradt	Brad	Tsui	bradleytsui@gmail.com	f	t	2017-07-04 20:39:53+08
15	pbkdf2_sha256$36000$LAyd7v3j6vTl$bsHhW4/0KgR/v+JHSgnDhu6WdI7/vbbZ+2sgoND+9Xw=	2017-09-12 15:05:27.395537+08	t	trishl	Trish	Lee	poke.n.hope.hk@gmail.com	t	t	2017-09-04 00:27:12+08
1	pbkdf2_sha256$36000$6dyXjCgP2DuE$UMqKctZVwQdQuOSliAD8mfSE6y31cFFrv3BQR6paavg=	2017-09-21 22:21:27.793505+08	t	admin			admin@hkpl.com	t	t	2017-02-07 21:18:36.653+08
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

SELECT pg_catalog.setval('auth_user_id_seq', 16, true);


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
7	16	69
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 7, true);


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
601	2017-07-04 21:11:50.466053+08	7	Holy Strokes (3)	2	[{"changed": {"fields": ["captain"]}}]	4	1
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
603	2017-08-23 12:01:00.499436+08	10	The Blazers (0)	1	[{"added": {}}]	4	1
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
604	2017-08-23 12:34:32.606051+08	2	Season 4 - 2017 Autumn	1	[{"added": {}}]	10	1
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
675	2017-09-04 00:10:58.421269+08	87	Jude Sequeira	1	[{"added": {}}]	3	1
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
537	2017-05-31 22:26:11.249073+08	1534	2017-05-24 Parsad Tamang (Just the Tip) vs. Clarence Yung (Pink Platypuses) Leg 5	2	[{"changed": {"fields": ["home_score"]}}]	9	1
538	2017-05-31 22:27:37.365748+08	752	2017-05-24 Clarence Yung (Pink Platypuses) vs. Parsad Tamang (Just the Tip) 	2	[{"changed": {"fields": ["home_score", "winner"]}}]	6	1
539	2017-05-31 22:28:03.443596+08	102	2017-05-24 Pink Platypuses (1) vs. Just the Tip (4)	2	[{"changed": {"fields": ["home_points_raw"]}}]	7	1
540	2017-05-31 22:58:15.136008+08	108	2017-05-31 The Abangers (6) vs. Pink Platypuses (1)	2	[{"changed": {"fields": ["handicap"]}}]	7	1
541	2017-05-31 23:33:01.254742+08	706	2017-05-17 Andrew H (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
542	2017-05-31 23:33:12.844086+08	702	2017-05-17 Nick Fong (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
602	2017-07-04 21:12:11.769155+08	8	The Meanions (2)	2	[{"changed": {"fields": ["captain"]}}]	4	1
543	2017-05-31 23:33:32.466477+08	698	2017-05-17 Clara Szeto (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
544	2017-05-31 23:34:09.5536+08	69	Andrew H (The Meanions)	2	[{"changed": {"fields": ["raw_points", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
545	2017-05-31 23:34:33.524935+08	61	Clara Szeto (The Meanions)	2	[{"changed": {"fields": ["raw_points", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
546	2017-05-31 23:34:52.058588+08	63	Nick Fong (The Meanions)	2	[{"changed": {"fields": ["raw_points", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
547	2017-06-01 00:10:43.072467+08	7	Arthur Chu	2	[{"changed": {"fields": ["name"]}}]	3	1
548	2017-06-01 00:11:54.151182+08	7	Arthur Chu	2	[{"changed": {"fields": ["username"]}}]	3	1
549	2017-06-05 00:01:37.35806+08	1	admin	2	[{"changed": {"fields": ["password"]}}]	15	1
550	2017-06-06 23:14:26.430138+08	110	2017-06-06 Dram Good Shots (5) vs. Holy Strokes (3)	2	[{"changed": {"fields": ["handicap"]}}]	7	1
551	2017-06-16 20:17:36.26547+08	58	Kawang Lau	2	[{"changed": {"fields": ["name", "username"]}}]	3	1
552	2017-06-17 16:38:01.817892+08	3	asdetrefle	1	[{"added": {}}]	15	1
553	2017-06-17 16:38:59.869165+08	3	asdetrefle	2	[{"changed": {"fields": ["is_staff"]}}]	15	1
554	2017-06-17 16:39:55.524114+08	3	asdetrefle	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	15	1
555	2017-06-17 16:40:32.543429+08	7	Arthur Chu	2	[{"changed": {"fields": ["user"]}}]	3	1
556	2017-06-17 16:42:41.297558+08	3	asdetrefle	2	[{"changed": {"fields": ["is_superuser"]}}]	15	1
557	2017-06-17 16:44:44.656601+08	4	kawangl	1	[{"added": {}}]	15	1
558	2017-06-17 16:46:52.287426+08	4	kawangl	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	15	1
559	2017-06-17 16:49:40.945698+08	2	scorer	2	[]	15	1
560	2017-06-17 19:11:39.89396+08	7	Holy Strokes (3)	2	[{"changed": {"fields": ["logo"]}}]	4	1
561	2017-06-17 19:11:49.942356+08	7	Holy Strokes (3)	2	[]	4	1
562	2017-06-18 00:17:50.435974+08	5	The Abangers (6)	2	[{"changed": {"fields": ["logo"]}}]	4	1
563	2017-06-18 00:19:07.427012+08	4	Pink Platypuses (1)	2	[{"changed": {"fields": ["logo"]}}]	4	1
564	2017-06-18 00:19:40.9653+08	2	Just the Tip (4)	2	[{"changed": {"fields": ["logo"]}}]	4	1
565	2017-06-18 00:20:04.391982+08	1	That's a Beautiful Rack (7)	2	[{"changed": {"fields": ["logo"]}}]	4	1
566	2017-06-18 00:20:27.864896+08	8	The Meanions (2)	2	[{"changed": {"fields": ["logo"]}}]	4	1
567	2017-06-18 00:20:44.448066+08	3	Anything is Fine (8)	2	[{"changed": {"fields": ["logo"]}}]	4	1
568	2017-06-18 00:21:08.80025+08	6	Dram Good Shots (5)	2	[{"changed": {"fields": ["logo"]}}]	4	1
569	2017-06-21 23:08:02.299227+08	7	Holy Strokes (3)	2	[{"changed": {"fields": ["logo"]}}]	4	1
570	2017-06-25 01:03:44.350957+08	7	Holy Strokes (3)	2	[{"changed": {"fields": ["logo"]}}]	4	1
571	2017-06-25 09:58:27.461093+08	7	Holy Strokes (3)	2	[{"changed": {"fields": ["logo"]}}]	4	1
572	2017-06-25 10:05:04.989258+08	7	Holy Strokes (3)	2	[{"changed": {"fields": ["logo"]}}]	4	1
573	2017-06-27 20:32:08.840107+08	1	Season 3 - 2017 Spring	2	[{"changed": {"fields": ["name", "league"]}}]	10	1
574	2017-06-27 22:30:58.90032+08	698	2017-05-17 Clara Szeto (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
575	2017-06-27 22:31:38.957425+08	702	2017-05-17 Nick Fong (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
576	2017-06-27 22:31:55.46144+08	706	2017-05-17 Andrew H (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
577	2017-06-27 22:33:08.645678+08	69	Andrew H (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
578	2017-06-27 22:33:38.197463+08	61	Clara Szeto (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "handicap", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
579	2017-06-27 22:34:16.481194+08	63	Nick Fong (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "handicap", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
580	2017-06-27 22:59:54.882166+08	698	2017-05-17 Clara Szeto (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
581	2017-06-27 23:00:05.943626+08	702	2017-05-17 Nick Fong (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
582	2017-06-27 23:00:18.379995+08	706	2017-05-17 Andrew H (The Meanions) vs. Fiona Chow (Pink Platypuses) 	2	[{"changed": {"fields": ["is_submitted"]}}]	6	1
583	2017-06-27 23:01:05.727968+08	69	Andrew H (The Meanions)	2	[{"changed": {"fields": ["points", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
584	2017-06-27 23:01:22.82038+08	61	Clara Szeto (The Meanions)	2	[{"changed": {"fields": ["points", "handicap", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
585	2017-06-27 23:01:41.977734+08	63	Nick Fong (The Meanions)	2	[{"changed": {"fields": ["points", "handicap", "total_matches_played", "total_matches_won", "season_matches_played", "season_matches_won"]}}]	5	1
586	2017-06-27 23:05:04.638621+08	63	Nick Fong (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points"]}}]	5	1
587	2017-06-27 23:05:16.322953+08	61	Clara Szeto (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "handicap"]}}]	5	1
588	2017-06-27 23:05:26.410251+08	69	Andrew H (The Meanions)	2	[{"changed": {"fields": ["points", "raw_points", "handicap"]}}]	5	1
589	2017-07-04 19:56:51.669734+08	5	deepv	1	[{"added": {}}]	15	1
590	2017-07-04 19:59:44.778212+08	3	Deep Vaswani	2	[{"changed": {"fields": ["user"]}}]	3	1
591	2017-07-04 20:05:07.82268+08	5	deepv	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	15	1
592	2017-07-04 20:39:53.144569+08	6	bradt	1	[{"added": {}}]	15	1
593	2017-07-04 20:40:18.232283+08	2	Brad Tsui	2	[{"changed": {"fields": ["user"]}}]	3	1
594	2017-07-04 20:40:39.294477+08	6	bradt	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	15	1
595	2017-07-04 21:09:40.814152+08	1	That's a Beautiful Rack (7)	2	[{"changed": {"fields": ["captain"]}}]	4	1
596	2017-07-04 21:10:01.524081+08	2	Just the Tip (4)	2	[{"changed": {"fields": ["captain"]}}]	4	1
597	2017-07-04 21:10:25.948391+08	3	Anything is Fine (8)	2	[{"changed": {"fields": ["captain"]}}]	4	1
598	2017-07-04 21:10:46.126297+08	4	Pink Platypuses (1)	2	[{"changed": {"fields": ["captain"]}}]	4	1
599	2017-07-04 21:11:08.339862+08	5	The Abangers (6)	2	[{"changed": {"fields": ["captain"]}}]	4	1
600	2017-07-04 21:11:22.611667+08	6	Dram Good Shots (5)	2	[{"changed": {"fields": ["captain"]}}]	4	1
605	2017-08-23 12:43:43.657717+08	4	Pink Platypuses (1)	2	[{"changed": {"fields": ["close_date"]}}]	4	1
606	2017-08-23 16:20:10.438853+08	1	Season Season 3 - 2017 Spring - Team That's a Beautiful Rack	2	[{"changed": {"fields": ["leg_average"]}}]	22	1
607	2017-08-23 16:22:15.737053+08	1	Season Season 3 - 2017 Spring - Team That's a Beautiful Rack	2	[{"changed": {"fields": ["median"]}}]	22	1
608	2017-08-23 16:22:37.446964+08	2	Season Season 3 - 2017 Spring - Team Just the Tip	2	[{"changed": {"fields": ["leg_average", "median"]}}]	22	1
609	2017-08-23 16:22:57.384539+08	3	Season Season 3 - 2017 Spring - Team Anything is Fine	2	[{"changed": {"fields": ["leg_average", "median"]}}]	22	1
610	2017-08-23 16:23:25.371778+08	4	Season Season 3 - 2017 Spring - Team Pink Platypuses	2	[{"changed": {"fields": ["leg_average", "median"]}}]	22	1
611	2017-08-23 16:23:49.201981+08	5	Season Season 3 - 2017 Spring - Team The Abangers	2	[{"changed": {"fields": ["leg_average", "median"]}}]	22	1
612	2017-08-23 16:24:08.555238+08	6	Season Season 3 - 2017 Spring - Team Dram Good Shots	2	[{"changed": {"fields": ["leg_average", "median"]}}]	22	1
613	2017-08-23 16:24:31.527748+08	7	Season Season 3 - 2017 Spring - Team Holy Strokes	2	[{"changed": {"fields": ["leg_average", "median"]}}]	22	1
614	2017-08-23 16:24:46.203494+08	8	Season Season 3 - 2017 Spring - Team The Meanions	2	[{"changed": {"fields": ["leg_average", "median"]}}]	22	1
615	2017-08-23 17:09:51.91422+08	10	The Blazers	2	[{"changed": {"fields": ["logo"]}}]	4	1
616	2017-08-23 17:10:10.521678+08	6	Dram Good Shots	2	[{"changed": {"fields": ["logo"]}}]	4	1
617	2017-08-23 17:10:26.614519+08	3	Anything is Fine	2	[{"changed": {"fields": ["logo"]}}]	4	1
618	2017-08-26 23:44:06.481942+08	6	bradt	2	[{"changed": {"fields": ["email"]}}]	15	1
619	2017-08-26 23:44:23.463182+08	5	deepv	2	[{"changed": {"fields": ["email"]}}]	15	1
620	2017-08-26 23:46:37.581783+08	8	mancyh	1	[{"added": {}}]	15	1
621	2017-08-26 23:47:27.273663+08	8	mancyh	2	[{"changed": {"fields": ["first_name", "email"]}}]	15	1
622	2017-08-26 23:47:50.049856+08	1	Mancy Howe	2	[{"changed": {"fields": ["user"]}}]	3	1
623	2017-08-26 23:48:07.223124+08	8	mancyh	2	[{"changed": {"fields": ["last_name"]}}]	15	1
624	2017-08-26 23:48:54.79503+08	9	jhunj	1	[{"added": {}}]	15	1
625	2017-08-26 23:49:19.088981+08	9	jhunj	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	15	1
626	2017-08-26 23:49:49.409227+08	10	litol	1	[{"added": {}}]	15	1
627	2017-08-26 23:50:18.696845+08	10	litol	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	15	1
628	2017-08-26 23:50:53.603172+08	11	catherinef	1	[{"added": {}}]	15	1
629	2017-08-26 23:51:24.602453+08	11	catherinef	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	15	1
630	2017-08-26 23:52:14.586226+08	12	andrewh	1	[{"added": {}}]	15	1
631	2017-08-26 23:52:26.27349+08	12	andrewh	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	15	1
632	2017-08-26 23:53:06.774283+08	13	clarencey	1	[{"added": {}}]	15	1
633	2017-08-26 23:53:39.731069+08	13	clarencey	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	15	1
634	2017-08-27 00:52:45.617006+08	6	Lito Labra	2	[{"changed": {"fields": ["user"]}}]	3	1
635	2017-08-27 00:52:55.628569+08	8	Jhun Jimeno	2	[{"changed": {"fields": ["user"]}}]	3	1
636	2017-08-27 00:53:21.811338+08	36	Andrew H	2	[{"changed": {"fields": ["user"]}}]	3	1
637	2017-08-27 00:53:38.174034+08	37	Clarence Yung	2	[{"changed": {"fields": ["user"]}}]	3	1
638	2017-08-27 00:54:13.185144+08	48	Catherine Fu	2	[{"changed": {"fields": ["user"]}}]	3	1
639	2017-08-27 16:02:52.571162+08	114	Clarence Yung (The Blazers)	1	[{"added": {}}]	5	1
640	2017-08-27 16:03:58.026419+08	115	Fiona Chow (The Blazers)	1	[{"added": {}}]	5	1
641	2017-08-27 16:06:02.20476+08	116	Alex Wang (The Blazers)	1	[{"added": {}}]	5	1
642	2017-08-27 16:06:23.008204+08	117	Coleman Yip (The Blazers)	1	[{"added": {}}]	5	1
643	2017-08-27 16:07:50.642735+08	118	Jon Sze (The Blazers)	1	[{"added": {}}]	5	1
644	2017-08-27 16:08:46.760574+08	80	Anthony Chu	1	[{"added": {}}]	3	1
645	2017-08-27 16:09:20.887056+08	119	Ricky Ying (The Blazers)	1	[{"added": {}}]	5	1
646	2017-08-27 16:09:49.976878+08	120	Julian Tung (The Blazers)	1	[{"added": {}}]	5	1
647	2017-08-27 16:10:14.16057+08	121	Anthony Chu (The Blazers)	1	[{"added": {}}]	5	1
648	2017-08-27 16:10:55.113927+08	81	Jessica Wong	1	[{"added": {}}]	3	1
649	2017-08-27 16:11:15.165067+08	122	Jessica Wong (The Blazers)	1	[{"added": {}}]	5	1
650	2017-08-27 16:12:32.37459+08	10	The Blazers	2	[{"changed": {"fields": ["create_date", "captain"]}}]	4	1
651	2017-08-27 16:13:06.221312+08	53	Kuro Kawamura (Dram Good Shots)	2	[{"changed": {"fields": ["cancel_date", "points", "handicap"]}}]	5	1
652	2017-08-27 16:13:26.153356+08	61	Clara Szeto (The Meanions)	2	[{"changed": {"fields": ["cancel_date", "points", "handicap"]}}]	5	1
653	2017-08-27 16:13:35.916542+08	53	Kuro Kawamura (Dram Good Shots)	2	[{"changed": {"fields": ["cancel_date"]}}]	5	1
654	2017-08-27 16:13:49.58724+08	59	James Law (Dram Good Shots)	2	[{"changed": {"fields": ["cancel_date", "points", "handicap"]}}]	5	1
655	2017-08-27 16:14:13.821904+08	123	Clara Szeto (Holy Strokes)	1	[{"added": {}}]	5	1
656	2017-08-27 16:14:52.93904+08	124	James Law (Just the Tip)	1	[{"added": {}}]	5	1
657	2017-08-27 16:15:08.417938+08	125	Kuro Kawamura (Just the Tip)	1	[{"added": {}}]	5	1
658	2017-08-27 17:37:10.450493+08	6	bradt	2	[{"changed": {"fields": ["password"]}}]	15	1
659	2017-08-27 17:37:44.190445+08	40	Alvaro Monteiro (Anything is Fine)	2	[{"changed": {"fields": ["cancel_date", "points", "handicap"]}}]	5	1
660	2017-08-27 17:37:56.142656+08	1	Henrik Pedersen (That's a Beautiful Rack)	2	[{"changed": {"fields": ["cancel_date", "points", "handicap"]}}]	5	1
661	2017-08-27 17:39:12.284658+08	82	Chris Win	1	[{"added": {}}]	3	1
662	2017-08-27 17:39:55.347657+08	126	Chris Win (Anything is Fine)	1	[{"added": {}}]	5	1
663	2017-09-03 12:21:08.158653+08	14	nickf	1	[{"added": {}}]	15	1
664	2017-09-03 12:21:44.133564+08	14	nickf	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	15	1
665	2017-09-03 12:22:11.240515+08	30	Nick Fong	2	[{"changed": {"fields": ["user"]}}]	3	1
666	2017-09-03 16:39:09.281674+08	83	Patrick Ng	1	[{"added": {}}]	3	1
667	2017-09-03 16:39:31.614812+08	127	Patrick Ng (That's a Beautiful Rack)	1	[{"added": {}}]	5	1
668	2017-09-03 23:43:48.06244+08	84	Ann Wang	1	[{"added": {}}]	3	1
669	2017-09-03 23:44:39.169306+08	85	Sharon Wong	1	[{"added": {}}]	3	1
670	2017-09-03 23:45:08.812485+08	86	Rinky H	1	[{"added": {}}]	3	1
671	2017-09-03 23:45:33.618614+08	128	Ann Wang (The Meanions)	1	[{"added": {}}]	5	1
672	2017-09-03 23:45:59.570434+08	129	Sharon Wong (The Meanions)	1	[{"added": {}}]	5	1
673	2017-09-03 23:46:17.277971+08	128	Ann Wang (The Meanions)	2	[{"changed": {"fields": ["create_date", "cancel_date"]}}]	5	1
674	2017-09-03 23:46:38.299157+08	130	Rinky H (The Meanions)	1	[{"added": {}}]	5	1
676	2017-09-04 00:11:21.929441+08	88	Jeremy Lewis	1	[{"added": {}}]	3	1
677	2017-09-04 00:11:39.892365+08	89	Graham Clark	1	[{"added": {}}]	3	1
678	2017-09-04 00:11:58.665193+08	90	Serin Yam	1	[{"added": {}}]	3	1
679	2017-09-04 00:12:33.461329+08	131	Jude Sequeira (Dram Good Shots)	1	[{"added": {}}]	5	1
680	2017-09-04 00:12:55.616353+08	132	Jeremy Lewis (Dram Good Shots)	1	[{"added": {}}]	5	1
681	2017-09-04 00:13:16.643828+08	133	Graham Clark (Dram Good Shots)	1	[{"added": {}}]	5	1
682	2017-09-04 00:13:49.293009+08	134	Serin Yam (Dram Good Shots)	1	[{"added": {}}]	5	1
683	2017-09-04 00:24:49.027167+08	126	Chris Win (Anything is Fine)	2	[{"changed": {"fields": ["create_date", "cancel_date"]}}]	5	1
684	2017-09-04 00:27:12.550664+08	15	trish	1	[{"added": {}}]	15	1
685	2017-09-04 00:30:08.017446+08	15	trishl	2	[{"changed": {"fields": ["username", "first_name", "last_name", "email"]}}]	15	1
686	2017-09-04 00:31:27.336162+08	15	trishl	2	[{"changed": {"fields": ["is_staff"]}}]	15	1
687	2017-09-04 00:34:30.941148+08	15	trishl	2	[{"changed": {"fields": ["is_superuser"]}}]	15	1
688	2017-09-04 08:11:08.799085+08	16	joelb	1	[{"added": {}}]	15	1
689	2017-09-04 08:12:16.904157+08	16	joelb	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	15	1
690	2017-09-04 08:13:08.487473+08	60	Joel Buenafe	2	[{"changed": {"fields": ["user"]}}]	3	1
691	2017-09-04 22:12:12.27396+08	91	Gil Mandigma	1	[{"added": {}}]	3	1
692	2017-09-04 22:12:45.260004+08	92	Lode Van Leuven	1	[{"added": {}}]	3	1
693	2017-09-04 22:13:21.793809+08	135	Gil Mandigma (Dram Good Shots)	1	[{"added": {}}]	5	1
694	2017-09-04 22:13:22.182936+08	136	Gil Mandigma (Dram Good Shots)	1	[{"added": {}}]	5	1
695	2017-09-04 22:14:01.671856+08	136	Gil Mandigma (Dram Good Shots)	3		5	1
696	2017-09-04 22:14:21.404123+08	137	Lode Van Leuven (Dram Good Shots)	1	[{"added": {}}]	5	1
697	2017-09-05 13:22:26.475229+08	93	Do Kim	1	[{"added": {}}]	3	1
698	2017-09-05 13:22:54.799543+08	138	Do Kim (Dram Good Shots)	1	[{"added": {}}]	5	1
699	2017-09-06 12:29:58.025459+08	94	Ritchie Yoshikawa	1	[{"added": {}}]	3	1
700	2017-09-06 12:30:17.136173+08	139	Ritchie Yoshikawa (Just the Tip)	1	[{"added": {}}]	5	1
701	2017-09-06 22:51:21.256264+08	116	2017-09-06 Dram Good Shots vs. Just the Tip	2	[{"changed": {"fields": ["_away_ordered_players"]}}]	7	1
702	2017-09-06 22:51:54.934615+08	946	2017-09-06 Kam Daswani (Dram Good Shots) vs. James Law (Just the Tip) 	2	[{"changed": {"fields": ["away"]}}]	6	1
703	2017-09-06 22:52:19.855916+08	942	2017-09-06 Jhun Jimeno (Dram Good Shots) vs. James Law (Just the Tip) 	2	[{"changed": {"fields": ["away"]}}]	6	1
704	2017-09-06 22:52:51.72491+08	938	2017-09-06 Do Kim (Dram Good Shots) vs. James Law (Just the Tip) 	2	[{"changed": {"fields": ["away"]}}]	6	1
705	2017-09-06 22:54:32.418479+08	1923	2017-09-06 James Law (Just the Tip) vs. Kam Daswani (Dram Good Shots) Leg 6	2	[{"changed": {"fields": ["away_player"]}}]	9	1
706	2017-09-06 22:55:06.189295+08	1922	2017-09-06 James Law (Just the Tip) vs. Kam Daswani (Dram Good Shots) Leg 5	2	[{"changed": {"fields": ["away_player"]}}]	9	1
707	2017-09-06 22:55:49.676559+08	1915	2017-09-06 James Law (Dram Good Shots) vs. Jhun Jimeno (Dram Good Shots) Leg 4	2	[{"changed": {"fields": ["break_player", "away_player"]}}]	9	1
708	2017-09-06 22:56:33.808789+08	1914	2017-09-06 James Law (Just the Tip) vs. Jhun Jimeno (Dram Good Shots) Leg 3	2	[{"changed": {"fields": ["away_player"]}}]	9	1
709	2017-09-06 22:58:36.589885+08	1923	2017-09-06 James Law (Just the Tip) vs. Kam Daswani (Dram Good Shots) Leg 6	2	[{"changed": {"fields": ["break_player"]}}]	9	1
710	2017-09-06 22:59:12.197687+08	1907	2017-09-06 James Law (Just the Tip) vs. Do Kim (Dram Good Shots) Leg 2	2	[{"changed": {"fields": ["break_player", "away_player"]}}]	9	1
711	2017-09-06 23:00:03.485652+08	1906	2017-09-06 James Law (Just the Tip) vs. Do Kim (Dram Good Shots) Leg 1	2	[{"changed": {"fields": ["away_player"]}}]	9	1
712	2017-09-06 23:40:15.853286+08	935	2017-09-06 Dean Chiu (That's a Beautiful Rack) vs. Ankit Jain (The Meanions) 	3		6	1
713	2017-09-06 23:40:15.859454+08	934	2017-09-06 Catherine Fu (That's a Beautiful Rack) vs. Nick Fong (The Meanions) 	3		6	1
714	2017-09-06 23:40:15.863806+08	933	2017-09-06 David Tse (That's a Beautiful Rack) vs. Olive Lai (The Meanions) 	3		6	1
715	2017-09-06 23:40:15.868339+08	932	2017-09-06 Patrick Ng (That's a Beautiful Rack) vs. James Dwyer (The Meanions) 	3		6	1
716	2017-09-06 23:40:15.872477+08	931	2017-09-06 Wilson Kong (That's a Beautiful Rack) vs. Andrew H (The Meanions) 	3		6	1
717	2017-09-06 23:40:15.876526+08	930	2017-09-06 Dean Chiu (That's a Beautiful Rack) vs. Nick Fong (The Meanions) 	3		6	1
718	2017-09-06 23:40:15.884898+08	929	2017-09-06 Catherine Fu (That's a Beautiful Rack) vs. Olive Lai (The Meanions) 	3		6	1
719	2017-09-06 23:40:15.892029+08	928	2017-09-06 David Tse (That's a Beautiful Rack) vs. James Dwyer (The Meanions) 	3		6	1
720	2017-09-06 23:40:15.896195+08	927	2017-09-06 Patrick Ng (That's a Beautiful Rack) vs. Andrew H (The Meanions) 	3		6	1
721	2017-09-06 23:40:15.900072+08	926	2017-09-06 Wilson Kong (That's a Beautiful Rack) vs. Ankit Jain (The Meanions) 	3		6	1
722	2017-09-06 23:40:15.904869+08	925	2017-09-06 Dean Chiu (That's a Beautiful Rack) vs. Olive Lai (The Meanions) 	3		6	1
723	2017-09-06 23:40:15.909648+08	924	2017-09-06 Catherine Fu (That's a Beautiful Rack) vs. James Dwyer (The Meanions) 	3		6	1
724	2017-09-06 23:40:15.914439+08	923	2017-09-06 David Tse (That's a Beautiful Rack) vs. Andrew H (The Meanions) 	3		6	1
725	2017-09-06 23:40:15.920369+08	922	2017-09-06 Patrick Ng (That's a Beautiful Rack) vs. Ankit Jain (The Meanions) 	3		6	1
726	2017-09-06 23:40:15.924401+08	921	2017-09-06 Wilson Kong (That's a Beautiful Rack) vs. Nick Fong (The Meanions) 	3		6	1
727	2017-09-09 18:00:49.489871+08	106	Fon Sarndok (Dram Good Shots)	2	[{"changed": {"fields": ["cancel_date", "points"]}}]	5	1
728	2017-09-09 18:01:17.576769+08	100	Seungrae Kim (Dram Good Shots)	2	[{"changed": {"fields": ["cancel_date", "points"]}}]	5	1
729	2017-09-09 18:01:41.017692+08	86	Rosario Armstrong (Dram Good Shots)	2	[{"changed": {"fields": ["cancel_date"]}}]	5	1
730	2017-09-09 18:05:10.296341+08	88	Milan Putik (The Abangers)	2	[{"changed": {"fields": ["cancel_date", "points", "handicap"]}}]	5	1
731	2017-09-09 18:05:27.652218+08	94	Carol Navea (The Abangers)	2	[{"changed": {"fields": ["cancel_date"]}}]	5	1
732	2017-09-09 18:07:16.845071+08	99	Bernie Nissen (That's a Beautiful Rack)	2	[{"changed": {"fields": ["cancel_date"]}}]	5	1
733	2017-09-09 18:07:31.815491+08	98	Rita Lim (That's a Beautiful Rack)	2	[{"changed": {"fields": ["cancel_date"]}}]	5	1
734	2017-09-09 18:07:43.724871+08	108	Yolanda Leung (That's a Beautiful Rack)	2	[{"changed": {"fields": ["cancel_date", "points", "handicap"]}}]	5	1
735	2017-09-09 18:09:28.304816+08	65	Don Kripalani (The Meanions)	2	[{"changed": {"fields": ["cancel_date", "points"]}}]	5	1
736	2017-09-09 18:09:36.430928+08	107	Keir Oakes (The Meanions)	2	[{"changed": {"fields": ["cancel_date", "points", "handicap"]}}]	5	1
737	2017-09-09 18:09:45.952163+08	68	Tim Newton (The Meanions)	2	[{"changed": {"fields": ["cancel_date"]}}]	5	1
738	2017-09-09 20:40:53.820886+08	1	Week 1 Feb 26, 2017-Mar 12, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
739	2017-09-09 20:41:01.687459+08	2	Week 2 Mar 12, 2017-Mar 19, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
740	2017-09-09 20:41:06.189233+08	3	Week 3 Mar 19, 2017-Mar 26, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
741	2017-09-09 20:41:10.164588+08	4	Week 4 Mar 26, 2017-Apr 02, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
742	2017-09-09 20:41:14.130171+08	5	Week 5 Apr 02, 2017-Apr 09, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
743	2017-09-09 20:41:18.239725+08	6	Week 6 Apr 09, 2017-Apr 16, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
744	2017-09-09 20:41:22.874904+08	7	Week 7 Apr 16, 2017-Apr 23, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
745	2017-09-09 20:41:27.91605+08	8	Week 8 Apr 23, 2017-Apr 30, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
746	2017-09-09 20:41:34.412637+08	9	Week 9 Apr 30, 2017-May 07, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
747	2017-09-09 20:41:39.746488+08	10	Week 10 May 07, 2017-May 14, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
748	2017-09-09 20:41:45.04943+08	11	Week 11 May 14, 2017-May 21, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
749	2017-09-09 20:41:49.697801+08	12	Week 12 May 21, 2017-May 28, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
750	2017-09-09 20:41:54.930553+08	13	Week 13 May 28, 2017-Jun 04, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
751	2017-09-09 20:42:00.796728+08	14	Week 14 Jun 04, 2017-Jun 11, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
752	2017-09-09 20:42:05.341845+08	15	Week 1 Sep 03, 2017-Sep 10, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
753	2017-09-09 20:42:09.956085+08	16	Week 2 Sep 10, 2017-Sep 17, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
754	2017-09-09 20:42:14.294683+08	17	Week 3 Sep 17, 2017-Sep 24, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
755	2017-09-09 20:42:17.557552+08	18	Week 4 Sep 24, 2017-Oct 01, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
756	2017-09-09 20:42:21.300898+08	19	Week 5 Oct 01, 2017-Oct 08, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
757	2017-09-09 20:42:26.58679+08	20	Week 6 Oct 08, 2017-Oct 15, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
758	2017-09-09 20:42:31.830474+08	21	Week 7 Oct 15, 2017-Oct 22, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
759	2017-09-09 20:42:34.905197+08	22	Week 8 Oct 22, 2017-Oct 29, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
760	2017-09-09 20:42:38.622294+08	23	Week 9 Oct 29, 2017-Nov 05, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
761	2017-09-09 20:42:42.219367+08	24	Week 10 Nov 05, 2017-Nov 12, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
762	2017-09-09 20:42:46.692147+08	25	Week 11 Nov 12, 2017-Nov 19, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
763	2017-09-09 20:42:50.216558+08	26	Week 12 Nov 19, 2017-Nov 26, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
764	2017-09-09 20:42:53.615154+08	27	Week 13 Nov 26, 2017-Dec 03, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
765	2017-09-09 20:42:56.62399+08	28	Week 14 Dec 03, 2017-Dec 10, 2017	2	[{"changed": {"fields": ["serial_id"]}}]	11	1
766	2017-09-10 14:01:15.868003+08	2	Just the Tip	2	[{"changed": {"fields": ["total_points", "season_leg_average", "season_median"]}}]	4	1
767	2017-09-10 14:02:02.989394+08	1	That's a Beautiful Rack	2	[{"changed": {"fields": ["total_points", "total_clearances", "season_leg_average", "season_median"]}}]	4	1
768	2017-09-10 14:02:22.457093+08	2	Just the Tip	2	[{"changed": {"fields": ["total_clearances"]}}]	4	1
769	2017-09-10 14:03:03.857966+08	3	Anything is Fine	2	[{"changed": {"fields": ["total_points", "total_clearances", "season_leg_average", "season_median"]}}]	4	1
770	2017-09-10 14:03:20.86525+08	4	Pink Platypuses	2	[{"changed": {"fields": ["total_points", "total_clearances"]}}]	4	1
771	2017-09-10 14:04:03.041474+08	5	The Abangers	2	[{"changed": {"fields": ["total_points", "total_clearances", "season_median"]}}]	4	1
772	2017-09-10 14:05:10.119291+08	6	Dram Good Shots	2	[{"changed": {"fields": ["total_points", "total_clearances", "season_leg_average", "season_median"]}}]	4	1
773	2017-09-10 14:07:02.90138+08	7	Holy Strokes	2	[{"changed": {"fields": ["total_points", "total_clearances", "season_leg_average", "season_median"]}}]	4	1
774	2017-09-10 14:07:52.589373+08	8	The Meanions	2	[{"changed": {"fields": ["total_points", "total_clearances", "season_median"]}}]	4	1
775	2017-09-10 14:08:05.868858+08	10	The Blazers	2	[{"changed": {"fields": ["total_points", "season_leg_average", "season_median"]}}]	4	1
776	2017-09-10 22:25:20.344796+08	140	Jay Gonzalez (The Blazers)	1	[{"added": {}}]	5	1
777	2017-09-10 22:25:45.134755+08	95	Ben Yiu	1	[{"added": {}}]	3	1
778	2017-09-10 22:26:22.503725+08	141	Ben Yiu (The Blazers)	1	[{"added": {}}]	5	1
779	2017-09-10 22:28:42.712724+08	140	Jay Gonzalez (The Blazers)	2	[{"changed": {"fields": ["points", "total_points", "handicap", "total_matches_played", "total_matches_won"]}}]	5	1
780	2017-09-10 22:31:30.696002+08	140	Jay Gonzalez (The Blazers)	2	[{"changed": {"fields": ["handicap"]}}]	5	1
781	2017-09-10 22:35:29.244462+08	108	Yolanda Leung (That's a Beautiful Rack)	2	[{"changed": {"fields": ["cancel_date"]}}]	5	1
782	2017-09-11 23:14:34.12566+08	118	2017-09-13 Just the Tip vs. Holy Strokes	2	[{"changed": {"fields": ["_home_ordered_players", "_away_ordered_players"]}}]	7	1
783	2017-09-11 23:41:08.818281+08	8	mancyh	2	[{"changed": {"fields": ["email"]}}]	15	15
784	2017-09-11 23:51:52.092854+08	96	Trish	1	[{"added": {}}]	3	15
785	2017-09-11 23:54:44.739254+08	142	Trish (Les Trois Mousquetaires)	1	[{"added": {}}]	5	15
786	2017-09-12 11:51:34.283122+08	137	Lode Van Leuven (Dram Good Shots)	2	[{"changed": {"fields": ["cancel_date"]}}]	5	1
787	2017-09-12 11:54:24.091065+08	97	Arthur Chui	1	[{"added": {}}]	3	1
788	2017-09-12 11:55:01.065704+08	98	Nikki Yeung	1	[{"added": {}}]	3	1
789	2017-09-12 11:55:14.852353+08	99	Ray Chia	1	[{"added": {}}]	3	1
790	2017-09-12 11:57:10.186011+08	143	Arthur Chui (Dram Good Shots)	1	[{"added": {}}]	5	1
791	2017-09-12 11:57:23.662846+08	144	Nikki Yeung (Dram Good Shots)	1	[{"added": {}}]	5	1
792	2017-09-12 11:57:34.754255+08	145	Ray Chia (Dram Good Shots)	1	[{"added": {}}]	5	1
793	2017-09-21 22:41:14.605018+08	121	2017-09-19 Dram Good Shots vs. The Meanions	2	[{"changed": {"fields": ["away_score", "handicap"]}}]	7	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 793, true);


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
22	administration	teamseasonal
23	stats	playerranking
24	stats	teamranking
25	guardian	groupobjectpermission
26	guardian	userobjectpermission
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('django_content_type_id_seq', 26, true);


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
43	recording	0014_auto_20170616_2255	2017-06-16 22:56:23.212729+08
44	administration	0013_player_user	2017-06-17 16:35:31.118618+08
45	administration	0014_group_logo	2017-06-17 19:01:32.399258+08
46	administration	0015_auto_20170625_1415	2017-06-25 14:16:11.67102+08
47	administration	0016_team_season_points	2017-06-25 14:43:19.734234+08
48	stats	0001_initial	2017-06-25 22:04:29.438786+08
49	stats	0002_auto_20170626_2207	2017-06-26 22:08:04.854692+08
50	stats	0003_auto_20170626_2209	2017-06-26 22:09:45.088814+08
51	schedule	0004_auto_20170627_2031	2017-06-27 20:31:17.20249+08
52	schedule	0005_auto_20170627_2033	2017-06-27 20:33:12.38263+08
53	stats	0004_playerranking_season	2017-06-27 21:10:42.29179+08
54	stats	0005_auto_20170627_2118	2017-06-27 21:18:20.928848+08
55	stats	0006_auto_20170627_2142	2017-06-27 21:42:14.700872+08
56	administration	0017_auto_20170627_2143	2017-06-27 21:44:04.988598+08
57	stats	0007_auto_20170627_2148	2017-06-27 21:48:12.77228+08
58	recording	0015_auto_20170704_2101	2017-07-04 21:01:23.771007+08
59	administration	0018_auto_20170704_2108	2017-07-04 21:08:47.67901+08
60	guardian	0001_initial	2017-08-23 11:48:01.248902+08
61	administration	0019_auto_20170823_1616	2017-08-23 16:16:58.472653+08
62	administration	0020_auto_20170823_1619	2017-08-23 16:20:01.963196+08
63	administration	0021_auto_20170823_1619	2017-08-23 16:20:02.002016+08
64	administration	0022_auto_20170823_1650	2017-08-23 16:50:12.230597+08
65	stats	0008_auto_20170827_1245	2017-08-27 12:45:58.675945+08
66	stats	0009_auto_20170827_1324	2017-08-27 13:25:42.797442+08
67	stats	0010_auto_20170827_1327	2017-08-27 13:27:27.45761+08
68	stats	0011_auto_20170827_1330	2017-08-27 13:30:18.853658+08
69	administration	0023_auto_20170909_1822	2017-09-09 18:28:02.097752+08
70	administration	0024_member_total_points	2017-09-09 18:28:02.161735+08
71	administration	0025_auto_20170909_1849	2017-09-09 18:49:10.394244+08
72	schedule	0006_matchweek_serial_id	2017-09-09 20:36:45.719593+08
73	recording	0016_auto_20170909_2040	2017-09-09 20:40:17.138376+08
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('django_migrations_id_seq', 73, true);


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
5lhbewzsf3ksi9u0ub9g1kqx8k8rc0c5	YzdiMTEwN2UzNDZlNTYwZDlkZTU1OTRjNmZjODU2YTgzNjY0ZDE2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk4NjFhMTI4MmQxYmIyZjg5YjFhM2FiMWY0MTNiZmFjZjU4OTIwZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-07 07:53:59.115724+08
wu5ihz1j4djg6idw8nvvfnfhx8x3ccpz	ZmRiMWI1Yzk0ZDQwMWZhYjZhNDA2MmI2NzY5MDJiODY3MzE1ZmNmZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODYxYTEyODJkMWJiMmY4OWIxYTNhYjFmNDEzYmZhY2Y1ODkyMGRkIn0=	2017-06-07 18:35:08.961945+08
wt7epwt3bk6uttbrehbkt9q5svexhef2	ODMzYTQ1M2JiNDg2NWJhZWZlZGUxNDAyNmFiODFhMWM2NDQzODgzNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTg2MWExMjgyZDFiYjJmODliMWEzYWIxZjQxM2JmYWNmNTg5MjBkZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-06-07 23:34:50.107977+08
2n5eyqa6g6c8fjuxgjilo2fgz3foownd	OGE1NzhlMjFjNzVmMmEzZTdjOGVmNWI4MjlkOTBiMWE3OTdhZTBmNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTg2MWExMjgyZDFiYjJmODliMWEzYWIxZjQxM2JmYWNmNTg5MjBkZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-08 00:34:07.284264+08
tss0pmrxj324out5zp4t1yll2s7btzua	OGE1NzhlMjFjNzVmMmEzZTdjOGVmNWI4MjlkOTBiMWE3OTdhZTBmNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTg2MWExMjgyZDFiYjJmODliMWEzYWIxZjQxM2JmYWNmNTg5MjBkZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-13 19:06:45.224345+08
pdr8crr53pkuxs10f40lmfsj1aqi5jwk	YzdiMTEwN2UzNDZlNTYwZDlkZTU1OTRjNmZjODU2YTgzNjY0ZDE2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk4NjFhMTI4MmQxYmIyZjg5YjFhM2FiMWY0MTNiZmFjZjU4OTIwZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 23:41:04.726422+08
x0ym7r3igodgwah17yr4cxts5l1issp9	MzUwMmEyNTQ4MTUxYmM2MTIyNjViOTMwOWVlNjdhNGY1NjRhOWI2ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzBlYWJiZDAyYmMxN2E2ZGJlMmFkNDcwZjIwMjU2MmRmMDhkOWQ4NSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-19 00:01:37.366273+08
16oevtwlr47m8k99o843bry4rdqkrogp	NGE4YWNiYTcyYjM1NDcwNmMzMzNjYTVlYzA5OWQzMzNiYjRiYjA1Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwZWFiYmQwMmJjMTdhNmRiZTJhZDQ3MGYyMDI1NjJkZjA4ZDlkODUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-19 22:38:14.681435+08
7tsyfdmuul5vgtq47k16qov7a4bp0lqs	ZGI1NDk1YmViN2MyNDc4MTc0NmE2YjZmMzZhOTcyNGMyZWQyNzg1ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGVhYmJkMDJiYzE3YTZkYmUyYWQ0NzBmMjAyNTYyZGYwOGQ5ZDg1In0=	2017-06-20 09:30:10.545498+08
1o05suxetraau1qi6t4gqz8b13blvmnm	MzU2MzM1NGE0MTE0YWJmODRlN2Y4ZDc0YzEyOGZlYjAxNDA0NGNjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1MWI2OTIxY2ZhZTFmNTk0Y2Q2YTg5NjFkZTM0YjhhNmFjNWU1ZWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-02 00:16:56.407234+08
2cmedk0mjid9hx21wupni5yo2aeihtka	YjYyNzVhYzYzZTYzOGIxNDY0NWI5OTRjODVmNDE1ZGU4MmE2ZGI2Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTUxYjY5MjFjZmFlMWY1OTRjZDZhODk2MWRlMzRiOGE2YWM1ZTVlYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-07-09 01:03:09.46893+08
qk142lk0ayenaaoyx3yyndegvfmwq6z8	MzU2MzM1NGE0MTE0YWJmODRlN2Y4ZDc0YzEyOGZlYjAxNDA0NGNjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1MWI2OTIxY2ZhZTFmNTk0Y2Q2YTg5NjFkZTM0YjhhNmFjNWU1ZWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-09 14:19:15.213145+08
leg7bsv3qxvwl40nbf78fppdtwt215ge	MzU2MzM1NGE0MTE0YWJmODRlN2Y4ZDc0YzEyOGZlYjAxNDA0NGNjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1MWI2OTIxY2ZhZTFmNTk0Y2Q2YTg5NjFkZTM0YjhhNmFjNWU1ZWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-18 21:02:04.130452+08
w31bk6r90l61c3hjg6qc38zq7zerr4tg	MzU2MzM1NGE0MTE0YWJmODRlN2Y4ZDc0YzEyOGZlYjAxNDA0NGNjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1MWI2OTIxY2ZhZTFmNTk0Y2Q2YTg5NjFkZTM0YjhhNmFjNWU1ZWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-06 11:55:36.263575+08
pbbw9rallzgtqbicz6o3hs45ojhwupgv	OGU2ZWM5ZWM2YjhlYTY4YjVkMWI4MDY1ZjIxNmE0NTAyNmJiNGI3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxYWM4YjIyMTkzYmVkYmM0MzY0OTRiM2IxNjBkMjRjNGNlZmY1ZDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-10 17:40:28.218838+08
6osq3ahxsdoaqy9stbf8mbwhxqzb96or	NTk0ZTRjZWMyZTlkZjk5Zjc5YzdjM2IyZGRlZDg5MDA0M2U1ZTQzYjp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjA1MjlhYjQ2N2MwYTlmOWY1ODRkMGI5Zjg1OGQ0ZDA5ZmU3Y2ZhNyJ9	2017-09-17 16:08:04.560375+08
hadzc1089y0gx4e2nwkkb3joamtd34fy	MzU2MzM1NGE0MTE0YWJmODRlN2Y4ZDc0YzEyOGZlYjAxNDA0NGNjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1MWI2OTIxY2ZhZTFmNTk0Y2Q2YTg5NjFkZTM0YjhhNmFjNWU1ZWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-17 19:00:41.449656+08
3qss062wswmml1quy7luu8i86vicam92	MTk5MzcwMWMzNDA1ZDBhYWNlYjRmODdkOGFmYTM4MjI5YjA5NWE2Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlZWI1N2YyZjU1MzFlM2FiMGVlOWU0YjQ1OGUyYTAxZjQyMGZhNWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9	2017-09-17 23:08:32.234475+08
lwf6vq4vl5p7jkskucv4yoyzkr8ojv4m	YzIxM2Y3YjA2NTRkNDdjYTNiMjc4YmNlYmEzOTExZDM5MTU5ZjhmNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIyMDkwMWM3ZGNkZDk1MTY3YWVjODEzYTAyMmU0MmZkMzAxNmE4NWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9	2017-09-17 23:08:38.530206+08
eojtkt6aw82gvtvjzfdt5wxvwe0531up	ZDJjYjlmMjJhN2UyM2ZlYmM3YmY3ZmZiMGU3MjUzMTFkNDk3ZWE1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1MWI2OTIxY2ZhZTFmNTk0Y2Q2YTg5NjFkZTM0YjhhNmFjNWU1ZWMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-09-18 00:34:15.853215+08
o0qs8ys4si5mtsuxc2wfmsjej4f4k6ud	MTIzM2Q5ZDdiZDk3OTVmYzZmYmRlNWViZjA1MzMyYzhlNTVhYTJjOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1NTFiNjkyMWNmYWUxZjU5NGNkNmE4OTYxZGUzNGI4YTZhYzVlNWVjIn0=	2017-09-18 08:19:54.107949+08
nryuu7nbq8gqvfnn6o5zn0b6vz8g1vre	MDFmMzY2MTNjZGM3NTYyZTVlZmNmYmI5NzgyM2YzOGI4MTI1MzViMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGVmODRmY2Q3Yjg3ZDZkNzFhNDIxODU4YzYxODIzODhhYzMzNjk2YiIsIl9hdXRoX3VzZXJfaWQiOiI4In0=	2017-09-18 11:02:30.863434+08
g1vmc66mm3s0ze7ok3ee1zwjr4tl00q0	NGI2NjM3MDBmNmRhYzkzYmZmNGY3MWI4ZjgwNTc1MWEwNDk4MWRmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTFiNjkyMWNmYWUxZjU5NGNkNmE4OTYxZGUzNGI4YTZhYzVlNWVjIn0=	2017-09-18 13:17:11.765561+08
ixvhyj0477uwlf4wcnbe6sl1ycr0osz3	MzU2MzM1NGE0MTE0YWJmODRlN2Y4ZDc0YzEyOGZlYjAxNDA0NGNjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1MWI2OTIxY2ZhZTFmNTk0Y2Q2YTg5NjFkZTM0YjhhNmFjNWU1ZWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-18 21:56:27.033215+08
g71fxxmuoels6jz5wz9hsn1u86hijjoe	NjRiZjhiODY0MjE1Y2I2NzNiZWNkZGVkNjVlYTNjZTBlNTRhY2ZhMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjljM2VkZTc5MTk1MTlkYTJiZjBmYzdiNmIxMDcxOGNkNDY4NTM4NCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=	2017-09-19 08:35:31.19441+08
nc0euvkfjeowr5yoj4677lchksrmegmx	ODQyOGM4ZmZkNTM0NzJiNmY2NTBiZjIxODRlNDcwZTBiYzYyOTQzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTUxYjY5MjFjZmFlMWY1OTRjZDZhODk2MWRlMzRiOGE2YWM1ZTVlYyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-19 08:52:33.546753+08
zdusc8beiqktykku5hpva4c5zhc3u5ui	OWMyNzE0M2Q1M2E0MmE0YTM1ZWE2NmU4YWZlZWFjZDc4YzU5ODEyNTp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0MjUwMDI4OWFlZWIyMTI2YTc1MWE4NzIyMGZiZGEyOTllOWU1N2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2017-09-19 19:41:01.066137+08
jikftlz2pul7yl8cloqhb76toyijxj8k	YjYyNzVhYzYzZTYzOGIxNDY0NWI5OTRjODVmNDE1ZGU4MmE2ZGI2Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTUxYjY5MjFjZmFlMWY1OTRjZDZhODk2MWRlMzRiOGE2YWM1ZTVlYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-09-19 19:41:56.009267+08
meg4cetmznxlt81nczkovoazz8uivegk	NGJlN2IxOGE4YjRjOWMwZWJjNTc3M2I4ZjU2ZjgxMTMzNDA3OWRhYTp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfaGFzaCI6IjFmY2NmM2M0ZDM3OWIwMWVkZDU2NzY1ODc2NDdjOWI5ZWZhOTExNWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2017-09-19 20:53:17.900529+08
raefaret4sh9hpk54dh1u184l32ewqfv	YTA2NzYzYWMzNGJjYWVlMzYyMzA0NzEyNDE1OWJlNGZlNDQ2NDBkZjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDkwMWM3ZGNkZDk1MTY3YWVjODEzYTAyMmU0MmZkMzAxNmE4NWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2017-09-19 22:28:03.689946+08
89dh4xbvrv459ccmsrfazmxpz69fm9zr	ZTNlZTA1YWRlN2VmNzA2NDc5MGM3OGM1YzE4MTMzOTA3OGRlNDk3ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2hhc2giOiJiOWMzZWRlNzkxOTUxOWRhMmJmMGZjN2I2YjEwNzE4Y2Q0Njg1Mzg0In0=	2017-09-20 18:31:48.74607+08
q4p5oc7hkjj5b0zpen9xc1d3cuefg2mk	ZTNlZTA1YWRlN2VmNzA2NDc5MGM3OGM1YzE4MTMzOTA3OGRlNDk3ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2hhc2giOiJiOWMzZWRlNzkxOTUxOWRhMmJmMGZjN2I2YjEwNzE4Y2Q0Njg1Mzg0In0=	2017-09-20 18:33:10.712185+08
120ura3zbdasfjivjj1m9gecgwkt4jhn	MTIzM2Q5ZDdiZDk3OTVmYzZmYmRlNWViZjA1MzMyYzhlNTVhYTJjOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1NTFiNjkyMWNmYWUxZjU5NGNkNmE4OTYxZGUzNGI4YTZhYzVlNWVjIn0=	2017-09-20 19:19:36.162153+08
gw0z44p9g33ipmnv32ib7cf4amhrzy8d	MTIzM2Q5ZDdiZDk3OTVmYzZmYmRlNWViZjA1MzMyYzhlNTVhYTJjOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1NTFiNjkyMWNmYWUxZjU5NGNkNmE4OTYxZGUzNGI4YTZhYzVlNWVjIn0=	2017-09-20 19:42:12.717151+08
y6xfvqc9umwhkc6saxx9au12bt447tla	MzU2MzM1NGE0MTE0YWJmODRlN2Y4ZDc0YzEyOGZlYjAxNDA0NGNjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1MWI2OTIxY2ZhZTFmNTk0Y2Q2YTg5NjFkZTM0YjhhNmFjNWU1ZWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-21 20:56:51.612077+08
7k059gr57uiq9mkm8ynczxf35i45nye0	NWYzN2I1NzhhMzc0MjY1MjQ1NmU1NDBjNTUxZTE0Yzc1MWI2MjdkMTp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzQyNTAwMjg5YWVlYjIxMjZhNzUxYTg3MjIwZmJkYTI5OWU5ZTU3YiJ9	2017-09-25 23:48:01.754676+08
7jqr3ox0ez713w57ku7z129eldvwxbdd	NDM1MzI0NmY0ZjIyMmM2ZTJiY2QxMmFlZDliOTVkNmRhMmUxY2EyMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjA2YjAzYzY1YTQ5OWY4ODNhY2ZkN2Y4OWFjNTY2YzY5N2U4ZTljZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-26 12:49:26.979613+08
p1j8ltvk117r39gqbd54hnkvvt4568pz	MTIzM2Q5ZDdiZDk3OTVmYzZmYmRlNWViZjA1MzMyYzhlNTVhYTJjOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1NTFiNjkyMWNmYWUxZjU5NGNkNmE4OTYxZGUzNGI4YTZhYzVlNWVjIn0=	2017-09-26 15:00:00.521938+08
co9989otqspfzvv965qvpl8kuoen570v	YjkyZWYyODZkNWQ1NGZiMWE3N2U4YTg1OTMyODlmN2MyMzdjNWNjMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE1IiwiX2F1dGhfdXNlcl9oYXNoIjoiNzQyNTAwMjg5YWVlYjIxMjZhNzUxYTg3MjIwZmJkYTI5OWU5ZTU3YiJ9	2017-09-26 15:05:27.424057+08
zngfz8t198t6c0u7wodqw985vmr2p0xk	MzU2MzM1NGE0MTE0YWJmODRlN2Y4ZDc0YzEyOGZlYjAxNDA0NGNjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1MWI2OTIxY2ZhZTFmNTk0Y2Q2YTg5NjFkZTM0YjhhNmFjNWU1ZWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-10-05 22:21:27.797257+08
\.


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('guardian_groupobjectpermission_id_seq', 1, false);


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
1	113	7	80	13
2	113	7	80	6
3	114	7	80	12
4	114	7	80	11
5	115	7	80	10
6	115	7	80	5
7	116	7	80	8
8	116	7	80	9
9	117	7	80	9
10	117	7	80	10
11	118	7	80	5
12	118	7	80	8
13	119	7	80	11
14	119	7	80	6
15	120	7	80	13
16	120	7	80	12
17	121	7	80	12
18	121	7	80	9
19	122	7	80	6
20	122	7	80	5
21	123	7	80	11
22	123	7	80	8
23	124	7	80	10
24	124	7	80	13
25	125	7	80	8
26	125	7	80	10
27	126	7	80	13
28	126	7	80	11
29	127	7	80	9
30	127	7	80	6
31	128	7	80	5
32	128	7	80	12
33	129	7	80	9
34	129	7	80	5
35	130	7	80	6
36	130	7	80	12
37	131	7	80	10
38	131	7	80	11
39	132	7	80	8
40	132	7	80	13
41	133	7	80	5
42	133	7	80	11
43	134	7	80	13
44	134	7	80	9
45	135	7	80	10
46	135	7	80	12
47	136	7	80	8
48	136	7	80	6
49	137	7	80	12
50	137	7	80	8
51	138	7	80	6
52	138	7	80	10
53	139	7	80	5
54	139	7	80	13
55	140	7	80	11
56	140	7	80	9
57	141	7	80	12
58	141	7	80	13
59	142	7	80	9
60	142	7	80	11
61	143	7	80	10
62	143	7	80	8
63	144	7	80	5
64	144	7	80	6
65	145	7	80	6
66	145	7	80	8
67	146	7	80	5
68	146	7	80	10
69	147	7	80	11
70	147	7	80	13
71	148	7	80	9
72	148	7	80	12
73	149	7	80	12
74	149	7	80	10
75	150	7	80	6
76	150	7	80	11
77	151	7	80	9
78	151	7	80	13
79	152	7	80	8
80	152	7	80	5
81	153	7	80	13
82	153	7	80	5
83	154	7	80	9
84	154	7	80	8
85	155	7	80	10
86	155	7	80	6
87	156	7	80	11
88	156	7	80	12
89	157	7	80	11
90	157	7	80	10
91	158	7	80	13
92	158	7	80	8
93	159	7	80	5
94	159	7	80	9
95	160	7	80	12
96	160	7	80	6
97	161	7	80	6
98	161	7	80	9
99	162	7	80	13
100	162	7	80	10
101	163	7	80	8
102	163	7	80	12
103	164	7	80	11
104	164	7	80	5
105	165	7	80	8
106	165	7	80	11
107	166	7	80	12
108	166	7	80	5
109	167	7	80	13
110	167	7	80	6
111	168	7	80	10
112	168	7	80	9
113	117	7	69	9
114	117	7	69	10
115	118	7	69	5
116	118	7	69	8
117	119	7	69	11
118	119	7	69	6
119	120	7	69	13
120	120	7	69	12
121	121	7	69	12
122	121	7	69	9
123	122	7	69	6
124	122	7	69	5
125	123	7	69	11
126	123	7	69	8
127	124	7	69	10
128	124	7	69	13
129	125	7	69	8
130	125	7	69	10
131	126	7	69	13
132	126	7	69	11
133	127	7	69	9
134	127	7	69	6
135	128	7	69	5
136	128	7	69	12
137	129	7	69	9
138	129	7	69	5
139	130	7	69	6
140	130	7	69	12
141	131	7	69	10
142	131	7	69	11
143	132	7	69	8
144	132	7	69	13
145	133	7	69	5
146	133	7	69	11
147	134	7	69	13
148	134	7	69	9
149	135	7	69	10
150	135	7	69	12
151	136	7	69	8
152	136	7	69	6
153	137	7	69	12
154	137	7	69	8
155	138	7	69	6
156	138	7	69	10
157	139	7	69	5
158	139	7	69	13
159	140	7	69	11
160	140	7	69	9
161	141	7	69	12
162	141	7	69	13
163	142	7	69	9
164	142	7	69	11
165	143	7	69	10
166	143	7	69	8
167	144	7	69	5
168	144	7	69	6
169	145	7	69	6
170	145	7	69	8
171	146	7	69	5
172	146	7	69	10
173	147	7	69	11
174	147	7	69	13
175	148	7	69	9
176	148	7	69	12
177	149	7	69	12
178	149	7	69	10
179	150	7	69	6
180	150	7	69	11
181	151	7	69	9
182	151	7	69	13
183	152	7	69	8
184	152	7	69	5
185	153	7	69	13
186	153	7	69	5
187	154	7	69	9
188	154	7	69	8
189	155	7	69	10
190	155	7	69	6
191	156	7	69	11
192	156	7	69	12
193	157	7	69	11
194	157	7	69	10
195	158	7	69	13
196	158	7	69	8
197	159	7	69	5
198	159	7	69	9
199	160	7	69	12
200	160	7	69	6
201	161	7	69	6
202	161	7	69	9
203	162	7	69	13
204	162	7	69	10
205	163	7	69	8
206	163	7	69	12
207	164	7	69	11
208	164	7	69	5
209	165	7	69	8
210	165	7	69	11
211	166	7	69	12
212	166	7	69	5
213	167	7	69	13
214	167	7	69	6
215	168	7	69	10
216	168	7	69	9
217	114	7	69	12
218	114	7	69	11
219	115	7	69	10
220	115	7	69	5
221	113	7	69	6
222	113	7	69	13
223	116	7	69	8
224	116	7	69	9
225	71	7	80	16
226	81	7	80	16
227	96	7	80	16
228	62	7	80	16
229	103	7	80	16
230	79	7	80	16
231	108	7	80	16
232	117	7	80	16
233	125	7	80	16
234	138	7	80	16
235	146	7	80	16
236	149	7	80	16
237	157	7	80	16
238	162	7	80	16
239	68	7	80	16
240	76	7	80	16
241	86	7	80	16
242	92	7	80	16
243	97	7	80	16
244	112	7	80	16
245	60	7	80	16
246	124	7	80	16
247	131	7	80	16
248	135	7	80	16
249	143	7	80	16
250	155	7	80	16
251	168	7	80	16
252	115	7	80	16
253	125	7	69	16
254	138	7	69	16
255	146	7	69	16
256	149	7	69	16
257	157	7	69	16
258	162	7	69	16
259	117	7	69	16
260	124	7	69	16
261	131	7	69	16
262	135	7	69	16
263	143	7	69	16
264	155	7	69	16
265	168	7	69	16
\.


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('guardian_userobjectpermission_id_seq', 265, true);


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
1672	1	10	7	f	5	\N	821
1688	1	10	5	f	77	\N	829
1675	2	4	10	f	47	\N	822
1689	2	10	6	f	70	\N	829
1666	1	7	10	f	78	\N	818
1676	1	10	7	f	78	\N	823
1674	1	10	5	f	76	\N	822
1673	2	2	10	t	46	46	821
1679	2	10	4	f	49	\N	824
1677	2	7	10	f	48	\N	823
1678	1	10	2	f	77	\N	824
1684	1	5	10	f	76	\N	827
1628	1	0	10	t	57	84	799
1681	2	10	4	f	70	\N	825
1683	2	10	2	f	47	\N	826
1687	2	5	10	f	49	\N	828
1686	1	10	4	f	78	\N	828
1691	2	10	6	f	46	\N	830
1667	2	5	10	f	47	\N	818
1624	1	5	10	f	55	\N	797
1534	1	1	10	t	70	73	752
1625	2	6	10	f	75	\N	797
1671	2	6	10	f	49	\N	820
1626	1	4	10	f	54	\N	798
1627	2	3	10	f	73	\N	798
1663	2	10	6	f	70	\N	816
1623	2	10	5	f	2	\N	796
1669	2	10	5	f	48	\N	819
1685	2	10	6	f	48	\N	827
1630	1	2	10	f	52	\N	800
1670	1	10	6	f	92	\N	820
1629	2	5	10	f	84	\N	799
1668	1	7	10	f	77	\N	819
1631	2	10	6	f	72	\N	800
1682	1	10	3	f	5	\N	826
1690	1	10	1	f	92	\N	830
1662	1	7	10	f	5	\N	816
1665	2	5	10	f	46	\N	817
1664	1	10	7	f	76	\N	817
1680	1	3	10	t	92	70	825
1710	1	10	7	f	55	\N	840
1695	2	10	7	f	6	\N	832
1698	1	4	10	f	53	\N	834
1785	2	6	10	f	69	\N	877
1700	1	10	4	f	55	\N	835
1711	2	2	10	t	7	7	840
1735	2	10	1	f	47	\N	852
1713	2	10	4	f	81	\N	841
1717	2	7	10	f	90	\N	843
1707	2	7	10	f	89	\N	838
1694	1	4	10	f	58	\N	832
1716	1	3	10	f	54	\N	843
1708	1	6	10	f	53	\N	839
1705	2	10	2	t	81	58	837
1693	2	7	10	f	7	\N	831
1719	2	4	10	f	7	\N	844
1702	1	6	10	f	57	\N	836
1699	2	7	10	f	89	\N	834
1721	2	10	6	f	6	\N	845
1720	1	10	6	f	55	\N	845
1692	1	6	10	f	57	\N	831
1706	1	2	10	f	54	\N	838
1712	1	7	10	f	57	\N	841
1714	1	10	6	f	58	\N	842
1709	2	5	10	f	90	\N	839
1718	1	6	10	f	53	\N	844
1696	1	10	4	f	54	\N	833
1697	2	5	10	f	81	\N	833
1715	2	10	3	t	89	58	842
1703	2	10	3	f	6	\N	836
1701	2	10	2	f	90	\N	835
1704	1	10	4	t	58	58	837
1772	1	7	10	f	104	\N	871
1765	2	10	6	f	78	\N	867
1756	1	7	10	f	2	\N	863
1754	1	4	10	f	84	\N	862
1731	2	10	5	f	46	\N	850
1730	1	10	4	f	41	\N	850
1755	2	10	7	f	77	\N	862
1777	2	6	10	f	71	\N	873
1780	1	7	10	f	74	\N	875
1734	1	10	7	f	44	\N	852
1773	2	10	3	f	78	\N	871
1741	2	10	6	f	49	\N	855
1746	1	6	10	f	43	\N	858
1798	1	10	4	t	1	1	884
1745	2	10	6	f	48	\N	857
1778	1	10	6	f	75	\N	874
1729	2	10	6	f	48	\N	849
1793	2	5	10	f	69	\N	881
1776	1	5	10	f	2	\N	873
1779	2	10	5	f	76	\N	874
1727	2	10	4	f	47	\N	848
1743	2	10	6	f	47	\N	856
1775	2	6	10	f	5	\N	872
1781	2	3	10	f	77	\N	875
1789	2	10	1	f	66	\N	879
1751	2	10	2	f	70	\N	860
1760	1	10	6	f	74	\N	865
1747	2	6	10	f	46	\N	858
1736	1	5	10	f	43	\N	853
1732	1	7	10	f	42	\N	851
1761	2	6	10	t	71	71	865
1749	2	10	5	f	49	\N	859
1728	1	10	5	f	3	\N	849
1744	1	10	1	f	44	\N	857
1790	1	7	10	f	87	\N	880
1726	1	10	5	f	43	\N	848
1739	2	3	10	f	46	\N	854
1725	2	4	10	f	70	\N	847
1724	1	10	7	f	44	\N	847
1748	1	10	4	f	3	\N	859
1722	1	10	3	f	42	\N	846
1723	2	10	7	f	49	\N	846
1740	1	10	6	f	41	\N	855
1750	1	2	10	f	41	\N	860
1742	1	10	4	f	42	\N	856
1733	2	3	10	f	70	\N	851
1738	1	6	10	f	3	\N	854
1737	2	10	7	f	48	\N	853
1763	2	2	10	f	77	\N	866
1788	1	10	3	f	1	\N	879
1753	2	10	6	f	76	\N	861
1769	2	10	4	f	71	\N	869
1762	1	5	10	f	104	\N	866
1757	2	10	4	f	78	\N	863
1786	1	5	10	f	80	\N	878
1770	1	6	10	f	74	\N	870
1771	2	10	7	f	76	\N	870
1800	1	10	5	f	87	\N	885
1766	1	2	10	f	2	\N	868
1787	2	10	7	f	61	\N	878
1782	1	4	10	f	109	\N	876
1752	1	10	4	f	104	\N	861
1783	2	10	7	f	64	\N	876
1759	2	10	6	f	5	\N	864
1767	2	4	10	f	5	\N	868
1768	1	0	10	t	75	71	869
1764	1	10	4	f	84	\N	867
1758	1	10	1	t	75	75	864
1796	1	10	5	f	80	\N	883
1794	1	10	6	f	79	\N	882
1774	1	4	10	f	84	\N	872
1784	1	4	10	f	79	\N	877
1797	2	10	2	f	66	\N	883
1804	1	4	10	f	79	\N	887
1801	2	10	5	f	64	\N	885
1795	2	10	3	f	61	\N	882
1792	1	5	10	f	109	\N	881
1807	2	6	10	f	107	\N	888
1809	2	10	5	f	64	\N	889
1808	1	10	5	f	1	\N	889
1805	2	10	7	f	66	\N	887
1806	1	3	10	f	80	\N	888
1811	2	4	10	f	69	\N	890
1802	1	10	1	f	109	\N	886
1803	2	6	10	f	61	\N	886
1810	1	5	10	f	87	\N	890
1791	2	6	10	f	107	\N	880
1799	2	10	4	f	107	\N	884
1812	1	7	10	f	116	\N	891
1813	2	6	10	f	42	\N	891
1818	1	3	10	f	117	\N	894
1817	2	10	7	f	43	\N	893
1821	2	10	3	f	41	\N	895
1819	2	5	10	f	3	\N	894
1823	2	4	10	f	44	\N	896
1824	1	10	5	f	114	\N	897
1839	2	5	10	f	42	\N	904
1822	1	6	10	f	116	\N	896
1825	2	7	10	f	43	\N	897
1830	1	6	10	f	120	\N	900
1832	1	10	6	f	116	\N	901
1828	1	0	10	f	117	\N	899
1826	1	7	10	f	115	\N	898
1836	1	6	10	f	115	\N	903
1829	2	2	10	t	41	41	899
1831	2	4	10	f	42	\N	900
1848	1	10	7	f	80	\N	909
1834	1	4	10	f	114	\N	902
1835	2	6	10	f	3	\N	902
1827	2	6	10	f	3	\N	898
1842	1	4	10	f	79	\N	906
1851	2	10	7	f	67	\N	910
1850	1	10	4	f	87	\N	910
1814	1	1	10	t	114	44	892
1820	1	6	10	f	120	\N	895
1815	2	7	10	f	44	\N	892
1838	1	7	10	f	117	\N	904
1816	1	10	7	f	115	\N	893
1843	2	4	10	f	63	\N	906
1841	2	6	10	f	44	\N	905
1840	1	2	10	f	120	\N	905
1847	2	10	6	f	69	\N	908
1833	2	10	7	f	43	\N	901
1837	2	5	10	f	41	\N	903
1853	2	1	10	f	62	\N	911
1844	1	10	6	f	127	\N	907
1846	1	5	10	f	83	\N	908
1854	1	10	6	f	127	\N	912
1852	1	6	10	f	79	\N	911
1855	2	10	6	f	69	\N	912
1946	1	7	10	f	6	\N	958
1903	2	10	5	f	2	\N	936
1928	1	10	5	f	133	\N	949
1951	2	10	5	f	76	\N	960
1869	2	7	10	f	63	\N	919
1870	1	10	6	f	87	\N	920
1902	1	7	10	f	56	\N	936
1867	2	10	5	f	67	\N	918
1931	2	7	10	f	125	\N	950
1909	2	6	10	f	73	\N	939
1906	1	5	10	f	138	\N	938
1905	2	10	7	f	125	\N	937
1911	2	4	10	f	72	\N	940
1910	1	6	10	f	134	\N	940
1907	2	10	7	f	124	\N	938
1922	1	1	10	f	56	\N	946
1923	2	4	10	f	124	\N	946
1929	2	10	2	f	2	\N	949
1915	2	5	10	f	124	\N	942
1916	1	6	10	f	138	\N	943
1924	1	7	10	f	52	\N	947
1913	2	10	6	f	125	\N	941
1912	1	10	3	f	56	\N	941
1927	2	10	7	f	72	\N	948
1917	2	7	10	f	73	\N	943
1921	2	5	10	f	2	\N	945
1919	2	10	7	f	72	\N	944
1920	1	10	6	f	134	\N	945
1914	1	5	10	f	52	\N	942
1918	1	10	1	f	133	\N	944
1926	1	10	5	f	138	\N	948
1925	2	0	10	t	73	73	947
1960	1	10	5	f	93	\N	965
1871	2	10	6	f	62	\N	920
1957	2	10	5	f	78	\N	963
1930	1	2	10	f	134	\N	950
1958	1	7	10	f	81	\N	964
1959	2	10	5	f	76	\N	964
1956	1	10	5	f	6	\N	963
1849	2	10	3	f	105	\N	909
1845	2	10	0	t	62	127	907
1950	1	6	10	f	93	\N	960
1904	1	10	7	f	52	\N	937
1954	1	6	10	f	123	\N	962
1859	2	10	5	f	67	\N	914
1860	1	1	10	f	87	\N	915
1858	1	10	4	f	80	\N	914
1856	1	10	6	f	83	\N	913
1862	1	10	6	f	79	\N	916
1861	2	10	3	f	63	\N	915
1955	2	3	10	f	71	\N	962
1864	1	10	7	f	127	\N	917
1863	2	6	10	f	69	\N	916
1908	1	7	10	f	133	\N	939
1866	1	10	6	f	83	\N	918
1865	2	10	5	f	105	\N	917
1868	1	3	10	f	80	\N	919
1857	2	5	10	f	105	\N	913
1932	1	10	6	f	7	\N	951
1933	2	10	2	f	76	\N	951
1934	1	6	10	f	123	\N	952
1935	2	5	10	f	77	\N	952
1953	2	10	4	f	92	\N	961
1938	1	5	10	f	81	\N	954
1952	1	10	7	f	7	\N	961
1939	2	2	10	f	71	\N	954
1940	1	10	0	f	93	\N	955
1949	2	6	10	f	78	\N	959
1961	2	2	10	f	77	\N	965
1948	1	6	10	f	81	\N	959
1942	1	2	10	f	7	\N	956
1947	2	10	6	f	71	\N	958
1944	1	10	7	f	123	\N	957
1936	1	7	10	f	6	\N	953
1937	2	5	10	f	92	\N	953
1943	2	6	10	f	77	\N	956
1941	2	10	4	f	78	\N	955
1945	2	6	10	f	92	\N	957
1976	1	5	10	f	78	\N	973
1974	1	10	1	t	71	71	972
1989	2	10	4	f	56	\N	979
1972	1	10	4	f	77	\N	971
1981	2	10	7	f	56	\N	975
1978	1	10	5	f	92	\N	974
1982	1	10	2	f	77	\N	976
1963	2	6	10	f	56	\N	966
1962	1	10	7	f	77	\N	966
1966	1	10	7	f	78	\N	968
1977	2	2	10	f	138	\N	973
1983	2	6	10	f	143	\N	976
1967	2	7	10	f	143	\N	968
1973	2	10	0	f	54	\N	971
1971	2	4	10	f	52	\N	970
1979	2	7	10	f	52	\N	974
1965	2	10	1	f	54	\N	967
1986	1	5	10	f	78	\N	978
1969	2	1	10	t	138	138	969
1987	2	10	6	f	52	\N	978
1984	1	10	2	f	71	\N	977
1990	1	10	3	f	5	\N	980
1988	1	10	5	f	92	\N	979
1975	2	10	2	f	143	\N	972
1991	2	10	0	f	54	\N	980
1964	1	10	5	f	71	\N	967
1985	2	10	7	f	138	\N	977
1968	1	10	7	f	92	\N	969
1970	1	10	3	f	5	\N	970
1980	1	10	4	f	5	\N	975
2010	1	2	10	f	66	\N	990
2002	1	10	6	f	69	\N	986
2011	2	5	10	f	116	\N	990
2001	2	5	10	f	114	\N	985
2004	1	5	10	f	113	\N	987
1998	1	10	7	f	64	\N	984
1997	2	2	10	f	120	\N	983
2008	1	5	10	f	64	\N	989
1996	1	10	6	f	129	\N	983
1999	2	10	5	f	117	\N	984
2003	2	10	6	f	122	\N	986
2006	1	6	10	f	129	\N	988
2009	2	10	6	f	114	\N	989
1994	1	6	10	f	113	\N	982
2007	2	2	10	f	117	\N	988
1995	2	10	3	f	122	\N	982
2000	1	10	5	f	66	\N	985
1992	1	10	6	f	69	\N	981
1993	2	10	7	f	116	\N	981
2020	1	10	6	f	66	\N	995
2017	2	4	10	f	114	\N	993
2015	2	6	10	f	117	\N	992
2018	1	10	3	f	64	\N	994
2021	2	4	10	f	122	\N	995
2019	2	10	5	f	116	\N	994
2014	1	5	10	f	113	\N	992
2016	1	0	10	f	129	\N	993
2013	2	7	10	f	120	\N	991
2012	1	6	10	f	69	\N	991
2005	2	1	10	f	120	\N	987
2022	1	1	10	f	42	\N	996
2023	2	6	10	f	127	\N	996
2070	1	10	3	f	131	\N	1020
2080	1	4	10	f	131	\N	1025
2075	2	10	4	f	67	\N	1022
2077	2	10	7	f	62	\N	1023
2057	2	10	4	f	69	\N	1013
2060	1	10	3	f	131	\N	1015
2055	2	10	7	f	105	\N	1012
2135	2	3	10	f	126	\N	1052
2065	2	6	10	f	69	\N	1017
2074	1	10	5	f	57	\N	1022
2076	1	7	10	f	132	\N	1023
2063	2	10	5	f	105	\N	1016
2053	2	10	7	f	113	\N	1011
2051	2	10	1	f	79	\N	1010
2141	2	7	10	f	44	\N	1055
2064	1	3	10	f	57	\N	1017
2058	1	10	7	f	144	\N	1014
2140	1	6	10	f	81	\N	1055
2094	1	7	10	f	139	\N	1032
2038	1	7	10	f	126	\N	1004
2035	2	10	6	f	80	\N	1002
2028	1	10	3	f	126	\N	999
2098	1	0	10	t	124	6	1034
2034	1	10	5	f	44	\N	1002
2088	1	7	10	f	124	\N	1029
2025	2	10	7	f	79	\N	997
2045	2	10	5	f	109	\N	1007
2092	1	10	7	f	2	\N	1031
2046	1	10	4	f	43	\N	1008
2102	1	6	10	f	2	\N	1036
2041	2	10	2	f	127	\N	1005
2047	2	10	6	f	83	\N	1008
2033	2	10	7	f	79	\N	1001
2024	1	6	10	f	44	\N	997
2044	1	10	6	f	44	\N	1007
2050	1	10	5	f	41	\N	1010
2031	2	10	6	f	83	\N	1000
2049	2	10	7	f	127	\N	1009
2040	1	6	10	f	41	\N	1005
2032	1	1	10	f	42	\N	1001
2090	1	10	3	f	73	\N	1030
2026	1	10	6	f	43	\N	998
2042	1	10	6	f	42	\N	1006
2039	2	10	7	f	83	\N	1004
2027	2	10	3	f	80	\N	998
2048	1	1	10	f	126	\N	1009
2037	2	10	7	f	109	\N	1003
2043	2	10	4	f	80	\N	1006
2036	1	10	6	f	43	\N	1003
2030	1	10	6	f	41	\N	1000
2029	2	10	5	f	109	\N	999
2112	1	6	10	f	7	\N	1041
2131	2	10	5	f	3	\N	1050
2125	2	10	5	f	43	\N	1047
2114	1	10	6	f	112	\N	1042
2069	2	10	6	f	62	\N	1019
2121	2	10	5	f	45	\N	1045
2097	2	10	1	f	123	\N	1033
2085	2	2	10	f	81	\N	1027
2084	1	10	1	f	139	\N	1027
2117	2	6	10	f	43	\N	1043
2109	2	10	6	f	7	\N	1039
2086	1	10	7	f	125	\N	1028
2083	2	5	10	f	7	\N	1026
2108	1	10	5	f	124	\N	1039
2103	2	10	6	f	93	\N	1036
2104	1	10	4	f	139	\N	1037
2095	2	2	10	f	93	\N	1032
2100	1	5	10	f	73	\N	1035
2106	1	6	10	f	125	\N	1038
2056	1	4	10	f	132	\N	1013
2105	2	10	1	t	123	139	1037
2138	1	4	10	f	6	\N	1054
2062	1	10	7	f	55	\N	1016
2079	2	10	7	f	113	\N	1024
2113	2	10	3	f	3	\N	1041
2078	1	10	5	f	144	\N	1024
2136	1	5	10	f	123	\N	1053
2081	2	7	10	f	105	\N	1025
2073	2	10	7	f	69	\N	1021
2134	1	10	4	f	112	\N	1052
2126	1	0	10	t	123	126	1048
2101	2	10	6	f	7	\N	1035
2061	2	10	7	f	62	\N	1015
2082	1	10	7	f	2	\N	1026
2096	1	10	4	f	125	\N	1033
2054	1	10	3	f	57	\N	1012
2052	1	10	5	f	55	\N	1011
2107	2	7	10	f	6	\N	1038
2127	2	7	10	f	126	\N	1048
2072	1	6	10	f	55	\N	1021
2091	2	10	4	f	6	\N	1030
2066	1	10	7	f	132	\N	1018
2068	1	6	10	f	144	\N	1019
2139	2	5	10	f	3	\N	1054
2093	2	10	4	f	81	\N	1031
2089	2	5	10	f	123	\N	1029
2071	2	10	4	f	113	\N	1020
2059	2	7	10	f	67	\N	1014
2067	2	6	10	f	67	\N	1018
2087	2	5	10	f	93	\N	1028
2099	2	10	6	f	6	\N	1034
2110	1	10	3	f	73	\N	1040
2124	1	10	3	f	112	\N	1047
2111	2	10	4	f	81	\N	1040
2118	1	10	7	f	6	\N	1044
2123	2	10	6	f	44	\N	1046
2132	1	10	4	f	7	\N	1051
2119	2	10	7	f	126	\N	1044
2122	1	5	10	f	7	\N	1046
2115	2	10	2	f	44	\N	1042
2120	1	3	10	f	81	\N	1045
2130	1	6	10	f	81	\N	1050
2128	1	10	7	f	6	\N	1049
2129	2	10	3	f	45	\N	1049
2116	1	1	10	f	123	\N	1043
2133	2	10	3	f	43	\N	1051
2137	2	5	10	f	45	\N	1053
2149	2	10	5	f	87	\N	1059
2143	2	7	10	f	79	\N	1056
2142	1	10	4	f	2	\N	1056
2148	1	10	2	f	84	\N	1059
2146	1	10	3	f	72	\N	1058
2150	1	10	4	f	139	\N	1060
2145	2	5	10	f	127	\N	1057
2144	1	10	4	f	73	\N	1057
2203	2	\N	\N	f	73	\N	1086
2204	1	\N	\N	f	92	\N	1087
2205	2	\N	\N	f	2	\N	1087
2206	1	\N	\N	f	71	\N	1088
2207	2	\N	\N	f	125	\N	1088
2208	1	\N	\N	f	78	\N	1089
2209	2	\N	\N	f	72	\N	1089
2210	1	\N	\N	f	76	\N	1090
2193	2	10	1	f	78	\N	1081
2211	2	\N	\N	f	124	\N	1090
2169	2	6	10	f	79	\N	1069
2182	1	10	6	f	116	\N	1076
2212	1	\N	\N	f	77	\N	1091
2186	1	5	10	f	115	\N	1078
2213	2	\N	\N	f	2	\N	1091
2163	2	7	10	f	80	\N	1066
2198	1	10	3	f	114	\N	1084
2214	1	\N	\N	f	92	\N	1092
2156	1	10	3	f	72	\N	1063
2171	2	10	4	f	127	\N	1070
2161	2	10	6	f	79	\N	1065
2170	1	7	10	f	139	\N	1070
2215	2	\N	\N	f	125	\N	1092
2183	2	10	3	f	76	\N	1076
2196	1	5	10	f	115	\N	1083
2216	1	\N	\N	f	71	\N	1093
2167	2	4	10	f	91	\N	1068
2147	2	10	5	f	80	\N	1058
2217	2	\N	\N	f	72	\N	1093
2164	1	1	10	f	73	\N	1067
2152	1	3	10	f	2	\N	1061
2157	2	10	4	f	87	\N	1063
2181	2	2	10	f	71	\N	1075
2184	1	7	10	f	120	\N	1077
2218	1	\N	\N	f	78	\N	1094
2158	1	10	5	f	84	\N	1064
2168	1	6	10	f	84	\N	1069
2165	2	10	2	f	87	\N	1067
2162	1	7	10	f	2	\N	1066
2154	1	10	4	f	73	\N	1062
2155	2	10	4	f	80	\N	1062
2159	2	6	10	f	91	\N	1064
2166	1	10	6	f	72	\N	1068
2153	2	6	10	f	127	\N	1061
2160	1	10	3	f	139	\N	1065
2195	2	10	7	f	77	\N	1082
2151	2	10	6	f	91	\N	1060
2219	2	\N	\N	f	124	\N	1094
2220	1	\N	\N	f	76	\N	1095
2221	2	\N	\N	f	73	\N	1095
2222	1	\N	\N	f	77	\N	1096
2223	2	\N	\N	f	125	\N	1096
2224	1	\N	\N	f	92	\N	1097
2225	2	\N	\N	f	72	\N	1097
2226	1	\N	\N	f	71	\N	1098
2227	2	\N	\N	f	124	\N	1098
2228	1	\N	\N	f	78	\N	1099
2229	2	\N	\N	f	73	\N	1099
2230	1	\N	\N	f	76	\N	1100
2231	2	\N	\N	f	2	\N	1100
2176	1	10	7	f	115	\N	1073
2232	1	\N	\N	f	138	\N	1101
2194	1	10	7	f	120	\N	1082
2178	1	6	10	f	114	\N	1074
2197	2	7	10	f	71	\N	1083
2192	1	10	0	f	116	\N	1081
2174	1	5	10	f	120	\N	1072
2233	2	\N	\N	f	43	\N	1101
2180	1	4	10	f	117	\N	1075
2177	2	10	6	f	78	\N	1073
2234	1	\N	\N	f	56	\N	1102
2179	2	10	6	f	77	\N	1074
2200	1	4	10	f	117	\N	1085
2199	2	5	10	f	92	\N	1084
2185	2	10	3	f	78	\N	1077
2172	1	10	7	f	116	\N	1071
2201	2	10	5	f	76	\N	1085
2173	2	2	10	f	92	\N	1071
2235	2	\N	\N	f	44	\N	1102
2175	2	10	5	f	76	\N	1072
2188	1	6	10	f	114	\N	1079
2236	1	\N	\N	f	52	\N	1103
2190	1	0	10	f	117	\N	1080
2191	2	1	10	f	92	\N	1080
2237	2	\N	\N	f	3	\N	1103
2189	2	2	10	f	71	\N	1079
2187	2	10	7	f	77	\N	1078
2202	1	\N	\N	f	77	\N	1086
2238	1	\N	\N	f	131	\N	1104
2239	2	\N	\N	f	41	\N	1104
2240	1	\N	\N	f	134	\N	1105
2241	2	\N	\N	f	42	\N	1105
2242	1	\N	\N	f	56	\N	1106
2243	2	\N	\N	f	43	\N	1106
2244	1	\N	\N	f	52	\N	1107
2245	2	\N	\N	f	44	\N	1107
2246	1	\N	\N	f	131	\N	1108
2247	2	\N	\N	f	3	\N	1108
2248	1	\N	\N	f	134	\N	1109
2249	2	\N	\N	f	41	\N	1109
2250	1	\N	\N	f	138	\N	1110
2251	2	\N	\N	f	42	\N	1110
2252	1	\N	\N	f	52	\N	1111
2253	2	\N	\N	f	43	\N	1111
2254	1	\N	\N	f	131	\N	1112
2255	2	\N	\N	f	44	\N	1112
2256	1	\N	\N	f	134	\N	1113
2257	2	\N	\N	f	3	\N	1113
2258	1	\N	\N	f	138	\N	1114
2259	2	\N	\N	f	41	\N	1114
2260	1	\N	\N	f	56	\N	1115
2261	2	\N	\N	f	42	\N	1115
2262	1	\N	\N	f	120	\N	1116
2263	2	\N	\N	f	80	\N	1116
2264	1	\N	\N	f	114	\N	1117
2265	2	\N	\N	f	127	\N	1117
2266	1	\N	\N	f	116	\N	1118
2267	2	\N	\N	f	79	\N	1118
2268	1	\N	\N	f	117	\N	1119
2269	2	\N	\N	f	83	\N	1119
2270	1	\N	\N	f	115	\N	1120
2271	2	\N	\N	f	87	\N	1120
2272	1	\N	\N	f	114	\N	1121
2273	2	\N	\N	f	80	\N	1121
2274	1	\N	\N	f	116	\N	1122
2275	2	\N	\N	f	127	\N	1122
2276	1	\N	\N	f	117	\N	1123
2277	2	\N	\N	f	79	\N	1123
2278	1	\N	\N	f	115	\N	1124
2279	2	\N	\N	f	83	\N	1124
2280	1	\N	\N	f	120	\N	1125
2281	2	\N	\N	f	87	\N	1125
2282	1	\N	\N	f	116	\N	1126
2283	2	\N	\N	f	80	\N	1126
2284	1	\N	\N	f	117	\N	1127
2285	2	\N	\N	f	127	\N	1127
2286	1	\N	\N	f	115	\N	1128
2287	2	\N	\N	f	79	\N	1128
2288	1	\N	\N	f	120	\N	1129
2289	2	\N	\N	f	83	\N	1129
2290	1	\N	\N	f	114	\N	1130
2291	2	\N	\N	f	87	\N	1130
\.


--
-- Name: recording_frame_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('recording_frame_id_seq', 2291, true);


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
1637	2	81	80	107
1621	4	84	52	106
1645	4	81	79	107
1644	3	81	79	107
1666	1	47	78	108
1689	6	70	77	108
1670	1	49	92	108
1671	2	49	92	108
1669	2	48	77	108
1665	2	46	76	108
1667	2	47	78	108
1663	2	70	5	108
1664	1	46	76	108
1668	1	48	77	108
1676	3	48	78	108
1673	4	46	5	108
1679	4	49	77	108
1681	4	70	92	108
1677	4	48	78	108
1672	3	46	5	108
1675	4	47	76	108
1674	3	47	76	108
1678	3	49	77	108
1685	6	48	76	108
1683	6	47	5	108
1688	5	70	77	108
1687	6	49	78	108
1686	5	49	78	108
1690	5	46	92	108
1680	3	70	92	108
1691	6	46	92	108
1684	5	48	76	108
1682	5	47	5	108
1534	5	73	70	102
1624	5	75	55	106
1662	1	70	5	108
1625	6	75	55	106
1627	6	73	54	106
1626	5	73	54	106
1623	6	2	53	106
1630	5	72	52	106
1628	5	84	57	106
1629	6	84	57	106
1631	6	72	52	106
1784	1	69	79	111
1765	4	78	84	112
1756	1	78	2	112
1754	1	77	84	112
1755	2	77	84	112
1782	1	64	109	111
1761	2	71	74	112
1763	4	77	104	112
1727	2	47	43	109
1710	3	7	55	110
1695	2	6	58	110
1698	1	89	53	110
1743	6	47	42	109
1700	1	90	55	110
1798	3	107	1	111
1711	4	7	55	110
1799	4	107	1	111
1735	4	47	44	109
1713	6	81	57	110
1717	6	90	54	110
1707	4	89	54	110
1694	1	6	58	110
1716	5	90	54	110
1708	3	90	53	110
1705	4	81	58	110
1693	2	7	57	110
1719	6	7	53	110
1753	2	76	104	112
1702	3	6	57	110
1699	2	89	53	110
1721	6	6	55	110
1720	5	6	55	110
1692	1	7	57	110
1706	3	89	54	110
1712	5	81	57	110
1769	4	71	75	112
1714	5	89	58	110
1709	4	90	53	110
1718	5	7	53	110
1696	1	81	54	110
1697	2	81	54	110
1715	6	89	58	110
1703	4	6	57	110
1701	2	90	55	110
1704	3	81	58	110
1809	6	64	1	111
1803	6	61	109	111
1731	2	46	41	109
1730	1	46	41	109
1734	3	47	44	109
1804	5	66	79	111
1741	4	49	41	109
1746	5	46	43	109
1745	6	48	44	109
1729	2	48	3	109
1793	4	69	109	111
1751	6	70	41	109
1747	6	46	43	109
1736	3	48	43	109
1732	3	70	42	109
1762	3	77	104	112
1757	2	78	2	112
1749	6	49	3	109
1728	1	48	3	109
1744	5	48	44	109
1760	1	71	74	112
1726	1	47	43	109
1739	4	46	3	109
1725	2	70	44	109
1724	1	70	44	109
1748	5	49	3	109
1722	1	49	42	109
1723	2	49	42	109
1740	3	49	41	109
1750	5	70	41	109
1742	5	47	42	109
1733	4	70	42	109
1738	3	46	3	109
1737	4	48	43	109
1806	5	107	80	111
1770	3	76	74	112
1771	4	76	74	112
1797	4	66	80	111
1796	3	66	80	111
1766	3	5	2	112
1800	3	64	87	111
1801	4	64	87	111
1795	4	61	79	111
1752	1	76	104	112
1759	2	5	75	112
1767	4	5	2	112
1768	3	71	75	112
1764	3	78	84	112
1758	1	5	75	112
1794	3	61	79	111
1807	6	107	80	111
1802	5	61	109	111
1774	5	5	84	112
1772	5	78	104	112
1808	5	64	1	111
1777	6	71	2	112
1780	5	77	74	112
1773	6	78	104	112
1778	5	76	75	112
1776	5	71	2	112
1779	6	76	75	112
1775	6	5	84	112
1781	6	77	74	112
1805	6	66	79	111
1790	1	107	87	111
1788	1	66	1	111
1792	3	69	109	111
1810	5	69	87	111
1811	6	69	87	111
1783	2	64	109	111
1785	2	69	79	111
1787	2	61	80	111
1791	2	107	87	111
1789	2	66	1	111
1786	1	61	80	111
1822	3	44	116	113
1813	2	42	116	113
1812	1	42	116	113
1815	2	44	114	113
1816	1	43	115	113
1817	2	43	115	113
1819	2	3	117	113
1821	2	41	120	113
1820	1	41	120	113
1818	1	3	117	113
1835	6	3	114	113
1827	4	3	115	113
1838	5	42	117	113
1828	3	41	117	113
1825	4	43	114	113
1823	4	44	116	113
1824	3	43	114	113
1837	6	41	115	113
1830	3	42	120	113
1826	3	3	115	113
1836	5	41	115	113
1831	4	42	120	113
1839	6	42	117	113
1834	5	3	114	113
1829	4	41	117	113
1832	5	43	116	113
1848	1	105	80	114
1842	1	63	79	114
1814	1	44	114	113
1851	2	67	87	114
1850	1	67	87	114
1843	2	63	79	114
1841	6	44	120	113
1840	5	44	120	113
1847	2	69	83	114
1833	6	43	116	113
1846	1	69	83	114
1853	4	62	79	114
1844	1	62	127	114
1849	2	105	80	114
1852	3	62	79	114
1845	2	62	127	114
1862	5	69	79	114
1861	4	63	87	114
1959	6	76	81	115
1951	4	76	93	115
1950	3	76	93	115
1857	4	105	83	114
1956	5	78	6	115
1954	5	71	123	115
1911	2	72	134	116
1910	1	72	134	116
1869	6	63	80	114
1870	5	62	87	114
1907	2	124	138	116
1867	6	67	83	114
1915	4	59	52	116
1916	3	73	138	116
1913	4	125	56	116
1912	3	125	56	116
1917	4	73	138	116
1921	4	2	134	116
1919	4	72	133	116
1920	3	2	134	116
1914	3	124	52	116
1918	3	72	133	116
1930	5	125	134	116
1928	5	2	133	116
1931	6	125	134	116
1922	5	124	56	116
1923	6	124	56	116
1871	6	62	87	114
1929	6	2	133	116
1924	5	73	52	116
1927	6	72	138	116
1904	1	125	52	116
1926	5	72	138	116
1864	5	105	127	114
1925	6	73	52	116
1863	6	69	79	114
1955	6	71	123	115
1953	6	92	7	115
1944	3	92	123	115
1936	1	92	6	115
1937	2	92	6	115
1943	4	77	7	115
1941	2	78	93	115
1952	5	92	7	115
1945	4	92	123	115
1949	4	78	81	115
1855	4	69	127	114
1866	5	67	83	114
1865	6	105	127	114
1868	5	63	80	114
1961	6	77	93	115
1908	1	73	133	116
1903	2	2	56	116
1902	1	2	56	116
1909	2	73	133	116
1906	1	124	138	116
1854	3	69	127	114
1905	2	125	52	116
1932	1	76	7	115
1933	2	76	7	115
1934	1	77	123	115
1935	2	77	123	115
1938	1	71	81	115
1859	4	67	80	114
1939	2	71	81	115
1960	5	77	93	115
1940	1	78	93	115
1948	3	78	81	115
1860	3	63	87	114
1957	6	78	6	115
1947	4	71	6	115
1942	3	77	7	115
1946	3	71	6	115
1858	3	67	80	114
1958	5	76	81	115
1856	3	105	83	114
1971	2	52	5	117
1979	4	52	92	117
1965	2	54	71	117
1969	2	138	92	117
1982	5	143	77	117
1963	2	56	77	117
1983	6	143	77	117
1986	5	52	103	117
1987	6	52	103	117
1984	5	138	71	117
1990	5	54	5	117
1988	5	56	92	117
1975	4	143	71	117
1991	6	54	5	117
1964	1	54	71	117
1985	6	138	71	117
1968	1	138	92	117
1970	1	52	5	117
1989	6	56	92	117
1980	3	56	5	117
1976	3	138	103	117
1974	3	143	71	117
1972	3	54	77	117
1981	4	56	5	117
1978	3	52	92	117
1962	1	56	77	117
1966	1	143	103	117
1977	4	138	103	117
1967	2	143	103	117
1973	4	54	77	117
2004	3	120	113	120
1997	2	120	129	120
2020	5	122	66	120
2003	4	122	69	120
2001	2	114	66	120
2000	1	114	66	120
1996	1	120	129	120
2007	4	117	129	120
2012	5	120	69	120
1992	1	116	69	120
1994	1	122	113	120
2002	3	122	69	120
1995	2	122	113	120
2006	3	117	129	120
1993	2	116	69	120
2008	3	114	64	120
2010	3	116	66	120
2009	4	114	64	120
2011	4	116	66	120
2023	2	127	42	119
2019	6	116	64	120
2018	5	116	64	120
2017	6	114	129	120
2015	6	117	113	120
2014	5	117	113	120
2025	2	79	44	119
2021	6	122	66	120
2013	6	120	69	120
1998	1	117	64	120
2024	1	79	44	119
2016	5	114	129	120
2005	4	120	113	120
1999	2	117	64	120
2038	3	83	126	119
2040	3	127	41	119
2035	4	80	44	119
2031	2	83	41	119
2027	2	80	43	119
2034	3	80	44	119
2033	4	79	42	119
2037	4	109	43	119
2039	4	83	126	119
2022	1	127	42	119
2032	3	79	42	119
2026	1	80	43	119
2029	2	109	126	119
2028	1	109	126	119
2036	3	109	43	119
2030	1	83	41	119
2108	5	7	124	118
2103	6	93	2	118
2104	5	123	139	118
2095	4	93	139	118
2100	3	7	73	118
2106	5	6	125	118
2065	4	69	57	121
2051	6	79	41	119
2076	5	62	132	121
2105	6	123	139	118
2045	6	109	44	119
2046	5	83	43	119
2063	4	105	55	121
2041	4	127	41	119
2047	6	83	43	119
2044	5	109	44	119
2050	5	79	41	119
2049	6	127	126	119
2053	2	113	55	121
2042	5	80	42	119
2048	5	127	126	119
2079	6	113	144	121
2043	6	80	42	119
2126	3	126	123	122
2137	6	45	123	122
2142	1	79	2	123
2123	4	44	7	122
2156	3	87	72	123
2146	1	80	72	123
2112	1	3	7	122
2150	1	91	139	123
2139	6	3	6	122
2127	4	126	123	122
2132	5	43	7	122
2161	4	79	139	123
2113	2	3	7	122
2136	5	45	123	122
2072	5	69	55	121
2116	1	43	123	122
2144	1	127	73	123
2074	5	67	57	121
2114	1	44	112	122
2064	3	69	57	121
2058	1	67	144	121
2128	3	45	6	122
2130	3	3	81	122
2069	4	62	144	121
2124	3	43	112	122
2118	1	126	6	122
2155	4	80	73	123
2056	1	69	132	121
2101	4	7	73	118
2062	3	105	55	121
2082	1	7	2	118
2125	4	43	112	122
2096	3	123	125	118
2078	5	113	144	121
2107	6	6	125	118
2081	6	105	131	121
2091	2	6	73	118
2073	6	69	55	121
2061	2	62	131	121
2054	1	105	57	121
2093	4	81	2	118
2089	2	123	124	118
2052	1	113	55	121
2164	5	87	73	123
2066	3	67	132	121
2068	3	62	144	121
2087	2	93	125	118
2099	4	6	124	118
2110	5	81	73	118
2111	6	81	73	118
2071	4	113	131	121
2119	2	126	6	122
2094	3	93	139	118
2098	3	6	124	118
2088	1	123	124	118
2092	3	81	2	118
2102	5	93	2	118
2059	2	67	144	121
2090	1	6	73	118
2097	4	123	125	118
2085	2	81	139	118
2084	1	81	139	118
2109	6	7	124	118
2086	1	93	125	118
2083	2	7	2	118
2115	2	44	112	122
2067	4	67	132	121
2070	3	113	131	121
2080	5	105	131	121
2075	6	67	57	121
2077	6	62	132	121
2057	2	69	132	121
2060	1	62	131	121
2055	2	105	57	121
2151	2	91	139	123
2138	5	3	6	122
2134	5	126	112	122
2170	5	127	139	123
2129	4	45	6	122
2141	6	44	81	122
2148	1	87	84	123
2117	2	43	123	122
2165	6	87	73	123
2160	3	79	139	123
2168	5	79	84	123
2133	6	43	7	122
2169	6	79	84	123
2140	5	44	81	122
2157	4	87	72	123
2131	4	3	81	122
2122	3	44	7	122
2121	2	45	81	122
2135	6	126	112	122
2120	1	45	81	122
2154	3	80	73	123
2166	5	91	72	123
2149	2	87	84	123
2167	6	91	72	123
2143	2	79	2	123
2145	2	127	73	123
2147	2	80	72	123
2171	6	127	139	123
2163	6	80	2	123
2158	3	91	84	123
2159	4	91	84	123
2152	3	127	2	123
2153	4	127	2	123
2162	5	80	2	123
2184	3	78	120	124
2179	2	77	114	124
2176	1	78	115	124
2183	4	76	116	124
2181	2	71	117	124
2177	2	78	115	124
2175	2	76	120	124
2178	1	77	114	124
2180	1	71	117	124
2172	1	92	116	124
2182	3	76	116	124
2173	2	92	116	124
2174	1	76	120	124
2235	2	44	56	127
2236	1	3	52	127
2237	2	3	52	127
2238	1	41	131	127
2239	2	41	131	127
2240	1	42	134	127
2241	2	42	134	127
2242	3	43	56	127
2243	4	43	56	127
2244	3	44	52	127
2245	4	44	52	127
2246	3	3	131	127
2193	6	78	116	124
2247	4	3	131	127
2186	3	77	115	124
2198	5	92	114	124
2248	3	41	134	127
2196	5	71	115	124
2249	4	41	134	127
2250	3	42	138	127
2195	6	77	120	124
2194	5	77	120	124
2251	4	42	138	127
2197	6	71	115	124
2192	5	78	116	124
2252	5	43	52	127
2200	5	76	117	124
2199	6	92	114	124
2185	4	78	120	124
2201	6	76	117	124
2253	6	43	52	127
2188	3	71	114	124
2254	5	44	131	127
2190	3	92	117	124
2191	4	92	117	124
2255	6	44	131	127
2189	4	71	114	124
2187	4	77	115	124
2202	1	73	77	125
2203	2	73	77	125
2204	1	2	92	125
2205	2	2	92	125
2206	1	125	71	125
2207	2	125	71	125
2208	1	72	78	125
2209	2	72	78	125
2210	1	124	76	125
2211	2	124	76	125
2212	3	2	77	125
2213	4	2	77	125
2214	3	125	92	125
2215	4	125	92	125
2216	3	72	71	125
2217	4	72	71	125
2218	3	124	78	125
2219	4	124	78	125
2220	3	73	76	125
2221	4	73	76	125
2222	5	125	77	125
2223	6	125	77	125
2224	5	72	92	125
2225	6	72	92	125
2226	5	124	71	125
2227	6	124	71	125
2228	5	73	78	125
2229	6	73	78	125
2230	5	2	76	125
2231	6	2	76	125
2232	1	43	138	127
2233	2	43	138	127
2234	1	44	56	127
2256	5	3	134	127
2257	6	3	134	127
2258	5	41	138	127
2259	6	41	138	127
2260	5	42	56	127
2261	6	42	56	127
2262	1	120	80	126
2263	2	120	80	126
2264	1	114	127	126
2265	2	114	127	126
2266	1	116	79	126
2267	2	116	79	126
2268	1	117	83	126
2269	2	117	83	126
2270	1	115	87	126
2271	2	115	87	126
2272	3	114	80	126
2273	4	114	80	126
2274	3	116	127	126
2275	4	116	127	126
2276	3	117	79	126
2277	4	117	79	126
2278	3	115	83	126
2279	4	115	83	126
2280	3	120	87	126
2281	4	120	87	126
2282	5	116	80	126
2283	6	116	80	126
2284	5	117	127	126
2285	6	117	127	126
2286	5	115	79	126
2287	6	115	79	126
2288	5	120	83	126
2289	6	120	83	126
2290	5	114	87	126
2291	6	114	87	126
\.


--
-- Data for Name: recording_leaguematch; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY recording_leaguematch (id, venue, match_date, number_frames, table_size, is_completed, is_submitted, pool_type, score_type, home_score, away_score, home_points_raw, away_points_raw, legs, handicap, away_id, home_id, week_id, winner_id, is_initialized, _away_ordered_players, _home_ordered_players, break_type, season_id, league_id, away_approved, home_approved) FROM stdin;
66	Billidart	2017-03-22 20:00:00+08	0	9	t	t	8-Ball	P	5	2	225	212	6	0	6	7	3	7	t	53_56_106_55_52	6_7_81_89_90	A	1	1	\N	\N
67	Racks	2017-03-22 20:00:00+08	0	9	t	t	8-Ball	P	5	2	270	232	6	5	1	8	3	8	t	79_91_80_1_83	69_62_61_66_64	A	1	1	\N	\N
68	Racks	2017-03-21 20:00:00+08	0	9	t	t	8-Ball	P	5	2	258	224	6	5	5	4	3	4	t	82_77_78_76_5	49_4_47_46_70	A	1	1	\N	\N
69	Racks	2017-03-28 20:00:00+08	0	9	t	t	8-Ball	P	2	5	216	249	6	3	4	6	4	4	t	70_46_47_4_49	52_58_54_55_57	A	1	1	\N	\N
70	Racks	2017-03-29 20:00:00+08	0	9	t	t	8-Ball	P	6	1	255	193	6	0	7	3	4	3	t	7_93_81_6_90	42_41_43_40_45	A	1	1	\N	\N
71	Billidart	2017-03-29 20:00:00+08	0	9	t	t	8-Ball	P	6	1	256	210	6	-5	8	5	4	5	t	66_105_67_107_69	76_71_78_5_77	A	1	1	\N	\N
76	Racks	2017-04-05 20:00:00+08	0	9	t	t	8-Ball	P	4	3	234	235	6	6	5	1	5	1	t	77_76_78_71_5	79_97_80_87_1	A	1	1	\N	\N
73	Billidart	2017-04-05 20:00:00+08	0	9	t	t	8-Ball	P	2	5	219	265	6	7	3	6	5	3	t	3_41_43_45_40	53_59_54_57_55	A	1	1	\N	\N
74	Racks	2017-04-04 20:00:00+08	0	9	t	t	8-Ball	P	7	0	261	164	6	-1	4	2	5	2	t	110_49_47_46_4	84_73_2_74_72	A	1	1	\N	\N
84	Billidart	2017-04-19 20:00:00+08	0	9	t	t	8-Ball	P	0	7	204	263	6	3	6	1	7	6	t	57_53_60_58_59	83_91_108_79_1	A	1	1	\N	\N
77	Billidart	2017-04-12 20:00:00+08	0	9	t	t	8-Ball	P	7	0	244	195	6	1	4	7	6	7	t	48_70_47_46_4	7_89_81_6_90	A	1	1	\N	\N
78	Racks	2017-04-11 20:00:00+08	0	9	t	t	8-Ball	P	2	5	227	248	6	-3	8	6	6	8	t	66_61_67_69_105	58_56_54_55_53	A	1	1	\N	\N
81	Billidart	2017-04-19 20:00:00+08	0	9	t	t	8-Ball	P	1	6	204	247	6	2	3	5	7	3	t	3_41_43_40_45	77_76_78_71_5	A	1	1	\N	\N
83	Racks	2017-04-19 20:00:00+08	0	9	t	t	8-Ball	P	5	2	243	238	6	-5	7	2	7	2	t	6_93_81_111_90	74_104_2_72_84	A	1	1	\N	\N
82	Racks	2017-04-18 20:00:00+08	0	9	t	t	8-Ball	P	5	2	248	187	6	2	8	4	7	4	t	62_65_67_69_107	48_46_47_4_49	A	1	1	\N	\N
87	Billidart	2017-04-26 20:00:00+08	0	9	t	t	8-Ball	P	7	0	271	229	6	-7	8	2	8	2	t	66_105_61_69_65	84_72_2_104_73	A	1	1	\N	\N
88	Racks	2017-04-26 20:00:00+08	0	9	t	t	8-Ball	P	2	5	196	263	6	-8	6	3	8	6	t	55_58_54_59_57	42_41_43_40_45	A	1	1	\N	\N
85	Racks	2017-04-25 20:00:00+08	0	9	t	t	8-Ball	P	4	3	234	224	6	1	1	4	8	4	t	109_1_80_79_87	46_49_47_70_110	A	1	1	\N	\N
86	Billidart	2017-04-26 20:00:00+08	0	9	t	t	8-Ball	P	0	7	194	273	6	1	5	7	8	5	t	76_77_78_71_5	6_7_81_93_90	A	1	1	\N	\N
91	Racks	2017-05-02 20:00:00+08	0	9	t	t	8-Ball	P	6	1	279	223	6	-8	1	2	9	2	t	96_1_80_97_79	84_73_2_75_74	A	1	1	\N	\N
92	Racks	2017-05-03 20:00:00+08	0	9	t	t	8-Ball	P	1	6	220	262	6	5	5	8	9	5	t	71_82_78_92_5	69_62_61_107_105	A	1	1	\N	\N
89	Billidart	2017-05-03 20:00:00+08	0	9	t	t	8-Ball	P	2	5	213	237	6	3	3	7	9	3	t	42_3_43_44_41	112_90_81_93_7	A	1	1	\N	\N
95	Racks	2017-05-10 20:00:00+08	0	9	t	t	8-Ball	P	5	2	232	219	6	0	2	3	10	3	t	75_84_2_72_74	41_42_43_44_40	A	1	1	\N	\N
96	Billidart	2017-05-10 20:00:00+08	0	9	t	t	8-Ball	P	4	3	246	237	6	-8	1	5	10	5	t	109_83_80_97_87	5_71_78_77_76	A	1	1	\N	\N
93	Racks	2017-05-09 20:00:00+08	0	9	t	t	8-Ball	P	2	5	223	241	6	1	7	4	10	7	t	7_89_81_6_90	110_49_47_46_70	A	1	1	\N	\N
94	Billidart	2017-05-10 20:00:00+08	0	9	t	t	8-Ball	P	4	3	238	222	6	-1	6	8	10	8	t	59_53_54_57_55	69_65_67_63_113	A	1	1	\N	\N
98	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	5	2	217	179	6	-1	4	8	11	8	t	110_48_47_49_70	69_63_61_105_113	A	1	1	\N	\N
97	Racks	2017-05-16 20:00:00+08	0	9	t	t	8-Ball	P	5	2	219	216	6	2	5	3	11	3	t	82_71_78_76_5	42_3_43_41_45	A	1	1	\N	\N
99	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	4	3	237	221	6	4	2	7	11	7	t	73_84_2_75_74	7_89_81_6_90	A	1	1	\N	\N
100	Racks	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	4	3	235	222	6	-1	1	6	11	6	t	108_79_80_91_97	53_55_54_57_56	A	1	1	\N	\N
101	Racks	2017-05-23 20:00:00+08	0	9	t	t	8-Ball	P	7	0	278	190	6	-2	8	7	12	7	t	105_63_67_69_65	89_6_81_7_90	A	1	1	\N	\N
62	Racks	2017-03-14 20:00:00+08	30	9	t	t	8-Ball	P	1	6	210	262	6	-5	7	5	2	7	t	6_93_81_89_7	88_76_103_71_92	A	1	1	\N	\N
104	Billidart	2017-05-24 20:00:00+08	0	9	t	t	8-Ball	P	2	5	221	273	6	6	3	1	12	3	t	44_3_43_41_40	83_80_108_1_79	A	1	1	\N	\N
103	Racks	2017-05-24 20:00:00+08	0	9	t	t	8-Ball	P	6	1	251	210	6	-5	6	5	12	5	t	53_55_54_100_52	76_92_78_5_71	A	1	1	\N	\N
102	Billidart	2017-05-24 20:00:00+08	0	9	t	t	8-Ball	P	3	4	238	251	6	5	2	4	12	2	t	72_75_2_73_84	46_70_47_110_49	A	1	1	\N	\N
58	Racks	2017-03-01 20:00:00+08	30	9	t	t	8-Ball	P	1	6	180	259	6	0	2	8	1	2	t	74_72_2_73_84	64_63_67_61_69	A	1	1	\N	\N
63	Billidart	2017-03-15 20:00:00+08	30	9	t	t	8-Ball	P	6	1	256	214	6	-5	8	3	2	3	t	62_105_61_69_63	42_44_43_41_40	A	1	1	\N	\N
90	Billidart	2017-05-03 20:00:00+08	0	9	t	t	8-Ball	P	4	3	231	226	6	-1	6	4	9	4	t	53_55_54_52_57	46_110_47_70_49	A	1	1	\N	\N
79	Billidart	2017-04-12 20:00:00+08	0	9	t	t	8-Ball	P	2	5	223	241	6	1	2	5	6	2	t	73_72_2_84_74	77_76_78_71_5	A	1	1	\N	\N
75	Billidart	2017-04-05 20:00:00+08	0	9	t	t	8-Ball	P	2	5	215	244	6	3	7	8	5	7	t	7_6_81_89_90	69_66_61_107_64	A	1	1	\N	\N
59	Billidart	2017-03-08 20:00:00+08	30	9	t	t	8-Ball	P	3	4	229	242	6	0	1	7	1	1	t	1_79_80_91_87	6_89_81_7_90	A	1	1	\N	\N
72	Billidart	2017-03-29 20:00:00+08	0	9	t	t	8-Ball	P	0	7	168	278	6	-2	2	1	4	2	t	73_72_2_104_74	83_109_108_79_1	A	1	1	\N	\N
64	Racks	2017-03-16 20:00:00+08	30	9	t	t	8-Ball	P	0	7	246	286	6	-15	6	2	2	6	t	56_53_54_55_58	74_104_2_73_84	A	1	1	\N	\N
112	Racks	2017-06-07 20:00:00+08	0	9	t	t	8-Ball	P	2	5	214	241	6	-2	5	2	14	5	t	76_77_78_5_71	104_84_2_75_74	A	1	1	\N	\N
65	Billidart	2017-03-22 20:00:00+08	0	9	t	t	8-Ball	P	2	5	204	236	6	0	3	2	3	3	t	41_44_43_40_45	104_75_2_84_73	A	1	1	\N	\N
61	Billidart	2017-03-15 20:00:00+08	30	9	t	t	8-Ball	P	0	7	208	300	6	-7	4	1	2	4	t	70_46_47_4_48	1_83_80_97_79	A	1	1	\N	\N
109	Billidart	2017-06-07 20:00:00+08	0	9	t	t	8-Ball	P	5	2	252	215	6	-4	4	3	14	3	t	49_70_47_48_46	42_44_43_3_41	A	1	1	\N	\N
111	Billidart	2017-06-07 20:00:00+08	0	9	t	t	8-Ball	P	4	3	230	222	6	-2	8	1	14	1	t	64_69_61_66_107	109_79_80_1_87	A	1	1	\N	\N
107	Racks	2017-05-31 20:00:00+08	0	9	t	t	8-Ball	P	2	5	207	240	6	3	7	1	13	7	t	7_90_81_6_93	109_79_80_1_83	A	1	1	\N	\N
141	Racks	2017-10-24 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	8	10	22	\N	f	\N	\N	A	2	1	\N	\N
57	Racks	2017-02-28 20:00:00+08	30	9	t	t	8-Ball	P	2	5	191	246	6	0	3	4	1	3	t	42_3_43_41_40	70_49_47_4_46	A	1	1	\N	\N
60	Billidart	2017-03-01 20:00:00+08	30	9	t	t	8-Ball	P	0	7	164	262	6	0	5	6	1	5	t	92_76_78_88_71	53_100_54_55_58	A	1	1	\N	\N
80	Racks	2017-04-12 20:00:00+08	0	9	t	t	8-Ball	P	6	1	258	202	6	-5	1	3	6	3	t	109_96_80_1_79	42_44_43_41_40	A	1	1	\N	\N
108	Billidart	2017-05-31 20:00:00+08	0	9	t	t	8-Ball	P	4	3	243	230	6	-4	4	5	13	5	t	70_46_47_48_49	5_76_78_77_92	A	1	1	\N	\N
106	Billidart	2017-05-31 20:00:00+08	0	9	t	t	8-Ball	P	1	6	211	260	6	6	2	6	13	2	t	84_72_2_75_73	53_55_54_57_52	A	1	1	\N	\N
105	Racks	2017-05-30 20:00:00+08	0	9	t	t	8-Ball	P	1	6	227	260	6	5	3	8	13	3	t	42_44_43_45_41	63_69_61_62_105	A	1	1	\N	\N
110	Racks	2017-06-06 20:00:00+08	0	9	t	t	8-Ball	P	4	3	242	228	6	4	7	6	14	6	t	7_6_81_89_90	57_58_54_53_55	A	1	1	\N	\N
114	Racks	2017-09-06 20:00:00+08	0	9	t	t	8-Ball	P	6	1	242	216	6	-2	8	1	15	1	t	63_62_69_105_67	79_127_83_80_87	A	2	1	\N	\N
115	Billidart	2017-09-06 20:00:00+08	0	9	t	t	8-Ball	P	5	2	241	231	6	4	5	7	15	7	t	76_77_92_71_78	7_123_6_81_93	A	2	1	\N	\N
116	Billidart	2017-09-06 20:00:00+08	0	9	t	t	8-Ball	P	1	6	214	268	6	-5	2	6	15	2	t	2_125_124_73_72	56_52_138_133_134	A	2	1	\N	\N
128	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	7	8	18	\N	f	\N	\N	A	2	1	\N	\N
129	Racks	2017-10-03 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	6	7	19	\N	f	\N	\N	A	2	1	\N	\N
130	Racks	2017-10-04 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	3	8	19	\N	f	\N	\N	A	2	1	\N	\N
131	Billidart	2017-10-04 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	5	1	19	\N	f	\N	\N	A	2	1	\N	\N
132	Billidart	2017-10-04 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	2	10	19	\N	f	\N	\N	A	2	1	\N	\N
133	Racks	2017-10-10 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	7	1	20	\N	f	\N	\N	A	2	1	\N	\N
134	Racks	2017-10-11 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	10	6	20	\N	f	\N	\N	A	2	1	\N	\N
135	Billidart	2017-10-11 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	5	8	20	\N	f	\N	\N	A	2	1	\N	\N
136	Billidart	2017-10-11 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	2	3	20	\N	f	\N	\N	A	2	1	\N	\N
137	Racks	2017-10-17 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	8	2	21	\N	f	\N	\N	A	2	1	\N	\N
138	Racks	2017-10-18 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	3	5	21	\N	f	\N	\N	A	2	1	\N	\N
139	Billidart	2017-10-18 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	7	10	21	\N	f	\N	\N	A	2	1	\N	\N
140	Billidart	2017-10-18 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	1	6	21	\N	f	\N	\N	A	2	1	\N	\N
142	Racks	2017-10-25 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	6	1	22	\N	f	\N	\N	A	2	1	\N	\N
143	Billidart	2017-10-25 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	5	2	22	\N	f	\N	\N	A	2	1	\N	\N
144	Billidart	2017-10-25 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	7	3	22	\N	f	\N	\N	A	2	1	\N	\N
145	Racks	2017-10-31 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	3	2	23	\N	f	\N	\N	A	2	1	\N	\N
146	Racks	2017-11-01 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	7	5	23	\N	f	\N	\N	A	2	1	\N	\N
147	Billidart	2017-11-01 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	1	10	23	\N	f	\N	\N	A	2	1	\N	\N
148	Billidart	2017-11-01 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	6	8	23	\N	f	\N	\N	A	2	1	\N	\N
149	Racks	2017-11-07 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	8	5	24	\N	f	\N	\N	A	2	1	\N	\N
150	Racks	2017-11-08 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	3	1	24	\N	f	\N	\N	A	2	1	\N	\N
151	Billidart	2017-11-08 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	6	10	24	\N	f	\N	\N	A	2	1	\N	\N
153	Racks	2017-11-14 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	10	7	25	\N	f	\N	\N	A	2	1	\N	\N
154	Racks	2017-11-15 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	6	2	25	\N	f	\N	\N	A	2	1	\N	\N
155	Billidart	2017-11-15 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	5	3	25	\N	f	\N	\N	A	2	1	\N	\N
156	Billidart	2017-11-15 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	1	8	25	\N	f	\N	\N	A	2	1	\N	\N
157	Racks	2017-11-21 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	1	5	26	\N	f	\N	\N	A	2	1	\N	\N
158	Racks	2017-11-22 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	10	2	26	\N	f	\N	\N	A	2	1	\N	\N
159	Billidart	2017-11-22 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	7	6	26	\N	f	\N	\N	A	2	1	\N	\N
160	Billidart	2017-11-22 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	8	3	26	\N	f	\N	\N	A	2	1	\N	\N
161	Racks	2017-11-28 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	3	6	27	\N	f	\N	\N	A	2	1	\N	\N
162	Racks	2017-11-29 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	10	5	27	\N	f	\N	\N	A	2	1	\N	\N
164	Billidart	2017-11-29 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	1	7	27	\N	f	\N	\N	A	2	1	\N	\N
165	Racks	2017-12-05 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	2	1	28	\N	f	\N	\N	A	2	1	\N	\N
166	Racks	2017-12-06 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	8	7	28	\N	f	\N	\N	A	2	1	\N	\N
167	Billidart	2017-12-06 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	10	3	28	\N	f	\N	\N	A	2	1	\N	\N
168	Billidart	2017-12-06 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	5	6	28	\N	f	\N	\N	A	2	1	\N	\N
113	Racks	2017-09-05 20:00:00+08	0	9	t	t	8-Ball	P	0	7	190	275	6	2	3	10	15	3	t	42_44_43_3_41	116_114_115_117_120	A	2	1	\N	\N
152	Billidart	2017-11-08 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	2	7	24	\N	f	\N	\N	A	2	1	\N	\N
121	Racks	2017-09-19 20:00:00+08	0	9	t	t	8-Ball	P	3	4	256	282	6	-12	8	6	17	8	t	113_105_69_67_62	55_57_132_144_131	A	2	1	\N	\N
122	Racks	2017-09-20 20:00:00+08	0	9	t	t	8-Ball	P	3	4	237	220	6	3	3	7	17	3	t	3_44_43_126_45	7_112_123_6_81	A	2	1	\N	\N
124	Billidart	2017-09-20 20:00:00+08	0	9	t	t	8-Ball	P	5	2	229	223	6	3	5	10	17	10	t	92_76_78_77_71	116_120_115_114_117	A	2	1	\N	\N
125	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	1	2	5	18	\N	t	73_2_125_72_124	77_92_71_78_76	A	2	1	\N	\N
127	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	-5	6	3	18	\N	t	138_56_52_131_134	43_44_3_41_42	A	2	1	\N	\N
163	Billidart	2017-11-29 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	0	2	8	27	\N	f	\N	\N	A	2	1	\N	\N
119	Billidart	2017-09-13 20:00:00+08	0	9	t	t	8-Ball	P	5	2	258	232	6	-7	1	3	16	3	t	127_79_80_109_83	42_44_43_126_41	A	2	1	\N	\N
117	Racks	2017-09-12 20:00:00+08	0	9	t	t	8-Ball	P	6	1	253	184	6	-2	6	5	16	5	t	56_54_143_138_52	77_71_103_92_5	A	2	1	2017-09-12 22:34:02.966724+08	\N
118	Racks	2017-09-13 20:00:00+08	0	9	t	t	8-Ball	P	5	2	237	235	6	-6	7	2	16	2	t	7_81_93_123_6	2_139_125_124_73	A	2	1	\N	\N
120	Billidart	2017-09-13 20:00:00+08	0	9	t	t	8-Ball	P	2	5	201	241	6	0	10	8	16	10	t	116_122_120_117_114	69_113_129_64_66	A	2	1	\N	\N
123	Billidart	2017-09-20 20:00:00+08	0	9	t	t	8-Ball	P	5	2	245	218	6	-4	1	2	17	2	t	79_127_80_87_91	2_73_72_84_139	A	2	1	\N	\N
126	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	0	0	6	2	10	1	18	\N	t	120_114_116_117_115	80_127_79_83_87	A	2	1	\N	\N
\.


--
-- Name: recording_leaguematch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('recording_leaguematch_id_seq', 168, true);


--
-- Data for Name: recording_match; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY recording_match (id, venue, match_date, number_frames, table_size, is_completed, is_submitted, pool_type, score_type, home_score, away_score, race_to, match_type, away_id, home_id, week_id, winner_id, is_initialized, break_type, season_id) FROM stdin;
92	Sun Mong	2017-03-12 16:30:00+08	13	9	t	t	8-Ball	F	6	7	7	I	102	101	\N	102	f	W	\N
93		2017-03-12 19:19:58+08	13	9	t	t	8-Ball	F	6	7	7	I	101	102	\N	101	f	W	\N
155	Sun Mong	2017-03-19 15:52:34+08	13	9	t	t	8-Ball	F	6	7	7	I	102	101	\N	102	f	W	\N
134	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	56	84	\N	84	f	A	1
80	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	91	7	\N	\N	f	A	1
51	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	84	69	\N	84	f	A	1
37	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	43	49	\N	43	f	A	1
102	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	89	103	\N	89	f	A	1
85	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	87	7	\N	7	f	A	1
40	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	42	46	\N	42	f	A	1
56	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	74	69	\N	\N	f	A	1
88	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	91	89	\N	89	f	A	1
89	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	87	81	\N	87	f	A	1
44	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	42	4	\N	4	f	A	1
60	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	74	61	\N	74	f	A	1
66	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	71	58	\N	71	f	A	1
101	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	81	76	\N	76	f	A	1
57	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	2	64	\N	2	f	A	1
95	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	6	88	\N	6	f	A	1
131	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	54	104	\N	104	f	A	1
49	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	2	67	\N	2	f	A	1
132	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	55	2	\N	2	f	A	1
84	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	91	81	\N	91	f	A	1
97	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	81	103	\N	81	f	A	1
98	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	89	71	\N	71	f	A	1
50	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	73	61	\N	73	f	A	1
68	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	78	100	\N	100	f	A	1
52	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	72	64	\N	\N	f	A	1
99	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	7	92	\N	92	f	A	1
72	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	78	53	\N	53	f	A	1
86	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	1	90	\N	1	f	A	1
87	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	80	6	\N	80	f	A	1
53	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	2	63	\N	63	f	A	1
76	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	76	58	\N	76	f	A	1
90	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	1	7	\N	1	f	A	1
65	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	88	55	\N	\N	f	A	1
116	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	47	83	\N	83	f	A	1
35	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	40	46	\N	\N	f	A	1
34	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	41	4	\N	41	f	A	1
38	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	41	47	\N	41	f	A	1
100	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	93	88	\N	93	f	A	1
36	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	3	70	\N	3	f	A	1
69	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	1	20	2	E	88	54	\N	88	f	A	1
71	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	14	12	2	E	92	58	\N	58	f	A	1
54	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	73	67	\N	\N	f	A	1
55	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	84	61	\N	84	f	A	1
74	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	71	54	\N	71	f	A	1
75	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	92	55	\N	92	f	A	1
58	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	73	63	\N	73	f	A	1
59	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	84	67	\N	84	f	A	1
63	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	76	100	\N	76	f	A	1
61	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	11	15	2	E	72	69	\N	72	f	A	1
78	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	79	89	\N	89	f	A	1
79	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	80	81	\N	80	f	A	1
67	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	76	53	\N	76	f	A	1
81	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	87	90	\N	87	f	A	1
83	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	80	89	\N	\N	f	A	1
39	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	40	4	\N	40	f	A	1
73	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	88	100	\N	88	f	A	1
41	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	43	70	\N	70	f	A	1
42	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	41	49	\N	41	f	A	1
43	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	40	47	\N	40	f	A	1
62	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	92	53	\N	53	f	A	1
45	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	15	14	2	E	3	46	\N	46	f	A	1
31	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	42	70	\N	70	f	A	1
33	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	43	47	\N	47	f	A	1
48	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	72	63	\N	63	f	A	1
122	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	48	80	\N	\N	f	A	1
124	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	46	79	\N	46	f	A	1
103	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	7	71	\N	7	f	A	1
104	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	6	92	\N	6	f	A	1
106	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	89	76	\N	76	f	A	1
107	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	7	103	\N	7	f	A	1
164	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	5	46	\N	46	f	A	1
108	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	6	71	\N	\N	f	A	1
120	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	47	1	\N	1	f	A	1
121	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	4	83	\N	4	f	A	1
109	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	93	92	\N	92	f	A	1
140	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	62	42	\N	62	f	A	1
161	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	77	49	\N	77	f	A	1
162	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	78	4	\N	4	f	A	1
143	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	69	41	\N	69	f	A	1
145	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	105	42	\N	\N	f	A	1
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
141	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	105	44	\N	44	f	A	1
180	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	41	73	\N	73	f	A	1
181	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	43	104	\N	104	f	A	1
182	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	40	75	\N	40	f	A	1
183	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	45	2	\N	2	f	A	1
184	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	41	84	\N	41	f	A	1
195	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	53	90	\N	90	f	A	1
196	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	106	6	\N	6	f	A	1
197	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	55	7	\N	7	f	A	1
198	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	52	81	\N	52	f	A	1
199	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	53	89	\N	89	f	A	1
146	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	61	44	\N	44	f	A	1
147	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	11	15	2	E	69	43	\N	69	f	A	1
148	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	63	41	\N	41	f	A	1
149	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	62	40	\N	40	f	A	1
150	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	61	42	\N	42	f	A	1
151	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	69	44	\N	44	f	A	1
152	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	63	43	\N	43	f	A	1
153	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	62	41	\N	\N	f	A	1
154	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	15	11	2	E	105	40	\N	40	f	A	1
129	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	58	84	\N	84	f	A	1
112	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	47	80	\N	80	f	A	1
136	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	55	104	\N	104	f	A	1
163	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	76	47	\N	76	f	A	1
138	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	56	73	\N	56	f	A	1
139	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	53	84	\N	84	f	A	1
125	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	56	74	\N	56	f	A	1
126	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	53	104	\N	104	f	A	1
171	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	41	104	\N	104	f	A	1
172	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	44	75	\N	44	f	A	1
115	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	46	1	\N	\N	f	A	1
118	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	48	97	\N	48	f	A	1
119	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	70	79	\N	\N	f	A	1
200	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	56	90	\N	56	f	A	1
186	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	53	6	\N	53	f	A	1
160	Racks	2017-03-21 20:00:00+08	2	9	t	t	8-Ball	P	12	14	2	E	5	70	\N	5	f	A	1
114	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	15	15	2	E	48	79	\N	\N	f	A	1
135	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	54	74	\N	74	f	A	1
137	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	58	2	\N	58	f	A	1
144	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	63	40	\N	40	f	A	1
208	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	1	61	\N	1	f	A	1
209	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	83	66	\N	83	f	A	1
210	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	79	64	\N	64	f	A	1
211	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	80	69	\N	69	f	A	1
212	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	1	62	\N	1	f	A	1
213	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	83	61	\N	83	f	A	1
214	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	79	66	\N	79	f	A	1
215	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	91	64	\N	\N	f	A	1
257	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	104	109	\N	\N	f	A	\N
258	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	74	108	\N	74	f	A	\N
233	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	67	78	\N	67	f	A	\N
176	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	44	104	\N	44	f	A	1
178	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	40	2	\N	\N	f	A	1
193	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	55	81	\N	55	f	A	1
187	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	56	7	\N	7	f	A	1
188	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	106	81	\N	81	f	A	1
189	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	55	89	\N	55	f	A	1
190	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	52	90	\N	52	f	A	1
230	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	93	45	\N	45	f	A	\N
216	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	7	42	\N	7	f	A	\N
217	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	93	41	\N	41	f	A	\N
219	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	6	40	\N	40	f	A	\N
220	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	90	45	\N	90	f	A	\N
221	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	93	42	\N	42	f	A	\N
222	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	81	41	\N	41	f	A	\N
223	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	6	43	\N	6	f	A	\N
231	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	66	76	\N	76	f	A	\N
232	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	105	71	\N	71	f	A	\N
175	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	13	13	2	E	45	73	\N	\N	f	A	1
206	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	91	69	\N	\N	f	A	1
235	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	69	77	\N	\N	f	A	\N
236	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	105	76	\N	76	f	A	\N
237	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	67	71	\N	71	f	A	\N
238	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	107	78	\N	107	f	A	\N
239	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	69	5	\N	5	f	A	\N
240	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	66	77	\N	77	f	A	\N
241	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	67	76	\N	76	f	A	\N
242	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	107	71	\N	71	f	A	\N
243	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	69	78	\N	69	f	A	\N
244	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	66	5	\N	5	f	A	\N
245	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	105	77	\N	105	f	A	\N
174	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	40	84	\N	40	f	A	1
260	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	72	1	\N	1	f	A	\N
264	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	4	55	\N	4	f	A	\N
266	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	15	12	2	E	46	52	\N	52	f	A	\N
267	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	47	58	\N	58	f	A	\N
268	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	4	54	\N	4	f	A	\N
269	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	14	15	2	E	49	55	\N	49	f	A	\N
270	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	70	57	\N	70	f	A	\N
271	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	47	52	\N	52	f	A	\N
272	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	4	58	\N	4	f	A	\N
273	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	49	54	\N	49	f	A	\N
274	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	70	55	\N	70	f	A	\N
275	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	46	57	\N	\N	f	A	\N
224	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	90	40	\N	40	f	A	\N
226	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	81	42	\N	81	f	A	\N
227	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	6	41	\N	41	f	A	\N
228	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	90	43	\N	90	f	A	\N
229	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	7	40	\N	40	f	A	\N
177	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	43	75	\N	75	f	A	1
191	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	10	15	2	E	56	6	\N	56	f	A	1
202	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	91	62	\N	\N	f	A	1
203	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	80	61	\N	\N	f	A	1
205	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	83	64	\N	83	f	A	1
234	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	107	5	\N	107	f	A	\N
207	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	80	62	\N	62	f	A	1
252	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	2	109	\N	2	f	A	\N
253	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	104	108	\N	104	f	A	\N
254	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	74	79	\N	74	f	A	\N
263	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	47	54	\N	47	f	A	\N
288	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	90	61	\N	90	f	A	\N
289	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	7	107	\N	107	f	A	\N
293	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	47	2	\N	2	f	A	\N
294	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	10	12	2	E	46	74	\N	46	f	A	\N
311	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	41	53	\N	41	f	A	\N
312	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	43	59	\N	59	f	A	\N
315	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	3	55	\N	3	f	A	\N
317	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	45	59	\N	59	f	A	\N
318	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	1	20	2	E	40	54	\N	40	f	A	\N
319	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	3	57	\N	3	f	A	\N
291	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	110	84	\N	84	f	A	\N
292	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	49	73	\N	73	f	A	\N
248	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	2	108	\N	108	f	A	\N
354	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	69	55	\N	69	f	A	\N
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
353	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	67	54	\N	67	f	A	\N
247	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	72	109	\N	72	f	A	\N
290	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	14	2	E	6	64	\N	64	f	A	\N
276	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	7	69	\N	69	f	A	\N
277	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	6	66	\N	6	f	A	\N
279	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	89	107	\N	89	f	A	\N
280	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	90	64	\N	90	f	A	\N
281	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	6	69	\N	6	f	A	\N
282	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	81	66	\N	66	f	A	\N
283	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	89	61	\N	89	f	A	\N
284	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	10	2	E	90	107	\N	107	f	A	\N
286	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	81	69	\N	69	f	A	\N
287	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	89	66	\N	89	f	A	\N
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
306	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	3	53	\N	53	f	A	\N
307	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	41	59	\N	41	f	A	\N
308	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	43	54	\N	43	f	A	\N
309	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	45	57	\N	\N	f	A	\N
355	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	105	53	\N	53	f	A	\N
310	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	40	55	\N	40	f	A	\N
356	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	61	58	\N	58	f	A	\N
357	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	67	56	\N	67	f	A	\N
358	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	69	54	\N	69	f	A	\N
359	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	105	55	\N	105	f	A	\N
360	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	15	12	2	E	66	53	\N	53	f	A	\N
361	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	67	58	\N	58	f	A	\N
249	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	104	79	\N	104	f	A	\N
250	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	74	1	\N	74	f	A	\N
251	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	72	83	\N	72	f	A	\N
427	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	41	76	\N	41	f	A	\N
428	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	43	78	\N	43	f	A	\N
367	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	72	76	\N	72	f	A	\N
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
337	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	70	89	\N	70	f	A	\N
338	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	47	81	\N	47	f	A	\N
339	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	46	6	\N	6	f	A	\N
402	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	80	44	\N	44	f	A	\N
404	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	79	41	\N	41	f	A	\N
405	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	109	40	\N	40	f	A	\N
406	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	80	42	\N	42	f	A	\N
407	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	1	44	\N	1	f	A	\N
408	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	79	43	\N	43	f	A	\N
409	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	109	41	\N	41	f	A	\N
410	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	96	40	\N	40	f	A	\N
426	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	3	77	\N	77	f	A	\N
334	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	77	87	\N	87	f	A	\N
420	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	62	49	\N	49	f	A	\N
340	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	4	90	\N	90	f	A	\N
341	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	70	7	\N	70	f	A	\N
342	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	47	89	\N	89	f	A	\N
343	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	11	13	2	E	46	81	\N	46	f	A	\N
345	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	48	90	\N	90	f	A	\N
346	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	14	10	2	E	47	7	\N	7	f	A	\N
347	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	11	2	E	46	89	\N	89	f	A	\N
348	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	4	81	\N	4	f	A	\N
349	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	48	6	\N	6	f	A	\N
350	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	70	90	\N	90	f	A	\N
352	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	61	56	\N	\N	f	A	\N
362	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	69	56	\N	69	f	A	\N
363	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	105	54	\N	\N	f	A	\N
421	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	67	48	\N	48	f	A	\N
422	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	15	10	2	E	69	46	\N	46	f	A	\N
423	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	107	47	\N	47	f	A	\N
425	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	65	49	\N	65	f	A	\N
411	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	62	48	\N	62	f	A	\N
412	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	65	46	\N	46	f	A	\N
413	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	67	47	\N	47	f	A	\N
332	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	71	97	\N	71	f	A	\N
333	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	5	80	\N	5	f	A	\N
397	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	96	44	\N	44	f	A	\N
430	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	45	5	\N	5	f	A	\N
431	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	41	77	\N	41	f	A	\N
432	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	43	76	\N	76	f	A	\N
433	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	40	78	\N	40	f	A	\N
416	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	65	48	\N	\N	f	A	\N
417	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	67	46	\N	46	f	A	\N
418	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	12	14	2	E	69	47	\N	69	f	A	\N
419	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	107	4	\N	4	f	A	\N
335	Racks	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	15	13	2	E	76	1	\N	1	f	A	\N
364	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	66	55	\N	66	f	A	\N
365	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	61	53	\N	53	f	A	\N
396	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	109	42	\N	42	f	A	\N
429	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	40	71	\N	40	f	A	\N
401	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	16	11	2	E	96	42	\N	42	f	A	\N
366	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	73	77	\N	77	f	A	\N
450	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	6	84	\N	6	f	A	\N
452	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	111	104	\N	104	f	A	\N
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
434	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	15	14	2	E	45	71	\N	71	f	A	\N
435	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	3	5	\N	\N	f	A	\N
436	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	43	77	\N	43	f	A	\N
437	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	40	76	\N	40	f	A	\N
439	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	10	16	2	E	3	71	\N	3	f	A	\N
440	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	41	5	\N	5	f	A	\N
414	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	69	4	\N	69	f	A	\N
415	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	16	11	2	E	107	49	\N	49	f	A	\N
516	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	66	84	\N	84	f	A	\N
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
448	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	111	2	\N	111	f	A	\N
518	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	61	2	\N	61	f	A	\N
519	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	69	104	\N	104	f	A	\N
520	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	65	73	\N	73	f	A	\N
521	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	105	84	\N	84	f	A	\N
522	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	61	72	\N	72	f	A	\N
523	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	69	2	\N	\N	f	A	\N
481	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	80	46	\N	80	f	A	\N
482	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	79	49	\N	79	f	A	\N
483	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	87	47	\N	87	f	A	\N
484	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	109	70	\N	70	f	A	\N
485	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	1	110	\N	1	f	A	\N
471	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	109	46	\N	46	f	A	\N
472	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	1	49	\N	1	f	A	\N
473	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	80	47	\N	80	f	A	\N
474	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	79	70	\N	70	f	A	\N
475	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	87	110	\N	110	f	A	\N
477	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	80	49	\N	49	f	A	\N
478	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	79	47	\N	79	f	A	\N
479	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	87	70	\N	70	f	A	\N
512	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	71	7	\N	71	f	A	\N
513	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	5	81	\N	5	f	A	\N
449	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	90	72	\N	\N	f	A	\N
517	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	105	72	\N	72	f	A	\N
451	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	81	74	\N	74	f	A	\N
514	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	76	93	\N	93	f	A	\N
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
500	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	58	45	\N	58	f	A	\N
561	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	53	46	\N	46	f	A	\N
562	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	55	110	\N	\N	f	A	\N
564	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	52	70	\N	70	f	A	\N
566	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	55	46	\N	46	f	A	\N
553	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	14	10	2	E	44	81	\N	81	f	A	\N
554	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	41	93	\N	41	f	A	\N
555	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	42	7	\N	42	f	A	\N
556	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	43	112	\N	112	f	A	\N
557	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	2	20	2	E	44	90	\N	44	f	A	\N
558	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	41	81	\N	41	f	A	\N
559	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	11	16	2	E	42	93	\N	42	f	A	\N
560	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	11	2	E	3	7	\N	7	f	A	\N
591	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	7	110	\N	7	f	A	\N
524	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	65	104	\N	\N	f	A	\N
525	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	66	73	\N	73	f	A	\N
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
532	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	1	73	\N	1	f	A	\N
533	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	80	2	\N	2	f	A	\N
534	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	97	75	\N	75	f	A	\N
535	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	79	74	\N	79	f	A	\N
536	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	1	84	\N	84	f	A	\N
537	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	80	73	\N	73	f	A	\N
538	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	97	2	\N	2	f	A	\N
539	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	79	75	\N	75	f	A	\N
578	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	78	61	\N	78	f	A	\N
579	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	92	107	\N	92	f	A	\N
580	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	5	105	\N	5	f	A	\N
581	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	82	69	\N	82	f	A	\N
582	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	11	2	E	78	62	\N	62	f	A	\N
528	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	65	2	\N	2	f	A	\N
583	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	92	61	\N	92	f	A	\N
584	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	5	107	\N	5	f	A	\N
585	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	71	105	\N	71	f	A	\N
587	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	12	11	2	E	92	62	\N	62	f	A	\N
588	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	5	61	\N	5	f	A	\N
589	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	71	107	\N	71	f	A	\N
590	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	82	105	\N	105	f	A	\N
548	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	43	81	\N	81	f	A	\N
549	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	44	93	\N	44	f	A	\N
551	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	3	112	\N	112	f	A	\N
552	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	15	13	2	E	43	90	\N	90	f	A	\N
527	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	69	72	\N	72	f	A	\N
529	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	66	104	\N	104	f	A	\N
621	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	75	41	\N	75	f	A	\N
622	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	84	42	\N	84	f	A	\N
612	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	54	65	\N	65	f	A	\N
613	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	57	67	\N	57	f	A	\N
597	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	81	49	\N	81	f	A	\N
598	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	6	47	\N	6	f	A	\N
599	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	90	46	\N	90	f	A	\N
600	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	7	70	\N	7	f	A	\N
601	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	81	110	\N	110	f	A	\N
602	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	6	49	\N	49	f	A	\N
603	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	90	47	\N	47	f	A	\N
604	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	7	46	\N	46	f	A	\N
605	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	89	70	\N	\N	f	A	\N
609	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	57	63	\N	57	f	A	\N
611	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	53	69	\N	\N	f	A	\N
541	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	80	84	\N	84	f	A	\N
542	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	97	73	\N	73	f	A	\N
614	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	55	63	\N	63	f	A	\N
616	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	54	69	\N	69	f	A	\N
617	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	57	65	\N	65	f	A	\N
618	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	15	13	2	E	55	67	\N	67	f	A	\N
619	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	59	63	\N	63	f	A	\N
620	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	53	113	\N	113	f	A	\N
607	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	53	65	\N	53	f	A	\N
702	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	20	0	2	E	47	63	\N	\N	f	A	\N
540	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	96	74	\N	74	f	A	\N
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
641	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	2	2	E	83	5	\N	5	f	A	\N
592	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	89	49	\N	89	f	A	\N
593	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	81	47	\N	\N	f	A	\N
594	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	6	46	\N	6	f	A	\N
705	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	110	113	\N	113	f	A	\N
688	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	91	54	\N	54	f	A	\N
708	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	1	20	2	E	70	61	\N	70	f	A	\N
709	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	110	105	\N	\N	f	A	\N
710	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	48	113	\N	48	f	A	\N
696	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	110	69	\N	69	f	A	\N
697	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	48	63	\N	63	f	A	\N
699	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	10	10	2	E	49	105	\N	\N	f	A	\N
700	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	3	20	2	E	70	113	\N	70	f	A	\N
701	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	48	69	\N	\N	f	A	\N
686	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	79	53	\N	53	f	A	\N
704	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	70	105	\N	70	f	A	\N
689	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	97	57	\N	57	f	A	\N
707	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	49	63	\N	63	f	A	\N
690	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	108	56	\N	\N	f	A	\N
691	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	80	53	\N	53	f	A	\N
692	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	91	55	\N	55	f	A	\N
693	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	97	54	\N	97	f	A	\N
694	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	108	57	\N	57	f	A	\N
695	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	79	56	\N	79	f	A	\N
595	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	90	70	\N	90	f	A	\N
543	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	79	2	\N	2	f	A	\N
596	Racks	2017-05-09 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	89	110	\N	110	f	A	\N
577	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	14	15	2	E	82	62	\N	82	f	A	\N
225	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	13	15	2	E	7	45	\N	7	f	A	\N
444	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	111	72	\N	72	f	A	\N
468	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	59	108	\N	59	f	A	\N
643	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	97	78	\N	97	f	A	\N
644	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	87	77	\N	77	f	A	\N
645	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	109	76	\N	76	f	A	\N
647	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	97	71	\N	71	f	A	\N
648	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	87	78	\N	87	f	A	\N
649	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	109	77	\N	77	f	A	\N
650	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	83	76	\N	76	f	A	\N
636	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	109	5	\N	5	f	A	\N
637	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	83	71	\N	71	f	A	\N
638	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	80	78	\N	80	f	A	\N
698	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	20	0	2	E	47	61	\N	\N	f	A	\N
173	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	13	14	2	E	43	2	\N	43	f	A	1
194	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	10	17	2	E	52	89	\N	52	f	A	1
703	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	49	61	\N	49	f	A	\N
651	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	82	42	\N	42	f	A	\N
653	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	12	14	2	E	78	43	\N	78	f	A	\N
706	Billidart	2017-05-17 20:00:00+08	0	9	t	t	8-Ball	P	20	0	2	E	47	69	\N	\N	f	A	\N
654	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	76	41	\N	76	f	A	\N
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
670	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	74	90	\N	90	f	A	\N
671	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	84	7	\N	7	f	A	\N
682	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	79	55	\N	79	f	A	\N
683	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	80	54	\N	80	f	A	\N
684	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	91	57	\N	57	f	A	\N
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
737	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	100	92	\N	92	f	A	\N
738	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	52	78	\N	52	f	A	\N
739	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	53	5	\N	5	f	A	\N
123	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	70	97	\N	70	f	A	1
711	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	105	89	\N	89	f	A	\N
259	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	73	79	\N	73	f	A	\N
261	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	70	52	\N	70	f	A	\N
642	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	80	71	\N	80	f	A	\N
133	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	58	73	\N	58	f	A	1
546	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	42	112	\N	112	f	A	\N
632	Racks	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	72	42	\N	72	f	A	\N
515	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	77	90	\N	77	f	A	\N
664	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	12	15	2	E	82	41	\N	82	f	A	\N
336	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	48	7	\N	7	f	A	\N
687	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	80	55	\N	80	f	A	\N
713	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	67	81	\N	81	f	A	\N
725	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	63	90	\N	63	f	A	\N
768	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	40	108	\N	40	f	A	\N
769	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	44	1	\N	\N	f	A	\N
770	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	3	79	\N	3	f	A	\N
756	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	44	83	\N	44	f	A	\N
757	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	3	80	\N	3	f	A	\N
758	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	43	108	\N	43	f	A	\N
759	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	41	1	\N	41	f	A	\N
760	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	40	79	\N	40	f	A	\N
761	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	3	83	\N	3	f	A	\N
762	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	43	80	\N	43	f	A	\N
763	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	41	108	\N	41	f	A	\N
764	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	40	1	\N	40	f	A	\N
766	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	43	83	\N	43	f	A	\N
767	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	41	80	\N	41	f	A	\N
736	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	54	76	\N	76	f	A	\N
740	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	55	71	\N	71	f	A	\N
726	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	53	76	\N	76	f	A	\N
728	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	54	78	\N	78	f	A	\N
729	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	100	5	\N	5	f	A	\N
730	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	52	71	\N	71	f	A	\N
731	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	11	2	E	55	76	\N	76	f	A	\N
732	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	54	92	\N	92	f	A	\N
733	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	100	78	\N	100	f	A	\N
734	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	1	20	2	E	52	5	\N	52	f	A	\N
735	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	53	71	\N	71	f	A	\N
742	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	75	70	\N	\N	f	A	\N
565	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	57	49	\N	57	f	A	\N
438	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	45	78	\N	45	f	A	\N
586	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	78	69	\N	69	f	A	\N
47	Racks	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	74	64	\N	74	f	A	1
488	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	54	43	\N	43	f	A	\N
805	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	93	83	\N	93	f	A	\N
806	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	90	109	\N	109	f	A	\N
807	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	81	79	\N	79	f	A	\N
808	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	6	80	\N	6	f	A	\N
809	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	93	1	\N	1	f	A	\N
811	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	81	109	\N	\N	f	A	\N
812	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	6	79	\N	6	f	A	\N
822	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	14	15	2	E	47	76	\N	47	f	A	\N
351	Racks	2017-04-11 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	66	58	\N	58	f	A	\N
681	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	108	53	\N	108	f	A	\N
743	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	2	47	\N	2	f	A	\N
744	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	73	110	\N	73	f	A	\N
745	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	84	49	\N	84	f	A	\N
746	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	75	46	\N	46	f	A	\N
747	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	2	70	\N	70	f	A	\N
748	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	73	47	\N	73	f	A	\N
749	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	14	15	2	E	84	110	\N	84	f	A	\N
750	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	72	49	\N	\N	f	A	\N
751	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	15	2	E	2	46	\N	2	f	A	\N
753	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	84	47	\N	84	f	A	\N
754	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	72	110	\N	72	f	A	\N
755	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	75	49	\N	75	f	A	\N
804	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	6	1	\N	1	f	A	\N
786	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	84	53	\N	\N	f	A	\N
788	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	2	54	\N	2	f	A	\N
793	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	2	20	2	E	75	54	\N	75	f	A	\N
32	Racks	2017-02-28 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	3	49	\N	\N	f	A	1
117	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	4	80	\N	4	f	A	1
262	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	46	58	\N	46	f	A	\N
278	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	81	61	\N	81	f	A	\N
320	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	41	55	\N	41	f	A	\N
313	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	45	54	\N	45	f	A	\N
476	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	1	46	\N	1	f	A	\N
301	Racks	2017-04-04 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	47	84	\N	84	f	A	\N
344	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	4	6	\N	4	f	A	\N
399	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	1	41	\N	41	f	A	\N
469	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	57	79	\N	57	f	A	\N
526	Billidart	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	61	84	\N	61	f	A	\N
563	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	54	47	\N	47	f	A	\N
127	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	54	2	\N	2	f	A	1
576	Racks	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	71	69	\N	71	f	A	\N
550	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	41	7	\N	41	f	A	\N
646	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	80	5	\N	5	f	A	\N
608	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	54	67	\N	67	f	A	\N
128	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	14	10	2	E	55	73	\N	73	f	A	1
130	Racks	2017-03-16 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	53	74	\N	74	f	A	1
712	Racks	2017-05-23 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	63	6	\N	63	f	A	\N
652	Racks	2017-05-16 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	71	3	\N	71	f	A	\N
255	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	73	1	\N	1	f	A	\N
727	Racks	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	55	92	\N	55	f	A	\N
752	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	73	70	\N	73	f	A	\N
179	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	45	84	\N	84	f	A	1
368	Billidart	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	2	78	\N	2	f	A	\N
204	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	1	66	\N	1	f	A	1
91	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	79	90	\N	\N	f	A	1
218	Racks	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	81	43	\N	43	f	A	\N
77	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	12	2	E	1	6	\N	6	f	A	1
453	Racks	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	90	2	\N	2	f	A	\N
803	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	81	80	\N	80	f	A	\N
813	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	93	80	\N	93	f	A	\N
815	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	90	83	\N	90	f	A	\N
817	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	46	76	\N	46	f	A	\N
610	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	55	113	\N	55	f	A	\N
802	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	90	79	\N	90	f	A	\N
819	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	48	77	\N	77	f	A	\N
820	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	49	92	\N	\N	f	A	\N
821	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	12	17	2	E	46	5	\N	46	f	A	\N
823	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	48	78	\N	\N	f	A	\N
800	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	72	52	\N	72	f	A	\N
787	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	13	17	2	E	72	55	\N	72	f	A	\N
789	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	75	57	\N	57	f	A	\N
791	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	72	53	\N	\N	f	A	\N
792	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	2	55	\N	2	f	A	\N
794	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	73	57	\N	57	f	A	\N
796	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	2	53	\N	53	f	A	\N
797	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	75	55	\N	75	f	A	\N
798	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	73	54	\N	73	f	A	\N
799	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	84	57	\N	84	f	A	\N
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
192	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	106	7	\N	7	f	A	1
814	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	13	11	2	E	7	1	\N	1	f	A	\N
816	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	70	5	\N	5	f	A	\N
865	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	71	74	\N	\N	f	A	\N
866	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	77	104	\N	77	f	A	\N
867	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	78	84	\N	84	f	A	\N
868	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	5	2	\N	5	f	A	\N
869	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	10	14	2	E	71	75	\N	71	f	A	\N
871	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	78	104	\N	104	f	A	\N
872	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	5	84	\N	5	f	A	\N
873	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	71	2	\N	71	f	A	\N
874	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	76	75	\N	75	f	A	\N
875	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	77	74	\N	77	f	A	\N
861	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	76	104	\N	104	f	A	\N
862	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	77	84	\N	77	f	A	\N
863	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	78	2	\N	2	f	A	\N
847	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	70	44	\N	70	f	A	\N
848	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	47	43	\N	43	f	A	\N
849	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	48	3	\N	3	f	A	\N
850	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	46	41	\N	41	f	A	\N
853	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	48	43	\N	48	f	A	\N
854	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	46	3	\N	46	f	A	\N
855	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	49	41	\N	41	f	A	\N
856	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	47	42	\N	42	f	A	\N
857	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	48	44	\N	44	f	A	\N
858	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	46	43	\N	46	f	A	\N
859	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	49	3	\N	3	f	A	\N
860	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	12	12	2	E	70	41	\N	\N	f	A	\N
876	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	64	109	\N	64	f	A	\N
877	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	69	79	\N	69	f	A	\N
878	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	61	80	\N	61	f	A	\N
879	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	66	1	\N	1	f	A	\N
880	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	107	87	\N	107	f	A	\N
881	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	69	109	\N	69	f	A	\N
882	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	61	79	\N	79	f	A	\N
883	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	66	80	\N	80	f	A	\N
884	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	107	1	\N	1	f	A	\N
885	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	64	87	\N	87	f	A	\N
886	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	16	11	2	E	61	109	\N	109	f	A	\N
887	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	66	79	\N	66	f	A	\N
888	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	107	80	\N	107	f	A	\N
889	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	64	1	\N	1	f	A	\N
890	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	69	87	\N	69	f	A	\N
832	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	14	17	2	E	6	58	\N	6	f	A	\N
824	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	49	77	\N	77	f	A	\N
825	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	13	14	2	E	70	92	\N	70	f	A	\N
826	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	47	5	\N	5	f	A	\N
827	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	48	76	\N	48	f	A	\N
828	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	15	14	2	E	49	78	\N	78	f	A	\N
829	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	70	77	\N	77	f	A	\N
830	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	46	92	\N	92	f	A	\N
790	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	73	52	\N	73	f	A	\N
864	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	5	75	\N	75	f	A	\N
833	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	15	14	2	E	81	54	\N	54	f	A	\N
834	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	89	53	\N	89	f	A	\N
835	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	90	55	\N	55	f	A	\N
836	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	6	57	\N	57	f	A	\N
837	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	81	58	\N	58	f	A	\N
838	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	89	54	\N	89	f	A	\N
839	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	90	53	\N	90	f	A	\N
840	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	12	17	2	E	7	55	\N	7	f	A	\N
841	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	81	57	\N	57	f	A	\N
842	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	89	58	\N	58	f	A	\N
843	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	90	54	\N	90	f	A	\N
844	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	7	53	\N	7	f	A	\N
845	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	6	55	\N	55	f	A	\N
831	Racks	2017-06-06 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	7	57	\N	7	f	A	\N
810	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	7	83	\N	7	f	A	\N
801	Racks	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	7	109	\N	7	f	A	\N
818	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	47	78	\N	47	f	A	\N
795	Billidart	2017-05-31 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	84	52	\N	84	f	A	\N
256	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	2	83	\N	2	f	A	\N
246	Billidart	2017-03-29 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	73	83	\N	\N	f	A	\N
265	Racks	2017-03-28 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	49	57	\N	57	f	A	\N
285	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	7	64	\N	7	f	A	\N
314	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	40	57	\N	40	f	A	\N
316	Billidart	2017-04-05 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	43	53	\N	43	f	A	\N
398	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	80	43	\N	80	f	A	\N
400	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	79	40	\N	40	f	A	\N
403	Racks	2017-04-12 20:00:00+08	2	9	t	t	8-Ball	P	13	16	2	E	1	43	\N	1	f	A	\N
467	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	58	91	\N	58	f	A	\N
470	Billidart	2017-04-19 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	53	1	\N	53	f	A	\N
424	Racks	2017-04-18 20:00:00+08	2	9	t	t	8-Ball	P	14	11	2	E	62	4	\N	4	f	A	\N
499	Racks	2017-04-26 20:00:00+08	2	9	t	t	8-Ball	P	12	14	2	E	55	40	\N	55	f	A	\N
480	Racks	2017-04-25 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	109	110	\N	110	f	A	\N
531	Racks	2017-05-02 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	96	84	\N	84	f	A	\N
547	Billidart	2017-05-03 20:00:00+08	2	9	t	t	8-Ball	P	13	12	2	E	3	90	\N	90	f	A	\N
639	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	13	15	2	E	97	77	\N	97	f	A	\N
615	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	16	14	2	E	59	113	\N	113	f	A	\N
82	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	79	6	\N	6	f	A	1
64	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	78	54	\N	78	f	A	1
70	Billidart	2017-03-01 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	71	55	\N	71	f	A	1
110	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	70	1	\N	\N	f	A	1
111	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	46	83	\N	46	f	A	1
113	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	4	97	\N	4	f	A	1
96	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	93	76	\N	93	f	A	1
105	Racks	2017-03-14 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	81	88	\N	88	f	A	1
142	Billidart	2017-03-15 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	61	43	\N	61	f	A	1
870	Racks	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	76	74	\N	76	f	A	\N
606	Billidart	2017-05-10 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	59	69	\N	59	f	A	\N
669	Billidart	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	75	6	\N	75	f	A	\N
685	Racks	2017-05-17 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	97	56	\N	56	f	A	\N
765	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	44	79	\N	44	f	A	\N
741	Billidart	2017-05-24 20:00:00+08	2	9	t	t	8-Ball	P	15	11	2	E	72	46	\N	46	f	A	\N
846	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	49	42	\N	42	f	A	\N
851	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	70	42	\N	70	f	A	\N
852	Billidart	2017-06-07 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	47	44	\N	44	f	A	\N
185	Billidart	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	44	73	\N	44	f	A	1
201	Racks	2017-03-22 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	79	69	\N	69	f	A	1
899	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	2	20	2	E	41	117	\N	41	f	A	\N
896	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	44	116	\N	44	f	A	\N
897	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	43	114	\N	114	f	A	\N
898	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	3	115	\N	3	f	A	\N
900	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	42	120	\N	42	f	A	\N
901	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	43	116	\N	116	f	A	\N
902	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	3	114	\N	3	f	A	\N
903	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	41	115	\N	41	f	A	\N
904	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	42	117	\N	42	f	A	\N
905	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	44	120	\N	44	f	A	\N
891	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	42	116	\N	42	f	A	\N
892	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	44	114	\N	44	f	A	\N
893	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	43	115	\N	115	f	A	\N
894	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	3	117	\N	3	f	A	\N
895	Racks	2017-09-05 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	41	120	\N	120	f	A	\N
918	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	67	83	\N	83	f	A	\N
906	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	63	79	\N	63	f	A	\N
907	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	62	127	\N	127	f	A	\N
908	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	69	83	\N	69	f	A	\N
909	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	105	80	\N	80	f	A	\N
910	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	67	87	\N	87	f	A	\N
911	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	62	79	\N	62	f	A	\N
912	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	69	127	\N	127	f	A	\N
913	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	105	83	\N	105	f	A	\N
914	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	67	80	\N	80	f	A	\N
915	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	11	13	2	E	63	87	\N	63	f	A	\N
916	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	69	79	\N	\N	f	A	\N
917	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	105	127	\N	127	f	A	\N
919	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	63	80	\N	63	f	A	\N
920	Racks	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	62	87	\N	87	f	A	\N
960	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	76	93	\N	93	f	A	\N
961	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	92	7	\N	7	f	A	\N
962	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	71	123	\N	71	f	A	\N
963	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	78	6	\N	6	f	A	\N
964	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	76	81	\N	81	f	A	\N
965	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	12	15	2	E	77	93	\N	77	f	A	\N
951	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	76	7	\N	7	f	A	\N
952	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	77	123	\N	77	f	A	\N
953	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	92	6	\N	92	f	A	\N
954	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	71	81	\N	71	f	A	\N
955	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	78	93	\N	93	f	A	\N
956	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	77	7	\N	77	f	A	\N
957	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	92	123	\N	92	f	A	\N
958	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	17	16	2	E	71	6	\N	6	f	A	\N
959	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	78	81	\N	78	f	A	\N
936	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	2	56	\N	56	f	A	\N
937	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	125	52	\N	52	f	A	\N
938	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	124	138	\N	124	f	A	\N
939	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	73	133	\N	73	f	A	\N
940	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	72	134	\N	72	f	A	\N
941	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	125	56	\N	56	f	A	\N
942	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	124	52	\N	124	f	A	\N
943	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	73	138	\N	73	f	A	\N
944	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	72	133	\N	133	f	A	\N
945	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	2	134	\N	2	f	A	\N
946	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	5	20	2	E	124	56	\N	124	f	A	\N
947	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	73	52	\N	73	f	A	\N
948	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	72	138	\N	138	f	A	\N
949	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	2	133	\N	133	f	A	\N
950	Billidart	2017-09-06 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	125	134	\N	125	f	A	\N
968	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	143	78	\N	\N	f	A	\N
969	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	138	92	\N	138	f	A	\N
970	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	14	13	2	E	52	5	\N	5	f	A	\N
971	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	20	4	2	E	54	77	\N	77	f	A	\N
972	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	143	71	\N	71	f	A	\N
973	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	138	78	\N	138	f	A	\N
974	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	17	15	2	E	52	92	\N	92	f	A	\N
996	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	127	42	\N	127	f	A	\N
1005	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	127	41	\N	41	f	A	\N
997	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	79	44	\N	79	f	A	\N
998	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	80	43	\N	43	f	A	\N
999	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	109	126	\N	126	f	A	\N
1000	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	83	41	\N	41	f	A	\N
1001	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	79	42	\N	79	f	A	\N
1002	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	80	44	\N	44	f	A	\N
1003	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	109	43	\N	43	f	A	\N
1004	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	83	126	\N	\N	f	A	\N
1006	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	80	42	\N	42	f	A	\N
1007	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	109	44	\N	44	f	A	\N
1008	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	83	43	\N	43	f	A	\N
1009	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	11	17	2	E	127	126	\N	127	f	A	\N
1010	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	79	41	\N	41	f	A	\N
966	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	56	77	\N	56	f	A	\N
967	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	20	6	2	E	54	71	\N	71	f	A	\N
975	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	56	5	\N	5	f	A	\N
976	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	16	12	2	E	143	77	\N	77	f	A	\N
977	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	138	71	\N	71	f	A	\N
978	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	52	78	\N	52	f	A	\N
979	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	56	92	\N	92	f	A	\N
980	Racks	2017-09-12 20:00:00+08	2	9	t	t	8-Ball	P	20	3	2	E	54	5	\N	5	f	A	\N
1026	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	7	2	\N	7	f	A	\N
1037	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	123	139	\N	139	f	A	\N
1027	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	12	11	2	E	81	139	\N	139	f	A	\N
1028	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	93	125	\N	93	f	A	\N
1029	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	123	124	\N	123	f	A	\N
1030	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	6	73	\N	73	f	A	\N
1031	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	81	2	\N	2	f	A	\N
1032	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	93	139	\N	93	f	A	\N
1033	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	5	2	E	123	125	\N	125	f	A	\N
1034	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	10	16	2	E	6	124	\N	6	f	A	\N
1035	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	7	73	\N	7	f	A	\N
1036	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	93	2	\N	\N	f	A	\N
1038	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	6	125	\N	6	f	A	\N
1039	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	11	2	E	7	124	\N	124	f	A	\N
1040	Racks	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	81	73	\N	73	f	A	\N
992	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	117	113	\N	117	f	A	\N
986	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	122	69	\N	69	f	A	\N
993	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	4	20	2	E	114	129	\N	114	f	A	\N
994	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	116	64	\N	64	f	A	\N
995	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	122	66	\N	122	f	A	\N
981	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	116	69	\N	69	f	A	\N
982	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	122	113	\N	113	f	A	\N
983	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	12	16	2	E	120	129	\N	120	f	A	\N
984	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	117	64	\N	64	f	A	\N
985	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	15	15	2	E	114	66	\N	\N	f	A	\N
987	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	120	113	\N	120	f	A	\N
988	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	117	129	\N	117	f	A	\N
990	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	116	66	\N	116	f	A	\N
991	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	120	69	\N	120	f	A	\N
1024	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	113	144	\N	144	f	A	\N
1014	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	67	144	\N	\N	f	A	\N
1015	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	62	131	\N	131	f	A	\N
1020	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	113	131	\N	131	f	A	\N
1025	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	11	20	2	E	105	131	\N	105	f	A	\N
1012	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	105	57	\N	57	f	A	\N
1013	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	14	14	2	E	69	132	\N	\N	f	A	\N
1016	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	105	55	\N	55	f	A	\N
1017	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	69	57	\N	69	f	A	\N
1018	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	67	132	\N	67	f	A	\N
1019	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	62	144	\N	\N	f	A	\N
1021	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	16	17	2	E	69	55	\N	69	f	A	\N
1022	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	67	57	\N	57	f	A	\N
989	Billidart	2017-09-13 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	114	64	\N	114	f	A	\N
1011	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	20	12	2	E	113	55	\N	55	f	A	\N
1023	Racks	2017-09-19 20:00:00+08	2	9	t	t	8-Ball	P	17	17	2	E	62	132	\N	\N	f	A	\N
1045	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	13	15	2	E	45	81	\N	45	f	A	\N
1046	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	15	16	2	E	44	7	\N	44	f	A	\N
1047	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	43	112	\N	112	f	A	\N
1048	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	126	123	\N	126	f	A	\N
1049	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	45	6	\N	6	f	A	\N
1050	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	3	81	\N	81	f	A	\N
1051	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	43	7	\N	7	f	A	\N
1052	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	13	14	2	E	126	112	\N	126	f	A	\N
1041	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	16	13	2	E	3	7	\N	7	f	A	\N
1042	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	44	112	\N	112	f	A	\N
1043	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	7	20	2	E	43	123	\N	43	f	A	\N
1044	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	126	6	\N	6	f	A	\N
1053	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	10	20	2	E	45	123	\N	45	f	A	\N
1054	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	3	6	\N	3	f	A	\N
1055	Racks	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	13	20	2	E	44	81	\N	44	f	A	\N
1065	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	79	139	\N	139	f	A	\N
1066	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	14	20	2	E	80	2	\N	80	f	A	\N
1067	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	11	12	2	E	87	73	\N	87	f	A	\N
1056	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	79	2	\N	2	f	A	\N
1068	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	14	16	2	E	91	72	\N	91	f	A	\N
1057	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	15	14	2	E	127	73	\N	73	f	A	\N
1058	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	80	72	\N	72	f	A	\N
1059	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	87	84	\N	84	f	A	\N
1060	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	10	2	E	91	139	\N	139	f	A	\N
1061	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	9	20	2	E	127	2	\N	127	f	A	\N
1062	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	8	2	E	80	73	\N	73	f	A	\N
1063	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	7	2	E	87	72	\N	72	f	A	\N
1064	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	16	15	2	E	91	84	\N	84	f	A	\N
1069	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	79	84	\N	79	f	A	\N
1070	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	17	14	2	E	127	139	\N	139	f	A	\N
1079	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	8	20	2	E	71	114	\N	71	f	A	\N
1080	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	1	20	2	E	92	117	\N	92	f	A	\N
1081	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	1	2	E	78	116	\N	116	f	A	\N
1082	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	14	2	E	77	120	\N	120	f	A	\N
1083	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	12	20	2	E	71	115	\N	71	f	A	\N
1071	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	12	17	2	E	92	116	\N	92	f	A	\N
1072	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	15	15	2	E	76	120	\N	\N	f	A	\N
1073	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	13	2	E	78	115	\N	115	f	A	\N
1074	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	16	16	2	E	77	114	\N	\N	f	A	\N
1075	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	6	20	2	E	71	117	\N	71	f	A	\N
1076	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	20	9	2	E	76	116	\N	116	f	A	\N
1077	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	17	13	2	E	78	120	\N	120	f	A	\N
1078	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	15	17	2	E	77	115	\N	77	f	A	\N
1084	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	15	13	2	E	92	114	\N	114	f	A	\N
1085	Billidart	2017-09-20 20:00:00+08	2	9	t	t	8-Ball	P	14	15	2	E	76	117	\N	76	f	A	\N
1086	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	73	77	\N	\N	f	A	\N
1087	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	2	92	\N	\N	f	A	\N
1088	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	125	71	\N	\N	f	A	\N
1089	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	72	78	\N	\N	f	A	\N
1090	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	124	76	\N	\N	f	A	\N
1091	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	2	77	\N	\N	f	A	\N
1092	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	125	92	\N	\N	f	A	\N
1093	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	72	71	\N	\N	f	A	\N
1094	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	124	78	\N	\N	f	A	\N
1095	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	73	76	\N	\N	f	A	\N
1096	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	125	77	\N	\N	f	A	\N
1097	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	72	92	\N	\N	f	A	\N
1098	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	124	71	\N	\N	f	A	\N
1099	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	73	78	\N	\N	f	A	\N
1100	Racks	2017-09-26 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	2	76	\N	\N	f	A	\N
1101	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	138	43	\N	\N	f	A	\N
1102	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	56	44	\N	\N	f	A	\N
1103	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	52	3	\N	\N	f	A	\N
1104	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	131	41	\N	\N	f	A	\N
1105	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	134	42	\N	\N	f	A	\N
1106	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	56	43	\N	\N	f	A	\N
1107	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	52	44	\N	\N	f	A	\N
1108	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	131	3	\N	\N	f	A	\N
1109	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	134	41	\N	\N	f	A	\N
1110	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	138	42	\N	\N	f	A	\N
1111	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	52	43	\N	\N	f	A	\N
1112	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	131	44	\N	\N	f	A	\N
1113	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	134	3	\N	\N	f	A	\N
1114	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	138	41	\N	\N	f	A	\N
1115	Billidart	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	56	42	\N	\N	f	A	\N
1116	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	120	80	\N	\N	f	A	\N
1117	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	114	127	\N	\N	f	A	\N
1118	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	116	79	\N	\N	f	A	\N
1119	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	117	83	\N	\N	f	A	\N
1120	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	115	87	\N	\N	f	A	\N
1121	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	114	80	\N	\N	f	A	\N
1122	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	116	127	\N	\N	f	A	\N
1123	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	117	79	\N	\N	f	A	\N
1124	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	115	83	\N	\N	f	A	\N
1125	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	120	87	\N	\N	f	A	\N
1126	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	116	80	\N	\N	f	A	\N
1127	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	117	127	\N	\N	f	A	\N
1128	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	115	79	\N	\N	f	A	\N
1129	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	120	83	\N	\N	f	A	\N
1130	Racks	2017-09-27 20:00:00+08	0	9	f	f	8-Ball	P	0	0	2	E	114	87	\N	\N	f	A	\N
\.


--
-- Name: recording_match_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('recording_match_id_seq', 1130, true);


--
-- Data for Name: schedule_matchweek; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY schedule_matchweek (id, week_number, start_date, end_date, season_id, serial_id) FROM stdin;
1	1	2017-02-26 00:00:00+08	2017-03-12 00:00:00+08	1	1
2	2	2017-03-12 00:00:00+08	2017-03-19 00:00:00+08	1	2
3	3	2017-03-19 00:00:00+08	2017-03-26 00:00:00+08	1	3
4	4	2017-03-26 00:00:00+08	2017-04-02 00:00:00+08	1	4
5	5	2017-04-02 00:00:00+08	2017-04-09 00:00:00+08	1	5
6	6	2017-04-09 00:00:00+08	2017-04-16 00:00:00+08	1	6
7	7	2017-04-16 00:00:00+08	2017-04-23 00:00:00+08	1	7
8	8	2017-04-23 00:00:00+08	2017-04-30 00:00:00+08	1	8
9	9	2017-04-30 00:00:00+08	2017-05-07 00:00:00+08	1	9
10	10	2017-05-07 00:00:00+08	2017-05-14 00:00:00+08	1	10
11	11	2017-05-14 00:00:00+08	2017-05-21 00:00:00+08	1	11
12	12	2017-05-21 00:00:00+08	2017-05-28 00:00:00+08	1	12
13	13	2017-05-28 00:00:00+08	2017-06-04 00:00:00+08	1	13
14	14	2017-06-04 00:00:00+08	2017-06-11 00:00:00+08	1	14
15	1	2017-09-03 00:00:00+08	2017-09-10 00:00:00+08	2	15
16	2	2017-09-10 00:00:00+08	2017-09-17 00:00:00+08	2	16
17	3	2017-09-17 00:00:00+08	2017-09-24 00:00:00+08	2	17
18	4	2017-09-24 00:00:00+08	2017-10-01 00:00:00+08	2	18
19	5	2017-10-01 00:00:00+08	2017-10-08 00:00:00+08	2	19
20	6	2017-10-08 00:00:00+08	2017-10-15 00:00:00+08	2	20
21	7	2017-10-15 00:00:00+08	2017-10-22 00:00:00+08	2	21
22	8	2017-10-22 00:00:00+08	2017-10-29 00:00:00+08	2	22
23	9	2017-10-29 00:00:00+08	2017-11-05 00:00:00+08	2	23
24	10	2017-11-05 00:00:00+08	2017-11-12 00:00:00+08	2	24
25	11	2017-11-12 00:00:00+08	2017-11-19 00:00:00+08	2	25
26	12	2017-11-19 00:00:00+08	2017-11-26 00:00:00+08	2	26
27	13	2017-11-26 00:00:00+08	2017-12-03 00:00:00+08	2	27
28	14	2017-12-03 00:00:00+08	2017-12-10 00:00:00+08	2	28
\.


--
-- Name: schedule_matchweek_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('schedule_matchweek_id_seq', 28, true);


--
-- Data for Name: schedule_season; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY schedule_season (id, season, league_id, name) FROM stdin;
1	3	1	2017 Spring
2	4	1	2017 Autumn
\.


--
-- Name: schedule_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('schedule_season_id_seq', 2, true);


--
-- Data for Name: stats_playerranking; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY stats_playerranking (id, date, serial_id, ranking, elo_points, total_points, handicap, season_matches_played, season_matches_won, season_clearances, player_id, league_id, week_id, season_id, season_points, total_clearances, total_matches_played, total_matches_won) FROM stdin;
48	2017-06-27 22:01:15.247147+08	1	14	210.585489538448002	52	8.66666666666666963	3	2	0	93	1	2	1	52	0	3	2
47	2017-06-27 22:01:15.24585+08	2	36	193.714285714286007	41	6.83333333333333037	3	0	0	90	1	2	1	41	0	3	0
51	2017-06-27 22:01:15.251206+08	2	27	197.84443049751701	91	7.58333333333333037	6	3	0	89	1	2	1	91	0	6	3
50	2017-06-27 22:01:15.249776+08	2	39	189.692855389918009	83	6.91666666666666963	6	1	0	81	1	2	1	83	0	6	1
49	2017-06-27 22:01:15.248301+08	2	15	210.571433646232009	99	8.25	6	4	2	6	1	2	1	99	2	6	4
52	2017-06-27 22:01:15.25276+08	2	18	207.337410718922001	95	7.91666666666666963	6	3	0	7	1	2	1	95	0	6	3
55	2017-06-27 22:01:15.259408+08	2	25	199.964404894327004	44	7.33333333333333037	3	1	0	3	1	2	1	44	0	3	1
22	2017-06-27 21:48:26.81764+08	1	10	208.211143695015011	55	9.16666666666666963	3	2	1	70	1	1	1	55	1	3	2
53	2017-06-27 22:01:15.256806+08	2	22	202.252085452415002	91	7.58333333333333037	6	2	0	42	1	2	1	91	0	6	2
62	2017-06-27 22:01:15.272454+08	2	37	191.356205970909997	78	6.5	6	2	0	69	1	2	1	78	0	6	2
60	2017-06-27 22:01:15.269799+08	2	44	186.96296296296299	33	5.5	3	0	0	67	1	2	1	33	0	3	0
56	2017-06-27 22:01:15.260838+08	2	1	225.161682627115994	112	9.33333333333333037	6	4	2	41	1	2	1	112	2	6	4
64	2017-06-27 22:01:15.276905+08	2	42	187.651135005973998	34	5.66666666666666963	3	0	0	64	1	2	1	34	0	3	0
63	2017-06-27 22:01:15.275354+08	1	33	195.200687140910986	42	7	3	1	0	62	1	2	1	42	0	3	1
61	2017-06-27 22:01:15.271127+08	2	28	197.463261956460002	88	7.33333333333333037	6	2	0	63	1	2	1	88	0	6	2
65	2017-06-27 22:01:15.278184+08	1	38	190.303493986219991	32	5.33333333333333037	3	0	0	105	1	2	1	32	0	3	0
66	2017-06-27 22:01:15.284562+08	2	17	207.741674802046987	91	7.58333333333333037	6	3	0	73	1	2	1	91	0	6	3
68	2017-06-27 22:01:15.287542+08	2	31	195.604395604395989	39	6.5	3	1	0	72	1	2	1	39	0	3	1
43	2017-06-27 22:01:15.237396+08	2	9	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	2	1	97	0	6	3
67	2017-06-27 22:01:15.286003+08	1	7	217.768712034820993	60	10	3	3	0	104	1	2	1	60	0	3	3
70	2017-06-27 22:01:15.290316+08	2	12	211.253040798178006	102	8.5	6	4	0	74	1	2	1	102	0	6	4
44	2017-06-27 22:01:15.238903+08	1	43	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	2	1	35	0	3	0
42	2017-06-27 22:01:15.235561+08	2	5	220.379051246349007	98	8.16666666666666963	6	4	2	71	1	2	1	98	2	6	4
4	2017-06-27 21:48:26.778042+08	1	13	205.16129032258101	52	8.66666666666666963	3	2	0	89	1	1	1	52	0	3	2
21	2017-06-27 21:48:26.815994+08	1	22	198.896551724137993	44	7.33333333333333037	3	1	0	46	1	1	1	44	0	3	1
2	2017-06-27 21:48:26.773054+08	1	31	193.714285714286007	41	6.83333333333333037	3	0	0	90	1	1	1	41	0	3	0
5	2017-06-27 21:48:26.78009+08	1	27	195.636363636363996	45	7.5	3	0	0	81	1	1	1	45	0	3	0
7	2017-06-27 21:48:26.785536+08	1	11	208.098522167487999	52	8.66666666666666963	3	2	0	1	1	1	1	52	0	3	2
10	2017-06-27 21:48:26.790663+08	1	23	198.748778103617013	48	8	3	1	0	91	1	1	1	48	0	3	1
6	2017-06-27 21:48:26.783428+08	1	19	200.011942080908	45	7.5	3	2	0	87	1	1	1	45	0	3	2
31	2017-06-27 21:48:26.839931+08	1	32	193.010936494806998	36	6	3	1	0	58	1	1	1	36	0	3	1
8	2017-06-27 21:48:26.787356+08	1	21	198.999022482892997	48	8	3	0	0	79	1	1	1	48	0	3	0
9	2017-06-27 21:48:26.788983+08	1	17	201.000977517107003	49	8.16666666666666963	3	2	0	80	1	1	1	49	0	3	2
25	2017-06-27 21:48:26.824594+08	1	37	186.285714285713993	30	5	3	0	0	49	1	1	1	30	0	3	0
27	2017-06-27 21:48:26.830641+08	1	1	224.01656314699801	60	10	3	3	2	41	1	1	1	60	2	3	3
24	2017-06-27 21:48:26.822746+08	1	33	188.809902740936991	33	5.5	3	1	0	4	1	1	1	33	0	3	1
26	2017-06-27 21:48:26.828615+08	1	20	199.964404894327004	44	7.33333333333333037	3	1	0	3	1	1	1	44	0	3	1
29	2017-06-27 21:48:26.834508+08	1	6	214.684350132626008	56	9.33333333333333037	3	2	1	40	1	1	1	56	1	3	2
30	2017-06-27 21:48:26.836214+08	1	29	195.502612330199014	41	6.83333333333333037	3	1	0	42	1	1	1	41	0	3	1
28	2017-06-27 21:48:26.832786+08	1	18	200.523809523810002	45	7.5	3	1	0	43	1	1	1	45	0	3	1
11	2017-06-27 21:48:26.793854+08	1	35	187.651135005973998	34	5.66666666666666963	3	0	0	64	1	1	1	34	0	3	0
16	2017-06-27 21:48:26.80372+08	1	8	211.864016509177986	56	9.33333333333333037	3	2	0	2	1	1	1	56	0	3	2
12	2017-06-27 21:48:26.795401+08	1	39	176.296296296295992	21	3.5	3	0	0	61	1	1	1	21	0	3	0
15	2017-06-27 21:48:26.800496+08	1	25	197.022332506203014	42	7	3	0	0	69	1	1	1	42	0	3	0
13	2017-06-27 21:48:26.797086+08	1	12	205.686818928197994	50	8.33333333333333037	3	2	0	63	1	1	1	50	0	3	2
18	2017-06-27 21:48:26.806892+08	1	5	215.407407407406993	56	9.33333333333333037	3	2	0	74	1	1	1	56	0	3	2
19	2017-06-27 21:48:26.81131+08	1	28	195.604395604395989	39	6.5	3	1	0	72	1	1	1	39	0	3	1
17	2017-06-27 21:48:26.805318+08	1	7	212.321839080459995	52	8.66666666666666963	3	2	0	73	1	1	1	52	0	3	2
20	2017-06-27 21:48:26.812987+08	1	9	211.182795698924991	56	9.33333333333333037	3	3	0	84	1	1	1	56	0	3	3
1	2017-06-27 21:48:26.769554+08	1	15	202.727340142245993	49	8.16666666666666963	3	2	0	6	1	1	1	49	0	3	2
33	2017-06-27 21:48:26.842928+08	1	24	198.008124253286013	43	7.16666666666666963	3	2	0	53	1	1	1	43	0	3	2
35	2017-06-27 21:48:26.846103+08	1	40	163.031055900620999	8	1.33333333333332993	3	0	0	54	1	1	1	8	0	3	0
34	2017-06-27 21:48:26.844606+08	1	34	187.809523809523995	35	5.83333333333333037	3	0	0	55	1	1	1	35	0	3	0
32	2017-06-27 21:48:26.841451+08	1	30	194.666666666666998	42	7	3	1	0	100	1	1	1	42	0	3	1
38	2017-06-27 21:48:26.853304+08	1	2	219.809523809523995	57	9.5	3	2	0	88	1	1	1	57	0	3	2
36	2017-06-27 21:48:26.849965+08	1	4	217.675549322113	56	9.33333333333333037	3	3	0	71	1	1	1	56	0	3	3
37	2017-06-27 21:48:26.851699+08	1	16	202.02150537634401	43	7.16666666666666963	3	1	0	78	1	1	1	43	0	3	1
40	2017-06-27 21:48:26.856816+08	1	3	219.407407407406993	60	10	3	3	0	76	1	1	1	60	0	3	3
69	2017-06-27 22:01:15.289018+08	2	16	208.712796158308009	104	8.66666666666666963	6	4	0	2	1	2	1	104	0	6	4
58	2017-06-27 22:01:15.264086+08	2	30	196.418801515144992	88	7.33333333333333037	6	2	0	43	1	2	1	88	0	6	2
110	2017-06-27 22:11:45.400499+08	3	9	214.742499074669013	149	8.27777777777778034	9	5	1	46	1	3	1	149	1	9	5
76	2017-06-27 22:01:15.302953+08	2	47	180.594976057205997	69	5.75	6	0	0	55	1	2	1	69	0	6	0
78	2017-06-27 22:01:15.310255+08	2	10	211.864359283921004	104	8.66666666666666963	6	3	0	1	1	2	1	104	0	6	3
73	2017-06-27 22:01:15.298785+08	2	29	196.788849609625004	81	6.75	6	3	0	58	1	2	1	81	0	6	3
72	2017-06-27 22:01:15.297247+08	2	50	151.40648580159899	36	3	6	0	0	54	1	2	1	36	0	6	0
74	2017-06-27 22:01:15.300338+08	1	11	211.492070094698988	52	8.66666666666666963	3	2	1	56	1	2	1	52	1	3	2
77	2017-06-27 22:01:15.304242+08	2	40	189.043532249451005	80	6.66666666666666963	6	2	0	53	1	2	1	80	0	6	2
81	2017-06-27 22:01:15.314936+08	1	45	186.490487828123008	34	5.66666666666666963	3	0	0	97	1	2	1	34	0	3	0
82	2017-06-27 22:01:15.316141+08	2	34	194.819373302375993	91	7.58333333333333037	6	0	0	79	1	2	1	91	0	6	0
83	2017-06-27 22:01:15.317466+08	2	26	198.748778103617013	48	8	3	1	0	91	1	2	1	48	0	3	1
89	2017-06-27 22:01:15.328183+08	2	46	186.285714285713993	30	5	3	0	0	49	1	2	1	30	0	3	0
88	2017-06-27 22:01:15.326857+08	2	13	210.797695449466005	108	9	6	3	1	70	1	2	1	108	1	6	3
79	2017-06-27 22:01:15.3118+08	1	41	188.240355949430011	35	5.83333333333333037	3	1	0	83	1	2	1	35	0	3	1
87	2017-06-27 22:01:15.325571+08	2	48	179.551780285467004	71	5.91666666666666963	6	1	0	47	1	2	1	71	0	6	1
85	2017-06-27 22:01:15.322837+08	1	19	204.645161290322989	51	8.5	3	1	0	48	1	2	1	51	0	3	1
41	2017-06-27 22:01:15.233878+08	2	23	202.02150537634401	43	7.16666666666666963	3	1	0	78	1	2	1	43	0	3	1
90	2017-06-27 22:01:15.329579+08	2	21	202.66559091258199	89	7.41666666666666963	6	4	0	4	1	2	1	89	0	6	4
125	2017-06-27 22:11:45.442741+08	3	15	211.253040798178006	102	8.5	6	4	0	74	1	3	1	102	0	6	4
86	2017-06-27 22:01:15.324235+08	2	8	212.636299422500002	100	8.33333333333333037	6	3	0	46	1	2	1	100	0	6	3
111	2017-06-27 22:11:45.402287+08	3	20	205.909621456682004	146	8.11111111111111072	9	4	1	70	1	3	1	146	1	9	4
112	2017-06-27 22:11:45.413554+08	3	5	220.379051246349007	98	8.16666666666666963	6	4	2	71	1	3	1	98	2	6	4
109	2017-06-27 22:11:45.399112+08	3	53	182.203390406813014	72	6	6	0	0	49	1	3	1	72	0	6	0
108	2017-06-27 22:11:45.39767+08	3	54	181.793758611606989	113	6.27777777777778034	9	2	0	47	1	3	1	113	0	9	2
107	2017-06-27 22:11:45.396147+08	3	12	213.548182052525988	146	8.11111111111111072	9	7	0	4	1	3	1	146	0	9	7
116	2017-06-27 22:11:45.420766+08	3	46	188.589969191978014	78	6.5	6	1	0	78	1	3	1	78	0	6	1
118	2017-06-27 22:11:45.423728+08	1	26	202.057110597328005	45	7.5	3	2	1	5	1	3	1	45	1	3	2
117	2017-06-27 22:11:45.422242+08	1	18	207.267805536312011	51	8.5	3	2	0	77	1	3	1	51	0	3	2
120	2017-06-27 22:11:45.427001+08	3	7	216.187161496199991	155	8.61111111111111072	9	6	0	76	1	3	1	155	0	9	6
114	2017-06-27 22:11:45.417626+08	2	49	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	3	1	35	0	3	0
119	2017-06-27 22:11:45.425241+08	3	23	203.807596953266994	90	7.5	6	3	1	92	1	3	1	90	1	6	3
124	2017-06-27 22:11:45.440948+08	3	17	208.315488409213003	149	8.27777777777778034	9	5	0	2	1	3	1	149	0	9	5
122	2017-06-27 22:11:45.437393+08	3	36	195.604395604395989	39	6.5	3	1	0	72	1	3	1	39	0	3	1
121	2017-06-27 22:11:45.434556+08	2	6	219.347956987709011	109	9.08333333333333037	6	5	0	104	1	3	1	109	0	6	5
126	2017-06-27 22:11:45.44422+08	3	27	201.350026447994992	126	7	9	4	0	73	1	3	1	126	0	9	4
127	2017-06-27 22:11:45.445707+08	3	22	204.539945413990012	140	7.77777777777778034	9	7	0	84	1	3	1	140	0	9	7
134	2017-06-27 22:11:45.46148+08	3	41	191.936316990254994	128	7.11111111111110983	9	3	0	43	1	3	1	128	0	9	3
129	2017-06-27 22:11:45.45276+08	2	1	241.935599487693992	120	10	6	6	2	44	1	3	1	120	2	6	6
136	2017-06-27 22:11:45.469231+08	2	16	210.585489538448002	52	8.66666666666666963	3	2	0	93	1	3	1	52	0	3	2
133	2017-06-27 22:11:45.459104+08	1	35	195.728696305900002	38	6.33333333333333037	3	0	0	45	1	3	1	38	0	3	0
128	2017-06-27 22:11:45.451118+08	3	25	202.252085452415002	91	7.58333333333333037	6	2	0	42	1	3	1	91	0	6	2
132	2017-06-27 22:11:45.457566+08	3	2	229.537823978599988	160	8.88888888888888928	9	7	1	40	1	3	1	160	1	9	7
130	2017-06-27 22:11:45.454497+08	3	29	199.964404894327004	44	7.33333333333333037	3	1	0	3	1	3	1	44	0	3	1
131	2017-06-27 22:11:45.456101+08	3	3	228.63714197523899	157	8.72222222222221966	9	5	2	41	1	3	1	157	2	9	5
94	2017-06-27 22:11:45.35189+08	3	42	191.03105192028201	84	7	6	1	0	64	1	3	1	84	0	6	1
135	2017-06-27 22:11:45.467641+08	3	13	212.603685081961004	141	7.83333333333333037	9	5	2	6	1	3	1	141	2	9	5
137	2017-06-27 22:11:45.470635+08	3	47	187.931596127196997	82	6.83333333333333037	6	1	0	90	1	3	1	82	0	6	1
96	2017-06-27 22:11:45.357001+08	2	30	199.925463466672994	93	7.75	6	2	0	62	1	3	1	93	0	6	2
93	2017-06-27 22:11:45.350113+08	3	19	206.287909881089007	134	7.4444444444444402	9	4	0	69	1	3	1	134	0	9	4
95	2017-06-27 22:11:45.354+08	3	57	164.945166183103993	97	5.38888888888889017	9	1	0	61	1	3	1	97	0	9	1
91	2017-06-27 22:11:45.345195+08	3	33	197.463261956460002	88	7.33333333333333037	6	2	0	63	1	3	1	88	0	6	2
92	2017-06-27 22:11:45.348163+08	1	40	194.281409264230007	43	7.16666666666666963	3	0	0	66	1	3	1	43	0	3	0
97	2017-06-27 22:11:45.358877+08	3	50	186.96296296296299	33	5.5	3	0	0	67	1	3	1	33	0	3	0
104	2017-06-27 22:11:45.383879+08	3	55	179.094413230924999	125	6.9444444444444402	9	3	0	80	1	3	1	125	0	9	3
105	2017-06-27 22:11:45.387958+08	3	8	215.808642359937011	158	8.77777777777778034	9	6	0	1	1	3	1	158	0	9	6
99	2017-06-27 22:11:45.37376+08	2	38	194.515657124965998	89	7.41666666666666963	6	4	0	83	1	3	1	89	0	6	4
100	2017-06-27 22:11:45.375785+08	3	45	189.278067508842014	133	7.38888888888889017	9	1	0	79	1	3	1	133	0	9	1
101	2017-06-27 22:11:45.378588+08	3	32	197.734107380629013	98	8.16666666666666963	6	1	0	91	1	3	1	98	0	6	1
102	2017-06-27 22:11:45.380469+08	2	52	186.490487828123008	34	5.66666666666666963	3	0	0	97	1	3	1	34	0	3	0
106	2017-06-27 22:11:45.393728+08	2	21	204.645161290322989	51	8.5	3	1	0	48	1	3	1	51	0	3	1
71	2017-06-27 22:01:15.291549+08	2	6	217.833561548273991	109	9.08333333333333037	6	6	0	84	1	2	1	109	0	6	6
146	2017-06-27 22:11:45.493146+08	3	37	194.666666666666998	42	7	3	1	0	100	1	3	1	42	0	3	1
142	2017-06-27 22:11:45.487112+08	1	10	213.999049971941986	57	9.5	3	3	1	52	1	3	1	57	1	3	3
148	2017-06-27 22:11:45.495882+08	3	44	189.563909249722002	121	6.72222222222221966	9	2	0	55	1	3	1	121	0	9	2
145	2017-06-27 22:11:45.491819+08	3	58	151.40648580159899	36	3	6	0	0	54	1	3	1	36	0	6	0
187	2017-06-27 22:24:29.500643+08	3	50	183.166795710477004	124	6.88888888888889017	9	4	0	83	1	4	1	124	0	9	4
143	2017-06-27 22:11:45.488639+08	2	11	213.640369840167011	99	8.25	6	4	1	56	1	3	1	99	1	6	4
147	2017-06-27 22:11:45.494476+08	3	51	186.614854109117999	124	6.88888888888889017	9	3	0	53	1	3	1	124	0	9	3
141	2017-06-27 22:11:45.485393+08	3	34	196.788849609625004	81	6.75	6	3	0	58	1	3	1	81	0	6	3
188	2017-06-27 22:24:29.502234+08	1	42	192.343268740602014	39	6.5	3	0	0	109	1	4	1	39	0	3	0
164	2017-06-27 22:24:29.458471+08	3	45	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	4	1	35	0	3	0
165	2017-06-27 22:24:29.459912+08	2	28	202.613548575534992	47	7.83333333333333037	3	1	0	82	1	4	1	47	0	3	1
170	2017-06-27 22:24:29.466796+08	4	5	235.570983352067998	215	8.95833333333333037	12	9	0	76	1	4	1	215	0	12	9
167	2017-06-27 22:24:29.462864+08	2	17	211.352016116620007	100	8.33333333333333037	6	4	2	5	1	4	1	100	2	6	4
168	2017-06-27 22:24:29.464145+08	4	57	175.081952721704994	109	6.0555555555555598	9	1	0	78	1	4	1	109	0	9	1
169	2017-06-27 22:24:29.465469+08	4	24	203.807596953266994	90	7.5	6	3	1	92	1	4	1	90	1	6	3
171	2017-06-27 22:24:29.470979+08	1	26	203.09197955511101	48	8	3	2	0	107	1	4	1	48	0	3	2
179	2017-06-27 22:24:29.485622+08	3	51	180.949474597407004	64	5.33333333333333037	6	1	0	105	1	4	1	64	0	6	1
172	2017-06-27 22:24:29.473905+08	4	44	191.03105192028201	84	7	6	1	0	64	1	4	1	84	0	6	1
178	2017-06-27 22:24:29.484278+08	4	38	197.463261956460002	88	7.33333333333333037	6	2	0	63	1	4	1	88	0	6	2
173	2017-06-27 22:24:29.475222+08	4	19	209.027597358067993	182	7.58333333333333037	12	5	0	69	1	4	1	182	0	12	5
175	2017-06-27 22:24:29.477971+08	3	32	199.925463466672994	93	7.75	6	2	0	62	1	4	1	93	0	6	2
176	2017-06-27 22:24:29.479492+08	2	55	179.078054992319011	72	6	6	0	0	66	1	4	1	72	0	6	0
177	2017-06-27 22:24:29.482099+08	4	60	167.262514123337013	56	4.66666666666666963	6	1	0	67	1	4	1	56	0	6	1
186	2017-06-27 22:24:29.499237+08	4	36	197.734107380629013	98	8.16666666666666963	6	1	0	91	1	4	1	98	0	6	1
180	2017-06-27 22:24:29.49073+08	1	43	191.201452338244991	35	5.83333333333333037	3	1	0	108	1	4	1	35	0	3	1
181	2017-06-27 22:24:29.492311+08	4	59	168.202946078047006	153	6.375	12	1	0	79	1	4	1	153	0	12	1
182	2017-06-27 22:24:29.493596+08	4	13	212.844588589978002	197	8.20833333333333037	12	8	0	1	1	4	1	197	0	12	8
185	2017-06-27 22:24:29.497299+08	4	54	179.094413230924999	125	6.9444444444444402	9	3	0	80	1	4	1	125	0	9	3
183	2017-06-27 22:24:29.494812+08	3	48	186.490487828123008	34	5.66666666666666963	3	0	0	97	1	4	1	34	0	3	0
184	2017-06-27 22:24:29.496026+08	4	30	200.011942080908	45	7.5	3	2	0	87	1	4	1	45	0	3	2
190	2017-06-27 22:24:29.508102+08	4	29	200.160466433391008	168	7	12	5	0	73	1	4	1	168	0	12	5
191	2017-06-27 22:24:29.509356+08	4	6	235.53290000247901	162	9	9	7	1	74	1	4	1	162	1	9	7
192	2017-06-27 22:24:29.511212+08	4	12	213.405291684191013	203	8.45833333333333037	12	7	0	2	1	4	1	203	0	12	7
195	2017-06-27 22:24:29.516589+08	4	23	204.539945413990012	140	7.77777777777778034	9	7	0	84	1	4	1	140	0	9	7
203	2017-06-27 22:24:29.529967+08	2	18	210.959724858491995	101	8.41666666666666963	6	5	1	52	1	4	1	101	1	6	5
197	2017-06-27 22:24:29.522208+08	4	53	179.430586686624991	155	6.45833333333333037	12	2	0	55	1	4	1	155	0	12	2
196	2017-06-27 22:24:29.520957+08	3	11	213.640369840167011	99	8.25	6	4	1	56	1	4	1	99	1	6	4
198	2017-06-27 22:24:29.523544+08	2	58	168.257256379800992	12	2	3	0	0	106	1	4	1	12	0	3	0
200	2017-06-27 22:24:29.526181+08	4	46	186.614854109117999	124	6.88888888888889017	9	3	0	53	1	4	1	124	0	9	3
201	2017-06-27 22:24:29.527504+08	4	62	138.789019959592991	63	3.5	9	0	0	54	1	4	1	63	0	9	0
202	2017-06-27 22:24:29.528706+08	4	27	203.001615001488005	131	7.27777777777778034	9	4	1	58	1	4	1	131	1	9	4
199	2017-06-27 22:24:29.524838+08	4	40	194.666666666666998	42	7	3	1	0	100	1	4	1	42	0	3	1
204	2017-06-27 22:24:29.531168+08	1	34	198.269349894263996	43	7.16666666666666963	3	1	0	57	1	4	1	43	0	3	1
206	2017-06-27 22:24:29.536247+08	4	15	212.492579946195008	194	8.08333333333333037	12	6	1	46	1	4	1	194	1	12	6
205	2017-06-27 22:24:29.534968+08	3	22	204.645161290322989	51	8.5	3	1	0	48	1	4	1	51	0	3	1
207	2017-06-27 22:24:29.537551+08	4	52	180.778749273274997	156	6.5	12	3	0	47	1	4	1	156	0	12	3
149	2017-06-27 22:24:29.432071+08	3	2	241.935599487693992	120	10	6	6	2	44	1	4	1	120	2	6	6
150	2017-06-27 22:24:29.433889+08	4	31	199.964404894327004	44	7.33333333333333037	3	1	0	3	1	4	1	44	0	3	1
152	2017-06-27 22:24:29.43673+08	2	25	203.51028087185199	87	7.25	6	1	1	45	1	4	1	87	1	6	1
156	2017-06-27 22:24:29.444896+08	4	21	205.897384597773993	180	7.5	12	6	2	6	1	4	1	180	2	12	6
151	2017-06-27 22:24:29.435309+08	4	1	246.945645360142009	220	9.16666666666666963	12	10	3	40	1	4	1	220	3	12	10
153	2017-06-27 22:24:29.438143+08	4	4	236.962723559777004	213	8.875	12	8	3	41	1	4	1	213	3	12	8
155	2017-06-27 22:24:29.440882+08	4	35	197.735795502645999	133	7.38888888888889017	9	3	0	42	1	4	1	133	0	9	3
154	2017-06-27 22:24:29.439527+08	4	39	196.71851389393899	176	7.33333333333333037	12	4	0	43	1	4	1	176	0	12	4
157	2017-06-27 22:24:29.446286+08	4	47	186.533467564332994	126	7	9	3	0	90	1	4	1	126	0	9	3
158	2017-06-27 22:24:29.447614+08	3	37	197.483599825688998	85	7.08333333333333037	6	2	0	93	1	4	1	85	0	6	2
159	2017-06-27 22:24:29.448911+08	4	41	194.418256227857995	135	7.5	9	4	0	89	1	4	1	135	0	9	4
163	2017-06-27 22:24:29.457156+08	4	3	238.420966972184004	158	8.77777777777778034	9	7	2	71	1	4	1	158	2	9	7
161	2017-06-27 22:24:29.451449+08	4	56	176.04707921391099	153	6.375	12	3	0	81	1	4	1	153	0	12	3
139	2017-06-27 22:11:45.477015+08	3	48	187.474158007699998	121	6.72222222222221966	9	2	0	81	1	3	1	121	0	9	2
249	2017-06-27 22:26:18.56313+08	5	16	215.791400718465013	234	7.79999999999999982	15	7	0	69	1	5	1	234	0	15	7
234	2017-06-27 22:26:18.536245+08	5	11	224.904722651349005	200	8.33333333333333037	12	10	0	84	1	5	1	200	0	12	10
230	2017-06-27 22:26:18.530223+08	3	34	198.273767470361008	44	7.33333333333333037	3	1	0	75	1	5	1	44	0	3	1
233	2017-06-27 22:26:18.535025+08	5	7	231.860186125160993	153	8.5	9	6	1	72	1	5	1	153	1	9	6
228	2017-06-27 22:26:18.527575+08	5	4	239.497301101543997	212	8.83333333333333037	12	9	1	74	1	5	1	212	1	12	9
229	2017-06-27 22:26:18.528773+08	5	31	199.662474915596988	212	7.06666666666666998	15	7	0	73	1	5	1	212	0	15	7
236	2017-06-27 22:26:18.54144+08	5	12	223.639223240071999	238	7.93333333333333002	15	9	5	46	1	5	1	238	5	15	9
237	2017-06-27 22:26:18.542927+08	5	14	216.799858782720008	203	8.45833333333333037	12	7	2	70	1	5	1	203	2	12	7
275	2017-06-27 22:26:21.704536+08	1	47	184.376776349604995	23	3.83333333333332993	3	0	0	96	1	6	1	23	0	3	0
235	2017-06-27 22:26:18.540114+08	5	56	171.638253507400009	190	6.33333333333333037	15	3	0	47	1	5	1	190	0	15	3
239	2017-06-27 22:26:18.547114+08	5	22	207.102815294694011	233	7.76666666666667016	15	10	0	4	1	5	1	233	0	15	10
238	2017-06-27 22:26:18.54569+08	1	55	173.940955318065988	17	2.83333333333332993	3	0	0	110	1	5	1	17	0	3	0
240	2017-06-27 22:26:18.548299+08	5	54	175.307660885021988	152	6.33333333333333037	12	2	0	49	1	5	1	152	0	12	2
250	2017-06-27 22:26:18.566141+08	4	51	180.949474597407004	64	5.33333333333333037	6	1	0	105	1	5	1	64	0	6	1
244	2017-06-27 22:26:18.556418+08	3	53	175.959340173918008	113	6.27777777777778034	9	1	0	66	1	5	1	113	0	9	1
242	2017-06-27 22:26:18.553597+08	2	32	199.521151436064002	87	7.25	6	4	0	107	1	5	1	87	0	6	4
247	2017-06-27 22:26:18.560345+08	5	38	197.463261956460002	88	7.33333333333333037	6	2	0	63	1	5	1	88	0	6	2
243	2017-06-27 22:26:18.555095+08	5	63	156.136527623382989	132	5.5	12	1	0	61	1	5	1	132	0	12	1
245	2017-06-27 22:26:18.557804+08	4	30	199.925463466672994	93	7.75	6	2	0	62	1	5	1	93	0	6	2
246	2017-06-27 22:26:18.559083+08	5	61	167.262514123337013	56	4.66666666666666963	6	1	0	67	1	5	1	56	0	6	1
248	2017-06-27 22:26:18.561714+08	5	52	178.918474579204002	114	6.33333333333333037	9	2	0	64	1	5	1	114	0	9	2
252	2017-06-27 22:26:18.572204+08	5	21	207.966916691211992	231	7.70000000000000018	15	8	2	6	1	5	1	231	2	15	8
254	2017-06-27 22:26:18.575006+08	5	9	227.936544201275012	249	8.30000000000000071	15	9	1	7	1	5	1	249	1	15	9
255	2017-06-27 22:26:18.576503+08	5	59	169.486128955803991	190	6.33333333333333037	15	4	0	81	1	5	1	190	0	15	4
256	2017-06-27 22:26:18.577894+08	5	20	209.230117249589	192	8	12	7	0	89	1	5	1	192	0	12	7
257	2017-06-27 22:26:18.582425+08	5	58	171.037216576935009	193	6.43333333333333002	15	2	0	79	1	5	1	193	0	15	2
272	2017-06-27 22:26:18.608462+08	5	18	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	5	1	97	0	6	3
258	2017-06-27 22:26:18.583738+08	4	49	183.813891301973996	74	6.16666666666666963	6	0	0	97	1	5	1	74	0	6	0
259	2017-06-27 22:26:18.585185+08	5	47	185.378227260746002	171	7.125	12	5	0	80	1	5	1	171	0	12	5
260	2017-06-27 22:26:18.586608+08	5	48	184.587555770371011	72	6	6	3	0	87	1	5	1	72	0	6	3
263	2017-06-27 22:26:18.590868+08	5	15	216.254064080179006	242	8.06666666666666998	15	10	0	1	1	5	1	242	0	15	10
262	2017-06-27 22:26:18.58959+08	4	50	183.166795710477004	124	6.88888888888889017	9	4	0	83	1	5	1	124	0	9	4
264	2017-06-27 22:26:18.592043+08	2	42	192.343268740602014	39	6.5	3	0	0	109	1	5	1	39	0	3	0
261	2017-06-27 22:26:18.588014+08	5	36	197.734107380629013	98	8.16666666666666963	6	1	0	91	1	5	1	98	0	6	1
267	2017-06-27 22:26:18.600316+08	3	28	202.613548575534992	47	7.83333333333333037	3	1	0	82	1	5	1	47	0	3	1
273	2017-06-27 22:26:18.609787+08	5	26	203.807596953266994	90	7.5	6	3	1	92	1	5	1	90	1	6	3
270	2017-06-27 22:26:18.605704+08	5	5	238.332610612898009	204	8.5	12	9	3	71	1	5	1	204	3	12	9
269	2017-06-27 22:26:18.604026+08	5	57	171.068064741220013	151	6.29166666666666963	12	2	0	78	1	5	1	151	0	12	2
271	2017-06-27 22:26:18.607117+08	3	24	205.50200629689499	142	7.88888888888889017	9	3	0	77	1	5	1	142	0	9	3
219	2017-06-27 22:26:18.51126+08	3	19	210.959724858491995	101	8.41666666666666963	6	5	1	52	1	5	1	101	1	6	5
274	2017-06-27 22:26:18.611104+08	5	6	237.406928366280994	268	8.93333333333333002	15	11	0	76	1	5	1	268	0	15	11
216	2017-06-27 22:26:18.507288+08	5	45	190.818623005082998	173	7.20833333333333037	12	4	0	53	1	5	1	173	0	12	4
211	2017-06-27 22:26:18.500685+08	4	17	213.640369840167011	99	8.25	6	4	1	56	1	5	1	99	1	6	4
217	2017-06-27 22:26:18.508644+08	5	27	203.001615001488005	131	7.27777777777778034	9	4	1	58	1	5	1	131	1	9	4
212	2017-06-27 22:26:18.501989+08	5	64	125.476466607361004	85	3.54166666666667007	12	0	0	54	1	5	1	85	0	12	0
218	2017-06-27 22:26:18.510007+08	5	62	166.51207161083201	182	6.06666666666666998	15	2	0	55	1	5	1	182	0	15	2
213	2017-06-27 22:26:18.503302+08	3	60	168.257256379800992	12	2	3	0	0	106	1	5	1	12	0	3	0
220	2017-06-27 22:26:18.512483+08	2	43	192.170657565724014	80	6.66666666666666963	6	1	0	57	1	5	1	80	0	6	1
215	2017-06-27 22:26:18.505819+08	5	40	194.666666666666998	42	7	3	1	0	100	1	5	1	42	0	3	1
214	2017-06-27 22:26:18.504582+08	1	33	199.471474551643013	42	7	3	2	0	59	1	5	1	42	0	3	2
226	2017-06-27 22:26:18.5227+08	5	35	197.735795502645999	133	7.38888888888889017	9	3	0	42	1	5	1	133	0	9	3
222	2017-06-27 22:26:18.5175+08	5	2	248.074542975921986	270	9	15	11	3	41	1	5	1	270	3	15	11
224	2017-06-27 22:26:18.520219+08	3	23	205.578765758010007	133	7.38888888888889017	9	2	1	45	1	5	1	133	1	9	2
225	2017-06-27 22:26:18.521453+08	5	1	262.012353576199985	280	9.33333333333333037	15	13	4	40	1	5	1	280	4	15	13
231	2017-06-27 22:26:18.531905+08	5	13	217.44703622755199	250	8.33333333333333037	15	9	0	2	1	5	1	250	0	15	9
227	2017-06-27 22:26:18.524014+08	4	3	241.935599487693992	120	10	6	6	2	44	1	5	1	120	2	6	6
223	2017-06-27 22:26:18.518829+08	5	29	200.505728475234008	95	7.91666666666666963	6	3	0	3	1	5	1	95	0	6	3
221	2017-06-27 22:26:18.51617+08	5	39	196.584695103628007	227	7.56666666666666998	15	6	0	43	1	5	1	227	0	15	6
210	2017-06-27 22:24:29.541494+08	4	9	223.888313429613987	203	8.45833333333333037	12	10	0	4	1	4	1	203	0	12	10
277	2017-06-27 22:26:21.707229+08	5	49	183.813891301973996	74	6.16666666666666963	6	0	0	97	1	6	1	74	0	6	0
276	2017-06-27 22:26:21.705906+08	3	48	183.868806737798991	71	5.91666666666666963	6	0	0	109	1	6	1	71	0	6	0
342	2017-06-27 22:26:25.553578+08	6	50	183.519666904788011	121	6.72222222222221966	9	2	0	48	1	7	1	121	0	9	2
344	2017-06-27 22:26:25.556118+08	7	9	230.884380416249996	333	7.92857142857142971	21	13	6	46	1	7	1	333	6	21	13
346	2017-06-27 22:26:25.55861+08	7	20	214.870328025585991	328	7.8095238095238102	21	14	0	4	1	7	1	328	0	21	14
286	2017-06-27 22:26:21.722012+08	6	11	229.62237446663201	245	8.16666666666666963	15	10	3	71	1	6	1	245	3	15	10
285	2017-06-27 22:26:21.720723+08	6	60	165.117050140493006	185	6.16666666666666963	15	2	0	78	1	6	1	185	0	15	2
289	2017-06-27 22:26:21.726007+08	4	7	231.136784935305002	203	8.45833333333333037	12	8	4	5	1	6	1	203	4	12	8
290	2017-06-27 22:26:21.727382+08	4	19	214.548313222892006	196	8.16666666666666963	12	6	0	77	1	6	1	196	0	12	6
291	2017-06-27 22:26:21.728765+08	6	20	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	6	1	97	0	6	3
293	2017-06-27 22:26:21.731455+08	6	9	229.808374202463	306	8.5	18	11	0	76	1	6	1	306	0	18	11
292	2017-06-27 22:26:21.730073+08	6	27	203.807596953266994	90	7.5	6	3	1	92	1	6	1	90	1	6	3
294	2017-06-27 22:26:21.735974+08	4	35	198.273767470361008	44	7.33333333333333037	3	1	0	75	1	6	1	44	0	3	1
297	2017-06-27 22:26:21.740212+08	6	4	242.576255382985011	260	8.66666666666666963	15	11	1	74	1	6	1	260	1	15	11
296	2017-06-27 22:26:21.738903+08	5	8	229.959130983422995	165	9.16666666666666963	9	7	0	104	1	6	1	165	0	9	7
298	2017-06-27 22:26:21.741495+08	6	39	196.85431501595599	253	7.02777777777778034	18	7	0	73	1	6	1	253	0	18	7
299	2017-06-27 22:26:21.742776+08	6	14	220.734531330548009	303	8.41666666666666963	18	11	0	2	1	6	1	303	0	18	11
295	2017-06-27 22:26:21.737504+08	6	6	231.70663159795501	201	8.375	12	8	1	72	1	6	1	201	1	12	8
300	2017-06-27 22:26:21.744114+08	6	10	229.747767080178988	251	8.36666666666667069	15	12	0	84	1	6	1	251	0	15	12
301	2017-06-27 22:26:21.74959+08	6	23	208.665293416048002	236	7.8666666666666698	15	8	0	90	1	6	1	236	0	15	8
303	2017-06-27 22:26:21.752298+08	6	21	212.038793765126997	279	7.75	18	10	2	6	1	6	1	279	2	18	10
302	2017-06-27 22:26:21.751+08	5	37	197.483599825688998	85	7.08333333333333037	6	2	0	93	1	6	1	85	0	6	2
304	2017-06-27 22:26:21.753694+08	6	5	232.931393999108991	296	8.22222222222221966	18	11	2	7	1	6	1	296	2	18	11
305	2017-06-27 22:26:21.755075+08	6	15	220.378118958327008	242	8.06666666666666998	15	9	1	89	1	6	1	242	1	15	9
306	2017-06-27 22:26:21.756371+08	6	61	164.249021030984011	223	6.1944444444444402	18	4	0	81	1	6	1	223	0	18	4
313	2017-06-27 22:26:21.769977+08	6	17	216.098643608315996	250	8.33333333333333037	15	9	3	70	1	6	1	250	3	15	9
308	2017-06-27 22:26:21.761539+08	2	56	173.940955318065988	17	2.83333333333332993	3	0	0	110	1	6	1	17	0	3	0
310	2017-06-27 22:26:21.764257+08	6	16	217.200864318804008	278	7.72222222222221966	18	10	5	46	1	6	1	278	5	18	10
311	2017-06-27 22:26:21.765525+08	5	45	185.049103204688009	76	6.33333333333333037	6	1	0	48	1	6	1	76	0	6	1
312	2017-06-27 22:26:21.76773+08	6	59	167.409979463424008	223	6.1944444444444402	18	4	0	47	1	6	1	223	0	18	4
309	2017-06-27 22:26:21.762918+08	6	55	175.307660885021988	152	6.33333333333333037	12	2	0	49	1	6	1	152	0	12	2
321	2017-06-27 22:26:21.784548+08	4	22	210.959724858491995	101	8.41666666666666963	6	5	1	52	1	6	1	101	1	6	5
322	2017-06-27 22:26:21.78614+08	6	63	157.544745416779989	216	6	18	2	0	55	1	6	1	216	0	18	2
315	2017-06-27 22:26:21.776099+08	2	33	199.471474551643013	42	7	3	2	0	59	1	6	1	42	0	3	2
314	2017-06-27 22:26:21.774664+08	4	58	168.257256379800992	12	2	3	0	0	106	1	6	1	12	0	3	0
317	2017-06-27 22:26:21.779018+08	6	40	194.666666666666998	42	7	3	1	0	100	1	6	1	42	0	3	1
320	2017-06-27 22:26:21.782873+08	6	34	198.593540789093993	228	7.59999999999999964	15	7	0	53	1	6	1	228	0	15	7
323	2017-06-27 22:26:21.787551+08	3	41	192.170657565724014	80	6.66666666666666963	6	1	0	57	1	6	1	80	0	6	1
329	2017-06-27 22:26:21.799553+08	6	38	197.463261956460002	88	7.33333333333333037	6	2	0	63	1	6	1	88	0	6	2
327	2017-06-27 22:26:21.795882+08	6	57	170.052127333089999	103	5.72222222222221966	9	3	0	67	1	6	1	103	0	9	3
328	2017-06-27 22:26:21.797438+08	6	64	153.03496156135401	170	5.66666666666666963	15	1	0	61	1	6	1	170	0	15	1
326	2017-06-27 22:26:21.794631+08	5	31	199.925463466672994	93	7.75	6	2	0	62	1	6	1	93	0	6	2
331	2017-06-27 22:26:21.802577+08	6	13	220.946823440776001	288	8	18	10	1	69	1	6	1	288	1	18	10
324	2017-06-27 22:26:21.791986+08	3	32	199.521151436064002	87	7.25	6	4	0	107	1	6	1	87	0	6	4
330	2017-06-27 22:26:21.801247+08	6	52	178.918474579204002	114	6.33333333333333037	9	2	0	64	1	6	1	114	0	9	2
325	2017-06-27 22:26:21.793342+08	4	53	177.742284700023987	157	6.54166666666666963	12	2	0	66	1	6	1	157	0	12	2
332	2017-06-27 22:26:21.803958+08	5	54	175.696417534824008	111	6.16666666666666963	9	2	0	105	1	6	1	111	0	9	2
336	2017-06-27 22:26:21.812359+08	6	2	261.131186981845985	330	9.16666666666666963	18	14	4	41	1	6	1	330	4	18	14
335	2017-06-27 22:26:21.811152+08	5	3	242.640687867796998	163	9.05555555555556069	9	8	3	44	1	6	1	163	3	9	8
333	2017-06-27 22:26:21.808307+08	6	30	200.505728475234008	95	7.91666666666666963	6	3	0	3	1	6	1	95	0	6	3
334	2017-06-27 22:26:21.809671+08	4	25	205.578765758010007	133	7.38888888888889017	9	2	1	45	1	6	1	133	1	9	2
338	2017-06-27 22:26:21.814853+08	6	43	190.628925565960998	269	7.47222222222221966	18	7	0	43	1	6	1	269	0	18	7
337	2017-06-27 22:26:21.813674+08	6	1	272.243190010316994	340	9.44444444444443931	18	16	5	40	1	6	1	340	5	18	16
278	2017-06-27 22:26:21.70854+08	6	46	184.587555770371011	72	6	6	3	0	87	1	6	1	72	0	6	3
280	2017-06-27 22:26:21.711306+08	5	50	183.166795710477004	124	6.88888888888889017	9	4	0	83	1	6	1	124	0	9	4
282	2017-06-27 22:26:21.714112+08	6	51	179.784224950106989	208	6.93333333333333002	15	6	0	80	1	6	1	208	0	15	6
281	2017-06-27 22:26:21.712818+08	3	42	191.201452338244991	35	5.83333333333333037	3	1	0	108	1	6	1	35	0	3	1
279	2017-06-27 22:26:21.709914+08	6	36	197.734107380629013	98	8.16666666666666963	6	1	0	91	1	6	1	98	0	6	1
283	2017-06-27 22:26:21.715448+08	6	12	228.078375384141992	291	8.08333333333333037	18	12	2	1	1	6	1	291	2	18	12
284	2017-06-27 22:26:21.716766+08	6	62	163.487714507059991	224	6.22222222222221966	18	2	0	79	1	6	1	224	0	18	2
345	2017-06-27 22:26:25.557462+08	7	19	216.098643608315996	250	8.33333333333333037	15	9	3	70	1	7	1	250	3	15	9
363	2017-06-27 22:26:25.587245+08	7	18	217.039216215528	287	7.97222222222221966	18	13	0	84	1	7	1	287	0	18	13
359	2017-06-27 22:26:25.581644+08	7	40	196.85431501595599	253	7.02777777777778034	18	7	0	73	1	7	1	253	0	18	7
361	2017-06-27 22:26:25.58467+08	7	5	235.355181655347991	254	8.46666666666667034	15	10	2	72	1	7	1	254	2	15	10
358	2017-06-27 22:26:25.580207+08	6	6	234.352249780616006	219	9.125	12	9	0	104	1	7	1	219	0	12	9
360	2017-06-27 22:26:25.583203+08	7	4	241.694675663693999	309	8.58333333333333037	18	13	1	74	1	7	1	309	1	18	13
367	2017-06-27 22:26:25.596772+08	6	28	207.025091729964998	129	7.16666666666666963	9	3	1	93	1	7	1	129	1	9	3
364	2017-06-27 22:26:25.591167+08	1	42	191.85998403855001	34	5.66666666666666963	3	1	0	111	1	7	1	34	0	3	1
368	2017-06-27 22:26:25.598106+08	7	7	232.931393999108991	296	8.22222222222221966	18	11	2	7	1	7	1	296	2	18	11
366	2017-06-27 22:26:25.595215+08	7	16	218.621685675867013	330	7.85714285714286031	21	12	2	6	1	7	1	330	2	21	12
371	2017-06-27 22:26:25.605125+08	2	47	184.376776349604995	23	3.83333333333332993	3	0	0	96	1	7	1	23	0	3	0
376	2017-06-27 22:26:25.613725+08	7	52	180.934106630998997	126	7	9	1	0	91	1	7	1	126	0	9	1
379	2017-06-27 22:26:25.618239+08	7	10	229.520243151648998	343	8.16666666666666963	21	14	2	1	1	7	1	343	2	21	14
380	2017-06-27 22:26:25.619551+08	6	49	183.813891301973996	74	6.16666666666666963	6	0	0	97	1	7	1	74	0	6	0
372	2017-06-27 22:26:25.606495+08	7	46	184.587555770371011	72	6	6	3	0	87	1	7	1	72	0	6	3
373	2017-06-27 22:26:25.607901+08	7	54	179.784224950106989	208	6.93333333333333002	15	6	0	80	1	7	1	208	0	15	6
374	2017-06-27 22:26:25.609205+08	4	48	183.868806737798991	71	5.91666666666666963	6	0	0	109	1	7	1	71	0	6	0
375	2017-06-27 22:26:25.610627+08	6	55	178.996933626274	163	6.79166666666666963	12	4	0	83	1	7	1	163	0	12	4
381	2017-06-27 22:26:25.624202+08	7	68	125.347475908912003	125	4.16666666666666963	15	0	0	54	1	7	1	125	0	15	0
383	2017-06-27 22:26:25.626853+08	7	41	194.666666666666998	42	7	3	1	0	100	1	7	1	42	0	3	1
384	2017-06-27 22:26:25.628042+08	1	34	201.715960059383008	51	8.5	3	1	0	60	1	7	1	51	0	3	1
391	2017-06-27 22:26:25.638518+08	4	35	201.465260865554001	132	7.33333333333333037	9	3	0	57	1	7	1	132	0	9	3
385	2017-06-27 22:26:25.6301+08	6	36	200.84386433127699	137	7.61111111111110983	9	4	1	56	1	7	1	137	1	9	4
390	2017-06-27 22:26:25.637273+08	7	64	157.544745416779989	216	6	18	2	0	55	1	7	1	216	0	18	2
389	2017-06-27 22:26:25.635946+08	5	61	168.257256379800992	12	2	3	0	0	106	1	7	1	12	0	3	0
387	2017-06-27 22:26:25.632855+08	3	24	209.420578381831007	94	7.83333333333333037	6	4	1	59	1	7	1	94	1	6	4
386	2017-06-27 22:26:25.631475+08	7	27	207.902281360561005	279	7.75	18	9	0	53	1	7	1	279	0	18	9
388	2017-06-27 22:26:25.634242+08	5	23	210.959724858491995	101	8.41666666666666963	6	5	1	52	1	7	1	101	1	6	5
395	2017-06-27 22:26:25.648295+08	5	22	211.317293992664986	239	7.96666666666667034	15	7	0	77	1	7	1	239	0	15	7
398	2017-06-27 22:26:25.65249+08	6	45	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	7	1	35	0	3	0
399	2017-06-27 22:26:25.653837+08	7	31	203.807596953266994	90	7.5	6	3	1	92	1	7	1	90	1	6	3
396	2017-06-27 22:26:25.649685+08	7	21	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	7	1	97	0	6	3
394	2017-06-27 22:26:25.646788+08	5	8	232.654655226158013	251	8.36666666666667069	15	10	5	5	1	7	1	251	5	15	10
392	2017-06-27 22:26:25.643425+08	5	33	202.613548575534992	47	7.83333333333333037	3	1	0	82	1	7	1	47	0	3	1
393	2017-06-27 22:26:25.645465+08	7	62	163.078027329963987	222	6.16666666666666963	18	2	0	78	1	7	1	222	0	18	2
397	2017-06-27 22:26:25.651085+08	7	15	219.92257406721501	279	7.75	18	11	4	71	1	7	1	279	4	18	11
406	2017-06-27 22:26:25.665626+08	7	30	205.115874949918009	186	7.75	12	6	1	42	1	7	1	186	1	12	6
407	2017-06-27 22:26:25.669172+08	5	26	208.385779197442986	181	7.54166666666666963	12	3	1	45	1	7	1	181	1	12	3
405	2017-06-27 22:26:25.664115+08	6	3	242.640687867796998	163	9.05555555555556069	9	8	3	44	1	7	1	163	3	9	8
402	2017-06-27 22:26:25.6603+08	7	32	203.589078837149998	139	7.72222222222221966	9	4	0	3	1	7	1	139	0	9	4
349	2017-06-27 22:26:25.565217+08	7	65	153.03496156135401	170	5.66666666666666963	15	1	0	61	1	7	1	170	0	15	1
348	2017-06-27 22:26:25.56383+08	6	37	200.032619331472006	137	7.61111111111110983	9	3	1	62	1	7	1	137	1	9	3
352	2017-06-27 22:26:25.569244+08	7	39	197.463261956460002	88	7.33333333333333037	6	2	0	63	1	7	1	88	0	6	2
350	2017-06-27 22:26:25.566602+08	4	53	180.769362188177013	115	6.38888888888889017	9	4	0	107	1	7	1	115	0	9	4
355	2017-06-27 22:26:25.573348+08	5	57	177.742284700023987	157	6.54166666666666963	12	2	0	66	1	7	1	157	0	12	2
356	2017-06-27 22:26:25.574658+08	6	58	175.696417534824008	111	6.16666666666666963	9	2	0	105	1	7	1	111	0	9	2
354	2017-06-27 22:26:25.571855+08	7	66	150.902779792025001	126	5.25	12	3	0	67	1	7	1	126	0	12	3
351	2017-06-27 22:26:25.56792+08	1	29	206.149105057876	48	8	3	1	1	65	1	7	1	48	1	3	1
353	2017-06-27 22:26:25.570481+08	7	56	178.918474579204002	114	6.33333333333333037	9	2	0	64	1	7	1	114	0	9	2
409	2017-06-27 22:26:29.83127+08	8	26	209.338624540176994	372	7.75	24	13	2	6	1	8	1	372	2	24	13
408	2017-06-27 22:26:29.829981+08	7	29	207.513433205388992	175	7.29166666666666963	12	4	1	93	1	8	1	175	1	12	4
411	2017-06-27 22:26:29.833862+08	8	36	199.426329013594994	317	7.54761904761905011	21	8	0	90	1	8	1	317	0	21	8
410	2017-06-27 22:26:29.832538+08	2	41	191.85998403855001	34	5.66666666666666963	3	1	0	111	1	8	1	34	0	3	1
414	2017-06-27 22:26:29.83772+08	8	17	220.378118958327008	242	8.06666666666666998	15	9	1	89	1	8	1	242	1	15	9
412	2017-06-27 22:26:29.835173+08	8	13	223.532281280583987	337	8.02380952380952017	21	12	2	7	1	8	1	337	2	21	12
413	2017-06-27 22:26:29.836462+08	8	67	143.392235566469992	280	5.83333333333333037	24	4	0	81	1	8	1	280	0	24	4
416	2017-06-27 22:26:29.84288+08	6	4	243.474135613823989	307	8.52777777777778034	18	13	5	5	1	8	1	307	5	18	13
417	2017-06-27 22:26:29.844218+08	6	14	221.519271745944991	296	8.22222222222221966	18	10	0	77	1	8	1	296	0	18	10
357	2017-06-27 22:26:25.578824+08	5	38	198.273767470361008	44	7.33333333333333037	3	1	0	75	1	7	1	44	0	3	1
377	2017-06-27 22:26:25.615138+08	4	43	189.630931051211007	80	6.66666666666666963	6	2	0	108	1	7	1	80	0	6	2
420	2017-06-27 22:26:29.848082+08	7	44	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	8	1	35	0	3	0
423	2017-06-27 22:26:29.851981+08	8	12	223.617691244815006	392	8.16666666666666963	24	14	0	76	1	8	1	392	0	24	14
419	2017-06-27 22:26:29.846801+08	8	59	171.836905918972008	272	6.47619047619047983	21	3	0	78	1	8	1	272	0	21	3
422	2017-06-27 22:26:29.850678+08	8	30	203.807596953266994	90	7.5	6	3	1	92	1	8	1	90	1	6	3
424	2017-06-27 22:26:29.855883+08	8	24	211.749892255329002	313	7.45238095238094989	21	10	1	73	1	8	1	313	1	21	10
428	2017-06-27 22:26:29.861344+08	8	8	235.875938765784014	305	8.47222222222221966	18	13	2	72	1	8	1	305	2	18	13
427	2017-06-27 22:26:29.859703+08	8	15	220.754098217259013	405	8.4375	24	14	0	2	1	8	1	405	0	24	14
430	2017-06-27 22:26:29.864278+08	8	19	218.297455558270997	339	8.0714285714285694	21	15	0	84	1	8	1	339	0	21	15
425	2017-06-27 22:26:29.857101+08	7	7	241.233026601797008	276	9.19999999999999929	15	11	0	104	1	8	1	276	0	15	11
429	2017-06-27 22:26:29.862913+08	6	37	198.273767470361008	44	7.33333333333333037	3	1	0	75	1	8	1	44	0	3	1
431	2017-06-27 22:26:29.868139+08	7	35	200.032619331472006	137	7.61111111111110983	9	3	1	62	1	8	1	137	1	9	3
440	2017-06-27 22:26:29.884266+08	7	63	165.600513797356001	140	5.83333333333333037	12	2	0	105	1	8	1	140	0	12	2
435	2017-06-27 22:26:29.875128+08	8	39	197.463261956460002	88	7.33333333333333037	6	2	0	63	1	8	1	88	0	6	2
437	2017-06-27 22:26:29.878858+08	8	65	150.902779792025001	126	5.25	12	3	0	67	1	8	1	126	0	12	3
434	2017-06-27 22:26:29.871975+08	8	21	213.697133178921007	371	7.72916666666666963	24	12	1	69	1	8	1	371	1	24	12
433	2017-06-27 22:26:29.870751+08	5	51	180.769362188177013	115	6.38888888888889017	9	4	0	107	1	8	1	115	0	9	4
436	2017-06-27 22:26:29.876543+08	8	53	178.918474579204002	114	6.33333333333333037	9	2	0	64	1	8	1	114	0	9	2
439	2017-06-27 22:26:29.882634+08	6	61	168.584064270858988	187	6.23333333333332984	15	2	0	66	1	8	1	187	0	15	2
444	2017-06-27 22:26:29.893129+08	8	28	207.600626787402007	238	7.93333333333333002	15	8	1	42	1	8	1	238	1	15	8
445	2017-06-27 22:26:29.894337+08	6	42	191.236943500124994	208	6.93333333333333002	15	3	1	45	1	8	1	208	1	15	3
441	2017-06-27 22:26:29.889103+08	8	55	177.451285509194008	346	7.20833333333333037	24	10	1	43	1	8	1	346	1	24	10
443	2017-06-27 22:26:29.891905+08	7	5	242.640687867796998	163	9.05555555555556069	9	8	3	44	1	8	1	163	3	9	8
447	2017-06-27 22:26:29.898037+08	8	31	203.589078837149998	139	7.72222222222221966	9	4	0	3	1	8	1	139	0	9	4
446	2017-06-27 22:26:29.896147+08	8	1	270.697634491260999	431	8.97916666666666963	24	18	4	41	1	8	1	431	4	24	18
442	2017-06-27 22:26:29.890643+08	8	2	265.924080946241986	434	9.04166666666666963	24	19	7	40	1	8	1	434	7	24	19
457	2017-06-27 22:26:29.916809+08	8	49	181.494903892916	270	6.42857142857142971	21	5	0	55	1	8	1	270	0	21	5
455	2017-06-27 22:26:29.914062+08	6	62	168.257256379800992	12	2	3	0	0	106	1	8	1	12	0	3	0
450	2017-06-27 22:26:29.905249+08	8	40	194.666666666666998	42	7	3	1	0	100	1	8	1	42	0	3	1
451	2017-06-27 22:26:29.906508+08	2	33	201.715960059383008	51	8.5	3	1	0	60	1	8	1	51	0	3	1
448	2017-06-27 22:26:29.902628+08	8	18	219.93380515547301	286	7.9444444444444402	18	11	2	58	1	8	1	286	2	18	11
449	2017-06-27 22:26:29.904003+08	4	9	230.208025690270006	147	8.16666666666666963	9	7	2	59	1	8	1	147	2	9	7
453	2017-06-27 22:26:29.910512+08	8	27	207.902281360561005	279	7.75	18	9	0	53	1	8	1	279	0	18	9
454	2017-06-27 22:26:29.91272+08	6	25	210.959724858491995	101	8.41666666666666963	6	5	1	52	1	8	1	101	1	6	5
458	2017-06-27 22:26:29.918247+08	5	22	212.730567374210011	178	7.41666666666666963	12	5	0	57	1	8	1	178	0	12	5
452	2017-06-27 22:26:29.907703+08	7	34	200.84386433127699	137	7.61111111111110983	9	4	1	56	1	8	1	137	1	9	4
479	2017-06-27 22:26:36.269609+08	1	35	201.47926961475099	50	8.33333333333333037	3	3	0	112	1	9	1	50	0	3	3
465	2017-06-27 22:26:29.929883+08	8	20	214.870328025585991	328	7.8095238095238102	21	14	0	4	1	8	1	328	0	21	14
466	2017-06-27 22:26:29.933833+08	3	46	184.376776349604995	23	3.83333333333332993	3	0	0	96	1	8	1	23	0	3	0
459	2017-06-27 22:26:29.922574+08	4	54	178.18063885563501	66	5.5	6	2	1	110	1	8	1	66	1	6	2
463	2017-06-27 22:26:29.927436+08	8	58	173.534982585089011	315	6.5625	24	6	0	47	1	8	1	315	0	24	6
462	2017-06-27 22:26:29.92623+08	8	11	227.459484503477	310	8.61111111111111072	18	12	3	70	1	8	1	310	3	18	12
467	2017-06-27 22:26:29.935169+08	8	45	184.931108464238008	256	7.11111111111110983	18	8	0	80	1	8	1	256	0	18	8
471	2017-06-27 22:26:29.94007+08	8	56	177.056325633665011	112	6.22222222222221966	9	4	0	87	1	8	1	112	0	9	4
472	2017-06-27 22:26:29.941245+08	5	43	189.630931051211007	80	6.66666666666666963	6	2	0	108	1	8	1	80	0	6	2
469	2017-06-27 22:26:29.937537+08	8	66	148.159056174108997	288	6	24	4	0	79	1	8	1	288	0	24	4
468	2017-06-27 22:26:29.936388+08	7	52	178.996933626274	163	6.79166666666666963	12	4	0	83	1	8	1	163	0	12	4
470	2017-06-27 22:26:29.938884+08	8	50	180.934106630998997	126	7	9	1	0	91	1	8	1	126	0	9	1
477	2017-06-27 22:26:36.26706+08	9	28	209.338624540176994	372	7.75	24	13	2	6	1	9	1	372	2	24	13
486	2017-06-27 22:26:36.282356+08	7	42	191.236943500124994	208	6.93333333333333002	15	3	1	45	1	9	1	208	1	15	3
487	2017-06-27 22:26:36.283696+08	9	56	172.307699721073988	387	7.16666666666666963	27	10	1	43	1	9	1	387	1	27	10
484	2017-06-27 22:26:36.278841+08	9	2	265.924080946241986	434	9.04166666666666963	24	19	7	40	1	9	1	434	7	24	19
478	2017-06-27 22:26:36.268353+08	3	41	191.85998403855001	34	5.66666666666666963	3	1	0	111	1	9	1	34	0	3	1
476	2017-06-27 22:26:36.265776+08	9	44	189.279223994684997	347	7.22916666666666963	24	10	0	90	1	9	1	347	0	24	10
480	2017-06-27 22:26:36.270957+08	8	33	202.16302672744601	210	7	15	4	1	93	1	9	1	210	1	15	4
481	2017-06-27 22:26:36.272254+08	9	66	153.982460434134993	321	5.9444444444444402	27	6	1	81	1	9	1	321	1	27	6
482	2017-06-27 22:26:36.273639+08	9	20	218.178752750403987	376	7.83333333333333037	24	13	2	7	1	9	1	376	2	24	13
483	2017-06-27 22:26:36.274943+08	9	18	220.378118958327008	242	8.06666666666666998	15	9	1	89	1	9	1	242	1	15	9
485	2017-06-27 22:26:36.2801+08	9	37	199.080948602027007	177	7.375	12	4	0	3	1	9	1	177	0	12	4
464	2017-06-27 22:26:29.928641+08	8	16	220.686197177238995	372	7.75	24	14	6	46	1	8	1	372	6	24	14
474	2017-06-27 22:26:29.943684+08	5	57	174.951805884837	105	5.83333333333333037	9	0	0	109	1	8	1	105	0	9	0
488	2017-06-27 22:26:36.285094+08	8	4	246.571075252762	210	8.75	12	10	4	44	1	9	1	210	4	12	10
545	2017-06-27 22:26:40.060842+08	6	46	187.879276629326995	164	6.83333333333333037	12	5	1	110	1	10	1	164	1	12	5
491	2017-06-27 22:26:36.291734+08	5	50	178.960391810044996	114	6.33333333333333037	9	3	1	110	1	9	1	114	1	9	3
505	2017-06-27 22:26:36.316406+08	7	60	168.257256379800992	12	2	3	0	0	106	1	9	1	12	0	3	0
496	2017-06-27 22:26:36.29898+08	9	24	214.870328025585991	328	7.8095238095238102	21	14	0	4	1	9	1	328	0	21	14
494	2017-06-27 22:26:36.295882+08	9	12	229.601494229997996	429	7.9444444444444402	27	17	6	46	1	9	1	429	6	27	17
492	2017-06-27 22:26:36.293021+08	9	61	167.890832600409993	272	6.47619047619047983	21	6	0	49	1	9	1	272	0	21	6
501	2017-06-27 22:26:36.309698+08	3	34	201.715960059383008	51	8.5	3	1	0	60	1	9	1	51	0	3	1
503	2017-06-27 22:26:36.312519+08	9	69	108.190993936943002	176	4.1904761904761898	21	0	0	54	1	9	1	176	0	21	0
499	2017-06-27 22:26:36.305582+08	5	10	230.208025690270006	147	8.16666666666666963	9	7	2	59	1	9	1	147	2	9	7
498	2017-06-27 22:26:36.304068+08	7	27	210.401850260229992	146	8.11111111111111072	9	7	1	52	1	9	1	146	1	9	7
507	2017-06-27 22:26:36.31952+08	9	19	219.93380515547301	286	7.9444444444444402	18	11	2	58	1	9	1	286	2	18	11
508	2017-06-27 22:26:36.321216+08	6	16	222.028686661942004	235	7.83333333333333037	15	8	0	57	1	9	1	235	0	15	8
504	2017-06-27 22:26:36.313815+08	9	25	214.051870656912001	329	7.83333333333333037	21	11	0	53	1	9	1	329	0	21	11
506	2017-06-27 22:26:36.31822+08	9	54	174.444512034697993	311	6.47916666666666963	24	5	0	55	1	9	1	311	0	24	5
510	2017-06-27 22:26:36.327012+08	9	21	217.113089824823987	363	7.5625	24	12	2	73	1	9	1	363	2	24	12
511	2017-06-27 22:26:36.328579+08	9	6	242.806431251815013	361	8.59523809523808957	21	15	1	74	1	9	1	361	1	21	15
512	2017-06-27 22:26:36.330195+08	9	9	235.875938765784014	305	8.47222222222221966	18	13	2	72	1	9	1	305	2	18	13
515	2017-06-27 22:26:36.334789+08	9	11	230.127245904835007	399	8.3125	24	18	0	84	1	9	1	399	0	24	18
514	2017-06-27 22:26:36.333466+08	7	22	215.161465000801996	101	8.41666666666666963	6	4	2	75	1	9	1	101	2	6	4
513	2017-06-27 22:26:36.33144+08	9	14	226.847396024116989	465	8.61111111111111072	27	17	0	2	1	9	1	465	0	27	17
516	2017-06-27 22:26:36.339211+08	4	65	158.628627282320991	38	3.16666666666667007	6	0	0	96	1	9	1	38	0	6	0
524	2017-06-27 22:26:36.351241+08	9	8	240.127186330638011	447	8.27777777777778034	27	18	3	1	1	9	1	447	3	27	18
525	2017-06-27 22:26:36.352806+08	9	48	180.096069079697003	294	7	21	8	0	80	1	9	1	294	0	21	8
522	2017-06-27 22:26:36.348278+08	9	52	177.056325633665011	112	6.22222222222221966	9	4	0	87	1	9	1	112	0	9	4
517	2017-06-27 22:26:36.340594+08	8	55	173.206839820791998	107	5.9444444444444402	9	0	0	97	1	9	1	107	0	9	0
518	2017-06-27 22:26:36.341846+08	9	67	153.952698891131007	333	6.16666666666666963	27	5	0	79	1	9	1	333	0	27	5
519	2017-06-27 22:26:36.343063+08	6	53	174.951805884837	105	5.83333333333333037	9	0	0	109	1	9	1	105	0	9	0
520	2017-06-27 22:26:36.344224+08	8	49	178.996933626274	163	6.79166666666666963	12	4	0	83	1	9	1	163	0	12	4
521	2017-06-27 22:26:36.34611+08	9	47	180.934106630998997	126	7	9	1	0	91	1	9	1	126	0	9	1
533	2017-06-27 22:26:36.365961+08	9	63	165.347632561859996	264	6.28571428571429003	21	3	0	61	1	9	1	264	0	21	3
532	2017-06-27 22:26:36.364693+08	7	59	168.584064270858988	187	6.23333333333332984	15	2	0	66	1	9	1	187	0	15	2
535	2017-06-27 22:26:36.368507+08	8	64	162.105872079908011	175	5.83333333333333037	15	3	1	105	1	9	1	175	1	15	3
527	2017-06-27 22:26:36.35834+08	9	39	197.463261956460002	88	7.33333333333333037	6	2	0	63	1	9	1	88	0	6	2
526	2017-06-27 22:26:36.357063+08	9	31	203.862619010408991	411	7.61111111111110983	27	13	1	69	1	9	1	411	1	27	13
531	2017-06-27 22:26:36.363435+08	3	38	198.254188944806003	87	7.25	6	1	1	65	1	9	1	87	1	6	1
530	2017-06-27 22:26:36.362089+08	6	58	168.989671164078999	143	5.95833333333333037	12	4	0	107	1	9	1	143	0	12	4
528	2017-06-27 22:26:36.359587+08	9	51	178.918474579204002	114	6.33333333333333037	9	2	0	64	1	9	1	114	0	9	2
534	2017-06-27 22:26:36.36718+08	8	32	202.602192546567011	180	7.5	12	5	1	62	1	9	1	180	1	12	5
539	2017-06-27 22:26:36.376111+08	7	30	204.197250338890996	98	8.16666666666666963	6	3	0	82	1	9	1	98	0	6	3
542	2017-06-27 22:26:36.379627+08	9	5	244.098767513443988	393	8.1875	24	16	6	71	1	9	1	393	6	24	16
540	2017-06-27 22:26:36.377333+08	9	26	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	9	1	97	0	6	3
538	2017-06-27 22:26:36.374699+08	7	3	248.286859329860988	367	8.7380952380952408	21	16	5	5	1	9	1	367	5	21	16
544	2017-06-27 22:26:36.382287+08	9	29	204.567460883839999	137	7.61111111111110983	9	5	2	92	1	9	1	137	2	9	5
537	2017-06-27 22:26:36.373462+08	7	17	221.519271745944991	296	8.22222222222221966	18	10	0	77	1	9	1	296	0	18	10
541	2017-06-27 22:26:36.378546+08	8	45	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	9	1	35	0	3	0
543	2017-06-27 22:26:36.380909+08	9	15	223.617691244815006	392	8.16666666666666963	24	14	0	76	1	9	1	392	0	24	14
490	2017-06-27 22:26:36.287728+08	9	23	215.071806627211998	289	8.02777777777778034	18	10	1	42	1	9	1	289	1	18	10
548	2017-06-27 22:26:40.064723+08	10	14	222.869727144977986	474	7.90000000000000036	30	18	6	46	1	10	1	474	6	30	18
549	2017-06-27 22:26:40.066+08	10	22	214.870328025585991	328	7.8095238095238102	21	14	0	4	1	10	1	328	0	21	14
551	2017-06-27 22:26:40.068605+08	10	59	168.725785719177992	318	6.625	24	7	0	49	1	10	1	318	0	24	7
550	2017-06-27 22:26:40.06727+08	9	49	183.519666904788011	121	6.72222222222221966	9	2	0	48	1	10	1	121	0	9	2
547	2017-06-27 22:26:40.063494+08	10	24	213.101637179480008	389	8.10416666666666963	24	13	3	70	1	10	1	389	3	24	13
546	2017-06-27 22:26:40.062164+08	10	58	168.747796333169987	397	6.6166666666666698	30	8	0	47	1	10	1	397	0	30	8
555	2017-06-27 22:26:40.076132+08	9	34	202.16302672744601	210	7	15	4	1	93	1	10	1	210	1	15	4
554	2017-06-27 22:26:40.074747+08	2	36	201.47926961475099	50	8.33333333333333037	3	3	0	112	1	10	1	50	0	3	3
553	2017-06-27 22:26:40.073493+08	10	25	212.649400134952998	424	7.85185185185185031	27	15	2	6	1	10	1	424	2	27	15
557	2017-06-27 22:26:40.078884+08	10	69	151.457016694928001	364	6.06666666666666998	30	7	1	81	1	10	1	364	1	30	7
493	2017-06-27 22:26:36.294458+08	9	13	228.034114436082007	357	8.5	21	13	3	70	1	9	1	357	3	21	13
569	2017-06-27 22:26:40.098202+08	10	30	204.890049837754987	462	7.70000000000000018	30	14	1	69	1	10	1	462	1	30	14
561	2017-06-27 22:26:40.087272+08	10	67	152.631897310856999	169	5.6333333333333302	15	5	0	67	1	10	1	169	0	15	5
560	2017-06-27 22:26:40.085969+08	10	38	199.383979333095994	134	7.4444444444444402	9	4	0	63	1	10	1	134	0	9	4
564	2017-06-27 22:26:40.091409+08	4	40	197.646884294541991	134	7.4444444444444402	9	3	1	65	1	10	1	134	1	9	3
562	2017-06-27 22:26:40.088589+08	1	29	206.259640175955013	51	8.5	3	2	0	113	1	10	1	51	0	3	2
568	2017-06-27 22:26:40.096911+08	9	33	202.602192546567011	180	7.5	12	5	1	62	1	10	1	180	1	12	5
567	2017-06-27 22:26:40.095616+08	10	62	165.347632561859996	264	6.28571428571429003	21	3	0	61	1	10	1	264	0	21	3
565	2017-06-27 22:26:40.092951+08	7	57	168.989671164078999	143	5.95833333333333037	12	4	0	107	1	10	1	143	0	12	4
570	2017-06-27 22:26:40.099513+08	9	63	162.105872079908011	175	5.83333333333333037	15	3	1	105	1	10	1	175	1	15	3
573	2017-06-27 22:26:40.108407+08	4	35	201.715960059383008	51	8.5	3	1	0	60	1	10	1	51	0	3	1
577	2017-06-27 22:26:40.114143+08	10	55	173.166720085254013	353	6.53703703703703987	27	6	0	55	1	10	1	353	0	27	6
581	2017-06-27 22:26:40.119696+08	7	17	220.194719529668987	283	7.86111111111110983	18	10	1	57	1	10	1	283	1	18	10
580	2017-06-27 22:26:40.118123+08	8	27	210.401850260229992	146	8.11111111111111072	9	7	1	52	1	10	1	146	1	9	7
579	2017-06-27 22:26:40.116846+08	10	18	219.93380515547301	286	7.9444444444444402	18	11	2	58	1	10	1	286	2	18	11
576	2017-06-27 22:26:40.112624+08	10	70	108.008324499639997	212	4.41666666666666963	24	0	0	54	1	10	1	212	0	24	0
578	2017-06-27 22:26:40.115528+08	10	23	214.579374003144011	375	7.8125	24	12	0	53	1	10	1	375	0	24	12
574	2017-06-27 22:26:40.109891+08	9	37	200.84386433127699	137	7.61111111111110983	9	4	1	56	1	10	1	137	1	9	4
586	2017-06-27 22:26:40.131481+08	10	3	264.257459941313016	531	8.84999999999999964	30	22	5	41	1	10	1	531	5	30	22
589	2017-06-27 22:26:40.138487+08	10	19	217.113089824823987	363	7.5625	24	12	2	73	1	10	1	363	2	24	12
585	2017-06-27 22:26:40.13005+08	10	28	209.943514835288994	329	7.83333333333333037	21	11	1	42	1	10	1	329	1	21	11
587	2017-06-27 22:26:40.132919+08	10	52	180.100321499611994	432	7.20000000000000018	30	12	1	43	1	10	1	432	1	30	12
584	2017-06-27 22:26:40.1284+08	9	4	258.150814951284019	266	8.86666666666667069	15	13	4	44	1	10	1	266	4	15	13
591	2017-06-27 22:26:40.141747+08	10	21	215.352812457194005	503	8.38333333333332931	30	17	0	2	1	10	1	503	0	30	17
595	2017-06-27 22:26:40.147482+08	10	9	232.983541557756013	443	8.20370370370370061	27	20	0	84	1	10	1	443	0	27	20
594	2017-06-27 22:26:40.146062+08	9	6	241.233026601797008	276	9.19999999999999929	15	11	0	104	1	10	1	276	0	15	11
590	2017-06-27 22:26:40.139761+08	10	7	240.493760187281993	406	8.45833333333333037	24	16	1	74	1	10	1	406	1	24	16
593	2017-06-27 22:26:40.144635+08	10	11	229.949537715775989	347	8.2619047619047592	21	14	2	72	1	10	1	347	2	21	14
592	2017-06-27 22:26:40.143204+08	8	10	230.687649905224987	151	8.38888888888888928	9	6	3	75	1	10	1	151	3	9	6
599	2017-06-27 22:26:40.156564+08	8	32	204.197250338890996	98	8.16666666666666963	6	3	0	82	1	10	1	98	0	6	3
596	2017-06-27 22:26:40.151648+08	8	2	264.837010427033022	427	8.89583333333333037	24	19	7	5	1	10	1	427	7	24	19
598	2017-06-27 22:26:40.154634+08	8	16	222.089479123329994	346	8.2380952380952408	21	12	0	77	1	10	1	346	0	21	12
602	2017-06-27 22:26:40.16092+08	10	68	152.59911521516301	341	6.31481481481481044	27	4	0	78	1	10	1	341	0	27	4
597	2017-06-27 22:26:40.152782+08	10	5	243.679425808363987	447	8.27777777777778034	27	18	6	71	1	10	1	447	6	27	18
603	2017-06-27 22:26:40.162232+08	10	31	204.567460883839999	137	7.61111111111110983	9	5	2	92	1	10	1	137	2	9	5
601	2017-06-27 22:26:40.159452+08	9	47	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	10	1	35	0	3	0
604	2017-06-27 22:26:40.163697+08	10	13	229.600379768800991	449	8.31481481481480955	27	17	0	76	1	10	1	449	0	27	17
605	2017-06-27 22:26:40.167406+08	5	65	158.628627282320991	38	3.16666666666667007	6	0	0	96	1	10	1	38	0	6	0
607	2017-06-27 22:26:40.170077+08	7	56	172.412810678546009	140	5.83333333333333037	12	0	0	109	1	10	1	140	0	12	0
609	2017-06-27 22:26:40.172979+08	9	64	160.348102365959988	181	6.03333333333332966	15	4	0	83	1	10	1	181	0	15	4
610	2017-06-27 22:26:40.174169+08	10	48	186.915448456317989	341	7.10416666666666963	24	10	0	80	1	10	1	341	0	24	10
612	2017-06-27 22:26:40.176813+08	9	50	181.136914964390996	153	6.375	12	2	0	97	1	10	1	153	0	12	2
613	2017-06-27 22:26:40.178032+08	10	8	240.127186330638011	447	8.27777777777778034	27	18	3	1	1	10	1	447	3	27	18
614	2017-06-27 22:26:40.179248+08	10	66	153.952698891131007	333	6.16666666666666963	27	5	0	79	1	10	1	333	0	27	5
608	2017-06-27 22:26:40.171541+08	10	51	180.934106630998997	126	7	9	1	0	91	1	10	1	126	0	9	1
611	2017-06-27 22:26:40.175508+08	7	45	189.630931051211007	80	6.66666666666666963	6	2	0	108	1	10	1	80	0	6	2
559	2017-06-27 22:26:40.081668+08	10	20	216.433353736902006	288	8	18	10	1	89	1	10	1	288	1	18	10
566	2017-06-27 22:26:40.094309+08	8	60	168.584064270858988	187	6.23333333333332984	15	2	0	66	1	10	1	187	0	15	2
23	2017-06-27 21:48:26.820656+08	1	38	183.104947526236998	29	4.83333333333333037	3	1	0	47	1	1	1	29	0	3	1
54	2017-06-27 22:01:15.258109+08	2	3	222.753227582208012	107	8.91666666666666963	6	5	1	40	1	2	1	107	1	6	5
57	2017-06-27 22:01:15.262467+08	1	2	223.21230719903599	60	10	3	3	1	44	1	2	1	60	1	3	3
123	2017-06-27 22:11:45.439298+08	1	31	198.273767470361008	44	7.33333333333333037	3	1	0	75	1	3	1	44	0	3	1
138	2017-06-27 22:11:45.475266+08	3	4	225.787859372766007	155	8.61111111111111072	9	6	0	7	1	3	1	155	0	9	6
189	2017-06-27 22:24:29.506846+08	2	33	198.273767470361008	44	7.33333333333333037	3	1	0	75	1	4	1	44	0	3	1
209	2017-06-27 22:24:29.540272+08	4	10	216.799858782720008	203	8.45833333333333037	12	7	2	70	1	4	1	203	2	12	7
166	2017-06-27 22:24:29.461455+08	2	16	212.481334373851013	101	8.41666666666666963	6	3	0	77	1	4	1	101	0	6	3
268	2017-06-27 22:26:18.601776+08	3	10	226.171066336910997	153	8.5	9	7	4	5	1	5	1	153	4	9	7
241	2017-06-27 22:26:18.54956+08	4	25	204.645161290322989	51	8.5	3	1	0	48	1	5	1	51	0	3	1
362	2017-06-27 22:26:25.585951+08	7	12	221.358470250794994	354	8.4285714285714306	21	13	0	2	1	7	1	354	0	21	13
369	2017-06-27 22:26:25.599417+08	7	14	220.378118958327008	242	8.06666666666666998	15	9	1	89	1	7	1	242	1	15	9
400	2017-06-27 22:26:25.655027+08	7	17	218.263778131207999	336	8	21	12	0	76	1	7	1	336	0	21	12
582	2017-06-27 22:26:40.12553+08	8	43	191.236943500124994	208	6.93333333333333002	15	3	1	45	1	10	1	208	1	15	3
140	2017-06-27 22:11:45.479415+08	3	39	194.418256227857995	135	7.5	9	4	0	89	1	3	1	135	0	9	4
318	2017-06-27 22:26:21.780264+08	6	18	215.746162285309993	191	7.95833333333333037	12	7	1	58	1	6	1	191	1	12	7
378	2017-06-27 22:26:25.616362+08	7	67	146.040840553372988	246	5.85714285714286031	21	2	0	79	1	7	1	246	0	21	2
341	2017-06-27 22:26:25.552281+08	7	51	182.836978653111998	275	6.54761904761905011	21	6	0	47	1	7	1	275	0	21	6
460	2017-06-27 22:26:29.923875+08	7	48	183.519666904788011	121	6.72222222222221966	9	2	0	48	1	8	1	121	0	9	2
475	2017-06-27 22:26:29.94501+08	8	3	246.016327956131988	403	8.39583333333333037	24	17	3	1	1	8	1	403	3	24	17
418	2017-06-27 22:26:29.845534+08	8	23	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	8	1	97	0	6	3
432	2017-06-27 22:26:29.86947+08	8	64	163.952690465544009	220	6.11111111111110983	18	3	0	61	1	8	1	220	0	18	3
497	2017-06-27 22:26:36.300266+08	8	46	183.519666904788011	121	6.72222222222221966	9	2	0	48	1	9	1	121	0	9	2
500	2017-06-27 22:26:36.306918+08	9	40	194.666666666666998	42	7	3	1	0	100	1	9	1	42	0	3	1
529	2017-06-27 22:26:36.36088+08	9	68	150.902779792025001	126	5.25	12	3	0	67	1	9	1	126	0	12	3
489	2017-06-27 22:26:36.286444+08	9	1	277.729328834344983	491	9.0925925925925899	27	21	4	41	1	9	1	491	4	27	21
583	2017-06-27 22:26:40.127102+08	10	1	266.503055278255999	485	8.98148148148147918	27	21	7	40	1	10	1	485	7	27	21
600	2017-06-27 22:26:40.158173+08	10	26	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	10	1	97	0	6	3
572	2017-06-27 22:26:40.106664+08	10	41	194.666666666666998	42	7	3	1	0	100	1	10	1	42	0	3	1
615	2017-06-27 23:09:15.263998+08	8	57	168.989671164078999	143	5.95833333333333037	12	4	0	107	1	11	1	143	0	12	4
616	2017-06-27 23:09:15.266283+08	9	59	168.584064270858988	187	6.23333333333332984	15	2	0	66	1	11	1	187	0	15	2
617	2017-06-27 23:09:15.268003+08	11	30	208.457730215999987	518	7.8484848484848504	33	16	1	69	1	11	1	518	1	33	16
618	2017-06-27 23:09:15.269853+08	5	39	197.646884294541991	134	7.4444444444444402	9	3	1	65	1	11	1	134	1	9	3
621	2017-06-27 23:09:15.275717+08	11	69	147.143449827000012	294	6.125	24	4	0	61	1	11	1	294	0	24	4
622	2017-06-27 23:09:15.277725+08	11	67	152.631897310856999	169	5.6333333333333302	15	5	0	67	1	11	1	169	0	15	5
623	2017-06-27 23:09:15.279303+08	10	34	202.602192546567011	180	7.5	12	5	1	62	1	11	1	180	1	12	5
624	2017-06-27 23:09:15.280925+08	11	28	209.861083814000011	194	8.08333333333333037	12	7	0	63	1	11	1	194	0	12	7
625	2017-06-27 23:09:15.282757+08	10	64	159.858185887334997	210	5.83333333333333037	18	3	1	105	1	11	1	210	1	18	3
626	2017-06-27 23:09:15.287795+08	10	48	181.056917883990991	163	6.79166666666666963	12	3	0	48	1	11	1	163	0	12	3
627	2017-06-27 23:09:15.289439+08	7	55	171.163527522484998	193	6.43333333333333002	15	5	1	110	1	11	1	193	1	15	5
628	2017-06-27 23:09:15.290938+08	11	16	222.869727144977986	474	7.90000000000000036	30	18	6	46	1	11	1	474	6	30	18
629	2017-06-27 23:09:15.292347+08	11	7	240.640705626381987	449	8.31481481481480955	27	16	4	70	1	11	1	449	4	27	16
630	2017-06-27 23:09:15.296562+08	11	58	168.747796333169987	397	6.6166666666666698	30	8	0	47	1	11	1	397	0	30	8
631	2017-06-27 23:09:15.298071+08	11	25	214.870328025585991	328	7.8095238095238102	21	14	0	4	1	11	1	328	0	21	14
632	2017-06-27 23:09:15.299565+08	11	54	171.742573896934005	360	6.66666666666666963	27	8	0	49	1	11	1	360	0	27	8
633	2017-06-27 23:09:15.306541+08	11	51	174.406346298517008	466	7.06060606060605966	33	12	1	43	1	11	1	466	1	33	12
634	2017-06-27 23:09:15.308324+08	9	29	209.617622016029998	256	7.11111111111110983	18	5	3	45	1	11	1	256	3	18	5
635	2017-06-27 23:09:15.310215+08	10	3	258.150814951284019	266	8.86666666666667069	15	13	4	44	1	11	1	266	4	15	13
636	2017-06-27 23:09:15.311789+08	11	13	224.804499267338002	384	8	24	14	2	42	1	11	1	384	2	24	14
637	2017-06-27 23:09:15.314024+08	11	4	249.561592592354998	562	8.51515151515151913	33	22	5	41	1	11	1	562	5	33	22
638	2017-06-27 23:09:15.3158+08	11	43	192.999708682742011	216	7.20000000000000018	15	4	0	3	1	11	1	216	0	15	4
639	2017-06-27 23:09:15.317779+08	11	1	266.503055278255999	485	8.98148148148147918	27	21	7	40	1	11	1	485	7	27	21
640	2017-06-27 23:09:15.324716+08	9	2	265.717758734228028	477	8.83333333333333037	27	21	9	5	1	11	1	477	9	27	21
641	2017-06-27 23:09:15.326437+08	11	68	150.754825362790996	376	6.26666666666667016	30	6	0	78	1	11	1	376	0	30	6
642	2017-06-27 23:09:15.327901+08	9	18	222.089479123329994	346	8.2380952380952408	21	12	0	77	1	11	1	346	0	21	12
643	2017-06-27 23:09:15.329444+08	10	46	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	11	1	35	0	3	0
644	2017-06-27 23:09:15.330864+08	9	33	203.987771667778986	141	7.83333333333333037	9	4	0	82	1	11	1	141	0	9	4
645	2017-06-27 23:09:15.332638+08	11	19	221.563371581736988	475	7.91666666666666963	30	19	6	71	1	11	1	475	6	30	19
647	2017-06-27 23:09:15.337071+08	11	32	204.567460883839999	137	7.61111111111110983	9	5	2	92	1	11	1	137	2	9	5
648	2017-06-27 23:09:15.33875+08	11	5	246.118873733100997	509	8.48333333333333073	30	20	1	76	1	11	1	509	1	30	20
650	2017-06-27 23:09:15.346158+08	3	37	201.47926961475099	50	8.33333333333333037	3	3	0	112	1	11	1	50	0	3	3
651	2017-06-27 23:09:15.348438+08	11	31	205.927400738177994	461	7.68333333333333002	30	16	2	6	1	11	1	461	2	30	16
652	2017-06-27 23:09:15.350226+08	11	40	195.927869759759005	435	7.25	30	13	0	90	1	11	1	435	0	30	13
653	2017-06-27 23:09:15.351951+08	10	35	202.16302672744601	210	7	15	4	1	93	1	11	1	210	1	15	4
654	2017-06-27 23:09:15.353488+08	11	66	155.019984144473	403	6.10606060606060996	33	7	1	81	1	11	1	403	1	33	7
655	2017-06-27 23:09:15.355028+08	11	10	237.640080279115011	482	8.03333333333332966	30	17	2	7	1	11	1	482	2	30	17
656	2017-06-27 23:09:15.356368+08	11	20	220.943734130085005	331	7.8809523809523796	21	12	1	89	1	11	1	331	1	21	12
657	2017-06-27 23:09:15.363075+08	11	12	229.949537715775989	347	8.2619047619047592	21	14	2	72	1	11	1	347	2	21	14
658	2017-06-27 23:09:15.365475+08	11	15	224.265927759582013	416	7.70370370370369972	27	14	2	73	1	11	1	416	2	27	14
659	2017-06-27 23:09:15.366915+08	9	9	237.834724741526003	207	8.625	12	9	3	75	1	11	1	207	3	12	9
660	2017-06-27 23:09:15.368377+08	11	24	217.100225245173988	548	8.30303030303029921	33	19	0	2	1	11	1	548	0	33	19
661	2017-06-27 23:09:15.369765+08	10	6	241.233026601797008	276	9.19999999999999929	15	11	0	104	1	11	1	276	0	15	11
662	2017-06-27 23:09:15.371288+08	11	14	224.503545498699992	441	8.16666666666666963	27	17	1	74	1	11	1	441	1	27	17
663	2017-06-27 23:09:15.372786+08	11	22	218.071140239160002	475	7.91666666666666963	30	21	0	84	1	11	1	475	0	30	21
664	2017-06-27 23:09:15.377897+08	11	42	194.666666666666998	42	7	3	1	0	100	1	11	1	42	0	3	1
665	2017-06-27 23:09:15.379431+08	7	17	222.645349614552998	191	7.95833333333333037	12	8	2	59	1	11	1	191	2	12	8
666	2017-06-27 23:09:15.380783+08	11	61	168.033754806984007	396	6.59999999999999964	30	7	0	55	1	11	1	396	0	30	7
667	2017-06-27 23:09:15.382097+08	9	27	210.401850260229992	146	8.11111111111111072	9	7	1	52	1	11	1	146	1	9	7
668	2017-06-27 23:09:15.383342+08	11	23	217.682698239485006	427	7.9074074074074101	27	14	0	53	1	11	1	427	0	27	14
669	2017-06-27 23:09:15.384549+08	10	41	194.728281835911986	179	7.45833333333333037	12	5	1	56	1	11	1	179	1	12	5
670	2017-06-27 23:09:15.385943+08	11	21	219.93380515547301	286	7.9444444444444402	18	11	2	58	1	11	1	286	2	18	11
671	2017-06-27 23:09:15.387268+08	9	60	168.257256379800992	12	2	3	0	0	106	1	11	1	12	0	3	0
672	2017-06-27 23:09:15.388521+08	5	36	201.715960059383008	51	8.5	3	1	0	60	1	11	1	51	0	3	1
674	2017-06-27 23:09:15.390864+08	8	11	231.29207732568301	337	8.02380952380952017	21	13	2	57	1	11	1	337	2	21	13
675	2017-06-27 23:09:15.394602+08	6	65	158.628627282320991	38	3.16666666666667007	6	0	0	96	1	11	1	38	0	6	0
677	2017-06-27 23:09:15.397304+08	8	53	172.412810678546009	140	5.83333333333333037	12	0	0	109	1	11	1	140	0	12	0
678	2017-06-27 23:09:15.398645+08	10	63	160.348102365959988	181	6.03333333333332966	15	4	0	83	1	11	1	181	0	15	4
679	2017-06-27 23:09:15.399891+08	11	8	240.127186330638011	447	8.27777777777778034	27	18	3	1	1	11	1	447	3	27	18
680	2017-06-27 23:09:15.401222+08	11	47	185.740520599247986	388	7.18518518518518956	27	12	0	80	1	11	1	388	0	27	12
681	2017-06-27 23:09:15.402395+08	11	62	162.298522116638992	156	6.5	12	1	0	91	1	11	1	156	0	12	1
683	2017-06-27 23:09:15.404842+08	8	45	191.049484175032006	126	7	9	3	0	108	1	11	1	126	0	9	3
684	2017-06-27 23:09:15.406037+08	11	56	170.689659719296998	387	6.45000000000000018	30	7	0	79	1	11	1	387	0	30	7
685	2017-06-27 23:10:42.73484+08	4	35	201.47926961475099	50	8.33333333333333037	3	3	0	112	1	12	1	50	0	3	3
686	2017-06-27 23:10:42.736042+08	6	43	191.85998403855001	34	5.66666666666666963	3	1	0	111	1	12	1	34	0	3	1
687	2017-06-27 23:10:42.737295+08	12	37	201.175027003276	483	7.31818181818182012	33	14	0	90	1	12	1	483	0	33	14
689	2017-06-27 23:10:42.740078+08	12	29	204.789792344393987	511	7.74242424242424043	33	18	2	6	1	12	1	511	2	33	18
690	2017-06-27 23:10:42.741505+08	12	9	237.857401322632001	391	8.14583333333333037	24	15	2	89	1	12	1	391	2	24	15
691	2017-06-27 23:10:42.742815+08	12	56	169.522405409174013	463	6.4305555555555598	36	10	1	81	1	12	1	463	1	36	10
692	2017-06-27 23:10:42.744128+08	12	6	247.979387090077012	542	8.21212121212120927	33	20	4	7	1	12	1	542	4	33	20
693	2017-06-27 23:10:42.748072+08	10	59	168.584064270858988	187	6.23333333333332984	15	2	0	66	1	12	1	187	0	15	2
695	2017-06-27 23:10:42.750824+08	3	36	201.289365747165988	87	7.25	6	3	0	113	1	12	1	87	0	6	3
696	2017-06-27 23:10:42.752191+08	12	51	178.918474579204002	114	6.33333333333333037	9	2	0	64	1	12	1	114	0	9	2
697	2017-06-27 23:10:42.753494+08	12	67	147.143449827000012	294	6.125	24	4	0	61	1	12	1	294	0	24	4
698	2017-06-27 23:10:42.754849+08	12	40	197.513003249522001	556	7.72222222222221966	36	16	1	69	1	12	1	556	1	36	16
699	2017-06-27 23:10:42.756053+08	11	32	202.602192546567011	180	7.5	12	5	1	62	1	12	1	180	1	12	5
700	2017-06-27 23:10:42.757326+08	6	42	194.624604591753013	180	7.5	12	4	1	65	1	12	1	180	1	12	4
701	2017-06-27 23:10:42.758713+08	12	31	203.661390277844987	236	7.8666666666666698	15	9	0	63	1	12	1	236	0	15	9
702	2017-06-27 23:10:42.760107+08	9	58	168.989671164078999	143	5.95833333333333037	12	4	0	107	1	12	1	143	0	12	4
703	2017-06-27 23:10:42.761448+08	11	69	142.593583947093009	229	5.45238095238094989	21	3	1	105	1	12	1	229	1	21	3
704	2017-06-27 23:10:42.765557+08	7	64	158.628627282320991	38	3.16666666666667007	6	0	0	96	1	12	1	38	0	6	0
705	2017-06-27 23:10:42.767105+08	9	47	183.698842011192994	160	6.66666666666666963	12	3	0	108	1	12	1	160	0	12	3
706	2017-06-27 23:10:42.768603+08	12	11	236.203150629031995	487	8.11666666666667069	30	18	3	1	1	12	1	487	3	30	18
707	2017-06-27 23:10:42.769913+08	12	61	167.579825106756999	421	6.37878787878787978	33	7	0	79	1	12	1	421	0	33	7
708	2017-06-27 23:10:42.771174+08	11	65	156.561188133985013	217	6.02777777777778034	18	4	0	83	1	12	1	217	0	18	4
709	2017-06-27 23:10:42.772416+08	12	48	182.319427883618999	429	7.15000000000000036	30	12	0	80	1	12	1	429	0	30	12
710	2017-06-27 23:10:42.773878+08	12	50	179.956119090590988	155	6.45833333333333037	12	5	0	87	1	12	1	155	0	12	5
711	2017-06-27 23:10:42.775306+08	9	54	172.412810678546009	140	5.83333333333333037	12	0	0	109	1	12	1	140	0	12	0
712	2017-06-27 23:10:42.776517+08	12	63	162.298522116638992	156	6.5	12	1	0	91	1	12	1	156	0	12	1
713	2017-06-27 23:10:42.779297+08	11	53	173.313492446954001	192	6.40000000000000036	15	3	0	97	1	12	1	192	0	15	3
714	2017-06-27 23:10:42.783394+08	10	27	209.617622016029998	256	7.11111111111110983	18	5	3	45	1	12	1	256	3	18	5
715	2017-06-27 23:10:42.784788+08	12	38	200.462088139360986	270	7.5	18	7	0	3	1	12	1	270	0	18	7
716	2017-06-27 23:10:42.786228+08	12	17	224.804499267338002	384	8	24	14	2	42	1	12	1	384	2	24	14
718	2017-06-27 23:10:42.790873+08	12	46	184.865107196092993	523	7.26388888888889017	36	15	1	43	1	12	1	523	1	36	15
719	2017-06-27 23:10:42.792426+08	12	2	257.397032729038983	618	8.58333333333333037	36	25	6	41	1	12	1	618	6	36	25
720	2017-06-27 23:10:42.793806+08	12	1	265.974422849967993	538	8.96666666666667034	30	24	7	40	1	12	1	538	7	30	24
722	2017-06-27 23:10:42.802316+08	12	14	230.613581445304987	532	8.06060606060606055	33	22	6	71	1	12	1	532	6	33	22
723	2017-06-27 23:10:42.803781+08	10	20	222.089479123329994	346	8.2380952380952408	21	12	0	77	1	12	1	346	0	21	12
724	2017-06-27 23:10:42.80527+08	11	45	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	12	1	35	0	3	0
725	2017-06-27 23:10:42.806827+08	10	30	203.987771667778986	141	7.83333333333333037	9	4	0	82	1	12	1	141	0	9	4
726	2017-06-27 23:10:42.808153+08	12	26	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	12	1	97	0	6	3
727	2017-06-27 23:10:42.809626+08	12	66	153.339681803600996	424	6.42424242424242031	33	7	0	78	1	12	1	424	0	33	7
728	2017-06-27 23:10:42.810935+08	12	3	256.823319073406992	565	8.56060606060606055	33	23	3	76	1	12	1	565	3	33	23
729	2017-06-27 23:10:42.81303+08	12	28	208.758313729315006	190	7.91666666666666963	12	7	2	92	1	12	1	190	2	12	7
730	2017-06-27 23:10:42.817477+08	12	70	103.667676943708003	279	4.65000000000000036	30	1	0	54	1	12	1	279	0	30	1
731	2017-06-27 23:10:42.819027+08	12	52	175.63856237347801	443	6.71212121212121016	33	8	0	55	1	12	1	443	0	33	8
732	2017-06-27 23:10:42.820469+08	10	21	221.494075755915986	193	8.04166666666666963	12	9	2	52	1	12	1	193	2	12	9
733	2017-06-27 23:10:42.821792+08	11	41	194.728281835911986	179	7.45833333333333037	12	5	1	56	1	12	1	179	1	12	5
734	2017-06-27 23:10:42.823043+08	12	22	219.93380515547301	286	7.9444444444444402	18	11	2	58	1	12	1	286	2	18	11
735	2017-06-27 23:10:42.824546+08	10	60	168.257256379800992	12	2	3	0	0	106	1	12	1	12	0	3	0
736	2017-06-27 23:10:42.826647+08	12	44	189.098847619715997	81	6.75	6	2	0	100	1	12	1	81	0	6	2
737	2017-06-27 23:10:42.828667+08	6	34	201.715960059383008	51	8.5	3	1	0	60	1	12	1	51	0	3	1
738	2017-06-27 23:10:42.829975+08	12	39	200.062425409087012	451	7.51666666666667016	30	14	0	53	1	12	1	451	0	30	14
739	2017-06-27 23:10:42.831465+08	8	19	222.645349614552998	191	7.95833333333333037	12	8	2	59	1	12	1	191	2	12	8
740	2017-06-27 23:10:42.8332+08	9	13	231.29207732568301	337	8.02380952380952017	21	13	2	57	1	12	1	337	2	21	13
741	2017-06-27 23:10:42.837331+08	11	49	181.056917883990991	163	6.79166666666666963	12	3	0	48	1	12	1	163	0	12	3
742	2017-06-27 23:10:42.838627+08	12	15	228.331406832959999	522	7.90909090909091006	33	20	6	46	1	12	1	522	6	33	20
743	2017-06-27 23:10:42.83995+08	8	55	169.828091717569009	231	6.41666666666666963	18	5	1	110	1	12	1	231	1	18	5
744	2017-06-27 23:10:42.841338+08	12	8	238.070494365506988	497	8.28333333333332966	30	17	4	70	1	12	1	497	4	30	17
745	2017-06-27 23:10:42.842718+08	12	57	169.275641144411992	397	6.6166666666666698	30	8	0	49	1	12	1	397	0	30	8
746	2017-06-27 23:10:42.844029+08	12	25	214.870328025585991	328	7.8095238095238102	21	14	0	4	1	12	1	328	0	21	14
747	2017-06-27 23:10:42.845273+08	12	62	166.754529003892998	434	6.57575757575757969	33	8	0	47	1	12	1	434	0	33	8
749	2017-06-27 23:10:42.850494+08	12	12	234.988578608440008	473	7.8833333333333302	30	17	3	73	1	12	1	473	3	30	17
752	2017-06-27 23:10:42.854447+08	11	7	241.233026601797008	276	9.19999999999999929	15	11	0	104	1	12	1	276	0	15	11
753	2017-06-27 23:10:42.855833+08	12	18	224.503545498699992	441	8.16666666666666963	27	17	1	74	1	12	1	441	1	27	17
754	2017-06-27 23:10:42.857218+08	12	23	217.147590785879004	526	7.96969696969696972	33	24	0	84	1	12	1	526	0	33	24
755	2017-06-27 23:10:49.220678+08	8	63	158.628627282320991	38	3.16666666666667007	6	0	0	96	1	13	1	38	0	6	0
756	2017-06-27 23:10:49.221989+08	13	64	156.788786121004989	453	6.29166666666666963	36	8	0	79	1	13	1	453	0	36	8
758	2017-06-27 23:10:49.224599+08	13	10	238.383618580854005	532	8.06060606060606055	33	21	4	1	1	13	1	532	4	33	21
759	2017-06-27 23:10:49.22589+08	12	66	144.493875610859988	242	5.76190476190476009	21	4	0	83	1	13	1	242	0	21	4
760	2017-06-27 23:10:49.227283+08	10	49	183.698842011192994	160	6.66666666666666963	12	3	0	108	1	13	1	160	0	12	3
761	2017-06-27 23:10:49.228562+08	13	50	179.956119090590988	155	6.45833333333333037	12	5	0	87	1	13	1	155	0	12	5
762	2017-06-27 23:10:49.230067+08	13	61	162.298522116638992	156	6.5	12	1	0	91	1	13	1	156	0	12	1
763	2017-06-27 23:10:49.231358+08	12	53	173.313492446954001	192	6.40000000000000036	15	3	0	97	1	13	1	192	0	15	3
764	2017-06-27 23:10:49.232861+08	10	46	185.157887728984008	193	6.43333333333333002	15	1	0	109	1	13	1	193	0	15	1
765	2017-06-27 23:10:49.236741+08	7	43	191.85998403855001	34	5.66666666666666963	3	1	0	111	1	13	1	34	0	3	1
766	2017-06-27 23:10:49.237988+08	13	39	199.154777832103008	529	7.34722222222221966	36	16	0	90	1	13	1	529	0	36	16
767	2017-06-27 23:10:49.23917+08	12	27	215.526701477234013	263	7.3055555555555598	18	6	2	93	1	13	1	263	2	18	6
768	2017-06-27 23:10:49.240478+08	5	36	201.47926961475099	50	8.33333333333333037	3	3	0	112	1	13	1	50	0	3	3
770	2017-06-27 23:10:49.243245+08	13	62	161.427837801077004	503	6.44871794871794979	39	10	1	81	1	13	1	503	1	39	10
771	2017-06-27 23:10:49.244435+08	13	6	245.116221173892995	590	8.19444444444443931	36	22	5	7	1	13	1	590	5	36	22
772	2017-06-27 23:10:49.245808+08	13	11	237.857401322632001	391	8.14583333333333037	24	15	2	89	1	13	1	391	2	24	15
773	2017-06-27 23:10:49.249355+08	13	15	230.613581445304987	532	8.06060606060606055	33	22	6	71	1	13	1	532	6	33	22
774	2017-06-27 23:10:49.250724+08	13	65	152.515964416863	468	6.5	36	8	0	78	1	13	1	468	0	36	8
775	2017-06-27 23:10:49.252508+08	12	45	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	13	1	35	0	3	0
776	2017-06-27 23:10:49.253945+08	11	32	203.987771667778986	141	7.83333333333333037	9	4	0	82	1	13	1	141	0	9	4
777	2017-06-27 23:10:49.255229+08	13	29	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	13	1	97	0	6	3
778	2017-06-27 23:10:49.256551+08	11	13	232.790971614739988	403	8.39583333333333037	24	15	0	77	1	13	1	403	0	24	15
779	2017-06-27 23:10:49.257811+08	11	3	255.949557508178998	563	8.53030303030302939	33	25	9	5	1	13	1	563	9	33	25
780	2017-06-27 23:10:49.259034+08	13	5	245.954069614208009	609	8.45833333333333037	36	23	3	76	1	13	1	609	3	36	23
781	2017-06-27 23:10:49.260308+08	13	25	216.306071405143001	239	7.96666666666667034	15	8	2	92	1	13	1	239	2	15	8
782	2017-06-27 23:10:49.266014+08	13	14	232.209089373868011	538	8.15151515151515049	33	18	5	70	1	13	1	538	5	33	18
783	2017-06-27 23:10:49.267333+08	9	55	169.828091717569009	231	6.41666666666666963	18	5	1	110	1	13	1	231	1	18	5
784	2017-06-27 23:10:49.270297+08	13	19	225.999982447646005	563	7.8194444444444402	36	22	7	46	1	13	1	563	7	36	22
785	2017-06-27 23:10:49.271909+08	12	48	184.615098325323004	211	7.03333333333332966	15	4	0	48	1	13	1	211	0	15	4
787	2017-06-27 23:10:49.274654+08	13	60	163.599231207169993	433	6.56060606060605966	33	8	0	49	1	13	1	433	0	33	8
788	2017-06-27 23:10:49.276281+08	13	28	214.870328025585991	328	7.8095238095238102	21	14	0	4	1	13	1	328	0	21	14
789	2017-06-27 23:10:49.280855+08	12	41	194.728281835911986	179	7.45833333333333037	12	5	1	56	1	13	1	179	1	12	5
790	2017-06-27 23:10:49.282109+08	13	24	219.93380515547301	286	7.9444444444444402	18	11	2	58	1	13	1	286	2	18	11
791	2017-06-27 23:10:49.283297+08	11	59	168.257256379800992	12	2	3	0	0	106	1	13	1	12	0	3	0
792	2017-06-27 23:10:49.284507+08	13	44	189.098847619715997	81	6.75	6	2	0	100	1	13	1	81	0	6	2
793	2017-06-27 23:10:49.285805+08	11	31	207.756897750472007	222	7.40000000000000036	15	9	2	52	1	13	1	222	2	15	9
794	2017-06-27 23:10:49.288129+08	7	35	201.715960059383008	51	8.5	3	1	0	60	1	13	1	51	0	3	1
795	2017-06-27 23:10:49.289566+08	13	54	171.764104658342006	479	6.65277777777778034	36	8	0	55	1	13	1	479	0	36	8
797	2017-06-27 23:10:49.292383+08	9	21	222.645349614552998	191	7.95833333333333037	12	8	2	59	1	13	1	191	2	12	8
798	2017-06-27 23:10:49.293932+08	13	70	94.1596363439468007	298	4.51515151515152002	33	1	0	54	1	13	1	298	0	33	1
799	2017-06-27 23:10:49.295192+08	10	16	229.727602474988998	378	7.875	24	15	3	57	1	13	1	378	3	24	15
800	2017-06-27 23:10:49.29909+08	11	9	238.752779482394999	304	8.44444444444443931	18	12	4	75	1	13	1	304	4	18	12
801	2017-06-27 23:10:49.301055+08	13	18	226.041765439247996	444	8.22222222222221966	27	17	2	72	1	13	1	444	2	27	17
802	2017-06-27 23:10:49.30314+08	13	26	215.917152751620989	649	8.32051282051281937	39	23	0	2	1	13	1	649	0	39	23
803	2017-06-27 23:10:49.304757+08	12	7	241.233026601797008	276	9.19999999999999929	15	11	0	104	1	13	1	276	0	15	11
804	2017-06-27 23:10:49.306107+08	13	20	224.503545498699992	441	8.16666666666666963	27	17	1	74	1	13	1	441	1	27	17
805	2017-06-27 23:10:49.307512+08	13	8	239.038249774119009	525	7.9545454545454497	33	19	4	73	1	13	1	525	4	33	19
806	2017-06-27 23:10:49.308923+08	13	12	235.427978697513993	582	8.08333333333333037	36	26	1	84	1	13	1	582	1	36	26
807	2017-06-27 23:10:49.313216+08	13	67	144.198255338578008	202	5.61111111111110983	18	5	0	67	1	13	1	202	0	18	5
808	2017-06-27 23:10:49.314453+08	4	37	201.289365747165988	87	7.25	6	3	0	113	1	13	1	87	0	6	3
809	2017-06-27 23:10:49.315753+08	13	34	201.912322175646011	607	7.78205128205128016	39	17	1	69	1	13	1	607	1	39	17
810	2017-06-27 23:10:49.317079+08	13	51	178.918474579204002	114	6.33333333333333037	9	2	0	64	1	13	1	114	0	9	2
811	2017-06-27 23:10:49.318301+08	13	68	143.557769868381996	327	6.0555555555555598	27	4	0	61	1	13	1	327	0	27	4
812	2017-06-27 23:10:49.319494+08	12	40	195.297450588380002	216	7.20000000000000018	15	5	1	62	1	13	1	216	1	15	5
813	2017-06-27 23:10:49.320715+08	7	42	194.624604591753013	180	7.5	12	4	1	65	1	13	1	180	1	12	4
814	2017-06-27 23:10:49.322055+08	13	30	208.073803201501988	284	7.88888888888889017	18	11	0	63	1	13	1	284	0	18	11
815	2017-06-27 23:10:49.323346+08	10	57	168.989671164078999	143	5.95833333333333037	12	4	0	107	1	13	1	143	0	12	4
816	2017-06-27 23:10:49.324814+08	11	58	168.584064270858988	187	6.23333333333332984	15	2	0	66	1	13	1	187	0	15	2
817	2017-06-27 23:10:49.326179+08	12	69	138.500903847600995	258	5.375	24	3	1	105	1	13	1	258	1	24	3
819	2017-06-27 23:10:49.331077+08	13	4	246.429813105502006	668	8.56410256410256032	39	27	6	41	1	13	1	668	6	39	27
820	2017-06-27 23:10:49.332335+08	11	23	220.324517467291997	313	7.45238095238094989	21	8	3	45	1	13	1	313	3	21	8
821	2017-06-27 23:10:49.3337+08	13	17	228.948029046977013	438	8.11111111111111072	27	16	2	42	1	13	1	438	2	27	16
822	2017-06-27 23:10:49.335046+08	13	47	185.097840700263987	572	7.33333333333333037	39	17	1	43	1	13	1	572	1	39	17
824	2017-06-27 23:10:49.337562+08	12	2	256.570817369263011	369	8.78571428571429003	21	17	4	44	1	13	1	369	4	21	17
46	2017-06-27 22:01:15.24172+08	2	20	203.807596953266994	90	7.5	6	3	1	92	1	2	1	90	1	6	3
59	2017-06-27 22:01:15.268214+08	2	49	169.611029433910005	57	4.75	6	1	0	61	1	2	1	57	0	6	1
14	2017-06-27 21:48:26.79883+08	1	36	186.96296296296299	33	5.5	3	0	0	67	1	1	1	33	0	3	0
84	2017-06-27 22:01:15.318751+08	2	24	200.011942080908	45	7.5	3	2	0	87	1	2	1	45	0	3	2
80	2017-06-27 22:01:15.313251+08	2	32	195.409964129627014	93	7.75	6	3	0	80	1	2	1	93	0	6	3
113	2017-06-27 22:11:45.415992+08	3	14	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	3	1	97	0	6	3
827	2017-06-27 23:10:53.030733+08	14	22	220.33486986064699	483	8.05000000000000071	30	17	1	74	1	14	1	483	1	30	17
828	2017-06-27 23:10:53.031981+08	14	34	203.829081685447989	683	8.1309523809523796	42	24	0	2	1	14	1	683	0	42	24
829	2017-06-27 23:10:53.033211+08	14	10	239.038249774119009	525	7.9545454545454497	33	19	4	73	1	14	1	525	4	33	19
830	2017-06-27 23:10:53.034531+08	12	7	249.183101431545992	354	8.4285714285714306	21	14	5	75	1	14	1	354	5	21	14
831	2017-06-27 23:10:53.035995+08	14	16	230.954739813550987	626	8.02564102564103088	39	27	1	84	1	14	1	626	1	39	27
832	2017-06-27 23:10:53.039763+08	14	11	237.342424035356004	582	8.08333333333333037	36	24	8	71	1	14	1	582	8	36	24
833	2017-06-27 23:10:53.041039+08	13	47	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	14	1	35	0	3	0
834	2017-06-27 23:10:53.042416+08	12	32	203.987771667778986	141	7.83333333333333037	9	4	0	82	1	14	1	141	0	9	4
835	2017-06-27 23:10:53.04374+08	14	29	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	14	1	97	0	6	3
836	2017-06-27 23:10:53.045072+08	12	3	258.623875860145006	610	8.47222222222221966	36	27	9	5	1	14	1	610	9	36	27
837	2017-06-27 23:10:53.046268+08	12	8	247.504948877276007	460	8.51851851851852082	27	18	0	77	1	14	1	460	0	27	18
838	2017-06-27 23:10:53.047563+08	14	64	154.135062910301002	505	6.47435897435897001	39	8	0	78	1	14	1	505	0	39	8
839	2017-06-27 23:10:53.048927+08	14	24	216.306071405143001	239	7.96666666666667034	15	8	2	92	1	14	1	239	2	15	8
840	2017-06-27 23:10:53.050223+08	14	13	234.924860686735002	647	8.29487179487179915	39	24	3	76	1	14	1	647	3	39	24
841	2017-06-27 23:10:53.054327+08	14	5	251.160682939866007	720	8.5714285714285694	42	29	6	41	1	14	1	720	6	42	29
842	2017-06-27 23:10:53.055685+08	12	23	220.324517467291997	313	7.45238095238094989	21	8	3	45	1	14	1	313	3	21	8
843	2017-06-27 23:10:53.056991+08	14	33	203.860668471162995	319	7.59523809523808957	21	9	0	3	1	14	1	319	0	21	9
845	2017-06-27 23:10:53.060191+08	13	2	261.251153299822988	423	8.8125	24	19	4	44	1	14	1	423	4	24	19
846	2017-06-27 23:10:53.061679+08	14	17	228.728171706195013	488	8.13333333333332931	30	18	2	42	1	14	1	488	2	30	18
847	2017-06-27 23:10:53.06297+08	14	46	187.28356281525501	619	7.3690476190476204	42	18	1	43	1	14	1	619	1	42	18
848	2017-06-27 23:10:53.066748+08	10	56	169.828091717569009	231	6.41666666666666963	18	5	1	110	1	14	1	231	1	18	5
850	2017-06-27 23:10:53.069283+08	13	50	177.284844463995	246	6.83333333333333037	18	5	0	48	1	14	1	246	0	18	5
851	2017-06-27 23:10:53.072307+08	14	9	240.715223885877009	587	8.15277777777778034	36	20	5	70	1	14	1	587	5	36	20
852	2017-06-27 23:10:53.073693+08	14	27	214.870328025585991	328	7.8095238095238102	21	14	0	4	1	14	1	328	0	21	14
853	2017-06-27 23:10:53.07505+08	14	60	158.255552712836987	501	6.4230769230769198	39	10	0	47	1	14	1	501	0	39	10
854	2017-06-27 23:10:53.076336+08	14	62	156.606445045279997	464	6.4444444444444402	36	8	0	49	1	14	1	464	0	36	8
855	2017-06-27 23:10:53.080298+08	9	59	158.628627282320991	38	3.16666666666667007	6	0	0	96	1	14	1	38	0	6	0
856	2017-06-27 23:10:53.081668+08	11	49	179.816144842987001	233	6.47222222222221966	18	2	0	109	1	14	1	233	0	18	2
857	2017-06-27 23:10:53.082968+08	13	66	144.493875610859988	242	5.76190476190476009	21	4	0	83	1	14	1	242	0	21	4
858	2017-06-27 23:10:53.084765+08	11	48	183.698842011192994	160	6.66666666666666963	12	3	0	108	1	14	1	160	0	12	3
859	2017-06-27 23:10:53.087456+08	14	61	157.976408905941014	497	6.37179487179486959	39	9	0	79	1	14	1	497	0	39	9
860	2017-06-27 23:10:53.088922+08	14	58	162.298522116638992	156	6.5	12	1	0	91	1	14	1	156	0	12	1
861	2017-06-27 23:10:53.090156+08	13	53	173.313492446954001	192	6.40000000000000036	15	3	0	97	1	14	1	192	0	15	3
862	2017-06-27 23:10:53.092169+08	14	55	172.357405244100988	507	7.04166666666666963	36	14	0	80	1	14	1	507	0	36	14
863	2017-06-27 23:10:53.093619+08	14	4	252.203008973115004	592	8.22222222222221966	36	24	5	1	1	14	1	592	5	36	24
864	2017-06-27 23:10:53.095134+08	14	51	176.283683075113998	197	6.56666666666666998	15	6	0	87	1	14	1	197	0	15	6
865	2017-06-27 23:10:53.099389+08	14	68	139.418706609581989	364	6.06666666666666998	30	5	0	61	1	14	1	364	0	30	5
866	2017-06-27 23:10:53.100607+08	5	37	201.289365747165988	87	7.25	6	3	0	113	1	14	1	87	0	6	3
867	2017-06-27 23:10:53.101784+08	11	52	175.463588028105988	191	6.3666666666666698	15	6	0	107	1	14	1	191	0	15	6
868	2017-06-27 23:10:53.103794+08	12	63	154.619020194802005	215	5.97222222222221966	18	3	0	66	1	14	1	215	0	18	3
869	2017-06-27 23:10:53.105142+08	14	54	172.847325496958007	151	6.29166666666666963	12	3	0	64	1	14	1	151	0	12	3
870	2017-06-27 23:10:53.106586+08	13	38	195.297450588380002	216	7.20000000000000018	15	5	1	62	1	14	1	216	1	15	5
872	2017-06-27 23:10:53.109607+08	14	30	208.073803201501988	284	7.88888888888889017	18	11	0	63	1	14	1	284	0	18	11
873	2017-06-27 23:10:53.11088+08	14	28	214.800794917138006	667	7.9404761904761898	42	20	1	69	1	14	1	667	1	42	20
874	2017-06-27 23:10:53.11208+08	14	67	144.198255338578008	202	5.61111111111110983	18	5	0	67	1	14	1	202	0	18	5
875	2017-06-27 23:10:53.113243+08	13	69	138.500903847600995	258	5.375	24	3	1	105	1	14	1	258	1	24	3
876	2017-06-27 23:10:53.119329+08	14	70	97.3262783579581026	332	4.61111111111110983	36	2	0	54	1	14	1	332	0	36	2
877	2017-06-27 23:10:53.120743+08	12	57	168.257256379800992	12	2	3	0	0	106	1	14	1	12	0	3	0
878	2017-06-27 23:10:53.122183+08	14	44	189.098847619715997	81	6.75	6	2	0	100	1	14	1	81	0	6	2
879	2017-06-27 23:10:53.123562+08	12	31	207.756897750472007	222	7.40000000000000036	15	9	2	52	1	14	1	222	2	15	9
880	2017-06-27 23:10:53.12502+08	8	35	201.715960059383008	51	8.5	3	1	0	60	1	14	1	51	0	3	1
882	2017-06-27 23:10:53.127505+08	10	21	222.645349614552998	191	7.95833333333333037	12	8	2	59	1	14	1	191	2	12	8
883	2017-06-27 23:10:53.128712+08	14	45	188.466037156292998	531	6.80769230769231015	39	10	0	55	1	14	1	531	0	39	10
884	2017-06-27 23:10:53.130073+08	13	40	194.728281835911986	179	7.45833333333333037	12	5	1	56	1	14	1	179	1	12	5
885	2017-06-27 23:10:53.131303+08	14	42	192.328447971439999	533	7.40277777777778034	36	15	0	53	1	14	1	533	0	36	15
886	2017-06-27 23:10:53.132515+08	11	19	226.743649766647991	424	7.85185185185185031	27	17	3	57	1	14	1	424	3	27	17
45	2017-06-27 22:01:15.240334+08	2	4	220.954461267576988	109	9.08333333333333037	6	5	0	76	1	2	1	109	0	6	5
3	2017-06-27 21:48:26.775309+08	1	26	195.901477832512001	42	7	3	1	0	7	1	1	1	42	0	3	1
39	2017-06-27 21:48:26.855184+08	1	14	204.559706959707	46	7.66666666666666963	3	1	0	92	1	1	1	46	0	3	1
75	2017-06-27 22:01:15.301621+08	2	35	194.666666666666998	42	7	3	1	0	100	1	2	1	42	0	3	1
115	2017-06-27 22:11:45.41923+08	1	24	202.613548575534992	47	7.83333333333333037	3	1	0	82	1	3	1	47	0	3	1
103	2017-06-27 22:11:45.382162+08	3	28	200.011942080908	45	7.5	3	2	0	87	1	3	1	45	0	3	2
144	2017-06-27 22:11:45.490195+08	1	56	168.257256379800992	12	2	3	0	0	106	1	3	1	12	0	3	0
194	2017-06-27 22:24:29.515179+08	4	20	208.656434680403009	93	7.75	6	3	0	72	1	4	1	93	0	6	3
208	2017-06-27 22:24:29.538887+08	4	49	185.545948402917986	119	6.61111111111110983	9	2	0	49	1	4	1	119	0	9	2
232	2017-06-27 22:26:18.533625+08	4	8	229.959130983422995	165	9.16666666666666963	9	7	0	104	1	5	1	165	0	9	7
265	2017-06-27 22:26:18.593212+08	2	44	191.201452338244991	35	5.83333333333333037	3	1	0	108	1	5	1	35	0	3	1
343	2017-06-27 22:26:25.554822+08	7	60	173.218758768174013	191	6.3666666666666698	15	4	0	49	1	7	1	191	0	15	4
287	2017-06-27 22:26:21.723419+08	5	44	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	6	1	35	0	3	0
319	2017-06-27 22:26:21.781616+08	5	29	200.84386433127699	137	7.61111111111110983	9	4	1	56	1	6	1	137	1	9	4
365	2017-06-27 22:26:25.592444+08	7	25	208.52827369985701	279	7.75	18	8	0	90	1	7	1	279	0	18	8
370	2017-06-27 22:26:25.600927+08	7	63	161.326195702717996	259	6.16666666666666963	21	4	0	81	1	7	1	259	0	21	4
888	2017-06-27 23:10:53.137792+08	14	39	194.774953264662997	575	7.37179487179486959	39	18	0	90	1	14	1	575	0	39	18
889	2017-06-27 23:10:53.138926+08	14	26	215.096250756954987	606	7.76923076923077005	39	21	4	6	1	14	1	606	4	39	21
890	2017-06-27 23:10:53.140285+08	6	36	201.47926961475099	50	8.33333333333333037	3	3	0	112	1	14	1	50	0	3	3
891	2017-06-27 23:10:53.141663+08	8	43	191.85998403855001	34	5.66666666666666963	3	1	0	111	1	14	1	34	0	3	1
892	2017-06-27 23:10:53.143054+08	14	65	153.427201907779988	537	6.39285714285713969	42	10	1	81	1	14	1	537	1	42	10
893	2017-06-27 23:10:53.144318+08	14	14	233.845327520599994	440	8.14814814814815058	27	17	2	89	1	14	1	440	2	27	17
894	2017-06-27 23:10:53.145628+08	14	6	250.66666654497601	647	8.29487179487179915	39	25	6	7	1	14	1	647	6	39	25
98	2017-06-27 22:11:45.36305+08	2	43	190.303493986219991	32	5.33333333333333037	3	0	0	105	1	3	1	32	0	3	0
162	2017-06-27 22:24:29.455827+08	4	14	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	4	1	97	0	6	3
174	2017-06-27 22:24:29.47655+08	4	61	164.945166183103993	97	5.38888888888889017	9	1	0	61	1	4	1	97	0	9	1
193	2017-06-27 22:24:29.513408+08	3	7	229.959130983422995	165	9.16666666666666963	9	7	0	104	1	4	1	165	0	9	7
160	2017-06-27 22:24:29.450188+08	4	8	224.640362440417988	200	8.33333333333333037	12	8	1	7	1	4	1	200	1	12	8
253	2017-06-27 22:26:18.573626+08	4	37	197.483599825688998	85	7.08333333333333037	6	2	0	93	1	5	1	85	0	6	2
251	2017-06-27 22:26:18.570823+08	5	41	193.763798424263001	176	7.33333333333333037	12	5	0	90	1	5	1	176	0	12	5
266	2017-06-27 22:26:18.598786+08	4	46	187.202829948345993	35	5.83333333333333037	3	0	0	103	1	5	1	35	0	3	0
347	2017-06-27 22:26:25.562542+08	7	13	220.416800283604999	332	7.90476190476191043	21	12	1	69	1	7	1	332	1	21	12
307	2017-06-27 22:26:21.760266+08	6	24	208.187605872523989	283	7.86111111111110983	18	12	0	4	1	6	1	283	0	18	12
316	2017-06-27 22:26:21.777525+08	6	65	125.347475908912003	125	4.16666666666666963	15	0	0	54	1	6	1	125	0	15	0
339	2017-06-27 22:26:21.816421+08	6	26	205.115874949918009	186	7.75	12	6	1	42	1	6	1	186	1	12	6
382	2017-06-27 22:26:25.625599+08	7	11	224.02314483149101	248	8.26666666666666927	15	10	1	58	1	7	1	248	1	15	10
404	2017-06-27 22:26:25.662755+08	7	44	188.34818034483601	311	7.40476190476191043	21	9	1	43	1	7	1	311	1	21	9
403	2017-06-27 22:26:25.661498+08	7	2	270.196076863043004	383	9.1190476190476204	21	16	4	41	1	7	1	383	4	21	16
415	2017-06-27 22:26:29.841585+08	6	32	202.613548575534992	47	7.83333333333333037	3	1	0	82	1	8	1	47	0	3	1
456	2017-06-27 22:26:29.915444+08	8	68	117.134493182186006	149	4.13888888888889017	18	0	0	54	1	8	1	149	0	18	0
473	2017-06-27 22:26:29.942467+08	7	47	183.813891301973996	74	6.16666666666666963	6	0	0	97	1	8	1	74	0	6	0
421	2017-06-27 22:26:29.849327+08	8	10	230.018061424955988	333	7.92857142857142971	21	13	5	71	1	8	1	333	5	21	13
495	2017-06-27 22:26:36.297497+08	9	62	166.283987855340001	353	6.53703703703703987	27	7	0	47	1	9	1	353	0	27	7
556	2017-06-27 22:26:40.077477+08	10	44	190.151925312038998	391	7.24074074074073959	27	12	0	90	1	10	1	391	0	27	12
552	2017-06-27 22:26:40.072303+08	4	42	191.85998403855001	34	5.66666666666666963	3	1	0	111	1	10	1	34	0	3	1
571	2017-06-27 22:26:40.10517+08	6	15	222.645349614552998	191	7.95833333333333037	12	8	2	59	1	10	1	191	2	12	8
606	2017-06-27 22:26:40.168735+08	10	53	179.956119090590988	155	6.45833333333333037	12	5	0	87	1	10	1	155	0	12	5
288	2017-06-27 22:26:21.724723+08	4	28	202.613548575534992	47	7.83333333333333037	3	1	0	82	1	6	1	47	0	3	1
340	2017-06-27 22:26:25.550908+08	3	59	173.940955318065988	17	2.83333333333332993	3	0	0	110	1	7	1	17	0	3	0
619	2017-06-27 23:09:15.271534+08	2	38	201.289365747165988	87	7.25	6	3	0	113	1	11	1	87	0	6	3
646	2017-06-27 23:09:15.334472+08	11	26	212.503100225878001	97	8.08333333333333037	6	3	0	88	1	11	1	97	0	6	3
673	2017-06-27 23:09:15.389698+08	11	70	114.534611177798993	256	4.74074074074073959	27	1	0	54	1	11	1	256	0	27	1
676	2017-06-27 23:09:15.395912+08	11	49	179.956119090590988	155	6.45833333333333037	12	5	0	87	1	11	1	155	0	12	5
694	2017-06-27 23:10:42.749371+08	12	68	144.198255338578008	202	5.61111111111110983	18	5	0	67	1	12	1	202	0	18	5
721	2017-06-27 23:10:42.80067+08	10	4	254.545387293327991	514	8.56666666666666998	30	23	9	5	1	12	1	514	9	30	23
748	2017-06-27 23:10:42.849204+08	12	16	225.218562854525999	394	8.20833333333333037	24	15	2	72	1	12	1	394	2	24	15
751	2017-06-27 23:10:42.853127+08	10	10	237.730941560664007	257	8.56666666666666998	15	10	4	75	1	12	1	257	4	15	10
769	2017-06-27 23:10:49.241826+08	13	22	221.118961972056013	564	7.83333333333333037	36	20	4	6	1	13	1	564	4	36	20
796	2017-06-27 23:10:49.290972+08	13	33	203.694373596051008	501	7.59090909090908994	33	15	0	53	1	13	1	501	0	33	15
823	2017-06-27 23:10:49.336348+08	13	1	265.974422849967993	538	8.96666666666667034	30	24	7	40	1	13	1	538	7	30	24
826	2017-06-27 23:10:53.029452+08	13	12	236.82566247031599	320	8.88888888888888928	18	13	0	104	1	14	1	320	0	18	13
844	2017-06-27 23:10:53.058529+08	14	1	265.974422849967993	538	8.96666666666667034	30	24	7	40	1	14	1	538	7	30	24
871	2017-06-27 23:10:53.108081+08	8	41	194.624604591753013	180	7.5	12	4	1	65	1	14	1	180	1	12	4
401	2017-06-27 22:26:25.65908+08	7	1	284.565249769472018	400	9.52380952380952017	21	19	5	40	1	7	1	400	5	21	19
426	2017-06-27 22:26:29.858296+08	8	6	241.694675663693999	309	8.58333333333333037	18	13	1	74	1	8	1	309	1	18	13
438	2017-06-27 22:26:29.881331+08	2	38	198.254188944806003	87	7.25	6	1	1	65	1	8	1	87	1	6	1
461	2017-06-27 22:26:29.925078+08	8	60	169.805460692796004	231	6.41666666666666963	18	5	0	49	1	8	1	231	0	18	5
502	2017-06-27 22:26:36.311117+08	8	36	200.84386433127699	137	7.61111111111110983	9	4	1	56	1	9	1	137	1	9	4
509	2017-06-27 22:26:36.325572+08	8	7	241.233026601797008	276	9.19999999999999929	15	11	0	104	1	9	1	276	0	15	11
536	2017-06-27 22:26:36.372207+08	9	57	171.744242019165	316	6.58333333333333037	24	4	0	78	1	9	1	316	0	24	4
575	2017-06-27 22:26:40.111235+08	8	61	168.257256379800992	12	2	3	0	0	106	1	10	1	12	0	3	0
588	2017-06-27 22:26:40.134332+08	10	39	199.080948602027007	177	7.375	12	4	0	3	1	10	1	177	0	12	4
558	2017-06-27 22:26:40.080258+08	10	12	229.912082724648002	432	8	27	15	2	7	1	10	1	432	2	27	15
563	2017-06-27 22:26:40.089818+08	10	54	178.918474579204002	114	6.33333333333333037	9	2	0	64	1	10	1	114	0	9	2
620	2017-06-27 23:09:15.273227+08	11	50	178.918474579204002	114	6.33333333333333037	9	2	0	64	1	11	1	114	0	9	2
649	2017-06-27 23:09:15.344425+08	5	44	191.85998403855001	34	5.66666666666666963	3	1	0	111	1	11	1	34	0	3	1
682	2017-06-27 23:09:15.403632+08	10	52	173.313492446954001	192	6.40000000000000036	15	3	0	97	1	11	1	192	0	15	3
688	2017-06-27 23:10:42.73861+08	11	33	202.16302672744601	210	7	15	4	1	93	1	12	1	210	1	15	4
717	2017-06-27 23:10:42.787612+08	11	5	254.515386314283006	319	8.86111111111111072	18	15	4	44	1	12	1	319	4	18	15
750	2017-06-27 23:10:42.851817+08	12	24	215.040049351315986	594	8.25	36	21	0	2	1	12	1	594	0	36	21
757	2017-06-27 23:10:49.223319+08	13	52	173.537372708240014	463	7.01515151515152002	33	13	0	80	1	13	1	463	0	33	13
786	2017-06-27 23:10:49.273041+08	13	56	169.105134340603001	474	6.58333333333333037	36	10	0	47	1	13	1	474	0	36	10
818	2017-06-27 23:10:49.329836+08	13	38	200.462088139360986	270	7.5	18	7	0	3	1	13	1	270	0	18	7
825	2017-06-27 23:10:53.028192+08	14	20	226.041765439247996	444	8.22222222222221966	27	17	2	72	1	14	1	444	2	27	17
849	2017-06-27 23:10:53.068053+08	14	18	227.890818715684986	612	7.84615384615385025	39	24	7	46	1	14	1	612	7	39	24
881	2017-06-27 23:10:53.126327+08	14	15	231.279909083250004	340	8.09523809523808957	21	13	5	58	1	14	1	340	5	21	13
887	2017-06-27 23:10:53.136391+08	13	25	215.526701477234013	263	7.3055555555555598	18	6	2	93	1	14	1	263	2	18	6
523	2017-06-27 22:26:36.349844+08	6	43	189.630931051211007	80	6.66666666666666963	6	2	0	108	1	9	1	80	0	6	2
895	2017-09-10 23:22:23.430445+08	15	8	240.402361774964987	638	8.08333333333333037	3	2	0	71	1	15	2	56	8	39	26
896	2017-09-10 23:22:23.438879+08	15	17	225.754629930239986	685	8.01282051282050922	3	0	0	76	1	15	2	38	3	42	24
897	2017-09-10 23:22:23.442552+08	13	5	251.072055407867992	515	8.58333333333333037	3	3	0	77	1	15	2	55	0	30	21
898	2017-09-10 23:22:23.445192+08	15	66	147.679500291989001	539	6.35897435897436036	3	1	0	78	1	15	2	34	0	42	9
899	2017-09-10 23:22:23.447023+08	13	31	203.987771667778986	141	7.83333333333333037	0	0	0	82	1	15	2	0	0	9	4
900	2017-09-10 23:22:23.448738+08	14	48	187.202829948345993	35	5.83333333333333037	0	0	0	103	1	15	2	0	0	3	0
901	2017-09-10 23:22:23.450727+08	13	2	258.623875860145006	610	8.47222222222221966	0	0	0	5	1	15	2	0	9	36	27
902	2017-09-10 23:22:23.452945+08	15	26	214.713893123292991	287	8.03333333333332966	3	2	0	92	1	15	2	48	2	18	10
903	2017-09-10 23:22:23.459421+08	15	65	150.012665952460992	528	6.15384615384614975	3	0	0	79	1	15	2	31	0	42	9
904	2017-09-10 23:22:23.461278+08	14	63	151.011476540638995	292	6.08333333333333037	3	1	0	83	1	15	2	50	0	24	5
905	2017-09-10 23:22:23.465982+08	15	49	184.45676914666501	248	6.76666666666667016	3	2	0	87	1	15	2	51	0	18	8
906	2017-09-10 23:22:23.467746+08	15	59	162.298522116638992	156	6	0	0	0	91	1	15	2	0	0	12	1
907	2017-09-10 23:22:23.469414+08	10	61	158.628627282320991	38	3.16666666666667007	0	0	0	96	1	15	2	0	0	6	0
908	2017-09-10 23:22:23.47093+08	14	56	173.313492446954001	192	6.40000000000000036	0	0	0	97	1	15	2	0	0	15	3
909	2017-09-10 23:22:23.472399+08	12	50	183.698842011000011	160	6.6666666666700003	0	0	0	108	1	15	2	0	0	12	3
910	2017-09-10 23:22:23.473875+08	12	52	179.816144842987001	233	6.47222222222221966	0	0	0	109	1	15	2	0	0	18	2
911	2017-09-10 23:22:23.475471+08	15	54	177.217224277046	557	7.0555555555555598	3	2	0	80	1	15	2	50	0	39	16
912	2017-09-10 23:22:23.477174+08	1	28	214.277102008003993	60	10	3	3	1	127	1	15	2	60	1	3	3
913	2017-09-10 23:22:23.483294+08	15	43	190.678703568446991	576	7.40277777777778034	3	1	0	125	1	15	2	43	0	39	16
914	2017-09-10 23:22:23.486245+08	11	13	232.338246699143014	248	8.26666666666666927	3	3	0	124	1	15	2	57	2	15	11
915	2017-09-10 23:22:23.489226+08	15	22	219.205598062387992	484	8.24074074074074048	3	1	0	72	1	15	2	40	2	30	18
916	2017-09-10 23:22:23.491067+08	15	7	246.14405169748801	585	8.07575757575757969	3	3	1	73	1	15	2	60	5	36	22
917	2017-09-10 23:22:23.493591+08	15	20	220.33486986064699	483	7.9074074074074101	0	0	0	74	1	15	2	0	1	30	17
918	2017-09-10 23:22:23.495901+08	13	6	249.183101431545992	354	8.4285714285714306	0	0	0	75	1	15	2	0	5	21	14
919	2017-09-10 23:22:23.497346+08	15	15	230.954739813550987	626	7.91666666666666963	0	0	0	84	1	15	2	0	1	39	27
920	2017-09-10 23:22:23.498767+08	14	9	236.82566247031599	320	8.88888888888888928	0	0	0	104	1	15	2	0	0	18	13
921	2017-09-10 23:22:23.500253+08	15	38	194.869838342979989	721	7.91666666666666963	3	1	0	2	1	15	2	38	0	45	25
922	2017-09-10 23:22:23.507171+08	15	3	253.816918933723002	773	8.4880952380952408	3	2	1	41	1	15	2	53	7	45	31
923	2017-09-10 23:22:23.508988+08	15	10	234.798901679870994	548	8.44999999999999929	3	3	0	42	1	15	2	60	2	33	21
924	2017-09-10 23:22:23.510917+08	15	51	183.03537307404801	661	7.33333333333333037	3	0	0	43	1	15	2	42	1	45	18
925	2017-09-10 23:22:23.512681+08	14	1	268.140929364933982	483	8.94444444444443931	3	3	1	44	1	15	2	60	5	27	22
926	2017-09-10 23:22:23.514469+08	13	21	220.324517467291997	313	7.45238095238094989	0	0	0	45	1	15	2	0	3	21	8
927	2017-09-10 23:22:23.516154+08	15	23	216.884930351895008	379	7.97619047619047983	3	3	0	3	1	15	2	60	0	24	12
928	2017-09-10 23:22:23.523784+08	15	71	97.3262783579581026	332	4.90909090909091006	0	0	0	54	1	15	2	0	0	36	2
929	2017-09-10 23:22:23.525435+08	15	46	188.466037156292998	531	6.88888888888889017	0	0	0	55	1	15	2	0	0	39	10
930	2017-09-10 23:22:23.527+08	14	41	193.788612931285002	221	7.3666666666666698	3	2	0	56	1	15	2	42	1	15	7
931	2017-09-10 23:22:23.528539+08	15	14	231.279909083250004	340	8.44444444444443931	0	0	0	58	1	15	2	0	5	21	13
932	2017-09-10 23:22:23.530007+08	9	33	201.715960059383008	51	8.5	0	0	0	60	1	15	2	0	0	3	1
933	2017-09-10 23:22:23.531594+08	12	16	226.743649766647991	424	7.85185185185185031	0	0	0	57	1	15	2	0	3	27	17
934	2017-09-10 23:22:23.534134+08	13	36	198.955249127780007	259	7.1944444444444402	3	1	0	52	1	15	2	37	2	18	10
935	2017-09-10 23:22:23.536525+08	1	27	214.330512718368993	53	8.83333333333333037	3	2	0	133	1	15	2	53	0	3	2
936	2017-09-10 23:22:23.538693+08	1	44	189.101696853995008	34	5.66666666666666963	3	0	0	134	1	15	2	34	0	3	0
937	2017-09-10 23:22:23.540261+08	1	32	203.634720192282998	48	8	3	1	0	138	1	15	2	48	0	3	1
938	2017-09-10 23:22:23.546061+08	15	68	140.920613215845009	400	6.31666666666666998	3	0	0	123	1	15	2	36	0	33	5
939	2017-09-10 23:22:23.547739+08	15	64	150.232856072721006	573	6.28571428571429003	3	1	0	81	1	15	2	36	1	45	11
940	2017-09-10 23:22:23.54931+08	15	11	233.845327520599994	440	8.08333333333333037	0	0	0	89	1	15	2	0	2	27	17
941	2017-09-10 23:22:23.550891+08	14	19	222.252543308953989	311	7.40476190476191043	3	2	0	93	1	15	2	48	2	21	8
942	2017-09-10 23:22:23.552971+08	9	42	191.85998403855001	34	5.66666666666666963	0	0	0	111	1	15	2	0	0	3	1
943	2017-09-10 23:22:23.554405+08	7	34	201.47926961475099	50	8.33333333333333037	0	0	0	112	1	15	2	0	0	3	3
944	2017-09-10 23:22:23.555875+08	15	39	194.774953264662997	575	7.41666666666666963	0	0	0	90	1	15	2	0	0	39	18
945	2017-09-10 23:22:23.55735+08	15	4	251.765614775565012	695	8.37179487179487047	3	2	0	7	1	15	2	48	6	42	27
946	2017-09-10 23:22:23.558731+08	15	25	215.184799467532002	655	7.76923076923077005	3	2	0	6	1	15	2	49	4	42	23
947	2017-09-10 23:22:23.564168+08	14	47	188.01545628556201	254	7.0555555555555598	3	1	0	62	1	15	2	38	1	18	6
948	2017-09-10 23:22:23.565608+08	15	57	172.847325496958007	151	6.5	0	0	0	64	1	15	2	0	0	12	3
949	2017-09-10 23:22:23.566986+08	13	62	154.619020194802005	215	5.97222222222221966	0	0	0	66	1	15	2	0	0	18	3
950	2017-09-10 23:22:23.568414+08	15	70	131.619928167890009	233	5.5555555555555598	3	0	0	67	1	15	2	31	0	21	5
951	2017-09-10 23:22:23.569813+08	14	69	134.316816944086014	296	5.48148148148148007	3	1	0	105	1	15	2	38	1	27	4
952	2017-09-10 23:22:23.571229+08	6	35	201.289365747165988	87	7.25	0	0	0	113	1	15	2	0	0	6	3
953	2017-09-10 23:22:23.572577+08	15	30	207.335966461536003	711	7.96428571428570997	3	1	0	69	1	15	2	44	1	45	21
954	2017-09-10 23:22:23.574015+08	15	24	216.207451097193001	337	7.97222222222221966	3	3	0	63	1	15	2	53	0	21	14
955	2017-09-10 23:22:23.57926+08	15	0	214.87032802600001	328	8.19444444444400055	0	0	0	140	1	15	2	0	0	21	14
956	2017-09-10 23:22:23.580939+08	15	18	223.672263580990005	655	7.83333333333333037	3	1	0	116	1	15	2	43	7	42	25
957	2017-09-10 23:22:23.582352+08	15	60	160.641181408871006	545	6.61538461538460965	3	1	0	115	1	15	2	44	0	42	11
958	2017-09-10 23:22:23.583768+08	14	53	177.284844463995	246	6.83333333333333037	0	0	0	118	1	15	2	0	0	18	5
959	2017-09-10 23:22:23.58514+08	15	67	142.345614238128007	486	6.33333333333333037	3	0	0	117	1	15	2	22	0	39	8
960	2017-09-10 23:22:23.586604+08	1	37	195.915680701203001	34	5.66666666666666963	3	1	0	120	1	15	2	34	0	3	1
961	2017-09-10 23:22:23.587984+08	15	12	233.526153236117011	622	7.875	3	1	0	114	1	15	2	35	5	39	21
962	2017-09-21 22:43:22.860657+08	16	3	255.738995625768013	829	8.53571428571429003	6	5	1	41	1	16	2	109	7	48	34
963	2017-09-21 22:43:22.86507+08	16	17	224.899297959722986	586	8.25	6	4	0	42	1	16	2	98	2	36	22
964	2017-09-21 22:43:22.867296+08	16	41	195.944861295965012	721	7.53571428571429003	6	3	0	43	1	16	2	102	1	48	21
965	2017-09-21 22:43:22.8692+08	15	1	265.885723640440006	539	8.87037037037037024	6	5	1	44	1	16	2	116	5	30	24
966	2017-09-21 22:43:22.871074+08	14	21	220.324517467291997	313	7.45238095238094989	0	0	0	45	1	16	2	0	3	21	8
967	2017-09-21 22:43:22.873083+08	16	24	216.884930351895008	379	7.97619047619047983	3	3	0	3	1	16	2	60	0	24	12
968	2017-09-21 22:43:22.874886+08	1	36	200.916057595268995	48	8	3	1	0	126	1	16	2	48	0	3	1
969	2017-09-21 22:43:22.884456+08	16	62	159.022215096374993	568	6.11538461538460965	6	2	0	79	1	16	2	71	0	45	11
970	2017-09-21 22:43:22.886564+08	15	66	149.990773927396987	331	6.16666666666666963	6	1	0	83	1	16	2	89	0	27	5
971	2017-09-21 22:43:22.890819+08	16	53	184.45676914666501	248	6.76666666666667016	3	2	0	87	1	16	2	51	0	18	8
972	2017-09-21 22:43:22.892814+08	16	60	162.298522116638992	156	6	0	0	0	91	1	16	2	0	0	12	1
973	2017-09-21 22:43:22.894992+08	11	63	158.628627282320991	38	3.16666666666667007	0	0	0	96	1	16	2	0	0	6	0
974	2017-09-21 22:43:22.897742+08	15	57	173.313492446954001	192	6.58333333333333037	0	0	0	97	1	16	2	0	0	15	3
975	2017-09-21 22:43:22.899614+08	13	54	183.698842011000011	160	6.66666666666666963	0	0	0	108	1	16	2	0	0	12	3
976	2017-09-21 22:43:22.901379+08	13	58	169.978694597236995	265	6.3095238095238102	3	0	0	109	1	16	2	32	0	21	2
977	2017-09-21 22:43:22.903467+08	16	59	168.159544427842008	587	6.86111111111110983	6	2	0	80	1	16	2	80	0	42	16
978	2017-09-21 22:43:22.90641+08	2	19	222.486952587148011	109	9.08333333333333037	6	5	1	127	1	16	2	109	1	6	5
979	2017-09-21 22:43:22.914424+08	16	7	248.767951532326009	698	8.33333333333333037	6	5	1	71	1	16	2	116	9	42	29
980	2017-09-21 22:43:22.916389+08	16	16	225.754629930239986	685	8	3	0	0	76	1	16	2	38	3	42	24
981	2017-09-21 22:43:22.918391+08	14	4	251.505243340613987	567	8.59090909090908994	6	5	0	77	1	16	2	107	0	33	23
982	2017-09-21 22:43:22.920442+08	16	67	146.750188220841011	578	6.3690476190476204	6	1	0	78	1	16	2	73	0	45	9
983	2017-09-21 22:43:22.923079+08	14	33	203.987771667778986	141	7.83333333333333037	0	0	0	82	1	16	2	0	0	9	4
984	2017-09-21 22:43:22.92502+08	15	50	187.202829948345993	35	-1	0	0	0	103	1	16	2	0	0	3	0
985	2017-09-21 22:43:22.926949+08	14	2	260.851084161866027	664	8.51282051282050922	3	3	0	5	1	16	2	54	9	39	30
986	2017-09-21 22:43:22.928603+08	16	26	215.795884961441004	335	8.16666666666666963	6	4	0	92	1	16	2	96	2	21	12
987	2017-09-21 22:43:22.937971+08	16	72	86.0465566208676051	345	4.68181818181817988	3	0	0	54	1	16	2	13	0	39	2
988	2017-09-21 22:43:22.941041+08	16	47	188.466037156292998	531	7	0	0	0	55	1	16	2	0	0	39	10
989	2017-09-21 22:43:22.943812+08	15	45	190.087761170384994	258	6.8666666666666698	6	3	0	56	1	16	2	79	1	18	8
990	2017-09-21 22:43:22.945657+08	16	12	231.279909083250004	340	8.63333333333332931	0	0	0	58	1	16	2	0	5	21	13
991	2017-09-21 22:43:22.947338+08	10	34	201.715960059383008	51	8.5	0	0	0	60	1	16	2	0	0	3	1
992	2017-09-21 22:43:22.948941+08	13	15	226.743649766647991	424	7.85185185185185031	0	0	0	57	1	16	2	0	3	27	17
993	2017-09-21 22:43:22.950679+08	14	39	198.980802338724999	303	7.21428571428570997	6	2	0	52	1	16	2	81	2	21	11
994	2017-09-21 22:43:22.952388+08	2	29	214.330512718368993	53	8.83333333333333037	3	2	0	133	1	16	2	53	0	3	2
995	2017-09-21 22:43:22.954086+08	2	46	189.101696853995008	34	5.66666666666666963	3	0	0	134	1	16	2	34	0	3	0
996	2017-09-21 22:43:22.95578+08	2	32	208.340208794352009	94	7.83333333333333037	6	3	1	138	1	16	2	94	1	6	3
997	2017-09-21 22:43:22.957348+08	1	49	187.684215988272001	32	5.33333333333333037	3	0	0	143	1	16	2	32	0	3	0
998	2017-09-21 22:43:22.962967+08	16	40	196.185577368596	624	7.5555555555555598	6	2	0	125	1	16	2	91	0	42	17
999	2017-09-21 22:43:22.964346+08	12	14	227.044658063713001	290	8.05555555555556069	6	4	0	124	1	16	2	99	2	18	12
1000	2017-09-21 22:43:22.965794+08	16	22	219.205598062387992	484	8.24074074074074048	3	1	0	72	1	16	2	40	2	30	18
1001	2017-09-21 22:43:22.967129+08	16	5	250.854141592930006	640	8.31818181818182012	6	5	1	73	1	16	2	115	5	39	24
1002	2017-09-21 22:43:22.96848+08	16	20	220.33486986064699	483	7.9375	0	0	0	74	1	16	2	0	1	30	17
1003	2017-09-21 22:43:22.970053+08	14	6	249.183101431545992	354	8.4285714285714306	0	0	0	75	1	16	2	0	5	21	14
1004	2017-09-21 22:43:22.971461+08	16	13	230.954739813550987	626	7.83333333333333037	0	0	0	84	1	16	2	0	1	39	27
1005	2017-09-21 22:43:22.97285+08	15	9	236.82566247031599	320	8.66666666666666963	0	0	0	104	1	16	2	0	0	18	13
1006	2017-09-21 22:43:22.974218+08	16	37	200.326016354773003	772	7.95238095238094989	6	2	0	2	1	16	2	89	0	48	26
1007	2017-09-21 22:43:22.975613+08	1	38	200.278957794209987	41	6.83333333333333037	3	2	1	139	1	16	2	41	1	3	2
1008	2017-09-21 22:43:22.980789+08	16	69	134.806701775959993	430	6.21666666666667034	6	1	0	123	1	16	2	66	0	36	6
1009	2017-09-21 22:43:22.983418+08	16	68	145.817020398533998	602	6.17857142857142971	6	1	0	81	1	16	2	65	1	48	11
1010	2017-09-21 22:43:22.984852+08	16	11	233.845327520599994	440	8.3095238095238102	0	0	0	89	1	16	2	0	2	27	17
1011	2017-09-21 22:43:22.98625+08	15	18	224.755399691705009	364	7.42857142857142971	6	4	0	93	1	16	2	101	2	24	10
1012	2017-09-21 22:43:22.987652+08	10	44	191.85998403855001	34	5.66666666666666963	0	0	0	111	1	16	2	0	0	3	1
1013	2017-09-21 22:43:22.989036+08	8	35	201.47926961475099	50	8.33333333333333037	0	0	0	112	1	16	2	0	0	3	3
1014	2017-09-21 22:43:22.990421+08	16	42	194.774953264662997	575	7.41666666666666963	0	0	0	90	1	16	2	0	0	39	18
1015	2017-09-21 22:43:22.991811+08	16	8	248.326315466023004	739	8.25641025641026083	6	4	0	7	1	16	2	92	6	45	29
1016	2017-09-21 22:43:22.993193+08	16	27	215.535148972300988	698	7.67948717948717974	6	4	1	6	1	16	2	92	5	45	25
1017	2017-09-21 22:43:22.998233+08	15	48	188.01545628556201	254	7.06666666666666998	3	1	0	62	1	16	2	38	1	18	6
1018	2017-09-21 22:43:22.999657+08	16	51	186.877596648234999	206	7.16666666666666963	3	2	0	64	1	16	2	55	0	15	5
1019	2017-09-21 22:43:23.001049+08	14	65	154.638107745664001	251	5.97619047619047983	3	0	0	66	1	16	2	36	0	21	3
1020	2017-09-21 22:43:23.002575+08	16	71	131.619928167890009	233	5.5555555555555598	3	0	0	67	1	16	2	31	0	21	5
1021	2017-09-21 22:43:23.00409+08	15	70	134.316816944086014	296	5.5	3	1	0	105	1	16	2	38	1	27	4
1022	2017-09-21 22:43:23.005761+08	7	52	186.688453869970999	120	6.66666666666666963	3	1	0	113	1	16	2	33	0	9	4
1023	2017-09-21 22:43:23.00738+08	16	30	211.224209009289012	764	8.16666666666666963	6	3	0	69	1	16	2	97	1	48	23
1024	2017-09-21 22:43:23.008786+08	16	25	216.207451097193001	337	8.30000000000000071	3	3	0	63	1	16	2	53	0	21	14
1025	2017-09-21 22:43:23.010232+08	1	55	178.910579989763988	24	4	3	0	0	129	1	16	2	24	0	3	0
1026	2017-09-21 22:43:23.015433+08	16	28	214.87032802600001	328	7.96666666666667034	0	0	0	140	1	16	2	0	0	21	14
1027	2017-09-21 22:43:23.016987+08	16	23	217.100795171437994	696	7.64102564102563964	6	2	0	116	1	16	2	84	7	45	26
1028	2017-09-21 22:43:23.018549+08	16	61	160.641181408871006	545	6.58333333333333037	3	1	0	115	1	16	2	44	0	42	11
1029	2017-09-21 22:43:23.020107+08	15	56	177.284844463995	246	6.5	0	0	0	118	1	16	2	0	0	18	5
1030	2017-09-21 22:43:23.02158+08	16	64	156.568667161365994	538	6.51282051282051011	6	2	0	117	1	16	2	74	0	42	10
1031	2017-09-21 22:43:23.023027+08	2	31	211.171982062722009	90	7.5	6	4	0	120	1	16	2	90	0	6	4
1032	2017-09-21 22:43:23.024466+08	16	10	236.004712864433003	673	7.84722222222221966	6	3	0	114	1	16	2	86	5	42	23
1033	2017-09-21 22:43:23.025883+08	1	43	193.730588061095006	41	6.83333333333333037	3	1	0	122	1	16	2	41	0	3	1
1034	2017-09-21 23:01:58.890018+08	17	75	86.0465566208676051	345	4.68181818181817988	3	0	0	54	1	17	2	13	0	39	2
1035	2017-09-21 23:01:58.892871+08	17	44	194.472217548455006	587	7.06060606060605966	3	2	0	55	1	17	2	56	0	42	12
1036	2017-09-21 23:01:58.895057+08	16	48	190.087761170384994	258	6.625	6	3	0	56	1	17	2	79	1	18	8
1037	2017-09-21 23:01:58.897109+08	17	12	231.279909083250004	340	8.63333333333332931	0	0	0	58	1	17	2	0	5	21	13
1038	2017-09-21 23:01:58.899254+08	11	38	201.715960059383008	51	8.5	0	0	0	60	1	17	2	0	0	3	1
1039	2017-09-21 23:01:58.901457+08	14	21	223.883154273858992	473	7.8833333333333302	3	2	0	57	1	17	2	49	3	30	19
1040	2017-09-21 23:01:58.904323+08	15	40	198.980802338724999	303	6.83333333333333037	6	2	0	52	1	17	2	81	2	21	11
1041	2017-09-21 23:01:58.906815+08	1	35	204.238172290367004	51	8.5	3	2	0	131	1	17	2	51	0	3	2
1042	2017-09-21 23:01:58.908944+08	1	41	196.371196635838999	47	7.83333333333333037	3	0	0	132	1	17	2	47	0	3	0
1043	2017-09-21 23:01:58.910825+08	3	32	214.330512718368993	53	8.83333333333333037	3	2	0	133	1	17	2	53	0	3	2
1044	2017-09-21 23:01:58.91293+08	3	49	189.101696853995008	34	5.66666666666666963	3	0	0	134	1	17	2	34	0	3	0
1045	2017-09-21 23:01:58.914835+08	3	34	208.340208794352009	94	7.83333333333333037	6	3	1	138	1	17	2	94	1	6	3
1046	2017-09-21 23:01:58.916738+08	2	51	187.684215988272001	32	5.33333333333333037	3	0	0	143	1	17	2	32	0	3	0
1047	2017-09-21 23:01:58.918622+08	1	39	199.726611369756995	53	8.83333333333333037	3	1	0	144	1	17	2	53	0	3	1
1048	2017-09-21 23:01:58.928946+08	16	54	184.337192475009005	297	6.79999999999999982	6	1	0	62	1	17	2	81	1	21	6
1049	2017-09-21 23:01:58.930936+08	17	53	186.877596648234999	206	6.77777777777778034	3	2	0	64	1	17	2	55	0	15	5
1050	2017-09-21 23:01:58.932711+08	15	67	154.638107745664001	251	5.77777777777778034	3	0	0	66	1	17	2	36	0	21	3
1051	2017-09-21 23:01:58.934677+08	17	72	136.528107447383007	276	5.78571428571429003	6	1	0	67	1	17	2	74	0	24	6
1052	2017-09-21 23:01:58.93805+08	16	71	139.250373957642012	338	5.66666666666666963	6	2	0	105	1	17	2	80	1	30	5
1053	2017-09-21 23:01:58.941066+08	8	60	172.292049329701001	151	6.29166666666666963	6	1	0	113	1	17	2	64	0	12	4
1054	2017-09-21 23:01:58.942999+08	17	29	215.502783029314998	815	8.10714285714285943	9	5	0	69	1	17	2	148	1	51	25
1055	2017-09-21 23:01:58.945222+08	17	27	216.207451097193001	337	8.30000000000000071	3	3	0	63	1	17	2	53	0	21	14
1056	2017-09-21 23:01:58.94775+08	2	56	178.910579989763988	24	4	3	0	0	129	1	17	2	24	0	3	0
1057	2017-09-21 23:01:58.956302+08	17	74	123.721591817973007	454	5.95000000000000018	9	1	0	123	1	17	2	90	0	39	6
1058	2017-09-21 23:01:58.958289+08	17	68	153.723081092754001	644	6.22619047619047983	9	2	0	81	1	17	2	107	1	51	12
1059	2017-09-21 23:01:58.960291+08	17	10	233.845327520599994	440	8.47222222222221966	0	0	0	89	1	17	2	0	2	27	17
1060	2017-09-21 23:01:58.962297+08	16	19	224.755399691705009	364	7.42857142857142971	6	4	0	93	1	17	2	101	2	24	10
1061	2017-09-21 23:01:58.96426+08	11	46	191.85998403855001	34	5.66666666666666963	0	0	0	111	1	17	2	0	0	3	1
1062	2017-09-21 23:01:58.966244+08	9	25	217.252690595844996	103	8.58333333333333037	3	2	0	112	1	17	2	53	0	6	5
1063	2017-09-21 23:01:58.968234+08	17	43	194.774953264662997	575	7.46969696969696972	0	0	0	90	1	17	2	0	0	39	18
1064	2017-09-21 23:01:58.970175+08	17	5	251.232599303651995	790	8.14102564102564052	9	6	0	7	1	17	2	143	6	48	31
1065	2017-09-21 23:01:58.972852+08	17	26	216.808472154957997	747	7.76923076923077005	9	6	1	6	1	17	2	141	5	48	27
1066	2017-09-21 23:01:58.978908+08	17	3	255.738995625768013	829	8.61538461538460965	6	5	1	41	1	17	2	109	7	48	34
1067	2017-09-21 23:01:58.98068+08	17	18	224.899297959722986	586	8.25	6	4	0	42	1	17	2	98	2	36	22
1068	2017-09-21 23:01:58.982298+08	17	50	188.949897792911997	756	7.47619047619047983	9	4	0	43	1	17	2	137	1	51	22
1069	2017-09-21 23:01:58.984339+08	16	2	259.882315982412024	583	8.57407407407407085	9	7	1	44	1	17	2	160	5	33	26
1070	2017-09-21 23:01:58.986797+08	15	28	215.586148613836997	358	7.6190476190476204	3	2	0	45	1	17	2	45	3	24	10
1071	2017-09-21 23:01:58.989266+08	17	24	218.423623002838013	427	7.97916666666666963	6	4	0	3	1	17	2	108	0	27	13
1072	2017-09-21 23:01:58.991455+08	2	36	204.07936771493101	96	8	6	3	1	126	1	17	2	96	1	6	3
1073	2017-09-21 23:01:58.997538+08	17	42	196.185577368596	624	7.57575757575757969	6	2	0	125	1	17	2	91	0	42	17
1074	2017-09-21 23:01:58.999197+08	13	15	227.044658063713001	290	8.05555555555556069	6	4	0	124	1	17	2	99	2	18	12
1075	2017-09-21 23:01:59.000778+08	17	20	224.431435252265004	538	8.31666666666666998	6	3	0	72	1	17	2	94	2	33	20
1076	2017-09-21 23:01:59.002342+08	17	6	250.179552695799998	686	8.48484848484848087	9	7	1	73	1	17	2	161	5	42	26
1077	2017-09-21 23:01:59.003891+08	17	22	220.33486986064699	483	7.9375	0	0	0	74	1	17	2	0	1	30	17
1078	2017-09-21 23:01:59.005602+08	15	7	249.183101431545992	354	8.61111111111111072	0	0	0	75	1	17	2	0	5	21	14
1079	2017-09-21 23:01:59.007013+08	17	14	227.732679857369988	674	8.09090909090908994	3	2	0	84	1	17	2	48	1	42	29
1080	2017-09-21 23:01:59.00835+08	16	9	236.82566247031599	320	8.79166666666666963	0	0	0	104	1	17	2	0	0	18	13
1081	2017-09-21 23:01:59.009764+08	17	47	190.630772816612989	812	7.89285714285713969	9	3	0	2	1	17	2	129	0	51	27
1082	2017-09-21 23:01:59.011154+08	2	33	210.617776326885007	98	8.16666666666666963	6	5	1	139	1	17	2	98	1	6	5
1083	2017-09-21 23:01:59.016792+08	17	65	162.455206747614994	611	6.12820512820513041	9	3	0	79	1	17	2	114	0	48	12
1084	2017-09-21 23:01:59.018233+08	16	69	149.990773927396987	331	5.76190476190476009	6	1	0	83	1	17	2	89	0	27	5
1085	2017-09-21 23:01:59.019585+08	17	58	176.489582826663991	274	6.36111111111110983	6	3	0	87	1	17	2	77	0	21	9
1086	2017-09-21 23:01:59.020935+08	17	63	164.976551222499012	197	5.5	3	1	0	91	1	17	2	41	0	15	2
1087	2017-09-21 23:01:59.022281+08	12	66	158.628627282320991	38	3.16666666666667007	0	0	0	96	1	17	2	0	0	6	0
1088	2017-09-21 23:01:59.023837+08	16	59	173.313492446954001	192	6.58333333333333037	0	0	0	97	1	17	2	0	0	15	3
1089	2017-09-21 23:01:59.025315+08	14	55	183.698842011000011	160	6.66666666666666963	0	0	0	108	1	17	2	0	0	12	3
1090	2017-09-21 23:01:59.026785+08	14	61	169.978694597236995	265	6.3095238095238102	3	0	0	109	1	17	2	32	0	21	2
1091	2017-09-21 23:01:59.028322+08	17	64	164.817785773487003	623	6.91666666666666963	9	3	0	80	1	17	2	116	0	45	17
1092	2017-09-21 23:01:59.029861+08	3	17	224.910820616203011	157	8.72222222222221966	9	6	1	127	1	17	2	157	1	9	6
1093	2017-09-21 23:01:59.035243+08	17	30	214.87032802600001	328	7.58333333333333037	0	0	0	140	1	17	2	0	0	21	14
1094	2017-09-21 23:01:59.036793+08	17	13	228.297306163745986	748	7.67948717948717974	9	4	0	116	1	17	2	136	7	48	28
1095	2017-09-21 23:01:59.038295+08	17	62	166.460875827355011	592	6.65277777777778034	6	2	0	115	1	17	2	91	0	45	12
1096	2017-09-21 23:01:59.03984+08	16	57	177.284844463995	246	6.5	0	0	0	118	1	17	2	0	0	18	5
1097	2017-09-21 23:01:59.041361+08	17	70	142.920434734165013	559	6.24358974358974006	9	2	0	117	1	17	2	95	0	45	10
1098	2017-09-21 23:01:59.042788+08	3	31	214.579941470819989	142	7.88888888888889017	9	6	0	120	1	17	2	142	0	9	6
1099	2017-09-21 23:01:59.044224+08	17	11	231.997439372483001	712	7.86111111111110983	9	4	0	114	1	17	2	125	5	45	24
1100	2017-09-21 23:01:59.045693+08	2	45	193.730588061095006	41	6.83333333333333037	3	1	0	122	1	17	2	41	0	3	1
1101	2017-09-21 23:01:59.051139+08	17	4	254.149198092843989	758	8.4615384615384599	9	8	1	71	1	17	2	176	9	45	32
1102	2017-09-21 23:01:59.052636+08	17	23	218.455990725806004	724	7.90277777777778034	6	1	0	76	1	17	2	77	3	45	25
1103	2017-09-21 23:01:59.054076+08	15	8	247.266452449844991	614	8.53030303030302939	9	6	0	77	1	17	2	154	0	36	24
1104	2017-09-21 23:01:59.055512+08	17	73	133.515485368544006	605	6.27380952380952017	9	1	0	78	1	17	2	100	0	48	9
1105	2017-09-21 23:01:59.057008+08	15	37	203.987771667778986	141	7.83333333333333037	0	0	0	82	1	17	2	0	0	9	4
1106	2017-09-21 23:01:59.058542+08	16	52	187.202829948345993	35	-1	0	0	0	103	1	17	2	0	0	3	0
1107	2017-09-21 23:01:59.060117+08	15	1	260.851084161866027	664	8.59722222222221966	3	3	0	5	1	17	2	54	9	39	30
1108	2017-09-21 23:01:59.06158+08	17	16	226.581074398558002	385	8.19444444444443931	9	6	0	92	1	17	2	146	2	24	14
\.


--
-- Name: stats_playerranking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('stats_playerranking_id_seq', 1108, true);


--
-- Data for Name: stats_teamranking; Type: TABLE DATA; Schema: public; Owner: qijiec
--

COPY stats_teamranking (id, date, serial_id, ranking, elo_points, total_points, handicap, season_clearances, season_matches_played, season_matches_won, season_legs_played, season_legs_won, league_id, season_id, team_id, week_id, season_points, total_clearances, total_legs_played, total_legs_won, total_matches_played, total_matches_won) FROM stdin;
7	2017-06-27 21:26:43.236172+08	1	8	\N	164	\N	0	1	0	7	0	1	1	6	1	164	0	7	0	1	0
6	2017-06-27 21:26:43.234416+08	1	3	\N	246	\N	3	1	1	7	5	1	1	3	1	246	3	7	5	1	1
4	2017-06-27 21:26:43.2309+08	1	2	\N	259	\N	0	1	1	7	6	1	1	2	1	259	0	7	6	1	1
1	2017-06-27 21:26:43.222927+08	1	5	\N	229	\N	0	1	0	7	3	1	1	7	1	229	0	7	3	1	0
13	2017-06-27 22:01:15.280696+08	2	6	\N	505	\N	0	2	1	14	6	1	1	2	2	505	0	14	6	2	1
12	2017-06-27 22:01:15.265445+08	2	8	\N	394	\N	0	2	0	14	2	1	1	8	2	394	0	14	2	2	0
22	2017-06-27 22:11:45.447072+08	3	1	\N	738	\N	5	3	3	21	16	1	1	3	3	738	5	21	16	3	3
14	2017-06-27 22:01:15.294033+08	2	5	\N	450	\N	1	2	1	14	7	1	1	6	2	450	1	14	7	2	1
15	2017-06-27 22:01:15.306248+08	2	7	\N	450	\N	0	2	1	14	4	1	1	1	2	450	0	14	4	2	1
16	2017-06-27 22:01:15.320156+08	2	2	\N	491	\N	1	2	1	14	9	1	1	4	2	491	1	14	9	2	1
9	2017-06-27 22:01:15.229046+08	2	4	\N	472	\N	3	2	1	14	8	1	1	5	2	472	3	14	8	2	1
10	2017-06-27 22:01:15.243038+08	2	2	\N	491	\N	2	2	1	14	9	1	1	7	2	491	2	14	9	2	1
20	2017-06-27 22:11:45.406545+08	3	4	\N	696	\N	4	3	1	21	10	1	1	5	3	696	4	21	10	3	1
29	2017-06-27 22:24:29.48751+08	4	8	\N	850	\N	0	4	1	28	6	1	1	1	4	850	0	28	6	4	1
23	2017-06-27 22:11:45.463102+08	3	3	\N	716	\N	2	3	2	21	14	1	1	7	3	716	2	21	14	3	2
24	2017-06-27 22:11:45.481304+08	3	5	\N	662	\N	2	3	1	21	9	1	1	6	3	662	2	21	9	3	1
17	2017-06-27 22:11:45.336647+08	3	7	\N	664	\N	0	3	1	21	7	1	1	8	3	664	0	21	7	3	1
18	2017-06-27 22:11:45.368417+08	3	8	\N	682	\N	0	3	1	21	6	1	1	1	3	682	0	21	6	3	1
19	2017-06-27 22:11:45.389865+08	3	2	\N	749	\N	2	3	2	21	14	1	1	4	3	749	2	21	14	3	2
28	2017-06-27 22:24:29.468189+08	4	7	\N	874	\N	0	4	1	28	8	1	1	8	4	874	0	28	8	4	1
30	2017-06-27 22:24:29.503664+08	4	4	\N	987	\N	1	4	2	28	15	1	1	2	4	987	1	28	15	4	2
31	2017-06-27 22:24:29.517981+08	4	6	\N	878	\N	3	4	1	28	11	1	1	6	4	878	3	28	11	4	1
32	2017-06-27 22:24:29.532357+08	4	2	\N	998	\N	3	4	3	28	19	1	1	4	4	998	3	28	19	4	3
25	2017-06-27 22:24:29.426885+08	4	1	\N	993	\N	9	4	4	28	22	1	1	3	4	993	9	28	22	4	4
26	2017-06-27 22:24:29.442204+08	4	5	\N	909	\N	3	4	2	28	15	1	1	7	4	909	3	28	15	4	2
27	2017-06-27 22:24:29.452828+08	4	3	\N	952	\N	5	4	2	28	16	1	1	5	4	952	5	28	16	4	2
36	2017-06-27 22:26:18.537535+08	5	5	\N	1162	\N	7	5	3	35	19	1	1	4	5	1162	7	35	19	5	3
39	2017-06-27 22:26:18.579121+08	5	8	\N	1084	\N	0	5	2	35	10	1	1	1	5	1084	0	35	10	5	2
40	2017-06-27 22:26:18.594916+08	5	4	\N	1187	\N	8	5	2	35	19	1	1	5	5	1187	8	35	19	5	2
33	2017-06-27 22:26:18.498009+08	5	6	\N	1097	\N	3	5	1	35	13	1	1	6	5	1097	3	35	13	5	1
34	2017-06-27 22:26:18.513767+08	5	1	\N	1258	\N	10	5	5	35	27	1	1	3	5	1258	10	35	27	5	5
35	2017-06-27 22:26:18.525184+08	5	2	\N	1248	\N	2	5	3	35	22	1	1	2	5	1248	2	35	22	5	3
52	2017-06-27 22:26:25.588499+08	7	3	\N	1635	\N	6	7	4	49	29	1	1	7	7	1635	6	49	29	7	4
53	2017-06-27 22:26:25.602397+08	7	8	\N	1490	\N	2	7	2	49	11	1	1	1	7	1490	2	49	11	7	2
55	2017-06-27 22:26:25.63971+08	7	5	\N	1614	\N	10	7	2	49	22	1	1	5	7	1614	10	49	22	7	2
49	2017-06-27 22:26:25.548176+08	7	4	\N	1605	\N	9	7	4	49	24	1	1	4	7	1605	9	49	24	7	4
50	2017-06-27 22:26:25.559865+08	7	7	\N	1524	\N	3	7	2	49	17	1	1	8	7	1524	3	49	17	7	2
63	2017-06-27 22:26:29.919769+08	8	5	\N	1839	\N	10	8	5	56	28	1	1	4	8	1839	10	56	28	8	5
58	2017-06-27 22:26:29.838953+08	8	3	\N	1887	\N	11	8	3	56	29	1	1	5	8	1887	11	56	29	8	3
59	2017-06-27 22:26:29.853343+08	8	2	\N	2003	\N	4	8	6	56	39	1	1	2	8	2003	4	56	39	8	6
60	2017-06-27 22:26:29.865595+08	8	7	\N	1753	\N	3	8	2	56	17	1	1	8	8	1753	3	56	17	8	2
61	2017-06-27 22:26:29.88609+08	8	1	\N	1959	\N	17	8	7	56	41	1	1	3	8	1959	17	56	41	8	7
62	2017-06-27 22:26:29.899523+08	8	6	\N	1850	\N	6	8	3	56	27	1	1	6	8	1850	6	56	27	8	3
64	2017-06-27 22:26:29.931138+08	8	8	\N	1714	\N	3	8	2	56	14	1	1	1	8	1714	3	56	14	8	2
57	2017-06-27 22:26:29.827304+08	8	4	\N	1829	\N	6	8	4	56	29	1	1	7	8	1829	6	56	29	8	4
77	2017-06-27 22:26:40.121033+08	10	1	\N	2428	\N	19	10	9	70	51	1	1	3	10	2428	19	70	51	10	9
68	2017-06-27 22:26:36.301474+08	9	6	\N	2076	\N	6	9	3	63	30	1	1	6	9	2076	6	63	30	9	3
69	2017-06-27 22:26:36.322713+08	9	2	\N	2282	\N	7	9	7	63	45	1	1	2	9	2282	7	63	45	9	7
70	2017-06-27 22:26:36.336231+08	9	8	\N	1937	\N	3	9	2	63	15	1	1	1	9	1937	3	63	15	9	2
71	2017-06-27 22:26:36.354212+08	9	7	\N	1973	\N	4	9	2	63	18	1	1	8	9	1973	4	63	18	9	2
72	2017-06-27 22:26:36.369716+08	9	3	\N	2149	\N	13	9	4	63	35	1	1	5	9	2149	13	63	35	9	4
66	2017-06-27 22:26:36.276318+08	9	1	\N	2196	\N	18	9	8	63	46	1	1	3	9	2196	18	63	46	9	8
76	2017-06-27 22:26:40.100864+08	10	6	\N	2298	\N	7	10	3	70	33	1	1	6	10	2298	7	70	33	10	3
78	2017-06-27 22:26:40.135827+08	10	2	\N	2501	\N	8	10	7	70	47	1	1	2	10	2501	8	70	47	10	7
80	2017-06-27 22:26:40.164918+08	10	8	\N	2174	\N	3	10	2	70	18	1	1	1	10	2174	3	70	18	10	2
73	2017-06-27 22:26:40.058249+08	10	5	\N	2293	\N	10	10	6	70	34	1	1	4	10	2293	10	70	34	10	6
74	2017-06-27 22:26:40.069816+08	10	4	\N	2283	\N	7	10	5	70	36	1	1	7	10	2283	7	70	36	10	5
5	2017-06-27 21:26:43.232633+08	1	6	\N	191	\N	1	1	0	7	2	1	1	4	1	191	1	7	2	1	0
44	2017-06-27 22:26:21.745337+08	6	3	\N	1397	\N	5	6	4	42	27	1	1	7	6	1397	5	42	27	6	4
45	2017-06-27 22:26:21.757636+08	6	5	\N	1357	\N	8	6	3	42	19	1	1	4	6	1357	8	42	19	6	3
46	2017-06-27 22:26:21.77134+08	6	7	\N	1324	\N	3	6	1	42	15	1	1	6	6	1324	3	42	15	6	1
47	2017-06-27 22:26:21.788978+08	6	6	\N	1337	\N	1	6	2	42	15	1	1	8	6	1337	1	42	15	6	2
2	2017-06-27 21:26:43.226535+08	1	4	\N	242	\N	0	1	1	7	4	1	1	1	1	242	0	7	4	1	1
42	2017-06-27 22:26:21.718105+08	6	4	\N	1410	\N	8	6	2	42	21	1	1	5	6	1410	8	42	21	6	2
75	2017-06-27 22:26:40.083285+08	10	7	\N	2211	\N	4	10	3	70	22	1	1	8	10	2211	4	70	22	10	3
48	2017-06-27 22:26:21.80553+08	6	1	\N	1516	\N	14	6	6	42	33	1	1	3	6	1516	14	42	33	6	6
41	2017-06-27 22:26:21.701916+08	6	8	\N	1286	\N	2	6	2	42	11	1	1	1	6	1286	2	42	11	6	2
51	2017-06-27 22:26:25.575982+08	7	2	\N	1732	\N	3	7	5	49	32	1	1	2	7	1732	3	49	32	7	5
21	2017-06-27 22:11:45.429991+08	3	6	\N	709	\N	0	3	1	21	8	1	1	2	3	709	0	21	8	3	1
79	2017-06-27 22:26:40.149065+08	10	3	\N	2395	\N	15	10	5	70	39	1	1	5	10	2395	15	70	39	10	5
81	2017-06-27 23:09:15.257825+08	11	7	\N	2428	\N	4	11	4	77	27	1	1	8	11	2428	4	77	27	11	4
3	2017-06-27 21:26:43.228678+08	1	7	\N	180	\N	0	1	0	7	1	1	1	8	1	180	0	7	1	1	0
8	2017-06-27 21:26:43.237748+08	1	1	\N	262	\N	0	1	1	7	7	1	1	5	1	262	0	7	7	1	1
11	2017-06-27 22:01:15.25402+08	2	1	\N	502	\N	4	2	2	14	11	1	1	3	2	502	4	14	11	2	2
37	2017-06-27 22:26:18.55088+08	5	7	\N	1089	\N	0	5	1	35	10	1	1	8	5	1089	0	35	10	5	1
38	2017-06-27 22:26:18.56775+08	5	3	\N	1153	\N	3	5	3	35	20	1	1	7	5	1153	3	35	20	5	3
56	2017-06-27 22:26:25.656281+08	7	1	\N	1763	\N	15	7	7	49	39	1	1	3	7	1763	15	49	39	7	7
67	2017-06-27 22:26:36.289122+08	9	4	\N	2070	\N	10	9	6	63	32	1	1	4	9	2070	10	63	32	9	6
65	2017-06-27 22:26:36.263195+08	9	5	\N	2042	\N	7	9	4	63	31	1	1	7	9	2042	7	63	31	9	4
43	2017-06-27 22:26:21.732777+08	6	2	\N	1489	\N	2	6	4	42	27	1	1	2	6	1489	2	42	27	6	4
54	2017-06-27 22:26:25.621049+08	7	6	\N	1587	\N	4	7	2	49	22	1	1	6	7	1587	4	49	22	7	2
82	2017-06-27 23:09:15.284456+08	11	6	\N	2472	\N	11	11	6	77	36	1	1	4	11	2472	11	77	36	11	6
83	2017-06-27 23:09:15.301152+08	11	1	\N	2647	\N	22	11	10	77	56	1	1	3	11	2647	22	77	56	11	10
84	2017-06-27 23:09:15.319797+08	11	3	\N	2611	\N	18	11	5	77	41	1	1	5	11	2611	18	77	41	11	5
85	2017-06-27 23:09:15.340817+08	11	4	\N	2520	\N	7	11	6	77	40	1	1	7	11	2520	7	77	40	11	6
86	2017-06-27 23:09:15.357784+08	11	2	\N	2722	\N	8	11	7	77	50	1	1	2	11	2722	8	77	50	11	7
87	2017-06-27 23:09:15.374454+08	11	5	\N	2533	\N	8	11	4	77	37	1	1	6	11	2533	8	77	37	11	4
88	2017-06-27 23:09:15.392092+08	11	8	\N	2396	\N	3	11	2	77	21	1	1	1	11	2396	3	77	21	11	2
89	2017-06-27 23:10:42.732227+08	12	4	\N	2798	\N	10	12	7	84	47	1	1	7	12	2798	10	84	47	12	7
90	2017-06-27 23:10:42.74541+08	12	7	\N	2618	\N	4	12	4	84	27	1	1	8	12	2618	4	84	27	12	4
91	2017-06-27 23:10:42.762842+08	12	8	\N	2617	\N	3	12	2	84	23	1	1	1	12	2617	3	84	23	12	2
92	2017-06-27 23:10:42.780775+08	12	1	\N	2920	\N	23	12	11	84	61	1	1	3	12	2920	23	84	61	12	11
93	2017-06-27 23:10:42.797018+08	12	3	\N	2862	\N	20	12	6	84	47	1	1	5	12	2862	20	84	47	12	6
94	2017-06-27 23:10:42.814454+08	12	6	\N	2743	\N	9	12	4	84	38	1	1	6	12	2743	9	84	38	12	4
95	2017-06-27 23:10:42.834684+08	12	5	\N	2710	\N	11	12	6	84	39	1	1	4	12	2710	11	84	39	12	6
96	2017-06-27 23:10:42.846619+08	12	2	\N	2973	\N	10	12	8	84	54	1	1	2	12	2973	10	84	54	12	8
97	2017-06-27 23:10:49.217983+08	13	8	\N	2824	\N	4	13	2	91	25	1	1	1	13	2824	4	91	25	13	2
98	2017-06-27 23:10:49.234245+08	13	3	\N	3038	\N	14	13	8	91	52	1	1	7	13	3038	14	91	52	13	8
99	2017-06-27 23:10:49.246974+08	13	4	\N	3105	\N	20	13	7	91	51	1	1	5	13	3105	20	91	51	13	7
100	2017-06-27 23:10:49.261563+08	13	5	\N	2940	\N	13	13	6	91	42	1	1	4	13	2940	13	91	42	13	6
101	2017-06-27 23:10:49.277698+08	13	6	\N	2954	\N	10	13	4	91	39	1	1	6	13	2954	10	91	39	13	4
102	2017-06-27 23:10:49.296431+08	13	2	\N	3233	\N	12	13	9	91	60	1	1	2	13	3233	12	91	60	13	9
103	2017-06-27 23:10:49.310527+08	13	7	\N	2845	\N	4	13	4	91	28	1	1	8	13	2845	4	91	28	13	4
104	2017-06-27 23:10:49.327345+08	13	1	\N	3180	\N	23	13	12	91	67	1	1	3	13	3180	23	91	67	13	12
105	2017-06-27 23:10:53.025575+08	14	2	\N	3447	\N	13	14	9	98	62	1	1	2	14	3447	13	98	62	14	9
106	2017-06-27 23:10:53.037315+08	14	3	\N	3346	\N	22	14	8	98	56	1	1	5	14	3346	22	98	56	14	8
107	2017-06-27 23:10:53.051708+08	14	1	\N	3432	\N	23	14	13	98	72	1	1	3	14	3432	23	98	72	14	13
108	2017-06-27 23:10:53.064226+08	14	5	\N	3155	\N	13	14	6	98	44	1	1	4	14	3155	13	98	44	14	6
109	2017-06-27 23:10:53.077685+08	14	8	\N	3054	\N	5	14	3	98	29	1	1	1	14	3054	5	98	29	14	3
110	2017-06-27 23:10:53.096667+08	14	7	\N	3067	\N	4	14	4	98	31	1	1	8	14	3067	4	98	31	14	4
111	2017-06-27 23:10:53.114448+08	14	6	\N	3196	\N	13	14	5	98	43	1	1	6	14	3196	13	98	43	14	5
112	2017-06-27 23:10:53.133814+08	14	4	\N	3266	\N	15	14	8	98	55	1	1	7	14	3266	15	98	55	14	8
113	2017-09-10 23:22:23.41828+08	15	5	\N	3577	\N	0	1	0	7	2	1	2	5	15	231	22	105	58	15	8
114	2017-09-10 23:22:23.454856+08	15	3	\N	3296	\N	1	1	1	7	6	1	2	1	15	242	6	105	35	15	4
115	2017-09-10 23:22:23.478878+08	15	2	\N	3715	\N	1	1	1	7	6	1	2	2	15	268	14	105	68	15	10
116	2017-09-10 23:22:23.5018+08	15	1	\N	3707	\N	2	1	1	7	7	1	2	3	15	275	25	105	79	15	14
117	2017-09-10 23:22:23.517777+08	15	7	\N	3410	\N	0	1	0	7	1	1	2	6	15	214	13	105	44	15	5
118	2017-09-10 23:22:23.541728+08	15	4	\N	3507	\N	0	1	1	7	5	1	2	7	15	241	15	105	60	15	9
119	2017-09-10 23:22:23.560332+08	15	6	\N	3283	\N	0	1	0	7	1	1	2	8	15	216	4	105	32	15	4
120	2017-09-10 23:22:23.575435+08	1	8	\N	190	\N	0	1	0	7	0	1	2	10	15	190	0	7	0	1	0
121	2017-09-21 22:43:22.850514+08	16	1	\N	3965	\N	2	2	2	14	12	1	2	3	16	533	25	112	84	16	15
122	2017-09-21 22:43:22.876668+08	16	4	\N	3528	\N	1	2	1	14	8	1	2	1	16	474	6	112	37	16	4
123	2017-09-21 22:43:22.908597+08	16	3	\N	3830	\N	1	2	1	14	8	1	2	5	16	484	23	112	64	16	9
124	2017-09-21 22:43:22.930216+08	16	8	\N	3594	\N	1	2	0	14	2	1	2	6	16	398	14	112	45	16	5
125	2017-09-21 22:43:22.958842+08	16	2	\N	3952	\N	2	2	2	14	11	1	2	2	16	505	15	112	73	16	11
126	2017-09-21 22:43:22.977006+08	16	5	\N	3742	\N	1	2	1	14	7	1	2	7	16	476	16	112	62	16	9
127	2017-09-21 22:43:22.994605+08	16	7	\N	3484	\N	0	2	0	14	3	1	2	8	16	417	4	112	34	16	4
128	2017-09-21 22:43:23.011724+08	2	6	\N	431	\N	0	2	1	14	5	1	2	10	16	431	0	14	5	2	1
129	2017-09-21 23:01:58.881039+08	17	8	\N	3850	\N	1	3	0	21	5	1	2	6	17	654	14	119	48	17	5
130	2017-09-21 23:01:58.920588+08	17	7	\N	3766	\N	0	3	1	21	7	1	2	8	17	699	4	119	38	17	5
131	2017-09-21 23:01:58.949748+08	17	3	\N	3979	\N	1	3	1	21	10	1	2	7	17	713	16	119	65	17	9
132	2017-09-21 23:01:58.974594+08	17	1	\N	4185	\N	3	3	3	21	16	1	2	3	17	753	26	119	88	17	16
133	2017-09-21 23:01:58.99323+08	17	2	\N	4197	\N	2	3	3	21	16	1	2	2	17	750	15	119	78	17	12
134	2017-09-21 23:01:59.012523+08	17	5	\N	3746	\N	1	3	1	21	10	1	2	1	17	692	6	119	39	17	4
135	2017-09-21 23:01:59.031479+08	3	6	\N	660	\N	0	3	2	21	10	1	2	10	17	660	0	21	10	3	2
136	2017-09-21 23:01:59.047261+08	17	4	\N	4053	\N	1	3	1	21	10	1	2	5	17	707	23	119	66	17	9
\.


--
-- Name: stats_teamranking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: qijiec
--

SELECT pg_catalog.setval('stats_teamranking_id_seq', 136, true);


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
-- Name: administration_player administration_player_user_id_key; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_player
    ADD CONSTRAINT administration_player_user_id_key UNIQUE (user_id);


--
-- Name: administration_team administration_team_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_team
    ADD CONSTRAINT administration_team_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: administration_teamseasonal administration_teamseasonal_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_teamseasonal
    ADD CONSTRAINT administration_teamseasonal_pkey PRIMARY KEY (id);


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
-- Name: guardian_groupobjectpermission guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


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
-- Name: stats_playerranking stats_playerranking_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_playerranking
    ADD CONSTRAINT stats_playerranking_pkey PRIMARY KEY (id);


--
-- Name: stats_teamranking stats_teamranking_pkey; Type: CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_teamranking
    ADD CONSTRAINT stats_teamranking_pkey PRIMARY KEY (id);


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
-- Name: administration_team_captain_id_173a4b16; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX administration_team_captain_id_173a4b16 ON administration_team USING btree (captain_id);


--
-- Name: administration_teamseasonal_season_id_01888cd7; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX administration_teamseasonal_season_id_01888cd7 ON administration_teamseasonal USING btree (season_id);


--
-- Name: administration_teamseasonal_team_id_9589746a; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX administration_teamseasonal_team_id_9589746a ON administration_teamseasonal USING btree (team_id);


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
-- Name: guardian_groupobjectpermission_content_type_id_7ade36b8; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX guardian_groupobjectpermission_content_type_id_7ade36b8 ON guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_group_id_4bbbfb62; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX guardian_groupobjectpermission_group_id_4bbbfb62 ON guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_permission_id_36572738; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX guardian_groupobjectpermission_permission_id_36572738 ON guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_content_type_id_2e892405; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX guardian_userobjectpermission_content_type_id_2e892405 ON guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_permission_id_71807bfc; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX guardian_userobjectpermission_permission_id_71807bfc ON guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_user_id_d5c1e964; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX guardian_userobjectpermission_user_id_d5c1e964 ON guardian_userobjectpermission USING btree (user_id);


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
-- Name: schedule_season_league_id_d8f0e37d; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX schedule_season_league_id_d8f0e37d ON schedule_season USING btree (league_id);


--
-- Name: stats_playerranking_league_id_61993566; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX stats_playerranking_league_id_61993566 ON stats_playerranking USING btree (league_id);


--
-- Name: stats_playerranking_player_id_642fa4b5; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX stats_playerranking_player_id_642fa4b5 ON stats_playerranking USING btree (player_id);


--
-- Name: stats_playerranking_season_id_7f147cf9; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX stats_playerranking_season_id_7f147cf9 ON stats_playerranking USING btree (season_id);


--
-- Name: stats_playerranking_week_id_d096cfb3; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX stats_playerranking_week_id_d096cfb3 ON stats_playerranking USING btree (week_id);


--
-- Name: stats_teamranking_league_id_428b1874; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX stats_teamranking_league_id_428b1874 ON stats_teamranking USING btree (league_id);


--
-- Name: stats_teamranking_season_id_fbdefe21; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX stats_teamranking_season_id_fbdefe21 ON stats_teamranking USING btree (season_id);


--
-- Name: stats_teamranking_team_id_77341361; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX stats_teamranking_team_id_77341361 ON stats_teamranking USING btree (team_id);


--
-- Name: stats_teamranking_weak_id_83d32277; Type: INDEX; Schema: public; Owner: qijiec
--

CREATE INDEX stats_teamranking_weak_id_83d32277 ON stats_teamranking USING btree (week_id);


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
-- Name: administration_player administration_player_user_id_6aea7233_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_player
    ADD CONSTRAINT administration_player_user_id_6aea7233_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: administration_team administration_t_league_id_7b6cb4c2_fk_administration_league_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_team
    ADD CONSTRAINT administration_t_league_id_7b6cb4c2_fk_administration_league_id FOREIGN KEY (league_id) REFERENCES administration_league(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: administration_team administration_team_captain_id_173a4b16_fk_administr; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_team
    ADD CONSTRAINT administration_team_captain_id_173a4b16_fk_administr FOREIGN KEY (captain_id) REFERENCES administration_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: administration_teamseasonal administration_teams_season_id_01888cd7_fk_schedule_; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_teamseasonal
    ADD CONSTRAINT administration_teams_season_id_01888cd7_fk_schedule_ FOREIGN KEY (season_id) REFERENCES schedule_season(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: administration_teamseasonal administration_teams_team_id_9589746a_fk_administr; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY administration_teamseasonal
    ADD CONSTRAINT administration_teams_team_id_9589746a_fk_administr FOREIGN KEY (team_id) REFERENCES administration_team(group_ptr_id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: guardian_groupobjectpermission guardian_groupobject_content_type_id_7ade36b8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_content_type_id_7ade36b8_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_group_id_4bbbfb62_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_group_id_4bbbfb62_fk_auth_grou FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_permission_id_36572738_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_permission_id_36572738_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_content_type_id_2e892405_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_content_type_id_2e892405_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_permission_id_71807bfc_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_permission_id_71807bfc_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: schedule_season schedule_season_league_id_d8f0e37d_fk_administration_league_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY schedule_season
    ADD CONSTRAINT schedule_season_league_id_d8f0e37d_fk_administration_league_id FOREIGN KEY (league_id) REFERENCES administration_league(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stats_playerranking stats_playerranking_league_id_61993566_fk_administr; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_playerranking
    ADD CONSTRAINT stats_playerranking_league_id_61993566_fk_administr FOREIGN KEY (league_id) REFERENCES administration_league(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stats_playerranking stats_playerranking_player_id_642fa4b5_fk_administr; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_playerranking
    ADD CONSTRAINT stats_playerranking_player_id_642fa4b5_fk_administr FOREIGN KEY (player_id) REFERENCES administration_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stats_playerranking stats_playerranking_season_id_7f147cf9_fk_schedule_season_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_playerranking
    ADD CONSTRAINT stats_playerranking_season_id_7f147cf9_fk_schedule_season_id FOREIGN KEY (season_id) REFERENCES schedule_season(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stats_playerranking stats_playerranking_week_id_d096cfb3_fk_schedule_matchweek_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_playerranking
    ADD CONSTRAINT stats_playerranking_week_id_d096cfb3_fk_schedule_matchweek_id FOREIGN KEY (week_id) REFERENCES schedule_matchweek(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stats_teamranking stats_teamranking_league_id_428b1874_fk_administr; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_teamranking
    ADD CONSTRAINT stats_teamranking_league_id_428b1874_fk_administr FOREIGN KEY (league_id) REFERENCES administration_league(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stats_teamranking stats_teamranking_season_id_fbdefe21_fk_schedule_season_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_teamranking
    ADD CONSTRAINT stats_teamranking_season_id_fbdefe21_fk_schedule_season_id FOREIGN KEY (season_id) REFERENCES schedule_season(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stats_teamranking stats_teamranking_team_id_77341361_fk_administr; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_teamranking
    ADD CONSTRAINT stats_teamranking_team_id_77341361_fk_administr FOREIGN KEY (team_id) REFERENCES administration_team(group_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stats_teamranking stats_teamranking_week_id_285ad6e0_fk_schedule_matchweek_id; Type: FK CONSTRAINT; Schema: public; Owner: qijiec
--

ALTER TABLE ONLY stats_teamranking
    ADD CONSTRAINT stats_teamranking_week_id_285ad6e0_fk_schedule_matchweek_id FOREIGN KEY (week_id) REFERENCES schedule_matchweek(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

