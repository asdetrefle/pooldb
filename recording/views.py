from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .models import Match, LeagueMatch, Frame, LeagueFrame
from .forms import FrameForm
from administration.models import Member, Team, League
from django.contrib import messages
import re, ast
from utils import end_of_week
from django.contrib.auth.decorators import login_required, permission_required as _need_perm
from mail import MailManager


_need_login = login_required(login_url='/login/')


def load_players(raw_file):
    f = open(raw_file, 'r')
    res = []

    for l in f:
        replacer = re.compile("(\w+)")
        to_eval = replacer.sub(r'"\1"', l.strip())
        res.append(ast.literal_eval(to_eval))

    away = res[0]
    home = res[1]

    return away, home

def index(request):
    return render(request, 'recording.html')


def listarchive(request, type_):
    if type_=='Match':
        matches = Match.objects.filter(is_completed=True).order_by('-match_date')
    elif type_=='LeagueMatch':
        matches = LeagueMatch.objects.filter(is_completed=True).order_by('-match_date')

    paginator = Paginator(matches, 30)

    page = request.GET.get('page')
    try:
        selected = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        selected = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        selected = paginator.page(paginator.num_pages)

    return render(request, 'listmatch.html', {'matches': selected, 'type_': type_})


def listlive(request, type_='LeagueMatch'):
    #print request.user.is_authenticated()
    eow = end_of_week()
    if type_=='Match':
        matches = Match.objects.filter(is_completed=False).order_by('match_date')
    elif type_=='LeagueMatch':
        matches = LeagueMatch.objects.filter(is_completed=False, match_date__lte=eow).order_by('match_date')
        #matches = LeagueMatch.objects.filter(is_completed=False).order_by('match_date')

    if matches:
        return render(request, 'listmatch.html', {'content': 'Bonjour Les Amis.', 'matches': matches, 'type_': type_})
    else:
        return render(request, 'base_site.html', {'content': 'No matches currently.'})


@_need_login
def initialize(request, match_id, type_):
    # currently only provide initialize method for LeagueMatch
    # initialize method is also useful for Match in case of a tournament.
    # We know all matchs ahead but will only know players before the Match
    # TODO: use django model form; add validation; how to represent properly the lists of players via POST?
    if type_ == 'LeagueMatch':
        match = get_object_or_404(LeagueMatch.objects.select_related("home__captain__player__user", "away__captain__player__user"), pk=match_id)
        if not request.user.has_perm('recording.init_leaguematch', match):
            return render(request, 'base_site.html', {'content': 'Permission denied.'})

        if match.is_initialized:
            return redirect('match_view', type_=type_, match_id=match_id)

        #if match.match_date>=end_of_week():
        #    raise Http404

        home_players = match.home.member_set.all().order_by('-season_matches_played')
        away_players = match.away.member_set.all().order_by('-season_matches_played')

        _submitted = match._get_ordered_players()
        nb_selected_players = 5

        side = None

        if 'home' in _submitted:
            home_players_map = {p.id : p for p in home_players}
            rest = set(home_players_map.keys()) - set(_submitted['home'])
            home_players = [home_players_map[pk] for pk in list(_submitted['home'])+list(rest)]

        if 'away' in _submitted:
            away_players_map = {p.id : p for p in away_players}
            rest = set(away_players_map.keys()) - set(_submitted['away'])
            away_players = [away_players_map[pk] for pk in list(_submitted['away'])+list(rest)]

        if request.user.is_staff:
            return render(request, 'initialize_match.html', {'match': match,
                                                                'home_players': home_players,
                                                                'away_players': away_players,
                                                                'nb_selected_players': nb_selected_players,
                                                                'inds': list(range(nb_selected_players))})
        else:
            p = request.user.player

            if 'home' in _submitted and 'away' in _submitted:
                return render(request, 'base_site.html', {'content': 'Both teams have already submitted. You are no longer able to modify team roster.'})

            if p in {p.player for p in home_players}:
                side = 'home_players'
            elif p in {p.player for p in away_players}:
                side = 'away_players'
            else:
                return render(request, 'base_site.html', {'content': 'Successfully submitted.'})

            if request.method == 'POST':
                print "toto"
                selected_players = []
                for i in range(nb_selected_players):
                    selected_players.append(int(request.POST['player{}'.format(i)]))

                kwargs = {side: selected_players}
                match._create_ordered_players(**kwargs)

                msg = """
                Hello,

                Team %s has just submitted their roster for this week's match!

                The roster needs to be submitted before 7pm of D-Day. If you have any technical difficulty, Please contact the admin.

                Ignore this mail if you have already done so.

                Thanks,
                Poke n Hope
                """ % getattr(match, side[:4])

                m = MailManager(subject="Team %s successfully submitted the roster" % getattr(match, side[:4]), content=msg)
                #print match.home.captain.player.user.email, match.away.captain.player.user.email, p.user.email
                m.add_bcc(match.home.captain.player.user.email, match.away.captain.player.user.email, p.user.email)
                m.add_bcc('qjchv@protonmail.ch')
                m.send()

                return render(request, 'base_site.html', {'content': 'Successfully submitted.'})

            if side == 'home_players':
                is_opponent_sub = ('away' in _submitted)
                team = match.home
                players = home_players
                side = 'home_players'
            elif side == 'away_players':
                is_opponent_sub = ('home' in _submitted)
                team = match.away
                players = away_players
                side = 'away_players'
            else:
                return render(request, 'base_site.html', {'content': 'Permission Denied'})

            return render(request, 'submit_players.html', {'match_id': match.id,
                                                           'team': team,
                                                           'is_opponent_sub': is_opponent_sub,
                                                           'side': side,
                                                           'players': players,
                                                           'nb_selected_players': nb_selected_players,
                                                           'inds': list(range(nb_selected_players))})
    else:
        raise Http404


