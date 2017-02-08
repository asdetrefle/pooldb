from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Season(models.Model):
    season = models.IntegerField()

    def __str__(self):
        return "{}-{} Season {}".format(self.season+2014, self.season+2015, self.season)


class MatchWeek(models.Model):
    week_number = models.IntegerField()
    season = models.ForeignKey(Season)
    start_date = models.DateField()
    end_date = models.DateField()

    def __str__(self):
        return "Week {} {}-{}".format(self.week_number,
                                      self.start_date.strftime("%b %d, %Y"),
                                      self.end_date.strftime("%b %d, %Y"))

