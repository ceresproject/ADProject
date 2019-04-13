from django.db.models import Q
from django.shortcuts import render
import time, datetime
# Create your views here.
from rest_framework import viewsets, permissions
from rest_framework.decorators import action
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from rest_framework.views import APIView

from .serializer import *
from .models import *

class MyPageNumber(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'size'
    page_query_param = 'page'
    max_page_size = None


class ArticleViewSet(viewsets.ModelViewSet):
    queryset = ArticlePost.objects.all()
    serializer_class = ArticlePostSerializer
    permission_classes = (permissions.IsAuthenticated, )


class LocationTagViewSet(viewsets.ModelViewSet):
    queryset = LocationTag.objects.all()
    serializer_class = LocationTagSerializer
    permission_classes = (permissions.IsAuthenticated, )


class HomeRecommendView(APIView):

    def get(self, request, format=None):
        # get all tags in types

        # get all posts in a week
        today_date = datetime.date.today()
        location = dict(self.request.data).setdefault('location', 'Singapore')
        articles = ArticlePost.objects.filter(Q(tag__tag__iexact=location) | Q(tag__articlepost__title__iexact=location)).order_by('-read_times')
        articles = articles.filter(create_date__range=[(today_date - datetime.timedelta(days=1)).strftime("%Y-%m-%d"), today_date.strftime("%Y-%m-%d")]).order_by("-read_times")
        page_obj = MyPageNumber()
        page_article = page_obj.paginate_queryset(queryset=articles, request=request, view=self)
        data = ArticlePostSerializer(page_article, many=True)
        return page_obj.get_paginated_response(data.data)