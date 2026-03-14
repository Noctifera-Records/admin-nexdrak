--
-- PostgreSQL database dump
--

\restrict xgVe07oGeRrihi67rl4jUfcQvIQGvpafTLkh9pW93URBrT2WM3ZSZJEh6EVfmMN

-- Dumped from database version 17.4
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: cleanup_old_auth_logs(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.cleanup_old_auth_logs() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    DELETE FROM auth_logs 
    WHERE created_at < NOW() - INTERVAL '90 days';
END;
$$;


ALTER FUNCTION public.cleanup_old_auth_logs() OWNER TO postgres;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  INSERT INTO public.profiles (id, username, role, avatar_url)
  VALUES (
    new.id, 
    new.raw_user_meta_data->>'username', 
    COALESCE(new.raw_user_meta_data->>'role', 'user'), -- Default role is 'user'
    new.raw_user_meta_data->>'avatar_url'
  )
  ON CONFLICT (id) DO NOTHING;
  RETURN new;
END;
$$;


ALTER FUNCTION public.handle_new_user() OWNER TO postgres;

--
-- Name: increment_download_count(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.increment_download_count(download_id integer) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  UPDATE downloads 
  SET download_count = download_count + 1 
  WHERE id = download_id;
END;
$$;


ALTER FUNCTION public.increment_download_count(download_id integer) OWNER TO postgres;

--
-- Name: update_downloads_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_downloads_updated_at() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_downloads_updated_at() OWNER TO postgres;

--
-- Name: update_events_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_events_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_events_updated_at_column() OWNER TO postgres;

--
-- Name: update_merch_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_merch_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_merch_updated_at_column() OWNER TO postgres;

--
-- Name: update_settings_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_settings_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_settings_updated_at_column() OWNER TO postgres;

--
-- Name: update_streaming_links_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_streaming_links_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_streaming_links_updated_at() OWNER TO postgres;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO postgres;

--
-- Name: validate_password_strength(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_password_strength(password text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    -- Validar longitud mínima
    IF LENGTH(password) < 8 THEN
        RETURN FALSE;
    END IF;
    
    -- Validar que contenga al menos una letra mayúscula
    IF password !~ '[A-Z]' THEN
        RETURN FALSE;
    END IF;
    
    -- Validar que contenga al menos una letra minúscula
    IF password !~ '[a-z]' THEN
        RETURN FALSE;
    END IF;
    
    -- Validar que contenga al menos un número
    IF password !~ '[0-9]' THEN
        RETURN FALSE;
    END IF;
    
    RETURN TRUE;
END;
$$;


ALTER FUNCTION public.validate_password_strength(password text) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id text NOT NULL,
    account_id text NOT NULL,
    provider_id text NOT NULL,
    user_id text NOT NULL,
    access_token text,
    refresh_token text,
    id_token text,
    access_token_expires_at timestamp without time zone,
    refresh_token_expires_at timestamp without time zone,
    scope text,
    password text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: auth_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_logs (
    id integer NOT NULL,
    user_id uuid,
    event_type text NOT NULL,
    ip_address inet,
    user_agent text,
    success boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.auth_logs OWNER TO postgres;

--
-- Name: auth_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_logs_id_seq OWNER TO postgres;

--
-- Name: auth_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_logs_id_seq OWNED BY public.auth_logs.id;


--
-- Name: downloads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.downloads (
    id integer NOT NULL,
    title text NOT NULL,
    description text,
    file_url text NOT NULL,
    file_type text,
    file_size text,
    category text,
    cover_image_url text,
    is_public boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.downloads OWNER TO postgres;

--
-- Name: downloads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.downloads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.downloads_id_seq OWNER TO postgres;

--
-- Name: downloads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.downloads_id_seq OWNED BY public.downloads.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    title text NOT NULL,
    description text,
    date timestamp with time zone NOT NULL,
    location text,
    venue text,
    ticket_url text,
    image_url text,
    is_featured boolean DEFAULT false,
    is_published boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: hero_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hero_content (
    id integer NOT NULL,
    title text NOT NULL,
    subtitle text,
    description text,
    background_image_url text,
    cta_text text,
    cta_url text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.hero_content OWNER TO postgres;

--
-- Name: hero_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hero_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hero_content_id_seq OWNER TO postgres;

--
-- Name: hero_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hero_content_id_seq OWNED BY public.hero_content.id;


--
-- Name: merch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merch (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    image_url text,
    purchase_url text,
    category text,
    stock integer DEFAULT 0,
    is_available boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.merch OWNER TO postgres;

--
-- Name: merch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.merch_id_seq OWNER TO postgres;

--
-- Name: merch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merch_id_seq OWNED BY public.merch.id;


--
-- Name: page_sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_sections (
    id integer NOT NULL,
    section_name text NOT NULL,
    title text,
    subtitle text,
    content text,
    is_visible boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.page_sections OWNER TO postgres;

--
-- Name: page_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.page_sections_id_seq OWNER TO postgres;

--
-- Name: page_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_sections_id_seq OWNED BY public.page_sections.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id text NOT NULL,
    username text,
    role text DEFAULT 'user'::text,
    avatar_url text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT profiles_role_check CHECK ((role = ANY (ARRAY['user'::text, 'admin'::text])))
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: releases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.releases (
    id integer NOT NULL,
    title text NOT NULL,
    release_date date,
    cover_image_url text,
    stream_url text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.releases OWNER TO postgres;

--
-- Name: releases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.releases_id_seq OWNER TO postgres;

--
-- Name: releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.releases_id_seq OWNED BY public.releases.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    id text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    token text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ip_address text,
    user_agent text,
    user_id text NOT NULL,
    impersonated_by text
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_settings (
    id bigint NOT NULL,
    key text NOT NULL,
    value text,
    description text,
    type text DEFAULT 'text'::text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.site_settings OWNER TO postgres;

--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.site_settings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.site_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    title text NOT NULL,
    artist text NOT NULL,
    album_name text,
    cover_image_url text,
    release_date date,
    type text,
    slug text,
    stream_url text,
    youtube_embed_id text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT songs_type_check CHECK ((type = ANY (ARRAY['album'::text, 'single'::text])))
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.songs_id_seq OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: streaming_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.streaming_links (
    id integer NOT NULL,
    song_id integer NOT NULL,
    platform text NOT NULL,
    url text NOT NULL,
    is_primary boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.streaming_links OWNER TO postgres;

--
-- Name: streaming_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.streaming_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.streaming_links_id_seq OWNER TO postgres;

--
-- Name: streaming_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.streaming_links_id_seq OWNED BY public.streaming_links.id;


--
-- Name: twoFactor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."twoFactor" (
    id text NOT NULL,
    secret text NOT NULL,
    "backupCodes" text NOT NULL,
    "userId" text NOT NULL
);


ALTER TABLE public."twoFactor" OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    email_verified boolean NOT NULL,
    image text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role text,
    banned boolean,
    ban_reason text,
    ban_expires timestamp without time zone,
    two_factor_enabled boolean DEFAULT false
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification (
    id text NOT NULL,
    identifier text NOT NULL,
    value text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.verification OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2026_03_09; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_09 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_09 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_10; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_10 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_10 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_11; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_11 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_11 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_12; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_12 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_12 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_13; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_13 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_13 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_14; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_14 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_14 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_15; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_15 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_15 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: messages_2026_03_09; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_09 FOR VALUES FROM ('2026-03-09 00:00:00') TO ('2026-03-10 00:00:00');


--
-- Name: messages_2026_03_10; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_10 FOR VALUES FROM ('2026-03-10 00:00:00') TO ('2026-03-11 00:00:00');


--
-- Name: messages_2026_03_11; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_11 FOR VALUES FROM ('2026-03-11 00:00:00') TO ('2026-03-12 00:00:00');


--
-- Name: messages_2026_03_12; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_12 FOR VALUES FROM ('2026-03-12 00:00:00') TO ('2026-03-13 00:00:00');


--
-- Name: messages_2026_03_13; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_13 FOR VALUES FROM ('2026-03-13 00:00:00') TO ('2026-03-14 00:00:00');


--
-- Name: messages_2026_03_14; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_14 FOR VALUES FROM ('2026-03-14 00:00:00') TO ('2026-03-15 00:00:00');


--
-- Name: messages_2026_03_15; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_15 FOR VALUES FROM ('2026-03-15 00:00:00') TO ('2026-03-16 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: auth_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_logs ALTER COLUMN id SET DEFAULT nextval('public.auth_logs_id_seq'::regclass);


--
-- Name: downloads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.downloads ALTER COLUMN id SET DEFAULT nextval('public.downloads_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: hero_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_content ALTER COLUMN id SET DEFAULT nextval('public.hero_content_id_seq'::regclass);


--
-- Name: merch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merch ALTER COLUMN id SET DEFAULT nextval('public.merch_id_seq'::regclass);


--
-- Name: page_sections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_sections ALTER COLUMN id SET DEFAULT nextval('public.page_sections_id_seq'::regclass);


--
-- Name: releases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.releases ALTER COLUMN id SET DEFAULT nextval('public.releases_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Name: streaming_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streaming_links ALTER COLUMN id SET DEFAULT nextval('public.streaming_links_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	5c8ef179-078c-4969-a916-8bdfb1ec6d19	{"action":"user_signedup","actor_id":"b966ff5c-f3eb-429f-9563-93ee6e557200","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-07-22 19:19:29.384517+00	
00000000-0000-0000-0000-000000000000	79665877-8a1c-45c6-b6e9-a6f1627b3099	{"action":"login","actor_id":"b966ff5c-f3eb-429f-9563-93ee6e557200","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 19:19:29.395323+00	
00000000-0000-0000-0000-000000000000	d1acde1f-37fa-42f7-b52b-e4d6cbc97b67	{"action":"user_recovery_requested","actor_id":"b966ff5c-f3eb-429f-9563-93ee6e557200","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 19:19:29.429594+00	
00000000-0000-0000-0000-000000000000	5c277ca2-9aa6-4a46-8572-0784b2381cf7	{"action":"login","actor_id":"b966ff5c-f3eb-429f-9563-93ee6e557200","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 19:19:39.690379+00	
00000000-0000-0000-0000-000000000000	92588191-af93-42bb-a3a5-84434d02cf3a	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"tnexdrak@gmail.com","user_id":"b966ff5c-f3eb-429f-9563-93ee6e557200","user_phone":""}}	2025-07-22 19:46:06.650119+00	
00000000-0000-0000-0000-000000000000	ca720818-6a9d-47c6-a12e-97c3d16ea9d5	{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"tnexdrak@gmail.com","user_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14"}}	2025-07-22 19:46:57.524638+00	
00000000-0000-0000-0000-000000000000	2cf10232-c80a-4d54-917a-ba1c599005a1	{"action":"user_signedup","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-07-22 19:47:24.13079+00	
00000000-0000-0000-0000-000000000000	356547fc-5d4b-4e58-81b3-b1f63054bfb9	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 20:25:16.042534+00	
00000000-0000-0000-0000-000000000000	88886e04-02c6-4049-91af-e4c6955909a0	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 20:25:39.573859+00	
00000000-0000-0000-0000-000000000000	de515b3d-fd96-4ab4-856f-cdf2af6f672e	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"recovery"}}	2025-07-22 20:25:45.332851+00	
00000000-0000-0000-0000-000000000000	44f15e06-e337-442b-a6d6-e722280ce020	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 20:31:02.955728+00	
00000000-0000-0000-0000-000000000000	b9c9104f-fb69-4f00-bdb3-0c145c0d7a7b	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 20:31:36.529268+00	
00000000-0000-0000-0000-000000000000	3330e71e-add2-45eb-84d9-022b94041b83	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-22 21:23:50.713558+00	
00000000-0000-0000-0000-000000000000	cb5ca801-1233-4401-a45d-a51e777698c5	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-22 21:23:50.714326+00	
00000000-0000-0000-0000-000000000000	f5586235-d59d-4733-9fbf-fb0b53ee211a	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 21:40:02.809732+00	
00000000-0000-0000-0000-000000000000	9c3a6fc0-e6a3-427e-951b-64b082d01b42	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 21:40:11.964851+00	
00000000-0000-0000-0000-000000000000	76ef1ebb-b481-483b-a8ec-8bfb3afc3fe6	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"recovery"}}	2025-07-22 21:40:17.763049+00	
00000000-0000-0000-0000-000000000000	7dd520f3-2612-4c4e-9d41-6bae97f29ef4	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 21:56:50.12389+00	
00000000-0000-0000-0000-000000000000	4348ee52-4f40-4bb9-a697-420df250f130	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 21:57:01.782748+00	
00000000-0000-0000-0000-000000000000	010dfcb3-0d75-44a6-bdb1-8b4276d904f8	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 22:01:18.037134+00	
00000000-0000-0000-0000-000000000000	f8046dc1-452c-41d0-a5d7-33dc77454836	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 22:01:27.273052+00	
00000000-0000-0000-0000-000000000000	2e05c617-ad9b-4b9f-bba2-79456144508d	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"recovery"}}	2025-07-22 22:01:35.704904+00	
00000000-0000-0000-0000-000000000000	388276ec-a153-4f86-a89d-87d80a63b6e7	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 22:33:49.03287+00	
00000000-0000-0000-0000-000000000000	67aab1cc-f902-443e-ad36-22e3f736a702	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 22:36:18.970998+00	
00000000-0000-0000-0000-000000000000	30a439ea-97ea-4f06-a039-4aeac9227ae2	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 22:36:26.872471+00	
00000000-0000-0000-0000-000000000000	e49e7805-c088-4bfc-aba3-e54be88294eb	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 22:46:09.109547+00	
00000000-0000-0000-0000-000000000000	1c49c4a7-2083-4c49-b260-a0dd528741f9	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 22:50:13.875889+00	
00000000-0000-0000-0000-000000000000	6d3cd71d-d190-449f-b3c7-377f706c883b	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 22:50:22.92131+00	
00000000-0000-0000-0000-000000000000	ac253fbf-6b41-4c2b-88d7-f0a9a9fe16be	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"recovery"}}	2025-07-22 22:50:24.414903+00	
00000000-0000-0000-0000-000000000000	6d06e921-6fad-4095-899b-9b1cfe9e8ef9	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 22:53:34.168817+00	
00000000-0000-0000-0000-000000000000	78ac373c-b041-441d-900a-b2aa03e13392	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 22:53:53.054611+00	
00000000-0000-0000-0000-000000000000	81ba806c-8be1-4337-8586-0f8db64cebfb	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"recovery"}}	2025-07-22 22:53:57.883368+00	
00000000-0000-0000-0000-000000000000	f43f5df0-7eca-44de-a3ac-d422559673a0	{"action":"user_recovery_requested","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 22:56:27.575902+00	
00000000-0000-0000-0000-000000000000	984979aa-6305-46c3-bc73-df3aaf4b08ee	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 22:56:41.077949+00	
00000000-0000-0000-0000-000000000000	c314be66-7fd4-4656-89ff-1412cdaa4b8c	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"recovery"}}	2025-07-22 22:56:45.554854+00	
00000000-0000-0000-0000-000000000000	39164677-f010-40fc-b1fa-28081521bb4c	{"action":"user_updated_password","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 22:58:11.522337+00	
00000000-0000-0000-0000-000000000000	4f60e620-0fcc-48c3-ad06-e415727820e7	{"action":"user_modified","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-07-22 22:58:11.523156+00	
00000000-0000-0000-0000-000000000000	8d353464-9d5b-4f46-bad1-d5ee586b5c14	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 22:58:35.376327+00	
00000000-0000-0000-0000-000000000000	a85a9ac2-d494-44e7-ab99-7b3ef6f15af5	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 22:58:47.048946+00	
00000000-0000-0000-0000-000000000000	5ff61084-225d-46af-9996-ff37e4cb6182	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 22:59:18.88169+00	
00000000-0000-0000-0000-000000000000	8695b112-0289-468c-b8d5-73d375bd41bd	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 22:59:28.154717+00	
00000000-0000-0000-0000-000000000000	989a6214-d101-498e-bc88-7b4afe612aab	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 22:59:29.86794+00	
00000000-0000-0000-0000-000000000000	b16e3283-cca4-41e4-9a6e-af90511575bd	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 22:59:32.31345+00	
00000000-0000-0000-0000-000000000000	c065a1e1-0b70-4eee-9a2b-662c080413d7	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 23:44:27.40386+00	
00000000-0000-0000-0000-000000000000	8f2d8419-ef8d-41c6-8ca4-4a3793ec00b6	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 23:44:55.76845+00	
00000000-0000-0000-0000-000000000000	d6ed0bca-0885-43e1-8603-f1a4bd1d02d2	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 23:46:04.20207+00	
00000000-0000-0000-0000-000000000000	83e74012-6c81-41a5-947f-bdfe7ecaf1aa	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 23:46:15.720462+00	
00000000-0000-0000-0000-000000000000	25c71642-5f21-4797-9cb0-83613e94bca4	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 23:46:21.420153+00	
00000000-0000-0000-0000-000000000000	335952dd-6e4c-44a3-b729-9c62138af2ba	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-22 23:47:08.326419+00	
00000000-0000-0000-0000-000000000000	6af15458-21b7-4773-8182-02547c31cf19	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-22 23:56:03.29227+00	
00000000-0000-0000-0000-000000000000	70995efe-26b2-407f-9327-4e5ab3867792	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 00:28:20.564577+00	
00000000-0000-0000-0000-000000000000	a32d4264-3379-43e1-8505-6cf9b32ed629	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-23 00:31:28.177715+00	
00000000-0000-0000-0000-000000000000	7d7510bb-3302-4063-97d1-80b8c80ef87c	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 05:35:14.647662+00	
00000000-0000-0000-0000-000000000000	3d78865b-7a10-4004-8535-5586ea94028c	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-23 05:37:15.983039+00	
00000000-0000-0000-0000-000000000000	60588668-8c33-4736-be01-fc5f36283661	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 06:10:33.738619+00	
00000000-0000-0000-0000-000000000000	2e5df0bc-bd74-42fb-ba1e-e779629756f0	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-23 06:11:29.986274+00	
00000000-0000-0000-0000-000000000000	818f06df-cbe2-4d49-82ac-cb1cfcb27920	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 06:33:22.625679+00	
00000000-0000-0000-0000-000000000000	fbd2bac0-af46-4ce2-af08-520c1ff4a8bd	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 17:39:29.64742+00	
00000000-0000-0000-0000-000000000000	b4dc8789-07eb-4d9c-b5aa-3972a7ed1f84	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 17:39:29.649725+00	
00000000-0000-0000-0000-000000000000	dc30484f-279d-4181-879c-75bd34cb8426	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-23 17:49:49.093459+00	
00000000-0000-0000-0000-000000000000	8244a863-e89d-4dc5-8d0b-a3af407d94e2	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 18:21:11.709721+00	
00000000-0000-0000-0000-000000000000	a15b392d-7edc-4415-8587-e72014104859	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 19:19:43.623064+00	
00000000-0000-0000-0000-000000000000	8f5be914-e892-4dff-8235-3993f23c1c47	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 19:19:43.623876+00	
00000000-0000-0000-0000-000000000000	c7236be2-8d10-45f7-aa11-bbee9a2a9888	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 20:19:24.038855+00	
00000000-0000-0000-0000-000000000000	956e3f02-7d4a-46f1-8e03-31e8c26e0174	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 20:19:24.042945+00	
00000000-0000-0000-0000-000000000000	b883664f-d746-4d80-be14-d3b5abffeee1	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 21:17:36.225785+00	
00000000-0000-0000-0000-000000000000	8dfceaab-2eed-4b85-97dc-0c5eb81e582c	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 21:17:36.226591+00	
00000000-0000-0000-0000-000000000000	fb61e5e0-991e-4887-85d2-a1834ce19ae1	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 22:16:29.495896+00	
00000000-0000-0000-0000-000000000000	cf9351b7-cbb1-466f-b065-2d5b2d541a8b	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 22:16:29.5007+00	
00000000-0000-0000-0000-000000000000	51199ff1-8a08-40a5-ab85-d91b609a8ea7	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 23:15:29.881501+00	
00000000-0000-0000-0000-000000000000	1c5ae5be-27d1-405e-9f65-582eec8410e8	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-23 23:15:29.882358+00	
00000000-0000-0000-0000-000000000000	4f0d1e3e-dafe-472e-a6dd-b10a82ac7639	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-24 00:14:29.8312+00	
00000000-0000-0000-0000-000000000000	fa1dc076-f4cf-4710-a491-ac617572d858	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-24 00:14:29.832014+00	
00000000-0000-0000-0000-000000000000	bd5ec350-76f0-43db-8095-14346ad87d42	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-24 01:12:54.622319+00	
00000000-0000-0000-0000-000000000000	53db2208-6db1-4a8e-924f-263ee693b0af	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-24 01:12:54.623253+00	
00000000-0000-0000-0000-000000000000	a71c4f67-5f43-4563-9225-2da4ed075715	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-24 01:18:17.887892+00	
00000000-0000-0000-0000-000000000000	b9e299ee-6e45-4c71-9106-f2297e5c6b47	{"action":"user_signedup","actor_id":"492c27b3-287b-4b74-aed4-cc0ef4a869a4","actor_username":"aurel283@mechanicspedia.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-07-24 03:44:23.547352+00	
00000000-0000-0000-0000-000000000000	a3f4b348-f585-4f67-a0b1-1202425bc348	{"action":"login","actor_id":"492c27b3-287b-4b74-aed4-cc0ef4a869a4","actor_username":"aurel283@mechanicspedia.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-24 03:44:23.561076+00	
00000000-0000-0000-0000-000000000000	7af17bee-3d7a-4681-ae77-97ac9e4ed010	{"action":"logout","actor_id":"492c27b3-287b-4b74-aed4-cc0ef4a869a4","actor_username":"aurel283@mechanicspedia.com","actor_via_sso":false,"log_type":"account"}	2025-07-24 03:45:25.849396+00	
00000000-0000-0000-0000-000000000000	d7392ac0-b296-4dcb-af23-694d7c989b10	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-24 03:46:20.901566+00	
00000000-0000-0000-0000-000000000000	f0fd1035-9c2c-467d-942c-68a263a1bfac	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-07-24 04:02:39.118646+00	
00000000-0000-0000-0000-000000000000	bb035cf5-338e-46eb-92ad-faf45d3397b9	{"action":"login","actor_id":"492c27b3-287b-4b74-aed4-cc0ef4a869a4","actor_username":"aurel283@mechanicspedia.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-24 04:02:54.98494+00	
00000000-0000-0000-0000-000000000000	6c4ec105-b1ad-4072-9ff2-2c8f6bc68fc0	{"action":"logout","actor_id":"492c27b3-287b-4b74-aed4-cc0ef4a869a4","actor_username":"aurel283@mechanicspedia.com","actor_via_sso":false,"log_type":"account"}	2025-07-24 04:05:05.448094+00	
00000000-0000-0000-0000-000000000000	50b38b96-df39-4001-a1b2-ec6db5603109	{"action":"login","actor_id":"492c27b3-287b-4b74-aed4-cc0ef4a869a4","actor_username":"aurel283@mechanicspedia.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-24 04:29:59.68536+00	
00000000-0000-0000-0000-000000000000	a3fd2c5f-dd98-42e8-aa79-c94a924c82a3	{"action":"token_refreshed","actor_id":"492c27b3-287b-4b74-aed4-cc0ef4a869a4","actor_username":"aurel283@mechanicspedia.com","actor_via_sso":false,"log_type":"token"}	2025-07-24 05:53:37.694954+00	
00000000-0000-0000-0000-000000000000	ffdd7e1f-f83d-4862-86f7-978ce9d71137	{"action":"token_revoked","actor_id":"492c27b3-287b-4b74-aed4-cc0ef4a869a4","actor_username":"aurel283@mechanicspedia.com","actor_via_sso":false,"log_type":"token"}	2025-07-24 05:53:37.701883+00	
00000000-0000-0000-0000-000000000000	a2439d51-654b-4659-8059-2d29e716027e	{"action":"logout","actor_id":"492c27b3-287b-4b74-aed4-cc0ef4a869a4","actor_username":"aurel283@mechanicspedia.com","actor_via_sso":false,"log_type":"account"}	2025-07-24 06:10:08.64127+00	
00000000-0000-0000-0000-000000000000	6fbaf7f9-87c6-426f-858b-06fac1fe27f5	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-25 01:12:53.693586+00	
00000000-0000-0000-0000-000000000000	219cfb09-6908-457e-bec0-5e9472767d96	{"action":"user_signedup","actor_id":"595f24e8-481d-42a8-b3d3-63c2bf393ed4","actor_username":"asdmnalksfasf@qwrdsq","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-07-25 01:22:05.417341+00	
00000000-0000-0000-0000-000000000000	37b58159-3ab0-4359-8916-f3d73d4db0e1	{"action":"login","actor_id":"595f24e8-481d-42a8-b3d3-63c2bf393ed4","actor_username":"asdmnalksfasf@qwrdsq","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-25 01:22:05.42505+00	
00000000-0000-0000-0000-000000000000	a9a6861d-c235-488b-9289-bd2261636494	{"action":"logout","actor_id":"595f24e8-481d-42a8-b3d3-63c2bf393ed4","actor_username":"asdmnalksfasf@qwrdsq","actor_via_sso":false,"log_type":"account"}	2025-07-25 01:22:24.201889+00	
00000000-0000-0000-0000-000000000000	2077d33a-9022-433b-9d46-b599f1a82f48	{"action":"user_signedup","actor_id":"54ce5918-3dcd-4e1b-aabc-676a33b15323","actor_username":"lautarobravo96@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-07-25 01:22:37.818055+00	
00000000-0000-0000-0000-000000000000	b521b04b-6f69-4311-9d90-9573e1669f60	{"action":"login","actor_id":"54ce5918-3dcd-4e1b-aabc-676a33b15323","actor_username":"lautarobravo96@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-25 01:22:37.822753+00	
00000000-0000-0000-0000-000000000000	d3b750d0-d8f0-4602-9a6e-c292a7a415ff	{"action":"login","actor_id":"54ce5918-3dcd-4e1b-aabc-676a33b15323","actor_username":"lautarobravo96@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-25 01:22:48.250375+00	
00000000-0000-0000-0000-000000000000	5e5aec15-2917-4d93-b113-6bb3d282625f	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 02:11:31.322676+00	
00000000-0000-0000-0000-000000000000	4993674f-5c0e-47d7-8560-c7446bd4aaa7	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 02:11:31.329977+00	
00000000-0000-0000-0000-000000000000	cb1de3be-3600-46c6-8864-f20ac10b0cdb	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 03:10:01.17853+00	
00000000-0000-0000-0000-000000000000	1dacadc5-63a9-4e59-b885-379d4ae7c1af	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 03:10:01.1819+00	
00000000-0000-0000-0000-000000000000	ef1d49f5-c994-41cb-97fe-36dc09e2f8b6	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 04:08:26.768911+00	
00000000-0000-0000-0000-000000000000	91be076c-eb01-4e3c-817d-0f784c77d6d2	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 04:08:26.769724+00	
00000000-0000-0000-0000-000000000000	01a9b77f-93e4-439c-bc44-fd23680c2913	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 05:06:52.515828+00	
00000000-0000-0000-0000-000000000000	f1ac7aef-6e86-4ae0-abb7-016cfc571208	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 05:06:52.517199+00	
00000000-0000-0000-0000-000000000000	d9af54cd-5c75-4436-a609-4b16739dff0b	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 06:05:36.710294+00	
00000000-0000-0000-0000-000000000000	a361ce93-e640-4e06-b80d-dba66b4273ce	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 06:05:36.711632+00	
00000000-0000-0000-0000-000000000000	87ce77c6-9d68-4283-865e-0d30e3009b13	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 07:05:09.634652+00	
00000000-0000-0000-0000-000000000000	79013111-dbfc-408f-8fc0-d586403a5295	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 07:05:09.639391+00	
00000000-0000-0000-0000-000000000000	780853a5-5fe6-4eee-9207-45913da7254d	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 08:04:13.456552+00	
00000000-0000-0000-0000-000000000000	939516b3-6e8c-471c-a452-34ff1a32cf84	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 08:04:13.459803+00	
00000000-0000-0000-0000-000000000000	d65124e2-33c2-4cd1-bb73-4642301e29d3	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 09:03:14.745166+00	
00000000-0000-0000-0000-000000000000	e42cc5c9-73bb-41ed-a014-da9b3831108c	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 09:03:14.752437+00	
00000000-0000-0000-0000-000000000000	4fd66989-c893-4252-b0cc-ae43c0281598	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 10:02:14.755587+00	
00000000-0000-0000-0000-000000000000	7cb77523-3d34-4878-8817-4936863a896b	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 10:02:14.758433+00	
00000000-0000-0000-0000-000000000000	11ec05e2-809a-4033-b438-e2e086b6cee0	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 11:01:09.793282+00	
00000000-0000-0000-0000-000000000000	368059cc-9422-4caf-8a3b-ac8eec0e1da9	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 11:01:09.794812+00	
00000000-0000-0000-0000-000000000000	6655e153-cd12-4ba1-b625-af5d7b7e372e	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 11:59:59.785334+00	
00000000-0000-0000-0000-000000000000	2245fe6a-9025-4e80-b6f0-8ecc853ed4f2	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 11:59:59.787961+00	
00000000-0000-0000-0000-000000000000	4c9dbdaf-fda3-4b81-9209-beb4fb1f9144	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 12:58:59.74802+00	
00000000-0000-0000-0000-000000000000	4346c74a-343f-47e2-b790-4e2c9df96ffd	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 12:58:59.750889+00	
00000000-0000-0000-0000-000000000000	8b063168-eb46-42ed-a938-ca3ea096a451	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 13:57:59.794611+00	
00000000-0000-0000-0000-000000000000	446907d5-472a-4a39-b926-c498de99dedb	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 13:57:59.796606+00	
00000000-0000-0000-0000-000000000000	7ade19ba-125b-4a1e-9f01-2f4ca860aae1	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 14:57:09.650425+00	
00000000-0000-0000-0000-000000000000	ba5b515e-8a71-48c1-aa56-8348080e21c3	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 14:57:09.652609+00	
00000000-0000-0000-0000-000000000000	69ef37dd-9fe8-40fb-b2e6-58d6faf0af34	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 15:56:13.86245+00	
00000000-0000-0000-0000-000000000000	634c064c-a050-45b7-9a72-22ceccb1b1ea	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 15:56:13.86473+00	
00000000-0000-0000-0000-000000000000	6245938c-19cb-45d2-a198-e6b11c2865de	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 16:55:13.819873+00	
00000000-0000-0000-0000-000000000000	e43f1d52-ef62-4429-8f35-359bfa8f1597	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 16:55:13.822841+00	
00000000-0000-0000-0000-000000000000	14a17d73-4938-4ce5-aca3-b0f9c0a18875	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 17:54:13.555966+00	
00000000-0000-0000-0000-000000000000	0fbaf34f-7081-4fa4-983f-ee7b99800944	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 17:54:13.557453+00	
00000000-0000-0000-0000-000000000000	e2f2f675-a52f-4763-b475-ac815e934a3c	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 18:53:14.867806+00	
00000000-0000-0000-0000-000000000000	be150ed5-3f18-4317-a61f-1ffc4b073776	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 18:53:14.873008+00	
00000000-0000-0000-0000-000000000000	8832a52b-64be-43a3-a7c1-8a4bffae82d4	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 19:52:42.807879+00	
00000000-0000-0000-0000-000000000000	7236d713-8dc3-4072-8068-31c1c3c243dd	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 19:52:42.809914+00	
00000000-0000-0000-0000-000000000000	cc5b2ee1-40c5-4518-a293-567305a0a41f	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 20:51:59.139381+00	
00000000-0000-0000-0000-000000000000	494b2fe9-357e-4bc1-a5d2-6e225dcc9827	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 20:51:59.140229+00	
00000000-0000-0000-0000-000000000000	e95d4a37-8225-457b-b4f3-1c028fd1c253	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 21:51:09.831288+00	
00000000-0000-0000-0000-000000000000	0953f04b-cfff-46a4-b967-cc8962e2f43d	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 21:51:09.83211+00	
00000000-0000-0000-0000-000000000000	37d3cf5a-031f-4aeb-9a73-34efa2f053b3	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 22:50:09.757315+00	
00000000-0000-0000-0000-000000000000	46e5d3f3-9c04-4bb7-b26b-9bd284887def	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-25 22:50:09.761568+00	
00000000-0000-0000-0000-000000000000	b1cd6bf0-1294-405b-a487-a5a2014ef662	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-30 21:54:02.47987+00	
00000000-0000-0000-0000-000000000000	4a5a8cf3-2166-480a-b181-c76d643d9a55	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-30 21:54:02.499482+00	
00000000-0000-0000-0000-000000000000	d999bd40-3b49-436b-864a-5287a5945f98	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-30 23:03:53.896902+00	
00000000-0000-0000-0000-000000000000	04be7e21-48c9-4e46-b032-2f5ad87e812c	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-30 23:03:53.904898+00	
00000000-0000-0000-0000-000000000000	d4ef9819-47d2-4102-87e6-e6e3cc689b1a	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 00:02:43.926579+00	
00000000-0000-0000-0000-000000000000	3f220335-f318-4b17-9a4e-1bb111487595	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 00:02:43.943293+00	
00000000-0000-0000-0000-000000000000	a7bdcdca-06f9-49d0-8983-4ac07bd78276	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 01:05:32.284623+00	
00000000-0000-0000-0000-000000000000	9018564a-8790-4fda-b6bf-342e908755eb	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 01:05:32.294741+00	
00000000-0000-0000-0000-000000000000	dbaf991c-cfee-44bc-b963-7653bc59816e	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 05:40:07.856494+00	
00000000-0000-0000-0000-000000000000	76e378cd-a000-4cbe-adc0-c4dd5c3f7d4e	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 05:40:07.870003+00	
00000000-0000-0000-0000-000000000000	64ce4beb-84a6-4808-aef4-df2d152c1038	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 06:38:43.054268+00	
00000000-0000-0000-0000-000000000000	891c726d-f457-45d0-942c-f0851a9fb10b	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 06:38:43.060995+00	
00000000-0000-0000-0000-000000000000	a824dfda-b19f-4c5b-8edf-a6029066a3c1	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 07:37:11.282127+00	
00000000-0000-0000-0000-000000000000	c075ff10-09fd-4795-a9a5-09fc4bab901c	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 07:37:11.294832+00	
00000000-0000-0000-0000-000000000000	c5790628-c598-4ef2-b423-306b8b8317c2	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 08:35:47.141236+00	
00000000-0000-0000-0000-000000000000	c510ff8d-7321-4c54-bf69-42e67d3bc980	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-07-31 08:35:47.148365+00	
00000000-0000-0000-0000-000000000000	bb0e3b94-b65a-4159-9d34-aaac42265c55	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-01 00:17:29.077084+00	
00000000-0000-0000-0000-000000000000	63b93b0d-8516-442d-9830-ccb3b148d695	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-01 00:17:29.092678+00	
00000000-0000-0000-0000-000000000000	4d9d1c7e-42e6-4a43-9754-b4273f6d7fe5	{"action":"token_refreshed","actor_id":"54ce5918-3dcd-4e1b-aabc-676a33b15323","actor_username":"lautarobravo96@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-01 00:31:31.065719+00	
00000000-0000-0000-0000-000000000000	b2ff8f9a-0e04-467f-b6aa-287b801d5371	{"action":"token_revoked","actor_id":"54ce5918-3dcd-4e1b-aabc-676a33b15323","actor_username":"lautarobravo96@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-01 00:31:31.071507+00	
00000000-0000-0000-0000-000000000000	9a34b1a4-ed67-4412-9fdb-d6480bbb4923	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-01 23:30:27.923894+00	
00000000-0000-0000-0000-000000000000	20609467-6676-48f1-9c04-a9779407d1f0	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-01 23:30:27.942241+00	
00000000-0000-0000-0000-000000000000	5f1db738-e988-45ed-9435-3c419459c335	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-07 04:55:00.440488+00	
00000000-0000-0000-0000-000000000000	0c04739d-16c9-4975-a371-ad9acfdc5b61	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-07 04:55:00.452718+00	
00000000-0000-0000-0000-000000000000	815f9a45-8b13-4e25-9824-4421f7538e52	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-07 18:34:45.317403+00	
00000000-0000-0000-0000-000000000000	b8a6a994-76ef-4d7b-bb92-11e50c277e63	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-07 18:34:45.337459+00	
00000000-0000-0000-0000-000000000000	9ab9f890-204a-4e6d-adda-b1f11fddeb9c	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-07 19:33:55.579796+00	
00000000-0000-0000-0000-000000000000	a0efa5b3-9758-47a7-a9a5-740e2906e902	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-07 19:33:55.589542+00	
00000000-0000-0000-0000-000000000000	5fae2c6f-5640-4741-a658-928c1ccffe46	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-08 00:13:00.488787+00	
00000000-0000-0000-0000-000000000000	af181a78-a3f6-491f-96f9-9b90dc8fdb5b	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-08 00:13:00.492583+00	
00000000-0000-0000-0000-000000000000	4fc0b0b2-345a-4d4b-8ca4-8b2496d2820c	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-08-08 00:13:09.594489+00	
00000000-0000-0000-0000-000000000000	56a81596-8cb9-4540-9a33-a8345b9cf8c2	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-24 19:21:53.172858+00	
00000000-0000-0000-0000-000000000000	b1074f9f-09cc-4dc9-85f1-f955ec63f081	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-24 20:20:26.398425+00	
00000000-0000-0000-0000-000000000000	12e54eb1-e713-457d-9bba-b0a12aff38eb	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-24 20:20:26.410121+00	
00000000-0000-0000-0000-000000000000	45ce3126-1e37-448e-82a8-12a3f756e0ab	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-24 21:18:44.010874+00	
00000000-0000-0000-0000-000000000000	b0d1ff9d-5de4-4565-9701-e173c2a50d62	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-24 21:18:44.041556+00	
00000000-0000-0000-0000-000000000000	bd363784-8578-461f-9f6c-fb75f7ccf46f	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-24 22:17:14.016057+00	
00000000-0000-0000-0000-000000000000	029e88ac-0102-4e4c-a8be-3f2648a27e2b	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-24 22:17:14.036909+00	
00000000-0000-0000-0000-000000000000	3d717d50-bf21-47f4-89f4-d0eab3015fa3	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-24 23:15:44.105345+00	
00000000-0000-0000-0000-000000000000	d4c348aa-290c-46b0-ae63-31cb45d1ca67	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-24 23:15:44.122012+00	
00000000-0000-0000-0000-000000000000	282429c5-6fcf-4ed5-ae4f-c56888099c54	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 00:14:14.027507+00	
00000000-0000-0000-0000-000000000000	53af38de-0f7d-4a1b-9140-6c83979f0745	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 00:14:14.047183+00	
00000000-0000-0000-0000-000000000000	d1cd2e98-aa61-4365-b012-2aa8c88bd00e	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 01:13:11.507893+00	
00000000-0000-0000-0000-000000000000	53704b64-ce5f-4ceb-82c8-8ca4ba68802f	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 01:13:11.529465+00	
00000000-0000-0000-0000-000000000000	0425cb23-bbbd-46de-84ca-3b9434c6cba4	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 02:12:35.408208+00	
00000000-0000-0000-0000-000000000000	0517d4c8-df10-414a-a334-967bb443628d	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 02:12:35.433718+00	
00000000-0000-0000-0000-000000000000	2d06771e-5fa2-4cd3-8960-28b9f9b1edeb	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 03:11:12.423898+00	
00000000-0000-0000-0000-000000000000	2ade3c6f-9877-44f2-9cab-479bd212cbbc	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 03:11:12.443797+00	
00000000-0000-0000-0000-000000000000	9f20c54d-ecec-44f3-99c5-e13eedbc9a65	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 04:10:35.45733+00	
00000000-0000-0000-0000-000000000000	6b31183b-6b59-4355-8cac-7fde4cc0ee0e	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 04:10:35.473932+00	
00000000-0000-0000-0000-000000000000	f4fc58d8-019c-4460-a011-d9dd6e140c8f	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 05:09:35.533136+00	
00000000-0000-0000-0000-000000000000	a69125a9-86c4-4c82-a442-899a5d5525b9	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 05:09:35.559386+00	
00000000-0000-0000-0000-000000000000	6287e8eb-b512-4dd2-b632-e1a04268f912	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 06:08:11.450296+00	
00000000-0000-0000-0000-000000000000	732ceabf-4a04-4290-a654-c4e26fb4af7a	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 06:08:11.47356+00	
00000000-0000-0000-0000-000000000000	12f96f03-d362-4097-96f7-14eb74900973	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 07:06:56.248533+00	
00000000-0000-0000-0000-000000000000	3722b81f-c479-4ac7-94e2-b97f74415a9f	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 07:06:56.265672+00	
00000000-0000-0000-0000-000000000000	7ce9c365-ae71-44d1-9ff7-c768a52fd9c1	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 08:05:35.418288+00	
00000000-0000-0000-0000-000000000000	50d5ab22-9500-4a8d-a33c-3d97353ee0ce	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 08:05:35.440042+00	
00000000-0000-0000-0000-000000000000	59ef8658-869b-478d-93a0-41115547eb91	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 09:04:35.435254+00	
00000000-0000-0000-0000-000000000000	e77583e7-2d73-4ced-b3db-787389d2635b	{"action":"logout","actor_id":"4e4e656f-d559-4708-a7df-d46fa8e8ccb8","actor_username":"test1a@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-02-01 20:13:16.047034+00	
00000000-0000-0000-0000-000000000000	0c69d546-eb79-4882-b665-45a2d939ec4a	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-08-25 09:04:35.457189+00	
00000000-0000-0000-0000-000000000000	171cb462-0029-4b56-8af6-b16d44eea477	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 02:47:07.933464+00	
00000000-0000-0000-0000-000000000000	c21f9512-2ecd-4d9c-af1e-373ce90b7a37	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 02:47:07.949956+00	
00000000-0000-0000-0000-000000000000	bc933daa-3640-4235-869b-fe36703a89dd	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-27 22:52:24.587285+00	
00000000-0000-0000-0000-000000000000	994f85ea-f1d8-49be-a241-655daf73a2ba	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-27 22:52:24.616974+00	
00000000-0000-0000-0000-000000000000	d287f77d-e95b-4a38-832b-7e12a13d3121	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 17:47:51.186924+00	
00000000-0000-0000-0000-000000000000	d55f9829-e33f-40c1-90dc-566881aca00e	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 17:47:51.216986+00	
00000000-0000-0000-0000-000000000000	4d9e3c8f-b80b-4cd6-a782-cff9af821632	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 18:47:21.601943+00	
00000000-0000-0000-0000-000000000000	8202f5db-056a-4728-9170-1c4f34040245	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 18:47:21.62883+00	
00000000-0000-0000-0000-000000000000	6da594a3-872c-404e-991a-57a718d36e9b	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 19:47:21.102165+00	
00000000-0000-0000-0000-000000000000	8f26921e-8ccf-4d2c-bec6-8f7a91f21b0f	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 19:47:21.121761+00	
00000000-0000-0000-0000-000000000000	f1e195d6-fa3f-4799-80cf-29c078cf1636	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 20:47:21.887855+00	
00000000-0000-0000-0000-000000000000	e89671aa-bc41-482c-8b88-aaadbfb1cad9	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 20:47:21.900276+00	
00000000-0000-0000-0000-000000000000	3417cb89-7000-466a-9847-464fe4427a40	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 21:47:21.880816+00	
00000000-0000-0000-0000-000000000000	437e8aff-f639-43b6-9f4f-3a1d80962ed5	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 21:47:21.903484+00	
00000000-0000-0000-0000-000000000000	d70b4ce0-27e4-422b-a933-849e75a8634b	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 22:47:21.916335+00	
00000000-0000-0000-0000-000000000000	54663c86-174c-4667-8430-9f2e455c41d4	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 22:47:21.932436+00	
00000000-0000-0000-0000-000000000000	15a9e697-2556-40c5-9015-7efb1de102e9	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-28 23:31:10.870686+00	
00000000-0000-0000-0000-000000000000	527db5ce-e991-44c9-a25e-ef5297962874	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-12-28 23:33:24.838284+00	
00000000-0000-0000-0000-000000000000	ffdf7773-1606-40c4-94d3-eefdae68132f	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-29 00:47:00.256568+00	
00000000-0000-0000-0000-000000000000	ac0fab63-4bba-4703-9d0b-f77c1c1aa66b	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-12-29 01:40:12.910151+00	
00000000-0000-0000-0000-000000000000	8abd292d-aeb3-42b4-812f-69cbd1b03e5e	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-29 02:01:30.071803+00	
00000000-0000-0000-0000-000000000000	c05e7100-74c3-4396-b586-dbc47cd452b3	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 03:00:25.662533+00	
00000000-0000-0000-0000-000000000000	a97e3587-1c0b-4695-958b-6952fe01b411	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 03:00:25.693453+00	
00000000-0000-0000-0000-000000000000	27a637aa-2b84-43d3-bad1-09c1588e09ac	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 03:59:18.264687+00	
00000000-0000-0000-0000-000000000000	015956e4-bbf6-47df-9ddd-7743a04f8e94	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 03:59:18.279182+00	
00000000-0000-0000-0000-000000000000	7b214ff4-8e79-4c4e-a72e-c613a36cc1d6	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 08:37:46.191658+00	
00000000-0000-0000-0000-000000000000	bb9c8db9-402e-489b-b32d-2e8160d85a94	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 08:37:46.224777+00	
00000000-0000-0000-0000-000000000000	fa240eab-4434-404d-a3f3-0e8500b85309	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 21:25:07.950647+00	
00000000-0000-0000-0000-000000000000	d6d880fe-49a1-4e1a-89d8-88e9485ac71d	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 21:25:07.978487+00	
00000000-0000-0000-0000-000000000000	e8542199-b756-48d3-ad27-4e663e76a8b7	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 23:23:52.167455+00	
00000000-0000-0000-0000-000000000000	c2a6a20e-6b79-433d-8208-eec366436e0c	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-29 23:23:52.198017+00	
00000000-0000-0000-0000-000000000000	84549a2b-1fdc-44b3-9577-f46a23c98d48	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 01:33:03.995061+00	
00000000-0000-0000-0000-000000000000	ebe99c39-ee34-4cb5-a18b-6ffe100a2d59	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 01:33:04.026928+00	
00000000-0000-0000-0000-000000000000	845a05eb-b6af-4b49-b196-8438b9078b71	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 02:31:41.098342+00	
00000000-0000-0000-0000-000000000000	10a941f4-3589-4833-9e40-c3281cf43c38	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 02:31:41.124484+00	
00000000-0000-0000-0000-000000000000	564b8f01-6789-4d02-9c9d-6732513c0097	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 03:30:50.877342+00	
00000000-0000-0000-0000-000000000000	12e63303-e6c5-401b-8279-ee63f7b074c6	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 03:30:50.894986+00	
00000000-0000-0000-0000-000000000000	02df5321-4f6c-4736-90f7-f9747927a8d5	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 04:30:35.631026+00	
00000000-0000-0000-0000-000000000000	4842a2c1-a186-4a23-895c-ad2e1c829eb7	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 04:30:35.65981+00	
00000000-0000-0000-0000-000000000000	8927d283-b315-4e1a-868f-51f2228fb83f	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 18:27:20.270219+00	
00000000-0000-0000-0000-000000000000	f1376f20-3e78-4446-9838-619e3c03f05a	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-30 18:27:20.301771+00	
00000000-0000-0000-0000-000000000000	8580397b-ba3a-455e-ae13-52e4c9ac68d9	{"action":"user_repeated_signup","actor_id":"54ce5918-3dcd-4e1b-aabc-676a33b15323","actor_username":"lautarobravo96@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-12-30 21:24:45.11829+00	
00000000-0000-0000-0000-000000000000	e7149ada-6267-4d59-9c10-cd81fbf2ab0c	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 02:01:38.324237+00	
00000000-0000-0000-0000-000000000000	a28a98de-44c3-4d7b-8827-3e254bbb45d6	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 02:01:38.334377+00	
00000000-0000-0000-0000-000000000000	cb0a88c0-55a3-46be-ad75-baba74247cf7	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 19:10:15.184911+00	
00000000-0000-0000-0000-000000000000	4984d5bc-8ff4-4e29-b29a-837cbc1914d7	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 19:10:15.209059+00	
00000000-0000-0000-0000-000000000000	27692cd7-00c3-4db4-ad0e-bc1c29f4c9b8	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 20:40:21.543443+00	
00000000-0000-0000-0000-000000000000	5431f823-ff43-45f8-b462-f9e8ebb058c8	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 20:40:21.570775+00	
00000000-0000-0000-0000-000000000000	a51c8f61-fa60-4f06-bfc2-d4fad0449035	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 20:40:22.117982+00	
00000000-0000-0000-0000-000000000000	f2d59757-41bb-4381-b58b-de291060f84c	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 21:53:40.079375+00	
00000000-0000-0000-0000-000000000000	629eda1f-f2bb-400c-a43c-5f002c293dc6	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 21:53:40.105009+00	
00000000-0000-0000-0000-000000000000	5b8526c2-77ac-4f34-8910-b1064d0a53ff	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 22:55:53.766802+00	
00000000-0000-0000-0000-000000000000	a2e9163c-5293-401b-8acc-b481fcad2ef9	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 22:55:53.790517+00	
00000000-0000-0000-0000-000000000000	966647cf-ecaf-43e4-864c-94bbcccc5d0a	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 23:55:02.991735+00	
00000000-0000-0000-0000-000000000000	5caa7f5b-bb9c-4073-ab25-64daad79f01e	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 23:55:03.019922+00	
00000000-0000-0000-0000-000000000000	7adbb8bb-e14c-416f-a6eb-ad84c1cc6b6e	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 00:53:22.275624+00	
00000000-0000-0000-0000-000000000000	bf7456c5-fb0e-4a4a-8be9-65ff5c73dca6	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 00:53:22.299117+00	
00000000-0000-0000-0000-000000000000	d25b50fc-89f1-45af-986b-5d1d5b6099bd	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 01:51:55.488386+00	
00000000-0000-0000-0000-000000000000	64d7e736-89e9-490f-bf42-9f7cce63d05a	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 01:51:55.507651+00	
00000000-0000-0000-0000-000000000000	d1226696-ffff-4f16-adce-9cfc6ac2bbf6	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-11 02:22:12.068952+00	
00000000-0000-0000-0000-000000000000	4216b016-6e15-4209-b044-9d020290906e	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 03:20:53.388513+00	
00000000-0000-0000-0000-000000000000	fcec487f-2d8f-4037-abf4-48ba94e1d20c	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 03:20:53.408555+00	
00000000-0000-0000-0000-000000000000	ca659584-580b-4714-95ab-189a7fd415e5	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 06:09:11.429649+00	
00000000-0000-0000-0000-000000000000	75fc73f1-c803-46f9-9cdb-438554e871d1	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 06:09:11.458389+00	
00000000-0000-0000-0000-000000000000	8a240b9c-83f3-410e-b4df-f17734064747	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 07:07:12.99492+00	
00000000-0000-0000-0000-000000000000	20131a4e-bd9f-4c60-ad6b-c40e93cec558	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 07:07:13.017334+00	
00000000-0000-0000-0000-000000000000	641e7a84-bfd5-45b3-9c57-e7d77807d993	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 08:05:43.011338+00	
00000000-0000-0000-0000-000000000000	3a543518-92b3-4fa0-ab2f-3d6c1ea06e74	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-11 08:05:43.034471+00	
00000000-0000-0000-0000-000000000000	aa8e2cd2-95ff-46de-a89a-e76869b380fa	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-16 07:05:31.962099+00	
00000000-0000-0000-0000-000000000000	6a1f2c19-6663-45fc-aa7a-394dfaf73775	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-16 07:05:31.984759+00	
00000000-0000-0000-0000-000000000000	4714c569-d344-4dd9-a11e-611b3a148f27	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-20 18:42:43.083933+00	
00000000-0000-0000-0000-000000000000	1c8a9ce2-9b24-4fd0-907b-408a1b6794c1	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-20 18:42:43.111819+00	
00000000-0000-0000-0000-000000000000	91a6a981-6eaf-486a-ad05-3a94be32d697	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-20 19:42:18.456038+00	
00000000-0000-0000-0000-000000000000	df1c1f07-8666-4fa6-a69b-b30fe3525172	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-20 19:42:18.482488+00	
00000000-0000-0000-0000-000000000000	c6cdb848-c73c-4d25-950b-617fc41dbf96	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-20 21:42:49.002171+00	
00000000-0000-0000-0000-000000000000	ec586d18-5f6f-4686-9bb3-78e356dd6342	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-20 21:42:49.028251+00	
00000000-0000-0000-0000-000000000000	8a523d2f-99d1-4175-bc21-b732bb4cae1a	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-21 06:06:03.281648+00	
00000000-0000-0000-0000-000000000000	bd4c8061-4642-4bcb-8a82-e799738a5ed7	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-21 06:06:03.311165+00	
00000000-0000-0000-0000-000000000000	cd7ed4f0-f1e3-48da-a7a9-7652ff7020d1	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-24 04:28:17.284232+00	
00000000-0000-0000-0000-000000000000	fba9d7c5-0bea-4008-bb78-c00b80580248	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-24 04:28:17.311167+00	
00000000-0000-0000-0000-000000000000	4f678945-0bae-4b09-bd1b-2def222aee69	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-31 07:07:23.294104+00	
00000000-0000-0000-0000-000000000000	10eb8410-38eb-4645-8b66-eb52c93ba1bb	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-31 07:07:23.329952+00	
00000000-0000-0000-0000-000000000000	6ada9ba4-db2f-44f6-92c0-b306b6890105	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-31 07:07:23.408805+00	
00000000-0000-0000-0000-000000000000	ef330643-f57f-4897-9e8d-f5afd61bc1d8	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-01 00:45:50.454403+00	
00000000-0000-0000-0000-000000000000	70f0dbef-0252-4c2f-8695-18fa36ad2a5d	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-01 00:45:50.484488+00	
00000000-0000-0000-0000-000000000000	87eea7fb-1d67-4173-a2c6-e9a44a42cf18	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-01 01:44:28.770421+00	
00000000-0000-0000-0000-000000000000	34722f2f-81e1-4629-b4fb-b247ddc52597	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-01 01:44:28.791206+00	
00000000-0000-0000-0000-000000000000	0e566a03-6577-46b2-8c3c-8a1b04440b2f	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-01 03:00:27.022948+00	
00000000-0000-0000-0000-000000000000	a4db49da-50b4-410e-8105-7f394f5a6f26	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-01 03:00:27.044534+00	
00000000-0000-0000-0000-000000000000	3ffb5a5c-e339-4d6a-8b0f-81c282a7bd94	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-01 18:53:59.275147+00	
00000000-0000-0000-0000-000000000000	b8f652e7-a0d2-48c5-90e0-591fcbf2dc0b	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-01 18:53:59.302204+00	
00000000-0000-0000-0000-000000000000	b4b4353f-f6fd-4913-a084-0d015075da61	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-02-01 18:55:00.574602+00	
00000000-0000-0000-0000-000000000000	7f7f2c1a-10b0-4d2a-88d6-492aee173b0b	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-01 19:10:22.654451+00	
00000000-0000-0000-0000-000000000000	226f1ba8-4420-4444-98dd-9f4b372f795a	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-02-01 19:10:50.236096+00	
00000000-0000-0000-0000-000000000000	69a26a33-2086-427b-a9c0-5ba46f5a5684	{"action":"user_signedup","actor_id":"4e4e656f-d559-4708-a7df-d46fa8e8ccb8","actor_username":"test1a@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-02-01 19:57:22.905775+00	
00000000-0000-0000-0000-000000000000	bf1f29f5-1cac-43d7-b714-c5704b9db181	{"action":"login","actor_id":"4e4e656f-d559-4708-a7df-d46fa8e8ccb8","actor_username":"test1a@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-01 19:57:22.926178+00	
00000000-0000-0000-0000-000000000000	79661461-fe11-457d-a8d6-f5fb9bb2d914	{"action":"logout","actor_id":"4e4e656f-d559-4708-a7df-d46fa8e8ccb8","actor_username":"test1a@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-02-01 19:58:30.135491+00	
00000000-0000-0000-0000-000000000000	00bdfead-3a3e-4862-b8a8-c1029ab290f5	{"action":"login","actor_id":"4e4e656f-d559-4708-a7df-d46fa8e8ccb8","actor_username":"test1a@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-01 20:12:55.04597+00	
00000000-0000-0000-0000-000000000000	214141c8-cc04-4dc9-97c6-13ddde6011cc	{"action":"login","actor_id":"4e4e656f-d559-4708-a7df-d46fa8e8ccb8","actor_username":"test1a@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-01 20:34:04.93324+00	
00000000-0000-0000-0000-000000000000	c8594a80-a949-4504-a142-ad276883853c	{"action":"login","actor_id":"4e4e656f-d559-4708-a7df-d46fa8e8ccb8","actor_username":"test1a@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-01 21:28:20.614409+00	
00000000-0000-0000-0000-000000000000	66df7564-ce62-4a49-9058-44a219d8af2f	{"action":"logout","actor_id":"4e4e656f-d559-4708-a7df-d46fa8e8ccb8","actor_username":"test1a@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-02-01 21:28:29.83294+00	
00000000-0000-0000-0000-000000000000	19164517-5edc-486b-87d2-5cf2cd0f97dd	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 01:42:54.148132+00	
00000000-0000-0000-0000-000000000000	821c289c-5e1f-48f1-88b3-02bc8c59d230	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 02:41:08.967897+00	
00000000-0000-0000-0000-000000000000	66a7e99d-fa9c-46ab-b599-fbe173102bbc	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 02:41:08.988069+00	
00000000-0000-0000-0000-000000000000	6c980408-a6d7-4b3e-acbf-e0627eb4bbd8	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 03:25:37.852218+00	
00000000-0000-0000-0000-000000000000	1b5d9b93-9f00-4872-a411-1fcc90dd3140	{"action":"user_repeated_signup","actor_id":"54ce5918-3dcd-4e1b-aabc-676a33b15323","actor_username":"lautarobravo96@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2026-03-10 04:00:51.380197+00	
00000000-0000-0000-0000-000000000000	87cab5e3-be03-4777-a408-02fc4d3652df	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 04:01:35.639046+00	
00000000-0000-0000-0000-000000000000	1013e3f5-5693-48d6-a95e-6c944a92ff63	{"action":"logout","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 04:01:57.579826+00	
00000000-0000-0000-0000-000000000000	1bd79fd4-9ff1-4960-8d43-8d05c0745705	{"action":"user_signedup","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-03-10 04:02:05.781735+00	
00000000-0000-0000-0000-000000000000	0ca4f5b3-7537-401f-93dc-f3983001a129	{"action":"login","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 04:02:05.790593+00	
00000000-0000-0000-0000-000000000000	3c4b5e24-95e5-48ed-926d-eadb97664191	{"action":"logout","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 04:02:43.369074+00	
00000000-0000-0000-0000-000000000000	e51c5164-64ff-4f82-8e65-988ceef58648	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 04:02:46.409284+00	
00000000-0000-0000-0000-000000000000	99ee00bd-7704-46b7-8bb9-5ed49183a268	{"action":"login","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 04:02:56.944133+00	
00000000-0000-0000-0000-000000000000	67a7fcb8-5a57-4fcb-b690-da43fd6a397d	{"action":"logout","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 04:09:54.793894+00	
00000000-0000-0000-0000-000000000000	de1341fe-dfea-473b-a86b-d56036b0827e	{"action":"login","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 04:10:07.120588+00	
00000000-0000-0000-0000-000000000000	8b407487-2530-4ddf-87ab-bd12ef6d15b5	{"action":"logout","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 04:10:12.785443+00	
00000000-0000-0000-0000-000000000000	eb58922d-4250-484c-96e6-75aeb17f13ef	{"action":"login","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 04:10:26.75795+00	
00000000-0000-0000-0000-000000000000	d4052612-69de-4b91-93cf-b98e13feb7f5	{"action":"logout","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 04:13:14.561715+00	
00000000-0000-0000-0000-000000000000	f6bc7693-9976-47e3-b173-7fa84007cc98	{"action":"login","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 04:13:52.669235+00	
00000000-0000-0000-0000-000000000000	4e99a010-2d71-4b48-9f73-f472aeb4ce6d	{"action":"logout","actor_id":"bff3cd34-5da8-45d6-87ff-63a2704084d2","actor_username":"pancracionamu1@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 04:13:57.100005+00	
00000000-0000-0000-0000-000000000000	6150de14-293a-4f6d-bfb4-4900cbf174a8	{"action":"token_refreshed","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 06:14:48.155057+00	
00000000-0000-0000-0000-000000000000	3be6feb8-0c59-4937-b848-b59415babcb4	{"action":"token_revoked","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 06:14:48.186888+00	
00000000-0000-0000-0000-000000000000	8471ee2a-a4ac-42e8-a9fc-ec89ca36dc95	{"action":"user_repeated_signup","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2026-03-10 07:51:50.198237+00	
00000000-0000-0000-0000-000000000000	bc336542-6f71-4b5b-a194-0b566f3b3f90	{"action":"login","actor_id":"4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 07:52:06.00284+00	
00000000-0000-0000-0000-000000000000	829cc9cd-8db7-4139-95b5-3c29f006bdc4	{"action":"user_signedup","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-03-10 08:21:20.186291+00	
00000000-0000-0000-0000-000000000000	f9c93451-efed-42cb-823f-a7618253ca89	{"action":"login","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 08:21:20.204818+00	
00000000-0000-0000-0000-000000000000	a7aacb5a-8c52-4459-b12e-fa4e969ea665	{"action":"logout","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 08:25:03.712365+00	
00000000-0000-0000-0000-000000000000	cbedbfb2-d3a6-44db-951d-8521e26ed988	{"action":"login","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 08:25:12.511115+00	
00000000-0000-0000-0000-000000000000	720f828c-bd4d-41cf-a97a-3da0a86f211e	{"action":"logout","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 08:25:35.13861+00	
00000000-0000-0000-0000-000000000000	99e88930-77b2-4ec5-beb1-3b0ebde33069	{"action":"login","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 08:26:36.254211+00	
00000000-0000-0000-0000-000000000000	cfe02935-4120-4a8b-b387-41e93e0250fc	{"action":"logout","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 08:27:14.199551+00	
00000000-0000-0000-0000-000000000000	ecdbb4aa-4c1f-48ed-8e84-e75096125293	{"action":"login","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 08:29:05.852002+00	
00000000-0000-0000-0000-000000000000	1344a44a-5b9c-4780-9a1d-41a3445f4df9	{"action":"login","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-10 08:31:30.952515+00	
00000000-0000-0000-0000-000000000000	11d3922c-bfe5-4d91-9502-84c78cbbc998	{"action":"token_refreshed","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 09:30:32.565461+00	
00000000-0000-0000-0000-000000000000	24e96590-2b6f-4698-bf3a-f13d96423d51	{"action":"token_revoked","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 09:30:32.587483+00	
00000000-0000-0000-0000-000000000000	9c4f1a0d-eaaa-400b-8b75-64d6a7b9c73c	{"action":"token_refreshed","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 17:35:25.238819+00	
00000000-0000-0000-0000-000000000000	fbf3ae59-1444-4197-8535-1f305daf9e46	{"action":"token_revoked","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 17:35:25.269039+00	
00000000-0000-0000-0000-000000000000	5818b646-3306-4575-852d-9cf512b41e59	{"action":"token_refreshed","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 18:35:02.413217+00	
00000000-0000-0000-0000-000000000000	85762775-6012-4b01-b4c3-4526c5eeb243	{"action":"token_revoked","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 18:35:02.430777+00	
00000000-0000-0000-0000-000000000000	b6afba6e-159a-484b-b49e-74bb72176821	{"action":"token_refreshed","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 19:33:57.664539+00	
00000000-0000-0000-0000-000000000000	14cd74a9-479c-4283-80be-8eb08ae76b96	{"action":"token_revoked","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-10 19:33:57.693638+00	
00000000-0000-0000-0000-000000000000	d30c22db-8ef8-45ca-a555-5952afc0375e	{"action":"logout","actor_id":"164e4433-df6d-4eb7-b672-a2dde82ab5b8","actor_username":"tnexdrak@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-10 20:30:35.44812+00	
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
c23bd8dd-0f2f-4f5d-a27f-abf7d428244f	b966ff5c-f3eb-429f-9563-93ee6e557200	90c9b0a4-8482-4bb7-a945-613fca965ab8	s256	UgCIqZMwMzeK2v0SCS8Okpv3wjbTd4t8q41zR5p4e38	magiclink			2025-07-22 19:19:29.425907+00	2025-07-22 19:19:39.693094+00	magiclink	2025-07-22 19:19:39.693058+00	\N	\N	\N	\N	f
19e2359e-5e71-4537-b1df-f43512b7213f	4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14	cc53e4f6-7e17-43b1-832c-3ab22acc5cba	s256	psR1hW__OQpnsLAMsQWaksuM0DlHUOLU1YRYDR_NitM	recovery			2025-07-22 20:31:02.953551+00	2025-07-22 20:31:36.532639+00	recovery	2025-07-22 20:31:36.532592+00	\N	\N	\N	\N	f
aa932e43-2afd-4db5-b349-389e044f8834	4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14	61aa33e0-b5cd-4e84-9086-4c4012095fcf	s256	QDv2Yce3gNi6i-hy2O732UO_RHrQkT6CH-OR61Y_0T4	recovery			2025-07-22 21:56:50.121814+00	2025-07-22 21:57:01.786141+00	recovery	2025-07-22 21:57:01.786096+00	\N	\N	\N	\N	f
a17fe617-5e56-4cb2-ac24-6d261b2e03f4	4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14	9320ccd2-4017-4358-8741-e753a2afa742	s256	tR-4_xh7-cIR7_OiaOQl3CTRkdzKh8R5mQx-bbs3MuY	recovery			2025-07-22 22:33:49.031005+00	2025-07-22 22:33:49.031005+00	recovery	\N	\N	\N	\N	\N	f
04f6c530-4a3f-4ba4-a4e3-4d27b7fc8b37	4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14	c8ecea21-5e93-431c-94ef-dde86a09c561	s256	OwEAypK__8uc6G3Mp0WdLCax2fs9wWQbwC-91BA__cs	recovery			2025-07-22 22:36:18.968783+00	2025-07-22 22:36:26.876004+00	recovery	2025-07-22 22:36:26.875966+00	\N	\N	\N	\N	f
6e81fe8e-872f-4e68-a0fb-b467cbf43b23	4b9cc715-cc75-4ee9-9cb3-afd7e74b2f14	6d5d2ba8-e2a8-42a2-a6a7-fccfeb714068	s256	PYcUF4PY6fv7hJvEwrenGWagvFtCx1s7A64s4KxcewI	recovery			2025-07-22 22:46:09.105969+00	2025-07-22 22:46:09.105969+00	recovery	\N	\N	\N	\N	\N	f
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, account_id, provider_id, user_id, access_token, refresh_token, id_token, access_token_expires_at, refresh_token_expires_at, scope, password, created_at, updated_at) FROM stdin;
AEhzvhbDoYLhJKR8uj4S9BfGqFU3SUZX	V7lklaqGTiYJlhfQKHYEWVPpEQkhbXxs	credential	V7lklaqGTiYJlhfQKHYEWVPpEQkhbXxs	\N	\N	\N	\N	\N	\N	08bb42cfca503822d1d5ca0ea902cd61:3c62a41eabb397499d3dc82ac1f586cff5ff8f4ff1e3ce0b45a71db535e4d47aee647f1c56a78c9bf4c309e0892ac6707f6a363f00ecea99968f527c39d6050b	2026-03-10 18:03:16.077	2026-03-10 18:03:16.077
PQEkq9YoOysnt7V7Glnj6OMyENUtoxA9	5SssRdvEpQWNXO3m5YzZfMWSWahA3xMl	credential	5SssRdvEpQWNXO3m5YzZfMWSWahA3xMl	\N	\N	\N	\N	\N	\N	0f2e6f4b9ce5ee1e28a7222985a718fb:dac38c0c992c71c809cfa419633e722ca2f8439ef1b5989b033e1718ca65b9f75d0fbdd329020c3a3bda307ea2ba88ee9a328ede8c5b94ece236903cedbe1635	2026-03-10 21:29:27.575	2026-03-10 21:29:27.575
IxlQFbGnObZo5lQ3vZr7pzjmqTE1YaIA	o4JSH8wFfsgmZms36PPcN3E9AOwvZ9nD	credential	o4JSH8wFfsgmZms36PPcN3E9AOwvZ9nD	\N	\N	\N	\N	\N	\N	c27d1ffa2354cb7252acec5c40af163c:61ba7df36a1ed595e1c8de7fa5f305fe8db33e6b88ba65dce35a8cc2320ab8a4cb658da805ab704bac2b4cff3db1afb0cd0fd592f7ba9867bd71fe6bc0bb9a35	2026-03-10 21:51:06.372	2026-03-10 21:51:06.372
\.


--
-- Data for Name: auth_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_logs (id, user_id, event_type, ip_address, user_agent, success, created_at) FROM stdin;
\.


--
-- Data for Name: downloads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.downloads (id, title, description, file_url, file_type, file_size, category, cover_image_url, is_public, is_featured, created_at) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, title, description, date, location, venue, ticket_url, image_url, is_featured, is_published, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hero_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hero_content (id, title, subtitle, description, background_image_url, cta_text, cta_url, is_active, created_at, updated_at) FROM stdin;
1	THE QUIET ONE	Nuevo Single	Descubre el último lanzamiento de NexDrak	\N	LISTEN NOW	https://album.link/thequietone	t	2025-07-23 00:25:54.274729+00	2025-07-23 00:25:54.274729+00
\.


--
-- Data for Name: merch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merch (id, name, description, price, image_url, purchase_url, category, stock, is_available, is_featured, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: page_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_sections (id, section_name, title, subtitle, content, is_visible, sort_order, created_at, updated_at) FROM stdin;
1	latest_releases	LATEST RELEASES	Descubre mis últimos lanzamientos	\N	t	1	2025-07-23 00:25:54.274729+00	2025-07-23 00:25:54.274729+00
2	upcoming_events	UPCOMING EVENTS	Próximos conciertos y presentaciones	\N	t	2	2025-07-23 00:25:54.274729+00	2025-07-23 00:25:54.274729+00
3	explore	EXPLORE	Descubre más contenido	\N	t	3	2025-07-23 00:25:54.274729+00	2025-07-23 00:25:54.274729+00
4	connect	CONNECT	Sígueme en redes sociales	\N	t	4	2025-07-23 00:25:54.274729+00	2025-07-23 00:25:54.274729+00
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, username, role, avatar_url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: releases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.releases (id, title, release_date, cover_image_url, stream_url, created_at) FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (id, expires_at, token, created_at, updated_at, ip_address, user_agent, user_id, impersonated_by) FROM stdin;
qDp1OzRuswrEASyS9HMbcAuCIAS1EvLe	2026-03-17 18:05:57.678	Lqm6z0Y3HpoTiJZ3V7b7ByIMCpeFcuG7	2026-03-10 18:05:57.678	2026-03-10 18:05:57.678	0000:0000:0000:0000:0000:0000:0000:0000	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36	V7lklaqGTiYJlhfQKHYEWVPpEQkhbXxs	\N
2XttC4iM5be8qSGSvdn3tF8EfvDD3QyU	2026-03-17 22:30:45.751	zu1CranaclKl36HSNRflnFugeFgUJSIC	2026-03-10 22:30:45.752	2026-03-10 22:30:45.752	0000:0000:0000:0000:0000:0000:0000:0000	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Trae/1.107.1 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36	V7lklaqGTiYJlhfQKHYEWVPpEQkhbXxs	\N
9tjrXb4ZQM6mVch5L54VYnWBqMfHvD1l	2026-03-19 23:39:41.341	gLW65JuQyhzQWgjffIdO8hMUBus0JXeq	2026-03-12 23:39:41.503	2026-03-12 23:39:41.503	0000:0000:0000:0000:0000:0000:0000:0000	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	V7lklaqGTiYJlhfQKHYEWVPpEQkhbXxs	\N
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_settings (id, key, value, description, type, created_at, updated_at) FROM stdin;
1	site_title		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
2	site_description		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
3	contact_email		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
4	booking_email		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
5	hero_release_text	THE CATHEDRAL	\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
6	hero_album_link		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
7	hero_background_image		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
8	hero_release_image		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
9	site_logo		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
10	site_logo_mobile		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
11	navbar_logo		\N	text	2026-03-11 04:02:47.136724+00	2026-03-11 04:02:47.136724+00
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (id, title, artist, album_name, cover_image_url, release_date, type, slug, stream_url, youtube_embed_id, created_at, updated_at) FROM stdin;
1	TEST	NexDrak	\N	https://i.ibb.co/Jwt0CzW2/Anex3.png	2026-03-05	single	\N	https://album.link/thequietone	\N	2026-03-11 00:10:50.528629+00	2026-03-11 00:10:50.528629+00
\.


--
-- Data for Name: streaming_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.streaming_links (id, song_id, platform, url, is_primary, created_at) FROM stdin;
\.


--
-- Data for Name: twoFactor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."twoFactor" (id, secret, "backupCodes", "userId") FROM stdin;
FV3X4uZPOzpUmzDyEvveHAGRT0rkDlVH	1900b216583b7c99217c9a2b858ec6e07b976a276c96398ad0b5ec33ed92063fd1bff541655932c815a399a8a0a604e051bf61619225cb1684078839ba41663b7fbd53bd85fd2d7e	595f57a9124262d158c2872a9031bb1d77d036d4850037697552afcce57929e0aa11e4500515460646f03bb63815946ed49315c9224c876ff95b4a6fc57b421c582be89eeb1b45d3c219e70ed4cce20ff7d4199b28d6a872113cea4aa627b87c38281b35227a1ea27557e760faecd1f62c2cff952c3e5cf3ce067f28544b120e794c67013430b511286b2e202443eef269b0bc11444b7cc268c4e523d95571328d055049a5d05afc7923b33234942fecc104fb4ab1	V7lklaqGTiYJlhfQKHYEWVPpEQkhbXxs
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name, email, email_verified, image, created_at, updated_at, role, banned, ban_reason, ban_expires, two_factor_enabled) FROM stdin;
V7lklaqGTiYJlhfQKHYEWVPpEQkhbXxs	admin	tnexdrak@gmail.com	t	\N	2026-03-10 18:03:15.876	2026-03-10 18:03:15.876	admin	f	\N	\N	f
5SssRdvEpQWNXO3m5YzZfMWSWahA3xMl	yokopo	yokopo4652@devlug.com	f	\N	2026-03-10 21:29:27.353	2026-03-10 21:29:27.353	user	f	\N	\N	f
o4JSH8wFfsgmZms36PPcN3E9AOwvZ9nD	XF2EQ	xf2eqlq8t8@lnovic.com	t	\N	2026-03-10 21:51:06.174	2026-03-10 21:51:49.451	user	f	\N	\N	f
\.


--
-- Data for Name: verification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verification (id, identifier, value, expires_at, created_at, updated_at) FROM stdin;
YoZkiuysUUgy8AS2Ga0NSIA99p3bqdo6	g8NjdV8qvY_aHcMUAqqgpdFKH1JPq0f4	{"callbackURL":"/admin","codeVerifier":"3POcqGFOfNi0kekXh8XAeTMDouiYXNzAm3KOb5UsG5clnerCMcotsxL1WCjVzKK2Ajn_ZxTL5Ygdtk3HesFp9tnxhz_uzGQCPwrDwulif7kUqeFWMaFNcb7rjmx7NaqD","expiresAt":1773191197744}	2026-03-10 19:06:37.75	2026-03-10 18:56:37.758	2026-03-10 18:56:37.758
ZEC4i7W5TQn6ed80rzxIU7JAY170yBk3	Jl_xwT4edmt0SJlyBY0wqFic8nPODPhh	{"callbackURL":"/admin","codeVerifier":"KeCG8DcYN-1rmNi5uKWI1muz1BdAOhEIMMBCxK-ZdEnvQMYNAHzutofcRi30KlPzvYU45VB22R4MFQUlfCyx6Fni7u0HVkxVx4-aWCpnvbQinJfZZYozZGtrb6MWo4MR","expiresAt":1773210211152}	2026-03-11 00:23:31.155	2026-03-11 00:13:31.191	2026-03-11 00:13:31.191
Lt02jazHL442D1q6HCQIfdKH0D38oQws	9GgQ8aoCPZ1AN_Onlo4z66XiJwFnCy4S	{"callbackURL":"/","codeVerifier":"C6uYeo2eY2xRgru4HaXUQYnkfZsZDxbDRB0AbVZUedWWKuX7xXb2DJ_AiT3SSfeiMZgvss8ROYrzYhe2BFTlun_gq7FsApkitiy0D54S8riHouErOHh41Gwgdl19-oD1","expiresAt":1773348291098}	2026-03-12 20:44:51.106	2026-03-12 20:34:51.106	2026-03-12 20:34:51.106
LKCGIFDrFbDBN9RikxMr6aJd10GjD9N8	QfoFV2ps_aDUffY3z_Q55KWCNpAj6Gkv	{"callbackURL":"/","codeVerifier":"hA1pd7TzSbXk7iEHBqbRixiCcj_ToR12ODafFzw5cINKbl3zvbEIt_o-vxGeO1hLfHcXlHcwfaLEX0lWdFRRbExgpdSeeyORReYPWdY2QPt5GNpw4kmDhf0fv4hHp1RQ","expiresAt":1773357487695}	2026-03-12 23:18:07.698	2026-03-12 23:08:07.709	2026-03-12 23:08:07.709
\.


--
-- Data for Name: messages_2026_03_09; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_09 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_10; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_10 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_11; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_11 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_12; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_12 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_13; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_13 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_14; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_14 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_15; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_15 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-07-22 06:53:36
20211116045059	2025-07-22 06:53:41
20211116050929	2025-07-22 06:53:44
20211116051442	2025-07-22 06:53:48
20211116212300	2025-07-22 06:53:52
20211116213355	2025-07-22 06:53:55
20211116213934	2025-07-22 06:53:58
20211116214523	2025-07-22 06:54:03
20211122062447	2025-07-22 06:54:06
20211124070109	2025-07-22 06:54:09
20211202204204	2025-07-22 06:54:13
20211202204605	2025-07-22 06:54:16
20211210212804	2025-07-22 06:54:26
20211228014915	2025-07-22 06:54:30
20220107221237	2025-07-22 06:54:33
20220228202821	2025-07-22 06:54:36
20220312004840	2025-07-22 06:54:40
20220603231003	2025-07-22 06:54:45
20220603232444	2025-07-22 06:54:48
20220615214548	2025-07-22 06:54:52
20220712093339	2025-07-22 06:54:55
20220908172859	2025-07-22 06:54:59
20220916233421	2025-07-22 06:55:02
20230119133233	2025-07-22 06:55:05
20230128025114	2025-07-22 06:55:10
20230128025212	2025-07-22 06:55:13
20230227211149	2025-07-22 06:55:16
20230228184745	2025-07-22 06:55:20
20230308225145	2025-07-22 06:55:23
20230328144023	2025-07-22 06:55:26
20231018144023	2025-07-22 06:55:30
20231204144023	2025-07-22 06:55:35
20231204144024	2025-07-22 06:55:39
20231204144025	2025-07-22 06:55:42
20240108234812	2025-07-22 06:55:45
20240109165339	2025-07-22 06:55:49
20240227174441	2025-07-22 06:55:55
20240311171622	2025-07-22 06:55:59
20240321100241	2025-07-22 06:56:07
20240401105812	2025-07-22 06:56:16
20240418121054	2025-07-22 06:56:20
20240523004032	2025-07-22 06:56:32
20240618124746	2025-07-22 06:56:35
20240801235015	2025-07-22 06:56:39
20240805133720	2025-07-22 06:56:42
20240827160934	2025-07-22 06:56:45
20240919163303	2025-07-22 06:56:50
20240919163305	2025-07-22 06:56:53
20241019105805	2025-07-22 06:56:56
20241030150047	2025-07-22 06:57:09
20241108114728	2025-07-22 06:57:13
20241121104152	2025-07-22 06:57:17
20241130184212	2025-07-22 06:57:21
20241220035512	2025-07-22 06:57:24
20241220123912	2025-07-22 06:57:27
20241224161212	2025-07-22 06:57:31
20250107150512	2025-07-22 06:57:34
20250110162412	2025-07-22 06:57:37
20250123174212	2025-07-22 06:57:41
20250128220012	2025-07-22 06:57:44
20250506224012	2025-07-22 06:57:47
20250523164012	2025-07-22 06:57:50
20250714121412	2025-07-22 06:57:53
20250905041441	2025-09-24 03:08:23
20251103001201	2025-11-12 19:45:48
20251120212548	2026-02-04 21:40:10
20251120215549	2026-02-04 21:40:12
20260218120000	2026-03-01 01:56:38
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-07-22 06:51:00.913802
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-07-22 06:51:00.927921
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-07-22 06:51:00.96109
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-07-22 06:51:00.976187
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-07-22 06:51:00.981782
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-07-22 06:51:00.994206
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-07-22 06:51:00.999791
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-07-22 06:51:01.01835
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-07-22 06:51:01.026222
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-07-22 06:51:01.032023
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-07-22 06:51:01.038069
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-07-22 06:51:01.05969
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-07-22 06:51:01.068426
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-07-22 06:51:01.074897
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-07-22 06:51:01.082634
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-07-22 06:51:01.095197
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-07-22 06:51:01.101525
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-07-22 06:51:01.113939
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-07-22 06:51:01.133092
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-07-22 06:51:01.146827
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-07-22 06:51:01.15744
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-07-22 06:51:01.163843
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-08-26 17:02:49.509737
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-12-27 02:13:23.339536
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-12-27 02:13:23.35633
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2025-12-27 02:13:23.404394
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2025-12-27 02:13:23.407904
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2025-12-27 02:13:23.657306
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2025-07-22 06:51:00.93335
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2025-07-22 06:51:00.988201
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2025-07-22 06:51:01.006114
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2025-07-22 06:51:01.012145
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2025-08-26 17:02:44.419411
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2025-08-26 17:02:44.907311
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2025-08-26 17:02:45.306545
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2025-08-26 17:02:45.511952
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2025-08-26 17:02:45.61221
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2025-08-26 17:02:46.512049
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2025-08-26 17:02:47.105887
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2025-08-26 17:02:47.513229
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2025-08-26 17:02:47.712379
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2025-08-26 17:02:48.415384
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2025-08-26 17:02:48.915022
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2025-08-26 17:02:49.811596
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2025-12-27 02:13:23.267434
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2025-12-27 02:13:23.309319
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2025-12-27 02:13:23.32723
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2025-12-27 02:13:23.330852
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2025-12-27 02:13:23.33608
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2025-12-27 02:13:23.41094
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-03-10 23:13:53.531341
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-03-10 23:13:53.667025
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-03-10 23:13:53.670349
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-03-10 23:13:53.984402
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-03-10 23:13:53.992132
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-03-10 23:13:53.995512
56	fix-optimized-search-function	cb58526ebc23048049fd5bf2fd148d18b04a2073	2026-03-10 23:13:54.009997
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 162, true);


--
-- Name: auth_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_logs_id_seq', 1, false);


--
-- Name: downloads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.downloads_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: hero_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hero_content_id_seq', 1, true);


--
-- Name: merch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merch_id_seq', 1, false);


--
-- Name: page_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_sections_id_seq', 4, true);


--
-- Name: releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.releases_id_seq', 1, false);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 11, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_id_seq', 1, true);


--
-- Name: streaming_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.streaming_links_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: auth_logs auth_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_logs
    ADD CONSTRAINT auth_logs_pkey PRIMARY KEY (id);


--
-- Name: downloads downloads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.downloads
    ADD CONSTRAINT downloads_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: hero_content hero_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_content
    ADD CONSTRAINT hero_content_pkey PRIMARY KEY (id);


--
-- Name: merch merch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merch
    ADD CONSTRAINT merch_pkey PRIMARY KEY (id);


--
-- Name: page_sections page_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_sections
    ADD CONSTRAINT page_sections_pkey PRIMARY KEY (id);


--
-- Name: page_sections page_sections_section_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_sections
    ADD CONSTRAINT page_sections_section_name_key UNIQUE (section_name);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_username_key UNIQUE (username);


--
-- Name: releases releases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.releases
    ADD CONSTRAINT releases_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: session session_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_token_unique UNIQUE (token);


--
-- Name: site_settings site_settings_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_key_key UNIQUE (key);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: songs songs_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_slug_key UNIQUE (slug);


--
-- Name: streaming_links streaming_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streaming_links
    ADD CONSTRAINT streaming_links_pkey PRIMARY KEY (id);


--
-- Name: twoFactor twoFactor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."twoFactor"
    ADD CONSTRAINT "twoFactor_pkey" PRIMARY KEY (id);


--
-- Name: user user_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_unique UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: verification verification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification
    ADD CONSTRAINT verification_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_09 messages_2026_03_09_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_09
    ADD CONSTRAINT messages_2026_03_09_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_10 messages_2026_03_10_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_10
    ADD CONSTRAINT messages_2026_03_10_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_11 messages_2026_03_11_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_11
    ADD CONSTRAINT messages_2026_03_11_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_12 messages_2026_03_12_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_12
    ADD CONSTRAINT messages_2026_03_12_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_13 messages_2026_03_13_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_13
    ADD CONSTRAINT messages_2026_03_13_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_14 messages_2026_03_14_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_14
    ADD CONSTRAINT messages_2026_03_14_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_15 messages_2026_03_15_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_15
    ADD CONSTRAINT messages_2026_03_15_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_auth_logs_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_logs_created_at ON public.auth_logs USING btree (created_at DESC);


--
-- Name: idx_auth_logs_event_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_logs_event_type ON public.auth_logs USING btree (event_type);


--
-- Name: idx_auth_logs_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_logs_user_id ON public.auth_logs USING btree (user_id);


--
-- Name: idx_hero_content_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_hero_content_active ON public.hero_content USING btree (is_active) WHERE (is_active = true);


--
-- Name: idx_page_sections_visible; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_page_sections_visible ON public.page_sections USING btree (is_visible, sort_order) WHERE (is_visible = true);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_09_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_09_inserted_at_topic_idx ON realtime.messages_2026_03_09 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_10_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_10_inserted_at_topic_idx ON realtime.messages_2026_03_10 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_11_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_11_inserted_at_topic_idx ON realtime.messages_2026_03_11 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_12_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_12_inserted_at_topic_idx ON realtime.messages_2026_03_12 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_13_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_13_inserted_at_topic_idx ON realtime.messages_2026_03_13 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_14_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_14_inserted_at_topic_idx ON realtime.messages_2026_03_14 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_15_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_15_inserted_at_topic_idx ON realtime.messages_2026_03_15 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: messages_2026_03_09_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_09_inserted_at_topic_idx;


--
-- Name: messages_2026_03_09_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_09_pkey;


--
-- Name: messages_2026_03_10_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_10_inserted_at_topic_idx;


--
-- Name: messages_2026_03_10_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_10_pkey;


--
-- Name: messages_2026_03_11_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_11_inserted_at_topic_idx;


--
-- Name: messages_2026_03_11_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_11_pkey;


--
-- Name: messages_2026_03_12_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_12_inserted_at_topic_idx;


--
-- Name: messages_2026_03_12_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_12_pkey;


--
-- Name: messages_2026_03_13_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_13_inserted_at_topic_idx;


--
-- Name: messages_2026_03_13_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_13_pkey;


--
-- Name: messages_2026_03_14_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_14_inserted_at_topic_idx;


--
-- Name: messages_2026_03_14_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_14_pkey;


--
-- Name: messages_2026_03_15_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_15_inserted_at_topic_idx;


--
-- Name: messages_2026_03_15_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_15_pkey;


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: hero_content update_hero_content_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_hero_content_updated_at BEFORE UPDATE ON public.hero_content FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: page_sections update_page_sections_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_page_sections_updated_at BEFORE UPDATE ON public.page_sections FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: account account_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT "account_userId_fkey" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: auth_logs auth_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_logs
    ADD CONSTRAINT auth_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: session session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "session_userId_fkey" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: streaming_links streaming_links_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streaming_links
    ADD CONSTRAINT streaming_links_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(id) ON DELETE CASCADE;


--
-- Name: twoFactor twoFactor_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."twoFactor"
    ADD CONSTRAINT "twoFactor_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: site_settings Admin Update Settings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin Update Settings" ON public.site_settings FOR UPDATE USING (false);


--
-- Name: songs Admin Write All; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin Write All" ON public.songs USING (false);


--
-- Name: downloads Admin Write Downloads; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin Write Downloads" ON public.downloads USING (false);


--
-- Name: events Admin Write Events; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin Write Events" ON public.events USING (false);


--
-- Name: merch Admin Write Merch; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin Write Merch" ON public.merch USING (false);


--
-- Name: releases Admin Write Releases; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin Write Releases" ON public.releases USING (false);


--
-- Name: account Deny all access; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Deny all access" ON public.account USING (false);


--
-- Name: session Deny all access; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Deny all access" ON public.session USING (false);


--
-- Name: twoFactor Deny all access; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Deny all access" ON public."twoFactor" USING (false);


--
-- Name: user Deny all access; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Deny all access" ON public."user" USING (false);


--
-- Name: verification Deny all access; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Deny all access" ON public.verification USING (false);


--
-- Name: hero_content Hero content is viewable by everyone.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Hero content is viewable by everyone." ON public.hero_content FOR SELECT USING (true);


--
-- Name: page_sections Page sections are viewable by everyone.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Page sections are viewable by everyone." ON public.page_sections FOR SELECT USING (true);


--
-- Name: downloads Public Read Downloads; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public Read Downloads" ON public.downloads FOR SELECT USING (true);


--
-- Name: events Public Read Events; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public Read Events" ON public.events FOR SELECT USING (true);


--
-- Name: merch Public Read Merch; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public Read Merch" ON public.merch FOR SELECT USING (true);


--
-- Name: releases Public Read Releases; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public Read Releases" ON public.releases FOR SELECT USING (true);


--
-- Name: site_settings Public Read Settings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public Read Settings" ON public.site_settings FOR SELECT USING (true);


--
-- Name: songs Public Read Songs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public Read Songs" ON public.songs FOR SELECT USING (true);


--
-- Name: profiles Public read access; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public read access" ON public.profiles FOR SELECT TO authenticated, anon USING (true);


--
-- Name: streaming_links Public read access; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public read access" ON public.streaming_links FOR SELECT TO authenticated, anon USING (true);


--
-- Name: account; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.account ENABLE ROW LEVEL SECURITY;

--
-- Name: auth_logs; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: downloads; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.downloads ENABLE ROW LEVEL SECURITY;

--
-- Name: events; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;

--
-- Name: hero_content; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.hero_content ENABLE ROW LEVEL SECURITY;

--
-- Name: merch; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.merch ENABLE ROW LEVEL SECURITY;

--
-- Name: page_sections; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.page_sections ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: releases; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.releases ENABLE ROW LEVEL SECURITY;

--
-- Name: session; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.session ENABLE ROW LEVEL SECURITY;

--
-- Name: site_settings; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.site_settings ENABLE ROW LEVEL SECURITY;

--
-- Name: songs; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.songs ENABLE ROW LEVEL SECURITY;

--
-- Name: streaming_links; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.streaming_links ENABLE ROW LEVEL SECURITY;

--
-- Name: twoFactor; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public."twoFactor" ENABLE ROW LEVEL SECURITY;

--
-- Name: user; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ENABLE ROW LEVEL SECURITY;

--
-- Name: verification; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.verification ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION cleanup_old_auth_logs(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.cleanup_old_auth_logs() TO anon;
GRANT ALL ON FUNCTION public.cleanup_old_auth_logs() TO authenticated;
GRANT ALL ON FUNCTION public.cleanup_old_auth_logs() TO service_role;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION increment_download_count(download_id integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.increment_download_count(download_id integer) TO anon;
GRANT ALL ON FUNCTION public.increment_download_count(download_id integer) TO authenticated;
GRANT ALL ON FUNCTION public.increment_download_count(download_id integer) TO service_role;


--
-- Name: FUNCTION update_downloads_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_downloads_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_downloads_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_downloads_updated_at() TO service_role;


--
-- Name: FUNCTION update_events_updated_at_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_events_updated_at_column() TO anon;
GRANT ALL ON FUNCTION public.update_events_updated_at_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_events_updated_at_column() TO service_role;


--
-- Name: FUNCTION update_merch_updated_at_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_merch_updated_at_column() TO anon;
GRANT ALL ON FUNCTION public.update_merch_updated_at_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_merch_updated_at_column() TO service_role;


--
-- Name: FUNCTION update_settings_updated_at_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_settings_updated_at_column() TO anon;
GRANT ALL ON FUNCTION public.update_settings_updated_at_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_settings_updated_at_column() TO service_role;


--
-- Name: FUNCTION update_streaming_links_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_streaming_links_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_streaming_links_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_streaming_links_updated_at() TO service_role;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_updated_at_column() TO anon;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO service_role;


--
-- Name: FUNCTION validate_password_strength(password text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validate_password_strength(password text) TO anon;
GRANT ALL ON FUNCTION public.validate_password_strength(password text) TO authenticated;
GRANT ALL ON FUNCTION public.validate_password_strength(password text) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE account; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.account TO anon;
GRANT ALL ON TABLE public.account TO authenticated;
GRANT ALL ON TABLE public.account TO service_role;


--
-- Name: TABLE auth_logs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.auth_logs TO anon;
GRANT ALL ON TABLE public.auth_logs TO authenticated;
GRANT ALL ON TABLE public.auth_logs TO service_role;


--
-- Name: SEQUENCE auth_logs_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.auth_logs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.auth_logs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.auth_logs_id_seq TO service_role;


--
-- Name: TABLE downloads; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.downloads TO anon;
GRANT ALL ON TABLE public.downloads TO authenticated;
GRANT ALL ON TABLE public.downloads TO service_role;


--
-- Name: SEQUENCE downloads_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.downloads_id_seq TO anon;
GRANT ALL ON SEQUENCE public.downloads_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.downloads_id_seq TO service_role;


--
-- Name: TABLE events; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.events TO anon;
GRANT ALL ON TABLE public.events TO authenticated;
GRANT ALL ON TABLE public.events TO service_role;


--
-- Name: SEQUENCE events_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.events_id_seq TO anon;
GRANT ALL ON SEQUENCE public.events_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.events_id_seq TO service_role;


--
-- Name: TABLE hero_content; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.hero_content TO anon;
GRANT ALL ON TABLE public.hero_content TO authenticated;
GRANT ALL ON TABLE public.hero_content TO service_role;


--
-- Name: SEQUENCE hero_content_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.hero_content_id_seq TO anon;
GRANT ALL ON SEQUENCE public.hero_content_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.hero_content_id_seq TO service_role;


--
-- Name: TABLE merch; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.merch TO anon;
GRANT ALL ON TABLE public.merch TO authenticated;
GRANT ALL ON TABLE public.merch TO service_role;


--
-- Name: SEQUENCE merch_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.merch_id_seq TO anon;
GRANT ALL ON SEQUENCE public.merch_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.merch_id_seq TO service_role;


--
-- Name: TABLE page_sections; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.page_sections TO anon;
GRANT ALL ON TABLE public.page_sections TO authenticated;
GRANT ALL ON TABLE public.page_sections TO service_role;


--
-- Name: SEQUENCE page_sections_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.page_sections_id_seq TO anon;
GRANT ALL ON SEQUENCE public.page_sections_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.page_sections_id_seq TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE releases; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.releases TO anon;
GRANT ALL ON TABLE public.releases TO authenticated;
GRANT ALL ON TABLE public.releases TO service_role;


--
-- Name: SEQUENCE releases_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.releases_id_seq TO anon;
GRANT ALL ON SEQUENCE public.releases_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.releases_id_seq TO service_role;


--
-- Name: TABLE session; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.session TO anon;
GRANT ALL ON TABLE public.session TO authenticated;
GRANT ALL ON TABLE public.session TO service_role;


--
-- Name: TABLE site_settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.site_settings TO anon;
GRANT ALL ON TABLE public.site_settings TO authenticated;
GRANT ALL ON TABLE public.site_settings TO service_role;


--
-- Name: SEQUENCE site_settings_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.site_settings_id_seq TO anon;
GRANT ALL ON SEQUENCE public.site_settings_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.site_settings_id_seq TO service_role;


--
-- Name: TABLE songs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.songs TO anon;
GRANT ALL ON TABLE public.songs TO authenticated;
GRANT ALL ON TABLE public.songs TO service_role;


--
-- Name: SEQUENCE songs_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.songs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.songs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.songs_id_seq TO service_role;


--
-- Name: TABLE streaming_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.streaming_links TO anon;
GRANT ALL ON TABLE public.streaming_links TO authenticated;
GRANT ALL ON TABLE public.streaming_links TO service_role;


--
-- Name: SEQUENCE streaming_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.streaming_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.streaming_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.streaming_links_id_seq TO service_role;


--
-- Name: TABLE "twoFactor"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."twoFactor" TO anon;
GRANT ALL ON TABLE public."twoFactor" TO authenticated;
GRANT ALL ON TABLE public."twoFactor" TO service_role;


--
-- Name: TABLE "user"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."user" TO anon;
GRANT ALL ON TABLE public."user" TO authenticated;
GRANT ALL ON TABLE public."user" TO service_role;


--
-- Name: TABLE verification; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.verification TO anon;
GRANT ALL ON TABLE public.verification TO authenticated;
GRANT ALL ON TABLE public.verification TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2026_03_09; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_09 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_09 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_10; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_10 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_10 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_11; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_11 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_11 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_12; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_12 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_12 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_13; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_13 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_13 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_14; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_14 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_14 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_15; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_15 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_15 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict xgVe07oGeRrihi67rl4jUfcQvIQGvpafTLkh9pW93URBrT2WM3ZSZJEh6EVfmMN

