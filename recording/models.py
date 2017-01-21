from __future__ import unicode_literals

from django.db import models

from administration.models import Member
# Create your models here.

class Match(models.Model):
    EXTERNAL = 'E'
    INTERNAL = 'I'
    MATCH_TYPE_CHOICES = (
        (EXTERNAL, 'External'),
        (INTERNAL, 'Internal'),
    )
    POINTS = 'P'
    FRAMES = 'F'
    SCORE_SYSTEM_CHOICES = (
        (POINTS, 'Points'),
        (FRAMES, 'Frames'),
    )
    EIGHT_BALL  = '8-Ball'
    NINE_BALL   = '9-Ball'
    TEN_BALL    = '10-Ball'
    ONE_POCKET  = 'One-Pocket'
    STRAIGHT    = '14-1'
    BANK_POOL   = 'Bank Pool'
    TTF         = '2-3-5'
    SNOOKER     = 'Snooker'
    CAROM       = 'Carom'
    RUSSIAN     = 'Russian'
    POOL_TYPE_CHOICES = (
        (EIGHT_BALL,    '8-Ball'),
        (NINE_BALL,     '9-Ball'),
        (TEN_BALL,      '10-Ball'),
        (ONE_POCKET,    'One-Pocket'),
        (STRAIGHT,      '14-1'),
        (BANK_POOL,     'Bank Pool'),
        (TTF,           '2-3-5'),
        (SNOOKER,       'Snooker'),
        (CAROM,         'Carom'),
        (RUSSIAN,       'Russian')
    )

    venue = models.CharField(max_length=200, blank=True, null=True)
    create_date = models.DateTimeField('match date')
    nb_frames   = models.IntegerField(default=0)
    match_type  = models.CharField(
        max_length=1,
        choices=MATCH_TYPE_CHOICES,
        default='E'
    )
    pool_type  = models.CharField(
        max_length=10,
        choices=POOL_TYPE_CHOICES,
        default='8-Ball',
    )
    score_type = models.CharField(
        max_length=1,
        choices=SCORE_SYSTEM_CHOICES,
        default='P'
    )
    home_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='home_player',
    )
    away_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='away_player',
    )
    home_score = models.IntegerField(default=0)
    away_score = models.IntegerField(default=0)
    winner = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='winner',
    )

    def __str__(self):
        return self.pk


class Frame(models.Model):
    break_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name = 'break_player'
    )
    home_score = models.IntegerField(default=0)
    away_score = models.IntegerField(default=0)
    is_clearance = models.BooleanField(default=False)
    cleared_by = models.ForeignKey(
        Member,
        models.CASCADE,
        blank=True,
        null=True,
        related_name = 'cleared_by'
    )
    match = models.ForeignKey(
        Match,
        models.CASCADE
    )

    def __str__(self):
        return self.pk

