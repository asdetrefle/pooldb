from __future__ import unicode_literals
from abc import abstractmethod

from django.db import models
from django.utils import timezone
from django.forms import ModelForm
from utils import default_season, calc_elo

from administration.models import Member, Team, League
from schedule.models import MatchWeek, Season
from collections import OrderedDict
# Create your models here.

class AbstractMatch(models.Model):
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
    match_date = models.DateTimeField('Event date', default=timezone.now)
    #do we need week for single match as well? in discussion
    week = models.ForeignKey(MatchWeek,
                             models.CASCADE,
                             blank=True,
                             null=True)
    number_frames = models.IntegerField(default=0)
    table_size  = models.IntegerField(default=9)
    is_completed = models.BooleanField(default=False)
    is_submitted = models.BooleanField(default=False)
    is_initialized = models.BooleanField(default=False)

    pool_type  = models.CharField(
        max_length=10,
        choices=POOL_TYPE_CHOICES,
        default='8-Ball',
    )
    score_type = models.CharField(
        max_length=1,
        choices=SCORE_SYSTEM_CHOICES,
        default='F'
    )

    home_score = models.IntegerField(default=0)
    away_score = models.IntegerField(default=0)

    class Meta:
        abstract = True

    @abstractmethod
    def frames(self):
        """to override in child classes"""
        pass

    @abstractmethod
    def initialize(self, *args, **kwargs):
        """to override in child classes"""
        pass

    def _update_progress(self):
        len_ = 0
        home_score_ = 0
        away_score_ = 0

        frames = self.frames()

        for f in frames:
            len_ += 1
            if self.score_type == 'P':
                home_score_ += f.home_score
                away_score_ += f.away_score
            else:
                if f.home_score > f.away_score:
                    home_score_ += 1
                elif f.home_score < f.away_score:
                    away_score_ += 1

        self.number_frames = len_

        self.home_score = home_score_
        self.away_score = away_score_
        self.save()
        return

    @abstractmethod
    def completes(self):
        """to override in child classes"""
        pass

    @abstractmethod
    def submits(self):
        """to override in child classes"""
        pass

    @abstractmethod
    def update_all(self):
        """to override in child classes"""
        pass

    def __str__(self):
        return self.pk


class Match(AbstractMatch):
    EXTERNAL = 'E'
    INTERNAL = 'I'
    MATCH_TYPE_CHOICES = (
        (EXTERNAL, 'External'),
        (INTERNAL, 'Internal'),
    )

    race_to = models.IntegerField(default=7)
    match_type  = models.CharField(
        max_length=1,
        choices=MATCH_TYPE_CHOICES,
        default='E'
    )

    home = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='%(class)s_home',
    )
    away = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='%(class)s_away',
    )

    winner = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='winner_player',
        blank=True,
        null=True
    )


    def initialize(self):
        pass

    def frames(self):
        return self.frame_set.all()

    def completes(self):
        if self.home_score > self.away_score:
            self.winner = self.home
        elif self.home_score < self.away_score:
            self.winner = self.away

        self.is_completed = True
        self.save()
        return

    def submits(self):
        if not self.is_completed:
            return

        if self.is_submitted:
            return

        # adjust matchs information for members.
        self.home.total_matches_played += 1
        self.home.season_matches_played += 1
        self.away.total_matches_played += 1
        self.away.season_matches_played += 1

        if self.winner == self.home:
            self.home.total_matches_won += 1
            self.home.season_matches_won += 1
        elif self.winner == self.away:
            self.away.total_matches_won += 1
            self.away.season_matches_won += 1

        print self.home, self.home.total_matches_played
        print self.away, self.away.total_matches_played
        # add clearance info to players
        for f in self.frames():
            if f.is_clearance:
                if f.cleared_by==self.home:
                    self.home.total_clearance += 1
                    self.home.season_clearance += 1;
                else:
                    self.away.total_clearance += 1
                    self.away.season_clearance += 1

        # adjust points for members using ELO Ranking systems
        home_score_ = self.home_score
        away_score_ = self.away_score

        self.home.raw_points += mi.home_score
        self.away.raw_points += mi.away_score
        self.home._point_adj += calc_elo(float(home_score_) / (home_score_ + away_score_),
                                                self.away.points,
                                                self.home.points)
        self.away._point_adj += calc_elo(float(away_score_) / (home_score_ + away_score_),
                                                self.home.points,
                                                self.away.points)
        self.home.save()
        self.away.save()
        print " tata", self.home._point_adj
        self.is_submitted = True
        self.save()
        return

    def update_all(self):
        self._update_progress()
        self._upon_completion()
        return

    def __str__(self):
        return "{} {} vs. {} ".format(self.match_date.date(), self.away, self.home)


