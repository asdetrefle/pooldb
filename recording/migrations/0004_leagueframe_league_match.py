# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-02 11:40
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0003_auto_20170211_1504'),
    ]

    operations = [
        migrations.AddField(
            model_name='leagueframe',
            name='league_match',
            field=models.ForeignKey(default=0, on_delete=django.db.models.deletion.CASCADE, to='recording.LeagueMatch'),
            preserve_default=False,
        ),
    ]
