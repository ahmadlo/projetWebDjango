# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-04-14 11:32
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('projet', '0009_categorie'),
    ]

    operations = [
        migrations.AddField(
            model_name='zone',
            name='categorie',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='projet.Categorie'),
        ),
    ]