class LeagueMatch(AbstractMatch):
    home = models.ForeignKey(
        Team,
        models.CASCADE,
        related_name='home'
    )
    away = models.ForeignKey(
        Team,
        models.CASCADE,
        related_name='away'
    )

    home_points_raw = models.IntegerField(default=0)
    away_points_raw = models.IntegerField(default=0)
    _home_ordered_players = models.CharField(max_length=200, blank=True, null=True)
    _away_ordered_players = models.CharField(max_length=200, blank=True, null=True)
    legs = models.IntegerField('Number of legs', default=6)
    # Handicap is always for home
    # If handicap is positive, then it is added to home when computing final scores
    # If handicap is negative, then its opposite value is added to away
    handicap = models.IntegerField(default=0)

    winner = models.ForeignKey(
        Team,
        models.CASCADE,
        related_name='winner_team',
        blank=True,
        null=True
    )

    def _get_ordered_players(self):
        res = {}

        if self._home_ordered_players is not None:
            home_pk = self._home_ordered_players.split('_')
            home_pk = [int(x) for x in home_pk]
            res['home'] = home_pk

        if self._away_ordered_players is not None:
            away_pk = self._away_ordered_players.split('_')
            away_pk = [int(x) for x in away_pk]
            res['away'] = away_pk

        return res

    def _create_ordered_players(self, away_players, home_players):
        self._home_ordered_players = '_'.join([str(x) for x in home_players])
        self._away_ordered_players = '_'.join([str(x) for x in away_players])
        self.save()
        return


    def initialize(self, away_players, home_players, matching=None):
        self._create_ordered_players(away_players, home_players)

        rounds = self.legs / 2
        num_players = len(home_players)

        if matching is None:
            def matching(num_players, round_):
                order = range(num_players)
                return order[round_-1:] + order[:round_-1]

        for r in range(1, rounds+1):
            l = matching(num_players, r)
            print l
            for i, p in enumerate(l):
                players = [Member.objects.get(pk=away_players[p]),
                           Member.objects.get(pk=home_players[i])]
                nm = Match(venue=self.venue,
                           match_date=self.match_date,
                           table_size=self.table_size,
                           pool_type =self.pool_type,
                           score_type=self.score_type,
                           race_to=2,
                           match_type='E',
                           away=players[0],
                           home=players[1])
                nm.save()
                for j in range(2):
                    nlf = self.leagueframe_set.create(match=nm,
                                                      break_player=players[(j+1)%2],
                                                      frame_number=j+1,
                                                      away_player=players[0],
                                                      home_player=players[1],
                                                      leg_number=2*r+j-1)
                    nlf.save()

        self.is_initialized = True
        self.save()
        return

    def set_handicap():
        pass

    def get_leg(self, l):
        return self.leagueframe_set.filter(leg=l)

    def frames(self):
        return self.leagueframe_set.all()

    def to_view(self):
        frames = self.frames()
        res = {}

        for f in frames:
            res.setdefault(f.leg_number, []).append(f)

        return OrderedDict(sorted(res.items()))

    def sum_legs(self):
        frames = self.frames()
        res = [[0,0] for i in range(self.legs)]
        for f in frames:
            res[f.leg_number - 1][0] += f.away_score
            res[f.leg_number - 1][1] += f.home_score

        return res

    def _update_progress(self):
        super(LeagueMatch, self)._update_progress()
        self.home_points_raw = self.home_score
        self.away_points_raw = self.away_score

        legs_sum = self.sum_legs()
        home_win_leg = 0
        away_win_leg = 0
        for [a, h] in legs_sum:
            if a>h:
                away_win_leg += 1
            elif h>a:
                home_win_leg += 1

        self.home_score = home_win_leg
        self.away_score = away_win_leg
        self._update_handicap()
        self.save()
        return

    def _update_handicap(self):
        """
        This method needs to be called everytime after _update_progress
        """
        if self.handicap > 0:
            self.home_score += self.handicap
        else:
            self.away_score += -self.handicap

        self.save()
        return

    def completes(self):
        if self.home_score > self.away_score:
            self.winner = self.home
        elif self.home_score < self.away_score:
            self.winner = self.away
        else:
            if self.home_points_raw > self.away_points_raw:
                self.winner = self.home
            elif self.home_points_raw < self.away_points_raw:
                self.winner = self.away

        self.is_completed = True
        self.save()
        return

    def submits(self):
        # TODO this one does not work yet
        # We need to create a way for Leg to be completed
        # Currently it nevers finishes.
        if not self.is_completed:
            return

        if self.is_submitted:
            return

        if self.home_score > self.away_score:
            self.winner = self.home
        elif self.home_score < self.away_score:
            self.winner = self.away
        else:
            self.winner = None

        self.is_submitted = True
        self.save()
        return

    def update_all(self):
        self._update_progress()
        self._update_handicap()
        self._upon_completion()
        return

    def __str__(self):
        return "{} {} vs. {}".format(self.match_date.date(), self.away, self.home)


class Frame(models.Model):
    match = models.ForeignKey(
        Match,
        models.CASCADE,
        blank=True,
        null=True,
    )

    break_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name = '%(class)s_break_player',
    )
    frame_number = models.IntegerField(default=0)
    home_score = models.IntegerField(blank=True, null=True)
    away_score = models.IntegerField(blank=True, null=True)
    is_clearance = models.BooleanField(default=False)
    cleared_by = models.ForeignKey(
        Member,
        models.CASCADE,
        blank=True,
        null=True,
        related_name = '%(class)s_cleared_by',
    )

    def __str__(self):
        return "{} - Frame {}".format(self.match, self.frame_number)



class LeagueFrame(Frame):

    home_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='%(class)s_home',
    )
    away_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name='%(class)s_away',
    )

    league_match = models.ForeignKey(
        LeagueMatch,
        models.CASCADE,
    )
    leg_number = models.IntegerField("leg number")

    def __str__(self):
        return "{} {} vs. {} Leg {}".format(self.league_match.match_date.date(), self.away_player, self.home_player, self.leg_number)


