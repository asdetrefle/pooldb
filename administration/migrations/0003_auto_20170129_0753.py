# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-01-28 23:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0002_auto_20170128_1644'),
    ]

    operations = [
        migrations.AddField(
            model_name='member',
            name='_match_adj',
            field=models.IntegerField(default=0.0),
        ),
        migrations.AddField(
            model_name='member',
            name='_match_won_adj',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='member',
            name='_points_adj',
            field=models.FloatField(default=0.0),
        ),
    ]