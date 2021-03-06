# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-03-10 11:54
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Agent',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ag_name', models.CharField(max_length=200)),
                ('ag_email', models.EmailField(max_length=200)),
                ('ag_adr', models.CharField(max_length=50)),
                ('ag_tel', models.CharField(max_length=50)),
                ('ag_login', models.CharField(max_length=50)),
                ('ag_pwd', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cl_name', models.CharField(max_length=100)),
                ('cl_email', models.EmailField(max_length=200)),
                ('cl_lat', models.CharField(max_length=200)),
                ('cl_long', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Commercial',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('com_name', models.CharField(max_length=200)),
                ('com_adr', models.CharField(max_length=50)),
                ('com_tel', models.CharField(max_length=50)),
                ('com_email', models.EmailField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Entreprise',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('entr_name', models.CharField(max_length=200)),
                ('entr_lat', models.CharField(max_length=200)),
                ('entr_long', models.CharField(max_length=200)),
                ('ag_email', models.EmailField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Mission',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('libelle', models.CharField(max_length=200)),
                ('created_on', models.DateTimeField()),
                ('modified_on', models.DateTimeField()),
                ('date_do', models.DateTimeField()),
                ('agent', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Agent')),
                ('com', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Commercial')),
                ('lieu', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='projet.Client')),
            ],
        ),
        migrations.CreateModel(
            name='Profil',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('profil', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Programme',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField()),
                ('modified_on', models.DateTimeField()),
                ('timing', models.TextField(editable=False)),
                ('lieux', models.TextField(editable=False)),
                ('libelle', models.CharField(max_length=200)),
                ('agent', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Agent')),
                ('com', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Commercial')),
            ],
        ),
        migrations.CreateModel(
            name='Type',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type_name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Utilisateur',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=50, verbose_name='nom complet')),
                ('tel', models.CharField(max_length=50, verbose_name='telephone')),
                ('login', models.CharField(max_length=50)),
                ('pwd', models.CharField(max_length=50, verbose_name='mot de passe')),
                ('profil', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Profil')),
            ],
        ),
        migrations.CreateModel(
            name='Zone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('zone_name', models.CharField(max_length=50)),
            ],
        ),
        migrations.AddField(
            model_name='commercial',
            name='entreprise',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Entreprise'),
        ),
        migrations.AddField(
            model_name='client',
            name='cl_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Type'),
        ),
        migrations.AddField(
            model_name='client',
            name='cl_zone',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Zone'),
        ),
        migrations.AddField(
            model_name='agent',
            name='entreprise',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Entreprise'),
        ),
    ]
