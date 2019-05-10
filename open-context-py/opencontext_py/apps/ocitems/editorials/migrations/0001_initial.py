# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-04-26 10:55
from __future__ import unicode_literals

from django.db import migrations, models
import jsonfield.fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Editorial',
            fields=[
                ('uuid', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('project_uuid', models.CharField(db_index=True, max_length=50)),
                ('user_id', models.IntegerField()),
                ('label', models.CharField(db_index=True, max_length=200)),
                ('class_uri', models.CharField(db_index=True, max_length=200)),
                ('restore_json', jsonfield.fields.JSONField(default={})),
                ('note', models.TextField()),
                ('created', models.DateTimeField()),
                ('updated', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'oc_editorials',
            },
        ),
    ]
