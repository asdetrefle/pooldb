from __future__ import absolute_import, unicode_literals
from celery import shared_task

from .models import Match


@shared_task
def print_nb_matches():
    print('now there are {} matches in the DB'.format(len(Match.objects.all())))

