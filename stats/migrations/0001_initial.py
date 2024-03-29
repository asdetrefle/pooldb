# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-06-25 14:04
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('administration', '0016_team_season_points'),
        ('schedule', '0003_auto_20170209_2050'),
    ]

    operations = [
        migrations.CreateModel(
            name='PlayerRanking',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Current ranking date')),
                ('serial_id', models.IntegerField()),
                ('ranking', models.IntegerField()),
                ('elo_points', models.FloatField(blank=True, null=True)),
                ('raw_points', models.IntegerField(blank=True, null=True)),
                ('handicap', models.FloatField(blank=True, null=True)),
                ('total_matches_played', models.IntegerField(default=0)),
                ('total_matches_won', models.IntegerField(default=0)),
                ('total_clearance', models.IntegerField(default=0)),
                ('season_matches_played', models.IntegerField(default=0)),
                ('season_matches_won', models.IntegerField(default=0)),
                ('season_clearance', models.IntegerField(default=0)),
                ('player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='administration.Member')),
                ('season', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='schedule.Season')),
            ],
        ),
    ]
