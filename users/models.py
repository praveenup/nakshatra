from django.db import models
from django.contrib.auth.models import User



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

class TShirt(models.Model):
    roll_no = models.CharField(max_length=10, unique=True)
    student_name = models.CharField(max_length=100)
    shirt_size = models.CharField(max_length=5, choices=SHIRT_CHOICES)
    payment_reference_number = models.CharField(max_length=100, help_text="If paid in cash, just write CASH")

    def __str__(self):
        template = '{0.roll_no} {0.student_name}'
        return template.format(self)





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


