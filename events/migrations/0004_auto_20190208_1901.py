# Generated by Django 2.1.4 on 2019-02-08 13:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0003_merge_20181231_0856'),
    ]

    operations = [
        migrations.AlterField(
            model_name='photoregistration',
            name='college',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.College'),
        ),
    ]