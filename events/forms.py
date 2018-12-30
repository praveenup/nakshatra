from django import forms
from .models import PhotoRegistration, UserPhoto

class PhotoRegistrationForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    class Meta:
        model=PhotoRegistration
        exclude = ['topic']

class UserPhotoForm(forms.ModelForm):
    class Meta:
        model = UserPhoto
        exclude = ['photo_reg']