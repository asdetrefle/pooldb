# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-06-27 13:42
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('stats', '0005_auto_20170627_2118'),
    ]

    operations = [
        migrations.AlterField(
            model_name='playerranking',
            name='season',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='schedule.Season'),
        ),
    ]
