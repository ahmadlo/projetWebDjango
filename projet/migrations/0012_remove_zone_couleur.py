# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-04-14 11:52
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('projet', '0011_auto_20160414_1136'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='zone',
            name='couleur',
        ),
    ]