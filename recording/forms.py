from django.forms import ModelForm, ValidationError
from .models import LeagueFrame, LeagueMatch, Match, Frame

# class LeagueFrameForm(ModelForm):
#     class Meta:
#         model = LeagueFrame
#         fields = ['leg', 'home_player', 'away_player', 'break_player', 'home_score',
#                   'away_score', 'is_clearance', 'cleared_by']
#
#     def clean(self):
#         cleaned_data = super(LeagueFrameForm, self).clean()
#         leg = cleaned_data.get('leg')
#         home_player = cleaned_data.get('home_player')
#         away_player = cleaned_data.get('away_player')
#         if home_player.group != leg.home_team:
#             raise ValidationError, "Frames in a Leg should have players from the same home team!"
#
#         if away_player.group != leg.away_team:
#             raise ValidationError, "Frames in a Leg should have players from the same away team!"
#         return


class FrameForm(ModelForm):
    class Meta:
        model = Frame
        # TODO: set widget size for the scores
        fields = ['break_player', 'home_score', 'away_score', 'cleared_by']

    def __init__(self, *args, **kwargs):
        self.match = kwargs.pop('match', None)
        print(self.match)
        super(FrameForm, self).__init__(*args, **kwargs)
        break_choices = [(self.match.home.id, str(self.match.home.player)),
                         (self.match.away.id, str(self.match.away.player))]
        clear_choices = [(u'', '-'),
                         (self.match.home.id, str(self.match.home.player)),
                         (self.match.away.id, str(self.match.away.player))]
        self.fields['break_player'].choices = break_choices
        self.fields['cleared_by'].choices = clear_choices

    def is_valid(self):
        # https://chriskief.com/2012/12/16/override-django-form-is_valid/
        valid = super(ModelForm, self).is_valid()
        if not valid:
            return valid
        else:
            valid_break = (self.match.home, self.match.away)
            valid_clear = (None, self.match.home, self.match.away)
            # TODO: maybe the scores must be positive, which can be enforced in model definition
            if self.cleaned_data['home_score'] < 0:
                self.add_error('home_score', 'Negative home score')
                valid = False
            if self.cleaned_data['away_score'] < 0:
                self.add_error('away_score', 'Negative away score')
                valid = False
            if self.cleaned_data['break_player'] not in valid_break:
                # print self.cleaned_data['break_player']
                self.add_error('break_player', 'Invalid break player')
                valid = False
            if self.cleaned_data['cleared_by'] not in valid_clear:
                # print self.cleaned_data['cleared_by']
                self.add_error('cleared_by', 'Invalid clear player')
                valid = False
            return valid

