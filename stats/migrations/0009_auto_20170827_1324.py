# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-27 05:24
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('stats', '0008_auto_20170827_1245'),
    ]

    operations = [
        migrations.RenameField(
            model_name='playerranking',
            old_name='raw_points',
            new_name='total_points',
        ),
        migrations.RenameField(
            model_name='teamranking',
            old_name='raw_points',
            new_name='total_points',
        ),
    ]