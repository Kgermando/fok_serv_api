#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER fokad;
	CREATE DATABASE fokad;
	GRANT ALL PRIVILEGES ON DATABASE fokad TO fokad;
EOSQL