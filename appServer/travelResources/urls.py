from django.conf.urls import url
from django.contrib import admin
from django.urls import path, include
from .views import *
urlpatterns = [
    url(r'^api/home/', HomeRecommendView.as_view()),

]