"""
@_need_login
def submit_players(request, type_, match_id, team_id, side):
    # TODO: more proper way to edit; add validation; maybe use form/formset again
    # TODO:it may be slow to update DB for each input; instead, we should update all the fields of a frame and then do frame.save()
    # TODO: after each edit, the league match view is loaded again: this makes it inconvenient to go back to match list
    match = get_object_or_404(LeagueMatch, pk=match_id)
    if type_ == 'LeagueMatch':
        match = get_object_or_404(LeagueMatch.objects.select_related("home__captain__player"), pk=match_id)
        if not request.user.has_perm('recording.init_leaguematch', match):
            return render(request, 'base_site.html', {'content': 'Permission denied.'})

    if request.method == 'POST':
        selected_players = []
        nb_selected_players = 5
        for i in range(nb_selected_players):
            selected_players.append(int(request.POST['player{}'.format(i)]))

        kwargs = {side: selected_players}
        match._create_ordered_players(**kwargs)
        return render(request, 'base_site.html', {'content': 'Successfully submitted.'})
    else:
        raise Http404
"""


@_need_login
def init_submit(request, type_, match_id):
    # TODO: more proper way to edit; add validation; maybe use form/formset again
    # TODO:it may be slow to update DB for each input; instead, we should update all the fields of a frame and then do frame.save()
    # TODO: after each edit, the league match view is loaded again: this makes it inconvenient to go back to match list
    match = get_object_or_404(LeagueMatch, pk=match_id)
    if not request.user.has_perm('recording.init_leaguematch', match):
        return render(request, 'base_site.html', {'content': 'Permission denied.'})

    if request.method == 'POST':
        selected_home_players = []
        selected_away_players = []
        nb_selected_players = 5
        for i in range(nb_selected_players):
            selected_home_players.append(int(request.POST['home{}'.format(i)]))
            selected_away_players.append(int(request.POST['away{}'.format(i)]))
        print selected_away_players
        match.initialize(selected_away_players, selected_home_players)
        return redirect('match_view', type_=type_, match_id=match_id)
    else:
        raise Http404


