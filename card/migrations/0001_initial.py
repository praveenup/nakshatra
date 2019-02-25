# Generated by Django 2.1.4 on 2019-02-09 09:53

import card.models
import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cards',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('roll_no', models.CharField(max_length=10, unique=True)),
                ('name', models.CharField(max_length=100)),
                ('image', models.ImageField(help_text='Filename should be in format rollno_name, Max. size is 1MB and valid file types jpg, jpeg, png', upload_to='card_pics', validators=[django.core.validators.FileExtensionValidator(['jpg', 'jpeg', 'png']), card.models.Cards.validate_image])),
            ],
        ),
    ]