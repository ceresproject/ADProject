from django.contrib.auth.models import User
from django.db import models
from travelResources.models import *
# Create your models here.



class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    location = models.CharField(max_length=MAX_TITLE_LENGTH, null=False, default='Singapore')


class BookMark(models.Model):
    tag = models.ForeignKey(LocationTag, on_delete=models.CASCADE)
    create_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.tag.tag
