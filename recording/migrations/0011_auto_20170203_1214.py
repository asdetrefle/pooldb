# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-03 04:14
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0010_auto_20170203_1144'),
    ]

    operations = [
        migrations.AlterField(
            model_name='leg',
            name='leg_number',
            field=models.IntegerField(default=0, verbose_name='Leg Number'),
        ),
    ]
