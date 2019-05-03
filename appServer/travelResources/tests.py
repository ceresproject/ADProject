from django.test import TestCase, Client
from django.contrib.auth.models import User
import json, time
# Create your tests here.
class HomePageTOPTen(TestCase):

    def test_get(self):
        c = Client()
        print('Top 10 function test start ')

        response = c.get('/api/home/recommend/')
        if response.status_code == 200:
            print('Date get')
        else:
            print('Fail')


class SearchPage(TestCase):
    key = 'hall'
    def test_get(self):
        c = Client()
        print('Search function test start ')

        response = c.post('/api/search/',{'key': self.key})
        if response.status_code == 200:
            content = json.loads(str(response.content, encoding = "utf-8"))
            print(content)
            results = content['results']
            print(len(results))
            for i in results:
                print('item ', i['id'], 'has the key', self.key in i['title'])
        else:
            print('Fail')