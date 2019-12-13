--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-3.pgdg100+1)
-- Dumped by pg_dump version 12.0 (Debian 12.0-2.pgdg100+1)

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
-- Name: api_engine; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA api_engine;


ALTER SCHEMA api_engine OWNER TO postgres;

--
-- Name: daemon; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA daemon;


ALTER SCHEMA daemon OWNER TO postgres;

--
-- Name: mineria; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA mineria;


ALTER SCHEMA mineria OWNER TO postgres;

--
-- Name: trading; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA trading;


ALTER SCHEMA trading OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: api_movement_params; Type: TABLE; Schema: api_engine; Owner: postgres
--

CREATE TABLE api_engine.api_movement_params (
    id integer NOT NULL,
    cod_param integer NOT NULL,
    cod_api_movement integer NOT NULL,
    estatus boolean DEFAULT true
);


ALTER TABLE api_engine.api_movement_params OWNER TO postgres;

--
-- Name: api_movement_params_id_seq; Type: SEQUENCE; Schema: api_engine; Owner: postgres
--

CREATE SEQUENCE api_engine.api_movement_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_engine.api_movement_params_id_seq OWNER TO postgres;

--
-- Name: api_movement_params_id_seq; Type: SEQUENCE OWNED BY; Schema: api_engine; Owner: postgres
--

ALTER SEQUENCE api_engine.api_movement_params_id_seq OWNED BY api_engine.api_movement_params.id;


--
-- Name: api_movements; Type: TABLE; Schema: api_engine; Owner: postgres
--

CREATE TABLE api_engine.api_movements (
    id integer NOT NULL,
    str_api character varying(200),
    cod_exchange integer,
    estatus boolean DEFAULT true
);


ALTER TABLE api_engine.api_movements OWNER TO postgres;

--
-- Name: api_movements_id_seq; Type: SEQUENCE; Schema: api_engine; Owner: postgres
--

CREATE SEQUENCE api_engine.api_movements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_engine.api_movements_id_seq OWNER TO postgres;

--
-- Name: api_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: api_engine; Owner: postgres
--

ALTER SEQUENCE api_engine.api_movements_id_seq OWNED BY api_engine.api_movements.id;


--
-- Name: api_params; Type: TABLE; Schema: api_engine; Owner: postgres
--

CREATE TABLE api_engine.api_params (
    id integer NOT NULL,
    word character varying(20),
    descripcion character varying(100),
    estatus boolean DEFAULT true
);


ALTER TABLE api_engine.api_params OWNER TO postgres;

--
-- Name: api_params_id_seq; Type: SEQUENCE; Schema: api_engine; Owner: postgres
--

CREATE SEQUENCE api_engine.api_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_engine.api_params_id_seq OWNER TO postgres;

--
-- Name: api_params_id_seq; Type: SEQUENCE OWNED BY; Schema: api_engine; Owner: postgres
--

ALTER SEQUENCE api_engine.api_params_id_seq OWNED BY api_engine.api_params.id;


--
-- Name: item; Type: TABLE; Schema: mineria; Owner: postgres
--

CREATE TABLE mineria.item (
    id integer NOT NULL,
    tipo_item integer NOT NULL,
    nombre_item character varying(128) NOT NULL,
    marca_item character varying(128) NOT NULL,
    modelo_item character varying(128) NOT NULL,
    version_item character varying(128) NOT NULL,
    descripcion_item character varying(128) NOT NULL,
    barcode_item character varying(128) NOT NULL,
    cantidad_item character varying(128) NOT NULL,
    cod_serial_item character(8) NOT NULL
);


ALTER TABLE mineria.item OWNER TO postgres;

--
-- Name: item_id_seq; Type: SEQUENCE; Schema: mineria; Owner: postgres
--

CREATE SEQUENCE mineria.item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mineria.item_id_seq OWNER TO postgres;

--
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: mineria; Owner: postgres
--

ALTER SEQUENCE mineria.item_id_seq OWNED BY mineria.item.id;


--
-- Name: item_worker; Type: TABLE; Schema: mineria; Owner: postgres
--

CREATE TABLE mineria.item_worker (
    id integer NOT NULL,
    id_worker integer NOT NULL,
    id_item integer NOT NULL
);


ALTER TABLE mineria.item_worker OWNER TO postgres;

--
-- Name: item_worker_id_seq; Type: SEQUENCE; Schema: mineria; Owner: postgres
--

CREATE SEQUENCE mineria.item_worker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mineria.item_worker_id_seq OWNER TO postgres;

--
-- Name: item_worker_id_seq; Type: SEQUENCE OWNED BY; Schema: mineria; Owner: postgres
--

ALTER SEQUENCE mineria.item_worker_id_seq OWNED BY mineria.item_worker.id;


--
-- Name: location; Type: TABLE; Schema: mineria; Owner: postgres
--

CREATE TABLE mineria.location (
    id_e integer NOT NULL,
    descripcion character varying(128) NOT NULL,
    nombre character varying(60) NOT NULL,
    cod_location integer NOT NULL
);


ALTER TABLE mineria.location OWNER TO postgres;

--
-- Name: tipo_item; Type: TABLE; Schema: mineria; Owner: postgres
--

CREATE TABLE mineria.tipo_item (
    id integer NOT NULL,
    descripcion character varying(128) NOT NULL
);


ALTER TABLE mineria.tipo_item OWNER TO postgres;

--
-- Name: tipo_item_id_seq; Type: SEQUENCE; Schema: mineria; Owner: postgres
--

CREATE SEQUENCE mineria.tipo_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mineria.tipo_item_id_seq OWNER TO postgres;

--
-- Name: tipo_item_id_seq; Type: SEQUENCE OWNED BY; Schema: mineria; Owner: postgres
--

ALTER SEQUENCE mineria.tipo_item_id_seq OWNED BY mineria.tipo_item.id;


--
-- Name: worker; Type: TABLE; Schema: mineria; Owner: postgres
--

