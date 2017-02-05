from django.shortcuts import render
from django.db.models import Q
from recording.models import Match
from pooldb.settings import TIME_ZONE
from collections import OrderedDict
import datetime, pytz

# Create your views here.

def with_timezone(dt, tzinfo=TIME_ZONE):
    tz = pytz.timezone(tzinfo)
    return tz.localize(dt)

def match_to_dict(l):
    d = OrderedDict((('Sunday',     []),
                     ('Monday',     []),
                     ('Tuesday',    []),
                     ('Wednesday',  []),
                     ('Thursday',   []),
                     ('Friday',     []),
                     ('Saturday',   [])))
    for m in l:
        d[m.create_date.strftime('%A')].append(m)
    return d

def index(request):
    today = with_timezone(datetime.datetime.today()).replace(hour=0,
                                                             minute=0,
                                                             second=0,
                                                             microsecond=0)

    start_date = today - datetime.timedelta(days=(today.isoweekday() % 7))
    end_date = today + datetime.timedelta(days=7)
    matches = Match.objects.filter(Q(create_date__gt=start_date), Q(create_date__lt=end_date))
    return render(request, 'schedule.html', {'matches': match_to_dict(matches)})

