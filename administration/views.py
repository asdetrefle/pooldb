from django.shortcuts import render
from django.http import HttpResponse, Http404
# Create your views here.


def index(request):
    # return HttpResponse("Hello World!")
    raise Http404
    #return render(request, 'base_site.html', {'content': 'Bonjour Les Amis.'})
