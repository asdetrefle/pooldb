# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-02 11:44
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0004_leagueframe_league_match'),
    ]

    operations = [
        migrations.RenameField(
            model_name='leagueframe',
            old_name='away',
            new_name='away_player',
        ),
        migrations.RenameField(
            model_name='leagueframe',
            old_name='home',
            new_name='home_player',
        ),
    ]
