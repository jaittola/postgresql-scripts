#!/bin/bash -ex

datadir="$1"

if [ -z "$datadir" ] ; then
    echo "Usage: $0 [database directory]"
    exit 1
fi

pg_ctl -D "$datadir" stop
