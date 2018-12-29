# Generated by Django 2.1.4 on 2018-12-29 05:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0006_auto_20181229_1036'),
    ]

    operations = [
        migrations.CreateModel(
            name='CodingCompetition',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('hackerrank_handle', models.CharField(max_length=100)),
                ('contact_no', models.CharField(max_length=10)),
                ('email', models.EmailField(max_length=254)),
                ('shirt_size', models.CharField(choices=[('s', 'S'), ('m', 'M'), ('l', 'L'), ('xl', 'XL'), ('xxl', 'XXL')], max_length=5)),
            ],
        ),
    ]