CREATE TABLE mineria.worker (
    id_e integer NOT NULL,
    cod_serial character(8),
    mac_address macaddr NOT NULL,
    hostname character varying(15) NOT NULL,
    workername character varying(30),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE mineria.worker OWNER TO postgres;

--
-- Name: worker_info; Type: TABLE; Schema: mineria; Owner: postgres
--

CREATE TABLE mineria.worker_info (
    id integer NOT NULL,
    id_location integer NOT NULL,
    id_worker integer NOT NULL,
    status boolean NOT NULL,
    fecha_def date NOT NULL
);


ALTER TABLE mineria.worker_info OWNER TO postgres;

--
-- Name: worker_info_campos; Type: TABLE; Schema: mineria; Owner: postgres
--

CREATE TABLE mineria.worker_info_campos (
    id integer NOT NULL,
    tipo_wic integer DEFAULT 2 NOT NULL,
    nombre_wic character varying(60),
    nombre_campo_wic character varying(20) NOT NULL,
    descripcion_wic character varying(128)
);


ALTER TABLE mineria.worker_info_campos OWNER TO postgres;

--
-- Name: worker_info_campos_id_seq; Type: SEQUENCE; Schema: mineria; Owner: postgres
--

CREATE SEQUENCE mineria.worker_info_campos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mineria.worker_info_campos_id_seq OWNER TO postgres;

--
-- Name: worker_info_campos_id_seq; Type: SEQUENCE OWNED BY; Schema: mineria; Owner: postgres
--

ALTER SEQUENCE mineria.worker_info_campos_id_seq OWNED BY mineria.worker_info_campos.id;


--
-- Name: worker_info_data; Type: TABLE; Schema: mineria; Owner: postgres
--

CREATE TABLE mineria.worker_info_data (
    id integer NOT NULL,
    chain_nro smallint NOT NULL,
    id_wic integer NOT NULL,
    id_wi integer NOT NULL,
    fecha_ms character varying(255) NOT NULL,
    valor_wic character varying(128) NOT NULL
);


ALTER TABLE mineria.worker_info_data OWNER TO postgres;

--
-- Name: worker_info_data_id_seq; Type: SEQUENCE; Schema: mineria; Owner: postgres
--

CREATE SEQUENCE mineria.worker_info_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mineria.worker_info_data_id_seq OWNER TO postgres;

--
-- Name: worker_info_data_id_seq; Type: SEQUENCE OWNED BY; Schema: mineria; Owner: postgres
--

ALTER SEQUENCE mineria.worker_info_data_id_seq OWNED BY mineria.worker_info_data.id;


--
-- Name: worker_info_id_seq; Type: SEQUENCE; Schema: mineria; Owner: postgres
--

CREATE SEQUENCE mineria.worker_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mineria.worker_info_id_seq OWNER TO postgres;

--
-- Name: worker_info_id_seq; Type: SEQUENCE OWNED BY; Schema: mineria; Owner: postgres
--

ALTER SEQUENCE mineria.worker_info_id_seq OWNED BY mineria.worker_info.id;


--
-- Name: entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entidad (
    id integer NOT NULL,
    tipo_e integer NOT NULL,
    cod_e character varying(15),
    activo_e boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.entidad OWNER TO postgres;

--
-- Name: entidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entidad_id_seq OWNER TO postgres;

--
-- Name: entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entidad_id_seq OWNED BY public.entidad.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: params_api_movement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.params_api_movement (
    id integer NOT NULL,
    cod_api_mov integer NOT NULL,
    cod_api_param integer NOT NULL
);


ALTER TABLE public.params_api_movement OWNER TO postgres;

--
-- Name: params_api_movement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.params_api_movement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.params_api_movement_id_seq OWNER TO postgres;

--
-- Name: params_api_movement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.params_api_movement_id_seq OWNED BY public.params_api_movement.id;


--
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_id_seq OWNER TO postgres;

--
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfil_id_seq OWNED BY public.perfil.id;


--
-- Name: tipo_entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_entidad (
    id integer NOT NULL,
    descripcion character varying(128) NOT NULL
);


ALTER TABLE public.tipo_entidad OWNER TO postgres;

--
-- Name: tipo_entidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_entidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_entidad_id_seq OWNER TO postgres;

--
-- Name: tipo_entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_entidad_id_seq OWNED BY public.tipo_entidad.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_e integer NOT NULL,
    correo character varying(30) NOT NULL,
    password character varying(64) NOT NULL,
    username character varying(60) NOT NULL,
    apelnomb character varying(128) NOT NULL,
    active boolean DEFAULT false NOT NULL,
    remember_token character varying(100)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_perfil (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    id_perfil integer NOT NULL,
    "default" boolean DEFAULT true NOT NULL
);


ALTER TABLE public.usuario_perfil OWNER TO postgres;

--
-- Name: usuario_perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_perfil_id_seq OWNER TO postgres;

--
-- Name: usuario_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_perfil_id_seq OWNED BY public.usuario_perfil.id;


--
-- Name: balances; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.balances (
    id integer NOT NULL,
    id_coin integer,
    quantity double precision,
    status boolean DEFAULT true,
    id_inversionista integer,
    default_coin boolean DEFAULT false
);


ALTER TABLE trading.balances OWNER TO postgres;

--
-- Name: balances_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.balances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.balances_id_seq OWNER TO postgres;

--
-- Name: balances_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.balances_id_seq OWNED BY trading.balances.id;


--
-- Name: cryptos; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.cryptos (
    id integer NOT NULL,
    base character varying(255) NOT NULL,
    base_name character varying(255) NOT NULL,
    marketcap character varying(255) NOT NULL,
    supply character varying(255) NOT NULL,
    "timestamp" character varying(255) NOT NULL,
    default_coin boolean DEFAULT false,
    estatus boolean DEFAULT false
);


ALTER TABLE trading.cryptos OWNER TO postgres;

--
-- Name: cryptos_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.cryptos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.cryptos_id_seq OWNER TO postgres;

--
-- Name: cryptos_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.cryptos_id_seq OWNED BY trading.cryptos.id;


--
-- Name: exchange_coin; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.exchange_coin (
    id integer NOT NULL,
    id_coin integer NOT NULL,
    id_exchange integer NOT NULL
);


ALTER TABLE trading.exchange_coin OWNER TO postgres;

--
-- Name: exchange_coin_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.exchange_coin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.exchange_coin_id_seq OWNER TO postgres;

--
-- Name: exchange_coin_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.exchange_coin_id_seq OWNED BY trading.exchange_coin.id;


--
-- Name: exchanges; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.exchanges (
    id integer NOT NULL,
    description character varying(110),
    url character varying(110),
    estatus boolean DEFAULT true,
    api_url character varying(40) NOT NULL,
    api_private character varying(50),
    image character varying(200),
    color character varying(220),
    default_exchange boolean DEFAULT false
);


ALTER TABLE trading.exchanges OWNER TO postgres;

--
-- Name: exchanges_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.exchanges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.exchanges_id_seq OWNER TO postgres;

--
-- Name: exchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.exchanges_id_seq OWNED BY trading.exchanges.id;


--
-- Name: exchanges_usuario; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.exchanges_usuario (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    id_exchange integer NOT NULL,
    estatus boolean DEFAULT true,
    api_key character varying(300) NOT NULL,
    api_secret text NOT NULL
);


ALTER TABLE trading.exchanges_usuario OWNER TO postgres;

--
-- Name: exchanges_usuario_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.exchanges_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.exchanges_usuario_id_seq OWNER TO postgres;

--
-- Name: exchanges_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.exchanges_usuario_id_seq OWNED BY trading.exchanges_usuario.id;


--
-- Name: inversionista; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.inversionista (
    id integer NOT NULL,
    fondos double precision DEFAULT 0,
    id_usuario integer NOT NULL,
    estatus boolean DEFAULT true,
    costo_promedio double precision DEFAULT 0
);


ALTER TABLE trading.inversionista OWNER TO postgres;

--
-- Name: COLUMN inversionista.fondos; Type: COMMENT; Schema: trading; Owner: postgres
--

COMMENT ON COLUMN trading.inversionista.fondos IS 'Monto de Inversion Actual en BTC';


--
-- Name: inversionista_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.inversionista_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.inversionista_id_seq OWNER TO postgres;

--
-- Name: inversionista_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.inversionista_id_seq OWNED BY trading.inversionista.id;


--
-- Name: movimientos; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.movimientos (
    id integer NOT NULL,
    coin_quote integer NOT NULL,
    coin_base integer NOT NULL,
    quantity double precision NOT NULL,
    rate double precision NOT NULL,
    tipo_movimiento integer NOT NULL,
    estatus boolean DEFAULT true,
    id_inversionista integer NOT NULL
);


ALTER TABLE trading.movimientos OWNER TO postgres;

--
-- Name: movimientos_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.movimientos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.movimientos_id_seq OWNER TO postgres;

--
-- Name: movimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.movimientos_id_seq OWNED BY trading.movimientos.id;


--
-- Name: tipo_movimiento; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.tipo_movimiento (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE trading.tipo_movimiento OWNER TO postgres;

--
-- Name: tipo_movimiento_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.tipo_movimiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.tipo_movimiento_id_seq OWNER TO postgres;

--
-- Name: tipo_movimiento_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.tipo_movimiento_id_seq OWNED BY trading.tipo_movimiento.id;


--
-- Name: tipo_transaccion; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.tipo_transaccion (
    id integer NOT NULL,
    descripcion character varying(30)
);


ALTER TABLE trading.tipo_transaccion OWNER TO postgres;

--
-- Name: tipo_transaccion_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.tipo_transaccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.tipo_transaccion_id_seq OWNER TO postgres;

--
-- Name: tipo_transaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.tipo_transaccion_id_seq OWNED BY trading.tipo_transaccion.id;


--
-- Name: transacciones; Type: TABLE; Schema: trading; Owner: postgres
--

CREATE TABLE trading.transacciones (
    id integer NOT NULL,
    id_tipo_transaccion integer NOT NULL,
    id_inversionista integer NOT NULL,
    cantidad double precision DEFAULT 0,
    comision double precision DEFAULT 0,
    rate double precision DEFAULT 0,
    fecha timestamp without time zone DEFAULT now(),
    costo_promedio double precision DEFAULT 0,
    estatus boolean DEFAULT false
);


ALTER TABLE trading.transacciones OWNER TO postgres;

--
-- Name: transacciones_id_seq; Type: SEQUENCE; Schema: trading; Owner: postgres
--

CREATE SEQUENCE trading.transacciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading.transacciones_id_seq OWNER TO postgres;

--
-- Name: transacciones_id_seq; Type: SEQUENCE OWNED BY; Schema: trading; Owner: postgres
--

ALTER SEQUENCE trading.transacciones_id_seq OWNED BY trading.transacciones.id;


--
-- Name: api_movement_params id; Type: DEFAULT; Schema: api_engine; Owner: postgres
--

ALTER TABLE ONLY api_engine.api_movement_params ALTER COLUMN id SET DEFAULT nextval('api_engine.api_movement_params_id_seq'::regclass);


--
-- Name: api_movements id; Type: DEFAULT; Schema: api_engine; Owner: postgres
--

ALTER TABLE ONLY api_engine.api_movements ALTER COLUMN id SET DEFAULT nextval('api_engine.api_movements_id_seq'::regclass);


--
-- Name: api_params id; Type: DEFAULT; Schema: api_engine; Owner: postgres
--

ALTER TABLE ONLY api_engine.api_params ALTER COLUMN id SET DEFAULT nextval('api_engine.api_params_id_seq'::regclass);


--
-- Name: item id; Type: DEFAULT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.item ALTER COLUMN id SET DEFAULT nextval('mineria.item_id_seq'::regclass);


--
-- Name: item_worker id; Type: DEFAULT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.item_worker ALTER COLUMN id SET DEFAULT nextval('mineria.item_worker_id_seq'::regclass);


--
-- Name: tipo_item id; Type: DEFAULT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.tipo_item ALTER COLUMN id SET DEFAULT nextval('mineria.tipo_item_id_seq'::regclass);


--
-- Name: worker_info id; Type: DEFAULT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info ALTER COLUMN id SET DEFAULT nextval('mineria.worker_info_id_seq'::regclass);


--
-- Name: worker_info_campos id; Type: DEFAULT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info_campos ALTER COLUMN id SET DEFAULT nextval('mineria.worker_info_campos_id_seq'::regclass);


--
-- Name: worker_info_data id; Type: DEFAULT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info_data ALTER COLUMN id SET DEFAULT nextval('mineria.worker_info_data_id_seq'::regclass);


--
-- Name: entidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entidad ALTER COLUMN id SET DEFAULT nextval('public.entidad_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: params_api_movement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.params_api_movement ALTER COLUMN id SET DEFAULT nextval('public.params_api_movement_id_seq'::regclass);


--
-- Name: perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id SET DEFAULT nextval('public.perfil_id_seq'::regclass);


--
-- Name: tipo_entidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_entidad ALTER COLUMN id SET DEFAULT nextval('public.tipo_entidad_id_seq'::regclass);


--
-- Name: usuario_perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil ALTER COLUMN id SET DEFAULT nextval('public.usuario_perfil_id_seq'::regclass);


--
-- Name: balances id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.balances ALTER COLUMN id SET DEFAULT nextval('trading.balances_id_seq'::regclass);


--
-- Name: cryptos id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.cryptos ALTER COLUMN id SET DEFAULT nextval('trading.cryptos_id_seq'::regclass);


--
-- Name: exchange_coin id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchange_coin ALTER COLUMN id SET DEFAULT nextval('trading.exchange_coin_id_seq'::regclass);


--
-- Name: exchanges id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchanges ALTER COLUMN id SET DEFAULT nextval('trading.exchanges_id_seq'::regclass);


--
-- Name: exchanges_usuario id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchanges_usuario ALTER COLUMN id SET DEFAULT nextval('trading.exchanges_usuario_id_seq'::regclass);


--
-- Name: inversionista id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.inversionista ALTER COLUMN id SET DEFAULT nextval('trading.inversionista_id_seq'::regclass);


--
-- Name: movimientos id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.movimientos ALTER COLUMN id SET DEFAULT nextval('trading.movimientos_id_seq'::regclass);


--
-- Name: tipo_movimiento id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.tipo_movimiento ALTER COLUMN id SET DEFAULT nextval('trading.tipo_movimiento_id_seq'::regclass);


--
-- Name: tipo_transaccion id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.tipo_transaccion ALTER COLUMN id SET DEFAULT nextval('trading.tipo_transaccion_id_seq'::regclass);


--
-- Name: transacciones id; Type: DEFAULT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.transacciones ALTER COLUMN id SET DEFAULT nextval('trading.transacciones_id_seq'::regclass);


--
-- Data for Name: api_movement_params; Type: TABLE DATA; Schema: api_engine; Owner: postgres
--

COPY api_engine.api_movement_params (id, cod_param, cod_api_movement, estatus) FROM stdin;
\.


--
-- Data for Name: api_movements; Type: TABLE DATA; Schema: api_engine; Owner: postgres
--

COPY api_engine.api_movements (id, str_api, cod_exchange, estatus) FROM stdin;
\.


--
-- Data for Name: api_params; Type: TABLE DATA; Schema: api_engine; Owner: postgres
--

COPY api_engine.api_params (id, word, descripcion, estatus) FROM stdin;
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: mineria; Owner: postgres
--

COPY mineria.item (id, tipo_item, nombre_item, marca_item, modelo_item, version_item, descripcion_item, barcode_item, cantidad_item, cod_serial_item) FROM stdin;
\.


--
-- Data for Name: item_worker; Type: TABLE DATA; Schema: mineria; Owner: postgres
--

COPY mineria.item_worker (id, id_worker, id_item) FROM stdin;
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: mineria; Owner: postgres
--

COPY mineria.location (id_e, descripcion, nombre, cod_location) FROM stdin;
1	G1fAPkOyu8fjLp8qwReK	rJzVtKqwq7	120000014
\.


--
-- Data for Name: tipo_item; Type: TABLE DATA; Schema: mineria; Owner: postgres
--

COPY mineria.tipo_item (id, descripcion) FROM stdin;
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: mineria; Owner: postgres
--

COPY mineria.worker (id_e, cod_serial, mac_address, hostname, workername, created_at, updated_at) FROM stdin;
25	\N	c4:f3:12:ca:8e:4c	J4L12	\N	\N	\N
26	\N	c4:f3:12:ca:79:be	J4L18	\N	\N	\N
28	\N	c4:f3:12:ca:9e:c0	J3L34	\N	\N	\N
29	\N	c4:f3:12:ca:89:c6	J3L36	\N	\N	\N
30	\N	c4:f3:12:d7:37:fd	J4L03	\N	\N	\N
31	\N	64:cf:d9:f3:6a:b9	J4L07	\N	\N	\N
32	\N	64:cf:d9:f3:ab:57	J4L19	\N	\N	\N
35	\N	64:cf:d9:f0:70:cb	J4L21	\N	\N	\N
36	\N	64:cf:d9:9a:f7:a0	J4L16	\N	\N	\N
37	\N	c4:f3:12:ca:8e:1c	J3L18	\N	\N	\N
38	\N	c4:f3:12:ca:74:ed	J4L02	\N	\N	\N
40	\N	64:cf:d9:f0:32:e5	J4L17	\N	\N	\N
41	\N	c4:f3:12:ca:79:8e	J4L04	\N	\N	\N
42	\N	c4:f3:12:ca:f9:29	J3L10	\N	\N	\N
43	\N	c4:f3:12:d7:2c:5d	J4L05	\N	\N	\N
44	\N	c4:f3:12:ca:79:97	J4L22	\N	\N	\N
45	\N	c4:f3:12:ca:f9:3b	J4L11	\N	\N	\N
46	\N	64:cf:d9:f3:22:89	J4L14	\N	\N	\N
47	\N	f0:45:da:52:b6:4d	J4L23	\N	\N	\N
48	\N	64:cf:d9:f3:86:2b	J4L06	\N	\N	\N
49	\N	c4:f3:12:ca:79:a9	J4L10	\N	\N	\N
39	asdasd  	64:cf:d9:4a:c9:5c	J3L11	asdasda	\N	\N
27	asadasd 	64:cf:d9:f3:6a:a7	J4L13	asdasd	\N	\N
33	afgad   	64:cf:d9:90:5d:54	J3L21	dgefg	\N	\N
34	SDSd    	64:cf:d9:40:97:68	J4L20	sdasd1	\N	\N
\.


--
-- Data for Name: worker_info; Type: TABLE DATA; Schema: mineria; Owner: postgres
--

COPY mineria.worker_info (id, id_location, id_worker, status, fecha_def) FROM stdin;
1	1	25	t	2018-10-11
2	1	26	t	2018-10-11
3	1	27	t	2018-10-11
4	1	28	t	2018-10-11
5	1	29	t	2018-10-11
6	1	30	t	2018-10-11
7	1	31	t	2018-10-11
8	1	32	t	2018-10-11
9	1	33	t	2018-10-11
10	1	34	t	2018-10-11
11	1	35	t	2018-10-11
12	1	36	t	2018-10-11
13	1	37	t	2018-10-11
14	1	38	t	2018-10-11
15	1	39	t	2018-10-11
16	1	40	t	2018-10-11
17	1	41	t	2018-10-11
18	1	42	t	2018-10-11
19	1	43	t	2018-10-11
20	1	44	t	2018-10-11
21	1	45	t	2018-10-11
22	1	46	t	2018-10-11
23	1	47	t	2018-10-11
24	1	48	t	2018-10-11
25	1	49	t	2018-10-11
\.


--
-- Data for Name: worker_info_campos; Type: TABLE DATA; Schema: mineria; Owner: postgres
--

COPY mineria.worker_info_campos (id, tipo_wic, nombre_wic, nombre_campo_wic, descripcion_wic) FROM stdin;
1	2	DESCONOCIDO	chain_acn	DESCONOCIDO
2	2	DESCONOCIDO	frequency	DESCONOCIDO
3	2	DESCONOCIDO	chain_rate	DESCONOCIDO
4	2	DESCONOCIDO	chain_hw	DESCONOCIDO
5	2	DESCONOCIDO	temp1	DESCONOCIDO
6	2	DESCONOCIDO	temp2	DESCONOCIDO
7	1	DESCONOCIDO	chain_acs	DESCONOCIDO
\.


--
-- Data for Name: worker_info_data; Type: TABLE DATA; Schema: mineria; Owner: postgres
--

COPY mineria.worker_info_data (id, chain_nro, id_wic, id_wi, fecha_ms, valor_wic) FROM stdin;
1	1	1	1	1539222997882	72
2	1	2	1	1539222997882	450
3	1	3	1	1539222997882	149.63
4	1	4	1	1539222997882	843
5	1	5	1	1539222997882	63
6	1	6	1	1539222997882	71
7	1	7	1	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
8	2	1	1	1539222997882	72
9	2	2	1	1539222997882	450
10	2	3	1	1539222997882	157.35
11	2	4	1	1539222997882	3956
12	2	5	1	1539222997882	60
13	2	6	1	1539222997882	67
14	2	7	1	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
15	3	1	1	1539222997882	72
16	3	2	1	1539222997882	450
17	3	3	1	1539222997882	141.24
18	3	4	1	1539222997882	1208
19	3	5	1	1539222997882	60
20	3	6	1	1539222997882	69
21	3	7	1	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
22	4	1	1	1539222997882	72
23	4	2	1	1539222997882	450
24	4	3	1	1539222997882	143.59
25	4	4	1	1539222997882	6469
26	4	5	1	1539222997882	56
27	4	6	1	1539222997882	65
28	4	7	1	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
29	1	1	2	1539222997882	72
30	1	2	2	1539222997882	450
31	1	3	2	1539222997882	146.96
32	1	4	2	1539222997882	245
33	1	5	2	1539222997882	64
34	1	6	2	1539222997882	72
35	1	7	2	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
36	2	1	2	1539222997882	72
37	2	2	2	1539222997882	450
38	2	3	2	1539222997882	137.9
39	2	4	2	1539222997882	534
40	2	5	2	1539222997882	65
41	2	6	2	1539222997882	73
42	2	7	2	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
43	3	1	2	1539222997882	72
44	3	2	2	1539222997882	450
45	3	3	2	1539222997882	152.32
46	3	4	2	1539222997882	262
47	3	5	2	1539222997882	62
48	3	6	2	1539222997882	72
49	3	7	2	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
50	4	1	2	1539222997882	72
51	4	2	2	1539222997882	450
52	4	3	2	1539222997882	142.59
53	4	4	2	1539222997882	0
54	4	5	2	1539222997882	59
55	4	6	2	1539222997882	67
56	4	7	2	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
57	1	1	3	1539222997882	72
58	1	2	3	1539222997882	450
59	1	3	3	1539222997882	140.25
60	1	4	3	1539222997882	0
61	1	5	3	1539222997882	64
62	1	6	3	1539222997882	74
63	1	7	3	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
64	2	1	3	1539222997882	72
65	2	2	3	1539222997882	450
66	2	3	3	1539222997882	145.95
67	2	4	3	1539222997882	0
68	2	5	3	1539222997882	62
69	2	6	3	1539222997882	73
70	2	7	3	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
71	3	1	3	1539222997882	72
72	3	2	3	1539222997882	450
73	3	3	3	1539222997882	138.91
74	3	4	3	1539222997882	0
75	3	5	3	1539222997882	64
76	3	6	3	1539222997882	74
77	3	7	3	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
78	4	1	3	1539222997882	72
79	4	2	3	1539222997882	450
80	4	3	3	1539222997882	140.58
81	4	4	3	1539222997882	72
82	4	5	3	1539222997882	61
83	4	6	3	1539222997882	71
84	4	7	3	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
85	1	1	4	1539222997882	72
86	1	2	4	1539222997882	450
87	1	3	4	1539222997882	158.03
88	1	4	4	1539222997882	0
89	1	5	4	1539222997882	60
90	1	6	4	1539222997882	69
91	1	7	4	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
92	2	1	4	1539222997882	72
93	2	2	4	1539222997882	450
94	2	3	4	1539222997882	144.94
95	2	4	4	1539222997882	0
96	2	5	4	1539222997882	59
97	2	6	4	1539222997882	70
98	2	7	4	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
99	3	1	4	1539222997882	72
100	3	2	4	1539222997882	450
101	3	3	4	1539222997882	158.36
102	3	4	4	1539222997882	1
103	3	5	4	1539222997882	61
104	3	6	4	1539222997882	71
105	3	7	4	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
106	4	1	4	1539222997882	72
107	4	2	4	1539222997882	450
108	4	3	4	1539222997882	147.63
109	4	4	4	1539222997882	0
110	4	5	4	1539222997882	62
111	4	6	4	1539222997882	72
112	4	7	4	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
113	1	1	5	1539222997882	72
114	1	2	5	1539222997882	450
115	1	3	5	1539222997882	137.89
116	1	4	5	1539222997882	6900
117	1	5	5	1539222997882	60
118	1	6	5	1539222997882	68
119	1	7	5	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
120	2	1	5	1539222997882	72
121	2	2	5	1539222997882	450
122	2	3	5	1539222997882	160.37
123	2	4	5	1539222997882	3704
124	2	5	5	1539222997882	61
125	2	6	5	1539222997882	71
126	2	7	5	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
127	3	1	5	1539222997882	72
128	3	2	5	1539222997882	450
129	3	3	5	1539222997882	145.28
130	3	4	5	1539222997882	1495
131	3	5	5	1539222997882	61
132	3	6	5	1539222997882	69
133	3	7	5	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
134	4	1	5	1539222997882	72
135	4	2	5	1539222997882	450
136	4	3	5	1539222997882	151.31
137	4	4	5	1539222997882	11129
138	4	5	5	1539222997882	59
139	4	6	5	1539222997882	69
140	4	7	5	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
141	1	1	6	1539222997882	72
142	1	2	6	1539222997882	450
143	1	3	6	1539222997882	145.95
144	1	4	6	1539222997882	5719
145	1	5	6	1539222997882	62
146	1	6	6	1539222997882	70
147	1	7	6	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
148	2	1	6	1539222997882	72
149	2	2	6	1539222997882	450
150	2	3	6	1539222997882	137.9
151	2	4	6	1539222997882	7525
152	2	5	6	1539222997882	64
153	2	6	6	1539222997882	71
154	2	7	6	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
155	3	1	6	1539222997882	72
156	3	2	6	1539222997882	450
157	3	3	6	1539222997882	149.98
158	3	4	6	1539222997882	11066
159	3	5	6	1539222997882	66
160	3	6	6	1539222997882	75
161	3	7	6	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
162	4	1	6	1539222997882	72
163	4	2	6	1539222997882	450
164	4	3	6	1539222997882	142.6
165	4	4	6	1539222997882	11425
166	4	5	6	1539222997882	65
167	4	6	6	1539222997882	75
168	4	7	6	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
169	1	1	7	1539222997882	72
170	1	2	7	1539222997882	450
171	1	3	7	1539222997882	131.86
172	1	4	7	1539222997882	3200
173	1	5	7	1539222997882	66
174	1	6	7	1539222997882	74
175	1	7	7	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
176	2	1	7	1539222997882	72
177	2	2	7	1539222997882	450
178	2	3	7	1539222997882	131.19
179	2	4	7	1539222997882	6948
180	2	5	7	1539222997882	64
181	2	6	7	1539222997882	74
182	2	7	7	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
183	3	1	7	1539222997882	72
184	3	2	7	1539222997882	450
185	3	3	7	1539222997882	137.56
186	3	4	7	1539222997882	1925
187	3	5	7	1539222997882	62
188	3	6	7	1539222997882	71
189	3	7	7	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
190	4	1	7	1539222997882	72
191	4	2	7	1539222997882	450
192	4	3	7	1539222997882	142.6
193	4	4	7	1539222997882	4483
194	4	5	7	1539222997882	62
195	4	6	7	1539222997882	71
196	4	7	7	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
197	1	1	8	1539222997882	72
198	1	2	8	1539222997882	450
199	1	3	8	1539222997882	160.38
200	1	4	8	1539222997882	0
201	1	5	8	1539222997882	63
202	1	6	8	1539222997882	71
203	1	7	8	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
204	2	1	8	1539222997882	72
205	2	2	8	1539222997882	450
206	2	3	8	1539222997882	146.96
207	2	4	8	1539222997882	1
208	2	5	8	1539222997882	65
209	2	6	8	1539222997882	74
210	2	7	8	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
211	3	1	8	1539222997882	72
212	3	2	8	1539222997882	450
213	3	3	8	1539222997882	155.01
214	3	4	8	1539222997882	0
215	3	5	8	1539222997882	64
216	3	6	8	1539222997882	73
217	3	7	8	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
218	4	1	8	1539222997882	72
219	4	2	8	1539222997882	450
220	4	3	8	1539222997882	146.29
221	4	4	8	1539222997882	3
222	4	5	8	1539222997882	61
223	4	6	8	1539222997882	70
224	4	7	8	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
225	1	1	9	1539222997882	72
226	1	2	9	1539222997882	450
227	1	3	9	1539222997882	153.67
228	1	4	9	1539222997882	138
229	1	5	9	1539222997882	63
230	1	6	9	1539222997882	72
231	1	7	9	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
232	2	1	9	1539222997882	72
233	2	2	9	1539222997882	450
234	2	3	9	1539222997882	140.58
235	2	4	9	1539222997882	2300
236	2	5	9	1539222997882	62
237	2	6	9	1539222997882	72
238	2	7	9	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
239	3	1	9	1539222997882	72
240	3	2	9	1539222997882	450
241	3	3	9	1539222997882	136.22
242	3	4	9	1539222997882	1357
243	3	5	9	1539222997882	63
244	3	6	9	1539222997882	72
245	3	7	9	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
246	4	1	9	1539222997882	72
247	4	2	9	1539222997882	450
248	4	3	9	1539222997882	155.01
249	4	4	9	1539222997882	2315
250	4	5	9	1539222997882	61
251	4	6	9	1539222997882	71
252	4	7	9	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
253	1	1	10	1539222997882	72
254	1	2	10	1539222997882	450
255	1	3	10	1539222997882	147.96
256	1	4	10	1539222997882	1516
257	1	5	10	1539222997882	63
258	1	6	10	1539222997882	70
259	1	7	10	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
260	2	1	10	1539222997882	72
261	2	2	10	1539222997882	450
262	2	3	10	1539222997882	152.33
263	2	4	10	1539222997882	1273
264	2	5	10	1539222997882	63
265	2	6	10	1539222997882	69
266	2	7	10	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
267	3	1	10	1539222997882	72
268	3	2	10	1539222997882	450
269	3	3	10	1539222997882	150.31
270	3	4	10	1539222997882	1615
271	3	5	10	1539222997882	63
272	3	6	10	1539222997882	72
273	3	7	10	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
274	4	1	10	1539222997882	72
275	4	2	10	1539222997882	450
276	4	3	10	1539222997882	146.62
277	4	4	10	1539222997882	790
278	4	5	10	1539222997882	61
279	4	6	10	1539222997882	70
280	4	7	10	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
281	1	1	11	1539222997882	72
282	1	2	11	1539222997882	450
283	1	3	11	1539222997882	152.66
284	1	4	11	1539222997882	0
285	1	5	11	1539222997882	63
286	1	6	11	1539222997882	72
287	1	7	11	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
288	2	1	11	1539222997882	72
289	2	2	11	1539222997882	450
290	2	3	11	1539222997882	141.59
291	2	4	11	1539222997882	0
292	2	5	11	1539222997882	63
293	2	6	11	1539222997882	76
294	2	7	11	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
295	3	1	11	1539222997882	72
296	3	2	11	1539222997882	450
297	3	3	11	1539222997882	144.61
298	3	4	11	1539222997882	0
299	3	5	11	1539222997882	62
300	3	6	11	1539222997882	75
301	3	7	11	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
302	4	1	11	1539222997882	72
303	4	2	11	1539222997882	450
304	4	3	11	1539222997882	143.6
305	4	4	11	1539222997882	199
306	4	5	11	1539222997882	60
307	4	6	11	1539222997882	71
308	4	7	11	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
309	1	1	12	1539222997882	72
310	1	2	12	1539222997882	450
311	1	3	12	1539222997882	162.06
312	1	4	12	1539222997882	2449
313	1	5	12	1539222997882	63
314	1	6	12	1539222997882	72
315	1	7	12	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
316	2	1	12	1539222997882	72
317	2	2	12	1539222997882	450
318	2	3	12	1539222997882	149.98
319	2	4	12	1539222997882	1634
320	2	5	12	1539222997882	62
321	2	6	12	1539222997882	71
322	2	7	12	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
323	3	1	12	1539222997882	72
324	3	2	12	1539222997882	450
325	3	3	12	1539222997882	135.21
326	3	4	12	1539222997882	3675
327	3	5	12	1539222997882	62
328	3	6	12	1539222997882	69
329	3	7	12	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
330	4	1	12	1539222997882	72
331	4	2	12	1539222997882	450
332	4	3	12	1539222997882	157.69
333	4	4	12	1539222997882	340
334	4	5	12	1539222997882	61
335	4	6	12	1539222997882	72
336	4	7	12	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
337	1	1	14	1539222997882	72
338	1	2	14	1539222997882	450
339	1	3	14	1539222997882	151.65
340	1	4	14	1539222997882	158
341	1	5	14	1539222997882	62
342	1	6	14	1539222997882	69
343	1	7	14	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
344	2	1	14	1539222997882	72
345	2	2	14	1539222997882	450
346	2	3	14	1539222997882	145.61
347	2	4	14	1539222997882	277
348	2	5	14	1539222997882	59
349	2	6	14	1539222997882	66
350	2	7	14	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
351	3	1	14	1539222997882	72
352	3	2	14	1539222997882	450
353	3	3	14	1539222997882	143.6
354	3	4	14	1539222997882	1883
355	3	5	14	1539222997882	60
356	3	6	14	1539222997882	68
357	3	7	14	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
358	4	1	14	1539222997882	72
359	4	2	14	1539222997882	450
360	4	3	14	1539222997882	144.61
361	4	4	14	1539222997882	2171
362	4	5	14	1539222997882	57
363	4	6	14	1539222997882	68
364	4	7	14	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
365	1	1	15	1539222997882	72
366	1	2	15	1539222997882	384
367	1	3	15	1539222997882	125.95
368	1	4	15	1539222997882	0
369	1	5	15	1539222997882	48
370	1	6	15	1539222997882	56
371	1	7	15	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
372	2	1	15	1539222997882	72
373	2	2	15	1539222997882	384
374	2	3	15	1539222997882	125.8
375	2	4	15	1539222997882	0
376	2	5	15	1539222997882	47
377	2	6	15	1539222997882	53
378	2	7	15	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
379	3	1	15	1539222997882	72
380	3	2	15	1539222997882	384
381	3	3	15	1539222997882	126.17
382	3	4	15	1539222997882	2
383	3	5	15	1539222997882	45
384	3	6	15	1539222997882	51
385	3	7	15	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
386	4	1	15	1539222997882	72
387	4	2	15	1539222997882	384
388	4	3	15	1539222997882	126.16
389	4	4	15	1539222997882	5
390	4	5	15	1539222997882	44
391	4	6	15	1539222997882	51
392	4	7	15	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
393	1	1	16	1539222997882	72
394	1	2	16	1539222997882	450
395	1	3	16	1539222997882	149.64
396	1	4	16	1539222997882	0
397	1	5	16	1539222997882	63
398	1	6	16	1539222997882	72
399	1	7	16	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
400	2	1	16	1539222997882	72
401	2	2	16	1539222997882	450
402	2	3	16	1539222997882	140.92
403	2	4	16	1539222997882	0
404	2	5	16	1539222997882	61
405	2	6	16	1539222997882	71
406	2	7	16	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
407	3	1	16	1539222997882	72
408	3	2	16	1539222997882	450
409	3	3	16	1539222997882	131.86
410	3	4	16	1539222997882	0
411	3	5	16	1539222997882	61
412	3	6	16	1539222997882	71
413	3	7	16	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
414	4	1	16	1539222997882	72
415	4	2	16	1539222997882	450
416	4	3	16	1539222997882	142.26
417	4	4	16	1539222997882	49
418	4	5	16	1539222997882	57
419	4	6	16	1539222997882	67
420	4	7	16	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
421	1	1	17	1539222997882	72
422	1	2	17	1539222997882	450
423	1	3	17	1539222997882	139.91
424	1	4	17	1539222997882	1917
425	1	5	17	1539222997882	62
426	1	6	17	1539222997882	71
427	1	7	17	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
428	2	1	17	1539222997882	72
429	2	2	17	1539222997882	450
430	2	3	17	1539222997882	153.33
431	2	4	17	1539222997882	2229
432	2	5	17	1539222997882	60
433	2	6	17	1539222997882	68
434	2	7	17	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
435	3	1	17	1539222997882	72
436	3	2	17	1539222997882	450
437	3	3	17	1539222997882	138.57
438	3	4	17	1539222997882	1475
439	3	5	17	1539222997882	62
440	3	6	17	1539222997882	70
441	3	7	17	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
442	4	1	17	1539222997882	72
443	4	2	17	1539222997882	450
444	4	3	17	1539222997882	141.25
445	4	4	17	1539222997882	1688
446	4	5	17	1539222997882	58
447	4	6	17	1539222997882	66
448	4	7	17	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
449	1	1	18	1539222997882	72
450	1	2	18	1539222997882	450
451	1	3	18	1539222997882	135.21
452	1	4	18	1539222997882	0
453	1	5	18	1539222997882	59
454	1	6	18	1539222997882	67
455	1	7	18	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
456	2	1	18	1539222997882	72
457	2	2	18	1539222997882	450
458	2	3	18	1539222997882	140.92
459	2	4	18	1539222997882	0
460	2	5	18	1539222997882	59
461	2	6	18	1539222997882	67
462	2	7	18	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
463	3	1	18	1539222997882	72
464	3	2	18	1539222997882	450
465	3	3	18	1539222997882	147.96
466	3	4	18	1539222997882	1
467	3	5	18	1539222997882	62
468	3	6	18	1539222997882	70
469	3	7	18	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
470	4	1	18	1539222997882	72
471	4	2	18	1539222997882	450
472	4	3	18	1539222997882	138.23
473	4	4	18	1539222997882	33
474	4	5	18	1539222997882	61
475	4	6	18	1539222997882	70
476	4	7	18	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
477	1	1	19	1539222997882	72
478	1	2	19	1539222997882	450
479	1	3	19	1539222997882	151.32
480	1	4	19	1539222997882	0
481	1	5	19	1539222997882	63
482	1	6	19	1539222997882	73
483	1	7	19	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
484	2	1	19	1539222997882	72
485	2	2	19	1539222997882	450
486	2	3	19	1539222997882	136.55
487	2	4	19	1539222997882	0
488	2	5	19	1539222997882	62
489	2	6	19	1539222997882	73
490	2	7	19	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
491	3	1	19	1539222997882	72
492	3	2	19	1539222997882	450
493	3	3	19	1539222997882	137.22
494	3	4	19	1539222997882	0
495	3	5	19	1539222997882	64
496	3	6	19	1539222997882	75
497	3	7	19	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
498	4	1	19	1539222997882	72
499	4	2	19	1539222997882	450
500	4	3	19	1539222997882	149.97
501	4	4	19	1539222997882	0
502	4	5	19	1539222997882	58
503	4	6	19	1539222997882	68
504	4	7	19	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
505	1	1	20	1539222997882	72
506	1	2	20	1539222997882	487
507	1	3	20	1539222997882	161.05
508	1	4	20	1539222997882	15
509	1	5	20	1539222997882	63
510	1	6	20	1539222997882	73
511	1	7	20	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
512	2	1	20	1539222997882	72
513	2	2	20	1539222997882	487
514	2	3	20	1539222997882	166.42
515	2	4	20	1539222997882	1
516	2	5	20	1539222997882	62
517	2	6	20	1539222997882	73
518	2	7	20	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
519	3	1	20	1539222997882	72
520	3	2	20	1539222997882	487
521	3	3	20	1539222997882	159.04
522	3	4	20	1539222997882	4
523	3	5	20	1539222997882	64
524	3	6	20	1539222997882	76
525	3	7	20	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
526	4	1	20	1539222997882	72
527	4	2	20	1539222997882	487
528	4	3	20	1539222997882	149.31
529	4	4	20	1539222997882	757
530	4	5	20	1539222997882	60
531	4	6	20	1539222997882	71
532	4	7	20	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
533	1	1	21	1539222997882	72
534	1	2	21	1539222997882	450
535	1	3	21	1539222997882	163.4
536	1	4	21	1539222997882	0
537	1	5	21	1539222997882	61
538	1	6	21	1539222997882	71
539	1	7	21	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
540	2	1	21	1539222997882	72
541	2	2	21	1539222997882	450
542	2	3	21	1539222997882	143.27
543	2	4	21	1539222997882	0
544	2	5	21	1539222997882	59
545	2	6	21	1539222997882	69
546	2	7	21	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
547	3	1	21	1539222997882	72
548	3	2	21	1539222997882	450
549	3	3	21	1539222997882	153.33
550	3	4	21	1539222997882	0
551	3	5	21	1539222997882	58
552	3	6	21	1539222997882	69
553	3	7	21	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
554	4	1	21	1539222997882	72
555	4	2	21	1539222997882	450
556	4	3	21	1539222997882	150.65
557	4	4	21	1539222997882	22
558	4	5	21	1539222997882	57
559	4	6	21	1539222997882	68
560	4	7	21	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
561	1	1	22	1539222997882	72
562	1	2	22	1539222997882	450
563	1	3	22	1539222997882	144.94
564	1	4	22	1539222997882	0
565	1	5	22	1539222997882	65
566	1	6	22	1539222997882	75
567	1	7	22	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
568	2	1	22	1539222997882	72
569	2	2	22	1539222997882	450
570	2	3	22	1539222997882	151.32
571	2	4	22	1539222997882	0
572	2	5	22	1539222997882	62
573	2	6	22	1539222997882	74
574	2	7	22	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
575	3	1	22	1539222997882	72
576	3	2	22	1539222997882	450
577	3	3	22	1539222997882	147.63
578	3	4	22	1539222997882	0
579	3	5	22	1539222997882	60
580	3	6	22	1539222997882	71
581	3	7	22	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
582	4	1	22	1539222997882	72
583	4	2	22	1539222997882	450
584	4	3	22	1539222997882	143.27
585	4	4	22	1539222997882	0
586	4	5	22	1539222997882	59
587	4	6	22	1539222997882	69
588	4	7	22	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
589	1	1	23	1539222997882	72
590	1	2	23	1539222997882	450
591	1	3	23	1539222997882	147.34
592	1	4	23	1539222997882	0
593	1	5	23	1539222997882	52
594	1	6	23	1539222997882	61
595	1	7	23	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
596	2	1	23	1539222997882	72
597	2	2	23	1539222997882	450
598	2	3	23	1539222997882	148.25
599	2	4	23	1539222997882	0
600	2	5	23	1539222997882	49
601	2	6	23	1539222997882	57
602	2	7	23	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
603	3	1	23	1539222997882	72
604	3	2	23	1539222997882	450
605	3	3	23	1539222997882	147.81
606	3	4	23	1539222997882	0
607	3	5	23	1539222997882	49
608	3	6	23	1539222997882	58
609	3	7	23	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
610	4	1	23	1539222997882	72
611	4	2	23	1539222997882	450
612	4	3	23	1539222997882	147.56
613	4	4	23	1539222997882	1
614	4	5	23	1539222997882	49
615	4	6	23	1539222997882	59
616	4	7	23	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
617	1	1	24	1539222997882	72
618	1	2	24	1539222997882	450
619	1	3	24	1539222997882	157.01
620	1	4	24	1539222997882	2
621	1	5	24	1539222997882	64
622	1	6	24	1539222997882	73
623	1	7	24	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
624	2	1	24	1539222997882	72
625	2	2	24	1539222997882	450
626	2	3	24	1539222997882	143.59
627	2	4	24	1539222997882	18
628	2	5	24	1539222997882	64
629	2	6	24	1539222997882	74
630	2	7	24	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
631	3	1	24	1539222997882	72
632	3	2	24	1539222997882	450
633	3	3	24	1539222997882	134.54
634	3	4	24	1539222997882	12
635	3	5	24	1539222997882	62
636	3	6	24	1539222997882	72
637	3	7	24	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
638	4	1	24	1539222997882	72
639	4	2	24	1539222997882	450
640	4	3	24	1539222997882	141.92
641	4	4	24	1539222997882	1627
642	4	5	24	1539222997882	58
643	4	6	24	1539222997882	67
644	4	7	24	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
645	1	1	25	1539222997882	72
646	1	2	25	1539222997882	450
647	1	3	25	1539222997882	148.3
648	1	4	25	1539222997882	0
649	1	5	25	1539222997882	65
650	1	6	25	1539222997882	76
651	1	7	25	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
652	2	1	25	1539222997882	72
653	2	2	25	1539222997882	450
654	2	3	25	1539222997882	137.9
655	2	4	25	1539222997882	0
656	2	5	25	1539222997882	60
657	2	6	25	1539222997882	69
658	2	7	25	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
659	3	1	25	1539222997882	72
660	3	2	25	1539222997882	450
661	3	3	25	1539222997882	140.25
662	3	4	25	1539222997882	0
663	3	5	25	1539222997882	62
664	3	6	25	1539222997882	71
665	3	7	25	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
666	4	1	25	1539222997882	72
667	4	2	25	1539222997882	450
668	4	3	25	1539222997882	146.62
669	4	4	25	1539222997882	88
670	4	5	25	1539222997882	60
671	4	6	25	1539222997882	69
672	4	7	25	1539222997882	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
673	1	1	1	1539223002904	72
674	1	2	1	1539223002904	450
675	1	3	1	1539223002904	149.63
676	1	4	1	1539223002904	843
677	1	5	1	1539223002904	63
678	1	6	1	1539223002904	71
679	1	7	1	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
680	2	1	1	1539223002904	72
681	2	2	1	1539223002904	450
682	2	3	1	1539223002904	157.35
683	2	4	1	1539223002904	3956
684	2	5	1	1539223002904	60
685	2	6	1	1539223002904	67
686	2	7	1	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
687	3	1	1	1539223002904	72
688	3	2	1	1539223002904	450
689	3	3	1	1539223002904	141.24
690	3	4	1	1539223002904	1208
691	3	5	1	1539223002904	60
692	3	6	1	1539223002904	69
693	3	7	1	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
694	4	1	1	1539223002904	72
695	4	2	1	1539223002904	450
696	4	3	1	1539223002904	143.59
697	4	4	1	1539223002904	6469
698	4	5	1	1539223002904	56
699	4	6	1	1539223002904	65
700	4	7	1	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
701	1	1	2	1539223002904	72
702	1	2	2	1539223002904	450
703	1	3	2	1539223002904	146.96
704	1	4	2	1539223002904	245
705	1	5	2	1539223002904	64
706	1	6	2	1539223002904	72
707	1	7	2	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
708	2	1	2	1539223002904	72
709	2	2	2	1539223002904	450
710	2	3	2	1539223002904	137.9
711	2	4	2	1539223002904	534
712	2	5	2	1539223002904	65
713	2	6	2	1539223002904	73
714	2	7	2	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
715	3	1	2	1539223002904	72
716	3	2	2	1539223002904	450
717	3	3	2	1539223002904	152.32
718	3	4	2	1539223002904	262
719	3	5	2	1539223002904	62
720	3	6	2	1539223002904	72
721	3	7	2	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
722	4	1	2	1539223002904	72
723	4	2	2	1539223002904	450
724	4	3	2	1539223002904	142.59
725	4	4	2	1539223002904	0
726	4	5	2	1539223002904	59
727	4	6	2	1539223002904	67
728	4	7	2	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
729	1	1	3	1539223002904	72
730	1	2	3	1539223002904	450
731	1	3	3	1539223002904	140.25
732	1	4	3	1539223002904	0
733	1	5	3	1539223002904	64
734	1	6	3	1539223002904	74
735	1	7	3	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
736	2	1	3	1539223002904	72
737	2	2	3	1539223002904	450
738	2	3	3	1539223002904	145.95
739	2	4	3	1539223002904	0
740	2	5	3	1539223002904	62
741	2	6	3	1539223002904	73
742	2	7	3	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
743	3	1	3	1539223002904	72
744	3	2	3	1539223002904	450
745	3	3	3	1539223002904	138.91
746	3	4	3	1539223002904	0
747	3	5	3	1539223002904	64
748	3	6	3	1539223002904	74
749	3	7	3	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
750	4	1	3	1539223002904	72
751	4	2	3	1539223002904	450
752	4	3	3	1539223002904	140.58
753	4	4	3	1539223002904	72
754	4	5	3	1539223002904	61
755	4	6	3	1539223002904	71
756	4	7	3	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
757	1	1	4	1539223002904	72
758	1	2	4	1539223002904	450
759	1	3	4	1539223002904	158.03
760	1	4	4	1539223002904	0
761	1	5	4	1539223002904	60
762	1	6	4	1539223002904	69
763	1	7	4	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
764	2	1	4	1539223002904	72
765	2	2	4	1539223002904	450
766	2	3	4	1539223002904	144.94
767	2	4	4	1539223002904	0
768	2	5	4	1539223002904	59
769	2	6	4	1539223002904	70
770	2	7	4	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
771	3	1	4	1539223002904	72
772	3	2	4	1539223002904	450
773	3	3	4	1539223002904	158.36
774	3	4	4	1539223002904	1
775	3	5	4	1539223002904	61
776	3	6	4	1539223002904	71
777	3	7	4	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
778	4	1	4	1539223002904	72
779	4	2	4	1539223002904	450
780	4	3	4	1539223002904	147.63
781	4	4	4	1539223002904	0
782	4	5	4	1539223002904	62
783	4	6	4	1539223002904	72
784	4	7	4	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
785	1	1	5	1539223002904	72
786	1	2	5	1539223002904	450
787	1	3	5	1539223002904	137.89
788	1	4	5	1539223002904	6900
789	1	5	5	1539223002904	60
790	1	6	5	1539223002904	68
791	1	7	5	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
792	2	1	5	1539223002904	72
793	2	2	5	1539223002904	450
794	2	3	5	1539223002904	160.37
795	2	4	5	1539223002904	3704
796	2	5	5	1539223002904	61
797	2	6	5	1539223002904	71
798	2	7	5	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
799	3	1	5	1539223002904	72
800	3	2	5	1539223002904	450
801	3	3	5	1539223002904	145.28
802	3	4	5	1539223002904	1495
803	3	5	5	1539223002904	61
804	3	6	5	1539223002904	69
805	3	7	5	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
806	4	1	5	1539223002904	72
807	4	2	5	1539223002904	450
808	4	3	5	1539223002904	151.31
809	4	4	5	1539223002904	11129
810	4	5	5	1539223002904	59
811	4	6	5	1539223002904	69
812	4	7	5	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
813	1	1	6	1539223002904	72
814	1	2	6	1539223002904	450
815	1	3	6	1539223002904	145.95
816	1	4	6	1539223002904	5719
817	1	5	6	1539223002904	62
818	1	6	6	1539223002904	70
819	1	7	6	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
820	2	1	6	1539223002904	72
821	2	2	6	1539223002904	450
822	2	3	6	1539223002904	137.9
823	2	4	6	1539223002904	7525
824	2	5	6	1539223002904	64
825	2	6	6	1539223002904	71
826	2	7	6	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
827	3	1	6	1539223002904	72
828	3	2	6	1539223002904	450
829	3	3	6	1539223002904	149.98
830	3	4	6	1539223002904	11066
831	3	5	6	1539223002904	66
832	3	6	6	1539223002904	75
833	3	7	6	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
834	4	1	6	1539223002904	72
835	4	2	6	1539223002904	450
836	4	3	6	1539223002904	142.6
837	4	4	6	1539223002904	11425
838	4	5	6	1539223002904	65
839	4	6	6	1539223002904	75
840	4	7	6	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
841	1	1	7	1539223002904	72
842	1	2	7	1539223002904	450
843	1	3	7	1539223002904	131.86
844	1	4	7	1539223002904	3200
845	1	5	7	1539223002904	66
846	1	6	7	1539223002904	74
847	1	7	7	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
848	2	1	7	1539223002904	72
849	2	2	7	1539223002904	450
850	2	3	7	1539223002904	131.19
851	2	4	7	1539223002904	6948
852	2	5	7	1539223002904	64
853	2	6	7	1539223002904	74
854	2	7	7	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
855	3	1	7	1539223002904	72
856	3	2	7	1539223002904	450
857	3	3	7	1539223002904	137.56
858	3	4	7	1539223002904	1925
859	3	5	7	1539223002904	62
860	3	6	7	1539223002904	71
861	3	7	7	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
862	4	1	7	1539223002904	72
863	4	2	7	1539223002904	450
864	4	3	7	1539223002904	142.6
865	4	4	7	1539223002904	4483
866	4	5	7	1539223002904	62
867	4	6	7	1539223002904	71
868	4	7	7	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
869	1	1	8	1539223002904	72
870	1	2	8	1539223002904	450
871	1	3	8	1539223002904	160.38
872	1	4	8	1539223002904	0
873	1	5	8	1539223002904	63
874	1	6	8	1539223002904	71
875	1	7	8	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
876	2	1	8	1539223002904	72
877	2	2	8	1539223002904	450
878	2	3	8	1539223002904	146.96
879	2	4	8	1539223002904	1
880	2	5	8	1539223002904	65
881	2	6	8	1539223002904	74
882	2	7	8	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
883	3	1	8	1539223002904	72
884	3	2	8	1539223002904	450
885	3	3	8	1539223002904	155.01
886	3	4	8	1539223002904	0
887	3	5	8	1539223002904	64
888	3	6	8	1539223002904	73
889	3	7	8	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
890	4	1	8	1539223002904	72
891	4	2	8	1539223002904	450
892	4	3	8	1539223002904	146.29
893	4	4	8	1539223002904	3
894	4	5	8	1539223002904	61
895	4	6	8	1539223002904	70
896	4	7	8	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
897	1	1	9	1539223002904	72
898	1	2	9	1539223002904	450
899	1	3	9	1539223002904	153.67
900	1	4	9	1539223002904	138
901	1	5	9	1539223002904	63
902	1	6	9	1539223002904	72
903	1	7	9	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
904	2	1	9	1539223002904	72
905	2	2	9	1539223002904	450
906	2	3	9	1539223002904	140.58
907	2	4	9	1539223002904	2300
908	2	5	9	1539223002904	62
909	2	6	9	1539223002904	72
910	2	7	9	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
911	3	1	9	1539223002904	72
912	3	2	9	1539223002904	450
913	3	3	9	1539223002904	136.22
914	3	4	9	1539223002904	1357
915	3	5	9	1539223002904	63
916	3	6	9	1539223002904	72
917	3	7	9	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
918	4	1	9	1539223002904	72
919	4	2	9	1539223002904	450
920	4	3	9	1539223002904	155.01
921	4	4	9	1539223002904	2315
922	4	5	9	1539223002904	61
923	4	6	9	1539223002904	71
924	4	7	9	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
925	1	1	10	1539223002904	72
926	1	2	10	1539223002904	450
927	1	3	10	1539223002904	147.96
928	1	4	10	1539223002904	1516
929	1	5	10	1539223002904	63
930	1	6	10	1539223002904	70
931	1	7	10	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
932	2	1	10	1539223002904	72
933	2	2	10	1539223002904	450
934	2	3	10	1539223002904	152.33
935	2	4	10	1539223002904	1273
936	2	5	10	1539223002904	63
937	2	6	10	1539223002904	69
938	2	7	10	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
939	3	1	10	1539223002904	72
940	3	2	10	1539223002904	450
941	3	3	10	1539223002904	150.31
942	3	4	10	1539223002904	1615
943	3	5	10	1539223002904	63
944	3	6	10	1539223002904	72
945	3	7	10	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
946	4	1	10	1539223002904	72
947	4	2	10	1539223002904	450
948	4	3	10	1539223002904	146.62
949	4	4	10	1539223002904	790
950	4	5	10	1539223002904	61
951	4	6	10	1539223002904	70
952	4	7	10	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
953	1	1	11	1539223002904	72
954	1	2	11	1539223002904	450
955	1	3	11	1539223002904	152.66
956	1	4	11	1539223002904	0
957	1	5	11	1539223002904	63
958	1	6	11	1539223002904	72
959	1	7	11	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
960	2	1	11	1539223002904	72
961	2	2	11	1539223002904	450
962	2	3	11	1539223002904	141.59
963	2	4	11	1539223002904	0
964	2	5	11	1539223002904	63
965	2	6	11	1539223002904	76
966	2	7	11	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
967	3	1	11	1539223002904	72
968	3	2	11	1539223002904	450
969	3	3	11	1539223002904	144.61
970	3	4	11	1539223002904	0
971	3	5	11	1539223002904	62
972	3	6	11	1539223002904	75
973	3	7	11	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
974	4	1	11	1539223002904	72
975	4	2	11	1539223002904	450
976	4	3	11	1539223002904	143.6
977	4	4	11	1539223002904	199
978	4	5	11	1539223002904	60
979	4	6	11	1539223002904	71
980	4	7	11	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
981	1	1	12	1539223002904	72
982	1	2	12	1539223002904	450
983	1	3	12	1539223002904	162.06
984	1	4	12	1539223002904	2449
985	1	5	12	1539223002904	63
986	1	6	12	1539223002904	72
987	1	7	12	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
988	2	1	12	1539223002904	72
989	2	2	12	1539223002904	450
990	2	3	12	1539223002904	149.98
991	2	4	12	1539223002904	1634
992	2	5	12	1539223002904	62
993	2	6	12	1539223002904	71
994	2	7	12	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
995	3	1	12	1539223002904	72
996	3	2	12	1539223002904	450
997	3	3	12	1539223002904	135.21
998	3	4	12	1539223002904	3675
999	3	5	12	1539223002904	62
1000	3	6	12	1539223002904	69
1001	3	7	12	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1002	4	1	12	1539223002904	72
1003	4	2	12	1539223002904	450
1004	4	3	12	1539223002904	157.69
1005	4	4	12	1539223002904	340
1006	4	5	12	1539223002904	61
1007	4	6	12	1539223002904	72
1008	4	7	12	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1009	1	1	14	1539223002904	72
1010	1	2	14	1539223002904	450
1011	1	3	14	1539223002904	151.65
1012	1	4	14	1539223002904	158
1013	1	5	14	1539223002904	62
1014	1	6	14	1539223002904	69
1015	1	7	14	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1016	2	1	14	1539223002904	72
1017	2	2	14	1539223002904	450
1018	2	3	14	1539223002904	145.61
1019	2	4	14	1539223002904	277
1020	2	5	14	1539223002904	59
1021	2	6	14	1539223002904	66
1022	2	7	14	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1023	3	1	14	1539223002904	72
1024	3	2	14	1539223002904	450
1025	3	3	14	1539223002904	143.6
1026	3	4	14	1539223002904	1883
1027	3	5	14	1539223002904	60
1028	3	6	14	1539223002904	68
1029	3	7	14	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1030	4	1	14	1539223002904	72
1031	4	2	14	1539223002904	450
1032	4	3	14	1539223002904	144.61
1033	4	4	14	1539223002904	2171
1034	4	5	14	1539223002904	57
1035	4	6	14	1539223002904	68
1036	4	7	14	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1037	1	1	15	1539223002904	72
1038	1	2	15	1539223002904	384
1039	1	3	15	1539223002904	125.95
1040	1	4	15	1539223002904	0
1041	1	5	15	1539223002904	48
1042	1	6	15	1539223002904	56
1043	1	7	15	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1044	2	1	15	1539223002904	72
1045	2	2	15	1539223002904	384
1046	2	3	15	1539223002904	125.8
1047	2	4	15	1539223002904	0
1048	2	5	15	1539223002904	47
1049	2	6	15	1539223002904	53
1050	2	7	15	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1051	3	1	15	1539223002904	72
1052	3	2	15	1539223002904	384
1053	3	3	15	1539223002904	126.17
1054	3	4	15	1539223002904	2
1055	3	5	15	1539223002904	45
1056	3	6	15	1539223002904	51
1057	3	7	15	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1058	4	1	15	1539223002904	72
1059	4	2	15	1539223002904	384
1060	4	3	15	1539223002904	126.16
1061	4	4	15	1539223002904	5
1062	4	5	15	1539223002904	44
1063	4	6	15	1539223002904	51
1064	4	7	15	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1065	1	1	16	1539223002904	72
1066	1	2	16	1539223002904	450
1067	1	3	16	1539223002904	149.64
1068	1	4	16	1539223002904	0
1069	1	5	16	1539223002904	63
1070	1	6	16	1539223002904	72
1071	1	7	16	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1072	2	1	16	1539223002904	72
1073	2	2	16	1539223002904	450
1074	2	3	16	1539223002904	140.92
1075	2	4	16	1539223002904	0
1076	2	5	16	1539223002904	61
1077	2	6	16	1539223002904	71
1078	2	7	16	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1079	3	1	16	1539223002904	72
1080	3	2	16	1539223002904	450
1081	3	3	16	1539223002904	131.86
1082	3	4	16	1539223002904	0
1083	3	5	16	1539223002904	61
1084	3	6	16	1539223002904	71
1085	3	7	16	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1086	4	1	16	1539223002904	72
1087	4	2	16	1539223002904	450
1088	4	3	16	1539223002904	142.26
1089	4	4	16	1539223002904	49
1090	4	5	16	1539223002904	57
1091	4	6	16	1539223002904	67
1092	4	7	16	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1093	1	1	17	1539223002904	72
1094	1	2	17	1539223002904	450
1095	1	3	17	1539223002904	139.91
1096	1	4	17	1539223002904	1917
1097	1	5	17	1539223002904	62
1098	1	6	17	1539223002904	71
1099	1	7	17	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1100	2	1	17	1539223002904	72
1101	2	2	17	1539223002904	450
1102	2	3	17	1539223002904	153.33
1103	2	4	17	1539223002904	2229
1104	2	5	17	1539223002904	60
1105	2	6	17	1539223002904	68
1106	2	7	17	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1107	3	1	17	1539223002904	72
1108	3	2	17	1539223002904	450
1109	3	3	17	1539223002904	138.57
1110	3	4	17	1539223002904	1475
1111	3	5	17	1539223002904	62
1112	3	6	17	1539223002904	70
1113	3	7	17	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1114	4	1	17	1539223002904	72
1115	4	2	17	1539223002904	450
1116	4	3	17	1539223002904	141.25
1117	4	4	17	1539223002904	1688
1118	4	5	17	1539223002904	58
1119	4	6	17	1539223002904	66
1120	4	7	17	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1121	1	1	18	1539223002904	72
1122	1	2	18	1539223002904	450
1123	1	3	18	1539223002904	135.21
1124	1	4	18	1539223002904	0
1125	1	5	18	1539223002904	59
1126	1	6	18	1539223002904	67
1127	1	7	18	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1128	2	1	18	1539223002904	72
1129	2	2	18	1539223002904	450
1130	2	3	18	1539223002904	140.92
1131	2	4	18	1539223002904	0
1132	2	5	18	1539223002904	59
1133	2	6	18	1539223002904	67
1134	2	7	18	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1135	3	1	18	1539223002904	72
1136	3	2	18	1539223002904	450
1137	3	3	18	1539223002904	147.96
1138	3	4	18	1539223002904	1
1139	3	5	18	1539223002904	62
1140	3	6	18	1539223002904	70
1141	3	7	18	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1142	4	1	18	1539223002904	72
1143	4	2	18	1539223002904	450
1144	4	3	18	1539223002904	138.23
1145	4	4	18	1539223002904	33
1146	4	5	18	1539223002904	61
1147	4	6	18	1539223002904	70
1148	4	7	18	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1149	1	1	19	1539223002904	72
1150	1	2	19	1539223002904	450
1151	1	3	19	1539223002904	151.32
1152	1	4	19	1539223002904	0
1153	1	5	19	1539223002904	63
1154	1	6	19	1539223002904	73
1155	1	7	19	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1156	2	1	19	1539223002904	72
1157	2	2	19	1539223002904	450
1158	2	3	19	1539223002904	136.55
1159	2	4	19	1539223002904	0
1160	2	5	19	1539223002904	62
1161	2	6	19	1539223002904	73
1162	2	7	19	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1163	3	1	19	1539223002904	72
1164	3	2	19	1539223002904	450
1165	3	3	19	1539223002904	137.22
1166	3	4	19	1539223002904	0
1167	3	5	19	1539223002904	64
1168	3	6	19	1539223002904	75
1169	3	7	19	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1170	4	1	19	1539223002904	72
1171	4	2	19	1539223002904	450
1172	4	3	19	1539223002904	149.97
1173	4	4	19	1539223002904	0
1174	4	5	19	1539223002904	58
1175	4	6	19	1539223002904	68
1176	4	7	19	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1177	1	1	20	1539223002904	72
1178	1	2	20	1539223002904	487
1179	1	3	20	1539223002904	161.05
1180	1	4	20	1539223002904	15
1181	1	5	20	1539223002904	63
1182	1	6	20	1539223002904	73
1183	1	7	20	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1184	2	1	20	1539223002904	72
1185	2	2	20	1539223002904	487
1186	2	3	20	1539223002904	166.42
1187	2	4	20	1539223002904	1
1188	2	5	20	1539223002904	62
1189	2	6	20	1539223002904	73
1190	2	7	20	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1191	3	1	20	1539223002904	72
1192	3	2	20	1539223002904	487
1193	3	3	20	1539223002904	159.04
1194	3	4	20	1539223002904	4
1195	3	5	20	1539223002904	64
1196	3	6	20	1539223002904	76
1197	3	7	20	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1198	4	1	20	1539223002904	72
1199	4	2	20	1539223002904	487
1200	4	3	20	1539223002904	149.31
1201	4	4	20	1539223002904	757
1202	4	5	20	1539223002904	60
1203	4	6	20	1539223002904	71
1204	4	7	20	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1205	1	1	21	1539223002904	72
1206	1	2	21	1539223002904	450
1207	1	3	21	1539223002904	163.4
1208	1	4	21	1539223002904	0
1209	1	5	21	1539223002904	61
1210	1	6	21	1539223002904	71
1211	1	7	21	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1212	2	1	21	1539223002904	72
1213	2	2	21	1539223002904	450
1214	2	3	21	1539223002904	143.27
1215	2	4	21	1539223002904	0
1216	2	5	21	1539223002904	59
1217	2	6	21	1539223002904	69
1218	2	7	21	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1219	3	1	21	1539223002904	72
1220	3	2	21	1539223002904	450
1221	3	3	21	1539223002904	153.33
1222	3	4	21	1539223002904	0
1223	3	5	21	1539223002904	58
1224	3	6	21	1539223002904	69
1225	3	7	21	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1226	4	1	21	1539223002904	72
1227	4	2	21	1539223002904	450
1228	4	3	21	1539223002904	150.65
1229	4	4	21	1539223002904	22
1230	4	5	21	1539223002904	57
1231	4	6	21	1539223002904	68
1232	4	7	21	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1233	1	1	22	1539223002904	72
1234	1	2	22	1539223002904	450
1235	1	3	22	1539223002904	144.94
1236	1	4	22	1539223002904	0
1237	1	5	22	1539223002904	65
1238	1	6	22	1539223002904	75
1239	1	7	22	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1240	2	1	22	1539223002904	72
1241	2	2	22	1539223002904	450
1242	2	3	22	1539223002904	151.32
1243	2	4	22	1539223002904	0
1244	2	5	22	1539223002904	62
1245	2	6	22	1539223002904	74
1246	2	7	22	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1247	3	1	22	1539223002904	72
1248	3	2	22	1539223002904	450
1249	3	3	22	1539223002904	147.63
1250	3	4	22	1539223002904	0
1251	3	5	22	1539223002904	60
1252	3	6	22	1539223002904	71
1253	3	7	22	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1254	4	1	22	1539223002904	72
1255	4	2	22	1539223002904	450
1256	4	3	22	1539223002904	143.27
1257	4	4	22	1539223002904	0
1258	4	5	22	1539223002904	59
1259	4	6	22	1539223002904	69
1260	4	7	22	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1261	1	1	23	1539223002904	72
1262	1	2	23	1539223002904	450
1263	1	3	23	1539223002904	147.34
1264	1	4	23	1539223002904	0
1265	1	5	23	1539223002904	52
1266	1	6	23	1539223002904	61
1267	1	7	23	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1268	2	1	23	1539223002904	72
1269	2	2	23	1539223002904	450
1270	2	3	23	1539223002904	148.25
1271	2	4	23	1539223002904	0
1272	2	5	23	1539223002904	49
1273	2	6	23	1539223002904	57
1274	2	7	23	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1275	3	1	23	1539223002904	72
1276	3	2	23	1539223002904	450
1277	3	3	23	1539223002904	147.81
1278	3	4	23	1539223002904	0
1279	3	5	23	1539223002904	49
1280	3	6	23	1539223002904	58
1281	3	7	23	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1282	4	1	23	1539223002904	72
1283	4	2	23	1539223002904	450
1284	4	3	23	1539223002904	147.56
1285	4	4	23	1539223002904	1
1286	4	5	23	1539223002904	49
1287	4	6	23	1539223002904	59
1288	4	7	23	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1289	1	1	24	1539223002904	72
1290	1	2	24	1539223002904	450
1291	1	3	24	1539223002904	157.01
1292	1	4	24	1539223002904	2
1293	1	5	24	1539223002904	64
1294	1	6	24	1539223002904	73
1295	1	7	24	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1296	2	1	24	1539223002904	72
1297	2	2	24	1539223002904	450
1298	2	3	24	1539223002904	143.59
1299	2	4	24	1539223002904	18
1300	2	5	24	1539223002904	64
1301	2	6	24	1539223002904	74
1302	2	7	24	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1303	3	1	24	1539223002904	72
1304	3	2	24	1539223002904	450
1305	3	3	24	1539223002904	134.54
1306	3	4	24	1539223002904	12
1307	3	5	24	1539223002904	62
1308	3	6	24	1539223002904	72
1309	3	7	24	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1310	4	1	24	1539223002904	72
1311	4	2	24	1539223002904	450
1312	4	3	24	1539223002904	141.92
1313	4	4	24	1539223002904	1627
1314	4	5	24	1539223002904	58
1315	4	6	24	1539223002904	67
1316	4	7	24	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1317	1	1	25	1539223002904	72
1318	1	2	25	1539223002904	450
1319	1	3	25	1539223002904	148.3
1320	1	4	25	1539223002904	0
1321	1	5	25	1539223002904	65
1322	1	6	25	1539223002904	76
1323	1	7	25	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1324	2	1	25	1539223002904	72
1325	2	2	25	1539223002904	450
1326	2	3	25	1539223002904	137.9
1327	2	4	25	1539223002904	0
1328	2	5	25	1539223002904	60
1329	2	6	25	1539223002904	69
1330	2	7	25	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1331	3	1	25	1539223002904	72
1332	3	2	25	1539223002904	450
1333	3	3	25	1539223002904	140.25
1334	3	4	25	1539223002904	0
1335	3	5	25	1539223002904	62
1336	3	6	25	1539223002904	71
1337	3	7	25	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1338	4	1	25	1539223002904	72
1339	4	2	25	1539223002904	450
1340	4	3	25	1539223002904	146.62
1341	4	4	25	1539223002904	88
1342	4	5	25	1539223002904	60
1343	4	6	25	1539223002904	69
1344	4	7	25	1539223002904	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1345	1	1	1	1539223007908	72
1346	1	2	1	1539223007908	450
1347	1	3	1	1539223007908	149.63
1348	1	4	1	1539223007908	843
1349	1	5	1	1539223007908	63
1350	1	6	1	1539223007908	71
1351	1	7	1	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1352	2	1	1	1539223007908	72
1353	2	2	1	1539223007908	450
1354	2	3	1	1539223007908	157.35
1355	2	4	1	1539223007908	3956
1356	2	5	1	1539223007908	60
1357	2	6	1	1539223007908	67
1358	2	7	1	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1359	3	1	1	1539223007908	72
1360	3	2	1	1539223007908	450
1361	3	3	1	1539223007908	141.24
1362	3	4	1	1539223007908	1208
1363	3	5	1	1539223007908	60
1364	3	6	1	1539223007908	69
1365	3	7	1	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1366	4	1	1	1539223007908	72
1367	4	2	1	1539223007908	450
1368	4	3	1	1539223007908	143.59
1369	4	4	1	1539223007908	6469
1370	4	5	1	1539223007908	56
1371	4	6	1	1539223007908	65
1372	4	7	1	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1373	1	1	2	1539223007908	72
1374	1	2	2	1539223007908	450
1375	1	3	2	1539223007908	146.96
1376	1	4	2	1539223007908	245
1377	1	5	2	1539223007908	64
1378	1	6	2	1539223007908	72
1379	1	7	2	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1380	2	1	2	1539223007908	72
1381	2	2	2	1539223007908	450
1382	2	3	2	1539223007908	137.9
1383	2	4	2	1539223007908	534
1384	2	5	2	1539223007908	65
1385	2	6	2	1539223007908	73
1386	2	7	2	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1387	3	1	2	1539223007908	72
1388	3	2	2	1539223007908	450
1389	3	3	2	1539223007908	152.32
1390	3	4	2	1539223007908	262
1391	3	5	2	1539223007908	62
1392	3	6	2	1539223007908	72
1393	3	7	2	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1394	4	1	2	1539223007908	72
1395	4	2	2	1539223007908	450
1396	4	3	2	1539223007908	142.59
1397	4	4	2	1539223007908	0
1398	4	5	2	1539223007908	59
1399	4	6	2	1539223007908	67
1400	4	7	2	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1401	1	1	3	1539223007908	72
1402	1	2	3	1539223007908	450
1403	1	3	3	1539223007908	140.25
1404	1	4	3	1539223007908	0
1405	1	5	3	1539223007908	64
1406	1	6	3	1539223007908	74
1407	1	7	3	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1408	2	1	3	1539223007908	72
1409	2	2	3	1539223007908	450
1410	2	3	3	1539223007908	145.95
1411	2	4	3	1539223007908	0
1412	2	5	3	1539223007908	62
1413	2	6	3	1539223007908	73
1414	2	7	3	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1415	3	1	3	1539223007908	72
1416	3	2	3	1539223007908	450
1417	3	3	3	1539223007908	138.91
1418	3	4	3	1539223007908	0
1419	3	5	3	1539223007908	64
1420	3	6	3	1539223007908	74
1421	3	7	3	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1422	4	1	3	1539223007908	72
1423	4	2	3	1539223007908	450
1424	4	3	3	1539223007908	140.58
1425	4	4	3	1539223007908	72
1426	4	5	3	1539223007908	61
1427	4	6	3	1539223007908	71
1428	4	7	3	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1429	1	1	4	1539223007908	72
1430	1	2	4	1539223007908	450
1431	1	3	4	1539223007908	158.03
1432	1	4	4	1539223007908	0
1433	1	5	4	1539223007908	60
1434	1	6	4	1539223007908	69
1435	1	7	4	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1436	2	1	4	1539223007908	72
1437	2	2	4	1539223007908	450
1438	2	3	4	1539223007908	144.94
1439	2	4	4	1539223007908	0
1440	2	5	4	1539223007908	59
1441	2	6	4	1539223007908	70
1442	2	7	4	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1443	3	1	4	1539223007908	72
1444	3	2	4	1539223007908	450
1445	3	3	4	1539223007908	158.36
1446	3	4	4	1539223007908	1
1447	3	5	4	1539223007908	61
1448	3	6	4	1539223007908	71
1449	3	7	4	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1450	4	1	4	1539223007908	72
1451	4	2	4	1539223007908	450
1452	4	3	4	1539223007908	147.63
1453	4	4	4	1539223007908	0
1454	4	5	4	1539223007908	62
1455	4	6	4	1539223007908	72
1456	4	7	4	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1457	1	1	5	1539223007908	72
1458	1	2	5	1539223007908	450
1459	1	3	5	1539223007908	137.89
1460	1	4	5	1539223007908	6900
1461	1	5	5	1539223007908	60
1462	1	6	5	1539223007908	68
1463	1	7	5	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1464	2	1	5	1539223007908	72
1465	2	2	5	1539223007908	450
1466	2	3	5	1539223007908	160.37
1467	2	4	5	1539223007908	3704
1468	2	5	5	1539223007908	61
1469	2	6	5	1539223007908	71
1470	2	7	5	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1471	3	1	5	1539223007908	72
1472	3	2	5	1539223007908	450
1473	3	3	5	1539223007908	145.28
1474	3	4	5	1539223007908	1495
1475	3	5	5	1539223007908	61
1476	3	6	5	1539223007908	69
1477	3	7	5	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1478	4	1	5	1539223007908	72
1479	4	2	5	1539223007908	450
1480	4	3	5	1539223007908	151.31
1481	4	4	5	1539223007908	11129
1482	4	5	5	1539223007908	59
1483	4	6	5	1539223007908	69
1484	4	7	5	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1485	1	1	6	1539223007908	72
1486	1	2	6	1539223007908	450
1487	1	3	6	1539223007908	145.95
1488	1	4	6	1539223007908	5719
1489	1	5	6	1539223007908	62
1490	1	6	6	1539223007908	70
1491	1	7	6	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1492	2	1	6	1539223007908	72
1493	2	2	6	1539223007908	450
1494	2	3	6	1539223007908	137.9
1495	2	4	6	1539223007908	7525
1496	2	5	6	1539223007908	64
1497	2	6	6	1539223007908	71
1498	2	7	6	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1499	3	1	6	1539223007908	72
1500	3	2	6	1539223007908	450
1501	3	3	6	1539223007908	149.98
1502	3	4	6	1539223007908	11066
1503	3	5	6	1539223007908	66
1504	3	6	6	1539223007908	75
1505	3	7	6	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1506	4	1	6	1539223007908	72
1507	4	2	6	1539223007908	450
1508	4	3	6	1539223007908	142.6
1509	4	4	6	1539223007908	11425
1510	4	5	6	1539223007908	65
1511	4	6	6	1539223007908	75
1512	4	7	6	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1513	1	1	7	1539223007908	72
1514	1	2	7	1539223007908	450
1515	1	3	7	1539223007908	131.86
1516	1	4	7	1539223007908	3200
1517	1	5	7	1539223007908	66
1518	1	6	7	1539223007908	74
1519	1	7	7	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1520	2	1	7	1539223007908	72
1521	2	2	7	1539223007908	450
1522	2	3	7	1539223007908	131.19
1523	2	4	7	1539223007908	6948
1524	2	5	7	1539223007908	64
1525	2	6	7	1539223007908	74
1526	2	7	7	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1527	3	1	7	1539223007908	72
1528	3	2	7	1539223007908	450
1529	3	3	7	1539223007908	137.56
1530	3	4	7	1539223007908	1925
1531	3	5	7	1539223007908	62
1532	3	6	7	1539223007908	71
1533	3	7	7	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1534	4	1	7	1539223007908	72
1535	4	2	7	1539223007908	450
1536	4	3	7	1539223007908	142.6
1537	4	4	7	1539223007908	4483
1538	4	5	7	1539223007908	62
1539	4	6	7	1539223007908	71
1540	4	7	7	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1541	1	1	8	1539223007908	72
1542	1	2	8	1539223007908	450
1543	1	3	8	1539223007908	160.38
1544	1	4	8	1539223007908	0
1545	1	5	8	1539223007908	63
1546	1	6	8	1539223007908	71
1547	1	7	8	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1548	2	1	8	1539223007908	72
1549	2	2	8	1539223007908	450
1550	2	3	8	1539223007908	146.96
1551	2	4	8	1539223007908	1
1552	2	5	8	1539223007908	65
1553	2	6	8	1539223007908	74
1554	2	7	8	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1555	3	1	8	1539223007908	72
1556	3	2	8	1539223007908	450
1557	3	3	8	1539223007908	155.01
1558	3	4	8	1539223007908	0
1559	3	5	8	1539223007908	64
1560	3	6	8	1539223007908	73
1561	3	7	8	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1562	4	1	8	1539223007908	72
1563	4	2	8	1539223007908	450
1564	4	3	8	1539223007908	146.29
1565	4	4	8	1539223007908	3
1566	4	5	8	1539223007908	61
1567	4	6	8	1539223007908	70
1568	4	7	8	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1569	1	1	9	1539223007908	72
1570	1	2	9	1539223007908	450
1571	1	3	9	1539223007908	153.67
1572	1	4	9	1539223007908	138
1573	1	5	9	1539223007908	63
1574	1	6	9	1539223007908	72
1575	1	7	9	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1576	2	1	9	1539223007908	72
1577	2	2	9	1539223007908	450
1578	2	3	9	1539223007908	140.58
1579	2	4	9	1539223007908	2300
1580	2	5	9	1539223007908	62
1581	2	6	9	1539223007908	72
1582	2	7	9	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1583	3	1	9	1539223007908	72
1584	3	2	9	1539223007908	450
1585	3	3	9	1539223007908	136.22
1586	3	4	9	1539223007908	1357
1587	3	5	9	1539223007908	63
1588	3	6	9	1539223007908	72
1589	3	7	9	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1590	4	1	9	1539223007908	72
1591	4	2	9	1539223007908	450
1592	4	3	9	1539223007908	155.01
1593	4	4	9	1539223007908	2315
1594	4	5	9	1539223007908	61
1595	4	6	9	1539223007908	71
1596	4	7	9	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1597	1	1	10	1539223007908	72
1598	1	2	10	1539223007908	450
1599	1	3	10	1539223007908	147.96
1600	1	4	10	1539223007908	1516
1601	1	5	10	1539223007908	63
1602	1	6	10	1539223007908	70
1603	1	7	10	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1604	2	1	10	1539223007908	72
1605	2	2	10	1539223007908	450
1606	2	3	10	1539223007908	152.33
1607	2	4	10	1539223007908	1273
1608	2	5	10	1539223007908	63
1609	2	6	10	1539223007908	69
1610	2	7	10	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1611	3	1	10	1539223007908	72
1612	3	2	10	1539223007908	450
1613	3	3	10	1539223007908	150.31
1614	3	4	10	1539223007908	1615
1615	3	5	10	1539223007908	63
1616	3	6	10	1539223007908	72
1617	3	7	10	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1618	4	1	10	1539223007908	72
1619	4	2	10	1539223007908	450
1620	4	3	10	1539223007908	146.62
1621	4	4	10	1539223007908	790
1622	4	5	10	1539223007908	61
1623	4	6	10	1539223007908	70
1624	4	7	10	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1625	1	1	11	1539223007908	72
1626	1	2	11	1539223007908	450
1627	1	3	11	1539223007908	152.66
1628	1	4	11	1539223007908	0
1629	1	5	11	1539223007908	63
1630	1	6	11	1539223007908	72
1631	1	7	11	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1632	2	1	11	1539223007908	72
1633	2	2	11	1539223007908	450
1634	2	3	11	1539223007908	141.59
1635	2	4	11	1539223007908	0
1636	2	5	11	1539223007908	63
1637	2	6	11	1539223007908	76
1638	2	7	11	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1639	3	1	11	1539223007908	72
1640	3	2	11	1539223007908	450
1641	3	3	11	1539223007908	144.61
1642	3	4	11	1539223007908	0
1643	3	5	11	1539223007908	62
1644	3	6	11	1539223007908	75
1645	3	7	11	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1646	4	1	11	1539223007908	72
1647	4	2	11	1539223007908	450
1648	4	3	11	1539223007908	143.6
1649	4	4	11	1539223007908	199
1650	4	5	11	1539223007908	60
1651	4	6	11	1539223007908	71
1652	4	7	11	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1653	1	1	12	1539223007908	72
1654	1	2	12	1539223007908	450
1655	1	3	12	1539223007908	162.06
1656	1	4	12	1539223007908	2449
1657	1	5	12	1539223007908	63
1658	1	6	12	1539223007908	72
1659	1	7	12	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1660	2	1	12	1539223007908	72
1661	2	2	12	1539223007908	450
1662	2	3	12	1539223007908	149.98
1663	2	4	12	1539223007908	1634
1664	2	5	12	1539223007908	62
1665	2	6	12	1539223007908	71
1666	2	7	12	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1667	3	1	12	1539223007908	72
1668	3	2	12	1539223007908	450
1669	3	3	12	1539223007908	135.21
1670	3	4	12	1539223007908	3675
1671	3	5	12	1539223007908	62
1672	3	6	12	1539223007908	69
1673	3	7	12	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1674	4	1	12	1539223007908	72
1675	4	2	12	1539223007908	450
1676	4	3	12	1539223007908	157.69
1677	4	4	12	1539223007908	340
1678	4	5	12	1539223007908	61
1679	4	6	12	1539223007908	72
1680	4	7	12	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1681	1	1	14	1539223007908	72
1682	1	2	14	1539223007908	450
1683	1	3	14	1539223007908	151.65
1684	1	4	14	1539223007908	158
1685	1	5	14	1539223007908	62
1686	1	6	14	1539223007908	69
1687	1	7	14	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1688	2	1	14	1539223007908	72
1689	2	2	14	1539223007908	450
1690	2	3	14	1539223007908	145.61
1691	2	4	14	1539223007908	277
1692	2	5	14	1539223007908	59
1693	2	6	14	1539223007908	66
1694	2	7	14	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1695	3	1	14	1539223007908	72
1696	3	2	14	1539223007908	450
1697	3	3	14	1539223007908	143.6
1698	3	4	14	1539223007908	1883
1699	3	5	14	1539223007908	60
1700	3	6	14	1539223007908	68
1701	3	7	14	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1702	4	1	14	1539223007908	72
1703	4	2	14	1539223007908	450
1704	4	3	14	1539223007908	144.61
1705	4	4	14	1539223007908	2171
1706	4	5	14	1539223007908	57
1707	4	6	14	1539223007908	68
1708	4	7	14	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1709	1	1	15	1539223007908	72
1710	1	2	15	1539223007908	384
1711	1	3	15	1539223007908	125.95
1712	1	4	15	1539223007908	0
1713	1	5	15	1539223007908	48
1714	1	6	15	1539223007908	56
1715	1	7	15	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1716	2	1	15	1539223007908	72
1717	2	2	15	1539223007908	384
1718	2	3	15	1539223007908	125.8
1719	2	4	15	1539223007908	0
1720	2	5	15	1539223007908	47
1721	2	6	15	1539223007908	53
1722	2	7	15	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1723	3	1	15	1539223007908	72
1724	3	2	15	1539223007908	384
1725	3	3	15	1539223007908	126.17
1726	3	4	15	1539223007908	2
1727	3	5	15	1539223007908	45
1728	3	6	15	1539223007908	51
1729	3	7	15	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1730	4	1	15	1539223007908	72
1731	4	2	15	1539223007908	384
1732	4	3	15	1539223007908	126.16
1733	4	4	15	1539223007908	5
1734	4	5	15	1539223007908	44
1735	4	6	15	1539223007908	51
1736	4	7	15	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1737	1	1	16	1539223007908	72
1738	1	2	16	1539223007908	450
1739	1	3	16	1539223007908	149.64
1740	1	4	16	1539223007908	0
1741	1	5	16	1539223007908	63
1742	1	6	16	1539223007908	72
1743	1	7	16	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1744	2	1	16	1539223007908	72
1745	2	2	16	1539223007908	450
1746	2	3	16	1539223007908	140.92
1747	2	4	16	1539223007908	0
1748	2	5	16	1539223007908	61
1749	2	6	16	1539223007908	71
1750	2	7	16	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1751	3	1	16	1539223007908	72
1752	3	2	16	1539223007908	450
1753	3	3	16	1539223007908	131.86
1754	3	4	16	1539223007908	0
1755	3	5	16	1539223007908	61
1756	3	6	16	1539223007908	71
1757	3	7	16	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1758	4	1	16	1539223007908	72
1759	4	2	16	1539223007908	450
1760	4	3	16	1539223007908	142.26
1761	4	4	16	1539223007908	49
1762	4	5	16	1539223007908	57
1763	4	6	16	1539223007908	67
1764	4	7	16	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1765	1	1	17	1539223007908	72
1766	1	2	17	1539223007908	450
1767	1	3	17	1539223007908	139.91
1768	1	4	17	1539223007908	1917
1769	1	5	17	1539223007908	62
1770	1	6	17	1539223007908	71
1771	1	7	17	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1772	2	1	17	1539223007908	72
1773	2	2	17	1539223007908	450
1774	2	3	17	1539223007908	153.33
1775	2	4	17	1539223007908	2229
1776	2	5	17	1539223007908	60
1777	2	6	17	1539223007908	68
1778	2	7	17	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1779	3	1	17	1539223007908	72
1780	3	2	17	1539223007908	450
1781	3	3	17	1539223007908	138.57
1782	3	4	17	1539223007908	1475
1783	3	5	17	1539223007908	62
1784	3	6	17	1539223007908	70
1785	3	7	17	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1786	4	1	17	1539223007908	72
1787	4	2	17	1539223007908	450
1788	4	3	17	1539223007908	141.25
1789	4	4	17	1539223007908	1688
1790	4	5	17	1539223007908	58
1791	4	6	17	1539223007908	66
1792	4	7	17	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1793	1	1	18	1539223007908	72
1794	1	2	18	1539223007908	450
1795	1	3	18	1539223007908	135.21
1796	1	4	18	1539223007908	0
1797	1	5	18	1539223007908	59
1798	1	6	18	1539223007908	67
1799	1	7	18	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1800	2	1	18	1539223007908	72
1801	2	2	18	1539223007908	450
1802	2	3	18	1539223007908	140.92
1803	2	4	18	1539223007908	0
1804	2	5	18	1539223007908	59
1805	2	6	18	1539223007908	67
1806	2	7	18	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1807	3	1	18	1539223007908	72
1808	3	2	18	1539223007908	450
1809	3	3	18	1539223007908	147.96
1810	3	4	18	1539223007908	1
1811	3	5	18	1539223007908	62
1812	3	6	18	1539223007908	70
1813	3	7	18	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1814	4	1	18	1539223007908	72
1815	4	2	18	1539223007908	450
1816	4	3	18	1539223007908	138.23
1817	4	4	18	1539223007908	33
1818	4	5	18	1539223007908	61
1819	4	6	18	1539223007908	70
1820	4	7	18	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1821	1	1	19	1539223007908	72
1822	1	2	19	1539223007908	450
1823	1	3	19	1539223007908	151.32
1824	1	4	19	1539223007908	0
1825	1	5	19	1539223007908	63
1826	1	6	19	1539223007908	73
1827	1	7	19	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1828	2	1	19	1539223007908	72
1829	2	2	19	1539223007908	450
1830	2	3	19	1539223007908	136.55
1831	2	4	19	1539223007908	0
1832	2	5	19	1539223007908	62
1833	2	6	19	1539223007908	73
1834	2	7	19	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1835	3	1	19	1539223007908	72
1836	3	2	19	1539223007908	450
1837	3	3	19	1539223007908	137.22
1838	3	4	19	1539223007908	0
1839	3	5	19	1539223007908	64
1840	3	6	19	1539223007908	75
1841	3	7	19	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1842	4	1	19	1539223007908	72
1843	4	2	19	1539223007908	450
1844	4	3	19	1539223007908	149.97
1845	4	4	19	1539223007908	0
1846	4	5	19	1539223007908	58
1847	4	6	19	1539223007908	68
1848	4	7	19	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1849	1	1	20	1539223007908	72
1850	1	2	20	1539223007908	487
1851	1	3	20	1539223007908	161.05
1852	1	4	20	1539223007908	15
1853	1	5	20	1539223007908	63
1854	1	6	20	1539223007908	73
1855	1	7	20	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1856	2	1	20	1539223007908	72
1857	2	2	20	1539223007908	487
1858	2	3	20	1539223007908	166.42
1859	2	4	20	1539223007908	1
1860	2	5	20	1539223007908	62
1861	2	6	20	1539223007908	73
1862	2	7	20	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1863	3	1	20	1539223007908	72
1864	3	2	20	1539223007908	487
1865	3	3	20	1539223007908	159.04
1866	3	4	20	1539223007908	4
1867	3	5	20	1539223007908	64
1868	3	6	20	1539223007908	76
1869	3	7	20	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1870	4	1	20	1539223007908	72
1871	4	2	20	1539223007908	487
1872	4	3	20	1539223007908	149.31
1873	4	4	20	1539223007908	757
1874	4	5	20	1539223007908	60
1875	4	6	20	1539223007908	71
1876	4	7	20	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1877	1	1	21	1539223007908	72
1878	1	2	21	1539223007908	450
1879	1	3	21	1539223007908	163.4
1880	1	4	21	1539223007908	0
1881	1	5	21	1539223007908	61
1882	1	6	21	1539223007908	71
1883	1	7	21	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1884	2	1	21	1539223007908	72
1885	2	2	21	1539223007908	450
1886	2	3	21	1539223007908	143.27
1887	2	4	21	1539223007908	0
1888	2	5	21	1539223007908	59
1889	2	6	21	1539223007908	69
1890	2	7	21	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1891	3	1	21	1539223007908	72
1892	3	2	21	1539223007908	450
1893	3	3	21	1539223007908	153.33
1894	3	4	21	1539223007908	0
1895	3	5	21	1539223007908	58
1896	3	6	21	1539223007908	69
1897	3	7	21	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1898	4	1	21	1539223007908	72
1899	4	2	21	1539223007908	450
1900	4	3	21	1539223007908	150.65
1901	4	4	21	1539223007908	22
1902	4	5	21	1539223007908	57
1903	4	6	21	1539223007908	68
1904	4	7	21	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1905	1	1	22	1539223007908	72
1906	1	2	22	1539223007908	450
1907	1	3	22	1539223007908	144.94
1908	1	4	22	1539223007908	0
1909	1	5	22	1539223007908	65
1910	1	6	22	1539223007908	75
1911	1	7	22	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1912	2	1	22	1539223007908	72
1913	2	2	22	1539223007908	450
1914	2	3	22	1539223007908	151.32
1915	2	4	22	1539223007908	0
1916	2	5	22	1539223007908	62
1917	2	6	22	1539223007908	74
1918	2	7	22	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1919	3	1	22	1539223007908	72
1920	3	2	22	1539223007908	450
1921	3	3	22	1539223007908	147.63
1922	3	4	22	1539223007908	0
1923	3	5	22	1539223007908	60
1924	3	6	22	1539223007908	71
1925	3	7	22	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1926	4	1	22	1539223007908	72
1927	4	2	22	1539223007908	450
1928	4	3	22	1539223007908	143.27
1929	4	4	22	1539223007908	0
1930	4	5	22	1539223007908	59
1931	4	6	22	1539223007908	69
1932	4	7	22	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1933	1	1	23	1539223007908	72
1934	1	2	23	1539223007908	450
1935	1	3	23	1539223007908	147.34
1936	1	4	23	1539223007908	0
1937	1	5	23	1539223007908	52
1938	1	6	23	1539223007908	61
1939	1	7	23	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1940	2	1	23	1539223007908	72
1941	2	2	23	1539223007908	450
1942	2	3	23	1539223007908	148.25
1943	2	4	23	1539223007908	0
1944	2	5	23	1539223007908	49
1945	2	6	23	1539223007908	57
1946	2	7	23	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1947	3	1	23	1539223007908	72
1948	3	2	23	1539223007908	450
1949	3	3	23	1539223007908	147.81
1950	3	4	23	1539223007908	0
1951	3	5	23	1539223007908	49
1952	3	6	23	1539223007908	58
1953	3	7	23	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1954	4	1	23	1539223007908	72
1955	4	2	23	1539223007908	450
1956	4	3	23	1539223007908	147.56
1957	4	4	23	1539223007908	1
1958	4	5	23	1539223007908	49
1959	4	6	23	1539223007908	59
1960	4	7	23	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1961	1	1	24	1539223007908	72
1962	1	2	24	1539223007908	450
1963	1	3	24	1539223007908	157.01
1964	1	4	24	1539223007908	2
1965	1	5	24	1539223007908	64
1966	1	6	24	1539223007908	73
1967	1	7	24	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1968	2	1	24	1539223007908	72
1969	2	2	24	1539223007908	450
1970	2	3	24	1539223007908	143.59
1971	2	4	24	1539223007908	18
1972	2	5	24	1539223007908	64
1973	2	6	24	1539223007908	74
1974	2	7	24	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1975	3	1	24	1539223007908	72
1976	3	2	24	1539223007908	450
1977	3	3	24	1539223007908	134.54
1978	3	4	24	1539223007908	12
1979	3	5	24	1539223007908	62
1980	3	6	24	1539223007908	72
1981	3	7	24	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1982	4	1	24	1539223007908	72
1983	4	2	24	1539223007908	450
1984	4	3	24	1539223007908	141.92
1985	4	4	24	1539223007908	1627
1986	4	5	24	1539223007908	58
1987	4	6	24	1539223007908	67
1988	4	7	24	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1989	1	1	25	1539223007908	72
1990	1	2	25	1539223007908	450
1991	1	3	25	1539223007908	148.3
1992	1	4	25	1539223007908	0
1993	1	5	25	1539223007908	65
1994	1	6	25	1539223007908	76
1995	1	7	25	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
1996	2	1	25	1539223007908	72
1997	2	2	25	1539223007908	450
1998	2	3	25	1539223007908	137.9
1999	2	4	25	1539223007908	0
2000	2	5	25	1539223007908	60
2001	2	6	25	1539223007908	69
2002	2	7	25	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2003	3	1	25	1539223007908	72
2004	3	2	25	1539223007908	450
2005	3	3	25	1539223007908	140.25
2006	3	4	25	1539223007908	0
2007	3	5	25	1539223007908	62
2008	3	6	25	1539223007908	71
2009	3	7	25	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2010	4	1	25	1539223007908	72
2011	4	2	25	1539223007908	450
2012	4	3	25	1539223007908	146.62
2013	4	4	25	1539223007908	88
2014	4	5	25	1539223007908	60
2015	4	6	25	1539223007908	69
2016	4	7	25	1539223007908	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2017	1	1	1	1540313742629	72
2018	1	2	1	1540313742629	450
2019	1	3	1	1540313742629	149.63
2020	1	4	1	1540313742629	843
2021	1	5	1	1540313742629	63
2022	1	6	1	1540313742629	71
2023	1	7	1	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2024	2	1	1	1540313742629	72
2025	2	2	1	1540313742629	450
2026	2	3	1	1540313742629	157.35
2027	2	4	1	1540313742629	3956
2028	2	5	1	1540313742629	60
2029	2	6	1	1540313742629	67
2030	2	7	1	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2031	3	1	1	1540313742629	72
2032	3	2	1	1540313742629	450
2033	3	3	1	1540313742629	141.24
2034	3	4	1	1540313742629	1208
2035	3	5	1	1540313742629	60
2036	3	6	1	1540313742629	69
2037	3	7	1	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2038	4	1	1	1540313742629	72
2039	4	2	1	1540313742629	450
2040	4	3	1	1540313742629	143.59
2041	4	4	1	1540313742629	6469
2042	4	5	1	1540313742629	56
2043	4	6	1	1540313742629	65
2044	4	7	1	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2045	1	1	2	1540313742629	72
2046	1	2	2	1540313742629	450
2047	1	3	2	1540313742629	146.96
2048	1	4	2	1540313742629	245
2049	1	5	2	1540313742629	64
2050	1	6	2	1540313742629	72
2051	1	7	2	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2052	2	1	2	1540313742629	72
2053	2	2	2	1540313742629	450
2054	2	3	2	1540313742629	137.9
2055	2	4	2	1540313742629	534
2056	2	5	2	1540313742629	65
2057	2	6	2	1540313742629	73
2058	2	7	2	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2059	3	1	2	1540313742629	72
2060	3	2	2	1540313742629	450
2061	3	3	2	1540313742629	152.32
2062	3	4	2	1540313742629	262
2063	3	5	2	1540313742629	62
2064	3	6	2	1540313742629	72
2065	3	7	2	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2066	4	1	2	1540313742629	72
2067	4	2	2	1540313742629	450
2068	4	3	2	1540313742629	142.59
2069	4	4	2	1540313742629	0
2070	4	5	2	1540313742629	59
2071	4	6	2	1540313742629	67
2072	4	7	2	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2073	1	1	3	1540313742629	72
2074	1	2	3	1540313742629	450
2075	1	3	3	1540313742629	140.25
2076	1	4	3	1540313742629	0
2077	1	5	3	1540313742629	64
2078	1	6	3	1540313742629	74
2079	1	7	3	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2080	2	1	3	1540313742629	72
2081	2	2	3	1540313742629	450
2082	2	3	3	1540313742629	145.95
2083	2	4	3	1540313742629	0
2084	2	5	3	1540313742629	62
2085	2	6	3	1540313742629	73
2086	2	7	3	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2087	3	1	3	1540313742629	72
2088	3	2	3	1540313742629	450
2089	3	3	3	1540313742629	138.91
2090	3	4	3	1540313742629	0
2091	3	5	3	1540313742629	64
2092	3	6	3	1540313742629	74
2093	3	7	3	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2094	4	1	3	1540313742629	72
2095	4	2	3	1540313742629	450
2096	4	3	3	1540313742629	140.58
2097	4	4	3	1540313742629	72
2098	4	5	3	1540313742629	61
2099	4	6	3	1540313742629	71
2100	4	7	3	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2101	1	1	4	1540313742629	72
2102	1	2	4	1540313742629	450
2103	1	3	4	1540313742629	158.03
2104	1	4	4	1540313742629	0
2105	1	5	4	1540313742629	60
2106	1	6	4	1540313742629	69
2107	1	7	4	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2108	2	1	4	1540313742629	72
2109	2	2	4	1540313742629	450
2110	2	3	4	1540313742629	144.94
2111	2	4	4	1540313742629	0
2112	2	5	4	1540313742629	59
2113	2	6	4	1540313742629	70
2114	2	7	4	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2115	3	1	4	1540313742629	72
2116	3	2	4	1540313742629	450
2117	3	3	4	1540313742629	158.36
2118	3	4	4	1540313742629	1
2119	3	5	4	1540313742629	61
2120	3	6	4	1540313742629	71
2121	3	7	4	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2122	4	1	4	1540313742629	72
2123	4	2	4	1540313742629	450
2124	4	3	4	1540313742629	147.63
2125	4	4	4	1540313742629	0
2126	4	5	4	1540313742629	62
2127	4	6	4	1540313742629	72
2128	4	7	4	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2129	1	1	5	1540313742629	72
2130	1	2	5	1540313742629	450
2131	1	3	5	1540313742629	137.89
2132	1	4	5	1540313742629	6900
2133	1	5	5	1540313742629	60
2134	1	6	5	1540313742629	68
2135	1	7	5	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2136	2	1	5	1540313742629	72
2137	2	2	5	1540313742629	450
2138	2	3	5	1540313742629	160.37
2139	2	4	5	1540313742629	3704
2140	2	5	5	1540313742629	61
2141	2	6	5	1540313742629	71
2142	2	7	5	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2143	3	1	5	1540313742629	72
2144	3	2	5	1540313742629	450
2145	3	3	5	1540313742629	145.28
2146	3	4	5	1540313742629	1495
2147	3	5	5	1540313742629	61
2148	3	6	5	1540313742629	69
2149	3	7	5	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2150	4	1	5	1540313742629	72
2151	4	2	5	1540313742629	450
2152	4	3	5	1540313742629	151.31
2153	4	4	5	1540313742629	11129
2154	4	5	5	1540313742629	59
2155	4	6	5	1540313742629	69
2156	4	7	5	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2157	1	1	6	1540313742629	72
2158	1	2	6	1540313742629	450
2159	1	3	6	1540313742629	145.95
2160	1	4	6	1540313742629	5719
2161	1	5	6	1540313742629	62
2162	1	6	6	1540313742629	70
2163	1	7	6	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2164	2	1	6	1540313742629	72
2165	2	2	6	1540313742629	450
2166	2	3	6	1540313742629	137.9
2167	2	4	6	1540313742629	7525
2168	2	5	6	1540313742629	64
2169	2	6	6	1540313742629	71
2170	2	7	6	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2171	3	1	6	1540313742629	72
2172	3	2	6	1540313742629	450
2173	3	3	6	1540313742629	149.98
2174	3	4	6	1540313742629	11066
2175	3	5	6	1540313742629	66
2176	3	6	6	1540313742629	75
2177	3	7	6	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2178	4	1	6	1540313742629	72
2179	4	2	6	1540313742629	450
2180	4	3	6	1540313742629	142.6
2181	4	4	6	1540313742629	11425
2182	4	5	6	1540313742629	65
2183	4	6	6	1540313742629	75
2184	4	7	6	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2185	1	1	7	1540313742629	72
2186	1	2	7	1540313742629	450
2187	1	3	7	1540313742629	131.86
2188	1	4	7	1540313742629	3200
2189	1	5	7	1540313742629	66
2190	1	6	7	1540313742629	74
2191	1	7	7	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2192	2	1	7	1540313742629	72
2193	2	2	7	1540313742629	450
2194	2	3	7	1540313742629	131.19
2195	2	4	7	1540313742629	6948
2196	2	5	7	1540313742629	64
2197	2	6	7	1540313742629	74
2198	2	7	7	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2199	3	1	7	1540313742629	72
2200	3	2	7	1540313742629	450
2201	3	3	7	1540313742629	137.56
2202	3	4	7	1540313742629	1925
2203	3	5	7	1540313742629	62
2204	3	6	7	1540313742629	71
2205	3	7	7	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2206	4	1	7	1540313742629	72
2207	4	2	7	1540313742629	450
2208	4	3	7	1540313742629	142.6
2209	4	4	7	1540313742629	4483
2210	4	5	7	1540313742629	62
2211	4	6	7	1540313742629	71
2212	4	7	7	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2213	1	1	8	1540313742629	72
2214	1	2	8	1540313742629	450
2215	1	3	8	1540313742629	160.38
2216	1	4	8	1540313742629	0
2217	1	5	8	1540313742629	63
2218	1	6	8	1540313742629	71
2219	1	7	8	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2220	2	1	8	1540313742629	72
2221	2	2	8	1540313742629	450
2222	2	3	8	1540313742629	146.96
2223	2	4	8	1540313742629	1
2224	2	5	8	1540313742629	65
2225	2	6	8	1540313742629	74
2226	2	7	8	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2227	3	1	8	1540313742629	72
2228	3	2	8	1540313742629	450
2229	3	3	8	1540313742629	155.01
2230	3	4	8	1540313742629	0
2231	3	5	8	1540313742629	64
2232	3	6	8	1540313742629	73
2233	3	7	8	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2234	4	1	8	1540313742629	72
2235	4	2	8	1540313742629	450
2236	4	3	8	1540313742629	146.29
2237	4	4	8	1540313742629	3
2238	4	5	8	1540313742629	61
2239	4	6	8	1540313742629	70
2240	4	7	8	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2241	1	1	9	1540313742629	72
2242	1	2	9	1540313742629	450
2243	1	3	9	1540313742629	153.67
2244	1	4	9	1540313742629	138
2245	1	5	9	1540313742629	63
2246	1	6	9	1540313742629	72
2247	1	7	9	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2248	2	1	9	1540313742629	72
2249	2	2	9	1540313742629	450
2250	2	3	9	1540313742629	140.58
2251	2	4	9	1540313742629	2300
2252	2	5	9	1540313742629	62
2253	2	6	9	1540313742629	72
2254	2	7	9	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2255	3	1	9	1540313742629	72
2256	3	2	9	1540313742629	450
2257	3	3	9	1540313742629	136.22
2258	3	4	9	1540313742629	1357
2259	3	5	9	1540313742629	63
2260	3	6	9	1540313742629	72
2261	3	7	9	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2262	4	1	9	1540313742629	72
2263	4	2	9	1540313742629	450
2264	4	3	9	1540313742629	155.01
2265	4	4	9	1540313742629	2315
2266	4	5	9	1540313742629	61
2267	4	6	9	1540313742629	71
2268	4	7	9	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2269	1	1	10	1540313742629	72
2270	1	2	10	1540313742629	450
2271	1	3	10	1540313742629	147.96
2272	1	4	10	1540313742629	1516
2273	1	5	10	1540313742629	63
2274	1	6	10	1540313742629	70
2275	1	7	10	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2276	2	1	10	1540313742629	72
2277	2	2	10	1540313742629	450
2278	2	3	10	1540313742629	152.33
2279	2	4	10	1540313742629	1273
2280	2	5	10	1540313742629	63
2281	2	6	10	1540313742629	69
2282	2	7	10	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2283	3	1	10	1540313742629	72
2284	3	2	10	1540313742629	450
2285	3	3	10	1540313742629	150.31
2286	3	4	10	1540313742629	1615
2287	3	5	10	1540313742629	63
2288	3	6	10	1540313742629	72
2289	3	7	10	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2290	4	1	10	1540313742629	72
2291	4	2	10	1540313742629	450
2292	4	3	10	1540313742629	146.62
2293	4	4	10	1540313742629	790
2294	4	5	10	1540313742629	61
2295	4	6	10	1540313742629	70
2296	4	7	10	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2297	1	1	11	1540313742629	72
2298	1	2	11	1540313742629	450
2299	1	3	11	1540313742629	152.66
2300	1	4	11	1540313742629	0
2301	1	5	11	1540313742629	63
2302	1	6	11	1540313742629	72
2303	1	7	11	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2304	2	1	11	1540313742629	72
2305	2	2	11	1540313742629	450
2306	2	3	11	1540313742629	141.59
2307	2	4	11	1540313742629	0
2308	2	5	11	1540313742629	63
2309	2	6	11	1540313742629	76
2310	2	7	11	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2311	3	1	11	1540313742629	72
2312	3	2	11	1540313742629	450
2313	3	3	11	1540313742629	144.61
2314	3	4	11	1540313742629	0
2315	3	5	11	1540313742629	62
2316	3	6	11	1540313742629	75
2317	3	7	11	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2318	4	1	11	1540313742629	72
2319	4	2	11	1540313742629	450
2320	4	3	11	1540313742629	143.6
2321	4	4	11	1540313742629	199
2322	4	5	11	1540313742629	60
2323	4	6	11	1540313742629	71
2324	4	7	11	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2325	1	1	12	1540313742629	72
2326	1	2	12	1540313742629	450
2327	1	3	12	1540313742629	162.06
2328	1	4	12	1540313742629	2449
2329	1	5	12	1540313742629	63
2330	1	6	12	1540313742629	72
2331	1	7	12	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2332	2	1	12	1540313742629	72
2333	2	2	12	1540313742629	450
2334	2	3	12	1540313742629	149.98
2335	2	4	12	1540313742629	1634
2336	2	5	12	1540313742629	62
2337	2	6	12	1540313742629	71
2338	2	7	12	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2339	3	1	12	1540313742629	72
2340	3	2	12	1540313742629	450
2341	3	3	12	1540313742629	135.21
2342	3	4	12	1540313742629	3675
2343	3	5	12	1540313742629	62
2344	3	6	12	1540313742629	69
2345	3	7	12	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2346	4	1	12	1540313742629	72
2347	4	2	12	1540313742629	450
2348	4	3	12	1540313742629	157.69
2349	4	4	12	1540313742629	340
2350	4	5	12	1540313742629	61
2351	4	6	12	1540313742629	72
2352	4	7	12	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2353	1	1	14	1540313742629	72
2354	1	2	14	1540313742629	450
2355	1	3	14	1540313742629	151.65
2356	1	4	14	1540313742629	158
2357	1	5	14	1540313742629	62
2358	1	6	14	1540313742629	69
2359	1	7	14	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2360	2	1	14	1540313742629	72
2361	2	2	14	1540313742629	450
2362	2	3	14	1540313742629	145.61
2363	2	4	14	1540313742629	277
2364	2	5	14	1540313742629	59
2365	2	6	14	1540313742629	66
2366	2	7	14	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2367	3	1	14	1540313742629	72
2368	3	2	14	1540313742629	450
2369	3	3	14	1540313742629	143.6
2370	3	4	14	1540313742629	1883
2371	3	5	14	1540313742629	60
2372	3	6	14	1540313742629	68
2373	3	7	14	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2374	4	1	14	1540313742629	72
2375	4	2	14	1540313742629	450
2376	4	3	14	1540313742629	144.61
2377	4	4	14	1540313742629	2171
2378	4	5	14	1540313742629	57
2379	4	6	14	1540313742629	68
2380	4	7	14	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2381	1	1	15	1540313742629	72
2382	1	2	15	1540313742629	384
2383	1	3	15	1540313742629	125.95
2384	1	4	15	1540313742629	0
2385	1	5	15	1540313742629	48
2386	1	6	15	1540313742629	56
2387	1	7	15	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2388	2	1	15	1540313742629	72
2389	2	2	15	1540313742629	384
2390	2	3	15	1540313742629	125.8
2391	2	4	15	1540313742629	0
2392	2	5	15	1540313742629	47
2393	2	6	15	1540313742629	53
2394	2	7	15	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2395	3	1	15	1540313742629	72
2396	3	2	15	1540313742629	384
2397	3	3	15	1540313742629	126.17
2398	3	4	15	1540313742629	2
2399	3	5	15	1540313742629	45
2400	3	6	15	1540313742629	51
2401	3	7	15	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2402	4	1	15	1540313742629	72
2403	4	2	15	1540313742629	384
2404	4	3	15	1540313742629	126.16
2405	4	4	15	1540313742629	5
2406	4	5	15	1540313742629	44
2407	4	6	15	1540313742629	51
2408	4	7	15	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2409	1	1	16	1540313742629	72
2410	1	2	16	1540313742629	450
2411	1	3	16	1540313742629	149.64
2412	1	4	16	1540313742629	0
2413	1	5	16	1540313742629	63
2414	1	6	16	1540313742629	72
2415	1	7	16	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2416	2	1	16	1540313742629	72
2417	2	2	16	1540313742629	450
2418	2	3	16	1540313742629	140.92
2419	2	4	16	1540313742629	0
2420	2	5	16	1540313742629	61
2421	2	6	16	1540313742629	71
2422	2	7	16	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2423	3	1	16	1540313742629	72
2424	3	2	16	1540313742629	450
2425	3	3	16	1540313742629	131.86
2426	3	4	16	1540313742629	0
2427	3	5	16	1540313742629	61
2428	3	6	16	1540313742629	71
2429	3	7	16	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2430	4	1	16	1540313742629	72
2431	4	2	16	1540313742629	450
2432	4	3	16	1540313742629	142.26
2433	4	4	16	1540313742629	49
2434	4	5	16	1540313742629	57
2435	4	6	16	1540313742629	67
2436	4	7	16	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2437	1	1	17	1540313742629	72
2438	1	2	17	1540313742629	450
2439	1	3	17	1540313742629	139.91
2440	1	4	17	1540313742629	1917
2441	1	5	17	1540313742629	62
2442	1	6	17	1540313742629	71
2443	1	7	17	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2444	2	1	17	1540313742629	72
2445	2	2	17	1540313742629	450
2446	2	3	17	1540313742629	153.33
2447	2	4	17	1540313742629	2229
2448	2	5	17	1540313742629	60
2449	2	6	17	1540313742629	68
2450	2	7	17	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2451	3	1	17	1540313742629	72
2452	3	2	17	1540313742629	450
2453	3	3	17	1540313742629	138.57
2454	3	4	17	1540313742629	1475
2455	3	5	17	1540313742629	62
2456	3	6	17	1540313742629	70
2457	3	7	17	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2458	4	1	17	1540313742629	72
2459	4	2	17	1540313742629	450
2460	4	3	17	1540313742629	141.25
2461	4	4	17	1540313742629	1688
2462	4	5	17	1540313742629	58
2463	4	6	17	1540313742629	66
2464	4	7	17	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2465	1	1	18	1540313742629	72
2466	1	2	18	1540313742629	450
2467	1	3	18	1540313742629	135.21
2468	1	4	18	1540313742629	0
2469	1	5	18	1540313742629	59
2470	1	6	18	1540313742629	67
2471	1	7	18	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2472	2	1	18	1540313742629	72
2473	2	2	18	1540313742629	450
2474	2	3	18	1540313742629	140.92
2475	2	4	18	1540313742629	0
2476	2	5	18	1540313742629	59
2477	2	6	18	1540313742629	67
2478	2	7	18	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2479	3	1	18	1540313742629	72
2480	3	2	18	1540313742629	450
2481	3	3	18	1540313742629	147.96
2482	3	4	18	1540313742629	1
2483	3	5	18	1540313742629	62
2484	3	6	18	1540313742629	70
2485	3	7	18	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2486	4	1	18	1540313742629	72
2487	4	2	18	1540313742629	450
2488	4	3	18	1540313742629	138.23
2489	4	4	18	1540313742629	33
2490	4	5	18	1540313742629	61
2491	4	6	18	1540313742629	70
2492	4	7	18	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2493	1	1	19	1540313742629	72
2494	1	2	19	1540313742629	450
2495	1	3	19	1540313742629	151.32
2496	1	4	19	1540313742629	0
2497	1	5	19	1540313742629	63
2498	1	6	19	1540313742629	73
2499	1	7	19	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2500	2	1	19	1540313742629	72
2501	2	2	19	1540313742629	450
2502	2	3	19	1540313742629	136.55
2503	2	4	19	1540313742629	0
2504	2	5	19	1540313742629	62
2505	2	6	19	1540313742629	73
2506	2	7	19	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2507	3	1	19	1540313742629	72
2508	3	2	19	1540313742629	450
2509	3	3	19	1540313742629	137.22
2510	3	4	19	1540313742629	0
2511	3	5	19	1540313742629	64
2512	3	6	19	1540313742629	75
2513	3	7	19	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2514	4	1	19	1540313742629	72
2515	4	2	19	1540313742629	450
2516	4	3	19	1540313742629	149.97
2517	4	4	19	1540313742629	0
2518	4	5	19	1540313742629	58
2519	4	6	19	1540313742629	68
2520	4	7	19	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2521	1	1	20	1540313742629	72
2522	1	2	20	1540313742629	487
2523	1	3	20	1540313742629	161.05
2524	1	4	20	1540313742629	15
2525	1	5	20	1540313742629	63
2526	1	6	20	1540313742629	73
2527	1	7	20	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2528	2	1	20	1540313742629	72
2529	2	2	20	1540313742629	487
2530	2	3	20	1540313742629	166.42
2531	2	4	20	1540313742629	1
2532	2	5	20	1540313742629	62
2533	2	6	20	1540313742629	73
2534	2	7	20	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2535	3	1	20	1540313742629	72
2536	3	2	20	1540313742629	487
2537	3	3	20	1540313742629	159.04
2538	3	4	20	1540313742629	4
2539	3	5	20	1540313742629	64
2540	3	6	20	1540313742629	76
2541	3	7	20	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2542	4	1	20	1540313742629	72
2543	4	2	20	1540313742629	487
2544	4	3	20	1540313742629	149.31
2545	4	4	20	1540313742629	757
2546	4	5	20	1540313742629	60
2547	4	6	20	1540313742629	71
2548	4	7	20	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2549	1	1	21	1540313742629	72
2550	1	2	21	1540313742629	450
2551	1	3	21	1540313742629	163.4
2552	1	4	21	1540313742629	0
2553	1	5	21	1540313742629	61
2554	1	6	21	1540313742629	71
2555	1	7	21	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2556	2	1	21	1540313742629	72
2557	2	2	21	1540313742629	450
2558	2	3	21	1540313742629	143.27
2559	2	4	21	1540313742629	0
2560	2	5	21	1540313742629	59
2561	2	6	21	1540313742629	69
2562	2	7	21	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2563	3	1	21	1540313742629	72
2564	3	2	21	1540313742629	450
2565	3	3	21	1540313742629	153.33
2566	3	4	21	1540313742629	0
2567	3	5	21	1540313742629	58
2568	3	6	21	1540313742629	69
2569	3	7	21	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2570	4	1	21	1540313742629	72
2571	4	2	21	1540313742629	450
2572	4	3	21	1540313742629	150.65
2573	4	4	21	1540313742629	22
2574	4	5	21	1540313742629	57
2575	4	6	21	1540313742629	68
2576	4	7	21	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2577	1	1	22	1540313742629	72
2578	1	2	22	1540313742629	450
2579	1	3	22	1540313742629	144.94
2580	1	4	22	1540313742629	0
2581	1	5	22	1540313742629	65
2582	1	6	22	1540313742629	75
2583	1	7	22	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2584	2	1	22	1540313742629	72
2585	2	2	22	1540313742629	450
2586	2	3	22	1540313742629	151.32
2587	2	4	22	1540313742629	0
2588	2	5	22	1540313742629	62
2589	2	6	22	1540313742629	74
2590	2	7	22	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2591	3	1	22	1540313742629	72
2592	3	2	22	1540313742629	450
2593	3	3	22	1540313742629	147.63
2594	3	4	22	1540313742629	0
2595	3	5	22	1540313742629	60
2596	3	6	22	1540313742629	71
2597	3	7	22	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2598	4	1	22	1540313742629	72
2599	4	2	22	1540313742629	450
2600	4	3	22	1540313742629	143.27
2601	4	4	22	1540313742629	0
2602	4	5	22	1540313742629	59
2603	4	6	22	1540313742629	69
2604	4	7	22	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2605	1	1	23	1540313742629	72
2606	1	2	23	1540313742629	450
2607	1	3	23	1540313742629	147.34
2608	1	4	23	1540313742629	0
2609	1	5	23	1540313742629	52
2610	1	6	23	1540313742629	61
2611	1	7	23	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2612	2	1	23	1540313742629	72
2613	2	2	23	1540313742629	450
2614	2	3	23	1540313742629	148.25
2615	2	4	23	1540313742629	0
2616	2	5	23	1540313742629	49
2617	2	6	23	1540313742629	57
2618	2	7	23	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2619	3	1	23	1540313742629	72
2620	3	2	23	1540313742629	450
2621	3	3	23	1540313742629	147.81
2622	3	4	23	1540313742629	0
2623	3	5	23	1540313742629	49
2624	3	6	23	1540313742629	58
2625	3	7	23	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2626	4	1	23	1540313742629	72
2627	4	2	23	1540313742629	450
2628	4	3	23	1540313742629	147.56
2629	4	4	23	1540313742629	1
2630	4	5	23	1540313742629	49
2631	4	6	23	1540313742629	59
2632	4	7	23	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2633	1	1	24	1540313742629	72
2634	1	2	24	1540313742629	450
2635	1	3	24	1540313742629	157.01
2636	1	4	24	1540313742629	2
2637	1	5	24	1540313742629	64
2638	1	6	24	1540313742629	73
2639	1	7	24	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2640	2	1	24	1540313742629	72
2641	2	2	24	1540313742629	450
2642	2	3	24	1540313742629	143.59
2643	2	4	24	1540313742629	18
2644	2	5	24	1540313742629	64
2645	2	6	24	1540313742629	74
2646	2	7	24	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2647	3	1	24	1540313742629	72
2648	3	2	24	1540313742629	450
2649	3	3	24	1540313742629	134.54
2650	3	4	24	1540313742629	12
2651	3	5	24	1540313742629	62
2652	3	6	24	1540313742629	72
2653	3	7	24	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2654	4	1	24	1540313742629	72
2655	4	2	24	1540313742629	450
2656	4	3	24	1540313742629	141.92
2657	4	4	24	1540313742629	1627
2658	4	5	24	1540313742629	58
2659	4	6	24	1540313742629	67
2660	4	7	24	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2661	1	1	25	1540313742629	72
2662	1	2	25	1540313742629	450
2663	1	3	25	1540313742629	148.3
2664	1	4	25	1540313742629	0
2665	1	5	25	1540313742629	65
2666	1	6	25	1540313742629	76
2667	1	7	25	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2668	2	1	25	1540313742629	72
2669	2	2	25	1540313742629	450
2670	2	3	25	1540313742629	137.9
2671	2	4	25	1540313742629	0
2672	2	5	25	1540313742629	60
2673	2	6	25	1540313742629	69
2674	2	7	25	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2675	3	1	25	1540313742629	72
2676	3	2	25	1540313742629	450
2677	3	3	25	1540313742629	140.25
2678	3	4	25	1540313742629	0
2679	3	5	25	1540313742629	62
2680	3	6	25	1540313742629	71
2681	3	7	25	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2682	4	1	25	1540313742629	72
2683	4	2	25	1540313742629	450
2684	4	3	25	1540313742629	146.62
2685	4	4	25	1540313742629	88
2686	4	5	25	1540313742629	60
2687	4	6	25	1540313742629	69
2688	4	7	25	1540313742629	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2689	1	1	1	1540313768485	72
2690	1	2	1	1540313768485	450
2691	1	3	1	1540313768485	149.63
2692	1	4	1	1540313768485	843
2693	1	5	1	1540313768485	63
2694	1	6	1	1540313768485	71
2695	1	7	1	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2696	2	1	1	1540313768485	72
2697	2	2	1	1540313768485	450
2698	2	3	1	1540313768485	157.35
2699	2	4	1	1540313768485	3956
2700	2	5	1	1540313768485	60
2701	2	6	1	1540313768485	67
2702	2	7	1	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2703	3	1	1	1540313768485	72
2704	3	2	1	1540313768485	450
2705	3	3	1	1540313768485	141.24
2706	3	4	1	1540313768485	1208
2707	3	5	1	1540313768485	60
2708	3	6	1	1540313768485	69
2709	3	7	1	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2710	4	1	1	1540313768485	72
2711	4	2	1	1540313768485	450
2712	4	3	1	1540313768485	143.59
2713	4	4	1	1540313768485	6469
2714	4	5	1	1540313768485	56
2715	4	6	1	1540313768485	65
2716	4	7	1	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2717	1	1	2	1540313768485	72
2718	1	2	2	1540313768485	450
2719	1	3	2	1540313768485	146.96
2720	1	4	2	1540313768485	245
2721	1	5	2	1540313768485	64
2722	1	6	2	1540313768485	72
2723	1	7	2	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2724	2	1	2	1540313768485	72
2725	2	2	2	1540313768485	450
2726	2	3	2	1540313768485	137.9
2727	2	4	2	1540313768485	534
2728	2	5	2	1540313768485	65
2729	2	6	2	1540313768485	73
2730	2	7	2	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2731	3	1	2	1540313768485	72
2732	3	2	2	1540313768485	450
2733	3	3	2	1540313768485	152.32
2734	3	4	2	1540313768485	262
2735	3	5	2	1540313768485	62
2736	3	6	2	1540313768485	72
2737	3	7	2	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2738	4	1	2	1540313768485	72
2739	4	2	2	1540313768485	450
2740	4	3	2	1540313768485	142.59
2741	4	4	2	1540313768485	0
2742	4	5	2	1540313768485	59
2743	4	6	2	1540313768485	67
2744	4	7	2	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2745	1	1	3	1540313768485	72
2746	1	2	3	1540313768485	450
2747	1	3	3	1540313768485	140.25
2748	1	4	3	1540313768485	0
2749	1	5	3	1540313768485	64
2750	1	6	3	1540313768485	74
2751	1	7	3	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2752	2	1	3	1540313768485	72
2753	2	2	3	1540313768485	450
2754	2	3	3	1540313768485	145.95
2755	2	4	3	1540313768485	0
2756	2	5	3	1540313768485	62
2757	2	6	3	1540313768485	73
2758	2	7	3	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2759	3	1	3	1540313768485	72
2760	3	2	3	1540313768485	450
2761	3	3	3	1540313768485	138.91
2762	3	4	3	1540313768485	0
2763	3	5	3	1540313768485	64
2764	3	6	3	1540313768485	74
2765	3	7	3	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2766	4	1	3	1540313768485	72
2767	4	2	3	1540313768485	450
2768	4	3	3	1540313768485	140.58
2769	4	4	3	1540313768485	72
2770	4	5	3	1540313768485	61
2771	4	6	3	1540313768485	71
2772	4	7	3	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2773	1	1	4	1540313768485	72
2774	1	2	4	1540313768485	450
2775	1	3	4	1540313768485	158.03
2776	1	4	4	1540313768485	0
2777	1	5	4	1540313768485	60
2778	1	6	4	1540313768485	69
2779	1	7	4	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2780	2	1	4	1540313768485	72
2781	2	2	4	1540313768485	450
2782	2	3	4	1540313768485	144.94
2783	2	4	4	1540313768485	0
2784	2	5	4	1540313768485	59
2785	2	6	4	1540313768485	70
2786	2	7	4	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2787	3	1	4	1540313768485	72
2788	3	2	4	1540313768485	450
2789	3	3	4	1540313768485	158.36
2790	3	4	4	1540313768485	1
2791	3	5	4	1540313768485	61
2792	3	6	4	1540313768485	71
2793	3	7	4	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2794	4	1	4	1540313768485	72
2795	4	2	4	1540313768485	450
2796	4	3	4	1540313768485	147.63
2797	4	4	4	1540313768485	0
2798	4	5	4	1540313768485	62
2799	4	6	4	1540313768485	72
2800	4	7	4	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2801	1	1	5	1540313768485	72
2802	1	2	5	1540313768485	450
2803	1	3	5	1540313768485	137.89
2804	1	4	5	1540313768485	6900
2805	1	5	5	1540313768485	60
2806	1	6	5	1540313768485	68
2807	1	7	5	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2808	2	1	5	1540313768485	72
2809	2	2	5	1540313768485	450
2810	2	3	5	1540313768485	160.37
2811	2	4	5	1540313768485	3704
2812	2	5	5	1540313768485	61
2813	2	6	5	1540313768485	71
2814	2	7	5	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2815	3	1	5	1540313768485	72
2816	3	2	5	1540313768485	450
2817	3	3	5	1540313768485	145.28
2818	3	4	5	1540313768485	1495
2819	3	5	5	1540313768485	61
2820	3	6	5	1540313768485	69
2821	3	7	5	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2822	4	1	5	1540313768485	72
2823	4	2	5	1540313768485	450
2824	4	3	5	1540313768485	151.31
2825	4	4	5	1540313768485	11129
2826	4	5	5	1540313768485	59
2827	4	6	5	1540313768485	69
2828	4	7	5	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2829	1	1	6	1540313768485	72
2830	1	2	6	1540313768485	450
2831	1	3	6	1540313768485	145.95
2832	1	4	6	1540313768485	5719
2833	1	5	6	1540313768485	62
2834	1	6	6	1540313768485	70
2835	1	7	6	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2836	2	1	6	1540313768485	72
2837	2	2	6	1540313768485	450
2838	2	3	6	1540313768485	137.9
2839	2	4	6	1540313768485	7525
2840	2	5	6	1540313768485	64
2841	2	6	6	1540313768485	71
2842	2	7	6	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2843	3	1	6	1540313768485	72
2844	3	2	6	1540313768485	450
2845	3	3	6	1540313768485	149.98
2846	3	4	6	1540313768485	11066
2847	3	5	6	1540313768485	66
2848	3	6	6	1540313768485	75
2849	3	7	6	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2850	4	1	6	1540313768485	72
2851	4	2	6	1540313768485	450
2852	4	3	6	1540313768485	142.6
2853	4	4	6	1540313768485	11425
2854	4	5	6	1540313768485	65
2855	4	6	6	1540313768485	75
2856	4	7	6	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2857	1	1	7	1540313768485	72
2858	1	2	7	1540313768485	450
2859	1	3	7	1540313768485	131.86
2860	1	4	7	1540313768485	3200
2861	1	5	7	1540313768485	66
2862	1	6	7	1540313768485	74
2863	1	7	7	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2864	2	1	7	1540313768485	72
2865	2	2	7	1540313768485	450
2866	2	3	7	1540313768485	131.19
2867	2	4	7	1540313768485	6948
2868	2	5	7	1540313768485	64
2869	2	6	7	1540313768485	74
2870	2	7	7	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2871	3	1	7	1540313768485	72
2872	3	2	7	1540313768485	450
2873	3	3	7	1540313768485	137.56
2874	3	4	7	1540313768485	1925
2875	3	5	7	1540313768485	62
2876	3	6	7	1540313768485	71
2877	3	7	7	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2878	4	1	7	1540313768485	72
2879	4	2	7	1540313768485	450
2880	4	3	7	1540313768485	142.6
2881	4	4	7	1540313768485	4483
2882	4	5	7	1540313768485	62
2883	4	6	7	1540313768485	71
2884	4	7	7	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2885	1	1	8	1540313768485	72
2886	1	2	8	1540313768485	450
2887	1	3	8	1540313768485	160.38
2888	1	4	8	1540313768485	0
2889	1	5	8	1540313768485	63
2890	1	6	8	1540313768485	71
2891	1	7	8	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2892	2	1	8	1540313768485	72
2893	2	2	8	1540313768485	450
2894	2	3	8	1540313768485	146.96
2895	2	4	8	1540313768485	1
2896	2	5	8	1540313768485	65
2897	2	6	8	1540313768485	74
2898	2	7	8	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2899	3	1	8	1540313768485	72
2900	3	2	8	1540313768485	450
2901	3	3	8	1540313768485	155.01
2902	3	4	8	1540313768485	0
2903	3	5	8	1540313768485	64
2904	3	6	8	1540313768485	73
2905	3	7	8	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2906	4	1	8	1540313768485	72
2907	4	2	8	1540313768485	450
2908	4	3	8	1540313768485	146.29
2909	4	4	8	1540313768485	3
2910	4	5	8	1540313768485	61
2911	4	6	8	1540313768485	70
2912	4	7	8	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2913	1	1	9	1540313768485	72
2914	1	2	9	1540313768485	450
2915	1	3	9	1540313768485	153.67
2916	1	4	9	1540313768485	138
2917	1	5	9	1540313768485	63
2918	1	6	9	1540313768485	72
2919	1	7	9	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2920	2	1	9	1540313768485	72
2921	2	2	9	1540313768485	450
2922	2	3	9	1540313768485	140.58
2923	2	4	9	1540313768485	2300
2924	2	5	9	1540313768485	62
2925	2	6	9	1540313768485	72
2926	2	7	9	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2927	3	1	9	1540313768485	72
2928	3	2	9	1540313768485	450
2929	3	3	9	1540313768485	136.22
2930	3	4	9	1540313768485	1357
2931	3	5	9	1540313768485	63
2932	3	6	9	1540313768485	72
2933	3	7	9	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2934	4	1	9	1540313768485	72
2935	4	2	9	1540313768485	450
2936	4	3	9	1540313768485	155.01
2937	4	4	9	1540313768485	2315
2938	4	5	9	1540313768485	61
2939	4	6	9	1540313768485	71
2940	4	7	9	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2941	1	1	10	1540313768485	72
2942	1	2	10	1540313768485	450
2943	1	3	10	1540313768485	147.96
2944	1	4	10	1540313768485	1516
2945	1	5	10	1540313768485	63
2946	1	6	10	1540313768485	70
2947	1	7	10	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2948	2	1	10	1540313768485	72
2949	2	2	10	1540313768485	450
2950	2	3	10	1540313768485	152.33
2951	2	4	10	1540313768485	1273
2952	2	5	10	1540313768485	63
2953	2	6	10	1540313768485	69
2954	2	7	10	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2955	3	1	10	1540313768485	72
2956	3	2	10	1540313768485	450
2957	3	3	10	1540313768485	150.31
2958	3	4	10	1540313768485	1615
2959	3	5	10	1540313768485	63
2960	3	6	10	1540313768485	72
2961	3	7	10	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2962	4	1	10	1540313768485	72
2963	4	2	10	1540313768485	450
2964	4	3	10	1540313768485	146.62
2965	4	4	10	1540313768485	790
2966	4	5	10	1540313768485	61
2967	4	6	10	1540313768485	70
2968	4	7	10	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2969	1	1	11	1540313768485	72
2970	1	2	11	1540313768485	450
2971	1	3	11	1540313768485	152.66
2972	1	4	11	1540313768485	0
2973	1	5	11	1540313768485	63
2974	1	6	11	1540313768485	72
2975	1	7	11	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2976	2	1	11	1540313768485	72
2977	2	2	11	1540313768485	450
2978	2	3	11	1540313768485	141.59
2979	2	4	11	1540313768485	0
2980	2	5	11	1540313768485	63
2981	2	6	11	1540313768485	76
2982	2	7	11	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2983	3	1	11	1540313768485	72
2984	3	2	11	1540313768485	450
2985	3	3	11	1540313768485	144.61
2986	3	4	11	1540313768485	0
2987	3	5	11	1540313768485	62
2988	3	6	11	1540313768485	75
2989	3	7	11	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2990	4	1	11	1540313768485	72
2991	4	2	11	1540313768485	450
2992	4	3	11	1540313768485	143.6
2993	4	4	11	1540313768485	199
2994	4	5	11	1540313768485	60
2995	4	6	11	1540313768485	71
2996	4	7	11	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
2997	1	1	12	1540313768485	72
2998	1	2	12	1540313768485	450
2999	1	3	12	1540313768485	162.06
3000	1	4	12	1540313768485	2449
3001	1	5	12	1540313768485	63
3002	1	6	12	1540313768485	72
3003	1	7	12	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3004	2	1	12	1540313768485	72
3005	2	2	12	1540313768485	450
3006	2	3	12	1540313768485	149.98
3007	2	4	12	1540313768485	1634
3008	2	5	12	1540313768485	62
3009	2	6	12	1540313768485	71
3010	2	7	12	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3011	3	1	12	1540313768485	72
3012	3	2	12	1540313768485	450
3013	3	3	12	1540313768485	135.21
3014	3	4	12	1540313768485	3675
3015	3	5	12	1540313768485	62
3016	3	6	12	1540313768485	69
3017	3	7	12	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3018	4	1	12	1540313768485	72
3019	4	2	12	1540313768485	450
3020	4	3	12	1540313768485	157.69
3021	4	4	12	1540313768485	340
3022	4	5	12	1540313768485	61
3023	4	6	12	1540313768485	72
3024	4	7	12	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3025	1	1	14	1540313768485	72
3026	1	2	14	1540313768485	450
3027	1	3	14	1540313768485	151.65
3028	1	4	14	1540313768485	158
3029	1	5	14	1540313768485	62
3030	1	6	14	1540313768485	69
3031	1	7	14	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3032	2	1	14	1540313768485	72
3033	2	2	14	1540313768485	450
3034	2	3	14	1540313768485	145.61
3035	2	4	14	1540313768485	277
3036	2	5	14	1540313768485	59
3037	2	6	14	1540313768485	66
3038	2	7	14	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3039	3	1	14	1540313768485	72
3040	3	2	14	1540313768485	450
3041	3	3	14	1540313768485	143.6
3042	3	4	14	1540313768485	1883
3043	3	5	14	1540313768485	60
3044	3	6	14	1540313768485	68
3045	3	7	14	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3046	4	1	14	1540313768485	72
3047	4	2	14	1540313768485	450
3048	4	3	14	1540313768485	144.61
3049	4	4	14	1540313768485	2171
3050	4	5	14	1540313768485	57
3051	4	6	14	1540313768485	68
3052	4	7	14	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3053	1	1	15	1540313768485	72
3054	1	2	15	1540313768485	384
3055	1	3	15	1540313768485	125.95
3056	1	4	15	1540313768485	0
3057	1	5	15	1540313768485	48
3058	1	6	15	1540313768485	56
3059	1	7	15	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3060	2	1	15	1540313768485	72
3061	2	2	15	1540313768485	384
3062	2	3	15	1540313768485	125.8
3063	2	4	15	1540313768485	0
3064	2	5	15	1540313768485	47
3065	2	6	15	1540313768485	53
3066	2	7	15	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3067	3	1	15	1540313768485	72
3068	3	2	15	1540313768485	384
3069	3	3	15	1540313768485	126.17
3070	3	4	15	1540313768485	2
3071	3	5	15	1540313768485	45
3072	3	6	15	1540313768485	51
3073	3	7	15	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3074	4	1	15	1540313768485	72
3075	4	2	15	1540313768485	384
3076	4	3	15	1540313768485	126.16
3077	4	4	15	1540313768485	5
3078	4	5	15	1540313768485	44
3079	4	6	15	1540313768485	51
3080	4	7	15	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3081	1	1	16	1540313768485	72
3082	1	2	16	1540313768485	450
3083	1	3	16	1540313768485	149.64
3084	1	4	16	1540313768485	0
3085	1	5	16	1540313768485	63
3086	1	6	16	1540313768485	72
3087	1	7	16	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3088	2	1	16	1540313768485	72
3089	2	2	16	1540313768485	450
3090	2	3	16	1540313768485	140.92
3091	2	4	16	1540313768485	0
3092	2	5	16	1540313768485	61
3093	2	6	16	1540313768485	71
3094	2	7	16	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3095	3	1	16	1540313768485	72
3096	3	2	16	1540313768485	450
3097	3	3	16	1540313768485	131.86
3098	3	4	16	1540313768485	0
3099	3	5	16	1540313768485	61
3100	3	6	16	1540313768485	71
3101	3	7	16	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3102	4	1	16	1540313768485	72
3103	4	2	16	1540313768485	450
3104	4	3	16	1540313768485	142.26
3105	4	4	16	1540313768485	49
3106	4	5	16	1540313768485	57
3107	4	6	16	1540313768485	67
3108	4	7	16	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3109	1	1	17	1540313768485	72
3110	1	2	17	1540313768485	450
3111	1	3	17	1540313768485	139.91
3112	1	4	17	1540313768485	1917
3113	1	5	17	1540313768485	62
3114	1	6	17	1540313768485	71
3115	1	7	17	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3116	2	1	17	1540313768485	72
3117	2	2	17	1540313768485	450
3118	2	3	17	1540313768485	153.33
3119	2	4	17	1540313768485	2229
3120	2	5	17	1540313768485	60
3121	2	6	17	1540313768485	68
3122	2	7	17	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3123	3	1	17	1540313768485	72
3124	3	2	17	1540313768485	450
3125	3	3	17	1540313768485	138.57
3126	3	4	17	1540313768485	1475
3127	3	5	17	1540313768485	62
3128	3	6	17	1540313768485	70
3129	3	7	17	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3130	4	1	17	1540313768485	72
3131	4	2	17	1540313768485	450
3132	4	3	17	1540313768485	141.25
3133	4	4	17	1540313768485	1688
3134	4	5	17	1540313768485	58
3135	4	6	17	1540313768485	66
3136	4	7	17	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3137	1	1	18	1540313768485	72
3138	1	2	18	1540313768485	450
3139	1	3	18	1540313768485	135.21
3140	1	4	18	1540313768485	0
3141	1	5	18	1540313768485	59
3142	1	6	18	1540313768485	67
3143	1	7	18	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3144	2	1	18	1540313768485	72
3145	2	2	18	1540313768485	450
3146	2	3	18	1540313768485	140.92
3147	2	4	18	1540313768485	0
3148	2	5	18	1540313768485	59
3149	2	6	18	1540313768485	67
3150	2	7	18	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3151	3	1	18	1540313768485	72
3152	3	2	18	1540313768485	450
3153	3	3	18	1540313768485	147.96
3154	3	4	18	1540313768485	1
3155	3	5	18	1540313768485	62
3156	3	6	18	1540313768485	70
3157	3	7	18	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3158	4	1	18	1540313768485	72
3159	4	2	18	1540313768485	450
3160	4	3	18	1540313768485	138.23
3161	4	4	18	1540313768485	33
3162	4	5	18	1540313768485	61
3163	4	6	18	1540313768485	70
3164	4	7	18	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3165	1	1	19	1540313768485	72
3166	1	2	19	1540313768485	450
3167	1	3	19	1540313768485	151.32
3168	1	4	19	1540313768485	0
3169	1	5	19	1540313768485	63
3170	1	6	19	1540313768485	73
3171	1	7	19	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3172	2	1	19	1540313768485	72
3173	2	2	19	1540313768485	450
3174	2	3	19	1540313768485	136.55
3175	2	4	19	1540313768485	0
3176	2	5	19	1540313768485	62
3177	2	6	19	1540313768485	73
3178	2	7	19	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3179	3	1	19	1540313768485	72
3180	3	2	19	1540313768485	450
3181	3	3	19	1540313768485	137.22
3182	3	4	19	1540313768485	0
3183	3	5	19	1540313768485	64
3184	3	6	19	1540313768485	75
3185	3	7	19	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3186	4	1	19	1540313768485	72
3187	4	2	19	1540313768485	450
3188	4	3	19	1540313768485	149.97
3189	4	4	19	1540313768485	0
3190	4	5	19	1540313768485	58
3191	4	6	19	1540313768485	68
3192	4	7	19	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3193	1	1	20	1540313768485	72
3194	1	2	20	1540313768485	487
3195	1	3	20	1540313768485	161.05
3196	1	4	20	1540313768485	15
3197	1	5	20	1540313768485	63
3198	1	6	20	1540313768485	73
3199	1	7	20	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3200	2	1	20	1540313768485	72
3201	2	2	20	1540313768485	487
3202	2	3	20	1540313768485	166.42
3203	2	4	20	1540313768485	1
3204	2	5	20	1540313768485	62
3205	2	6	20	1540313768485	73
3206	2	7	20	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3207	3	1	20	1540313768485	72
3208	3	2	20	1540313768485	487
3209	3	3	20	1540313768485	159.04
3210	3	4	20	1540313768485	4
3211	3	5	20	1540313768485	64
3212	3	6	20	1540313768485	76
3213	3	7	20	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3214	4	1	20	1540313768485	72
3215	4	2	20	1540313768485	487
3216	4	3	20	1540313768485	149.31
3217	4	4	20	1540313768485	757
3218	4	5	20	1540313768485	60
3219	4	6	20	1540313768485	71
3220	4	7	20	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3221	1	1	21	1540313768485	72
3222	1	2	21	1540313768485	450
3223	1	3	21	1540313768485	163.4
3224	1	4	21	1540313768485	0
3225	1	5	21	1540313768485	61
3226	1	6	21	1540313768485	71
3227	1	7	21	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3228	2	1	21	1540313768485	72
3229	2	2	21	1540313768485	450
3230	2	3	21	1540313768485	143.27
3231	2	4	21	1540313768485	0
3232	2	5	21	1540313768485	59
3233	2	6	21	1540313768485	69
3234	2	7	21	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3235	3	1	21	1540313768485	72
3236	3	2	21	1540313768485	450
3237	3	3	21	1540313768485	153.33
3238	3	4	21	1540313768485	0
3239	3	5	21	1540313768485	58
3240	3	6	21	1540313768485	69
3241	3	7	21	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3242	4	1	21	1540313768485	72
3243	4	2	21	1540313768485	450
3244	4	3	21	1540313768485	150.65
3245	4	4	21	1540313768485	22
3246	4	5	21	1540313768485	57
3247	4	6	21	1540313768485	68
3248	4	7	21	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3249	1	1	22	1540313768485	72
3250	1	2	22	1540313768485	450
3251	1	3	22	1540313768485	144.94
3252	1	4	22	1540313768485	0
3253	1	5	22	1540313768485	65
3254	1	6	22	1540313768485	75
3255	1	7	22	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3256	2	1	22	1540313768485	72
3257	2	2	22	1540313768485	450
3258	2	3	22	1540313768485	151.32
3259	2	4	22	1540313768485	0
3260	2	5	22	1540313768485	62
3261	2	6	22	1540313768485	74
3262	2	7	22	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3263	3	1	22	1540313768485	72
3264	3	2	22	1540313768485	450
3265	3	3	22	1540313768485	147.63
3266	3	4	22	1540313768485	0
3267	3	5	22	1540313768485	60
3268	3	6	22	1540313768485	71
3269	3	7	22	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3270	4	1	22	1540313768485	72
3271	4	2	22	1540313768485	450
3272	4	3	22	1540313768485	143.27
3273	4	4	22	1540313768485	0
3274	4	5	22	1540313768485	59
3275	4	6	22	1540313768485	69
3276	4	7	22	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3277	1	1	23	1540313768485	72
3278	1	2	23	1540313768485	450
3279	1	3	23	1540313768485	147.34
3280	1	4	23	1540313768485	0
3281	1	5	23	1540313768485	52
3282	1	6	23	1540313768485	61
3283	1	7	23	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3284	2	1	23	1540313768485	72
3285	2	2	23	1540313768485	450
3286	2	3	23	1540313768485	148.25
3287	2	4	23	1540313768485	0
3288	2	5	23	1540313768485	49
3289	2	6	23	1540313768485	57
3290	2	7	23	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3291	3	1	23	1540313768485	72
3292	3	2	23	1540313768485	450
3293	3	3	23	1540313768485	147.81
3294	3	4	23	1540313768485	0
3295	3	5	23	1540313768485	49
3296	3	6	23	1540313768485	58
3297	3	7	23	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3298	4	1	23	1540313768485	72
3299	4	2	23	1540313768485	450
3300	4	3	23	1540313768485	147.56
3301	4	4	23	1540313768485	1
3302	4	5	23	1540313768485	49
3303	4	6	23	1540313768485	59
3304	4	7	23	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3305	1	1	24	1540313768485	72
3306	1	2	24	1540313768485	450
3307	1	3	24	1540313768485	157.01
3308	1	4	24	1540313768485	2
3309	1	5	24	1540313768485	64
3310	1	6	24	1540313768485	73
3311	1	7	24	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3312	2	1	24	1540313768485	72
3313	2	2	24	1540313768485	450
3314	2	3	24	1540313768485	143.59
3315	2	4	24	1540313768485	18
3316	2	5	24	1540313768485	64
3317	2	6	24	1540313768485	74
3318	2	7	24	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3319	3	1	24	1540313768485	72
3320	3	2	24	1540313768485	450
3321	3	3	24	1540313768485	134.54
3322	3	4	24	1540313768485	12
3323	3	5	24	1540313768485	62
3324	3	6	24	1540313768485	72
3325	3	7	24	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3326	4	1	24	1540313768485	72
3327	4	2	24	1540313768485	450
3328	4	3	24	1540313768485	141.92
3329	4	4	24	1540313768485	1627
3330	4	5	24	1540313768485	58
3331	4	6	24	1540313768485	67
3332	4	7	24	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3333	1	1	25	1540313768485	72
3334	1	2	25	1540313768485	450
3335	1	3	25	1540313768485	148.3
3336	1	4	25	1540313768485	0
3337	1	5	25	1540313768485	65
3338	1	6	25	1540313768485	76
3339	1	7	25	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3340	2	1	25	1540313768485	72
3341	2	2	25	1540313768485	450
3342	2	3	25	1540313768485	137.9
3343	2	4	25	1540313768485	0
3344	2	5	25	1540313768485	60
3345	2	6	25	1540313768485	69
3346	2	7	25	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3347	3	1	25	1540313768485	72
3348	3	2	25	1540313768485	450
3349	3	3	25	1540313768485	140.25
3350	3	4	25	1540313768485	0
3351	3	5	25	1540313768485	62
3352	3	6	25	1540313768485	71
3353	3	7	25	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
3354	4	1	25	1540313768485	72
3355	4	2	25	1540313768485	450
3356	4	3	25	1540313768485	146.62
3357	4	4	25	1540313768485	88
3358	4	5	25	1540313768485	60
3359	4	6	25	1540313768485	69
3360	4	7	25	1540313768485	oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
\.


--
-- Data for Name: entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entidad (id, tipo_e, cod_e, activo_e, created_at, updated_at) FROM stdin;
1	3	LOCACION_1	t	2018-10-11 01:32:21	2018-10-11 01:32:21
2	1	USUARIO_1	t	2018-10-11 01:32:21	2018-10-11 01:32:21
3	1	USUARIO_2	t	2018-10-11 01:32:21	2018-10-11 01:32:21
4	1	USUARIO_3	t	2018-10-11 01:32:21	2018-10-11 01:32:21
5	1	USUARIO_4	t	2018-10-11 01:32:21	2018-10-11 01:32:21
6	1	USUARIO_5	t	2018-10-11 01:32:22	2018-10-11 01:32:22
7	1	USUARIO_6	t	2018-10-11 01:32:22	2018-10-11 01:32:22
8	1	USUARIO_7	t	2018-10-11 01:32:22	2018-10-11 01:32:22
9	1	USUARIO_8	t	2018-10-11 01:32:22	2018-10-11 01:32:22
10	1	USUARIO_9	t	2018-10-11 01:32:22	2018-10-11 01:32:22
11	1	USUARIO_10	t	2018-10-11 01:32:22	2018-10-11 01:32:22
12	1	USUARIO_11	t	2018-10-11 01:32:22	2018-10-11 01:32:22
13	1	USUARIO_12	t	2018-10-11 01:32:22	2018-10-11 01:32:22
14	1	USUARIO_13	t	2018-10-11 01:32:23	2018-10-11 01:32:23
15	1	USUARIO_14	t	2018-10-11 01:32:23	2018-10-11 01:32:23
16	1	USUARIO_15	t	2018-10-11 01:32:23	2018-10-11 01:32:23
17	1	USUARIO_16	t	2018-10-11 01:32:23	2018-10-11 01:32:23
18	1	USUARIO_17	t	2018-10-11 01:32:23	2018-10-11 01:32:23
19	1	USUARIO_18	t	2018-10-11 01:32:23	2018-10-11 01:32:23
20	1	USUARIO_19	t	2018-10-11 01:32:23	2018-10-11 01:32:23
21	1	USUARIO_20	t	2018-10-11 01:32:23	2018-10-11 01:32:23
22	1	USUARIO_21	t	2018-10-11 01:32:24	2018-10-11 01:32:24
23	1	USUARIO_22	t	2018-10-11 01:32:24	2018-10-11 01:32:24
24	1	USUARIO_23	t	2018-10-11 01:32:24	2018-10-11 01:32:24
25	2	MAQUINA_1	f	2018-10-11 01:56:38	2018-10-11 01:56:38
26	2	MAQUINA_2	f	2018-10-11 01:56:38	2018-10-11 01:56:38
28	2	MAQUINA_4	f	2018-10-11 01:56:38	2018-10-11 01:56:38
29	2	MAQUINA_5	f	2018-10-11 01:56:39	2018-10-11 01:56:39
30	2	MAQUINA_6	f	2018-10-11 01:56:39	2018-10-11 01:56:39
31	2	MAQUINA_7	f	2018-10-11 01:56:39	2018-10-11 01:56:39
32	2	MAQUINA_8	f	2018-10-11 01:56:39	2018-10-11 01:56:39
35	2	MAQUINA_11	f	2018-10-11 01:56:39	2018-10-11 01:56:39
36	2	MAQUINA_12	f	2018-10-11 01:56:39	2018-10-11 01:56:39
37	2	MAQUINA_13	f	2018-10-11 01:56:39	2018-10-11 01:56:39
38	2	MAQUINA_14	f	2018-10-11 01:56:39	2018-10-11 01:56:39
40	2	MAQUINA_16	f	2018-10-11 01:56:40	2018-10-11 01:56:40
41	2	MAQUINA_17	f	2018-10-11 01:56:40	2018-10-11 01:56:40
42	2	MAQUINA_18	f	2018-10-11 01:56:40	2018-10-11 01:56:40
43	2	MAQUINA_19	f	2018-10-11 01:56:40	2018-10-11 01:56:40
44	2	MAQUINA_20	f	2018-10-11 01:56:40	2018-10-11 01:56:40
45	2	MAQUINA_21	f	2018-10-11 01:56:40	2018-10-11 01:56:40
46	2	MAQUINA_22	f	2018-10-11 01:56:40	2018-10-11 01:56:40
47	2	MAQUINA_23	f	2018-10-11 01:56:40	2018-10-11 01:56:40
48	2	MAQUINA_24	f	2018-10-11 01:56:40	2018-10-11 01:56:40
49	2	MAQUINA_25	f	2018-10-11 01:56:40	2018-10-11 01:56:40
34	2	MAQUINA_10	t	2018-10-11 01:56:39	2018-10-20 18:53:14
39	2	MAQUINA_15	t	2018-10-11 01:56:39	2018-10-20 19:24:07
27	2	MAQUINA_3	t	2018-10-11 01:56:38	2018-10-20 19:30:23
33	2	MAQUINA_9	t	2018-10-11 01:56:39	2018-10-20 19:31:28
51	1	USUARIO_24	f	2019-06-15 20:43:44	2019-06-15 20:43:44
52	1	USUARIO_25	f	2019-06-15 22:39:53	2019-06-15 22:39:53
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
46	2018_09_27_230552_create_entidad_schema	1
47	2018_09_27_230559_create_usuario_schema	1
48	2018_10_02_230909_create_worker_table	1
49	2018_10_02_230926_create_item_schema	1
50	2018_10_02_230927_create_item_worker_table	1
51	2018_10_02_230932_create_location_table	1
52	2018_10_03_141307_create_worker_info_schema	1
53	2018_10_04_080650_create_worker_info_campos_schema	1
54	2018_10_04_080845_create_worker_info_data_schema	1
55	2019_10_20_161629_cryptos	2
56	2019_10_20_175614_balances	3
58	2019_10_20_190726_tipo_movimientos	4
\.


--
-- Data for Name: params_api_movement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.params_api_movement (id, cod_api_mov, cod_api_param) FROM stdin;
\.


--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perfil (id, descripcion) FROM stdin;
1	administrador
2	tecnico
3	propietario
4	inversionista
\.


--
-- Data for Name: tipo_entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_entidad (id, descripcion) FROM stdin;
1	usuario
2	maquina
3	locacion
4	componente
5	evento
6	inversionista
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_e, correo, password, username, apelnomb, active, remember_token) FROM stdin;
3	orestesm20@gmail.com	$2y$10$AunrQRBr2nOGz5Ozd2uVxOzFkBkL3i5nEvJAxj1VWDNCmgvVSTUO.	ogutierrez	Orestes Gutierrez	t	\N
4	HUgc00dOSQ@gmail.com	$2y$10$kQh5chgGv5IzelZA18f/.eZXYN3nSXDqXD9/Tyq0QWUFerdwR1l/u	QtaRA23zxu	uNt8OssW6me Na0RF	f	\N
5	kgtfax2LA0@gmail.com	$2y$10$yts9uZZ2eJFKi.xmWr8O/.TcZGmn4EqczFuEfy5jDTKLZbItUGjZ.	EPvd2K6S6d	A4BCPDsl80r 0Vx4o	f	\N
6	utyZHCFAYZ@gmail.com	$2y$10$SW0B1B9Zm4p.eNpNdKLh/.b0Uj1DGcCugx00np7L02ISO4dm7/qdS	gRr2tOcSfH	wF9cB0VGwMp dkJTU	f	\N
7	8pU0wLHoaY@gmail.com	$2y$10$E90lc1Db5eYqiMd1SuB4DuiphWTUf/VLZCGZkn7O67e9HMvIuC1N6	IE61TW7fNX	YWlppANOcHq CZZt4	f	\N
8	M4WdSQfD4L@gmail.com	$2y$10$PsI7fSZh9vDm9koyqI4K6.yA4HkEH3CYe.hb9RTvw8xsOAeEZ6Q02	AM4pZ3E45J	7zPqHtRWUTH hHyuK	f	\N
9	gbHidjSW6z@gmail.com	$2y$10$St3zgTMUcPfq78bFzw7svecJ.g6jGO3Ri3pcX0WY.RvoGlQtiBkLq	fWyQG0MK7y	TGhwWjDTfTK 9QlWT	f	\N
10	OxfFoYiiXM@gmail.com	$2y$10$13XJc4V0vJrZBGiR2nHWiOvmGpukHkpmwVP7SA0aafUzQZkGP6iyu	7KB9Ok7HF3	NZDtP5zkdXU ydgLd	f	\N
11	0HIBl15VaR@gmail.com	$2y$10$XrZ6KqAhefXrFTiFxrhLyO2h20Phv0sowEpVoZgYK3wrYVpinCm5S	NBR8jaZk8u	QCNFhuntnF9 lbMGF	f	\N
12	dSu3gGjInO@gmail.com	$2y$10$9m0xXh1USk3/dNtey47lRefnv2dAZ.q8BisTdB5.AzN/3K2v7.LLC	21zZS0guyD	8BJLmNg5X89 dNkn7	f	\N
13	exxvNzp6UX@gmail.com	$2y$10$34KRYHNFD04q7md0lSCTLOm/iTH4LGaF7I./sTwCzhMeQArTv0m7W	Jok9Z5KrPP	WM0ZoeeyQyn 5XjtT	f	\N
14	MZZmR58D2o@gmail.com	$2y$10$qNt..Ja5Go./J.SrLTuZEuNZc.NYQoKX8ZRn9uJ7RIqc2m6qhIdXi	TEmWMy0PC9	xwnKg4g72W0 3eN2r	f	\N
15	xyxahabOVk@gmail.com	$2y$10$w8YMXyl3HI07okzvBOim5ewh16YbuyuCapbo2sahdG05F8lQv1g3i	wWWtw1O54a	gt1JdH24yNr zxN5a	f	\N
16	UYoRAslA45@gmail.com	$2y$10$WEJiaD7mzYHe7zZwdaiMVe5rar59D3kX93RdB.TatIm16BJTAljYu	da7NCdkhCH	qrbM4xVwGuC QIN3Q	f	\N
17	FSdd1X2InC@gmail.com	$2y$10$uNwyTfnJXWnZWMq/c79ba./qLBcg4jHrhO7IHvAP4pV6aFm./L2l6	7LJhjKNllw	CW193g7FM45 p1SdC	f	\N
18	7Z1ynNoxcT@gmail.com	$2y$10$r66haRuaJ6zZN27gFvsHE.mUCmj.arwUk1ZYSL0wFKCzSVHgdBJga	U0452viTf8	XRgTOa2rOv8 zbboo	f	\N
19	5B7u7O7Aa4@gmail.com	$2y$10$ul5aNmCdthmuOJ7lgJH3o.X.a07FhNznDBsdRnucFI.ApZQUtC.Ga	HEAOvhs7Hv	debPPutdnH9 hRsrE	f	\N
20	7ycCWHzHJQ@gmail.com	$2y$10$JwhTCq9VgZbHmUWi2g8S3e/pKQXnxOVwYSSwtMJtRT3FGQt9eZUlO	6fr0nUSRph	hqJ1gLox58o qVOev	f	\N
21	2YkzJOGTjK@gmail.com	$2y$10$VqovBBklMJzdGWuKVA0zFe3ViiqUu5DAETNjUzg5HzKdB1DrpuF/e	1gOknfM6aL	GYH2DMIOVFX cY6Z9	f	\N
22	clSXpUnIne@gmail.com	$2y$10$PJRw2M/ganbYQknjuH.seOTFuKpsWFYjH.76GgHux4XMNPJ1d7lMy	2eqcS0ybV1	3CKtah6pLh4 X4L2Y	f	\N
23	wISw4ICVfw@gmail.com	$2y$10$iGEu2U3dvq3BKynvs42hLOIbpm3ohywnbazmz.bQE84VpjxOLnKLa	v4ufIs7NU3	8A7Swb1ZvEp TA7uL	f	\N
24	eUYLIqzRb0@gmail.com	$2y$10$ncKQbMVYwd99mMAvjvO.4.15Y9EBsJd3bcQ8YE0RpN/grQ9uavxwS	RMTuJnqCDs	C2SkIx2sDQ1 FTNFB	f	\N
52	snavarro169@gmail.com	$2y$10$3MOHQhBzP7ds2Vfui0xuCOFTyLNAecSs1WCg2wtJ2IoByGFbybgQy	snavarro169@gmail.com	Ryan Philbert	f	\N
51	navarroca@gmail.com	$2y$10$D83ASViFPFgy1kf9PUfo/ugNSPXm2g1.ZqY/Yq41a1bvNRmnA45M2	navarroca@gmail.com	Angel Navarro	f	A3eM6Ca5vHmYeLl1SwR8U6O7O3UhHaFLYU1WlFLKHzJVmEmXIgk7UZzHZshx
2	snavarro169@gmail.com	$2y$10$uBOztP1W6qSfg7rLzv1kruzZKcxhMQZjE.ddKrBFPEPeS7D1ALvMa	rphilbert	Ryan Philbert	t	yOYcQi1oyFQijbYjlDjPHD60ZPnm14nDtBZzbMxHpzBz2Y8AAKSFgjlo4JZQ
\.


--
-- Data for Name: usuario_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_perfil (id, id_usuario, id_perfil, "default") FROM stdin;
1	2	1	t
2	3	1	t
3	4	3	t
4	5	3	t
5	6	3	t
6	7	3	t
7	8	3	t
8	9	3	t
9	10	3	t
10	11	3	t
11	12	3	t
12	13	3	t
13	14	3	t
14	15	3	t
15	16	3	t
16	17	3	t
17	18	3	t
18	19	3	t
19	20	3	t
20	21	3	t
21	22	3	t
22	23	3	t
23	24	3	t
24	51	4	t
\.


--
-- Data for Name: balances; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.balances (id, id_coin, quantity, status, id_inversionista, default_coin) FROM stdin;
1	1	0	t	2	t
2	1	0	t	3	t
\.


--
-- Data for Name: cryptos; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.cryptos (id, base, base_name, marketcap, supply, "timestamp", default_coin, estatus) FROM stdin;
2	ETH	Ethereum	19008730504.9038840808264104	108225078.8740000000000000	1571588797918	f	f
3	XRP	XRP	12789424974.4474058486038920	43242653330.0000000000000000	1571588797918	f	f
4	USDT	Tether	4159291408.4511028732372668	4108044456.1000000000000000	1571588797918	f	f
5	BCH	Bitcoin Cash	4054720524.9066839334393200	18067700.0000000000000000	1571588797918	f	f
6	LTC	Litecoin	3490292993.2026591494742711	63506716.6355418000000000	1571588797918	f	f
7	BNB	Binance Coin	2866242608.4635739258417342	155536713.0000000000000000	1571588797918	f	f
8	EOS	EOS	2756106350.2519627025446639	936678684.6150000000000000	1571588797918	f	f
9	BSV	Bitcoin SV	1656301212.2339040882835835	17854985.7508877000000000	1571588797918	f	f
10	XLM	Stellar	1281189744.2352231522889829	20034911425.8062000000000000	1571588797918	f	f
11	TRX	TRON	1043663229.3624214832862116	66682072191.4000000000000000	1571588797918	f	f
12	LEO	UNUS SED LEO	1028418775.1243799196230796	999498892.9000000000000000	1571588797918	f	f
13	ADA	Cardano	1027151018.1378134019574596	25927070538.0000000000000000	1571588797918	f	f
14	XMR	Monero	984115797.9825571953662128	17267781.4662160000000000	1571588797918	f	f
15	LINK	Chainlink	832370214.5827380900000000	350000000.0000000000000000	1571588797918	f	f
16	HT	Huobi Token	798656345.6607126888206824	234205522.9197690000000000	1571588797918	f	f
17	MIOTA	IOTA	763587882.1065290172681505	2779530283.0000000000000000	1571588797918	f	f
18	ATOM	Cosmos	694232278.2289125217328084	246035914.0000000000000000	1571588797918	f	f
19	DASH	Dash	634564867.0071744600280577	9105148.7225353700000000	1571588797918	f	f
20	XTZ	Tezos	581420183.2554346790732647	660373611.9727800000000000	1571588797918	f	f
21	ETC	Ethereum Classic	515744819.1565482743326704	114416596.0000000000000000	1571588797918	f	f
22	NEO	NEO	512903809.0724460727197570	70538831.0000000000000000	1571588797918	f	f
23	USDC	USD Coin	479541335.4079901459371872	474253082.6100580000000000	1571588797918	f	f
24	XEM	NEM	370916744.3271349284035169	8999999999.0000000000000000	1571588797918	f	f
25	DOGE	Dogecoin	331310519.6683906883819401	121703024507.5700000000000000	1571588797918	f	f
26	ONT	Ontology	315488373.4815224607896190	535851170.0000000000000000	1571588797918	f	f
27	BAT	Basic Attention Token	293498346.4146748983743921	1350948750.7463000000000000	1571588797918	f	f
28	ZEC	Zcash	282826013.0259775130300306	7670568.7500000000000000	1571588797918	f	f
29	PAX	Paxos Standard Token	239299224.4491530354553511	237000555.4098950000000000	1571588797918	f	f
30	ZRX	0x	207189915.1784233797390816	601198565.6340590000000000	1571588797918	f	f
31	TUSD	TrueUSD	187756553.1621013629926808	185904872.3000000000000000	1571588797918	f	f
32	VET	VeChain	185884841.6809505538163200	55454734800.0000000000000000	1571588797918	f	f
33	QTUM	Qtum	166815390.4791412007676547	96103676.0484598000000000	1571588797918	f	f
34	ABBC	ABBC Coin	162797607.4249166297113723	554307781.9698370000000000	1571588797918	f	f
35	HOT	Holo	160373633.1487127054083973	161377325137.0480000000000000	1571588797918	f	f
36	DCR	Decred	152871146.4005906987052479	10555450.1932216000000000	1571588797918	f	f
37	RVN	Ravencoin	147862314.4264256732965000	4674185000.0000000000000000	1571588797918	f	f
38	BTG	Bitcoin Gold	132259694.5712179485121184	17513923.5890000000000000	1571588797918	f	f
39	OMG	OmiseGO	115567991.3454605257045532	140245398.2451330000000000	1571588797918	f	f
40	NANO	Nano	111010754.9510289218668064	133248297.1970000000000000	1571588797918	f	f
41	LSK	Lisk	93998798.3610299636694359	121054772.5128210000000000	1571588797918	f	f
42	DGB	DigiByte	93686686.1629311789400506	12397385771.1897000000000000	1571588797918	f	f
43	ALGO	Algorand	93604329.8965899506028859	417923580.7708910000000000	1571588797918	f	f
44	REP	Augur	90366352.6044734763000000	11000000.0000000000000000	1571588797918	f	f
45	SC	Siacoin	86957534.8335188440881144	41817047634.0000000000000000	1571588797918	f	f
46	BCD	Bitcoin Diamond	86284299.6736868510266240	186492897.9530000000000000	1571588797918	f	f
47	DAI	Dai	85900533.6323368715379559	84297265.4875771000000000	1571588797918	f	f
48	WAVES	Waves	81284699.6342102200000000	100000000.0000000000000000	1571588797918	f	f
49	ICX	ICON	79091598.3636153780685580	500284811.7605750000000000	1571588797918	f	f
50	BTS	BitShares	72176253.8883691555800000	2746350000.0000000000000000	1571588797918	f	f
51	MONA	MonaCoin	71788153.5739449766620554	65729674.8711679000000000	1571588797918	f	f
52	KMD	Komodo	66138343.5188585659850903	116467955.1812800000000000	1571588797918	f	f
53	HC	HyperCash	62580655.1656687440964902	44384218.1290520000000000	1571588797918	f	f
54	THETA	Theta Token	59888189.8576971989464561	706502689.0000000000000000	1571588797918	f	f
55	MAID	MaidSafeCoin	58617597.1461773809223484	452552412.0000000000000000	1571588797918	f	f
56	BTM	Bytom	57748910.9607124313134200	1002499275.0000000000000000	1571588797918	f	f
57	XVG	Verge	56021388.0645198673323508	16003784809.1206000000000000	1571588797918	f	f
58	NEXO	Nexo	54645028.1767089089581588	560000011.0000000000000000	1571588797918	f	f
59	MCO	MCO	54399301.4397441707626146	15793831.0949625000000000	1571588797918	f	f
60	AE	Aeternity	53049549.3775143291521847	287766168.5000000000000000	1571588797918	f	f
61	IOST	IOST	52834466.0182659264506723	12013965608.8475000000000000	1571588797918	f	f
62	ARDR	Ardor	51151493.7880896719446885	998999495.0000000000000000	1571588797918	f	f
63	STEEM	Steem	50292372.9067508919463871	348370853.6310000000000000	1571588797918	f	f
64	CRPT	Crypterium	46799202.5471829964425366	83871024.0000001000000000	1571588797918	f	f
65	ZIL	Zilliqa	45900904.2735371799655207	8687360058.0875000000000000	1571588797918	f	f
66	GNT	Golem	45239653.0854302403050000	980050000.0000000000000000	1571588797918	f	f
67	ENJ	Enjin Coin	44603918.0683308399980431	784614641.5642640000000000	1571588797918	f	f
68	ELF	aelf	44193972.5834315397025536	534480199.9864660000000000	1571588797918	f	f
69	SNT	Status	43686211.9103020963917160	3470483788.0000000000000000	1571588797918	f	f
70	XZC	Zcoin	42752911.1955280217771675	8627793.3297779900000000	1571588797918	f	f
71	SEELE	Seele	38445337.6368133303840215	696655691.6617800000000000	1571588797918	f	f
72	TNT	Tierion	34534554.1838239280926684	428481269.4994200000000000	1571588797918	f	f
73	STRAT	Stratis	31999490.9078348297833702	99531797.1700453000000000	1571588797918	f	f
74	MANA	Decentraland	31319666.9342586392154880	1050141509.4260000000000000	1571588797918	f	f
75	KNC	Kyber Network	30946445.5350240835497742	168803152.2716590000000000	1571588797918	f	f
76	GXC	GXChain	30859815.7172787365000000	65000000.0000000000000000	1571588797918	f	f
77	ELA	Elastos	30338836.0807395243178558	16063886.6118376000000000	1571588797918	f	f
78	ZEN	Horizen	29807936.8381676673097350	7583350.0000000000000000	1571588797918	f	f
79	WTC	Waltonchain	29266490.6335000270546663	42651426.4106683000000000	1571588797918	f	f
80	FCT	Factom	28801867.2574682323090704	9824158.0400000000000000	1571588797918	f	f
81	LRC	Loopring	27161529.6301314731311422	905612452.8779660000000000	1571588797918	f	f
82	DX	DxChain Token	27140375.5039996670033358	49999999999.6862000000000000	1571588797918	f	f
83	CVC	Civic	26580560.1404112980000000	670000000.0000000000000000	1571588797918	f	f
84	ETP	Metaverse ETP	26014740.5243453417178989	76805715.8073375000000000	1571588797918	f	f
85	DGD	DigixDAO	25601462.7755067156000000	2000000.0000000000000000	1571588797918	f	f
86	RLC	iExec RLC	25145379.8326172435104931	80070793.2387674000000000	1571588797918	f	f
87	AION	Aion	24272471.5172580947115648	353888576.0000000000000000	1571588797918	f	f
88	NAS	Nebulas	24163037.2848585062261699	51952589.0000000000000000	1571588797918	f	f
89	GRIN	Grin	24069517.8619959470566800	23921640.0000000000000000	1571588797918	f	f
90	DENT	Dent	24045338.7635588018331296	75325838993.9659000000000000	1571588797918	f	f
91	NULS	NULS	24022246.7773799645256316	73770500.1589831000000000	1571588797918	f	f
92	FUN	FunFair	23268361.9336781675915866	6548879188.6634200000000000	1571588797918	f	f
93	ENG	Enigma	22921037.0627312641918158	74836171.0000000000000000	1571588797918	f	f
94	QASH	QASH	22671986.2498530800000000	350000000.0000000000000000	1571588797918	f	f
95	LOOM	Loom Network	22289487.7160401277090477	969644214.8474300000000000	1571588797918	f	f
96	PPT	Populous	21571978.6369713525757877	53252245.9943896000000000	1571588797918	f	f
97	BNT	Bancor	21464903.4447699914124600	62496246.4733746000000000	1571588797918	f	f
98	ARK	Ark	21443094.9370038911365440	113443488.0000000000000000	1571588797918	f	f
99	WAN	Wanchain	20926935.3774172953643024	106152492.6360000000000000	1571588797918	f	f
100	RCN	Ripio Credit Network	18673973.0516523714262629	509235326.7610900000000000	1571588797918	f	f
1	BTC	Bitcoin	146367073366.8557794034229350	18002825.0000000000000000	1571588797918	t	t
\.


--
-- Data for Name: exchange_coin; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.exchange_coin (id, id_coin, id_exchange) FROM stdin;
\.


--
-- Data for Name: exchanges; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.exchanges (id, description, url, estatus, api_url, api_private, image, color, default_exchange) FROM stdin;
3	Bittrex	https://global.bittrex.com/	t	https://api.bittrex.com/api/v1.1	https://api.bittrex.com/api/v1.1/account	https://global.bittrex.com/Content/img/intl/bittrex-logo-global-lg.svg	#13356B	f
2	Kraken	https://www.kraken.com	t	https://api.kraken.com/0/public	https://api.kraken.com/0/private/	https://www.cryptoninjas.net/wp-content/uploads/2017/12/krakenblue.png	#4E0070	f
1	Poloniex	https://poloniex.com/	t	https://poloniex.com/public	https://poloniex.com/tradingApi	https://21vhlk4eov752iobnb2tvbpj-wpengine.netdna-ssl.com/wp-content/uploads/2018/02/005-Poloniex.png	#00393B	t
\.


--
-- Data for Name: exchanges_usuario; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.exchanges_usuario (id, id_usuario, id_exchange, estatus, api_key, api_secret) FROM stdin;
7	2	1	t	eyJpdiI6IlBodjc1MjduTmgwWElHaDBQWm5XblE9PSIsInZhbHVlIjoiOTd2VWxBbjdIdk1ObUpIS0lDYk1cL2VNVVZWbVAybGo3ODUySVFKU09FbVZmNk43SG1LcW5zTVIyeVNOdjVqRjAiLCJtYWMiOiI5NjBiZjk1MzgxYTJjNGM0YjQ5NWEyNGFiMDAyODg4MWU3YmMzMGY1MWExMDU1YzEwYjhkNDUyNjNiZGFlZDVjIn0=	eyJpdiI6IlwvREd4K3ZOZ0ZzNFc1dmEwcTdrTmlnPT0iLCJ2YWx1ZSI6Ijd2cEsrSXI3QXhIMUlhVXhqVDhLV1dCaTlPTHZvSnpTeWJSVytuYWhGcGtVQmtGWnJ0NnBBT3NJcUFaODhiWVE0Q1dTOVYyeitjMDhYcE1WdHV3ZWlOdHBoeFdSTXJnUThERlBMSVpNY3NvNlU5RlpMcyswb0FrRjJYWW1hRFwvWnl0V1FaY1FmVFwvcmhTTEE2YTdzVlRwdTh4RU43OUZQUHdESldmcXlXNGd6QlE3SGFWZXNSNWduQ1wveEdINkZ0cyIsIm1hYyI6ImJiZDQ3ZDkzYzY1ZDBmZWYwMjA5ZTVhZTU3MDVjOWI2YmE4OGQ4YTBjOTQyOWI5ODgzNmYwMjEzNjBkZDUzNzQifQ==
\.


--
-- Data for Name: inversionista; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.inversionista (id, fondos, id_usuario, estatus, costo_promedio) FROM stdin;
2	0	51	t	0
3	0	2	t	8278.60201505000077
\.


--
-- Data for Name: movimientos; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.movimientos (id, coin_quote, coin_base, quantity, rate, tipo_movimiento, estatus, id_inversionista) FROM stdin;
\.


--
-- Data for Name: tipo_movimiento; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.tipo_movimiento (id, descripcion) FROM stdin;
\.


--
-- Data for Name: tipo_transaccion; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.tipo_transaccion (id, descripcion) FROM stdin;
1	RETIRO
2	DEPOSITO
\.


--
-- Data for Name: transacciones; Type: TABLE DATA; Schema: trading; Owner: postgres
--

COPY trading.transacciones (id, id_tipo_transaccion, id_inversionista, cantidad, comision, rate, fecha, costo_promedio, estatus) FROM stdin;
25	2	3	2	0	8278.60201505000077	2019-10-21 17:13:04.803803	8278.60201505000077	t
\.


--
-- Name: api_movement_params_id_seq; Type: SEQUENCE SET; Schema: api_engine; Owner: postgres
--

SELECT pg_catalog.setval('api_engine.api_movement_params_id_seq', 1, false);


--
-- Name: api_movements_id_seq; Type: SEQUENCE SET; Schema: api_engine; Owner: postgres
--

SELECT pg_catalog.setval('api_engine.api_movements_id_seq', 1, false);


--
-- Name: api_params_id_seq; Type: SEQUENCE SET; Schema: api_engine; Owner: postgres
--

SELECT pg_catalog.setval('api_engine.api_params_id_seq', 1, false);


--
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: mineria; Owner: postgres
--

SELECT pg_catalog.setval('mineria.item_id_seq', 1, false);


--
-- Name: item_worker_id_seq; Type: SEQUENCE SET; Schema: mineria; Owner: postgres
--

SELECT pg_catalog.setval('mineria.item_worker_id_seq', 1, false);


--
-- Name: tipo_item_id_seq; Type: SEQUENCE SET; Schema: mineria; Owner: postgres
--

SELECT pg_catalog.setval('mineria.tipo_item_id_seq', 1, false);


--
-- Name: worker_info_campos_id_seq; Type: SEQUENCE SET; Schema: mineria; Owner: postgres
--

SELECT pg_catalog.setval('mineria.worker_info_campos_id_seq', 7, true);


--
-- Name: worker_info_data_id_seq; Type: SEQUENCE SET; Schema: mineria; Owner: postgres
--

SELECT pg_catalog.setval('mineria.worker_info_data_id_seq', 3360, true);


--
-- Name: worker_info_id_seq; Type: SEQUENCE SET; Schema: mineria; Owner: postgres
--

SELECT pg_catalog.setval('mineria.worker_info_id_seq', 25, true);


--
-- Name: entidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entidad_id_seq', 52, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 58, true);


--
-- Name: params_api_movement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.params_api_movement_id_seq', 1, false);


--
-- Name: perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfil_id_seq', 3, true);


--
-- Name: tipo_entidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_entidad_id_seq', 5, true);


--
-- Name: usuario_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_perfil_id_seq', 24, true);


--
-- Name: balances_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.balances_id_seq', 2, true);


--
-- Name: cryptos_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.cryptos_id_seq', 100, true);


--
-- Name: exchange_coin_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.exchange_coin_id_seq', 1, false);


--
-- Name: exchanges_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.exchanges_id_seq', 1, false);


--
-- Name: exchanges_usuario_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.exchanges_usuario_id_seq', 7, true);


--
-- Name: inversionista_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.inversionista_id_seq', 3, true);


--
-- Name: movimientos_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.movimientos_id_seq', 1, false);


--
-- Name: tipo_movimiento_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.tipo_movimiento_id_seq', 1, false);


--
-- Name: tipo_transaccion_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.tipo_transaccion_id_seq', 1, false);


--
-- Name: transacciones_id_seq; Type: SEQUENCE SET; Schema: trading; Owner: postgres
--

SELECT pg_catalog.setval('trading.transacciones_id_seq', 25, true);


--
-- Name: api_movement_params api_movement_params_pkey; Type: CONSTRAINT; Schema: api_engine; Owner: postgres
--

ALTER TABLE ONLY api_engine.api_movement_params
    ADD CONSTRAINT api_movement_params_pkey PRIMARY KEY (id);


--
-- Name: api_movements api_movements_pkey; Type: CONSTRAINT; Schema: api_engine; Owner: postgres
--

ALTER TABLE ONLY api_engine.api_movements
    ADD CONSTRAINT api_movements_pkey PRIMARY KEY (id);


--
-- Name: api_params api_params_pkey; Type: CONSTRAINT; Schema: api_engine; Owner: postgres
--

ALTER TABLE ONLY api_engine.api_params
    ADD CONSTRAINT api_params_pkey PRIMARY KEY (id);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- Name: item_worker item_worker_pkey; Type: CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.item_worker
    ADD CONSTRAINT item_worker_pkey PRIMARY KEY (id);


--
-- Name: location location_cod_location_unique; Type: CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.location
    ADD CONSTRAINT location_cod_location_unique UNIQUE (cod_location);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id_e);


--
-- Name: tipo_item tipo_item_pkey; Type: CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.tipo_item
    ADD CONSTRAINT tipo_item_pkey PRIMARY KEY (id);


--
-- Name: worker_info_campos worker_info_campos_pkey; Type: CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info_campos
    ADD CONSTRAINT worker_info_campos_pkey PRIMARY KEY (id);


--
-- Name: worker_info_data worker_info_data_pkey; Type: CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info_data
    ADD CONSTRAINT worker_info_data_pkey PRIMARY KEY (id);


--
-- Name: worker_info worker_info_pkey; Type: CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info
    ADD CONSTRAINT worker_info_pkey PRIMARY KEY (id);


--
-- Name: worker worker_pkey; Type: CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (id_e);


--
-- Name: entidad entidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entidad
    ADD CONSTRAINT entidad_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: params_api_movement params_api_movement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.params_api_movement
    ADD CONSTRAINT params_api_movement_pkey PRIMARY KEY (id);


--
-- Name: perfil perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);


--
-- Name: tipo_entidad tipo_entidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_entidad
    ADD CONSTRAINT tipo_entidad_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_id_e_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_e_unique UNIQUE (id_e);


--
-- Name: usuario_perfil usuario_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_e);


