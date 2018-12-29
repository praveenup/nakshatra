from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Students, UserCollege, Shirt, PhotoRegistration, UserPhoto, CodingCompetition
import os
from django.core.exceptions import ValidationError

class PhotoRegistrationForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    class Meta:
        model=PhotoRegistration
        exclude = ['topic']

class UserPhotoForm(forms.ModelForm):
    class Meta:
        model = UserPhoto
        exclude = ['photo_reg']


class UserRegisterForm(UserCreationForm):
    email = forms.EmailField()

    class Meta:
        model = User
        email = forms.EmailField()
        fields = ['username', 'email', 'password1', 'password2']


    # def __init__(self, *args, **kwargs):
    #     super(UserRegisterForm, self).__init__(*args, **kwargs)
    #     self.fields['username'].label = "Team Name"
    # def __init__(self, *args, **kwargs):
    #     super(UserRegisterForm, self).__init__(*args, **kwargs)
    #     self.fields['first_name'].required = True 

class CollegeForm(forms.ModelForm):
    class Meta:
        model = UserCollege
        exclude = ['user']

class ShirtForm(forms.ModelForm):
    class Meta:
        model = Shirt
        fields = "__all__"


# class RegistrationPhotoForm(forms.ModelForm):
#     class Meta:
#         model = RegistrationPhoto
#         exclude = ['user','topic']

# class PhotoForm(forms.ModelForm):
#     class Meta:
#         model = Photo
#         exclude = ['photo_user']

class CodingCompetitionForm(forms.ModelForm):
    class Meta:
        model = CodingCompetition
        fields = "__all__"
    # def clean(self):
    #     file_path = "photography_pics/" + self.cleaned_data.get('file')
    #     if os.path.isfile(file_path):
    #         raise ValidationError('File already exists') 
    #     return self.cleaned_data


# class DocumentForm(forms.ModelForm):
#     class Meta:
#         model = Document
#         fields = ('description', 'document', )