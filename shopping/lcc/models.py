from django.db import models

class User(models.Model):
    phone = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    code = models.CharField(max_length=10)
    token = models.CharField(max_length=100)