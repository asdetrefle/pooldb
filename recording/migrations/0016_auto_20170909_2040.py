# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-09-09 12:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0015_auto_20170704_2101'),
    ]

    operations = [
        migrations.AddField(
            model_name='leaguematch',
            name='away_approved',
            field=models.DateTimeField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='leaguematch',
            name='home_approved',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]
