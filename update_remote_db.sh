# drop remote db
heroku pg:reset DATABASE_URL --app pnh --pnh
heroku pg:push
