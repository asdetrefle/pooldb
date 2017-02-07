from __future__ import unicode_literals
from abc import abstractmethod

from django.db import models
from django.utils import timezone
from utils import default_season, calc_elo

from administration.models import Member, Team, League
from schedule.models import MatchWeek, Season
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
    season = models.ForeignKey(Season,
                               models.CASCADE,
                               blank=True,
                               null=True)
    week = models.ForeignKey(MatchWeek,
                             models.CASCADE,
                             blank=True,
                             null=True)
    number_frames = models.IntegerField(default=0)
    table_size  = models.IntegerField(default=9)
    is_completed = models.BooleanField(default=False)
    is_submitted = models.BooleanField(default=False)

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
    def _upon_completion(self):
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

    def frames(self):
        return self.frame_set.all()

    def _upon_completion(self):
        if self.home_score>=self.race_to or self.away_score>=self.race_to:
            self.is_completed = True

        if not self.is_completed:
            return

        if self.is_submitted:
            return

        print self.is_completed

        # adjust matchs information for members.
        self.home.total_matches_played += 1
        self.home.season_matches_played += 1
        self.away.total_matches_played += 1
        self.away.season_matches_played += 1

        if self.home_score > self.away_score:
            self.winner = self.home
            self.home.total_matches_won += 1
            self.home.season_matches_won += 1
        elif self.home_score < self.away_score:
            self.winner = self.away
            self.away.total_matches_won += 1
            self.away.season_matches_won += 1
        else:
            self.winner = none

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

    def update_handicap():
        pass

    def get_leg(self, l):
        return self.leagueframe_set.filter(leg=l)

    def frames(self):
        return self.leagueframe_set.all()

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

    def _upon_completion(self):
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
        return "{} {} vs. {} Leg {}".format(self.create_date.date(), self.away, self.home, self.leg_number)


class Frame(models.Model):
    break_player = models.ForeignKey(
        Member,
        models.CASCADE,
        related_name = '%(class)s_break_player'
    )
    frame_number = models.IntegerField(default=0)
    home_score = models.IntegerField(default=0)
    away_score = models.IntegerField(default=0)
    is_clearance = models.BooleanField(default=False)
    cleared_by = models.ForeignKey(
        Member,
        models.CASCADE,
        blank=True,
        null=True,
        related_name = '%(class)s_cleared_by'
    )

    match = models.ForeignKey(
        Match,
        models.CASCADE,
        blank=True,
        null=True,
    )

    def __str__(self):
        return "{} - Frame {}".format(self.match, self.frame_number)


class LeagueFrame(Frame):

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

    leg = models.IntegerField("leg number")

    def __str__(self):
        return "{} {} vs. {} Leg {}".format(self.leg.create_date.date(), self.away, self.home, self.leg.leg_number)

