from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from django.core.validators import RegexValidator
from django.contrib.auth.models import User
from schedule.models import Season
import datetime
import scipy.stats as ss
from utils import default_season
import numpy as np


# Create your models here.
class Player(models.Model):
    user = models.OneToOneField(User,
                                on_delete=models.CASCADE,
                                blank=True,
                                null=True)
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


class Group(models.Model):
    name = models.CharField(max_length=200)
    size = models.IntegerField(default=0)
    create_date = models.DateTimeField('date joined', default=timezone.now)
    close_date  = models.DateTimeField('date ended', blank=True, null=True)
    logo = models.ImageField(blank=True, null=True)

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

    def get_weekly_summary(self):
        lms = self.leaguematch_set.filter(is_completed=True).order_by('week_id')

        ts = { 'points': {}, 'clearances': {}, 'legs': {} }
        ps = { 'points': {}, 'clearances': {} }

        for lm in lms:
            week = lm.week.week_number
            ts['points'].setdefault(lm.home, {})[week] = lm.home_points_raw
            ts['points'].setdefault(lm.away, {})[week] = lm.away_points_raw
            ts['legs'].setdefault(lm.home, {})[week] = lm.home_score
            ts['legs'].setdefault(lm.away, {})[week] = lm.away_score
            ts['clearances'].setdefault(lm.home, {})[week] = 0
            ts['clearances'].setdefault(lm.away, {})[week] = 0

            """
            for m in lm.get_matches():
                ps['points'].setdefault(m.home.player, {})[week] = ps['points'].get(m.home.player, {}).get(week, 0) + m.home_score
                ps['points'].setdefault(m.away.player, {})[week] = ps['points'].get(m.away.player, {}).get(week, 0) + m.away_score
                ps['clearances'].setdefault(m.home.player, {})[week] = 0
                ps['clearances'].setdefault(m.away.player, {})[week] = 0
            """

            for lf in lm.leagueframe_set.select_related("home_player__player", "away_player__player").all():
                hp = lf.home_player.player
                ap = lf.away_player.player
                ps['points'].setdefault(hp, {})[week] = ps['points'].get(hp, {}).get(week, 0) + int(lf.home_score or 0)
                ps['points'].setdefault(ap, {})[week] = ps['points'].get(ap, {}).get(week, 0) + int(lf.away_score or 0)
                if lf.cleared_by == lf.home_player:
                    ts['clearances'][lm.home][week] += 1
                    ps['clearances'].setdefault(hp, {})[week] = ps['clearances'].get(hp, {}).get(week, 0) + 1
                elif lf.cleared_by == lf.away_player:
                    ts['clearances'][lm.away][week] += 1
                    ps['clearances'].setdefault(ap, {})[week] = ps['clearances'].get(ap, {}).get(week, 0) + 1


        return ts, ps


    def get_weekly_summary_id(self):
        lms = self.leaguematch_set.filter(is_completed=True).order_by('week_id')

        ts = { 'points': {}, 'clearances': {}, 'legs': {} }
        ps = { 'points': {}, 'clearances': {} }

        for lm in lms:
            pk = lm.pk
            week = lm.week.week_number
            ts['points'].setdefault(lm.home, {})[week] = [pk, lm.home_points_raw]
            ts['points'].setdefault(lm.away, {})[week] = [pk, lm.away_points_raw]
            ts['legs'].setdefault(lm.home, {})[week] = [pk, lm.home_score]
            ts['legs'].setdefault(lm.away, {})[week] = [pk, lm.away_score]
            ts['clearances'].setdefault(lm.home, {})[week] = [pk, 0]
            ts['clearances'].setdefault(lm.away, {})[week] = [pk, 0]

            for lf in lm.leagueframe_set.select_related("home_player__player", "away_player__player").all():
                hp = lf.home_player.player
                ap = lf.away_player.player
                ps['points'].setdefault(hp, {}).setdefault(week, [pk, 0])[1] += int(lf.home_score or 0)
                ps['points'].setdefault(ap, {}).setdefault(week, [pk, 0])[1] += int(lf.away_score or 0)
                if lf.cleared_by == lf.home_player:
                    ts['clearances'][lm.home][week][1] += 1
                    ps['clearances'].setdefault(hp, {}).setdefault(week, [pk, 0])[1] += 1
                elif lf.cleared_by == lf.away_player:
                    ts['clearances'][lm.away][week][1] += 1
                    ps['clearances'].setdefault(ap, {}).setdefault(week, [pk, 0])[1] += 1

        return ts, ps

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

    def stats_summary(self):
        mbs = self.member_set.all()

        header = ['points', 'clearances', 'average']
        data = []
        for mb in mbs:
            if mb.handicap<0:
                continue
            data.append([mb.raw_points, mb.season_clearance, mb.handicap])

        data = np.array(data)
        res = {}

        res['leg_average'] = data[:,0].sum() / (self.total_matches_played * 6)
        res['clearances'] = data[:,1].sum()
        res['median_average'] = np.median(data[:, 2], axis=None)
        # TODO
        return res

    def update_all(self):
        self._update_size()
        self._update_legs()
        self._update_ranking()
        return

    def __str__(self):
        return "{} ({})".format(self.name, self.team_number)


class TeamSeasonal(models.Model):
    season = models.ForeignKey(Season, models.CASCADE)
    team = models.ForeignKey(Team, models.CASCADE)
    team_number = models.IntegerField(default=0)
    season_ranking = models.IntegerField(default=0)
    season_points = models.IntegerField(default=0)
    season_clearances = models.IntegerField(default=0)
    season_matches_played= models.IntegerField(default=0)
    season_matches_won   = models.IntegerField(default=0)
    season_legs_played  = models.IntegerField(default=0)
    season_legs_won     = models.IntegerField(default=0)

    def __str__(self):
        return "Season {} - Team {}".format(self.season, self.team)


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

    points  = models.FloatField(default=200.)
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
