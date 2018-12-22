from django.urls import path, include
from django.contrib.auth import views as auth_views
from . import views
from django.views.generic import TemplateView

# app_name = 'users'

urlpatterns = [
    path('tshirt/', views.shirt, name="shirt"),
    path('register/', views.register,name="register"),
    path('profile/', views.profile,name="profile"),
    path('login/', auth_views.LoginView.as_view(template_name='users/login.html'),name="login"),
    path('logout/', auth_views.LogoutView.as_view(template_name='users/logout.html'),name="logout"),
]