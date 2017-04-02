from django.utils import timezone
from dateutil import relativedelta
from pooldb.settings import TIME_ZONE
import pytz, datetime

def default_season():
    n = timezone.now()
    season_date = n + relativedelta.relativedelta(months=-1)
    return season_date.year - 2014


def calc_elo(result, opp, sef):
    if sef < 2100:
        K=32.
    elif sef < 2400:
        K=24.
    else:
        K=16.

    diff = opp - sef
    esp = 1. / (1. + 10.**(diff / 400.))
    return K * (result - esp)


def with_timezone(dt, tzinfo=TIME_ZONE):
    tz = pytz.timezone(tzinfo)
    return tz.localize(dt)


def end_of_week():
    today = datetime.date.today()
    eow = with_timezone(datetime.datetime.combine(today + datetime.timedelta(days=(7-today.isoweekday()%7)), datetime.datetime.min.time()))
    return eow


