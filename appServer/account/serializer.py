from rest_framework import serializers
from .models import *

class BookMarkSerializer(serializers.ModelSerializer):
    class Meta:
        model = BookMark
        fields = '__all__'
        read_only_fields = ['id', 'create_date']



class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'password')
        read_only_fields = ['id', ]
        write_only_fields = ('password',)

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)

        user.set_password(validated_data['password'])
        user.save()

        return user