# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-06-27 13:43
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0016_team_season_points'),
    ]

    operations = [
        migrations.RenameField(
            model_name='member',
            old_name='season_clearance',
            new_name='season_clearances',
        ),
        migrations.RenameField(
            model_name='member',
            old_name='total_clearance',
            new_name='total_clearances',
        ),
    ]
