from django.db import models
from PIL import Image
from users.models import College

class PhotoRegistration(models.Model):
    college = models.OneToOneField(College, on_delete=models.CASCADE)
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



