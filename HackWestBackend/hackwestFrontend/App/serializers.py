from rest_framework import serializers
from .models import News
from rest_framework.authtoken.models import Token

class NewsInputSerializer(serializers.ModelSerializer):
    class Meta:
        model = News
        fields = ('id', 'title', 'text')
