#!/bin/bash -ex

# Note that this script creates a database user without a password.
# This is suitable only for development on your own single-user computer.
# Do not use this script as such for any production databases.

dir="$(dirname $0)"
database="$1"
username="$2"

if [ -z "$database" ] || [ -z "$username" ] ; then
    echo "Usage: $0 [database] [username]"
    exit 1
fi

# Usually you would like to run this as the postgres user.

# However, if you use this database for development work with a
# postgresql server running as yourself, you do not need the sudo
# statement, which is currently commented out.

# sudo -u postgres
psql postgres <<EOF
CREATE USER $username;
CREATE DATABASE $database WITH OWNER $username;
\c $database;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOF
