from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Season(models.Model):
    season = models.IntegerField()
    name = models.CharField(max_length=200, null=True, blank=True)
    league = models.ForeignKey('administration.League', models.CASCADE)

    def __str__(self):
        return "Season {} - {}".format(self.season, self.name)


class MatchWeek(models.Model):
    week_number = models.IntegerField()
    season = models.ForeignKey(Season)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()

    def __str__(self):
        return "Week {} {}-{}".format(self.week_number,
                                      self.start_date.strftime("%b %d, %Y"),
                                      self.end_date.strftime("%b %d, %Y"))



