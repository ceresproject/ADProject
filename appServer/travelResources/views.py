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
from rest_framework import status

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
        queryset = BookMark.objects.filter(user=user).all().order_by('-create_date')
        bookmarks = self.paginate_queryset(queryset)
        bookmarks = BookmarkSerializer(bookmarks, many=True)
        return self.get_paginated_response(bookmarks.data)


class ArticleViewSet(viewsets.ModelViewSet):
    queryset = ArticlePost.objects.all()
    serializer_class = ArticlePostSerializer

    def retrieve(self, request, pk=None):
        article = ArticlePost.objects.get(id=pk)
        if ReadRecord.objects.filter(article=article, user=self.request.user).count()>0:
            ReadRecord.objects.filter(article=article, user=self.request.user).delete()
        ReadRecord.objects.get_or_create(article=article, user=self.request.user)
        read_times = ReadRecord.objects.filter(article=article).count()
        ArticlePostSerializer(article).update(instance=article, validated_data={'read_times': read_times})
        article = ArticlePost.objects.get(id=pk)
        serializer = ArticlePostSerializer(article)

        all_data = serializer.data
        all_data['marked'] = BookMark.objects.filter(user=self.request.user, article=article).count() > 0
        return Response(all_data)


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
        tags = LocationTag.objects.all()
        for tag in tags:
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
        _id = params['id']
        try:
            obj = ArticlePost.objects.get(id=_id)
            if BookMark.objects.filter(user=self.request.user, article=obj).count() > 0:
                BookMark.objects.get(user=self.request.user, article=obj).delete()
                return Response({'status': True, 'detail': 'Removed Mark!'})

            else:
                BookMark.objects.create(user=self.request.user, article=obj)
                return Response({'status': True,'detail': 'Marked success!'})

        except:
            return Response({'status': False,'detail': 'This article does not exist!'})


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
    #permission_classes = (permissions.IsAuthenticated, )
    queryset = ArticlePost.objects.all()

    def post(self, request):
        params = self.request.data
        key = params['key']
        try:
            queryset = ArticlePost.objects.filter(Q(title__icontains=key) | Q(tag__tag__icontains=key) | Q(type__name__icontains=key)).order_by('-create_date')
            articles = self.paginate_queryset(queryset)
            articles = ArticlePostSerializer(articles,many=True)
        except:
            return Response({'detail': 'No results'},status.HTTP_204_NO_CONTENTt)

        return self.get_paginated_response(articles.data)


class HistroyAPIView(ListAPIView):
    #permission_classes = (permissions.IsAuthenticated, )
    queryset = ReadRecord.objects.all()

    def get(self, request):
        user = self.request.user
        records = ReadRecord.objects.filter(user=user).order_by('-read_date')
        try:
            records = self.paginate_queryset(records)
            records = ReadRecordSerializer(records,many=True)
        except:
            return Response({'detail': 'No results'})
        return self.get_paginated_response(records.data)
#lass DefaultSearchPageResults(ListAPIView):
