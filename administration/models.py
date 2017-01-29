from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from django.core.validators import RegexValidator
import datetime

# Create your models here.


class Group(models.Model):
    name = models.CharField(max_length=200)
    size = models.IntegerField(default=0)
    create_date   = models.DateTimeField('date joined', default=timezone.now)

    def _update_size(self):
        self.size = len(self.member_set.all())
        return

    def update_all(self):
        self._update_size()
        return

    def __str__(self):
        return self.name


class League(models.Model):
    name = models.CharField(max_length=200)
    create_date = models.DateTimeField('date created', default=timezone.now)
    level = models.IntegerField(default=1, blank=True, null=True)
    size = models.IntegerField(default=0)

    def _update_size(self):
        self.size = len(self.team_set.all())
        return

    def update_all(self):
        self._update_size()
        return

    def __str__(self):
        return self.name


class Team(Group):
    ranking = models.IntegerField(default=0)

    total_legs_played   = models.IntegerField(default=0)
    total_legs_won      = models.IntegerField(default=0)
    season_legs_played  = models.IntegerField(default=0)
    season_legs_won     = models.IntegerField(default=0)

    league = models.ForeignKey(
        League,
        models.CASCADE
    )

    def _update_legs(self):
        # TODO
        return

    def _update_ranking(self):
        # TODO
        return

    def update_all(self):
        self._update_size()
        self._update_legs()
        self._update_ranking()
        return


class Player(models.Model):
    SEX_CHOICES = (
        ('F', 'Female'),
        ('M', 'Male'),
        ('I', 'Intersex')
    )
    phone_regex = RegexValidator(regex=r'^\+\d{8,15}$',
                                 message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    name    = models.CharField(max_length=200)
    username = models.CharField(max_length=200)
    sex     = models.CharField(max_length=1, choices=SEX_CHOICES)
    phone   = models.CharField(validators=[phone_regex], max_length=16, blank=True, null=True);
    email   = models.EmailField(max_length=200, blank=True, null=True)
    nb_groups = models.IntegerField('Number of groups', default=0)

    def _update_nb_groups(self):
        self.nb_groups = len(self.member_set.all())
        return

    def update_all(self):
        self._update_nb_groups()
        return

    def __str__(self):
        return self.username


class Member(models.Model):
    player = models.ForeignKey(
        Player,
        models.CASCADE
    )

    group = models.ForeignKey(
        Group,
        models.CASCADE,
        blank=True,
        null=True,              # we allow null here to allow player to play for himself
    )

    create_date = models.DateTimeField('Date joined', default=timezone.now)
    cancel_date = models.DateTimeField('Date quitted', blank=True, null=True)

    points  = models.FloatField(default=1000.)
    ranking = models.IntegerField(default=0)

    # the following three fields stores adjustment to Member ranking information during a ranking cycle
    # Members' ranking could change every week or every day.
    _point_adj = models.FloatField('Points to be added', default=0.)
    _match_adj  = models.IntegerField('Matches to be added', default=0)
    _match_won_adj = models.IntegerField('Matches won to be added', default=0)

    total_matches_played = models.IntegerField(default=0)
    total_matches_won   = models.IntegerField(default=0)
    total_clearance = models.IntegerField(default=0)
    season_matches_played = models.IntegerField(default=0)
    season_matches_won  = models.IntegerField(default=0)
    season_clearance = models.IntegerField(default=0)


    def new_season(self):
        self.season_clearance = 0
        self.season_matches_played = 0
        self.season_matches_won = 0
        return

    def _update_points(self):
        self.points += _point_adj
        self._point_adj = 0
        return

    def _update_ranking(self):
        # TODO
        return

    def _update_matches(self):
        #TODO
        return

    def update_all(self):
        self._update_ranking()
        self._update_points()
        self._update_matches()
        return

    def __str__(self):
        return "{} ({})".format(self.player, self.group)
