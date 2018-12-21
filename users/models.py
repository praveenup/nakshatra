from django.db import models
from django.contrib.auth.models import User
# from django.db.models.signals import post_save
# from django.dispatch import receiver
# from PIL import Image

class College(models.Model):
    college_name = models.TextField()

    def __str__(self):
        return f'{self.college_name}'

    class Meta:
        ordering = ('college_name',)

class UserCollege(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    college_name = models.OneToOneField(College, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.user.username}'

    class Meta:
          ordering = ('college_name',)

class Students(models.Model):
    college = models.ForeignKey(UserCollege, on_delete=models.CASCADE, null=True)
    participant_name = models.CharField(max_length=100, null=True)

    def __str__(self):
        return f'{self.college} Profile'

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


