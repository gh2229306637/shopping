from django.db import models

class User(models.Model):
    phone = models.CharField(max_length=100,unique=True)
    password = models.CharField(max_length=100)
    img = models.CharField(max_length=500,default='https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547563523328&di=454d5a9af6531d6a5737be1faad62291&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F24%2F002346yjf4j61jmcepjjzg.jpg')
    token = models.CharField(max_length=100)
class Wheel(models.Model):
    img = models.CharField(max_length=500)
    name = models.CharField(max_length=50)
    trackid = models.CharField(max_length=20)

class Computers(models.Model):
    title = models.CharField(max_length=100)
    img = models.CharField(max_length=100)
    img1 = models.CharField(max_length=500)
    img2 = models.CharField(max_length=500)
    img3 = models.CharField(max_length=500)
    img4 = models.CharField(max_length=500)
    introduce = models.CharField(max_length=300)
    price = models.CharField(max_length=10)