from __future__ import unicode_literals

from django.db import models
from utils import default_season

# Create your models here.

class Season(models.Model):
    season = models.IntegerField()

    def __str__(self):
        return "Season {} {}-{}".format(season, season+2014, season+2015)


class MatchWeek(models.Model):
    week_number = models.IntegerField()
    season = models.OneToOneField(Season)
    start_date = models.DateField()
    end_date = models.DateField()

    def __str__(self):
        return "Week {} {}-{}".format(week_number, start_date.strftime("%b %d, %Y"), end_date.strftime("%b %d, %Y"))

