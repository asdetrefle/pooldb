from __future__ import unicode_literals

from django.db import models

# Create your models here.
from django.utils import timezone
from schedule.models import Season
import datetime
import scipy.stats as ss
from utils import default_season
import numpy as np


# Create your models here.
class PlayerRanking(models.Model):

    curr_date = models.DateTimeField('Current ranking date', default=timezone.now)
    prev_date = models.DateTimeField()
    serial_id = models.IntegerField()
    season = models.ForeignKey(Season, models.CASCADE)
    ranking = models.IntegerField()
    elo_points = models.FloatField(blank=True, null=True)
    raw_points = models.IntegerField(blank=True, null=True)
    handicap = models.FloatField(blank=True, null=True)


    def __str__(self):
        return self.serial_id

