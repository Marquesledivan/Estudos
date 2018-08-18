#!bin/bash
psql --command "CREATE USER roundcube WITH SUPERUSER PASSWORD '4linux';"
createdb -O roundcube roundcubemail
cat /tmp/postgres.initial.sql | psql roundcubemail
