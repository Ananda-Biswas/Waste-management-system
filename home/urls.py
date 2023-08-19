from django.contrib import admin
from django.urls import path
from home import views
from django.contrib.auth import views as auth_views


urlpatterns = [
    path("",views.index,name='home'),
    path("sign",views.sign,name='sign'),
    path("contact",views.contact,name='contact'),
    path("reset_password",views.reset_password,name='reset_password'),
    path("admin_login_view",views.admin_login_view,name='admin_login_view'),
    path("driver_login_view",views.driver_login_view,name='driver_login_view'),
    path("member_login_view", views.member_login_view, name='member_login_view'),
    path("base",views.base,name='base'),
    path("admin_dashboard", views.admin_dashboard, name='admin_dashboard'),
    path("create_bin",views.create_bin,name='create_bin'),
    path("register_driver",views.register_driver,name='register_driver'),
    path("view_bins",views.view_bins,name='view_bins'),
    path("view_drivers",views.view_drivers,name='view_drivers'),
    path("update_bin",views.update_bin,name='update_bin'),
    path("delete_bin/<bin_id>",views.delete_bin,name='delete_bin'),
    path("logout_view",views.logout_view,name='logout_view'),
    path("driver_dashboard", views.driver_dashboard, name='driver_dashboard'),
    path("view_bins_driver",views.view_bins_driver,name='view_bins_driver'),
    path("view_driver_profile",views.view_driver_profile,name='view_driver_profile'),
    path("record_delivery",views.record_delivery,name='record_delivery'),
    path("update_driver",views.update_driver,name='update_driver'),
    path("view_delivery",views.view_delivery,name='view_delivery'),
    path("user_dashboard", views.user_dashboard, name='user_dashboard'),
    path('submit_complaint', views.submit_complaint, name='submit_complaint'),
    path('view_complaints', views.view_complaints, name='view_complaints'),
    path("view_user_profile",views.view_user_profile,name='view_user_profile'),
    path("update_member",views.update_member,name='update_member'),
    path('view_user_complaints', views.view_user_complaints, name='view_user_complaints'),
    path("view_complaints_driver",views.view_complaints_driver,name='view_complaints_driver'),
    path('update_complaint/<complaint_id>', views.update_complaint, name='update_complaint'),
    path('delete_complaint/<complaint_id>', views.delete_complaint, name='delete_complaint'),
    path('submit_feedback', views.submit_feedback, name='submit_feedback'),
    path('view_feedback', views.view_feedback, name='view_feedback'),
    path('search', views.search, name='search'),
    path('driver_rating/<complaint_id>', views.driver_rating, name='driver_rating'),
    path("delete_driver/<driver_username>",views.delete_driver,name='delete_driver'),
    
]