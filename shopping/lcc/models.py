from django.db import models

class User(models.Model):
    Phone = models.IntegerField()
    password1 = models.CharField(max_length=100)
    password2 = models.CharField(max_length=100)
    code = models.IntegerField()
    token = models.CharField(max_length=100)