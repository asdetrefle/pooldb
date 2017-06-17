"""pooldb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
from django.views.generic import RedirectView
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views

from . import views

urlpatterns = [
    url(r'^grappelli/', include('grappelli.urls')), # grappelli URLS
    url(r'^admin/', admin.site.urls),
    url(r'^administration/', include('administration.urls')),
    url(r'^profile/', include('administration.urls')),
    url(r'^recording/', include('recording.urls')),
    url(r'^stats/', include('stats.urls')),
    url(r'^schedule/', include('schedule.urls')),
    url(r'^$', views.index_redirect, name='home_redirect'),
    url(r'^home/$', views.index, name='home'),
    url(r'^login/$', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    url(r'^logout/$', auth_views.LogoutView.as_view(next_page='/'), name='logout'),
    url(r'^change-password/$', auth_views.PasswordResetView.as_view(), name='password_change'),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + \
    static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
