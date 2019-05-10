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
            name='Manifest',
            fields=[
                ('uuid', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('project_uuid', models.CharField(db_index=True, max_length=50)),
                ('source_id', models.CharField(db_index=True, max_length=50)),
                ('item_type', models.CharField(max_length=50)),
                ('repo', models.CharField(max_length=200)),
                ('class_uri', models.CharField(max_length=200)),
                ('slug', models.SlugField(max_length=70, unique=True)),
                ('label', models.CharField(max_length=200)),
                ('des_predicate_uuid', models.CharField(max_length=50)),
                ('sort', models.SlugField(max_length=70)),
                ('views', models.IntegerField()),
                ('indexed', models.DateTimeField(blank=True, null=True)),
                ('vcontrol', models.DateTimeField(blank=True, null=True)),
                ('archived', models.DateTimeField(blank=True, null=True)),
                ('published', models.DateTimeField(db_index=True)),
                ('revised', models.DateTimeField(db_index=True)),
                ('record_updated', models.DateTimeField(auto_now=True)),
                ('localized_json', jsonfield.fields.JSONField(blank=True, default={})),
                ('sup_json', jsonfield.fields.JSONField(blank=True, default={})),
            ],
            options={
                'db_table': 'oc_manifest',
            },
        ),
        migrations.AlterUniqueTogether(
            name='manifest',
            unique_together=set([('item_type', 'slug')]),
        ),
    ]
