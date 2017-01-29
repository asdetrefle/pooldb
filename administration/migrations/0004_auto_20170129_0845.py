# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-01-29 00:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0003_auto_20170129_0753'),
    ]

    operations = [
        migrations.RenameField(
            model_name='member',
            old_name='_points_adj',
            new_name='_point_adj',
        ),
        migrations.RemoveField(
            model_name='member',
            name='no_groups',
        ),
        migrations.AddField(
            model_name='member',
            name='nb_groups',
            field=models.IntegerField(default=0, verbose_name='Number of groups'),
        ),
    ]