--
-- Name: usuario usuario_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_username_unique UNIQUE (username);


--
-- Name: balances balances_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.balances
    ADD CONSTRAINT balances_pkey PRIMARY KEY (id);


--
-- Name: cryptos cryptos_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.cryptos
    ADD CONSTRAINT cryptos_pkey PRIMARY KEY (id);


--
-- Name: exchange_coin exchange_coin_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchange_coin
    ADD CONSTRAINT exchange_coin_pkey PRIMARY KEY (id);


--
-- Name: exchanges exchanges_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchanges
    ADD CONSTRAINT exchanges_pkey PRIMARY KEY (id);


--
-- Name: exchanges_usuario exchanges_usuario_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchanges_usuario
    ADD CONSTRAINT exchanges_usuario_pkey PRIMARY KEY (id);


--
-- Name: inversionista inversionista_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.inversionista
    ADD CONSTRAINT inversionista_pkey PRIMARY KEY (id);


--
-- Name: movimientos movimientos_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.movimientos
    ADD CONSTRAINT movimientos_pkey PRIMARY KEY (id);


--
-- Name: tipo_movimiento tipo_movimiento_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.tipo_movimiento
    ADD CONSTRAINT tipo_movimiento_pkey PRIMARY KEY (id);


--
-- Name: tipo_transaccion tipo_transaccion_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.tipo_transaccion
    ADD CONSTRAINT tipo_transaccion_pkey PRIMARY KEY (id);


