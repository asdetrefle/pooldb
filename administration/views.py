from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.


def index(request):
    # return HttpResponse("Hello World!")
    return render(request, 'base_site.html', {'content': 'Bonjour Les Amis.'})
