from django.db import models
from django.core.exceptions import ValidationError
from django.core.validators import FileExtensionValidator

SHIRT_CHOICES = (
    ('s','S'),
    ('m', 'M'),
    ('l','L'),
    ('xl','XL'),
    ('xxl','XXL'),

)

class CodingCompetition(models.Model):
    college_name = models.CharField(max_length=200)
    student_name = models.CharField(max_length=100)
    hackerrank_handle = models.CharField(max_length=100, unique=True)
    contact_no = models.CharField(max_length=10)
    email = models.EmailField()
    shirt_size = models.CharField(max_length=5, choices=SHIRT_CHOICES)

    def __str__(self):
        template = '{0.college_name} {0.student_name} {0.hackerrank_handle}'
        return template.format(self)