from rest_framework import serializers
from .models import *
from account.serializer import *
class TypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Type
        fields = '__all__'
        read_only_fields = ['id', 'create_date']

class ImageSerializer(serializers.ModelSerializer):
    url = serializers.ImageField(use_url=True, allow_null=True, required=False)
    class Meta:
        model = Image
        fields = ['url']

class LocationTagSerializer(serializers.ModelSerializer):
    type = TypeSerializer(many=True)
    images = ImageSerializer(many=True)
    class Meta:
        model = LocationTag
        fields = '__all__'
        read_only_fields = ['id', 'create_date']


class ArticlePostSerializer(serializers.ModelSerializer):
    type = TypeSerializer(many=True)
    images = ImageSerializer(many=True)
    tag = LocationTagSerializer(read_only=True, required=False)
    class Meta:
        model = ArticlePost
        fields = '__all__'
        read_only_fields = ['id', 'create_date', 'read_times']


class BookmarkSerializer(serializers.ModelSerializer):
    tag = LocationTagSerializer(read_only=True)
    user = UserSerializer(read_only=True)
    article = ArticlePostSerializer(read_only=True)
    class Meta:
        model = BookMark
        fields = '__all__'
        read_only_fields = ['id', 'create_date']

class ReadRecordSerializer(serializers.ModelSerializer):
    #article = ArticlePostSerializer(read_only=True, required=False)
    class Meta:
        model = ReadRecord
        fields = '__all__'
        read_only_fields = ['id', 'user','read_date']