from django.contrib import admin

from .models import Frame, Match, Leg, LeagueFrame

# Register your models here.

class LeagueFrameAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Information', {'fields': ['leg', 'home_player', 'away_player', 'break_player']}),
        ('Scores',      {'fields': ['home_score', 'away_score']}),
        ('Clearance',   {'fields': ['is_clearance', 'cleared_by']})
    ]


class LegAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Information', {'fields': ['leg_number', 'number_frames', 'handicap', 'venue']}),
        ('Teams',       {'fields': ['home_team', 'away_team']}),
        ('Scores',      {'fields': ['home_score', 'away_score', 'winner']}),
        ('Defaults',    {'fields': ['create_date', 'pool_type', 'score_type', 'table_size']}),
    ]


admin.site.register(Match)
admin.site.register(Leg, LegAdmin)
admin.site.register(LeagueFrame, LeagueFrameAdmin)
admin.site.register(Frame)

