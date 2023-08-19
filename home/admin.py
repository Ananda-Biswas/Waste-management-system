from django.contrib import admin
from home.models import Admin,Driver,Member,Bin,Delivery,Complaint,Feedback
# Register your models here.
admin.site.register(Admin)
admin.site.register(Driver)
admin.site.register(Member)
admin.site.register(Bin)
admin.site.register(Delivery)
admin.site.register(Complaint)
admin.site.register(Feedback)