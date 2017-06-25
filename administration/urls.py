from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^team/(?P<team_pk>\d+)/$', views.team_profile, name='team_profile'),
]
