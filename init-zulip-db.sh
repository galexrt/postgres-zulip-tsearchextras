#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE SCHEMA IF NOT EXISTS $POSTGRES_DB AUTHORIZATION $POSTGRES_USER;
    CREATE EXTENSION IF NOT EXISTS unaccent SCHEMA $POSTGRES_DB;
    CREATE EXTENSION IF NOT EXISTS tsearch_extras SCHEMA $POSTGRES_DB;
EOSQL
