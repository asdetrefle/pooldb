from django.shortcuts import render, render_to_response, redirect
from recording.models import LeagueMatch
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.utils import timezone
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.template import RequestContext

# Create your views here.

def index(request):
    return render(request, 'index.html')

def index_redirect(request):
    now = timezone.now()
    now = timezone.localtime(now)
    today = str(now.date())
    matches = LeagueMatch.objects.filter(match_date__date=today)
    if matches and now.hour>=19 and now.hour<=22:
        return HttpResponseRedirect('/recording/live/')
    else:
        return render(request, 'index.html')


"""
### Custom login view template

def login_user(request):
    logout(request)
    username = password = ''
    if request.POST:
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect('/home/')
    return render(request, 'login.html')
"""

