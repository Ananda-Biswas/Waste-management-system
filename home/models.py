from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Admin(models.Model):
    username=models.CharField(max_length=122,unique=True,primary_key=True)
    password=models.CharField(max_length=8)

    def __str__(self):
        return self.username



class Member(models.Model):
    username = models.CharField(max_length=100,unique=True,primary_key=True)
    email = models.CharField(max_length=122,unique=True)
    phone = models.CharField(max_length=15,unique=True)
    password = models.CharField(max_length=128)
    confirm_password = models.CharField(max_length=128)
    def __str__(self):
        return self.username

class Driver(models.Model):
    username=models.CharField(max_length=122,unique=True,primary_key=True)
    email=models.EmailField(max_length=100,unique=True)
    nid=models.CharField(max_length=20,unique=True)
    phone=models.CharField(max_length=20,unique=True)
    password=models.CharField(max_length=8)
    def __str__(self):
        return self.username


        
class Bin(models.Model):
    area = models.CharField(max_length=500)
    locality = models.CharField(max_length=100)
    city = models.CharField(max_length=50)
    latitude = models.CharField(max_length=20,unique=True)
    longitude = models.CharField(max_length=20,unique=True)
    driver_details = models.ForeignKey(Driver, on_delete=models.CASCADE)
    admin_details = models.ForeignKey(Admin, on_delete=models.CASCADE,null=True,blank=True)
    load_type = models.CharField(max_length=20)
    cycle_period = models.CharField(max_length=20)


class Delivery(models.Model):
    driver = models.ForeignKey(Driver, on_delete=models.CASCADE)
    bin = models.ForeignKey(Bin, on_delete=models.CASCADE)
    delivery_date = models.DateField()
    plastic_collected = models.DecimalField(max_digits=5, decimal_places=2) 
    is_scheduled = models.BooleanField(default=False)
    schedule_delivery_date = models.DateField(null=True, blank=True)


class Complaint(models.Model):
    user = models.ForeignKey(Member, on_delete=models.CASCADE)
    area = models.CharField(max_length=500)
    locality = models.CharField(max_length=100)
    image = models.ImageField(upload_to='images/', blank=True, null=True)
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    bin = models.ForeignKey(Bin, on_delete=models.CASCADE,blank=True, null=True)
    STATUS_CHOICES = [('completed', 'Completed'),('not_completed', 'Not Completed'),]
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='not_completed')
    completed_at = models.DateTimeField(blank=True, null=True)
    rating = models.PositiveIntegerField(null=True, blank=True)

class Feedback(models.Model):
    user = models.ForeignKey(Member, on_delete=models.CASCADE)
    rating1 = models.PositiveIntegerField()
    rating2 = models.PositiveIntegerField()
    rating3 = models.PositiveIntegerField()
    feedback = models.TextField()
    submitted_at = models.DateTimeField(auto_now_add=True)

