# Scripts for creating a local PostgreSQL database for testing and development

I sometimes need a PostgreSQL database for development purposes. It is
often a pain to set up users, permissions, and schemas in a
system-wide installation. It is much simpler just to create a local
database instance that can be deleted when it is no longer
needed. This repository contains scripts that do exactly that.

## To create a database

1. Change db_user and db_name in 00-CREATE.sh to values that are
suitable for you.
1. Edit create_schema.sql to contain your database schema
1. Run `./00-CREATE.sh`

## To access the database

After running the create script, you can connect to the database by
running `psql postgresql://DBUSER@localhost/DBNAME`, where DBUSER is
the user name and DBNAME is the database name that you wrote in to
00-CREATE.sh.

## To stop a database process created with 00-CREATE.sh

Run `./stop_db.sh local-database/`

## To restart a previously stopped database

Run `./start_db.sh local-database/`

## To delete a database

1. Stop the database by running `./stop_db.sh local-database/`
1. Run `rm -rf local-database/`

## Caveats

The scripts in this directory create a database without
password. Hence the database is not suitable for any kind of
production use. To create databases for production work, see the
official documentation of PostgreSQL on how to set up access
limitations.

The scripts use PostgreSQL's default settings for everything. Hence,
the database created with these scripts will not work if another
database (for example, created and started by the database packages)
with default settings is already running on your computer. For
example, another database will probably be using the same TCP and UNIX
domain sockets that this database wants to use.
