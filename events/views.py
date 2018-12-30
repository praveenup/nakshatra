from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .forms import  UserPhotoForm, PhotoRegistrationForm
from django.core.mail import EmailMessage
from .models import PhotoRegistration, UserPhoto
from django.contrib.auth.decorators import login_required
from django.contrib.staticfiles.templatetags.staticfiles import static
import os.path
import random

def photo_register(request):
    if request.method == "POST":
        form = PhotoRegistrationForm(request.POST)
        if form.is_valid():
            
            topics = ['topic1','topic2','topic3','topic4','topic5']
            photo_topic = topics[random.randint(0,len(topics)-1)]
                        
            user_detail = form.save(commit=False)
            user_detail.topic = photo_topic
            user_detail.save() 
            messages.success(request, 'Successfully registered')
            email = request.POST['email']
            email_body = "<html><h3>You have successfully registered</h3><br>Name:" + request.POST['student_name'] + "<br>Password: " + request.POST['password'] + "<br><h2>Your Topic : " + photo_topic + "</h2>" + "</html>"
            msg = EmailMessage('Subject of the Email', email_body , 'nakshatra2k19@gmail.com',
            [email,'praveenkprestige@gmail.com'],)
            msg.content_subtype = "html"
            # msg.attach_file('/home/prakumup/prakumup.pythonanywhere.com/pdfs/confirmation_letter.pdf')
            msg.attach_file('/home/prakumup/prakumup.pythonanywhere.com/pdfs/confirmation_letter.pdf')

            msg.send()
            return render(request, 'events/photo_login.html',)
    else:
        form = PhotoRegistrationForm()
    return render(request, 'events/photo_register.html', {'form': form})

def photo_login(request):
    if request.method == "POST":
        email = request.POST['email']
        password = request.POST['password']
        try:
            photo_user = PhotoRegistration.objects.get(email=email,password=password)
        except PhotoRegistration.DoesNotExist:   
            messages.success(request, 'Email and Password does not matched ')
            return render(request, 'events/photo_login.html',)
        messages.success(request, 'Login Success ' + email)
        request.session['photo_user'] = photo_user.email
        return redirect('upload_photo')
    return render(request, 'events/photo_login.html')

def upload_photo(request):
    if request.session.get('photo_user',None) :
        photo_user = PhotoRegistration.objects.get(email=request.session['photo_user'])
        try:
            photo = UserPhoto.objects.get(photo_reg = photo_user)
        except UserPhoto.DoesNotExist:
            if request.method == "POST":
                form = UserPhotoForm(request.POST, request.FILES)
                photo_user = PhotoRegistration.objects.get(email=request.session['photo_user'])
                try:
                    photo = UserPhoto.objects.get(photo_reg = photo_user)
                except UserPhoto.DoesNotExist:
                    if form.is_valid():
                        user = form.save(commit=False)
                        user.photo_reg = PhotoRegistration.objects.get(email=request.session['photo_user'])
                        
                        try:
                            user.save()
                        except:
                            messages.success(request, 'Already Uploaded')
                            return render(request, 'events/upload_photo.html',) 
                        email = request.session['photo_user']
                        msg = EmailMessage('Subject of the Email', '<h1>Photo Body of the email</h1>', 'nakshatra2k19@gmail.com',
                        [email,'praveenkprestige@gmail.com'],)
                        msg.content_subtype = "html"
                        # msg.attach_file('/home/prakumup/prakumup.pythonanywhere.com/pdfs/confirmation_letter.pdf')
                        msg.attach_file('/home/prakumup/prakumup.pythonanywhere.com/media/' + user.image.name)
                        # msg.attach_file('media/' + user.image.name)
                        msg.send()
                        messages.success(request, 'Successfully saved photo ')
                        flag=False
                        return render(request, 'events/upload_photo.html',{'flag':flag})
                else:
                    messages.success(request, 'Already Added ')
                    return render(request, 'events/upload_photo.html',)
            else:
                form = UserPhotoForm()
                flag=True
            topic = photo_user.topic
            print(topic)
            return render(request, 'events/upload_photo.html', {'form':form, 'flag':flag, 'topic': topic })
        else:
            messages.success(request, 'Already added ')
            return render(request, 'events/upload_photo.html')
    else:
        return redirect('photo_login')

def photo_logout(request):
    del request.session['photo_user']
    return redirect('index')