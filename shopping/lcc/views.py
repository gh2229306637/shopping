import hashlib
import random
import re

import time
from django.shortcuts import render,redirect
from django.http import HttpResponse,HttpRequest,JsonResponse

from lcc.models import User, Wheel, Computers, Cart


def index(request):
    wheels = Wheel.objects.all()
    token = request.session.get('token')
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
    else:
        user = None
    computers = Computers.objects.all()
    return render(request,'index.html',{'user':user,'wheels':wheels,'computers':computers})


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
        request.session.set_expiry(0)
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
        if users.count():
            response = redirect('lcc:index')
            user = users.first()
            user.token = generate_token()
            user.save()
            request.session['token'] = user.token
            request.session.set_expiry(0)
            return response
        else:
            err = '用户名或密码错误，请重新登录！'
            return render(request,'login.html',{'err':err})


def detail(request,goodsid):
    token = request.session.get('token')
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
        carts = Cart.objects.filter(user=user)
    else:
        user = None
        carts = None
    computer = Computers.objects.get(id=goodsid)
    return render(request,'detail.html',{'user':user,'computer':computer,'carts':carts})


def checkphone(request):
    phone = request.GET.get('phone')
    user = User.objects.filter(phone=phone)
    if user.exists():#占用
        return JsonResponse({'info':'账号被占用','status':0})
    else:#可用
        return JsonResponse({'info':'账号可以使用','status':1})


def shoppingCart(request):
    token = request.session.get('token')
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
        carts = Cart.objects.filter(user=user)
    else:
        user = None
        carts = None
    return render(request, 'shoppingCart.html', {'user':user,'carts':carts})




def addCart(request):
    token = request.session.get('token')

    if token:
        user = User.objects.get(token=token)
        computersid = request.GET.get('computersid')
        computers = Computers.objects.get(id=computersid)
        carts = Cart.objects.filter(user=user).filter(computers=computers)

        if carts.exists():
            cart = carts.first()
            cart.number = request.GET.get('num')
            cart.save()
            info = {'info': '{}-修改购物车数量操作成功'.format(computers.title), 'status': 1, 'number': cart.number}
            return JsonResponse(info)
        else:
            cart = Cart()
            cart.user = user
            cart.computers = computers
            cart.number = request.GET.get('num')
            cart.save()
            info={'info':'{}-添加购物车操作成功'.format(computers.title),'status':1,'number':cart.number}
            return JsonResponse(info)
    else:
        return JsonResponse({'info':'请登录后操作','status':0})


def change(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    computersid = request.GET.get('computersid')
    computers = Computers.objects.get(id=computersid)
    cart = Cart.objects.filter(user=user).filter(computers=computers).first()
    cart.isselect = not cart.isselect
    cart.save()
    if cart.isselect == False:
        status = 0
    else:
        status = 1
    return JsonResponse({'status':status,'info':'取反成功'})


def allselect(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user_id=user.id)
    select = request.GET.get('select')
    for cart in carts:
        if select == 'true':
            cart.isselect = True
            cart.save()
            data = {
                'info':'全选成功',
                'status':1
            }
        else:
            cart.isselect = False
            cart.save()
            data = {
                'info':'反选成功',
                'status':0
            }
    return JsonResponse(data)