--
-- Name: transacciones transacciones_pkey; Type: CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.transacciones
    ADD CONSTRAINT transacciones_pkey PRIMARY KEY (id);


--
-- Name: worker_info_data_fecha_ms_index; Type: INDEX; Schema: mineria; Owner: postgres
--

CREATE INDEX worker_info_data_fecha_ms_index ON mineria.worker_info_data USING btree (fecha_ms);


--
-- Name: worker_mac_address_index; Type: INDEX; Schema: mineria; Owner: postgres
--

CREATE INDEX worker_mac_address_index ON mineria.worker USING btree (mac_address);


--
-- Name: entidad_cod_e_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entidad_cod_e_index ON public.entidad USING btree (cod_e);


--
-- Name: usuario_correo_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_correo_index ON public.usuario USING btree (correo);


--
-- Name: api_movement_params api_movement_params_cod_api_movement_fkey; Type: FK CONSTRAINT; Schema: api_engine; Owner: postgres
--

ALTER TABLE ONLY api_engine.api_movement_params
    ADD CONSTRAINT api_movement_params_cod_api_movement_fkey FOREIGN KEY (cod_api_movement) REFERENCES api_engine.api_movements(id);


--
-- Name: api_movement_params api_movement_params_cod_param_fkey; Type: FK CONSTRAINT; Schema: api_engine; Owner: postgres
--

