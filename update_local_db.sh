# dump current local for backup
pg_dump pooldb dump.sql
dropdb poodb
heroku pg:pull DATABASE_URL poodb --app pnh
