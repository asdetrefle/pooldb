# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-05-20 16:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0011_auto_20170319_2317'),
    ]

    operations = [
        migrations.AlterField(
            model_name='member',
            name='points',
            field=models.FloatField(default=200.0),
        ),
    ]
