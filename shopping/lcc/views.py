import random
import re

from django.shortcuts import render,redirect
from django.http import HttpResponse,HttpRequest

from lcc.models import User


def index(request):
    return render(request,'index.html')


def generate_token():
    pass


def register(request):
    if request.method == 'GET':
        return render(request,'register.html')
    elif request.method == 'POST':

        user = User()
        user.phone = request.POST.get('phone')
        result = re.match(r"[1][3-9]\d{9}", user.phone)
        if result == None:
            abc = 'true'
        else:
            abc = 'false'
        #user.password2 = request.POST.get('password2')
        #user.code = random.randint(100000,1000000)
        #user.token = generate_token()
        #response = redirect('lcc:index')
        return render(request,'register.html',{'abc':abc})
