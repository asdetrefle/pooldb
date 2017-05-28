from django.shortcuts import render
from django.db.models import Q
from django.utils import timezone
from recording.models import Match, LeagueMatch
from collections import OrderedDict
import datetime, pytz
from utils import default_season, with_timezone, end_of_week
from .models import Season, MatchWeek

# Create your views here.

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

def current_week():
    season = default_season()
    s = Season.objects.get(season=season)
    w = MatchWeek.objects.filter(end_date__gte=timezone.now()).order_by('week_number')
    return w[0].week_number

def index(request, season=default_season()):
    s = Season.objects.get(season=season)
    w = MatchWeek.objects.filter(season=s)
    return listweek(request, current_week())

def listweek(request, week_number, season=default_season()):
    s = Season.objects.get(season=season)
    wn = min(14, int(week_number))
    wn = max(1, wn)
    w = MatchWeek.objects.get(Q(season=s), Q(week_number=wn))
    eow = end_of_week()

    start_date = with_timezone(datetime.datetime.combine(w.start_date, datetime.datetime.min.time()))
    end_date = with_timezone(datetime.datetime.combine(w.end_date, datetime.datetime.min.time()))
    matches = LeagueMatch.objects.filter(Q(match_date__gt=start_date), Q(match_date__lt=end_date)).order_by('match_date', 'venue')
    return render(request, 'schedule.html', {'week': w, 'matches': match_to_dict(matches), 'eow': eow})