ALTER TABLE ONLY api_engine.api_movement_params
    ADD CONSTRAINT api_movement_params_cod_param_fkey FOREIGN KEY (cod_param) REFERENCES api_engine.api_params(id);


--
-- Name: api_movements api_movements_cod_exchange_fkey; Type: FK CONSTRAINT; Schema: api_engine; Owner: postgres
--

ALTER TABLE ONLY api_engine.api_movements
    ADD CONSTRAINT api_movements_cod_exchange_fkey FOREIGN KEY (cod_exchange) REFERENCES trading.exchanges(id);


--
-- Name: item item_tipo_item_foreign; Type: FK CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.item
    ADD CONSTRAINT item_tipo_item_foreign FOREIGN KEY (tipo_item) REFERENCES mineria.tipo_item(id);


--
-- Name: item_worker item_worker_id_item_foreign; Type: FK CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.item_worker
    ADD CONSTRAINT item_worker_id_item_foreign FOREIGN KEY (id_item) REFERENCES mineria.item(id);


--
-- Name: item_worker item_worker_id_worker_foreign; Type: FK CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.item_worker
    ADD CONSTRAINT item_worker_id_worker_foreign FOREIGN KEY (id_worker) REFERENCES mineria.worker(id_e);


--
-- Name: location location_id_e_foreign; Type: FK CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.location
    ADD CONSTRAINT location_id_e_foreign FOREIGN KEY (id_e) REFERENCES public.entidad(id);


