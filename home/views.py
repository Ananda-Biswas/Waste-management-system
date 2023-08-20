from django.shortcuts import render, HttpResponse, redirect
from django.contrib import messages
from home.models import Admin,Driver,Member,Bin,Delivery,Complaint,Feedback
from django.contrib.auth.models import User
from django.contrib.auth import logout
from django.utils import timezone
from datetime import datetime, timedelta



# Create your views here.
def index(request):
    return render(request,'index.html')

def sign(request):
    return render (request,'sign_in.html')



def admin_dashboard(request):
    return render(request,'admin_dashboard.html')

def driver_dashboard(request):
    return render(request,'driver_dashboard.html')

def user_dashboard(request):
    return render(request,'user_dashboard.html')

def base(request):
    return render(request,'base.html')


def contact(request):
    if request.method =="POST":
        username=request.POST.get('username')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        password=request.POST.get('password')
        confirm_password=request.POST.get('confirm_password')
        if password != confirm_password:
            error_message = "Passwords do not match. Please try again."
            return HttpResponse(error_message)
        else:
            contact = Member(username=username, email=email, phone=phone, password=password, confirm_password=confirm_password)
            contact.save()
    return render (request,"sign_in.html")


def reset_password(request):
    if request.method == "POST":
        username = request.POST.get('username')
        new_password = request.POST.get('password') 
        try:
            member = Member.objects.get(username=username)
            member.password = new_password
            member.confirm_password = new_password
            member.save()
            return HttpResponse("Password reset successful.")
        except Member.DoesNotExist:
            return HttpResponse("Invalid username. Please try again.")
    else:
        return HttpResponse("Password reset form goes here.")


def admin_login_view(request):
    if request.method == "POST":
        username= request.POST.get("username")
        password = request.POST.get("password")
        try:
            admin = Admin.objects.get(username=username, password=password)
        except Admin.DoesNotExist:
            error_message = "Invalid email or password. Please try again."
            return HttpResponse(error_message)
        request.session['admin_username'] = admin.username
        return redirect("/admin_dashboard")




def member_login_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        try:
            member = Member.objects.get(username=username, password=password)
        except Member.DoesNotExist:
            error_message = "Invalid username or password. Please try again."
            return HttpResponse(error_message)
        request.session['member_username'] = member.username
        return redirect("/user_dashboard") 



def logout_view(request):
    logout(request)
    return redirect('/sign')  # Replace 'login' with the URL name of your login page



def create_bin(request):
    if request.method =='POST':
        area=request.POST.get("area")
        locality=request.POST.get("locality")
        city=request.POST.get("city")
        admin_username = request.session.get('admin_username')
        latitude=request.POST.get("latitude")
        longitude=request.POST.get("longitude")
        driver_details_id=request.POST.get("driver_details_id")
        load_type=request.POST.get("load_type")
        cycle_period=request.POST.get("cycle_period")
        try:
            driver = Driver.objects.get(username=driver_details_id)
            create_bin=Bin(area=area,locality=locality,city=city,admin_details_id=admin_username,latitude=latitude,longitude=longitude,driver_details_id=driver_details_id,load_type=load_type,cycle_period=cycle_period)
            create_bin.save()
            return redirect ('/admin_dashboard')
        except Bin.DoesNotExist:
            return HttpResponse("Invalid bin. Please try again.")
    return redirect("/admin_dashboard")


def view_bins(request):
    bins = Bin.objects.all()
    return render(request, 'admin_dashboard.html', {'bins': bins})


def delete_bin(request, bin_id):
    if request.method == 'POST':
        bin = Bin.objects.get(id=bin_id)
        bin.delete()
        return redirect('/view_bins')

def register_driver(request):
    if request.method =="POST":
        username=request.POST.get('username')
        email=request.POST.get('email')
        nid=request.POST.get('nid')
        phone=request.POST.get('phone')
        password=request.POST.get('password')
        register_driver = Driver(username=username,email=email, nid=nid, phone=phone, password=password)
        register_driver.save()
    return redirect ('/admin_dashboard')




