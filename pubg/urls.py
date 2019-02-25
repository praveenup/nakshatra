from django.urls import path, include
from . import views


# app_name = 'users'

urlpatterns = [
    path('', views.pubg, name="pubg"),
]

# if settings.DEBUG: 
#         urlpatterns += static(settings.MEDIA_URL, 
#                               document_root=settings.MEDIA_ROOT) 