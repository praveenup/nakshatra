from django.contrib import admin
from .models import College, Students, UserCollege, Shirt, RegistrationPhoto, Photo
# Register your models here.
admin.site.register(College)
admin.site.register(Shirt)
admin.site.register(Students)
admin.site.register(UserCollege)
admin.site.register(RegistrationPhoto)
admin.site.register(Photo)