from django.shortcuts import render
from django.http import HttpResponse, Http404
# Create your views here.
from .models import Team


def index(request):
    # return HttpResponse("Hello World!")
    raise Http404
    #return render(request, 'base_site.html', {'content': 'Bonjour Les Amis.'})


def view_team(request, team_pk):
    t = Team.objects.get(pk=team_pk)
    print t.logo.url
    return render(request, 'team_profile.html', {'team': t})
