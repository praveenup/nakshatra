from django.contrib import admin
from .models import College, Students, UserCollege, Shirt
# Register your models here.
admin.site.register(College)
admin.site.register(Shirt)
admin.site.register(Students)
admin.site.register(UserCollege)