from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Students, UserCollege

class UserRegisterForm(UserCreationForm):
    email = forms.EmailField()

    class Meta:
        model = User
        email = forms.EmailField()
        fields = ['username', 'email', 'first_name', 'last_name','password1', 'password2']

    def __init__(self, *args, **kwargs):
        super(UserRegisterForm, self).__init__(*args, **kwargs)
        self.fields['first_name'].required = True 

class CollegeForm(forms.ModelForm):
    class Meta:
        model = UserCollege
        exclude = ['user']
