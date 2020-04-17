#!/bin/bash

# This test file is executed by the docker-compose test container for testing
# against the catalog-db container.

set -o errexit
set -o pipefail
set -o nounset


expected_postgis_version=2.5.2

function usage () {
  cat <<-EOF >&2
	$0: [port] [host]

	port    the database port to connect to. Default: 5432
	EOF
  exit 1
}

port=${1:-5432}
host=${2:-db}

if [[ "$port" == '-h' || "$port" == '--help' ]]; then
  usage
fi

function test_setup () {
  # wait for port to become available
  echo -n "Waiting for $host:$port to become available..."
  while ! nc -w 1 -z "$host" "$port"; do
    sleep 1;
  done

  echo pass
}

function test_sql () {
  local database=$1

  # Read SQL from stdin
  psql --variable ON_ERROR_STOP=1 -At --quiet --port "$port" --host "$host" --username postgres "$database" <&0
}

function test_postgis_version () {
  local database=$1

  echo -n "Check PostGIS is correct version for $database... "
  test_sql "$database" <<-EOSQL
	DO \$\$
	DECLARE postgis_version TEXT;
	BEGIN
	  postgis_version := (SELECT postgis_lib_version());
	  IF '$expected_postgis_version' != postgis_version
	  THEN
	    RAISE EXCEPTION 'Unexpected PostGIS version % != % ', '$expected_postgis_version', postgis_version;
	  END IF;
	END
	\$\$;
	EOSQL

  echo pass
}

test_setup
test_postgis_version ckan
