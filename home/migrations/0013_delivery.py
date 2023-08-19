# Generated by Django 4.2.2 on 2023-08-09 08:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0012_remove_driver_id_remove_member_id_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Delivery',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('delivery_date', models.DateField()),
                ('plastic_collected', models.DecimalField(decimal_places=2, max_digits=5)),
                ('is_scheduled', models.BooleanField(default=False)),
                ('bin', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='home.bin')),
                ('driver', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='home.driver')),
            ],
        ),
    ]