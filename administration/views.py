from django.shortcuts import render
from django.http import HttpResponse, Http404
# Create your views here.
from .models import Team, Player, League


def index(request):
    # return HttpResponse("Hello World!")
    raise Http404
    #return render(request, 'base_site.html', {'content': 'Bonjour Les Amis.'})


def team_profile(request, team_pk):
    t = Team.objects.get(pk=team_pk)
    return render(request, 'team_profile.html', {'team': t})

def user_profile(request, player_pk):
    p = Player.objects.get(pk=player_pk)
    return render(request, 'playe_profile.html', {'team': t})


