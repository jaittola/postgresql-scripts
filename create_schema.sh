#!/bin/bash -exu

dir="$(dirname $0)"
conninfo="$1"

if [ -z "$conninfo" ] ; then
    echo "Usage: $0 [connection info"
    echo "   for example, $0 postgresql://mcal@localhost/mcaldb"
    exit 1
fi

psql -d "$conninfo" -f "./create_schema.sql"
