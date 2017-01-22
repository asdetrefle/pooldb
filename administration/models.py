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
    ranking     = models.IntegerField(default=0)
    total_legs_played   = models.IntegerField(default=0)
    total_legs_won      = models.IntegerField(default=0)
    season_legs_played  = models.IntegerField(default=0)
    season_legs_won     = models.IntegerField(default=0)

    def __str__(self):
        return self.name


class League(models.Model):
    name = models.CharField(max_length=200)
    create_date = models.DateTimeField('date created', default=timezone.now)
    level = models.IntegerField(default=1, blank=True, null=True)

    def __str__(self):
        return self.name


class Team(Group):
    league = models.ForeignKey(
        League,
        models.CASCADE
    )


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

    create_date = models.DateTimeField('date joined', default=timezone.now)
    cancel_date = models.DateTimeField('date quitted', blank=True, null=True)

    points  = models.FloatField(default=1000.)
    ranking = models.IntegerField(default=0)
    total_matches_played = models.IntegerField(default=0)
    total_matches_won   = models.IntegerField(default=0)
    season_matches_played = models.IntegerField(default=0)
    season_matches_won  = models.IntegerField(default=0)
    no_groups = models.IntegerField(default=0)

    def __str__(self):
        return "{}({})".format(self.player, self.group)
