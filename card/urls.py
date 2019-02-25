from django.urls import path, include
from django.contrib.auth import views as auth_views
from . import views
# from .views import CustomLoginView
from django.views.generic import TemplateView
# from django.conf import settings


# app_name = 'users'

urlpatterns = [
    path('', views.card, name="card"),
    path('card_detail/', views.card_detail, name="card_detail"),
]

# if settings.DEBUG: 
#         urlpatterns += static(settings.MEDIA_URL, 
#                               document_root=settings.MEDIA_ROOT) 