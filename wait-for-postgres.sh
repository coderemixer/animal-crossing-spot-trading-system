#!/bin/sh
# wait-for-postgres.sh

set -e

host="db"
shift
cmd="$@"

until PGPASSWORD=postgres psql -h "$host" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd
