# Scheduling with Celery

## Setup

Install `RabbitMQ` and `django-celery-beat`.

## Run

Run the following 3 commands in different shells
```
rabbitmq-server
celery -A pooldb beat -l info -S django
celery -A pooldb worker -l info
```

## Scheduling

Tasks can be defined in the code and scheduled via the django admin app. See `recording/tasks.py` for example.

## Links

<http://docs.celeryproject.org/en/latest/userguide/periodic-tasks.html>
<http://stackoverflow.com/questions/17071632/celerybeat-not-executing-periodic-tasks>
<http://docs.celeryproject.org/en/latest/userguide/periodic-tasks.html#beat-custom-schedulers>
