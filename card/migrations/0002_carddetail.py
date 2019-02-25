# Generated by Django 2.1.4 on 2019-02-09 12:36

import card.models
import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('card', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CardDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('college_name', models.CharField(max_length=200)),
                ('group_name', models.CharField(max_length=50, unique=True)),
                ('participant1_name', models.CharField(max_length=100)),
                ('image1', models.ImageField(help_text='Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png', upload_to='college_card_pics', validators=[django.core.validators.FileExtensionValidator(['jpg', 'jpeg', 'png']), card.models.CardDetail.validate_image])),
                ('participant2_name', models.CharField(max_length=100)),
                ('image2', models.ImageField(help_text='Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png', upload_to='college_card_pics', validators=[django.core.validators.FileExtensionValidator(['jpg', 'jpeg', 'png']), card.models.CardDetail.validate_image])),
                ('participant3_name', models.CharField(max_length=100)),
                ('image3', models.ImageField(help_text='Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png', upload_to='college_card_pics', validators=[django.core.validators.FileExtensionValidator(['jpg', 'jpeg', 'png']), card.models.CardDetail.validate_image])),
                ('participant4_name', models.CharField(max_length=100)),
                ('image4', models.ImageField(help_text='Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png', upload_to='college_card_pics', validators=[django.core.validators.FileExtensionValidator(['jpg', 'jpeg', 'png']), card.models.CardDetail.validate_image])),
                ('participant5_name', models.CharField(max_length=100)),
                ('image5', models.ImageField(help_text='Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png', upload_to='college_card_pics', validators=[django.core.validators.FileExtensionValidator(['jpg', 'jpeg', 'png']), card.models.CardDetail.validate_image])),
            ],
        ),
    ]