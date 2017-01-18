from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
import datetime

# Create your models here.


class Team(models.Model):
    name = models.CharField(max_length=200)
    size = models.IntegerField(default=0)
    join_date   = models.DateTimeField('date joined', default=timezone.now)
    ranking     = models.IntegerField(default=0)
    total_legs_played   = models.IntegerField(default=0)
    total_legs_won      = models.IntegerField(default=0)
    season_legs_played  = models.IntegerField(default=0)
    season_legs_won     = models.IntegerField(default=0)

    def __str__(self):
        return self.name


class Player(models.Model):
    SEX_CHOICES = (
        ('F', 'Female'),
        ('M', 'Male'),
        ('I', 'Intersex')
    )
    name    = models.CharField(max_length=200)
    username = models.CharField(max_length=200)
    sex     = models.CharField(max_length=1, choices=SEX_CHOICES)
    team    = models.ForeignKey(
        Team,
        on_delete=models.SET_NULL,
        blank=True,
        null=True
    )
    join_date   = models.DateTimeField('date joined', default=timezone.now)
    ranking_pts = models.FloatField(default=1000.)
    ranking     = models.IntegerField(default=0)
    total_matches_played = models.IntegerField(default=0)
    total_matches_won   = models.IntegerField(default=0)
    season_matches_played = models.IntegerField(default=0)
    season_matches_won  = models.IntegerField(default=0)
    no_groups = models.IntegerField(default=0)

    def __str__(self):
        return self.name
