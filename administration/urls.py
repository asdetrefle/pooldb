from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^team/(?P<team_pk>\d+)/$', views.view_team, name='view_team'),
]
