from django.db import models
from django.contrib.auth.models import User
# from django.db.models.signals import post_save
# from django.dispatch import receiver
from PIL import Image

class College(models.Model):
    college_name = models.TextField()

    def __str__(self):
        return self.college_name

    class Meta:
        ordering = ('college_name',)

class UserCollege(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    college_name = models.OneToOneField(College, on_delete=models.CASCADE)
    contact_no = models.CharField(max_length=10)

    def __str__(self):
        return self.user.username

    class Meta:
          ordering = ('college_name',)

class Students(models.Model):
    college = models.ForeignKey(UserCollege, on_delete=models.CASCADE)
    participant_name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)

    def __str__(self):
        return self.participant_name



SHIRT_CHOICES = (
    ('s','S'),
    ('m', 'M'),
    ('l','L'),
    ('xl','XL'),
    ('xxl','XXL'),

)

class Shirt(models.Model):
    roll_no = models.CharField(max_length=10, unique=True)
    student_name = models.CharField(max_length=100)
    shirt_size = models.CharField(max_length=5, choices=SHIRT_CHOICES)

    def __str__(self):
        template = '{0.roll_no} {0.student_name}'
        return template.format(self)




class PhotoRegistration(models.Model):
    college = models.ForeignKey(College, on_delete=models.CASCADE)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=50)
    student_name = models.CharField(max_length=100)
    contact_no = models.CharField(max_length=10,unique=True)
    topic = models.CharField(max_length=100)

    def __str__(self):
        template = '{0.college.college_name} {0.student_name}'
        return template.format(self)
    

class UserPhoto(models.Model):
    photo_reg = models.OneToOneField(PhotoRegistration, on_delete=models.CASCADE)
    description = models.TextField()
    image = models.ImageField(upload_to='photography_pics')

    def __str__(self):
        return self.photo_reg.email

class CodingCompetition(models.Model):
    name = models.CharField(max_length=100)
    hackerrank_handle = models.CharField(max_length=100, unique=True)
    contact_no = models.CharField(max_length=10)
    email = models.EmailField()
    shirt_size = models.CharField(max_length=5, choices=SHIRT_CHOICES)
    # @receiver(post_save, sender=User)
    # def create_profile(sender, instance, created, **kwargs):
    #     if created:
    #         Profile.objects.create(user=instance)


    # @receiver(post_save, sender=User)
    # def save_profile(sender, instance, **kwargs):
    #     instance.profile.save()

    # def save(self):
    #     super().save()

    #     img = Image.open(self.image.path)

    #     if img.height > 300 or img.width > 300:
    #         output_size = (300, 300)
    #         img.thumbnail(output_size)
    #         img.save(self.image.path)


