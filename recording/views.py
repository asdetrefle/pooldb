from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import Match, Leg, Frame, LeagueFrame
from .forms import LeagueFrameForm

# Create your views here.


def index(request):
    # return HttpResponse("Hello World!")
    return render(request, 'base_site.html', {'content': 'Hello recording'})


def view_match(request, match_id):
    match = get_object_or_404(Match, pk=match_id)
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

