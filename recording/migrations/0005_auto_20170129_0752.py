# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-01-28 23:52
from __future__ import unicode_literals

from django.db import migrations, models
import recording.utils


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0004_auto_20170129_0741'),
    ]

    operations = [
        migrations.AlterField(
            model_name='leg',
            name='season',
            field=models.CharField(default=recording.utils.default_season, max_length=10),
        ),
        migrations.AlterField(
            model_name='match',
            name='season',
            field=models.CharField(default=recording.utils.default_season, max_length=10),
        ),
    ]
