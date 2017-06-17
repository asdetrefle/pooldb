#!/bin/zsh

# drop remote db
heroku pg:reset DATABASE_URL --app pnh --confirm pnh
PGUSER=qijiec heroku pg:push pooldb DATABASE_URL --app pnh
