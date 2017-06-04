from django.shortcuts import render
from administration.models import League, Team, Member, Player
from operator import itemgetter
import json

# Create your views here.

def index(request):
    return render(request, 'stats.html')


def ranking_players(request, league_name='Poke n Hope HK 8-Ball', rankby='points'):
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


def ranking_teams(request, league_name='Poke n Hope HK 8-Ball', rankby='points'):
    # TODO: now view_match and add_frame are using the same frame; maybe separate them for clarity
    # TODO: use django form and add validation
    lg = League.objects.get(name=league_name)

    ranking = lg.get_ranked_teams()
    summary = {}
    for t in ranking:
        summary[t.pk] = t.stats_summary()
    #print tr
    return render(request, 'team_ranking.html', {'ranking': ranking, 'summary': summary, 'last_update': lg.last_update})


def team_summary(request, team_pk):
    t = Team.objects.get(pk=team_pk)

    members = t.member_set.filter(ranking__gt=0).order_by('ranking')
    additional = t.member_set.filter(ranking=0)
    ranking = list(members) + list(additional)
    return render(request, 'ranking.html', {'ranking': ranking, 'last_update': ""})


def weekly_summary(request):
    lg = League.objects.get(pk=1)

    #ts, ps = lg.get_weekly_summary()
    ts, ps = lg.get_weekly_summary_id()

    def process_dict(d):
        new_res = {}
        for k, v in d.items():
            r = []
            for kk, vv in v.items():
                tmp = [str(kk)]
                s = 0
                for i in range(1,15):
                    tmp.append(vv.get(i, ''))
                    try:
                        s += max(tmp[-1], 0)
                    except TypeError:
                        continue
                if s == 0:
                    continue
                tmp.append(s)
                r.append(tmp)
                r = sorted(r, key=lambda x: (-x[-1], x[0]))
            new_res[str(k)] = r
        return new_res

    def process_dict_id(d):
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
                tmp.append(['', s])
                r.append(tmp)
                r = sorted(r, key=lambda x: (-x[-1][1], x[0]))
            new_res[str(k)] = r
        return new_res

    ts = process_dict_id(ts)
    ps = process_dict_id(ps)
    #top10w = top_n_weeks(ps['points'], 10)

    return render(request, 'summary_id.html', {'last_update': lg.last_update, "weeks": range(1,15), "ts": ts, "ps": ps})



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



