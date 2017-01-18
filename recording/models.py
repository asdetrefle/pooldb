from __future__ import unicode_literals

from django.db import models

from administration.models import Player
# Create your models here.

class Match(models.Model):
    date = models.DateTimeField('match date')
    #home_team = models.CharField(max_length=200)
    #away_team = models.CharField(max_length=200)
    home_player = models.ForeignKey(
        Player,
        related_name='home_player',
        blank=True,
        null=True
    )
    away_player = models.ForeignKey(
        Player,
        related_name='away_player',
        blank=True,
        null=True
    )

    def __str__(self):
        return self.pk

