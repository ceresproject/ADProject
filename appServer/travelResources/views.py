from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render
import time, datetime
# Create your views here.
from rest_framework import viewsets, permissions
from rest_framework.decorators import action
from rest_framework.generics import get_object_or_404
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from rest_framework.views import *
from rest_framework.generics import *
import json
from .serializer import *
from .models import *

class MyPageNumber(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'size'
    page_query_param = 'page'
    max_page_size = None


class BookmarkViewSet(viewsets.ModelViewSet):
    queryset = BookMark.objects.all()
    serializer_class = BookmarkSerializer
    permission_classes = (permissions.IsAuthenticated, )

    def list(self, request):
        user = self.request.user
        print(user.id)
        queryset = BookMark.objects.filter(user=user).all().order_by('-create_date')
        print(queryset)
        bookmarks = self.paginate_queryset(queryset)
        bookmarks = BookmarkSerializer(bookmarks, many=True)
        return self.get_paginated_response(bookmarks.data)


class ArticleViewSet(viewsets.ModelViewSet):
    queryset = ArticlePost.objects.all()
    serializer_class = ArticlePostSerializer
    permission_classes = (permissions.IsAuthenticated, )

    def retrieve(self, request, pk=None):
        article = ArticlePost.objects.get(id=pk)
        ReadRecord.objects.create(article=article, user=self.request.user)
        read_times = ReadRecord.objects.filter(article=article).count()
        ArticlePostSerializer(article).update(instance=article, validated_data={'read_times': read_times})
        article = ArticlePost.objects.get(id=pk)
        serializer = ArticlePostSerializer(article)
        return Response(serializer.data)




class LocationTagViewSet(viewsets.ModelViewSet):
    queryset = LocationTag.objects.all()
    serializer_class = LocationTagSerializer
    permission_classes = (permissions.AllowAny, )



class HomeTopRecommendSerializer(serializers.Serializer):
    id = serializers.IntegerField(min_value=1)
    tag = LocationTagSerializer()
    articles = ArticlePostSerializer(many=True)


'''
Recommend
'''
class HomeRecommendView(APIView):
    #permission_classes = (permissions.IsAuthenticated, )

    def get(self, request, format=None):
        # get all tags in types

        # get all posts in a week
        today_date = datetime.date.today()
        articles = []
        section = {
            'tag': None,
            'results': None
        }

        for tag in LocationTag.objects.all():
            get_articles = ArticlePost.objects.filter(tag=tag).order_by('-read_times')[:10]
            articles_serializers = ArticlePostSerializer(get_articles,many=True)
            section = HomeTopRecommendSerializer(data={'id':tag.id,'tag': LocationTagSerializer(tag).data, 'articles':articles_serializers.data})
            section.is_valid()
            articles.append(section.data)


        #articles = articles.filter(create_date__range=[(today_date - datetime.timedelta(days=1)).strftime("%Y-%m-%d"), today_date.strftime("%Y-%m-%d")]).order_by("-read_times")
        return Response({'results':articles})


class BookmarkView(APIView):
    permission_classes = (permissions.IsAuthenticated, )

    def post(self, request):
        params = self.request.data
        tag_id = params['id']
        try:
            location = LocationTag.objects.get(id=tag_id)
        except:
            return Response({'status': False,'detail': 'This location does not exist!'})
        BookMark.objects.get_or_create(user=self.request.user, tag=location)
        return Response({'status': True,'detail': 'Marked success!'})

class RankAPIkView(APIView):
    permission_classes = (permissions.IsAuthenticated, )

    def post(self, request):
        params = self.request.data
        tag_id = params['id']
        try:
            article = ArticlePost.objects.get(id=tag_id)
        except:
            return Response({'detail': 'This article does not exist!'})
        Rank.objects.get_or_create(user=self.request.user, post=article, level=params['level'], content=params['content'])
        return Response({'detail': 'Ranked success!'})


class SearchAPIView(ListAPIView):
    permission_classes = (permissions.IsAuthenticated, )

    def post(self, request):
        params = self.request.data
        key = params['key']
        try:
            queryset = ArticlePost.objects.filter(title__icontains=key).order_by('-create_date')
            articles = self.paginate_queryset(queryset)
            articles = ArticlePostSerializer(articles,many=True)
            print(articles)
        except:
            return Response({'detail': 'No results'})

        return self.get_paginated_response(articles.data)

#lass DefaultSearchPageResults(ListAPIView):
