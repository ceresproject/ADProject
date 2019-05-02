from django.test import TestCase, Client
from django.contrib.auth.models import User
from .serializer import *
from rest_framework.authtoken.models import Token
import json, time

# Create your tests here.


class AccountAuthTest(TestCase):
    _token = None
    username = 'admin'
    password = '123456'
    '''
    User register, login and token auth check
    '''
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

        c = Client()
        response2 = c.post('http://127.0.0.1:8000/login/', {'username': self.username, 'password': self.password})
        if response2.status_code == 200:
            content = json.loads(str(response2.content, encoding = "utf-8"))
            print('login True', content['token'])
            self._token = content['token']
        else:
            print('login False', response2.status_code)
        self.assertIsNot(self._token, None)

    def a_test_auth(self):
        print('check auth token test start')

        c = Client()
        response3 = c.post('http://127.0.0.1:8000/auth/', {'token': self._token})
        if response3.status_code == 200:
            content = json.loads(str(response3.content, encoding = "utf-8"))
            print('check auth token', content['detail'])
            self.assertIs(content['detail'], True)
        else:
            print('check False')

    def a_test_logout(self):
        print('logout test start')

        c = Client()
        response3 = c.post('http://127.0.0.1:8000/logout/', {'token': self._token})
        if response3.status_code == 200:
            content = json.loads(str(response3.content, encoding = "utf-8"))
            print('logout ', content['detail'])
            self.assertIs(content['detail'], True)
        else:
            print('logout fail')

    def test_register_then_login_then_auth(self):
        self.a_test_register()
        self.a_test_login()
        self.a_test_auth()
        self.a_test_logout()
