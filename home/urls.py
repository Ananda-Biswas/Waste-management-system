from django.contrib import admin
from django.urls import path
from home import views

urlpatterns = [
    path("",views.index,name='home'),
    path("sign",views.sign,name='sign'),
    path("contact",views.contact,name='contact'),
    path("submit",views.submit,name='submit'),
    path("login_view",views.login_view,name='login_view'),
    
]