--
-- Name: worker worker_id_e_foreign; Type: FK CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker
    ADD CONSTRAINT worker_id_e_foreign FOREIGN KEY (id_e) REFERENCES public.entidad(id);


--
-- Name: worker_info_data worker_info_data_id_wi_foreign; Type: FK CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info_data
    ADD CONSTRAINT worker_info_data_id_wi_foreign FOREIGN KEY (id_wi) REFERENCES mineria.worker_info(id);


--
-- Name: worker_info_data worker_info_data_id_wic_foreign; Type: FK CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info_data
    ADD CONSTRAINT worker_info_data_id_wic_foreign FOREIGN KEY (id_wic) REFERENCES mineria.worker_info_campos(id);


--
-- Name: worker_info worker_info_id_location_foreign; Type: FK CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info
    ADD CONSTRAINT worker_info_id_location_foreign FOREIGN KEY (id_location) REFERENCES mineria.location(id_e);


--
-- Name: worker_info worker_info_id_worker_foreign; Type: FK CONSTRAINT; Schema: mineria; Owner: postgres
--

ALTER TABLE ONLY mineria.worker_info
    ADD CONSTRAINT worker_info_id_worker_foreign FOREIGN KEY (id_worker) REFERENCES mineria.worker(id_e);


--
-- Name: entidad entidad_tipo_e_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entidad
    ADD CONSTRAINT entidad_tipo_e_foreign FOREIGN KEY (tipo_e) REFERENCES public.tipo_entidad(id);


