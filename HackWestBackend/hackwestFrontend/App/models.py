from django.db import models
from django.contrib.auth.models import AbstractUser

class News(models.Model):
    title = models.TextField()
    text = models.TextField()