def view_drivers(request):
    drivers=Driver.objects.all()
    return render(request,'admin_dashboard.html', {'drivers': drivers})





def driver_login_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        try:
            driver = Driver.objects.get(username=username, password=password)
        except Driver.DoesNotExist:
            error_message = "Invalid username or password. Please try again."
            return HttpResponse(error_message)
        request.session['driver_username'] = driver.username
        return redirect("/driver_dashboard")




def update_bin(request):
    if request.method=="POST":
        bin_id = request.POST.get("selected_bin")
        bins = Bin.objects.get(id=bin_id)
        area=request.POST.get("area")
        locality=request.POST.get("locality")
        latitude=request.POST.get("latitude")
        longitude=request.POST.get("longitude")
        driver_details_id=request.POST.get("driver_details_id")
        load_type=request.POST.get("load_type")
        cycle_period=request.POST.get("cycle_period")
        bins.area=area
        bins.locality=locality
        bins.latitude=latitude
        bins.longitude=longitude
        bins.driver_details_id=driver_details_id
        bins.load_type=load_type
        bins.cycle_period=cycle_period
        bins.save()
        return redirect ('/view_bins')
       

def view_bins_driver(request):
    driver_username = request.session.get('driver_username')
    bins = Bin.objects.filter(driver_details_id=driver_username)
    return render(request, 'driver_dashboard.html', {'bins': bins})



def view_driver_profile(request):
    driver_username = request.session.get('driver_username')
    drivers = Driver.objects.filter(username=driver_username)
    
    return render(request, 'driver_dashboard.html', { 'drivers': drivers})




def record_delivery(request):
    if request.method == 'POST':
        driver_id = request.session.get('driver_username')
        bin_id = request.POST.get('bin_id')
        delivery_date_str = request.POST.get('delivery_date')
        delivery_date = datetime.strptime(delivery_date_str, '%Y-%m-%d')
        plastics_collected = int(request.POST.get('plastics_collected'))  # Assuming this field is added in the form
    
        # Get the last recorded delivery for the driver and bin
        last_delivery = Delivery.objects.filter(driver_id=driver_id, bin_id=bin_id).order_by('-delivery_date').first()
        
        if last_delivery:
            accumulated_plastics = last_delivery.plastic_collected + plastics_collected
        else:
            accumulated_plastics = plastics_collected
        
        is_scheduled = False
        scheduled_delivery_date = None
        
        if accumulated_plastics >= 25:
            is_scheduled = True
            scheduled_delivery_date = delivery_date.date() + timedelta(days=2)
            accumulated_plastics = 0  # Reset accumulated plastics
            
        delivery = Delivery(bin_id=bin_id, driver_id=driver_id, delivery_date=delivery_date, plastic_collected=accumulated_plastics, is_scheduled=is_scheduled, schedule_delivery_date=scheduled_delivery_date)
        delivery.save()
        
        return redirect('/driver_dashboard')



def update_driver(request):
    driver_username=request.session.get("driver_username")
    if request.method == "POST":
        new_email = request.POST.get('email')
        new_phone= request.POST.get('phone') 
        new_password = request.POST.get('password') 
        try:
            driver = Driver.objects.get(username=driver_username)
            driver.email=new_email
            driver.phone=new_phone
            driver.password = new_password
            driver.save()
            return redirect("/sign")
        except Driver.DoesNotExist:
            return HttpResponse("Invalid username. Please try again.")


def view_delivery(request):
    driver_username = request.session.get('driver_username')
    deliveries = Delivery.objects.filter(driver_id=driver_username)
    return render(request, 'driver_dashboard.html', {'deliveries': deliveries})




