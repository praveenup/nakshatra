from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .forms import UserRegisterForm, CollegeForm, ShirtForm,  CodingCompetitionForm
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail
from django.core.mail import EmailMessage
from .models import Students, TShirt
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView
from django.contrib.staticfiles.templatetags.staticfiles import static
import os.path
# from django.conf import settings
# from django.core.files.storage import FileSystemStorage

def index(request):
    return render(request, 'users/index.html')

def index_test(request):
    return render(request, 'users/index_test.html')

# class CustomLoginView(LoginView):
#     authentication_form = CustomAuthenticationForm
#     template_name = 'users/login.html'

def register(request):
    if request.method == "POST":
        form_u = UserRegisterForm(request.POST)
        form_c = CollegeForm(request.POST)
        if form_u.is_valid() and form_c.is_valid():
            new_user = form_u.save()

            new_obj = form_c.save(commit=False)
            new_obj.user = new_user
            new_obj.save()

            new_obj1 = Students(college=new_obj, participant_name=request.POST['participant1'], gender=request.POST['gender1'])
            new_obj1.save()
            new_obj2 = Students(college=new_obj, participant_name=request.POST['participant2'], gender=request.POST['gender2'])
            new_obj2.save()
            new_obj3 = Students(college=new_obj, participant_name=request.POST['participant3'], gender=request.POST['gender3'])
            new_obj3.save()
            new_obj4 = Students(college=new_obj, participant_name=request.POST['participant4'], gender=request.POST['gender4'])
            new_obj4.save()
            new_obj5 = Students(college=new_obj, participant_name=request.POST['participant5'], gender=request.POST['gender5'])
            new_obj5.save()

            username = form_u.cleaned_data.get('username')
            messages.success(request, 'Account created for '+ username)
            email = request.POST['email']
            
            msg = EmailMessage('Registration Successful for Nakshastra 2k19 NITC', "<html><h3>You have successfully registered for <b>Nakshatra 2k19</b></h3><br><h4>User Name: " + request.POST['username'] + "</h4><br>Participant 1: " + request.POST['participant1'] + "<br>Participant 2: " + request.POST['participant2'] + "<br>Participant 3: " + request.POST['participant3'] + "<br>Participant 4: " + request.POST['participant4'] + "<br>Participant 5: " + request.POST['participant5'] + "<br> <h4>Please make sure that you get the documents attached below. Also make sure to go through the rules thoroughly before attending the fest.</h4><br><h4>Contact Us at info@nakshatra19.com</h4><br><h4>Coordinator - Harshit Garg : 7838146755 </h4><br><h4>PR - Rashi : 7902981382  </h4><br><h4>Shashidhar : 9177304519  </h4><br><h4>Nakshatra 2k19</h4>  </html>", 'info@nakshatra19.com',
            [email,'prakum.633@gmail.com'],)
            msg.content_subtype = "html"
            PROJECT_ROOT = os.path.abspath(os.path.dirname(__name__))
            print('path:' ,PROJECT_ROOT)
            msg.attach_file('/home/oceanknr/webapps/demo_django/myproject/pdfs/Confirmation_Mail.pdf')
            msg.attach_file('/home/oceanknr/webapps/demo_django/myproject/pdfs/rules.pdf')
            # msg.attach_file('pdfs/Confirmation_Mail.pdf')
            # msg.attach_file('pdfs/rules.pdf')
            

            msg.send()
            return redirect('login')
    else:
        form_u = UserRegisterForm()
        form_c = CollegeForm()
    return render(request, 'users/register.html', {'form_u': form_u, 'form_c': form_c})

@login_required
def profile(request):
    return render(request, 'users/profile.html')

def shirt(request):
    if request.method == "POST":
        form = ShirtForm(request.POST)
        if form.is_valid():
            form.save()
            roll_no = request.POST['roll_no']
            messages.success(request, 'T-Shirt Details successfully submitted for Roll No.: ' + roll_no)
        else:
            messages.warning(request, 'Your details already exists.')
    else:
        form = ShirtForm()
    return render(request, 'users/shirt.html', {'form': form})

def coding_competition(request):
    if request.method == "POST":
        form = CodingCompetitionForm(request.POST)
        if form.is_valid():
            form.save()
            name = request.POST['name']
            messages.success(request, 'Details successfully submitted for : ' + name)
            return render(request, 'users/redirect.html',)
    else:
        form = CodingCompetitionForm()
        
    return render(request, 'users/coding_competition.html', {'form': form})
