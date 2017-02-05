from django.shortcuts import render
from recording.models import Match
import datetime

# Create your views here.

def index(request):
    matches = Match.objects.filter(create_date__gt = datetime.datetime.today().date())
    return render(request, 'schedule.html', { 'matches': matches })

