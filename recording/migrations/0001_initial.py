# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-03 13:54
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import recording.utils


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('administration', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='Frame',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('frame_number', models.IntegerField(default=0)),
                ('home_score', models.IntegerField(default=0)),
                ('away_score', models.IntegerField(default=0)),
                ('is_clearance', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Leg',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('venue', models.CharField(blank=True, max_length=200, null=True)),
                ('create_date', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Event date')),
                ('season', models.CharField(default=recording.utils.default_season, max_length=10)),
                ('number_frames', models.IntegerField(default=0)),
                ('table_size', models.IntegerField(default=9)),
                ('is_completed', models.BooleanField(default=False)),
                ('is_submitted', models.BooleanField(default=False)),
                ('pool_type', models.CharField(choices=[('8-Ball', '8-Ball'), ('9-Ball', '9-Ball'), ('10-Ball', '10-Ball'), ('One-Pocket', 'One-Pocket'), ('14-1', '14-1'), ('Bank Pool', 'Bank Pool'), ('2-3-5', '2-3-5'), ('Snooker', 'Snooker'), ('Carom', 'Carom'), ('Russian', 'Russian')], default='8-Ball', max_length=10)),
                ('score_type', models.CharField(choices=[('P', 'Points'), ('F', 'Frames')], default='F', max_length=1)),
                ('home_score', models.IntegerField(default=0)),
                ('away_score', models.IntegerField(default=0)),
                ('leg_number', models.IntegerField(default=0, verbose_name='Leg Number')),
                ('handicap', models.IntegerField(default=0)),
                ('away_team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='away_team', to='administration.Team')),
                ('home_team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='home_team', to='administration.Team')),
                ('winner', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='winner_team', to='administration.Team')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Match',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('venue', models.CharField(blank=True, max_length=200, null=True)),
                ('create_date', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Event date')),
                ('season', models.CharField(default=recording.utils.default_season, max_length=10)),
                ('number_frames', models.IntegerField(default=0)),
                ('table_size', models.IntegerField(default=9)),
                ('is_completed', models.BooleanField(default=False)),
                ('is_submitted', models.BooleanField(default=False)),
                ('pool_type', models.CharField(choices=[('8-Ball', '8-Ball'), ('9-Ball', '9-Ball'), ('10-Ball', '10-Ball'), ('One-Pocket', 'One-Pocket'), ('14-1', '14-1'), ('Bank Pool', 'Bank Pool'), ('2-3-5', '2-3-5'), ('Snooker', 'Snooker'), ('Carom', 'Carom'), ('Russian', 'Russian')], default='8-Ball', max_length=10)),
                ('score_type', models.CharField(choices=[('P', 'Points'), ('F', 'Frames')], default='F', max_length=1)),
                ('home_score', models.IntegerField(default=0)),
                ('away_score', models.IntegerField(default=0)),
                ('race_to', models.IntegerField(default=7)),
                ('match_type', models.CharField(choices=[('E', 'External'), ('I', 'Internal')], default='E', max_length=1)),
                ('away_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='match_away_player', to='administration.Member')),
                ('home_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='match_home_player', to='administration.Member')),
                ('winner', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='winner_player', to='administration.Member')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='LeagueFrame',
            fields=[
                ('frame_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='recording.Frame')),
                ('away_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='leagueframe_away_player', to='administration.Member')),
                ('home_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='leagueframe_home_player', to='administration.Member')),
                ('leg', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recording.Leg')),
            ],
            bases=('recording.frame',),
        ),
        migrations.AddField(
            model_name='frame',
            name='break_player',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='frame_break_player', to='administration.Member'),
        ),
        migrations.AddField(
            model_name='frame',
            name='cleared_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='frame_cleared_by', to='administration.Member'),
        ),
        migrations.AddField(
            model_name='frame',
            name='match',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='recording.Match'),
        ),
    ]
