from __future__ import unicode_literals

from django.db import models

# Create your models here.
from django.utils import timezone
from schedule.models import Season
import datetime
import scipy.stats as ss
from utils import default_season
import numpy as np
from administration.models import Member


# Create your models here.
class PlayerRanking(models.Model):

    player = models.ForeignKey(Member, models.CASCADE)
    season = models.ForeignKey(Season, models.CASCADE)
    date = models.DateTimeField('Current ranking date', default=timezone.now)
    serial_id = models.IntegerField()
    ranking = models.IntegerField()
    elo_points = models.FloatField(blank=True, null=True)
    raw_points = models.IntegerField(blank=True, null=True)
    handicap = models.FloatField(blank=True, null=True)

    total_matches_played = models.IntegerField(default=0)
    total_matches_won   = models.IntegerField(default=0)
    total_clearance = models.IntegerField(default=0)
    season_matches_played = models.IntegerField(default=0)
    season_matches_won  = models.IntegerField(default=0)
    season_clearance = models.IntegerField(default=0)
    def __str__(self):
        return self.serial_id

