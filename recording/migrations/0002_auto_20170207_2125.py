# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-07 13:25
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recording', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='event',
            name='week',
        ),
        migrations.DeleteModel(
            name='Event',
        ),
    ]