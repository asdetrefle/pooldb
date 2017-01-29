from django.forms import ModelForm, ValidationError
from .models import LeagueFrame, Leg, Match, Frame

class LeagueFrameForm(ModelForm):
    class Meta:
        model = LeagueFrame
        fields = ['leg', 'home_player', 'away_player', 'break_player', 'home_score',
                  'away_score', 'is_clearance', 'cleared_by']

    def clean(self):
        cleaned_data = super(LeagueFrameForm, self).clean()
        leg = cleaned_data.get('leg')
        home_player = cleaned_data.get('home_player')
        away_player = cleaned_data.get('away_player')
        if home_player.group != leg.home_team:
            raise ValidationError, "Frames in a Leg should have players from the same home team!"

        if away_player.group != leg.away_team:
            raise ValidationError, "Frames in a Leg should have players from the same away team!"
        return

