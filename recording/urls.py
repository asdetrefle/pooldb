from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='recording'),
    url(r'^match/(?P<match_id>\d+)/$', views.view_match, name='view_match'),
]
