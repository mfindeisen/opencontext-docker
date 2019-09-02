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
            name='Project',
            fields=[
                ('uuid', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('project_uuid', models.CharField(db_index=True, max_length=50)),
                ('source_id', models.CharField(db_index=True, max_length=50)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('short_id', models.IntegerField(unique=True)),
                ('view_group_id', models.IntegerField()),
                ('edit_group_id', models.IntegerField()),
                ('edit_status', models.IntegerField()),
                ('label', models.CharField(max_length=200)),
                ('short_des', models.CharField(max_length=200)),
                ('content', models.TextField()),
                ('sm_localized_json', jsonfield.fields.JSONField(blank=True, default={})),
                ('lg_localized_json', jsonfield.fields.JSONField(blank=True, default={})),
                ('meta_json', jsonfield.fields.JSONField(blank=True, default={})),
            ],
            options={
                'db_table': 'oc_projects',
            },
        ),
    ]