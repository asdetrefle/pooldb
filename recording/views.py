from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import Match, Leg, Frame, LeagueFrame
from .forms import LeagueFrameForm
from administration.models import Member, Team, League

# Create your views here.


def index(request):
    # return HttpResponse("Hello World!")
    return render(request, 'base_site.html', {'content': 'Hello recording'})


def view_match(request, match_id):
    # TODO: now view_match and add_frame are using the same frame; maybe separate them for clarity
    # TODO: use django form and add validation
    match = get_object_or_404(Match, pk=match_id)
    match.update_all()
    if request.method == 'POST':
        break_player = get_object_or_404(Member, pk=int(request.POST['break_player']))
        home_score = int(request.POST['home_score'])
        away_score = int(request.POST['away_score'])
        clear_player_id = request.POST['clear_player']
        nb = match.number_frames + 1;
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
    match.save()
    frames = match.frame_set.all()
    return render(request, 'match.html', {'match': match, 'frames': frames})


def view_league_frame(request, league_frame_id):
    frame = get_object_or_404(LeagueFrame, pk=frame_id)
    return render(request, 'league_frame.html', {'league_frame': frame})


def create_league_frame(request):
    if request.method =='POST':
        form = LeagueFrameForm(request.POST)
        if lf.is_valid():
            new_lf = form.save()
            return HttpResponseRedirect('/league_frame/' + str(new_article.pk))

    form = LeagueFrameForm(request)
    return render(request, '.html', {'form': form})

