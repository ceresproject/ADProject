from django.db import models
from django.contrib.auth.models import User
import uuid

MAX_TITLE_LENGTH = 50
MAX_BODY_LENGTH = 1400
MAX_DIG_LENGTH = 20


def post_name(instance, filename):
    return 'images/' + str(uuid.uuid4()) + filename


class Type(models.Model):
    name = models.CharField(max_length=MAX_TITLE_LENGTH, null=False)

    def __str__(self):
        return self.name


class Image(models.Model):
    url = models.ImageField(upload_to=post_name)

    def __str__(self):
        return self.url.name


class LocationTag(models.Model):
    tag = models.CharField(max_length=MAX_TITLE_LENGTH, null=False)
    type = models.ManyToManyField(Type, related_name='location_type')
    content = models.TextField(null=False)
    images = models.ManyToManyField(Image, related_name='tag_image_list')
    create_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.tag

    @property
    def articles(self):
        return self.articlepost_set.all()


class ArticlePost(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    tag = models.ForeignKey(LocationTag, on_delete=models.CASCADE)
    title = models.CharField(max_length=MAX_TITLE_LENGTH, null=False)
    read_times = models.IntegerField(null=False)
    postal_code = models.IntegerField(null=False)
    type = models.ManyToManyField(Type, related_name='article_type')
    images = models.ManyToManyField(Image, related_name='post_image_list')
    content = models.TextField(null=False)
    create_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

class ReadRecord(models.Model):
    article = models.ForeignKey(ArticlePost, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    read_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.article.title

class Rank(models.Model):
    post = models.ForeignKey(ArticlePost, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    level = models.FloatField(null=False)
    content = models.TextField(null=False)
    create_date = models.DateTimeField(auto_now_add=True)


class UserFollow(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    

class BookMark(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    article = models.ForeignKey(ArticlePost, on_delete=models.CASCADE)
    create_date = models.DateTimeField(auto_now_add=True)