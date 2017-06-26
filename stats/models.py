from __future__ import unicode_literals

from django.db import models

# Create your models here.
from django.utils import timezone
from schedule.models import Season, MatchWeek
import datetime
import scipy.stats as ss
from utils import default_season
import numpy as np
from administration.models import Member, Team, League


# Create your models here.
class PlayerRanking(models.Model):

    league = models.ForeignKey(League, models.CASCADE)
    player = models.ForeignKey(Member, models.CASCADE)
    week = models.ForeignKey(MatchWeek, models.CASCADE)
    date = models.DateTimeField('Current ranking date', default=timezone.now)
    serial_id = models.IntegerField()
    ranking = models.IntegerField()
    elo_points = models.FloatField(blank=True, null=True)
    raw_points = models.IntegerField(blank=True, null=True)
    handicap = models.FloatField(blank=True, null=True)

    matches_played = models.IntegerField(default=0)
    matches_won  = models.IntegerField(default=0)
    clearance = models.IntegerField(default=0)

    def __str__(self):
        return self.serial_id

class TeamRanking(models.Model):

    league = models.ForeignKey(League, models.CASCADE)
    team = models.ForeignKey(Team, models.CASCADE)
    season = models.ForeignKey(Season, models.CASCADE)
    weak = models.ForeignKey(MatchWeek, models.CASCADE)
    date = models.DateTimeField('Current ranking date', default=timezone.now)
    serial_id = models.IntegerField()
    ranking = models.IntegerField()
    elo_points = models.FloatField(blank=True, null=True)
    raw_points = models.IntegerField(blank=True, null=True)
    handicap = models.FloatField(blank=True, null=True)

    clearances = models.IntegerField(default=0)
    matches_played= models.IntegerField(default=0)
    matches_won   = models.IntegerField(default=0)
    legs_played  = models.IntegerField(default=0)
    legs_won     = models.IntegerField(default=0)

    def __str__(self):
        return self.serial_id
