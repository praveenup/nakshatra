from django.urls import path, include
from django.contrib.auth import views as auth_views
from . import views
from django.views.generic import TemplateView

# app_name = 'users'

urlpatterns = [
    # path('photo/', views.model_form_upload, name="shirt"),
    path('coding_competition/', views.coding_competition, name="coding_competition"),
    path('tshirt/', views.shirt, name="shirt"),
    path('upload_photo/', views.upload_photo, name="upload_photo"),
    path('photo_register/', views.photo_register,name="photo_register"),
    path('register/', views.register,name="register"),
    path('profile/', views.profile,name="profile"),
    path('photo_login/', auth_views.LoginView.as_view(template_name='users/photo_login.html'),name="photo_login"),
    path('login/', auth_views.LoginView.as_view(template_name='users/login.html'),name="login"),
    path('logout/', auth_views.LogoutView.as_view(template_name='users/logout.html'),name="logout"),
]