from django.utils import timezone
from dateutil import relativedelta
from pooldb.settings import TIME_ZONE
import pytz, datetime


def local_date(dt):
    local = dt.astimezone(timezone.get_current_timezone())
    return local.date()

def default_season():
    #n = timezone.now()
    #season_date = n + relativedelta.relativedelta(months=-1)
    return 4


def calc_elo(result, opp, sef):
    if sef <= 210:
        K=32.
    elif sef <= 240:
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
    from stats.models import PlayerRanking, TeamRanking
    from administration.models import League, Member
    from recording.models import LeagueMatch
    lg = League.objects.get(pk=lgpk)
    ts = lg.team_set.filter(close_date__isnull=True)
    print len(ts), ts

    """
    lms = LeagueMatch.objects.filter(pk__gt=116, pk__lt=125)
    print len(lms), lms
    for lm in lms:
        lm.is_completed = False
        lm.is_submitted = False
        lm.save()
        ms = lm.get_matches()
        for m in ms:
            m.is_completed = False
            m.is_submitted = False
            m.save()


    for t in ts:
        print t
        tr = t.teamranking_set.get(week__serial_id=15)
        t.ranking = tr.ranking
        t.season_points = tr.season_points
        t.total_points = tr.total_points
        t.season_clearances = tr.season_clearances
        t.total_clearances = tr.total_clearances
        t.total_matches_played = tr.total_matches_played
        t.total_matches_won   = tr.total_matches_won
        t.season_matches_played = tr.season_matches_played
        t.season_matches_won   = tr.season_matches_won
        t.total_legs_played   = tr.total_legs_played
        t.total_legs_won      = tr.total_legs_won
        t.season_legs_played  = tr.season_legs_played
        t.season_legs_won     = tr.season_legs_won
        t.save()

        pass
    """

    prs = PlayerRanking.objects.filter(week__serial_id=15)
    rms = [r.player for r in prs]

    ms = Member.objects.filter(cancel_date__isnull=True)


    for m in ms:
        if m in rms:
            mr = m.playerranking_set.get(week__serial_id=15)
            mr.ranking = m.ranking
            mr.save()
    """
            m.points = mr.elo_points
            m.ranking = mr.ranking
            m.season_points = mr.season_points
            m.total_points = mr.total_points
            m.handicap = mr.handicap
            m._point_adj = 0
            m.season_clearances = mr.season_clearances
            m.total_clearances = mr.total_clearances
            m.total_matches_played = mr.total_matches_played
            m.total_matches_won = mr.total_matches_won
            m.season_matches_played = mr.season_matches_played
            m.season_matches_won = mr.season_matches_won
            m.save()
        else:
            m.points = 200.
            m.ranking = 0
            m.handicap = -1.0
            m.season_points = 0
            m.total_points = 0
            m._point_adj = 0
            m.season_clearances = 0
            m.total_clearances = 0
            m.total_matches_played = 0
            m.total_matches_won = 0
            m.season_matches_played = 0
            m.season_matches_won = 0
            m.save()
    lg.rank_players()
    lg.rank_teams()

    """

    for i in [16, 17]:
        lms = LeagueMatch.objects.filter(week__serial_id=i)
        for lm in lms:
            lm.completes()
            lm.submits()
        lg.update_players_handicap(i-14)
        lg.rank_players()
        lg.rank_teams()
        lg.create_ranking(i-14)

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



def rpm():
    from administration.models import Member
    from recording.models import LeagueMatch
    wl = range(1, 14)

    total_p = {}
    total_f = {}

    rpm = {}

    def get_match_handicap(home, away):
        away_handicap = {i: round(total_p.get(i) / total_f.get(i), 1) for i in away if i in total_p}
        home_handicap = {i: round(total_p.get(i) / total_f.get(i), 1) for i in home if i in total_p}

        #print away_handicap, home_handicap

        return home_handicap, away_handicap


    for w in wl:
        lms = LeagueMatch.objects.filter(week_id=w)
        print w

        print total_p, total_f
        for lm in lms:
            print lm
            ms = lm.get_matches()
            players = lm._get_ordered_players()
            hh, ah = get_match_handicap(players['home'], players['away'])
            print hh, ah
            for m in ms:
                if m.home.pk in hh and m.away.pk in ah:
                    rpm[m.home.pk] = rpm.get(m.home.pk, 0) + (m.home_score - m.away_score) - (hh[m.home.pk] - ah[m.away.pk]) * 2.
                    rpm[m.away.pk] = rpm.get(m.away.pk, 0) + (m.away_score - m.home_score) - (ah[m.away.pk] - hh[m.home.pk]) * 2.

                total_p[m.home.pk] = total_p.get(m.home.pk, 0) + m.home_score
                total_p[m.away.pk] = total_p.get(m.away.pk, 0) + m.away_score
                total_f[m.home.pk] = total_f.get(m.home.pk, 0) + 2.
                total_f[m.away.pk] = total_f.get(m.away.pk, 0) + 2.

    for k, v in rpm.items():
        m = Member.objects.get(pk=k)
        print m.player, v

    return

def perm():
    from guardian.shortcuts import assign_perm
    from django.contrib.auth.models import User
    from recording.models import LeagueMatch
    lm = LeagueMatch.objects.get(pk=113)
    brad = User.objects.get(username='bradt')
    brad.has_perm('init_leaguematch', lm)
    assign_perm('init_leaguematch', brad, lm)
    dep = User.objects.get(username='deepv')
    assign_perm('init_leaguematch', dep, lm)


if __name__=='__main__':
    pass
