from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import Match

# Create your views here.


def index(request):
    # return HttpResponse("Hello World!")
    return render(request, 'base_site.html', {'content': 'Hello recording'})


def show_match(request, match_id):
    match = get_object_or_404(Match, pk=match_id)
    frames = match.frame_set.all()
    return render(request, 'match.html', {'match': match, 'frames': frames})
