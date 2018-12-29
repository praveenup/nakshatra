# Generated by Django 2.1.4 on 2018-12-28 21:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_registrationphoto'),
    ]

    operations = [
        migrations.CreateModel(
            name='Photo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('desc', models.TextField(null=True)),
                ('image', models.ImageField(null=True, upload_to='photography_pics')),
            ],
        ),
        migrations.RemoveField(
            model_name='registrationphoto',
            name='desc',
        ),
        migrations.RemoveField(
            model_name='registrationphoto',
            name='image',
        ),
        migrations.AddField(
            model_name='photo',
            name='photo_user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='users.RegistrationPhoto'),
        ),
    ]
