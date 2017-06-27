from django.contrib import admin

# Register your models here.
from .models import PlayerRanking, TeamRanking

# Register your models here.

admin.site.register(PlayerRanking)
admin.site.register(TeamRanking)
