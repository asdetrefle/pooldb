#run this code in django shell using execfile where everything is configued.

from schedule.models import MatchWeek, Season
from recording.models import LeagueMatch
from administration.models import Team, Player, Member
from datetime import timedelta
from django.db.models import Q
from django.core.exceptions import ObjectDoesNotExist


VENUE = {'R': 'Racks', 'B': 'Billidart'}

def shift_matchweek(from_week, to_week):
    season1 = Season.objects.get(pk=1)
    for i in range(from_week,to_week+1):
        last_week = MatchWeek.objects.get(pk=(i-1))
        this_week = MatchWeek.objects.get(pk=i)
        end_date = last_week.end_date + timedelta(days=7)
        this_week.start_date = last_week.end_date
        this_week.end_date   = end_date
        this_week.save()

    return

def create_leaguematch():
    f = open('schedule.csv', 'r')
    s = Season.objects.get(pk=1)
    for (i, l) in enumerate(f):
        m = l.strip().split(',')
        match = {}
        teams = set(range(1,9))
        for j in m:
            p1 = int(j[0])
            if p1 not in teams:
                #print j[0]
                continue
            else:
                assert j[1] == m[p1-1][1], "venue different"
                if i%2 == 0:
                    match[j[0]] = (m[p1-1][0], j[1])
                else:
                    match[m[p1-1][0]] = (j[0], j[1])
            teams.remove(p1)
            teams.remove(int(m[p1-1][0]))

        tues = True
        for k,v in match.items():
            t1 = Team.objects.get(team_number=int(k))
            t2 = Team.objects.get(team_number=int(v[0]))
            w = MatchWeek.objects.get(week_number=i+1)
            if tues and v[1] == 'R':
                mdate = w.start_date + timedelta(days=2, hours=20)
                tues = False
            else:
                mdate = w.start_date + timedelta(days=3, hours=20)

            historical = LeagueMatch.objects.filter(Q(away=t1),
                                                    Q(home=t2))
            if not historical:
                nm = LeagueMatch(venue=VENUE[v[1]], week=w, match_date=mdate, away=t1, home=t2)
            else:
                nm = LeagueMatch(venue=VENUE[v[1]], week=w, match_date=mdate, away=t2, home=t1)
            print w, mdate, nm
            nm.save()

    pass


def set_week():
    for i in range(4*14):
        m = LeagueMatch.objects.get(pk=i+1)
        w = MatchWeek.objects.get(pk=int(i/4)+1)
        m.week=w
        m.save()
    return


def add_members():
    f = open('members.csv', 'r')
    for l in f:
        [name, team] = l.strip().split(',')
        name_list = name.split()
        if len(name_list)>1:
            username = name_list[0].lower()+name_list[1][0].lower()
        else:
            pass
        t = Team.objects.get(team_number=int(team))
        print t

        try:
            p = Player.objects.get(username=username)
            print p
        except ObjectDoesNotExist:
            p = Player.objects.create(username=username,
                                      name=name,
                                      sex='M')
            p.save()

        print username
        try:
            m = Member.objects.get(Q(player=p), Q(group=t))
        except ObjectDoesNotExist:
            m = Member.objects.create(player=p, group=t)
            m.save()

    return


def main():
    #create_leaguematch()
    #shift_matchweek(2,14)
    #set_week()
    add_members()


if __name__=='__main__':
    main()

