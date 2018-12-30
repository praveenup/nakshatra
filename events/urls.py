from django.urls import path, include
from . import views

urlpatterns = [
    path('upload_photo/', views.upload_photo, name="upload_photo"),
    path('photo_register/', views.photo_register,name="photo_register"),
    path('photo_login/', views.photo_login,name="photo_login"),
    path('photo_logout/', views.photo_logout,name="photo_logout"),
]
