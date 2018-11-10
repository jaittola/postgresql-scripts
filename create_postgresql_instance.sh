#!/bin/bash

if [ $# -lt 1 ] ; then
    echo "Usage: $0 [postgresql data directory]"
    exit 1
fi

dir="$1"

initdb -D "$dir"
