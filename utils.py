from django.utils import timezone
from dateutil import relativedelta

def default_season():
    n = timezone.now()
    season_date = n + relativedelta.relativedelta(months=-2)
    return '{}-{}'.format(season_date.year, season_date.year+1)


def calc_elo(result, opp, sef):
    if sef < 2100:
        K=32.
    elif sef < 2400:
        K=24.
    else:
        K=16.

    diff = opp - sef
    esp = 1. / (1. + 10.**(diff / 400.))
    return K * (result - esp)

