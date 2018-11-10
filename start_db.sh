#!/bin/bash -ex

datadir="$1"
logfile="$2"

if [ -z "$datadir" ] || [ -z "$logfile" ] ; then
    echo "Usage: $0 [database directory] [logfile]"
    exit 1
fi

pg_ctl -D "$datadir" -l "$logfile" start
