# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-04 13:01
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0014_auto_20170616_2255'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='leaguematch',
            options={'permissions': (('view_leaguematch', 'Can view leaguematch'), ('init_leaguematch', 'Can init leaguematch'), ('approve_leaguematch', 'Can approve leaguematch'), ('record_leaguematch', 'Can record leaguematch'))},
        ),
        migrations.AlterModelOptions(
            name='match',
            options={'permissions': (('view_match', 'Can view match'), ('init_match', 'Can init match'), ('record_match', 'Can record match'), ('approve_match', 'Can approve match'))},
        ),
    ]
