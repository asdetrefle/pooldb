from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from django.forms import ModelForm
from django.core.exceptions import ValidationError

from administration.models import Member, Team, League
# Create your models here.

class AbstractMatch(models.Model):
    POINTS = 'P'
    FRAMES = 'F'
    SCORE_SYSTEM_CHOICES = (
        (POINTS, 'Points'),
        (FRAMES, 'Frames'),
    )
    EIGHT_BALL  = '8-Ball'
    NINE_BALL   = '9-Ball'
    TEN_BALL    = '10-Ball'
    ONE_POCKET  = 'One-Pocket'
    STRAIGHT    = '14-1'
    BANK_POOL   = 'Bank Pool'
    TTF         = '2-3-5'
    SNOOKER     = 'Snooker'
    CAROM       = 'Carom'
    RUSSIAN     = 'Russian'
    POOL_TYPE_CHOICES = (
        (EIGHT_BALL,    '8-Ball'),
        (NINE_BALL,     '9-Ball'),
        (TEN_BALL,      '10-Ball'),
        (ONE_POCKET,    'One-Pocket'),
        (STRAIGHT,      '14-1'),
        (BANK_POOL,     'Bank Pool'),
        (TTF,           '2-3-5'),
        (SNOOKER,       'Snooker'),
        (CAROM,         'Carom'),
        (RUSSIAN,       'Russian')
    )

    venue = models.CharField(max_length=200, blank=True, null=True)
    create_date = models.DateTimeField('Event date', default=timezone.now)
    number_frames = models.IntegerField(default=0)
    table_size  = models.IntegerField(default=9)

    pool_type  = models.CharField(
        max_length=10,
        choices=POOL_TYPE_CHOICES,
        default='8-Ball',
    )
    score_type = models.CharField(
        max_length=1,
        choices=SCORE_SYSTEM_CHOICES,
        default='P'
    )

    home_score = models.IntegerField(default=0)
    away_score = models.IntegerField(default=0)

    class Meta:
        abstract = True

    def __str__(self):
        return self.pk


class Match(AbstractMatch):
    EXTERNAL = 'E'
    INTERNAL = 'I'
    MATCH_TYPE_CHOICES = (
        (EXTERNAL, 'External'),
        (INTERNAL, 'Internal'),
    )

    match_type  = models.CharField(
        max_length=1,
        choices=MATCH_TYPE_CHOICES,
        default='E'
    )

    home_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='%(class)s_home_player',
    )
    away_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='%(class)s_away_player',
    )

    winner = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='winner_player',
    )

    def validate(self):
        pass

    def save(self, *args, **kwargs):
        self.validate()
        super(Match, self).save(*args, **kwargs)

    def __str__(self):
        return str(self.pk)


class Leg(AbstractMatch):
    home_team = models.ForeignKey(
        Team,
        models.CASCADE,
        related_name='home_team'
    )
    away_team = models.ForeignKey(
        Team,
        models.CASCADE,
        related_name='away_team'
    )

    leg_id = models.IntegerField('Leg ID', default=0)
    # Handicap is always for home_team
    # If handicap is positive, then it is added to home_team when computing final scores
    # If handicap is negative, then its opposite value is added to away_team
    handicap = models.IntegerField(default=0)

    winner = models.ForeignKey(
        Team,
        models.CASCADE,
        related_name='winner_team',
    )

    def validate(self):
        pass

    def save(self, *args, **kwargs):
        self.validate()
        super(Leg, self).save(*args, **kwargs)

    def __str__(self):
        return "{} {} vs. {} Leg {}".format(self.create_date.date(), self.away_team, self.home_team, self.leg_id)


class AbstractFrame(models.Model):
    break_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name = '%(class)s_break_player'
    )
    home_score = models.IntegerField(default=0)
    away_score = models.IntegerField(default=0)
    is_clearance = models.BooleanField(default=False)
    cleared_by = models.ForeignKey(
        Member,
        models.CASCADE,
        blank=True,
        null=True,
        related_name = '%(class)s_cleared_by'
    )

    class Meta:
        abstract = True

    def __str__(self):
        return self.pk


class Frame(AbstractFrame):

    match = models.ForeignKey(
        Match,
        models.CASCADE
    )

    def validate(self):
        pass

    def save(self, *args, **kwargs):
        self.validate()
        super(Frame, self).save(*args, **kwargs)

    def __str__(self):
        return str(self.pk)


class LeagueFrame(AbstractFrame):

    home_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='%(class)s_home_player',
    )
    away_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='%(class)s_away_player',
    )

    leg = models.ForeignKey(
        Leg,
        models.CASCADE
    )

    def validate(self):
        for f in self.leg.league_frame_set.all():
            if f.home_player.group != self.home_player.group:
                raise ValidationError, "Frames in a Leg should have players from the same home team!"
            if f.away_player.group != self.away_player.group:
                raise ValidationError, "Frames in a Leg should have players from the same away team!"
        pass
        return

    def save(self, *args, **kwargs):
        self.validate()
        super(LeagueFrame, self).save(*args, **kwargs)

    def __str__(self):
        return "{} {} vs. {} Leg {}".format(self.leg.create_date.date(), self.away_player, self.home_player, self.leg.leg_id)


class LeagueFrameForm(ModelForm):
    class Meta:
        model = LeagueFrame
        fields = '__all__'