def submit_complaint(request):
    member_username = request.session.get('member_username')
    if request.method == 'POST':
        area = request.POST.get("area")
        locality = request.POST.get("locality")
        image_file = request.FILES.get('image')
        description = request.POST.get("description")
        
        # Get the bin associated with the given area and locality
        try:
            bin = Bin.objects.get(area=area, locality=locality)
            bin_id = bin.id
        except Bin.DoesNotExist:
            bin_id = None

        # Create a new complaint instance and save it
        complaint = Complaint(user_id=member_username, area=area, locality=locality, image=image_file, description=description, bin_id=bin_id)
        complaint.save()

        return redirect('/user_dashboard')


def view_complaints(request):
    complaints = Complaint.objects.all
    return render(request, 'user_dashboard.html', {'complaints': complaints})


def view_user_profile(request):
    member_username = request.session.get('member_username')
    members = Member.objects.filter(username=member_username)
    
    return render(request, 'user_dashboard.html', { 'members': members})


def update_member(request):
    member_username=request.session.get("member_username")
    if request.method == "POST":
        new_email = request.POST.get('email')
        new_phone= request.POST.get('phone') 
        new_password = request.POST.get('password') 
        try:
            member = Member.objects.get(username=member_username)
            member.email=new_email
            member.phone=new_phone
            member.password = new_password
            member.save()
            return redirect("/sign")
        except Member.DoesNotExist:
            return HttpResponse("Invalid username. Please try again.")

def view_user_complaints(request):
    complaints = Complaint.objects.all
    print(complaints)
    return render(request, 'admin_dashboard.html', {'complaints': complaints})
    
def view_complaints_driver(request):
    driver_username = request.session.get('driver_username')
    bins = Bin.objects.filter(driver_details=driver_username)
    bin_ids = bins.values_list('id', flat=True)  # Extract bin IDs
    complaints = Complaint.objects.filter(bin_id__in=bin_ids)
    return render(request, 'driver_dashboard.html', {'complaints': complaints})


def update_complaint(request, complaint_id):
    if request.method == 'POST':
        complaint = Complaint.objects.get(id=complaint_id)
        complaint.status='Completed'
        complaint.completed_at=timezone.now()
        complaint.save()
        return redirect('/driver_dashboard')

def delete_complaint(request, complaint_id):
    if request.method == 'POST':
        complaint = Complaint.objects.get(id=complaint_id)
        complaint.delete()
        return redirect('/admin_dashboard')



def submit_feedback(request):
    member_username = request.session.get('member_username')
    if request.method == 'POST':
        rating1 = request.POST.get('rating1')
        rating2 = request.POST.get('rating2')
        rating3 = request.POST.get('rating3')
        feedback_text = request.POST.get('feedback')
        feedback = Feedback(user_id=member_username,rating1=rating1,rating2=rating2,rating3=rating3,feedback=feedback_text)
        feedback.save()
        return HttpResponse('Thank you for using our website')


def view_feedback(request):
    feedbacks=Feedback.objects.all()
    return render(request,'admin_dashboard.html', {'feedbacks': feedbacks})



def search(request):
    if request.method == 'POST':
        search = request.POST.get("search")
        try:
            complaints = Complaint.objects.filter(user_id=search)
            return render(request, 'complaint.html', {'complaints': complaints})
        except Complaint.DoesNotExist:
            return HttpResponse("Complaints do not exist")
    return redirect("/search")



def driver_rating(request, complaint_id):
    if request.method == 'POST':
        member_username = request.session.get('member_username')
        rating=request.POST.get('rating')
        try:
            complaint = Complaint.objects.get(id=complaint_id,user_id=member_username)
            complaint.rating=rating
            complaint.save()
        except Complaint.DoesNotExist:
            return HttpResponse("Give rating of own complaints.")
        
        return redirect('/user_dashboard')


def delete_driver(request, driver_username):
    if request.method == 'POST':
        driver = Driver.objects.get(username=driver_username)
        driver.delete()
        return redirect('/view_drivers')