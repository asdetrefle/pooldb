# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-07 13:17
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0002_member_raw_points'),
    ]

    operations = [
        migrations.AddField(
            model_name='team',
            name='capitain',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='administration.Player'),
        ),
    ]