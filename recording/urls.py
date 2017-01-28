from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='recording'),
    url(r'^match/(?P<match_id>\d+)/$', views.show_match, name='show_match'),
]