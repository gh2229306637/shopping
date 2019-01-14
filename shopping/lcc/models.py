from django.db import models

class User(models.Model):
    phone = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    code = models.CharField(max_length=10)
    token = models.CharField(max_length=100)
class Wheel(models.Model):
    img = models.CharField(max_length=500)
    name = models.CharField(max_length=50)
    trackid = models.CharField(max_length=20)

class Computers(models.Model):
    title = models.CharField(max_length=100)
    img = models.CharField(max_length=100)
    img1 = models.CharField(max_length=100)
    img2 = models.CharField(max_length=100)
    img3 = models.CharField(max_length=100)
    img4 = models.CharField(max_length=100)
    introduce = models.CharField(max_length=300)
    price = models.CharField(max_length=10)