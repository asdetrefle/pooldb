from django.conf import settings
settings.configure()
from schedule.models import MatchWeek, Season
from datetime import timedelta


def create_matchweek():
    season1 = Season.objects.get(pk=1)
    for i in range(2,15):
        last_week = MatchWeek.objects.get(pk=(i-1))
        end_date = last_week + timedelta(days=7)
        this_week = MatchWeek(week_number=i, Season=season1, start_date=last_week.end_date, end_date=end_date)
        this_week.save()

    return

def create_leaguematch():
    pass


def main():
    create_matchweek()


if __name__=='__main__':
    main()

