from django.shortcuts import render
from recording.models import LeagueMatch
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.utils import timezone
import datetime

# Create your views here.

def index(request):
    return render(request, 'index.html')

def index_redirect(request):
    now = timezone.now()
    now = timezone.localtime(now)
    today = str(now.date())
    matches = LeagueMatch.objects.filter(match_date__date=today)
    if matches and now.hour>=20:
        return HttpResponseRedirect('/recording/live/')
    else:
        return render(request, 'index.html')

