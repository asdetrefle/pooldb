# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-13 12:46
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0006_auto_20170313_2038'),
    ]

    operations = [
        migrations.AlterField(
            model_name='member',
            name='handicap',
            field=models.FloatField(default=0),
        ),
    ]
