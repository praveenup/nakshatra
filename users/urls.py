from django.urls import path, include
from django.contrib.auth import views as auth_views
from . import views
# from .views import CustomLoginView
from django.views.generic import TemplateView
# from django.conf import settings


# app_name = 'users'

urlpatterns = [
    path('index_test/', views.index_test, name="index_test"),
    path('coding_competition/', views.coding_competition, name="coding_competition"),
    path('tshirt/', views.shirt, name="shirt"),
    path('register/', views.register,name="register"),
    path('profile/', views.profile,name="profile"),
    path('login/', auth_views.LoginView.as_view(template_name='users/login.html'),name="login"),
    path('logout/', auth_views.LogoutView.as_view(template_name='users/logout.html'),name="logout"),
]

# if settings.DEBUG: 
#         urlpatterns += static(settings.MEDIA_URL, 
#                               document_root=settings.MEDIA_ROOT) 