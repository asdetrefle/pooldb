import os
from models import MatchWeek
from models import Season
import datetime
from utils import with_timezone
from administration.models import Team
from recording.models import LeagueMatch

VENUE = {'R': 'Racks', 'B': 'Billidart'}

def make_matchweek(season, start, weeks):
    s = Season.objects.get(season=season)

    sd = with_timezone(datetime.datetime.strptime(start, '%Y-%m-%d'))
    ed = sd + datetime.timedelta(days=7)

    for i in range(1, weeks+1):

        mw = MatchWeek(week_number=i,
                    season=s,
                    start_date=sd,
                    end_date=ed)
        sd = ed
        ed = ed + datetime.timedelta(days=7)

        mw.save()
    return


def parse_matches(fn):
    dir_path = os.path.dirname(os.path.realpath(__file__))
    f = open(os.path.join(dir_path, fn), 'r')
    match = {}

    for (i, l) in enumerate(f):
        k = len(l)

        n = int(k/3)
        print n
        for j in range(n):
            if j==0:
                wd = 2
            else:
                wd = 3
            match.setdefault(i+1, []).append(((wd, l[j*3+2].upper()), (int(l[j*3]), int(l[j*3+1]))))

    # Note : match format are (( weekday, lieu ), ( home, away ))
    # Example :
    # match = { 1: [((2, 'R'), (1, 7)), ((3, 'B'), (2, 6)), ...},
    #           2: [ ...},
    #           3: [ ...},
    #         }
    return match


def make_leaguematch(season, md):
    s = Season.objects.get(season=season)
    weeks = md.keys()
    weeks.sort()

    for i in weeks:
        for k,v in md[i]:
            th = Team.objects.exclude(close_date__isnull=False).get(team_number=v[0])
            ta = Team.objects.exclude(close_date__isnull=False).get(team_number=v[1])
            w = MatchWeek.objects.get(season=s, week_number=i)

            mdate = w.start_date + datetime.timedelta(days=k[0], hours=20)

            nm = LeagueMatch(venue=VENUE[k[1]], season=s, week=w, match_date=mdate, home=th, away=ta, score_type='P', break_type='A')
            print w, mdate, nm
            nm.save()

    return
