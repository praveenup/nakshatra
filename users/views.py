from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .forms import UserRegisterForm, CollegeForm, ShirtForm,  CodingCompetitionForm, UserPhotoForm, PhotoRegistrationForm
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail
from django.core.mail import EmailMessage
from .models import Students, Shirt, PhotoRegistration, UserPhoto
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

def photo_register(request):
    if request.method == "POST":
        form = PhotoRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Successfully registered')
            email = request.POST['email']
            
            msg = EmailMessage('Subject of the Email', '<h1>Body of the email</h1>', 'nakshatra2k19@gmail.com',
            [email,'praveenkprestige@gmail.com'],)
            msg.content_subtype = "html"
            # msg.attach_file('/home/prakumup/prakumup.pythonanywhere.com/pdfs/confirmation_letter.pdf')
            msg.attach_file('pdfs/confirmation_letter.pdf')

            msg.send()
            return render(request, 'users/photo_login.html',)
    else:
        form = PhotoRegistrationForm()
    return render(request, 'users/photo_register.html', {'form': form})

def photo_login(request):
    if request.method == "POST":
        email = request.POST['email']
        password = request.POST['password']
        try:
            photo_user = PhotoRegistration.objects.get(email=email,password=password)
        except PhotoRegistration.DoesNotExist:   
            messages.success(request, 'Email and Password does not matched ')
            return render(request, 'users/photo_login.html',)
        messages.success(request, 'Login Success ' + email)
        request.session['photo_user'] = photo_user.email
        return redirect('upload_photo')
    return render(request, 'users/photo_login.html')

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
                            return render(request, 'users/upload_photo.html',) 
                        email = request.session['photo_user']
                        msg = EmailMessage('Subject of the Email', '<h1>Photo Body of the email</h1>', 'nakshatra2k19@gmail.com',
                        [email,'praveenkprestige@gmail.com'],)
                        msg.content_subtype = "html"
                        # msg.attach_file('/home/prakumup/prakumup.pythonanywhere.com/pdfs/confirmation_letter.pdf')
                        msg.attach_file('media/' + user.image.name)
                        msg.send()
                        messages.success(request, 'Successfully saved photo ')
                        flag=False
                        return render(request, 'users/upload_photo.html',{'flag':flag})
                else:
                    messages.success(request, 'Already Added ')
                    return render(request, 'users/upload_photo.html',)
            else:
                form = UserPhotoForm()
                flag=True
            return render(request, 'users/upload_photo.html', {'form':form, 'flag':flag})
        else:
            messages.success(request, 'Already added ')
            return render(request, 'users/upload_photo.html')
    else:
        return redirect('photo_login')

def photo_logout(request):
    del request.session['photo_user']
    return redirect('index')
# def upload_photo(request):
#     photo = RegistrationPhoto.objects.filter(user=request.user).first()
#     try:
#         photo_obj = Photo.objects.get(photo_user=photo)
#     except Photo.DoesNotExist:
#         if request.method == "POST":
#             form = PhotoForm(request.POST,request.FILES)
#             if form.is_valid():
#                 photo1 = form.save(commit=False)
#                 photo1.photo_user = photo
#                 photo1.save()

#                 email = request.user.email
#                 print(email)
#                 msg = EmailMessage('Subject of the Email', '<h1>Photo Body of the email</h1>', 'nakshatra2k19@gmail.com',
#                 [email],)
#                 msg.content_subtype = "html"
#                 PROJECT_ROOT = os.path.abspath(os.path.dirname(__name__))
#                 print('path:' ,PROJECT_ROOT)
#                 # msg.attach_file('/home/prakumup/prakumup.pythonanywhere.com/pdfs/confirmation_letter.pdf')
#                 msg.attach_file('media/' + photo1.image.name)

#                 msg.send()
#                 messages.success(request, 'Photo Added ')
#         else:
#             form = PhotoForm()
#         added=False
#         return render(request, 'users/upload_photo.html', {'form': form,'added':added})
#     else:
#         messages.success(request, 'Already added ')
#         added=True
#         return render(request, 'users/upload_photo.html',{'added':added})













# def model_form_upload(request):
#     if request.method == 'POST':
#         form = DocumentForm(request.POST, request.FILES, instance=request.user)
#         if form.is_valid():
#             form.save()
#             return redirect('index')
#     else:
#         form = DocumentForm()
#     return render(request, 'users/model_form_upload.html', {
#         'form': form
#     })