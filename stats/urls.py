from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='stats'),
    url(r'^ranking/players$', views.ranking_players, name='ranking_players'),
    url(r'^ranking/teams$', views.ranking_teams, name='ranking_teams'),
    url(r'^ranking/team/(?P<team_pk>\d+)/$', views.team_summary, name='team_summary'),
    url(r'^weekly_summary/$', views.weekly_summary, name='weekly_summary'),
]
