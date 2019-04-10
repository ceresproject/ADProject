from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from .serializer import *
from .models import *


class ArticleViewSet(viewsets.ModelViewSet):
    queryset = ArticlePost.objects.all()
    serializer_class = ArticlePostSerializer
    permission_classes = (permissions.IsAuthenticated, )


class LocationTagViewSet(viewsets.ModelViewSet):
    queryset = LocationTag.objects.all()
    serializer_class = LocationTagSerializer
    permission_classes = (permissions.IsAuthenticated, )