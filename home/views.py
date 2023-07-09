from django.shortcuts import render, HttpResponse, redirect
from datetime import datetime
from home.models import Contact
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login

# Create your views here.
def index(request):
    return render(request,'index.html')

def sign(request):
    return render (request,'sign_in.html')

def submit(request):
    return HttpResponse("This is about page")

def contact(request):
    if request.method =="POST":
        username=request.POST.get('username')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        password=request.POST.get('password')
        confirm_password=request.POST.get('confirm_password')
        contact=Contact(name=name,email=email,phone=phone,password=password,confirm_password=confirm_password)
        contact.save()
    return render (request,"sign_in.html")


def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username,password)
        
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('submit')
        else:
            return redirect('sign')
    
    return render(request, 'sign')

