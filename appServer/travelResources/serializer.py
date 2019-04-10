from rest_framework import serializers
from .models import *

class ArticlePostSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArticlePost
        fields = '__all__'
        read_only_fields = ['id', 'create_date']


class LocationTagSerializer(serializers.ModelSerializer):
    class Meta:
        model = LocationTag
        fields = '__all__'
        read_only_fields = ['id', 'create_date']