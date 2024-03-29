from django.contrib import admin

from .models import Frame, Match, LeagueMatch, LeagueFrame

# Register your models here.

class LeagueFrameAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Information', {'fields': ['leg', 'home_player', 'away_player', 'break_player']}),
        ('Scores',      {'fields': ['home_score', 'away_score']}),
        ('Clearance',   {'fields': ['is_clearance', 'cleared_by']})
    ]


class LeagueMatchAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Information', {'fields': ['leg_number', 'number_frames', 'handicap', 'venue']}),
        ('Teams',       {'fields': ['home', 'away']}),
        ('Scores',      {'fields': ['home_score', 'away_score', 'winner']}),
        ('Defaults',    {'fields': ['match_date', 'pool_type', 'score_type', 'table_size']}),
    ]


admin.site.register(Match)
admin.site.register(LeagueMatch) #, LeagueMatchAdmin)
admin.site.register(LeagueFrame) # , LeagueFrameAdmin)
admin.site.register(Frame)

