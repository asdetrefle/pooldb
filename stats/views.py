from django.shortcuts import render
from administration.models import League, Team, Member, Player
from operator import itemgetter
import json
from .models import PlayerRanking
from django.contrib.auth.decorators import login_required, permission_required as _need_perm
from utils import local_date, default_season
import heapq

_need_login = login_required(login_url='/login/')

# Create your views here.

def index(request):
    return render(request, 'stats.html')


def ranking_players(request, s=default_season(), league_name='Poke n Hope HK 8-Ball'):
    # TODO: now view_match and add_frame are using the same frame; maybe separate them for clarity
    # TODO: use django form and add validation
    lg = League.objects.get(name=league_name)

    # match.update_all()
    """
    if request.method == 'POST':
        break_player = get_object_or_404(Member, pk=int(request.POST['break_player']))
        home_score = int(request.POST['home_score'])
        away_score = int(request.POST['away_score'])
        clear_player_id = request.POST['clear_player']
        nb = match.number_frames + 1
        frame = Frame(frame_number=nb, match=match, home_score=home_score, away_score=away_score, break_player=break_player)
        if clear_player_id == "":  # not a clearance
            frame.is_clearance = False
        else:
            clear_player_id = int(clear_player_id)
            frame.is_clearance = True
            clear_player = get_object_or_404(Member, pk=clear_player_id)
            frame.cleared_by = clear_player
        frame.save()
        match.update_all()
    """
    ranking = lg.get_ranked_players()
    return render(request, 'ranking.html', {'ranking': ranking, 'last_update': lg.last_update})


def ranking_teams(request, s=default_season(), league_name='Poke n Hope HK 8-Ball'):
    # TODO: now view_match and add_frame are using the same frame; maybe separate them for clarity
    # TODO: use django form and add validation
    lg = League.objects.get(name=league_name)

    ranking = lg.get_ranked_teams()
    #print ranking
    summary = {}
    for t in ranking:
        summary[t.pk] = t.stats_summary()

    return render(request, 'team_ranking.html', {'ranking': ranking, 'summary': summary, 'last_update': lg.last_update})


def team_summary(request, team_pk):
    t = Team.objects.get(pk=team_pk)

    members = t.member_set.filter(cancel_date__isnull=True, ranking__gt=0).order_by('ranking')
    additional = t.member_set.filter(cancel_date__isnull=True, ranking=0)
    ranking = list(members) + list(additional)
    return render(request, 'ranking.html', {'ranking': ranking, 'last_update': ""})


def standings(request, season=default_season()):
    lg = League.objects.get(pk=1)

    ts, ps = lg.get_weekly_summary_id(season)

    def process_dict_id(d, n, bold, *args):
        new_res = {}
        for k, v in d.items():
            r = []
            for kk, vv in v.items():
                tmp = [['', str(kk)]]
                s = 0
                for i in range(1,15):
                    tmp.append(vv.get(i, ['', '']))
                    try:
                        s += max(tmp[-1][1], 0)
                    except TypeError:
                        continue
                if s == 0:
                    continue

                if k in args:
                    s = sum_n_largest(tmp, n, bold)
                else:
                    s = sum_n_largest(tmp, 14, 1)
                tmp.append(['', s, 1])
                r.append(tmp)
                r = sorted(r, key=lambda x: (-x[-1][1], x[0]))
            new_res[str(k)] = r
        return new_res

    ts = process_dict_id(ts, 14, 1)
    ps = process_dict_id(ps, 9, 1, 'points')

    #top10w = top_n_weeks(ps['points'], 9)

    return render(request, 'standings.html', {"season": season, "weeks": range(1,15), "ts": ts, "ps": ps, 'last_update': lg.last_update})



def top_n_weeks(ps, n):

    res = {}

    for p in ps:
        pn = p[0][1]


        ws = [x[1] for x in p[1:-1] if x[1]!= '']
        print pn, ws

        if len(ws) <= n:
            res[pn] = sum(ws)
        else:
            ws.sort(reverse=True)
            res[pn] = sum(ws[:n])

    for w in res:
        print w, res[w]

    return res

def player_hist(request):
    rs = PlayerRanking.objects.filter(player__cancel_date__isnull=True).select_related("week", "player__player").order_by('player_id', 'serial_id')

    data = {}
    for r in rs:
        _ld = str(local_date(r.week.end_date))
        if r.pk not in data:
            data.setdefault(r.player_id, {})['name'] = str(r.player.player.name)
            data.setdefault(r.player_id, {})['id'] = r.player_id
        data.setdefault(r.player_id, {}).setdefault('ranking', []).append([_ld, r.ranking])
        data.setdefault(r.player_id, {}).setdefault('average', []).append([_ld, r.handicap])
        data.setdefault(r.player_id, {}).setdefault('elo', []).append([_ld, r.elo_points])

    #print Member.objects.get(pk=player_pk), PlayerRanking.objects.filter(player_id=player_pk)
    res = data.values()
    res.sort(key=lambda a: a['name'])
    return render(request, 'champaths.html', {'data': res})


def sum_n_largest(a, n, bold=0):
    if len(a)==0:
        return 0
    else:
        a[0].append(1)

    if len(a)<n+1:
        for e in a[1:]:
            if e[-1]!='':
                e.append(bold)
            else:
                e.append(0)
    else:
        res = []
        for i, e in enumerate(a[1:]):
            if e[-1]!='':
                heapq.heappush(res, (e[-1], i+1))

                if len(res)>n:
                    heapq.heappop(res)
                else:
                    pass
            else:
                pass

        t = res[0]
        s = 0
        for i, e in enumerate(a[1:]):
            if e[1]=='' or e[1]<t[0] or (e[1]==t[0] and i+1<t[1]):
                e.append(0)
            else:
                e.append(bold)
                s += e[1]
    return s

