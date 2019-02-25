from django.db import models
from PIL import Image
from django.core.exceptions import ValidationError
from django.core.validators import FileExtensionValidator


class Cards(models.Model):
    def validate_image(fieldfile_obj):
        filesize = fieldfile_obj.file.size
        megabyte_limit = 1.0
        if filesize > megabyte_limit*1024*1024:
            raise ValidationError("Max file size is %sMB" % str(megabyte_limit))

    roll_no = models.CharField(max_length=10, unique=True)
    name = models.CharField(max_length=100)
    image = models.ImageField(upload_to='card_pics',  validators=[FileExtensionValidator(['jpg','jpeg','png']), validate_image], help_text="Filename should be in format rollno_name, Max. size is 1MB and valid file types jpg, jpeg, png")

    def __str__(self):
        return self.name

class CardDetail(models.Model):
    def validate_image(fieldfile_obj):
        filesize = fieldfile_obj.file.size
        megabyte_limit =0.5
        if filesize > megabyte_limit*1024*1024:
            raise ValidationError("Max file size is %sMB" % str(megabyte_limit))

    college_name = models.CharField(max_length=200, unique=True)
    group_name = models.CharField(max_length=50, unique=True)
    participant1_name = models.CharField(max_length=100)
    image1 = models.ImageField(upload_to='college_card_pics',  validators=[FileExtensionValidator(['jpg','jpeg','png']), validate_image], help_text="Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png")
    participant2_name = models.CharField(max_length=100)
    image2 = models.ImageField(upload_to='college_card_pics',  validators=[FileExtensionValidator(['jpg','jpeg','png']), validate_image], help_text="Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png")
    participant3_name = models.CharField(max_length=100)
    image3 = models.ImageField(upload_to='college_card_pics',  validators=[FileExtensionValidator(['jpg','jpeg','png']), validate_image], help_text="Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png")
    participant4_name = models.CharField(max_length=100)
    image4 = models.ImageField(upload_to='college_card_pics',  validators=[FileExtensionValidator(['jpg','jpeg','png']), validate_image], help_text="Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png")
    participant5_name = models.CharField(max_length=100)
    image5 = models.ImageField(upload_to='college_card_pics',  validators=[FileExtensionValidator(['jpg','jpeg','png']), validate_image], help_text="Filename should be in format collegeName_YourName, Max. size is 500KB and valid file types jpg, jpeg, png")

    def __str__(self):
        return self.college_name





