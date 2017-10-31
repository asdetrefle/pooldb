from __future__ import unicode_literals
from abc import abstractmethod

from django.db import models
from django.utils import timezone
from django.forms import ModelForm
from utils import default_season, calc_elo

from administration.models import Member, Team, League
from schedule.models import MatchWeek, Season
from collections import OrderedDict
import numpy as np
# Create your models here.

class AbstractMatch(models.Model):
    SCORE_SYSTEM_CHOICES = (
        ('P', 'Points'),
        ('F', 'Frames'),
    )
    BREAK_TYPE_CHOICES = (
        ('W', 'Winner Break'),
        ('A', 'Alternative'),
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
    break_type = models.CharField(
        max_length=1,
        choices=BREAK_TYPE_CHOICES,
        default='W'
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
                try:
                    home_score_ += f.home_score
                    away_score_ += f.away_score
                except TypeError:
                    pass
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
        if self.is_completed:
            return

        self._update_progress()

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

        #print self.home, self.home.total_matches_played
        #print self.away, self.away.total_matches_played
        # add clearance info to players
        for f in self.frames():
            if f.is_clearance:
                if f.cleared_by==self.home:
                    self.home.total_clearances += 1
                    self.home.season_clearances += 1
                else:
                    self.away.total_clearances += 1
                    self.away.season_clearances += 1

        # adjust points for members using ELO Ranking systems
        home_score_ = self.home_score
        away_score_ = self.away_score

        self.home.season_points += home_score_
        self.away.season_points += away_score_
        self.home.total_points += home_score_
        self.away.total_points += away_score_
        self.home._point_adj += calc_elo(float(home_score_) / (home_score_ + away_score_),
                                                self.away.points,
                                                self.home.points)
        self.away._point_adj += calc_elo(float(away_score_) / (home_score_ + away_score_),
                                                self.home.points,
                                                self.away.points)
        self.home.save()
        self.away.save()
        print " tata", self.home._point_adj, self.away._point_adj
        self.is_submitted = True
        self.save()
        return

    def update_all(self):
        self._update_progress()
        return

    def __str__(self):
        return "{} {} vs. {} ".format(self.match_date.date(), self.home, self.away)


    class Meta:
        permissions = (
            ('view_match',      'Can view match'),
            ('init_match',      'Can init match'),
            ('record_match',    'Can record match'),
            ('approve_match',   'Can approve match'),
        )


class LeagueMatch(AbstractMatch):
    home = models.ForeignKey(
        Team,
        models.CASCADE,
        related_name='%(class)s_home'
    )
    away = models.ForeignKey(
        Team,
        models.CASCADE,
        related_name='%(class)s_away'
    )

    home_points_raw = models.IntegerField(default=0)
    away_points_raw = models.IntegerField(default=0)
    _home_ordered_players = models.CharField(max_length=200, blank=True, null=True)
    _away_ordered_players = models.CharField(max_length=200, blank=True, null=True)
    legs = models.IntegerField('Number of legs', default=6)
    home_approved = models.DateTimeField(blank=True, null=True)
    away_approved = models.DateTimeField(blank=True, null=True)

    # Handicap is always for home
    # If handicap is positive, then it is added to home when computing final scores
    # If handicap is negative, then its opposite value is added to away
    handicap = models.IntegerField(default=0)

    winner = models.ForeignKey(
        Team,
        models.CASCADE,
        related_name='%(class)s_winner',
        blank=True,
        null=True
    )

    league = models.ForeignKey(
        League,
        models.CASCADE,
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

    def _create_ordered_players(self, away_players=None, home_players=None):
        #if home_players is not None:
        self._home_ordered_players = '_'.join([str(x) for x in home_players])

        #if away_players is not None:
        self._away_ordered_players = '_'.join([str(x) for x in away_players])

        self.save()
        return


    def initialize(self, away_players, home_players, matching=None, lag=None):
        self._create_ordered_players(away_players, home_players)

        rounds = self.legs / 2
        num_players = len(home_players)

        if matching is None:
            def matching(num_players, round_):
                order = range(num_players)
                return order[round_-1:] + order[:round_-1]

        lag_offset = 1 if lag=='away' else 0

        for r in range(1, rounds+1):
            l = matching(num_players, r)
            for i, p in enumerate(l):
                players = [Member.objects.get(pk=home_players[i]),
                           Member.objects.get(pk=away_players[p])]
                nm = Match(venue=self.venue,
                           match_date=self.match_date,
                           table_size=self.table_size,
                           pool_type =self.pool_type,
                           score_type=self.score_type,
                           break_type=self.break_type,
                           race_to=2,
                           match_type='E',
                           home=players[0],
                           away=players[1])
                nm.save()
                for j in range(2):
                    nlf = self.leagueframe_set.create(match=nm,
                                                      break_player=players[(j+lag_offset)%2],
                                                      frame_number=j+1,
                                                      home_player=players[0],
                                                      away_player=players[1],
                                                      leg_number=2*r+j-1)
                    nlf.save()

        self.set_handicap()
        self.is_initialized = True
        self.save()
        return

    def reinitialize(self, home_players, away_players, matching=None, lag=None):
        self._create_ordered_players(away_players, home_players)

        rounds = self.legs / 2
        num_players = len(home_players)

        if matching is None:
            def matching(num_players, round_):
                order = range(num_players)
                return order[round_-1:] + order[:round_-1]

        lag_offset = 1 if lag=='away' else 0

        matches = self.get_matches()
        frames = self.frames()

        c = 0
        q = 0

        for r in range(1, rounds+1):
            l = matching(num_players, r)
            for i, p in enumerate(l):
                players = [Member.objects.get(pk=home_players[i]),
                           Member.objects.get(pk=away_players[p])]
                m = matches[c]
                print m.pk
                m.home = players[0]
                m.away = players[1]
                m.save()
                print players[0], m.home
                print players[1], m.away
                print 'toto'

                for j in range(2):
                    f = frames[q]
                    f.match = m
                    f.home_player = players[0]
                    f.away_player = players[1]
                    f.break_player= players[(j+lag_offset)%2]
                    f.frame_number = j+1
                    f.leg_number = 2*r+j-1
                    f.save()
                    q += 1
                    print 'papa'
                c += 1

        self.set_handicap()
        self.save()
        return



    def set_handicap(self, max_handicap=15):
        players = self._get_ordered_players()
        #print players
        away_handicap = [Member.objects.get(pk=i).handicap for i in players['away']]
        home_handicap = [Member.objects.get(pk=i).handicap for i in players['home']]

        #print away_handicap, home_handicap

        away_handicap = [x if x > 0 else 10 for x in away_handicap]
        home_handicap = [x if x > 0 else 10 for x in home_handicap]

        away_handicap.sort()
        home_handicap.sort()

        effective_length = min(len(away_handicap), len(home_handicap))
        handicap = np.sum(away_handicap[0:effective_length]) - np.sum(home_handicap[0:effective_length])

        handicap = int(round(handicap))
        self.handicap = np.sign(handicap) * min(max_handicap, abs(handicap))
        self.save()
        return

    def get_leg(self, l):
        return self.leagueframe_set.filter(leg=l)

    def frames(self):
        return self.leagueframe_set.all().order_by('pk')

    def to_view(self):
        frames = self.frames()
        res = {}

        for f in frames:
            res.setdefault(f.leg_number, []).append(f)

        return OrderedDict(sorted(res.items()))

    def sum_legs(self):
        frames = self.frames()
        if self.handicap>=0:
            res = [[self.handicap,0] for i in range(self.legs)]
        else:
            res = [[0, -self.handicap] for i in range(self.legs)]

        for f in frames:
            try:
                res[f.leg_number - 1][0] += f.home_score
                res[f.leg_number - 1][1] += f.away_score
            except TypeError:
                pass

        return res

    def count_frames(self):
        frames = self.frames()
        if self.handicap>=0:
            res = [[0,0] for i in range(self.legs)]
        else:
            res = [[0,0] for i in range(self.legs)]

        for f in frames:
            try:
                res[f.leg_number - 1][0] += (f.home_score>f.away_score)
                res[f.leg_number - 1][1] += (f.away_score>f.home_score)
            except TypeError:
                pass

        return res

    def get_matches(self):
        frames = self.frames()

        match_set = set()
        for f in frames:
            match_set.add(f.match)

        matches = list(match_set)

        sorted(matches, key=lambda m: m.pk)

        return matches


    def _has_blank(self):
        if self.is_completed:
            return False
        else:
            frames = self.frames()
            for f in frames:
                if f.home_score is None or f.away_score is None:
                    return True

        return False


    def _update_progress(self):
        """
        This method needs to be called during match progress
        """
        legs_sum = self.sum_legs()
        legs_count = self.count_frames()

        self.home_points_raw = sum([x[0] for x in legs_sum])
        self.away_points_raw = sum([x[1] for x in legs_sum])

        home_win_leg = 0
        away_win_leg = 0
        for i, [h, a] in enumerate(legs_sum):
            if a>h and a!=0 and h!=0:
                away_win_leg += 1
            elif h>a and a!=0 and h!=0:
                home_win_leg += 1
            else:
                hc, ac = legs_count[i]
                if ac>hc:
                    away_win_leg += 1
                elif hc>ac:
                    home_win_leg += 1

        self.home_score = home_win_leg
        self.away_score = away_win_leg
        self.save()
        return

    def _update_handicap(self):
        """
        Undeprecated: To Remove
        """
        if self.handicap > 0:
            self.home_score += self.handicap
        else:
            self.away_score += -self.handicap

        self.save()
        return

    def completes(self):
        if self.is_completed:
            return

        ms = self.get_matches()
        for m in ms:
            m.completes()

        if self.home_points_raw > self.away_points_raw:
            self.home_score += 1
        elif self.home_points_raw < self.away_points_raw:
            self.away_score += 1

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
        ms = self.get_matches()
        for m in ms:
            m.submits()

        if not self.is_completed:
            return

        if self.is_submitted:
            return

        self.home.total_points += self.home_points_raw
        self.home.season_points += self.home_points_raw
        self.away.total_points += self.away_points_raw
        self.away.season_points += self.away_points_raw

        self.home.total_matches_played += 1
        self.home.season_matches_played += 1
        self.away.total_matches_played += 1
        self.away.season_matches_played += 1

        self.home.total_legs_played += (self.legs + 1)
        self.home.season_legs_played += (self.legs + 1)
        self.away.total_legs_played += (self.legs + 1)
        self.away.season_legs_played += (self.legs + 1)

        self.home.total_legs_won += self.home_score
        self.home.season_legs_won += self.home_score
        self.away.total_legs_won += self.away_score
        self.away.season_legs_won += self.away_score

        if self.winner == self.home:
            self.home.total_matches_won += 1
            self.home.season_matches_won += 1
        else:
            self.away.total_matches_won += 1
            self.away.season_matches_won += 1

        self.home.save()
        self.away.save()

        self.is_submitted = True
        self.save()
        return

    def update_all(self):
        self._update_progress()
        return

    def __str__(self):
        return "{} {} vs. {}".format(self.match_date.date(), self.home, self.away)

    class Meta:
        permissions = (
            ('view_leaguematch',      'Can view leaguematch'),
            ('init_leaguematch',      'Can init leaguematch'),
            ('approve_leaguematch',   'Can approve leaguematch'),
            ('record_leaguematch',    'Can record leaguematch'),
        )

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


