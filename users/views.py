from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import UserRegisterForm, CollegeForm
from django.contrib.auth.decorators import login_required
from .models import Students

def register(request):
    if request.method == "POST":
        form_u = UserRegisterForm(request.POST)
        form_c = CollegeForm(request.POST)
        if form_u.is_valid() and form_c.is_valid():
            new_user = form_u.save()

            new_obj = form_c.save(commit=False)
            new_obj.user = new_user
            new_college = new_obj.save()

            new_obj1 = Students(college=new_obj, participant_name=request.POST['participant1'])
            new_obj1.save()
            new_obj2 = Students(college=new_obj, participant_name=request.POST['participant2'])
            new_obj2.save()
            new_obj3 = Students(college=new_obj, participant_name=request.POST['participant3'])
            new_obj3.save()
            new_obj4 = Students(college=new_obj, participant_name=request.POST['participant4'])
            new_obj4.save()
            new_obj5 = Students(college=new_obj, participant_name=request.POST['participant5'])
            new_obj5.save()

            username = form_u.cleaned_data.get('username')
            messages.success(request, f'Account created for {username}!')
            return redirect('login')
    else:
        form_u = UserRegisterForm()
        form_c = CollegeForm()
    return render(request, 'users/register.html', {'form_u': form_u, 'form_c': form_c})

def profile(request):
    return render(request, 'users/profile.html')