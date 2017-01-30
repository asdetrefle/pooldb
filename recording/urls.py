from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='recording'),
    url(r'^match/$', views.match_index, name='match_index'),
    url(r'^match/(?P<match_id>\d+)/$', views.match_view, name='match_view'),
]
