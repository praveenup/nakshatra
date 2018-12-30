from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .forms import UserRegisterForm, CollegeForm, ShirtForm,  CodingCompetitionForm
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail
from django.core.mail import EmailMessage
from .models import Students, Shirt
from django.contrib.auth.decorators import login_required
from django.contrib.staticfiles.templatetags.staticfiles import static
import os.path
# from django.conf import settings
# from django.core.files.storage import FileSystemStorage

def index(request):
    return render(request, 'users/index.html')

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
            
            msg = EmailMessage('Subject of the Email', '<h1>Body of the email</h1>', 'nakshatra2k19@gmail.com',
            [email,'praveenkprestige@gmail.com'],)
            msg.content_subtype = "html"
            PROJECT_ROOT = os.path.abspath(os.path.dirname(__name__))
            print('path:' ,PROJECT_ROOT)
            # msg.attach_file('/home/prakumup/prakumup.pythonanywhere.com/pdfs/confirmation_letter.pdf')
            msg.attach_file('pdfs/confirmation_letter.pdf')

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
