# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-27 05:27
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('stats', '0009_auto_20170827_1324'),
    ]

    operations = [
        migrations.RenameField(
            model_name='playerranking',
            old_name='clearances',
            new_name='season_clearances',
        ),
        migrations.RenameField(
            model_name='playerranking',
            old_name='matches_played',
            new_name='season_matches_played',
        ),
        migrations.RenameField(
            model_name='playerranking',
            old_name='matches_won',
            new_name='season_matches_won',
        ),
        migrations.RenameField(
            model_name='teamranking',
            old_name='clearances',
            new_name='season_clearances',
        ),
        migrations.RenameField(
            model_name='teamranking',
            old_name='legs_played',
            new_name='season_legs_played',
        ),
        migrations.RenameField(
            model_name='teamranking',
            old_name='legs_won',
            new_name='season_legs_won',
        ),
        migrations.RenameField(
            model_name='teamranking',
            old_name='matches_played',
            new_name='season_matches_played',
        ),
        migrations.RenameField(
            model_name='teamranking',
            old_name='matches_won',
            new_name='season_matches_won',
        ),
    ]
