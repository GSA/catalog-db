#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset


expected_postgis_version=2.3.3

function usage () {
  cat <<-EOF >&2
	$0: [port] [host]

	port    the database port to connect to. Default: 5432
	EOF
  exit 1
}

port=${1:-5432}
host=${2:-catalog-db}

if [[ "$port" == '-h' || "$port" == '--help' ]]; then
  usage
fi

function test_setup () {
  # wait for port to become available
  while ! nc -w 1 -z "$host" "$port"; do
    sleep 1;
  done
}

function assert () {
  local expected="$1"
  local actual="$2"
  shift
  shift

  if [ "$expected" != "$actual" ]; then
    echo FAILED "$@" >&2
    echo "$expected != $actual" >&2
    exit 1
  fi
}

test_setup

postgis_version=$(psql --variable ON_ERROR_STOP=1 -At --quiet --port "$port" --host "$host" --username postgres ckan <<EOL
   SELECT postgis_lib_version();
EOL
)

assert "$expected_postgis_version" "$postgis_version" unexpected postgis version
