from django import forms
from .models import Pubg


class PubgForm(forms.ModelForm):
    class Meta:
        model = Pubg
        fields = "__all__"
