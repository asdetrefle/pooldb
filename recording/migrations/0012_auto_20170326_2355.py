# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-26 15:55
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('schedule', '0003_auto_20170209_2050'),
        ('recording', '0011_auto_20170326_1334'),
    ]

    operations = [
        migrations.AddField(
            model_name='leaguematch',
            name='season',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='schedule.Season'),
        ),
        migrations.AddField(
            model_name='match',
            name='season',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='schedule.Season'),
        ),
    ]
