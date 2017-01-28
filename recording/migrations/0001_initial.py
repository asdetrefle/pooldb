# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-01-28 06:39
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


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
                ('home_score', models.IntegerField(default=0)),
                ('away_score', models.IntegerField(default=0)),
                ('is_clearance', models.BooleanField(default=False)),
                ('break_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='frame_break_player', to='administration.Member')),
                ('cleared_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='frame_cleared_by', to='administration.Member')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='LeagueFrame',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('home_score', models.IntegerField(default=0)),
                ('away_score', models.IntegerField(default=0)),
                ('is_clearance', models.BooleanField(default=False)),
                ('away_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='leagueframe_away_player', to='administration.Member')),
                ('break_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='leagueframe_break_player', to='administration.Member')),
                ('cleared_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='leagueframe_cleared_by', to='administration.Member')),
                ('home_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='leagueframe_home_player', to='administration.Member')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Leg',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('venue', models.CharField(blank=True, max_length=200, null=True)),
                ('create_date', models.DateTimeField(verbose_name='event_date')),
                ('nb_frames', models.IntegerField(default=0)),
                ('table_size', models.IntegerField(default=9)),
                ('pool_type', models.CharField(choices=[('8-Ball', '8-Ball'), ('9-Ball', '9-Ball'), ('10-Ball', '10-Ball'), ('One-Pocket', 'One-Pocket'), ('14-1', '14-1'), ('Bank Pool', 'Bank Pool'), ('2-3-5', '2-3-5'), ('Snooker', 'Snooker'), ('Carom', 'Carom'), ('Russian', 'Russian')], default='8-Ball', max_length=10)),
                ('score_type', models.CharField(choices=[('P', 'Points'), ('F', 'Frames')], default='P', max_length=1)),
                ('home_score', models.IntegerField(default=0)),
                ('away_score', models.IntegerField(default=0)),
                ('handicap', models.IntegerField(default=0)),
                ('away_team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='away_team', to='administration.Team')),
                ('home_team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='home_team', to='administration.Team')),
                ('winner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='winner_team', to='administration.Team')),
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
                ('create_date', models.DateTimeField(verbose_name='event_date')),
                ('nb_frames', models.IntegerField(default=0)),
                ('table_size', models.IntegerField(default=9)),
                ('pool_type', models.CharField(choices=[('8-Ball', '8-Ball'), ('9-Ball', '9-Ball'), ('10-Ball', '10-Ball'), ('One-Pocket', 'One-Pocket'), ('14-1', '14-1'), ('Bank Pool', 'Bank Pool'), ('2-3-5', '2-3-5'), ('Snooker', 'Snooker'), ('Carom', 'Carom'), ('Russian', 'Russian')], default='8-Ball', max_length=10)),
                ('score_type', models.CharField(choices=[('P', 'Points'), ('F', 'Frames')], default='P', max_length=1)),
                ('home_score', models.IntegerField(default=0)),
                ('away_score', models.IntegerField(default=0)),
                ('match_type', models.CharField(choices=[('E', 'External'), ('I', 'Internal')], default='E', max_length=1)),
                ('away_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='match_away_player', to='administration.Member')),
                ('home_player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='match_home_player', to='administration.Member')),
                ('winner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='winner_player', to='administration.Member')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='leagueframe',
            name='leg',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recording.Leg'),
        ),
        migrations.AddField(
            model_name='frame',
            name='match',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recording.Match'),
        ),
    ]