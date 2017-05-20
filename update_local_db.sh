#!/bin/zsh

# dump current local for backup
pg_dump pooldb -f dump.sql
dropdb pooldb
heroku pg:pull DATABASE_URL pooldb --app pnh
