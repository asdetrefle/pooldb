# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-06-25 06:15
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('schedule', '0003_auto_20170209_2050'),
        ('administration', '0014_group_logo'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeamSeasonal',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('team_number', models.IntegerField(default=0)),
                ('ranking', models.IntegerField(default=0)),
                ('points', models.IntegerField(default=0)),
                ('clearances', models.IntegerField(default=0)),
                ('matches_played', models.IntegerField(default=0)),
                ('matches_won', models.IntegerField(default=0)),
                ('legs_played', models.IntegerField(default=0)),
                ('legs_won', models.IntegerField(default=0)),
                ('season', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='schedule.Season')),
            ],
        ),
        migrations.AddField(
            model_name='team',
            name='season_clearances',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='teamseasonal',
            name='team',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='administration.Team'),
        ),
    ]
