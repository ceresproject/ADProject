# Generated by Django 2.2 on 2019-04-12 02:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('travelResources', '0004_locationtag_create_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='articlepost',
            name='postal_code',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='articlepost',
            name='read_times',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='locationtag',
            name='type',
            field=models.CharField(default='', max_length=50),
            preserve_default=False,
        ),
    ]
