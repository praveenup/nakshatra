from django.db import models



SHIRT_CHOICES = (
    ('s','S'),
    ('m', 'M'),
    ('l','L'),
    ('xl','XL'),
    ('xxl','XXL'),

)

class TShirt(models.Model):
    roll_no = models.CharField(max_length=10, unique=True)
    student_name = models.CharField(max_length=100)
    shirt_size = models.CharField(max_length=5, choices=SHIRT_CHOICES)
    payment_reference_number = models.CharField(max_length=100, help_text="If paid in cash, just write CASH")

    def __str__(self):
        template = '{0.roll_no} {0.student_name}'
        return template.format(self)





