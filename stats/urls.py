from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='stats'),
    url(r'^ranking/players$', views.ranking_players, name='ranking_players'),
    url(r'^ranking/teams$', views.ranking_teams, name='ranking_teams'),
    url(r'^ranking/team/(?P<team_pk>\d+)/$', views.team_summary, name='team_summary'),
    url(r'^standings/$', views.standings, name='standings'),
    url(r'^standings/(?P<season>\d+)/$', views.standings, name='standings'),
    url(r'^champaths/$', views.player_hist, name='player_hist'),
]
