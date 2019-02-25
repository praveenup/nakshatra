from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .forms import  UserPhotoForm, PhotoRegistrationForm
from django.core.mail import EmailMessage
from .models import PhotoRegistration, UserPhoto
from users.models import College
from django.contrib.auth.decorators import login_required
from django.contrib.staticfiles.templatetags.staticfiles import static
import os.path
import random

def photo_register(request):
    return render(request, 'events/rules.html')

def photo_register(request):
    if request.method == "POST":
        form = PhotoRegistrationForm(request.POST)
        if form.is_valid():

            topics = ['Chiaroscuro','Cliched','Musings','Psychedelia','Disappearance','Synchronous','Equilibrium']
            photo_topic = topics[random.randint(0,len(topics)-1)]

            user_detail = form.save(commit=False)
            user_detail.topic = photo_topic
            user_detail.save()
            messages.success(request, 'Successfully registered')
            email = request.POST['email']
            college_name = College.objects.get(pk=request.POST['college'])
            print(college_name)
            email_body = "<html><h3>You have successfully registered</h3><h3>Upload your photo by login <a href='https://www.nakshatra19.com/events/photo_login'>here</a></h3> <br><h2>Your Topic : " + photo_topic + "</h2>" + "<br>College Name: " + str(college_name) + "<br>Email: " + request.POST['email'] + "<br>Name: " + request.POST['student_name'] + "<br>Password: " + request.POST['password'] +  "<br> <h4>Please find attachment of rules below. Also make sure to go through the rules thoroughly before uploading a image.</h4><br><h4>Contact Us at info@nakshatra19.com</h4><h4>Coordinator -<br> Harshit Garg : 7838146755 </h4><h4>PR - <br> Rashi : 7902981382  </h4><h4>Shashidhar : 9177304519  </h4><h4>Nakshatra 2k19</h4></html>"
            msg = EmailMessage('Fotographie: Nakshatra 2k19', email_body , 'info@nakshatra19.com',
            [email],['rashigupta2011@gmail.com','praveenkprestige@gmail.com'])
            msg.content_subtype = "html"
            msg.attach_file('/home/oceanknr/webapps/demo_django/myproject/pdfs/fotographie_rules.pdf')
            # msg.attach_file('pdfs/Confirmation_Mail.pdf')
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
            messages.warning(request, 'Please enter the correct email and password.')
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
                        college_name = College.objects.get(pk=photo_user.college.id)
                        print(college_name)
                        msg = EmailMessage('Fotographie: Nakshatra 2k19', "<h1>Your photo successfully uploaded.</h1><br>College Name: " + str(college_name) + "<br>Student Name: " + photo_user.student_name + "<br>Contact No: " + str(photo_user.contact_no)   + "<br>Topic:" + photo_user.topic + "<br>Description:<p>" + request.POST['description'] + "</p><br> <h4>Contact Us at info@nakshatra19.com</h4><h4>Coordinator - <br>Harshit Garg : 7838146755 </h4><h4>PR - <br> Rashi : 7902981382  </h4><h4>Shashidhar : 9177304519  </h4><h4>Nakshatra 2k19</h4>  </html>", 'info@nakshatra19.com',
                        [email],['rashigupta2011@gmail.com','praveenkprestige@gmail.com'])
                        msg.content_subtype = "html"
                        msg.attach_file('/home/oceanknr/webapps/static_media/media/' + user.image.name)
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