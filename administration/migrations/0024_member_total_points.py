# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-09-09 10:23
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0023_auto_20170909_1822'),
    ]

    operations = [
        migrations.AddField(
            model_name='member',
            name='total_points',
            field=models.IntegerField(default=0),
        ),
    ]
