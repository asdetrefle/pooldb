# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-05 11:02
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0005_auto_20170302_1944'),
    ]

    operations = [
        migrations.RenameField(
            model_name='leagueframe',
            old_name='leg',
            new_name='leg_number',
        ),
        migrations.AddField(
            model_name='leaguematch',
            name='_away_ordered_players',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='leaguematch',
            name='_home_ordered_players',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
    ]
