# Generated by Django 2.1.4 on 2018-12-29 05:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0007_codingcompetition'),
    ]

    operations = [
        migrations.AlterField(
            model_name='codingcompetition',
            name='hackerrank_handle',
            field=models.CharField(max_length=100, unique=True),
        ),
    ]