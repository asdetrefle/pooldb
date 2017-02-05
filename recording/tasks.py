from __future__ import absolute_import, unicode_literals
from celery import shared_task

from .models import Match, League



@shared_task
def print_nb_matches():
    '''
    Print the number of matches in DB. For test purpose.
    '''
    print('now there are {} matches in the DB'.format(len(Match.objects.all())))


@shared_task
def update_rankings():
    '''
    Update the scores and ranking for the players.
    '''
    for league in League.objects.all():
        league._update_ranking()
    print('Updated all rankings')

# default way to schedule tasks. Use the following to run workers and beat at the same time
# celery -A pooldb worker -B -l info
# from celery.schedules import crontab
# @app.on_after_configure.connect
# def setup_periodic_tasks(sender, **kwargs):
#     sender.add_periodic_task(10.0, test.s(), name='try')