--
-- Name: params_api_movement params_api_movement_cod_api_mov_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.params_api_movement
    ADD CONSTRAINT params_api_movement_cod_api_mov_fkey FOREIGN KEY (cod_api_mov) REFERENCES api_engine.api_movements(id);


--
-- Name: params_api_movement params_api_movement_cod_api_param_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.params_api_movement
    ADD CONSTRAINT params_api_movement_cod_api_param_fkey FOREIGN KEY (cod_api_param) REFERENCES api_engine.api_params(id);


--
-- Name: usuario usuario_id_e_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_e_foreign FOREIGN KEY (id_e) REFERENCES public.entidad(id);


--
-- Name: usuario_perfil usuario_perfil_id_perfil_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_perfil_foreign FOREIGN KEY (id_perfil) REFERENCES public.perfil(id);


--
-- Name: usuario_perfil usuario_perfil_id_usuario_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_usuario_foreign FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_e);


--
-- Name: balances balances_id_coin_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.balances
    ADD CONSTRAINT balances_id_coin_fkey FOREIGN KEY (id_coin) REFERENCES trading.cryptos(id);


--
-- Name: balances balances_id_inversionista_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.balances
    ADD CONSTRAINT balances_id_inversionista_fkey FOREIGN KEY (id_inversionista) REFERENCES trading.inversionista(id);


