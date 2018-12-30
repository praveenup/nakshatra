# Generated by Django 2.1.4 on 2018-12-30 17:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='PhotoRegistration',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('password', models.CharField(max_length=50)),
                ('student_name', models.CharField(max_length=100)),
                ('contact_no', models.CharField(max_length=10, unique=True)),
                ('topic', models.CharField(max_length=100)),
                ('college', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='users.College')),
            ],
        ),
        migrations.CreateModel(
            name='UserPhoto',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField()),
                ('image', models.ImageField(upload_to='photography_pics')),
                ('photo_reg', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='events.PhotoRegistration')),
            ],
        ),
    ]
