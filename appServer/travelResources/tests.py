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
        print(articles.count())
        for i in articles:
            ArticlePost.objects.create(ArticlePostSerializer(i).data)
    key = 'hall'
    def test_get(self):
        c = APIClient()
        print('Search function test start ')

        response = c.post('/api/search/', {'key': self.key})
        print(response.status_code)
        self.assertEquals(response.status_code, 200)
        print('Search test successful')

class ProfilePage(TestCase):
    username = 'admin'
    password = 'admin'
    _token = None

    def a_test_register(self):
        c = Client()
        print('register test start')

        response1 = c.post('http://127.0.0.1:8000/register/', {'username': self.username, 'password': self.password})
        if response1.status_code == 200:
            content = json.loads(str(response1.content, encoding="utf-8"))
            print('register ', content['detail'])
            self.assertIs(content['detail'], True)
        else:
            print('register fail')

    def a_test_login(self):
        print('login test start')

        c = APIClient()
        response2 = c.post('http://127.0.0.1:8000/login/', {'username': self.username, 'password': self.password})
        if response2.status_code == 200:
            content = json.loads(str(response2.content, encoding="utf-8"))
            print('login True', content['token'])
            self._token = content['token']
        else:
            print('login False', response2.status_code)
        self.assertIsNot(self._token, None)

    def a_test_history(self):
        c = APIClient()
        c.credentials(HTTP_AUTHORIZATION='Token ' + self._token)
        print('Profile_history function test start ')
        response = c.get('/api/history/')
        self.assertEquals(response.status_code, 200)
        print('Test Success')
    def test_register_then_login_then_auth(self):
        self.a_test_register()
        self.a_test_login()
        self.a_test_history()

class ProfilePage_feedback(TestCase):
    username = 'admin'
    password = 'admin'
    _token = None
    title = 'title'
    email = 'email'
    content = 'content'
    def a_test_register(self):
        c = Client()
        print('register test start')

        response1 = c.post('http://127.0.0.1:8000/register/', {'username': self.username, 'password': self.password})
        if response1.status_code == 200:
            content = json.loads(str(response1.content, encoding="utf-8"))
            print('register ', content['detail'])
            self.assertIs(content['detail'], True)
        else:
            print('register fail')

    def a_test_login(self):
        print('login test start')

        c = APIClient()
        response2 = c.post('http://127.0.0.1:8000/login/', {'username': self.username, 'password': self.password})
        if response2.status_code == 200:
            content = json.loads(str(response2.content, encoding="utf-8"))
            print('login True', content['token'])
            self._token = content['token']
        else:
            print('login False', response2.status_code)
        self.assertIsNot(self._token, None)

    def a_test_feedback(self):
        c = APIClient()
        c.credentials(HTTP_AUTHORIZATION='Token ' + self._token)
        print('Feedback function test start ')
        response = c.post('/api/feedback/', {'title': self.title, 'email': self.email, 'content': self.content})
        print(response.status_code)
        self.assertEquals(response.status_code, 200)
        print('Test Success')
    def test_register_then_login_then_auth(self):
        self.a_test_register()
        self.a_test_login()
        self.a_test_feedback()

class ArticlePage(TestCase):
    username = 'admin'
    password = 'admin'
    _token = None
    _id = 5
    level = 3.0
    content = ''
    def a_test_register(self):
        c = Client()
        print('register test start')

        response1 = c.post('http://127.0.0.1:8000/register/', {'username': self.username, 'password': self.password})
        if response1.status_code == 200:
            content = json.loads(str(response1.content, encoding="utf-8"))
            print('register ', content['detail'])
            self.assertIs(content['detail'], True)
        else:
            print('register fail')

    def a_test_login(self):
        print('login test start')

        c = APIClient()
        response2 = c.post('http://127.0.0.1:8000/login/', {'username': self.username, 'password': self.password})
        if response2.status_code == 200:
            content = json.loads(str(response2.content, encoding="utf-8"))
            print('login True', content['token'])
            self._token = content['token']
        else:
            print('login False', response2.status_code)
        self.assertIsNot(self._token, None)

    def a_test_ranks(self):
        c = APIClient()
        c.credentials(HTTP_AUTHORIZATION='Token ' + self._token)
        print('Ranks function test start ')
        response = c.post('/api/makeRank/', {'id': self._id, 'level': self.level, 'content': self.content})
        print(response.status_code)
        self.assertEquals(response.status_code, 200)
        print('Test Success')

    def test_register_then_login_then_auth(self):
        self.a_test_register()
        self.a_test_login()
        self.a_test_ranks()

