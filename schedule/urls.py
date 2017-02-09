from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='schedule'),
    url(r'week=(?P<week_number>\d+)/$', views.listweek, name='listweek')
]
