from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404, HttpResponseRedirect
from .models import Match, LeagueMatch, Frame, LeagueFrame
from .forms import FrameForm
from administration.models import Member, Team, League
from django.contrib import messages
from django.db.models import Q
import re, ast

# Create your views here.

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


def listmatch(request):
    matches = Match.objects.all().order_by('match_date')
    return render(request, 'listmatch.html', {'matches': matches})


def listleg(request):
    legs = LeagueMatch.objects.all()
    return render(request, 'listleg.html', {'legs': legs})


def match_view_old(request, match_id):
    # TODO: now view_match and add_frame are using the same frame; maybe separate them for clarity
    # TODO: use django form and add validation
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
    form = FrameForm(match=match)
    # form.fields['break_player'].queryset = Member.objects.get(pk=match.home.pk)
    return render(request, 'match.html', {'match': match, 'frames': frames, 'form': form})


def match_view(request, match_id):
    # TODO: now view_match and add_frame are using the same frame; maybe separate them for clarity
    match = get_object_or_404(Match, pk=match_id)
    # match.update_all()
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
    frames = match.frame_set.all()
    return render(request, 'match.html', {'frames': frames, 'match': match, 'form': form})



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
    return render(request, 'leg.html', {'leg': leg, 'frames': frames, 'away_team_members': away_team_members,
                                        'home_team_members': home_team_members})


def leg_close(request, leg_id):
    leg = get_object_or_404(LeagueMatch, pk=leg_id)
    if leg.is_completed:
        raise Http404
    else:
        leg.is_completed = True
        leg.save()
        messages.success(request, 'Successfully closed the leg.')
        return HttpResponseRedirect('/recording/leg/{}/'.format(leg_id))
