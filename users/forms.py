from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, UsernameField
from django.contrib.auth.models import User
from .models import Students, UserCollege, TShirt, CodingCompetition


# class CustomAuthenticationForm(AuthenticationForm):
#     username = UsernameField(
#         label = 'Team Name',
#         widget = forms.TextInput(attrs={'autofocus':True})
#     )

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
        model = TShirt
        fields = "__all__"


class CodingCompetitionForm(forms.ModelForm):
    class Meta:
        model = CodingCompetition
        fields = "__all__"