def match_view(request, type_, match_id):
    # TODO: fix this dirty fix
    if type_ == 'LeagueMatch':
        match = get_object_or_404(LeagueMatch.objects.select_related('home', 'away', 'season'), pk=match_id)
        if not match.is_initialized:
            print "toto"
            return redirect('match_initialize', type_=type_, match_id=match_id)
        # show match
        if request.method=='POST':
            # Implement your edit method here
            pass

        def group_by_n(to_group, n=2):
            res = []
            rounds = int(match.legs / 2)
            for i in range(rounds):
                to_zip = tuple(to_group[n*i+j] for j in range(n))
                res.append(zip(*to_zip))
            return res
        frames = group_by_n(match.to_view().values())
        try:
            summary = group_by_n(match.sum_legs())
        except TypeError:
            summary = [[('-', '-'), ('-', '-')]] * 3

        home_seasonal = match.home.teamseasonal_set.get(season=match.season)
        away_seasonal = match.away.teamseasonal_set.get(season=match.season)

        print home_seasonal

        print away_seasonal

        #print match._has_blank(), 'toto'
        return render(request, 'leaguematch.html', {
            'frames': frames,
            'match': match,
            'summary': summary,
            'home_seasonal': home_seasonal,
            'away_seasonal' : away_seasonal,
            'has_blank_fields': match._has_blank()
        })
    elif type_ == 'Match':
        match = get_object_or_404(Match, pk=match_id)
        ## TODO MOVE THIS TO edit function and need login
        """
        if request.method == 'POST':
            form = FrameForm(request.POST, match=match)
            if form.is_valid():
                frame = form.save(commit=False)
                nb = match.number_frames + 1
                frame.match = match
                frame.frame_number = nb
                if form.cleaned_data['cleared_by'] is None:
                    frame.is_clearance = False
                else:
                    frame.is_clearance = True
                frame.save()
                match.update_all()
                form = FrameForm(match=match)
        else:
            form = FrameForm(match=match)
        """
        form = FrameForm(match=match)
        frames = match.frame_set.all().order_by('frame_number')
        return render(request, 'match.html', {'frames': frames, 'match': match, 'form': form})
    else:
        raise Http404


@_need_login
def edit(request, type_, match_id):
    # TODO: more proper way to edit; add validation; maybe use form/formset again
    # TODO:it may be slow to update DB for each input; instead, we should update all the fields of a frame and then do frame.save()
    # TODO: after each edit, the league match view is loaded again: this makes it inconvenient to go back to match list
    pattern = re.compile(r'(\d+) (home|away|clear)')
    if request.method == 'POST':
        match = get_object_or_404(LeagueMatch, pk=match_id)
        if not request.user.has_perm('recording.record_leaguematch', match):
            return render(request, 'base_site.html', {'content': 'Permission denied.'})

        if match.is_completed:
            return redirect('match_view', type_=type_, match_id=match_id)
        has_blank_fields = False
        for key, value in request.POST.iteritems():
            key_match = pattern.match(key)
            if key_match:
                frame_id, field = key_match.groups()
                frame_id = int(frame_id)
                frame = get_object_or_404(LeagueFrame, pk=frame_id)
                if field in ('home', 'away'):
                    if value:
                        score = int(value)
                        if field == 'home':
                            frame.home_score = score
                        else:
                            frame.away_score = score
                        frame.save()
                    else:
                        has_blank_fields = True
                        continue
                elif field == 'clear':
                    home_away = value
                    if home_away == 'home':
                        frame.cleared_by = frame.home_player
                        frame.is_clearance = True
                        frame.save()
                    elif home_away == 'away':
                        frame.cleared_by = frame.away_player
                        frame.is_clearance = True
                        frame.save()
                    elif home_away == 'none':
                        frame.cleared_by = None
                        frame.is_clearance = False
                        frame.save()
                    else:
                        raise Http404
                else:
                    raise Http404
            else:
                pass
        #if not has_blank_fields:
        match._update_progress()
        return redirect('match_view', type_=type_, match_id=match_id)
    else:
        raise Http404
