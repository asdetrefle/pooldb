from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .models import Match, LeagueMatch, Frame, LeagueFrame
from .forms import FrameForm
from administration.models import Member, Team, League
from django.contrib import messages
import re, ast
from utils import end_of_week
from django.contrib.auth.decorators import login_required


_need_login = login_required(login_url='/admin/login/')


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


def listmatch(request, type_):
    if type_=='Match':
        matches = Match.objects.all().order_by('-match_date')
    elif type_=='LeagueMatch':
        matches = LeagueMatch.objects.all().order_by('-match_date')
    eow = end_of_week()
    return render(request, 'listmatch.html', {'matches': matches, 'type_': type_})


"""
def listarchive(request, type_, page=1):
    if type_=='Match':
        matches = Match.objects.all().order_by('-match_date')
    elif type_=='LeagueMatch':
        matches = LeagueMatch.objects.filter(is_completed=True).order_by('-match_date')
    eow = end_of_week()
    until = min(len(matches), int(page)*30)
    has_next = (until!=len(matches))
    return render(request, 'listmatch.html', {'matches': matches[(int(page)-1)*30:int(page)*30],
                                              'type_': type_, 'page': int(page), 'has_next': has_next})
"""

def listarchive(request, type_):
    if type_=='Match':
        matches = Match.objects.all().order_by('-match_date')
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
    eow = end_of_week()
    if type_=='Match':
        matches = Match.objects.filter(is_completed=False).order_by('match_date')
    elif type_=='LeagueMatch':
        matches = LeagueMatch.objects.filter(is_completed=False, match_date__lte=eow).order_by('match_date')
    return render(request, 'listmatch.html', {'content': 'Bonjour Les Amis.', 'matches': matches, 'type_': type_})


def listleg(request):
    matches = LeagueMatch.objects.all()
    return render(request, 'listmatch.html', {'matches': matches, 'type_': 'LeagueMatch'})


def initialize(request, match_id, type_):
    # currently only provide initialize method for LeagueMatch
    # initialize method is also useful for Match in case of a tournament.
    # We know all matchs ahead but will only know players before the Match
    # TODO: use django model form; add validation; how to represent properly the lists of players via POST?
    if type_ == 'LeagueMatch':
        match = get_object_or_404(LeagueMatch, pk=match_id)
        if match.is_initialized:
            return redirect('match_view', type_=type_, match_id=match_id)

        if match.match_date>=end_of_week():
            raise Http404

        if request.method == 'POST':
            pass

        home_players = match.home.member_set.all().order_by('-season_matches_played')
        away_players = match.away.member_set.all().order_by('-season_matches_played')
        nb_selected_players = 5

        return render(request, 'initialize_match.html', {'match': match,
                                                            'home_players': home_players,
                                                            'away_players': away_players,
                                                            'nb_selected_players': nb_selected_players,
                                                            'inds': list(range(nb_selected_players))})
    else:
        raise Http404


@_need_login
def init_submit(request, type_, match_id):
    # TODO: more proper way to edit; add validation; maybe use form/formset again
    # TODO:it may be slow to update DB for each input; instead, we should update all the fields of a frame and then do frame.save()
    # TODO: after each edit, the league match view is loaded again: this makes it inconvenient to go back to match list
    match = get_object_or_404(LeagueMatch, pk=match_id)

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


