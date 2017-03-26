from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from django.core.validators import RegexValidator
from schedule.models import Season
import datetime
import scipy.stats as ss
from utils import default_season

# Create your models here.


class Group(models.Model):
    name = models.CharField(max_length=200)
    size = models.IntegerField(default=0)
    create_date = models.DateTimeField('date joined', default=timezone.now)
    close_date  = models.DateTimeField('date ended', blank=True, null=True)

    def _update_size(self):
        self.size = len(self.member_set.all())
        return

    def update_all(self):
        self._update_size()
        return

    def __str__(self):
        return self.name


class League(models.Model):
    name = models.CharField(max_length=200)
    create_date = models.DateTimeField('date created', default=timezone.now)
    last_update = models.DateTimeField('last update', default=timezone.now)
    level = models.IntegerField(default=1, blank=True, null=True)
    size = models.IntegerField(default=0)

    def _update_size(self):
        self.size = len(self.team_set.all())
        return

    def rank_players(self):
        ts = self.team_set.all()

        pk_set = []
        point_set = []
        for t in ts:
            for m in t.member_set.filter(season_matches_played__gt=0):
                m._update_points()
                m._update_handicap()
                pk_set.append(m.pk)
                # scipy rankdata only ranks from smallest to highest so here needs the minus sign.
                point_set.append(-m.points)
        #print pk_set, point_set

        #order = sorted(range(len(point_set)), key=lambda k: -point_set[k])
        order = ss.rankdata(point_set, method='min')
        #print order
        for i, mpk in enumerate(pk_set):
            mb = Member.objects.get(pk=mpk)
            mb.ranking = order[i]
            mb.save()

        self.last_update = timezone.now() #.format("%Y-%m-%d %H:%M:%S")
        self.save()

        return

    def rank_teams(self, rank_by='season_legs_won'):
        ts = self.team_set.all()

        pk_set = []
        point_set = []
        for t in ts:
            pk_set.append(t.pk)
            try:
                point_set.append([getattr(t, rank_by), t.season_points()])
            except AttributeError:
                point_set.append([getattr(t, 'season_legs_won'), t.season_points()])

        point_set = [- (x[0] + x[1] * 10e-9) for x in point_set]

        order = ss.rankdata(point_set, method='min')
        for i, tpk in enumerate(pk_set):
            tm = Team.objects.get(pk=tpk)
            tm.ranking = order[i]
            tm.save()

        self.last_update = timezone.now()
        return

    def update_all(self):
        self._update_size()
        return

    def get_ranked_players(self):
        ts = self.team_set.all()

        members = []

        for t in ts:
            for m in t.member_set.filter(season_matches_played__gt=0):
                members.append(m)

        members.sort(key=lambda m: m.ranking)
        return members

    def get_ranked_teams(self):
        ts = list(self.team_set.all());

        ts.sort(key=lambda m: m.ranking)
        return ts

    def __str__(self):
        return self.name


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
    nb_groups = models.IntegerField('Number of groups', default=0)

    def _update_nb_groups(self):
        self.nb_groups = len(self.member_set.all())
        return

    def update_all(self):
        self._update_nb_groups()
        return

    def __str__(self):
        return self.name


class Team(Group):
    ranking = models.IntegerField(default=0)
    team_number = models.IntegerField(default=0)

    total_matches_played= models.IntegerField(default=0)
    total_matches_won   = models.IntegerField(default=0)
    season_matches_played= models.IntegerField(default=0)
    season_matches_won   = models.IntegerField(default=0)
    total_legs_played   = models.IntegerField(default=0)
    total_legs_won      = models.IntegerField(default=0)
    season_legs_played  = models.IntegerField(default=0)
    season_legs_won     = models.IntegerField(default=0)

    league = models.ForeignKey(
        League,
        models.CASCADE
    )

    capitain = models.ForeignKey(
        Player,
        models.SET_NULL,
        blank=True,
        null=True
    )

    def season_points(self):
        season = Season.objects.get(season=default_season())
        points = 0
        ms_home = self.leaguematch_home.filter(season=season)
        for m in ms_home:
            points += m.home_points_raw

        ms_away = self.leaguematch_away.filter(season=season)
        for m in ms_away:
            points += m.away_points_raw

        return points

    def _update_legs(self):
        # TODO
        return

    def _update_ranking(self):
        # TODO
        return

    def update_all(self):
        self._update_size()
        self._update_legs()
        self._update_ranking()
        return

    def __str__(self):
        return "{} ({})".format(self.name, self.team_number)


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

    create_date = models.DateTimeField('Date joined', default=timezone.now)
    cancel_date = models.DateTimeField('Date quitted', blank=True, null=True)

    points  = models.FloatField(default=1000.)
    raw_points = models.IntegerField(default=0)
    ranking = models.IntegerField(default=0)
    # -1 is a new player flag. handicap will become >=0 when at least 1 match played
    handicap = models.FloatField(default=-1)

    # the following three fields stores adjustment to Member ranking information during a ranking cycle
    # Members' ranking could change every week or every day.
    _point_adj = models.FloatField('Points to be added', default=0.)

    total_matches_played = models.IntegerField(default=0)
    total_matches_won   = models.IntegerField(default=0)
    total_clearance = models.IntegerField(default=0)
    season_matches_played = models.IntegerField(default=0)
    season_matches_won  = models.IntegerField(default=0)
    season_clearance = models.IntegerField(default=0)


    def new_season(self):
        self.season_clearance = 0
        self.season_matches_played = 0
        self.season_matches_won = 0
        return

    def _update_points(self):
        self.points += self._point_adj
        self._point_adj = 0
        self.save()
        return

    def _update_handicap(self):
        if self.season_matches_played==0:
            return

        self.handicap = float(self.raw_points) / (self.season_matches_played * 2.)
        self.save()
        return

    def update_all(self):
        self._update_points()
        return

    def __str__(self):
        return "{} ({})".format(self.player, self.group)
