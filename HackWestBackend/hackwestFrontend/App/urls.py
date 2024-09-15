from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from .views import NewsInputViewSet
from App import views



router = routers.DefaultRouter()
router.register(r'news', NewsInputViewSet, basename='news')


urlpatterns = [
    path('', include(router.urls)),
] 
    

