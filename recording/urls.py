from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='recording'),
    url(r'^match/$', views.listmatch, name='listmatch'),
    url(r'^leg/$', views.listleg, name='listleg'),
    url(r'^match/type=(?P<type_>\w+)_id=(?P<match_id>\d+)/$', views.match_view, name='match_view'),
    url(r'^match/type=(?P<type_>\w+)_id=(?P<match_id>\d+)/init/$', views.initialize, name='match_initialize'),
    url(r'^match/type=(?P<type_>\w+)_id=(?P<match_id>\d+)/edit/$', views.edit, name='match_edit'),
    url(r'^leg/(?P<leg_id>\d+)/$', views.leg_view, name='leg_view'),
    url(r'^leg/(?P<leg_id>\d+)/close/$', views.leg_close, name='leg_close'),

]
