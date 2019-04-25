from django.contrib.auth import get_user_model
from django.shortcuts import render
from rest_framework import viewsets, permissions
from rest_framework.authtoken.views import ObtainAuthToken, APIView
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from .models import *
from rest_framework.generics import *

from .serializer import *


class CustomAuthToken(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'token': token.key,
            'user_id': user.pk,
        })


class RegisterUserAPIView(APIView):
    permission_classes = [
        permissions.AllowAny # Or anon users can't register
    ]

    def post(self, request, *args, **kwargs):
        try:
            user = User.objects.create_user(**request.data)
            user.set_password(request.data['password'])
            user.save()
            return Response({'detail': True})
        except:
            return Response({'detail': False})


class TokenAuthCheckAPIView(APIView):
    permission_classes = [
        permissions.AllowAny # Or anon users can't register
    ]

    def post(self, request, *args, **kwargs):
        try:
            Token.objects.get(key=request.data['token'])
            return Response({'detail': True})
        except:
            return Response({'detail': False})


class TokenAuthCleanAPIView(APIView):
    permission_classes = [
        permissions.AllowAny # Or anon users can't register
    ]

    def post(self, request, *args, **kwargs):
        try:
            Token.objects.get(key=request.data['token']).delete()
            return Response({'detail': True})
        except:
            return Response({'detail': False})



class BookMarkViewSet(viewsets.ModelViewSet):
    queryset = BookMark.objects.all()
    serializer_class = BookMarkSerializer
    permission_classes = (permissions.IsAuthenticated, )
