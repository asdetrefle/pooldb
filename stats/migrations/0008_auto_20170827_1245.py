# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-27 04:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stats', '0007_auto_20170627_2148'),
    ]

    operations = [
        migrations.AddField(
            model_name='playerranking',
            name='season_points',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='teamranking',
            name='season_points',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]