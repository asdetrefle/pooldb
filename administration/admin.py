from django.contrib import admin

from .models import Player, Member, Group, Team

# Register your models here.

admin.site.register(Player)
admin.site.register(Member)
admin.site.register(Group)
admin.site.register(Team)
