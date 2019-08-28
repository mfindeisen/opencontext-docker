# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-04-26 10:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='OCtype',
            fields=[
                ('uuid', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('project_uuid', models.CharField(db_index=True, max_length=50)),
                ('source_id', models.CharField(db_index=True, max_length=50)),
                ('predicate_uuid', models.CharField(db_index=True, max_length=50)),
                ('content_uuid', models.CharField(db_index=True, max_length=50)),
                ('rank', models.DecimalField(decimal_places=3, max_digits=8)),
                ('updated', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'oc_types',
                'ordering': ['rank'],
            },
        ),
        migrations.AlterUniqueTogether(
            name='octype',
            unique_together=set([('predicate_uuid', 'content_uuid')]),
        ),
    ]