def match_view_old(request, match_id, type_):
    print 'tata', match_id, type_
    # TODO: now view_match and add_frame are using the same frame; maybe separate them for clarity
    # TODO: use django form and add validation
    if type_ == 'LeagueMatch':

        leaguematch = get_object_or_404(LeagueMatch, pk=match_id)
        # leg.update_all()
        if not leaguematch.is_initialized:
            #raise Http404
            pass

        if request.method == 'POST':
            raise
            break_player = get_object_or_404(Member, pk=int(request.POST['break_player']))
            home_score = int(request.POST['home_score'])
            away_score = int(request.POST['away_score'])
            clear_player_id = int(request.POST['clear_player'])
            home_player = get_object_or_404(Member, pk=int(request.POST['home_player']))
            away_player = get_object_or_404(Member, pk=int(request.POST['away_player']))
            nb = leg.number_frames + 1
            frame = LeagueFrame(frame_number=nb,
                                leg=leg,
                                home_score=home_score,
                                away_score=away_score,
                                break_player=break_player,
                                home_player=home_player,
                                away_player=away_player)
            if clear_player_id < 0:  # not a clearance
                frame.is_clearance = False
            else:
                # clear_player_id = int(clear_player_id)
                frame.is_clearance = True
                clear_player = get_object_or_404(Member, pk=clear_player_id)
                frame.cleared_by = clear_player
            frame.save()
            leg.update_all()
        frames = leaguematch.leagueframe_set.all()
        rounds = len(frames)
        leg_nb = leaguematch.leg

        legs = {'leg_{}'.format(x): [] for x in range(1, leg_nb+1)}
        for f in frames:
            legs['leg_{}'.format(f.leg_number)].append(f)

        return render(request, 'leaguematch.html', {'leg': leg, 'frames': frames, 'away_team_members': away_team_members,
                                            'home_team_members': home_team_members})
    elif type_ == 'Match':
        print 'toto'
        match = get_object_or_404(Match, pk=match_id)
        # match.update_all()
        if request.method == 'POST':
            break_player = get_object_or_404(Member, pk=int(request.POST['break_player']))
            home_score = int(request.POST['home_score'])
            away_score = int(request.POST['away_score'])
            clear_player_id = request.POST['clear_player']
            nb = match.number_frames + 1
            frame = Frame(frame_number=nb, match=match, home_score=home_score, away_score=away_score, break_player=break_player)
            if clear_player_id == "":  # not a clearance
                frame.is_clearance = False
            else:
                clear_player_id = int(clear_player_id)
                frame.is_clearance = True
                clear_player = get_object_or_404(Member, pk=clear_player_id)
                frame.cleared_by = clear_player
            frame.save()
            match.update_all()
        frames = match.frame_set.all()
        return render(request, 'match.html', {'match': match, 'frames': frames})
    else:
        raise Http404


def match_view(request, type_, match_id):
    # TODO: fix this dirty fix
    if type_ == 'LeagueMatch':
        match = get_object_or_404(LeagueMatch, pk=match_id)
        if not match.is_initialized:
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

        #print match._has_blank(), 'toto'
        return render(request, 'leaguematch.html', {'frames': frames, 'match': match, 'summary': summary, 'has_blank_fields': match._has_blank()})
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
        frames = match.frame_set.all()
        return render(request, 'match.html', {'frames': frames, 'match': match, 'form': form})
    else:
        raise Http404


def leg_view(request, leg_id):
    # TODO: now view_match and add_frame are using the same frame; maybe separate them for clarity
    # TODO: use django form and add validation
    leg = get_object_or_404(LeagueMatch, pk=leg_id)
    # leg.update_all()
    if request.method == 'POST':
        break_player = get_object_or_404(Member, pk=int(request.POST['break_player']))
        home_score = int(request.POST['home_score'])
        away_score = int(request.POST['away_score'])
        clear_player_id = int(request.POST['clear_player'])
        home_player = get_object_or_404(Member, pk=int(request.POST['home_player']))
        away_player = get_object_or_404(Member, pk=int(request.POST['away_player']))
        nb = leg.number_frames + 1
        frame = LeagueFrame(frame_number=nb,
                            leg=leg,
                            home_score=home_score,
                            away_score=away_score,
                            break_player=break_player,
                            home_player=home_player,
                            away_player=away_player)
        if clear_player_id < 0:  # not a clearance
            frame.is_clearance = False
        else:
            # clear_player_id = int(clear_player_id)
            frame.is_clearance = True
            clear_player = get_object_or_404(Member, pk=clear_player_id)
            frame.cleared_by = clear_player
        frame.save()
        leg.update_all()
    frames = leg.leagueframe_set.all()
    away_team_members = leg.away_team.member_set.all()
    home_team_members = leg.home_team.member_set.all()
    return render(request, 'leaguematch.html', {'leg': leg, 'frames': frames, 'away_team_members': away_team_members,
                                        'home_team_members': home_team_members})


def leg_close(request, leg_id):
    leg = get_object_or_404(LeagueMatch, pk=leg_id)
    if leg.is_completed:
        raise Http404
    else:
        leg.is_completed = True
        leg.save()
        messages.success(request, 'Successfully closed the leg.')
        # TODO: maybe use redirect
        return HttpResponseRedirect('/recording/leg/{}/'.format(leg_id))


@_need_login
def edit(request, type_, match_id):
    # TODO: more proper way to edit; add validation; maybe use form/formset again
    # TODO:it may be slow to update DB for each input; instead, we should update all the fields of a frame and then do frame.save()
    # TODO: after each edit, the league match view is loaded again: this makes it inconvenient to go back to match list
    pattern = re.compile(r'(\d+) (home|away|clear)')
    if request.method == 'POST':
        match = get_object_or_404(LeagueMatch, id=match_id)
        has_blank_fields = False
        for key, value in request.POST.iteritems():
            key_match = pattern.match(key)
            if key_match:
                frame_id, field = key_match.groups()
                frame_id = int(frame_id)
                frame = get_object_or_404(LeagueFrame, id=frame_id)
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
