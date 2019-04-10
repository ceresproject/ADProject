from django.urls import path, include
from rest_framework.routers import DefaultRouter
from travelResources.views import *

# Create a router and register our viewsets with it.
router = DefaultRouter()
router.register(r'article', ArticleViewSet)
router.register(r'locationTag', LocationTagViewSet)
