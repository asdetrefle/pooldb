from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='stats'),
    url(r'^ranking/players$', views.ranking_players, name='ranking_players'),
    url(r'^ranking/teams$', views.ranking_teams, name='ranking_teams'),
]
