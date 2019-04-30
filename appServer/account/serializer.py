from rest_framework import serializers
from .models import *

class BookMarkSerializer(serializers.ModelSerializer):
    class Meta:
        model = BookMark
        fields = '__all__'
        read_only_fields = ['id', 'create_date']



class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    class Meta:
        model = User
        fields = ('username', 'password')
        read_only_fields = ['id', ]
        write_only_fields = ('password',)
