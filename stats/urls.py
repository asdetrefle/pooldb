from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='stats'),
    url(r'^ranking/$', views.ranking_league, name='ranking_league'),
]
