from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='recording'),
    url(r'^archive/$', views.index, name='recording1'),
    url(r'^archive/(?P<type_>\w+)/$', views.listarchive, name='listarchive'),
    url(r'^archive/(?P<type_>\w+)/page/(?P<page>\d+)/$', views.listarchive, name='listarchive_page'),
    url(r'^live/$', views.listlive, name='listlive'),
    #url(r'^leg/$', views.listleg, name='listleg'),
    url(r'^(?P<type_>\w+)/id/(?P<match_id>\d+)/$', views.match_view, name='match_view'),
    url(r'^live/(?P<type_>\w+)/id/(?P<match_id>\d+)/init/$', views.initialize, name='match_initialize'),
    url(r'^live/(?P<type_>\w+)/id/(?P<match_id>\d+)/approve/$', views.approve, name='match_approve'),
    url(r'^live/(?P<type_>\w+)/id/(?P<match_id>\d+)/init/submit/$', views.init_submit, name='match_init_submit'),
    url(r'^live/(?P<type_>\w+)/id/(?P<match_id>\d+)/edit/$', views.edit, name='match_edit'),
    url(r'^update/week/(?P<week_number>\d+)/$', views.update_weekly_stats, name='update_weekly_stats'),
    #url(r'^leg/(?P<leg_id>\d+)/close/$', views.leg_close, name='leg_close'),
]
