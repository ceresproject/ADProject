from django.test import TestCase, Client
from django.contrib.auth.models import User
import json, time
# Create your tests here.



class HomePageTOPTen(TestCase):

    def test_get(self):
        c = Client()
        print('Top 10 function test start ')

        response = c.get('/api/home/recommend/')
        self.assertEquals(response.status_code, 200)


class SearchPage(TestCase):
    key = 'hall'
    def test_get(self):
        c = Client()
        print('Search function test start ')

        response = c.post('/api/search/',{'key': self.key})
        self.assertEquals(response.status_code, 200)
