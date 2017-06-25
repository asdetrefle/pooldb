from django.contrib import admin

from .models import Player, Member, Group, Team, TeamSeasonal, League

# Register your models here.

admin.site.register(Player)
admin.site.register(Member)
admin.site.register(Group)
admin.site.register(Team)
admin.site.register(TeamSeasonal)
admin.site.register(League)
