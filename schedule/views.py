from django.shortcuts import render
from django.db.models import Q
from recording.models import Match
from pooldb.settings import TIME_ZONE
from collections import OrderedDict
import datetime, pytz
from utils import default_season
from .models import Season, MatchWeek

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
        d[m.match_date.strftime('%A')].append(m)
    return d

def index(request, week_number=1, season=default_season()):
    s = Season.objects.get(season=season)
    w = MatchWeek.objects.get(Q(season=s), Q(week_number=week_number))
    start_date = with_timezone(datetime.datetime.combine(w.start_date, datetime.datetime.min.time()))
    end_date = with_timezone(datetime.datetime.combine(w.end_date, datetime.datetime.min.time()))
    matches = Match.objects.filter(Q(match_date__gt=start_date), Q(match_date__lt=end_date))
    return render(request, 'schedule.html', {'week': w, 'matches': match_to_dict(matches)})

