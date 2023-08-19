# Generated by Django 4.2.2 on 2023-08-16 22:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0030_remove_feedback_average_rating1_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='delivery',
            name='latitude',
            field=models.CharField(blank=True, max_length=20, null=True, unique=True),
        ),
        migrations.AddField(
            model_name='delivery',
            name='locality',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='delivery',
            name='longitude',
            field=models.CharField(blank=True, max_length=20, null=True, unique=True),
        ),
    ]