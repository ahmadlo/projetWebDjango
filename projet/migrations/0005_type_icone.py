# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-04-03 23:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('projet', '0004_auto_20160401_1137'),
    ]

    operations = [
        migrations.AddField(
            model_name='type',
            name='icone',
            field=models.ImageField(blank=True, upload_to='images'),
        ),
    ]
