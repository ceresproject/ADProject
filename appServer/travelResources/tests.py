from django.test import TestCase, Client
from rest_framework.test import APIClient

from django.contrib.auth.models import User
import json, time
from .models import *
from .serializer import *
# Create your tests here.

articles = ArticlePost.objects.all()
class HomePageTOPTen(TestCase):

    def test_get(self):
        c = Client()
        print('Top 10 function test start ')

        response = c.get('/api/home/recommend/')
        self.assertEquals(response.status_code, 200)
        print('Top 10 function test successful')

class BookmarkPage(TestCase):
    location = 'Bishan'
    username = 'admin'
    password = 'admin'
    def a_test_register(self):
        c = Client()
        print('register test start')

        response1 = c.post('http://127.0.0.1:8000/register/', {'username': self.username, 'password': self.password})
        if response1.status_code == 200:
            content = json.loads(str(response1.content, encoding = "utf-8"))
            print('register ', content['detail'])
            self.assertIs(content['detail'], True)
        else:
            print('register fail')

    def a_test_login(self):
        print('login test start')

        c = APIClient()
        response2 = c.post('http://127.0.0.1:8000/login/', {'username': self.username, 'password': self.password})
        if response2.status_code == 200:
            content = json.loads(str(response2.content, encoding = "utf-8"))
            print('login True', content['token'])
            self._token = content['token']
        else:
            print('login False', response2.status_code)
        self.assertIsNot(self._token, None)

    def a_test_get(self):
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION='Token ' + self._token)

        print('Click the bookmark button.', self._token)
        response = client.post('/api/makeMark/', {'id': self.location}, format='json')

        self.assertEquals(response.status_code, 200)
        print('Bookmark Successful')

    def test_register_then_login_then_auth(self):
        self.a_test_register()
        self.a_test_login()
        self.a_test_get()

class SearchPage(TestCase):

    def setUp(self):
        for i in articles:
            ArticlePost.objects.create(i)
    key = 'hall'
    def test_get(self):
        c = Client()
        print('Search function test start ')

        response = c.post('/api/search/', {'key': self.key})
        self.assertEquals(response.status_code, 200)
        print('Search test successful')

class SearchPage_Titile(TestCase):
    title = '1121541556151'
    def setUp(self):
        for i in articles:
            ArticlePost.objects.create(i)
    def test_title(self):
        c = Client()
        print('Search by title start ', ArticlePost.objects.count())
        response = c.post('/api/search/', {'key': self.title})
        self.assertEquals(response.status_code, 200)
        print('Search test successful')
