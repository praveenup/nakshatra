from django.contrib import admin
from .models import College, Students, UserCollege, TShirt
# Register your models here.
admin.site.register(College)
admin.site.register(TShirt)
admin.site.register(Students)
admin.site.register(UserCollege)