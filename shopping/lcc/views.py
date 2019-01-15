import hashlib
import random
import re

import time
from django.shortcuts import render,redirect
from django.http import HttpResponse,HttpRequest,JsonResponse

from lcc.models import User, Wheel, Computers


def index(request):
    wheels = Wheel.objects.all()
    token = request.session.get('token')
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
        phone = user.phone
        img = user.img
    else:
        phone = None
        img = None
    computers = Computers.objects.all()
    return render(request,'index.html',{'phone':phone,'wheels':wheels,'computers':computers,'img':img})


def generate_token():
    token = str(time.time()) + str(random.random())
    md5 = hashlib.md5()
    md5.update(token.encode('utf-8'))
    return md5.hexdigest()


def generate_passwd(passwd):
    sha = hashlib.sha256()
    sha.update(passwd.encode('utf-8'))
    return sha.hexdigest()


def register(request):
    if request.method == 'GET':
        return render(request,'register.html')
    elif request.method == 'POST':
        user = User()
        user.phone = request.POST.get('phone')
        user.password = generate_passwd(request.POST.get('password'))
        user.token = generate_token()
        user.save()
        response = redirect('lcc:index')
        request.session['token'] = user.token
        return response


def logout(request):
    response = redirect('lcc:index')
    request.session.flush()
    return response


def login(request):
    if request.method == 'GET':
        return render(request,'login.html')
    elif request.method == 'POST':
        phone = request.POST.get('phone')
        password = generate_passwd(request.POST.get('password'))
        users = User.objects.filter(phone=phone).filter(password=password)
        #如果匹配失败阻止表单提交
        if users.count():
            response = redirect('lcc:index')
            user = users.first()
            user.token = generate_token()
            user.save()
            request.session['token'] = user.token
            return response
        else:
            err = '用户名或密码错误，请重新登录！'
            return render(request,'login.html',{'err':err})


def detail(request,goodsid):
    token = request.session.get('token')
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
        phonenum = user.phone
        img = user.img
    else:
        phonenum = None
        img = None
    computer = Computers.objects.get(id=goodsid)
    return render(request,'detail.html',{'phonenum':phonenum,'computer':computer,'img':img})


def checkphone(request):
    phone = request.GET.get('phone')
    user = User.objects.filter(phone=phone)
    if user.exists():#占用
        return JsonResponse({'info':'账号被占用','status':0})
    else:#可用
    #print(phone)
        return JsonResponse({'info':'账号可以使用','status':1})