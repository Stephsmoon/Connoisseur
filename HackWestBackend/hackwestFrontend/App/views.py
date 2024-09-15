from django.shortcuts import render
from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .models import News
from django.contrib.auth.models import User
from .serializers import NewsInputSerializer



class NewsInputViewSet(viewsets.ModelViewSet):
    queryset = News.objects.all()
    serializer_class = NewsInputSerializer

