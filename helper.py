#run this code in django shell using execfile where everything is configued.

from schedule.models import MatchWeek, Season
from recording.models import LeagueMatch
from administration.models import Team, Player, Member
from datetime import timedelta, datetime
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
                nm = LeagueMatch(venue=VENUE[v[1]], week=w, match_date=mdate, away=t1, home=t2, score_type='P', break_type='A')
            else:
                nm = LeagueMatch(venue=VENUE[v[1]], week=w, match_date=mdate, away=t2, home=t1, score_type='P', break_type='A')
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
    f = open('s03_pl.csv', 'r')
    count = 0
    all_user = set()
    for l in f:
        member = l.strip().split(',')
        team, prenom, nom, gender = member[0], member[1], member[2], member[3]
        name = prenom + ' ' + nom
        if prenom[-3:]=='(c)':
            prenom = prenom[:-3]
        username = prenom.lower()+nom[0].lower()
        t = Team.objects.get(name=team)
        all_user.add(username)

        try:
            p = Player.objects.get(username=username)
            count += 1
            print username, p, name
            continue
        except ObjectDoesNotExist:
            print "----- NEW: ", username, name
            p = Player.objects.create(username=username,
                                      name=name,
                                      sex=gender)
            p.save()
            pass


        #print t, username, count

        try:
            m = Member.objects.get(Q(player=p), Q(group=t))
        except ObjectDoesNotExist:
            m = Member.objects.create(player=p, group=t)
            m.save()

    print "---"

    all_members = Member.objects.all()
    print len(all_user)
    print len(all_members)

    print [ m.player.username for m in all_members if m.player.username not in all_user]

    return


def export_to_cal(s):
    from django.utils import timezone
    from icalendar import Calendar, Event

    season = Season.objects.get(season=s)
    mws = season.matchweek_set.filter(season=season)

    td = {}

    for w in mws:
        ms = w.leaguematch_set.all()
        for m in ms:
            td.setdefault(m.home, []).append(m)
            td.setdefault(m.away, []).append(m)

    for t, ms in td.items():
        cal = Calendar()
        for m in ms:
            opponent = m.home if t==m.away else m.away
            event = Event()
            event.add('summary', 'Match {} vs. {}'.format(m.home, m.away))
            event.add('dtstart', m.match_date)
            event.add('dtend', m.match_date+timedelta(hours=3))
            event.add('location', m.venue)
            cal.add_component(event)

        cal_name = '{}.ics'.format(t).replace(" ", "_").replace("'", "")

        f = open(cal_name, 'wb')
        f.write(cal.to_ical())
        f.close()
    pass



def main():
    #create_leaguematch()
    shift_matchweek(3,14)
    #set_week()
    #add_members()


if __name__=='__main__':
    main()

