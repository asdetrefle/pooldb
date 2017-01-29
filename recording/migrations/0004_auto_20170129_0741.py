# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-01-28 23:41
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0003_auto_20170128_1644'),
    ]

    operations = [
        migrations.AddField(
            model_name='leg',
            name='is_updated',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='leg',
            name='season',
            field=models.IntegerField(default=2017),
        ),
        migrations.AddField(
            model_name='match',
            name='is_updated',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='match',
            name='season',
            field=models.IntegerField(default=2017),
        ),
        migrations.AlterField(
            model_name='leg',
            name='winner',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='winner_team', to='administration.Team'),
        ),
    ]
