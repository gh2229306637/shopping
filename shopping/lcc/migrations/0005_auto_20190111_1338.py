# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-11 13:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lcc', '0004_wheel'),
    ]

    operations = [
        migrations.AlterField(
            model_name='wheel',
            name='img',
            field=models.CharField(max_length=500),
        ),
    ]
