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

def start_of_week():
    today = datetime.date.today()
    sow = with_timezone(datetime.datetime.combine(today - datetime.timedelta(days=(today.isoweekday()%7)), datetime.datetime.min.time()))
    return sow

def reset_submit(lgpk, week):
    from administration.models import League
    from recording.models import LeagueMatch
    lg = League.objects.get(pk=lgpk)
    ts = lg.team_set.all()

    """
    lms = LeagueMatch.objects.filter(is_submitted=True)
    for lm in lms:
        lm.is_submitted = False
        lm.save()
        ms = lm.get_matches()
        for m in ms:
            m.is_submitted = False
            m.save()

    for t in ts:
        for m in t.member_set.all():
            m.points = 200.
            m.raw_points = 0
            m.ranking = 0
            m.handicap = -1
            m._point_adj = 0
            m.total_matches_played = 0
            m.total_matches_won = 0
            m.total_clearance = 0
            m.season_matches_played = 0
            m.season_matches_won = 0
            m.season_clearance = 0
            m.save()

        t.ranking = 0
        t.total_matches_played = 0
        t.total_matches_won   = 0
        t.season_matches_played = 0
        t.season_matches_won   = 0
        t.total_legs_played   = 0
        t.total_legs_won      = 0
        t.season_legs_played  = 0
        t.season_legs_won     = 0
        t.save()


    """
    for i in range(1,week):
        lms = LeagueMatch.objects.filter(week_id=i)
        for lm in lms:
            lm.submits()
        lg.rank_players()
        lg.rank_teams()
    return


def get_weekly(id_):
    from administration.models import Member
    from recording.models import LeagueMatch

    res ={}
    mem = Member.objects.get(pk=id_)
    hlm = LeagueMatch.objects.filter(home=mem.group).order_by('week_id')

    for lm in hlm:
        ms =lm.get_matches()

        for m in ms:
            if m.home==mem:
                res[lm.week_id] = res.get(lm.week_id, 0) + m.home_score

    hlm = LeagueMatch.objects.filter(away=mem.group).order_by('week_id')

    for lm in hlm:
        ms =lm.get_matches()

        for m in ms:
            if m.away==mem:
                res[lm.week_id] = res.get(lm.week_id, 0) + m.away_score
    wl = res.keys()

    wl.sort()

    for w in wl:
        print w, res[w]



"""
def rpm():
    from administration.models import Member
    from recording.models import LeagueMatch
    wl = range(1, 14)

    total_p = {}

    for w in wl:
        lms = LeagueMatch.objects.filter(week_id=w)

        for lm in lms:
            ms = lm.get_matches()
            for m in ms:
                if m.winner is not None:
"""
