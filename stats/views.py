from django.shortcuts import render
from administration.models import League, Team, Member, Player

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
    ranking = lg.get_ranked_teams()
    summary = {}
    for t in ranking:
        summary[t.pk] = t.stats_summary()
    #print tr
    return render(request, 'team_ranking.html', {'ranking': ranking, 'summary': summary, 'last_update': lg.last_update})


def team_summary(request, team_pk, rankby='points'):
    t = Team.objects.get(pk=team_pk)

    members = t.member_set.filter(ranking__gt=0).order_by('ranking')
    additional = t.member_set.filter(ranking=0)
    ranking = list(members) + list(additional)
    return render(request, 'ranking.html', {'ranking': ranking, 'last_update': ""})