--
-- Name: exchange_coin exchange_coin_id_coin_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchange_coin
    ADD CONSTRAINT exchange_coin_id_coin_fkey FOREIGN KEY (id_coin) REFERENCES trading.cryptos(id);


--
-- Name: exchange_coin exchange_coin_id_exchange_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchange_coin
    ADD CONSTRAINT exchange_coin_id_exchange_fkey FOREIGN KEY (id_exchange) REFERENCES trading.exchanges(id);


--
-- Name: exchanges_usuario exchanges_usuario_id_exchange_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchanges_usuario
    ADD CONSTRAINT exchanges_usuario_id_exchange_fkey FOREIGN KEY (id_exchange) REFERENCES trading.exchanges(id);


--
-- Name: exchanges_usuario exchanges_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.exchanges_usuario
    ADD CONSTRAINT exchanges_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_e);


--
-- Name: inversionista fk_usuario_inversionista; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.inversionista
    ADD CONSTRAINT fk_usuario_inversionista FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_e);


--
-- Name: movimientos movimientos_coin_base_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.movimientos
    ADD CONSTRAINT movimientos_coin_base_fkey FOREIGN KEY (coin_base) REFERENCES trading.cryptos(id);


--
-- Name: movimientos movimientos_coin_quote_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.movimientos
    ADD CONSTRAINT movimientos_coin_quote_fkey FOREIGN KEY (coin_quote) REFERENCES trading.cryptos(id);


--
-- Name: movimientos movimientos_id_inversionista_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.movimientos
    ADD CONSTRAINT movimientos_id_inversionista_fkey FOREIGN KEY (id_inversionista) REFERENCES trading.inversionista(id);


--
-- Name: movimientos movimientos_tipo_movimiento_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.movimientos
    ADD CONSTRAINT movimientos_tipo_movimiento_fkey FOREIGN KEY (tipo_movimiento) REFERENCES trading.tipo_movimiento(id);


--
-- Name: transacciones transacciones_id_inversionista_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.transacciones
    ADD CONSTRAINT transacciones_id_inversionista_fkey FOREIGN KEY (id_inversionista) REFERENCES trading.inversionista(id);


--
-- Name: transacciones transacciones_id_tipo_transaccion_fkey; Type: FK CONSTRAINT; Schema: trading; Owner: postgres
--

ALTER TABLE ONLY trading.transacciones
    ADD CONSTRAINT transacciones_id_tipo_transaccion_fkey FOREIGN KEY (id_tipo_transaccion) REFERENCES trading.tipo_transaccion(id);


--
-- PostgreSQL database dump complete
--

