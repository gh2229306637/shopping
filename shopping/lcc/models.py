from django.db import models

class User(models.Model):
    phone = models.IntegerField()
    password = models.CharField(max_length=100)
    code = models.IntegerField()
    token = models.CharField(max_length=100)