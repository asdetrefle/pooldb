# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-19 07:27
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0007_auto_20170305_2209'),
    ]

    operations = [
        migrations.AddField(
            model_name='leaguematch',
            name='break_type',
            field=models.CharField(choices=[('W', 'Winner Break'), ('A', 'Alternative')], default='A', max_length=1),
        ),
        migrations.AddField(
            model_name='match',
            name='break_type',
            field=models.CharField(choices=[('W', 'Winner Break'), ('A', 'Alternative')], default='A', max_length=1),
        ),
    ]